Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F4BC4727E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 577932075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472476;
	bh=2vOhXSLKPSRDq4fwV/l5qiMktT9sFbutjxIXyI0HcqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=kLunf3fD0MhkBb3zpjYvS1LNJpiyVGJT/SSeTHnuAlhaECgkMMvx0kIAwkwmzLk3h
	 JaYVfmETkKy+eZAL+vfTiPw0bvPkV/CydhidKVuFyNFYReVoKca6QeVZV/qpvg7V1O
	 8LBa6CpLXof/EQyGWR8UvmgEDekZGbryLWaCawag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbgI3N1p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:27:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730225AbgI3NZV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7950235FC;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=2vOhXSLKPSRDq4fwV/l5qiMktT9sFbutjxIXyI0HcqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IX/qUc95D7PcaswOMTskSA1Xp+PIWteXDw2R3Jmfcv+5bIHMuTqcNu64Gh8c2ZM08
         IFgta0xvMvYfSXFboJwhKSJT1AQt48OR1CDPDiFRM/gpaS3r0OC0+ZSetlYpSLJLlD
         WwtBiXOyvpnK3G7IM5Y2I+G+QxYGNg31uCKcE8/I=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XK2-SZ; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Daniel Axtens <dja@axtens.net>, Marco Elver <elver@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 27/52] docs: kernel-api.rst: drop kernel/irq/manage.c kernel-doc tag
Date:   Wed, 30 Sep 2020 15:24:50 +0200
Message-Id: <76f39912e9774c97a1257a88afb44d2f0e91cdee.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is already included at genericirq.rst. Adding it twice
causes C namespace duplication:

	.../Documentation/core-api/kernel-api:237: ../kernel/irq/manage.c:100: WARNING: Duplicate C declaration, also defined in 'genericirq'.
	Declaration is 'synchronize_hardirq'.
	.../Documentation/core-api/kernel-api:237: ../kernel/irq/manage.c:128: WARNING: Duplicate C declaration, also defined in 'genericirq'.
	Declaration is 'synchronize_irq'.
	.../Documentation/core-api/kernel-api:237: ../kernel/irq/manage.c:443: WARNING: Duplicate C declaration, also defined in 'genericirq'.
	Declaration is 'irq_set_affinity_notifier'.
	...

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/core-api/kernel-api.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 4ac53a1363f6..741aa37dc181 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -231,12 +231,6 @@ Refer to the file kernel/module.c for more information.
 Hardware Interfaces
 ===================
 
-Interrupt Handling
-------------------
-
-.. kernel-doc:: kernel/irq/manage.c
-   :export:
-
 DMA Channels
 ------------
 
-- 
2.26.2

