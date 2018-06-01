Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E0B87DF8B
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 09:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751585AbeFAJ3W (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 05:29:22 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:53168 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751702AbeFAJ3K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 05:29:10 -0400
Received: from ayla.of.borg ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id tMUt1x00s3XaVaC01MUtwt; Fri, 01 Jun 2018 11:29:09 +0200
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1fOgMf-0007a9-Nd; Fri, 01 Jun 2018 11:28:53 +0200
Received: from geert by ramsan with local (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1fOgMf-0003Be-Lg; Fri, 01 Jun 2018 11:28:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Petr Mladek <pmladek@suse.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] lib/vsprintf: Remove atomic-unsafe support for %pCr
Date:   Fri,  1 Jun 2018 11:28:22 +0200
Message-Id: <1527845302-12159-5-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527845302-12159-1-git-send-email-geert+renesas@glider.be>
References: <1527845302-12159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"%pCr" formats the current rate of a clock, and calls clk_get_rate().
The latter obtains a mutex, hence it must not be called from atomic
context.

Remove support for this rarely-used format, as vsprintf() (and e.g.
printk()) must be callable from any context.

Any remaining out-of-tree users will start seeing the clock's name
printed instead of its rate.

Reported-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Fixes: 900cca2944254edd ("lib/vsprintf: add %pC{,n,r} format specifiers for clocks")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/core-api/printk-formats.rst | 3 +--
 lib/vsprintf.c                            | 3 ---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index eb30efdd2e789616..25dc591cb1108790 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -419,11 +419,10 @@ struct clk
 
 	%pC	pll1
 	%pCn	pll1
-	%pCr	1560000000
 
 For printing struct clk structures. %pC and %pCn print the name
 (Common Clock Framework) or address (legacy clock framework) of the
-structure; %pCr prints the current clock rate.
+structure.
 
 Passed by reference.
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 247a7e0bf24f6f74..a48aaa79d352313a 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1469,9 +1469,6 @@ char *clock(char *buf, char *end, struct clk *clk, struct printf_spec spec,
 		return string(buf, end, NULL, spec);
 
 	switch (fmt[1]) {
-	case 'r':
-		return number(buf, end, clk_get_rate(clk), spec);
-
 	case 'n':
 	default:
 #ifdef CONFIG_COMMON_CLK
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
