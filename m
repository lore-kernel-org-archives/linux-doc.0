Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3A6C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 01:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 426D664E00
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 01:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhA3Btc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jan 2021 20:49:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35974 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhA3Brq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jan 2021 20:47:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 5A3D81F45F9C
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 2/2] Documentation: admin-guide: Update kvm/xen config option
Date:   Fri, 29 Jan 2021 22:45:47 -0300
Message-Id: <20210130014547.123006-2-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210130014547.123006-1-andrealmeid@collabora.com>
References: <20210130014547.123006-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit 9bba03d4473d ("kconfig: remove 'kvmconfig' and 'xenconfig'
shorthands") kvm/xen config shortcuts are not available anymore. Update
the file to reflect how they should be used, with the full filename.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 Documentation/admin-guide/README.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 261b7b4cca1f..35314b63008c 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -226,10 +226,11 @@ Configuring the kernel
                            all module options to built in (=y) options. You can
                            also preserve modules by LMC_KEEP.
 
-     "make kvmconfig"   Enable additional options for kvm guest kernel support.
+     "make kvm_guest.config"   Enable additional options for kvm guest kernel
+                               support.
 
-     "make xenconfig"   Enable additional options for xen dom0 guest kernel
-                        support.
+     "make xen.config"   Enable additional options for xen dom0 guest kernel
+                         support.
 
      "make tinyconfig"  Configure the tiniest possible kernel.
 
-- 
2.30.0

