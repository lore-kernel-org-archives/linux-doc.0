Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DECC4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0554820782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993158;
	bh=d71iacXbZw2ABLpWaZX1uaqcv45PDLhlX1j5I6cVz50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cC+zeTeFZIr60Z4w/uffmv2t0QPiUe34FOSTG7e8aipwfCin+93h5agzN0WBfMDyW
	 t6/47h20vaM0z9ZNq2Av3yBV9S9OX4plQS9IekkWNnRkFxkiVIyFykpqnU+tSB6xrv
	 or3LUX6HftjIaMnfcOUa21j/rZXPLXqWWOmNlon8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgJFOFz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:05:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgJFOD4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:56 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0BB2207EA;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=d71iacXbZw2ABLpWaZX1uaqcv45PDLhlX1j5I6cVz50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FUwDfSDujLWQS8DayiVH3m/HobXQRjmznN/U0cqD4y6KAEQxku0Mp3tTQqXlnYVhO
         BJ5970dRhwNUGBueOW7cfAPlrNVadjyW2gRW5dRUDoPPFYJl2vWrD35OGyQnnrzSAr
         6AD3YyGu1aXWfwxE+7l3E0ZF4hIci0YXp/5hqAmM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZJ-0019Gh-2A; Tue, 06 Oct 2020 16:03:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 48/52] docs: basics.rst: avoid duplicated C function declaration
Date:   Tue,  6 Oct 2020 16:03:45 +0200
Message-Id: <8e101f80a5bd2715b8727e07071b3dbb7b75971b.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
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

