Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0461DC4727F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C24202076B
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472412;
	bh=d71iacXbZw2ABLpWaZX1uaqcv45PDLhlX1j5I6cVz50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xDlgBoLxU+7f7EHdoO8d+PbMLFBxgR5AxUAwJ45elOopan1VprG+EOzVi2X9UboGP
	 bBXeILWFEzikl0hw7X/ku+j06mMA3OoDK5ZODcJP/dHKSFFUyez9vPL5rGQeVoCuNI
	 tKZAHriYCAA/8QxYtnInFdB8RUz9bwoYWb/e96Ng=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbgI3N0v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:26:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730262AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A19DD23A63;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=d71iacXbZw2ABLpWaZX1uaqcv45PDLhlX1j5I6cVz50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N3GN4woodmpXnRqWfgLz7iGwqQXaLzpsZpksIC2ylsHonzj+OEZZd4kSi0+E/VkpY
         CzfsvRiQxOEW2eWH+0SLbYDN2x9EF3vjlIDRXyTwvBskVF/YXWawXcaG4YyfbO47aJ
         jRePkCVVACedym/XUk1zX5IcEflV9U0g7Om9/QNk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XLC-Rr; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 48/52] docs: basics.rst: avoid duplicated C function declaration
Date:   Wed, 30 Sep 2020 15:25:11 +0200
Message-Id: <de59e69f1a140c6cf74623d7c5d27b7fbc5a1305.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

pci_device_id is already documented at pci.rst:

	./Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'PCI/pci'.
	Declaration is 'pci_device_id'.

The kstrtol and kstrtoul are already at kernel-api:

	./Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'kstrtoul'.
	./Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'kstrtol'.

And the printk is already defined at printk-basics:

	./Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/printk-basics'.
	Declaration is 'printk'.

So, exclude those identifiers from basirs.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/basics.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 63bbe3ed5e76..3e2dae954898 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -12,6 +12,8 @@ Driver device table
 
 .. kernel-doc:: include/linux/mod_devicetable.h
    :internal:
+   :no-identifiers: pci_device_id
+
 
 Delaying, scheduling, and timer routines
 ----------------------------------------
@@ -96,9 +98,11 @@ Kernel utility functions
 
 .. kernel-doc:: include/linux/kernel.h
    :internal:
+   :no-identifiers: kstrtol kstrtoul
 
 .. kernel-doc:: kernel/printk/printk.c
    :export:
+   :no-identifiers: printk
 
 .. kernel-doc:: kernel/panic.c
    :export:
-- 
2.26.2

