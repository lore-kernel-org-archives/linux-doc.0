Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B1BC49EA2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69EC4613DA
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhFPGaP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 02:30:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231636AbhFPG3y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Jun 2021 02:29:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A68061406;
        Wed, 16 Jun 2021 06:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623824868;
        bh=CrYrSCQ5roiQoHpCpOwAt0vkDKLp+wMs38LNVCryUAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L0yXL6NBDkppavsJdAfP66Tqh/HkmjX4k/N8IRfFPp4rYL8Q7SDWKud4JJD3v2BEP
         Nx0x26pdKsdmQ0MT/S9OKPVncCFeqypf5kYQsv53LDONcECf/UgllhmoTaf3ZEBr5h
         +vLxRwrx8lqdWLtV6HHbRGBISaOPoFYS2Yz22SiFtbInWYgGHRTKfCX2BcO1UhG4na
         UINfeibnm9cSxMCBPE6UKiRkyoSUfmR+2qo7nnJcjZYiv0TiDXttyAXnkBksTQuDeb
         pjxj0+zqRARZrCFhGQeV0bPtNaVPyNcQ6GdSXyHkar7pV860tDRqN8uZPRKqWAsQaW
         lo1ocqTJ9/KsQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltP1e-004kJK-NA; Wed, 16 Jun 2021 08:27:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/29] docs: driver-api: usb: avoid using ReST :doc:`foo` markup
Date:   Wed, 16 Jun 2021 08:27:31 +0200
Message-Id: <2cd2dc3e6bacde587aeb09a3951594cfb0102014.1623824363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623824363.git.mchehab+huawei@kernel.org>
References: <cover.1623824363.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/usb/dma.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/usb/dma.rst b/Documentation/driver-api/usb/dma.rst
index 2b3dbd3265b4..d32c27e11b90 100644
--- a/Documentation/driver-api/usb/dma.rst
+++ b/Documentation/driver-api/usb/dma.rst
@@ -10,7 +10,7 @@ API overview
 
 The big picture is that USB drivers can continue to ignore most DMA issues,
 though they still must provide DMA-ready buffers (see
-:doc:`/core-api/dma-api-howto`).  That's how they've worked through
+Documentation/core-api/dma-api-howto.rst).  That's how they've worked through
 the 2.4 (and earlier) kernels, or they can now be DMA-aware.
 
 DMA-aware usb drivers:
@@ -60,7 +60,7 @@ and effects like cache-trashing can impose subtle penalties.
   force a consistent memory access ordering by using memory barriers.  It's
   not using a streaming DMA mapping, so it's good for small transfers on
   systems where the I/O would otherwise thrash an IOMMU mapping.  (See
-  :doc:`/core-api/dma-api-howto` for definitions of "coherent" and
+  Documentation/core-api/dma-api-howto.rst for definitions of "coherent" and
   "streaming" DMA mappings.)
 
   Asking for 1/Nth of a page (as well as asking for N pages) is reasonably
@@ -91,7 +91,7 @@ Working with existing buffers
 Existing buffers aren't usable for DMA without first being mapped into the
 DMA address space of the device.  However, most buffers passed to your
 driver can safely be used with such DMA mapping.  (See the first section
-of :doc:`/core-api/dma-api-howto`, titled "What memory is DMA-able?")
+of Documentation/core-api/dma-api-howto.rst, titled "What memory is DMA-able?")
 
 - When you're using scatterlists, you can map everything at once.  On some
   systems, this kicks in an IOMMU and turns the scatterlists into single
-- 
2.31.1

