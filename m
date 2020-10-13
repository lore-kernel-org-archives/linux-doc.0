Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF3DC433DF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0909E20870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590347;
	bh=d71iacXbZw2ABLpWaZX1uaqcv45PDLhlX1j5I6cVz50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=bX+y27v9kqkh6BNJfxlh5klyDnRAAU0sBB/sWnzq9MfSR+UL+1Bz+kLdTM8gTVcbL
	 8Cx7UfU6P/pWvgpngQtvB8n6fCVifmPpwe+1bm0AuqKo/6cezPeYrxP0ksheQEEUnc
	 njf23F+YJHK+UsLpHn1peS9i2o8q/MuRKY/c2yzc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgJML6y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:58:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727554AbgJMLyo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:44 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08CC82242F;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=d71iacXbZw2ABLpWaZX1uaqcv45PDLhlX1j5I6cVz50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R3KW14V7Wim7RdPQZIE5yMh0o7hfk//GGyeVFh6BrHQf/cfkIy3k8Vy4sD4w+i90J
         a/gHYkF5atiHT3grTSxg57RjsL2SZgMoFhw1wrPjhnp85GyIfv0AGKaMUCgKkL2Gn3
         rGxhwI3qwdZPuuHT+GHs7BpANaqjpVY9dPnzzL4c=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVM-26; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 48/80] docs: basics.rst: avoid duplicated C function declaration
Date:   Tue, 13 Oct 2020 13:54:03 +0200
Message-Id: <be7eb8eac95950baf458977fff5b4ddf13c44bc4.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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

