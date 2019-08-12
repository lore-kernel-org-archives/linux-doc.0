Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 648DB7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Aug 2019 16:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfHLQHA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Aug 2019 12:07:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:14128 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbfHLQHA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Aug 2019 12:07:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 09:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; 
   d="scan'208";a="175932480"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2019 09:06:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 47F5A11C; Mon, 12 Aug 2019 19:06:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] kernel-doc: Allow anonymous enum
Date:   Mon, 12 Aug 2019 19:06:31 +0300
Message-Id: <20190812160631.32844-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In C is a valid construction to have an anonymous enumerator.

Though we have now:

  drivers/pinctrl/intel/pinctrl-intel.c:240: error: Cannot parse enum!

Support it in the kernel-doc script.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 6b03012750da..079502bcc5a3 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1245,7 +1245,7 @@ sub dump_enum($$) {
     # strip #define macros inside enums
     $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
 
-    if ($x =~ /enum\s+(\w+)\s*\{(.*)\}/) {
+    if ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
 	$declaration_name = $1;
 	my $members = $2;
 	my %_members;
-- 
2.20.1

