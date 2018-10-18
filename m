Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 155197D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Oct 2018 20:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbeJSEiJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 00:38:09 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:33293 "EHLO
        8.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725751AbeJSEiJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Oct 2018 00:38:09 -0400
X-Greylist: delayed 15062 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Oct 2018 00:38:08 EDT
Received: from player159.ha.ovh.net (unknown [10.109.146.50])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id CE45AE445A
        for <linux-doc@vger.kernel.org>; Thu, 18 Oct 2018 17:47:52 +0200 (CEST)
Received: from noctali.online.net (poussif.eu [62.210.101.71])
        (Authenticated sender: guillaume@dore-net.fr)
        by player159.ha.ovh.net (Postfix) with ESMTPSA id 73391480098;
        Thu, 18 Oct 2018 17:47:47 +0200 (CEST)
From:   corwin@poussif.eu
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Dominik Brodowski <linux@dominikbrodowski.net>,
        Ingo Molnar <mingo@kernel.org>, linux-doc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>,
        Guillaume Dore <corwin@poussif.eu>
Subject: [PATCH] doc: fix a typo in adding-syscalls.rst
Date:   Thu, 18 Oct 2018 17:47:50 +0200
Message-Id: <20181018154750.32584-1-corwin@poussif.eu>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12333107581751198597
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrfeeggdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Guillaume Dore <corwin@poussif.eu>

There was a typo in adding-syscalls.rst that could mislead developers
to add a C filename in a makefile instead of an object filename.
This error, while not keeping developers from contributing could slow
the development process down by introducing build errors.

Signed-off-by: Guillaume Dore <corwin@poussif.eu>
---
 Documentation/process/adding-syscalls.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index 0d4f29bc798b..88a7d5c8bb2f 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -232,7 +232,7 @@ normally be optional, so add a ``CONFIG`` option (typically to
    by the option.
  - Make the option depend on EXPERT if it should be hidden from normal users.
  - Make any new source files implementing the function dependent on the CONFIG
-   option in the Makefile (e.g. ``obj-$(CONFIG_XYZZY_SYSCALL) += xyzzy.c``).
+   option in the Makefile (e.g. ``obj-$(CONFIG_XYZZY_SYSCALL) += xyzzy.o``).
  - Double check that the kernel still builds with the new CONFIG option turned
    off.
 
-- 
2.19.1

