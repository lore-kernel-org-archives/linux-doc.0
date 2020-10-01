Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CAFC4727E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 22:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CD6620738
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 22:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgJAWPs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 18:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgJAWPs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 18:15:48 -0400
X-Greylist: delayed 1490 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Oct 2020 15:15:48 PDT
Received: from dazzle.geroedel.de (unknown [IPv6:2a02:180:2:aa:1::b3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B284C0613D0
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 15:15:48 -0700 (PDT)
Received: from [192.168.15.2] (helo=feeble.bln.roederer.dhs.org)
        by dazzle.geroedel.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <devel-sven@geroedel.de>)
        id 1kO6TP-0008A0-Jc
        for linux-doc@vger.kernel.org; Thu, 01 Oct 2020 23:50:56 +0200
Received: from strike.bln.roederer.dhs.org ([192.168.8.36])
        by feeble.bln.roederer.dhs.org with smtp (Exim 4.92)
        (envelope-from <devel-sven@geroedel.de>)
        id 1kO6TP-0003uQ-6D
        for linux-doc@vger.kernel.org; Thu, 01 Oct 2020 23:50:47 +0200
Received: (nullmailer pid 30721 invoked by uid 10000);
        Thu, 01 Oct 2020 21:50:47 -0000
From:   Sven Roederer <devel-sven@geroedel.de>
To:     linux-doc@vger.kernel.org
Date:   Thu,  1 Oct 2020 23:50:29 +0200
Message-Id: <20201001215029.30583-1-devel-sven@geroedel.de>
X-Mailer: git-send-email 2.17.1
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Spam_report: Spam detection software, running on the system "dazzle",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 Content preview:  Since 5.3 (59b2bd05f5f4dc) the 'make headers_install' call
    depends on rsync to deploy the files system wide. Signed-off-by: Sven Roederer
    <devel-sven@geroedel.de> --- Documentation/process/changes.rst | 8 ++++++++
    1 file changed, 8 insertions(+) 
 Content analysis details:   (-2.9 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
X-SA-Exim-Connect-IP: 192.168.15.2
X-SA-Exim-Mail-From: devel-sven@geroedel.de
Subject: [PATCH] docs: changes.rst: add rsync to the list of required tools
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on dazzle.geroedel.de)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 5.3 (59b2bd05f5f4dc) the 'make headers_install' call depends on
rsync to deploy the files system wide.

Signed-off-by: Sven Roederer <devel-sven@geroedel.de>
---
 Documentation/process/changes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index ee741763a3fc..94f22368a2af 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -55,9 +55,11 @@ iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
 Sphinx\ [#f1]_	       1.3		sphinx-build --version
+rsync\ [#f2]_          3.0              rsync --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
+.. [#f2] rsync is needed only during final install of kernel-headers
 
 Kernel compilation
 ******************
@@ -161,6 +163,12 @@ is not build with ``CONFIG_KALLSYMS`` and you have no way to rebuild and
 reproduce the Oops with that option, then you can still decode that Oops
 with ksymoops.
 
+rsync
+-----
+
+rsync is used to instal the kernel-headers system wide with administarative
+permissions. This was added in v5.3.
+
 Mkinitrd
 --------
 
-- 
2.17.1

