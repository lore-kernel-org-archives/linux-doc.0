Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AF4C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:06:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33A242078E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993213;
	bh=2vOhXSLKPSRDq4fwV/l5qiMktT9sFbutjxIXyI0HcqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=a5aUEqEhMF6T+VWWc2AlPFbnvieWTnUsfcybYFssawFeZZCe4g6PoMeTb9QSqiFAM
	 +dBWCdPlnChu7UCyxHWkq7rA7vXb7pFwdnA3tAbZP0UdnP/P0FEDWpNVY6qSNc2YRj
	 10Bs1XnpwTAYHH5yioLJZA7MmEYhJVZxsVwZftM4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgJFOGw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:33532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgJFODz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57DD621D41;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993034;
        bh=2vOhXSLKPSRDq4fwV/l5qiMktT9sFbutjxIXyI0HcqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aTlhK5jKs8x+k6yaqOXs0Aa1MJJnSHdwUMTFUxZKUvPoF9AosQ4BJ8Bn+k2rVfyD2
         YLAXxlzlNmNMtJKFU13q8ZmK0A7KRqcEl9aiiS72kk3+aLKg8dtrxerUI/w793kp5i
         C+2Y+gLXKPwTfH8QOj7kRLhxm+e4qaKhyh6B8xGQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019Fi-8u; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Daniel Axtens <dja@axtens.net>, Marco Elver <elver@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 27/52] docs: kernel-api.rst: drop kernel/irq/manage.c kernel-doc tag
Date:   Tue,  6 Oct 2020 16:03:24 +0200
Message-Id: <99ca121814a8df043bc4eae4e6485ae6e0c65ac8.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
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

