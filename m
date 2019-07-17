Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 161647D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 12:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfGQM20 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 08:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53868 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfGQM2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2+k4mra1MFTOtyawpxcac8T2m64SzRcv+xkOwR1APCU=; b=NeQutpvVOIujHhlrVmsmpyWZ9a
        ipS/ZbXXNWfAwXlG/Lo9RdZOP+K2kJi/NmhtlcWFxB/PTol2nHCjHqB05dU6JXRcspTpXtc3nd4Ac
        48+KDY9Whpw7tLbbK1FHPG4F5XqYe6rAIzrni96eb2MsBcfr4mNqJ57ES/SAX6p01N1VasGQCw9td
        WkQ6vo3+HbDYDl0Z6ngIi+VQEoJ3Yq0+qcv4Qc/9y9VeSrRogiep1PVkh2tfYrfk3Wjq0DI3Rv0Y7
        XZer4uQRQkPZ2DCNfc+Vp4wnpJNRpjWNLmoZkmTo6HpMh23tYpeiPG3D7ZvYH1lkgdE/YbQZFygZh
        6XXZqttw==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2n-0006fh-33; Wed, 17 Jul 2019 12:28:25 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2k-00052O-0W; Wed, 17 Jul 2019 09:28:22 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 08/15] docs: kernel_abi.py: allow passing ABI files in a transparent way
Date:   Wed, 17 Jul 2019 09:28:12 -0300
Message-Id: <c4bd23436b7bfe6fe60154423ea6424bde9fae64.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As get-abi.pl supports an ABI file that it is ReST compliant,
add an option to kernel-abi.py to allow using the transparent
mode of the tool.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 615b3773bb62..30cac84e18f5 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -71,12 +71,13 @@ class KernelCmd(Directive):
     u"""KernelABI (``kernel-abi``) directive"""
 
     required_arguments = 1
-    optional_arguments = 0
+    optional_arguments = 2
     has_content = False
     final_argument_whitespace = True
 
     option_spec = {
-        "debug"     : directives.flag
+        "debug"     : directives.flag,
+        "rst"       : directives.unchanged
     }
 
     def warn(self, message, **replace):
@@ -96,6 +97,9 @@ class KernelCmd(Directive):
         cmd = "get_abi.pl rest --enable-lineno --dir "
         cmd += self.arguments[0]
 
+        if 'rst' in self.options:
+            cmd += " --rst-source"
+
         srctree = path.abspath(os.environ["srctree"])
 
         fname = cmd
-- 
2.21.0

