Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A54429A31D
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772374; cv=none; b=OZoi9FilFbFJ8Xh7DDSq4RxPKUxv1vTMqqKMy8bDXcSpq57B34JSgKIHJ1SdwV8m74719LfOE9SnSf3HNT6BZsUlTyLk7Aq4XZUprOzMc1cw+2Ctt5SV3JUpgti3pqqV5zmFJMkKqFC18vT/2K2aQoqMQiH9KYGn12uEN0rLvHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772374; c=relaxed/simple;
	bh=g80pHHSVJTrphogPoK2EcViQY6ILssLsaF7KfxzqW6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjKXAveyQN9K8gCR5IYBjL6TDtVfgEMFFgEc2KRQhrg+Lb0Pa++862TjfgrrYPRwSA+9KTol4Na42fcvhCoIILgQyZMHVid47IdDexWSDn/0U9FF2byT3PrbRFA01x3tHZ+01CWnw2r42uhWXNAsERvBI0D+CwF34utIx6gWb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UIEjifHr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UIEjifHr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso262954f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772371; x=1751377171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpIY03qJBh52r3AMjs7uQiwUhbrX9UUcbgb904orePg=;
        b=UIEjifHrOgepU1yHWlYF3bBvmmoPj96WfYk8rGQdDcTTUyxDgoBHmtP/QUDovvVKJ3
         8qc2gIGBlIJaO9ecSgjYz8m7NZA2bMo4Wlpcfnd8YL7zE5FxPAr6VIOtB14qg1y5XMjP
         yAe0xd1HQmJjR5b/121d3QHqt2CBTgjAaZXS/kGd+9QBCdqM+PKrjZYfquPkVB6oPDp7
         OnFQoZF82ZmR2WJ8NzLxun7rV08U6re30WEHzwusq74ADOFyJP/04CcEROv/HSlJ9fqG
         o8ECCx48m01mbdUgZAnjpWJEK5+F8STdXpSglvf3/q9O2sxc0SS7C3JZTOrG+KaYilnW
         jYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772371; x=1751377171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpIY03qJBh52r3AMjs7uQiwUhbrX9UUcbgb904orePg=;
        b=KXpR8soNNtzYeHqsvhhpa++ypDelsykMcC/co2+yEYaXLQDFjbQnuPj1Fq5rH9urhf
         2rQv6SWEc4Sf8ebdHwY/xoIwtsOdfY2UixPuELBrmzT3sRfanYt+NEVQzEx5Zo2ZDTSS
         fL6M1BE4TAaJ8TyTLqmiSHg/5hMy9TnPqK1nNhlLlFlGGK1MXSY6HPSWyMvtlYqqosh1
         nWBhc5Co17BzpacwpONHXmrhpBq3SdMVPOhVEgdYv0vr9hAS0jUG3PRTbin+sRJShF5Q
         uHg9Npm02rpZc/yEBcMuCtmB3avj379iSjqo+kFH/s1uNALr7udfeHB1p8Kl0Y6bRIyC
         WMXA==
X-Forwarded-Encrypted: i=1; AJvYcCXjgNH3wOh2MkADCG3/mazZzlce1ADXEdFfuDGUxqzjTNMOyZzcQ8/tPd5U9oDfkJoy+5g1o0lJ7d4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7EmSGlj36Pi4guxGFzmbjz/WOtiISC+xCLJEoZB25IfAVA/YY
	l1u0f8IpDegZceiVQDjEqwiy7N8Vq68DuFkbKVE8pil19gpRMOwvTdal6MyDx2+8Yd4=
X-Gm-Gg: ASbGncsJ7MARjpCPpCZ/eTyZtWyAZ0CW3AArNrj5xgB2+BaMHmDxyUXotYzZ4qORLDy
	dVg8sYqOmA+6r2IVqcB0T8gCEtbNhhZOyQs86EX0v6Ap4g0vZc8fuVHjoALwOSBgMb3EbBVBjN2
	dvug5bhHm3R0yEKJIreQLNL6rvVLY6WqydEIXmHLt7YdkPqvSAwK76q/VOAkwGt5COLKqnWm2EF
	NXzshVAWB+Fgsi1fPNv/IpfmikIo2hQNiIPVkK/CxMnX4QhhfA74oLFSUvjUfMi9yF0aM7tC8qK
	VeD2Cx7Cq9rNB0HvaY4DLxbUeq0Bj4mn6KiZdL7Kv1sOBE3butLqW8P5W/dN+nSgTD+k5Bovx5a
	08AMtcRoYl4hB4uy7HZan16iqsL6wYjJvB7v7hV2cA9VAkV1gzEBO
X-Google-Smtp-Source: AGHT+IG98SXlX8rKY55D5CjUPBbSPU4w+ruylNw7sqxOxZSzqk2mxBWEoEspfGDhb4FlcYBZi1AECw==
X-Received: by 2002:a05:6000:2013:b0:3a3:6a3f:bc61 with SMTP id ffacd0b85a97d-3a6d12f9a28mr5299210f8f.7.1750772370725;
        Tue, 24 Jun 2025 06:39:30 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8e19sm175939225e9.21.2025.06.24.06.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:30 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 2/8] docs: dma-api: replace consistent with coherent
Date: Tue, 24 Jun 2025 15:39:17 +0200
Message-ID: <20250624133923.1140421-3-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624133923.1140421-1-ptesarik@suse.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For consistency, always use the term "coherent" when talking about memory
that is not subject to CPU caching effects. The term "consistent" is a
relic of a long-removed pci_alloc_consistent() function.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api-howto.rst | 36 ++++++++++++------------
 Documentation/core-api/dma-api.rst       | 14 ++++-----
 mm/dmapool.c                             |  6 ++--
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/Documentation/core-api/dma-api-howto.rst b/Documentation/core-api/dma-api-howto.rst
index 0bf31b6c4383..96fce2a9aa90 100644
--- a/Documentation/core-api/dma-api-howto.rst
+++ b/Documentation/core-api/dma-api-howto.rst
@@ -155,7 +155,7 @@ a device with limitations, it needs to be decreased.
 
 Special note about PCI: PCI-X specification requires PCI-X devices to support
 64-bit addressing (DAC) for all transactions.  And at least one platform (SGI
-SN2) requires 64-bit consistent allocations to operate correctly when the IO
+SN2) requires 64-bit coherent allocations to operate correctly when the IO
 bus is in PCI-X mode.
 
 For correct operation, you must set the DMA mask to inform the kernel about
@@ -174,7 +174,7 @@ used instead:
 
 		int dma_set_mask(struct device *dev, u64 mask);
 
-	The setup for consistent allocations is performed via a call
+	The setup for coherent allocations is performed via a call
 	to dma_set_coherent_mask()::
 
 		int dma_set_coherent_mask(struct device *dev, u64 mask);
@@ -241,7 +241,7 @@ it would look like this::
 
 The coherent mask will always be able to set the same or a smaller mask as
 the streaming mask. However for the rare case that a device driver only
-uses consistent allocations, one would have to check the return value from
+uses coherent allocations, one would have to check the return value from
 dma_set_coherent_mask().
 
 Finally, if your device can only drive the low 24-bits of
@@ -298,20 +298,20 @@ Types of DMA mappings
 
 There are two types of DMA mappings:
 
-- Consistent DMA mappings which are usually mapped at driver
+- Coherent DMA mappings which are usually mapped at driver
   initialization, unmapped at the end and for which the hardware should
   guarantee that the device and the CPU can access the data
   in parallel and will see updates made by each other without any
   explicit software flushing.
 
-  Think of "consistent" as "synchronous" or "coherent".
+  Think of "coherent" as "synchronous".
 
-  The current default is to return consistent memory in the low 32
+  The current default is to return coherent memory in the low 32
   bits of the DMA space.  However, for future compatibility you should
-  set the consistent mask even if this default is fine for your
+  set the coherent mask even if this default is fine for your
   driver.
 
-  Good examples of what to use consistent mappings for are:
+  Good examples of what to use coherent mappings for are:
 
 	- Network card DMA ring descriptors.
 	- SCSI adapter mailbox command data structures.
@@ -320,13 +320,13 @@ There are two types of DMA mappings:
 
   The invariant these examples all require is that any CPU store
   to memory is immediately visible to the device, and vice
-  versa.  Consistent mappings guarantee this.
+  versa.  Coherent mappings guarantee this.
 
   .. important::
 
-	     Consistent DMA memory does not preclude the usage of
+	     Coherent DMA memory does not preclude the usage of
 	     proper memory barriers.  The CPU may reorder stores to
-	     consistent memory just as it may normal memory.  Example:
+	     coherent memory just as it may normal memory.  Example:
 	     if it is important for the device to see the first word
 	     of a descriptor updated before the second, you must do
 	     something like::
@@ -365,10 +365,10 @@ Also, systems with caches that aren't DMA-coherent will work better
 when the underlying buffers don't share cache lines with other data.
 
 
-Using Consistent DMA mappings
-=============================
+Using Coherent DMA mappings
+===========================
 
-To allocate and map large (PAGE_SIZE or so) consistent DMA regions,
+To allocate and map large (PAGE_SIZE or so) coherent DMA regions,
 you should do::
 
 	dma_addr_t dma_handle;
@@ -385,10 +385,10 @@ __get_free_pages() (but takes size instead of a page order).  If your
 driver needs regions sized smaller than a page, you may prefer using
 the dma_pool interface, described below.
 
-The consistent DMA mapping interfaces, will by default return a DMA address
+The coherent DMA mapping interfaces, will by default return a DMA address
 which is 32-bit addressable.  Even if the device indicates (via the DMA mask)
-that it may address the upper 32-bits, consistent allocation will only
-return > 32-bit addresses for DMA if the consistent DMA mask has been
+that it may address the upper 32-bits, coherent allocation will only
+return > 32-bit addresses for DMA if the coherent DMA mask has been
 explicitly changed via dma_set_coherent_mask().  This is true of the
 dma_pool interface as well.
 
@@ -497,7 +497,7 @@ program address space.  Such platforms can and do report errors in the
 kernel logs when the DMA controller hardware detects violation of the
 permission setting.
 
-Only streaming mappings specify a direction, consistent mappings
+Only streaming mappings specify a direction, coherent mappings
 implicitly have a direction attribute setting of
 DMA_BIDIRECTIONAL.
 
diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 97f42c15f5e4..c0a2cc7d0b95 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -8,9 +8,9 @@ This document describes the DMA API.  For a more gentle introduction
 of the API (and actual examples), see Documentation/core-api/dma-api-howto.rst.
 
 This API is split into two pieces.  Part I describes the basic API.
-Part II describes extensions for supporting non-consistent memory
+Part II describes extensions for supporting non-coherent memory
 machines.  Unless you know that your driver absolutely has to support
-non-consistent platforms (this is usually only legacy platforms) you
+non-coherent platforms (this is usually only legacy platforms) you
 should only use the API described in part I.
 
 Part I - DMA API
@@ -33,13 +33,13 @@ Part Ia - Using large DMA-coherent buffers
 	dma_alloc_coherent(struct device *dev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flag)
 
-Consistent memory is memory for which a write by either the device or
+Coherent memory is memory for which a write by either the device or
 the processor can immediately be read by the processor or device
 without having to worry about caching effects.  (You may however need
 to make sure to flush the processor's write buffers before telling
 devices to read that memory.)
 
-This routine allocates a region of <size> bytes of consistent memory.
+This routine allocates a region of <size> bytes of coherent memory.
 
 It returns a pointer to the allocated region (in the processor's virtual
 address space) or NULL if the allocation failed.
@@ -48,9 +48,9 @@ It also returns a <dma_handle> which may be cast to an unsigned integer the
 same width as the bus and given to the device as the DMA address base of
 the region.
 
-Note: consistent memory can be expensive on some platforms, and the
+Note: coherent memory can be expensive on some platforms, and the
 minimum allocation length may be as big as a page, so you should
-consolidate your requests for consistent memory as much as possible.
+consolidate your requests for coherent memory as much as possible.
 The simplest way to do that is to use the dma_pool calls (see below).
 
 The flag parameter (dma_alloc_coherent() only) allows the caller to
@@ -64,7 +64,7 @@ the returned memory, like GFP_DMA).
 	dma_free_coherent(struct device *dev, size_t size, void *cpu_addr,
 			  dma_addr_t dma_handle)
 
-Free a region of consistent memory you previously allocated.  dev,
+Free a region of coherent memory you previously allocated.  dev,
 size and dma_handle must all be the same as those passed into
 dma_alloc_coherent().  cpu_addr must be the virtual address returned by
 the dma_alloc_coherent().
diff --git a/mm/dmapool.c b/mm/dmapool.c
index 5be8cc1c6529..5d8af6e29127 100644
--- a/mm/dmapool.c
+++ b/mm/dmapool.c
@@ -200,7 +200,7 @@ static void pool_block_push(struct dma_pool *pool, struct dma_block *block,
 
 
 /**
- * dma_pool_create_node - Creates a pool of consistent memory blocks, for dma.
+ * dma_pool_create_node - Creates a pool of coherent DMA memory blocks.
  * @name: name of pool, for diagnostics
  * @dev: device that will be doing the DMA
  * @size: size of the blocks in this pool.
@@ -210,7 +210,7 @@ static void pool_block_push(struct dma_pool *pool, struct dma_block *block,
  * Context: not in_interrupt()
  *
  * Given one of these pools, dma_pool_alloc()
- * may be used to allocate memory.  Such memory will all have "consistent"
+ * may be used to allocate memory.  Such memory will all have coherent
  * DMA mappings, accessible by the device and its driver without using
  * cache flushing primitives.  The actual size of blocks allocated may be
  * larger than requested because of alignment.
@@ -395,7 +395,7 @@ void dma_pool_destroy(struct dma_pool *pool)
 EXPORT_SYMBOL(dma_pool_destroy);
 
 /**
- * dma_pool_alloc - get a block of consistent memory
+ * dma_pool_alloc - get a block of coherent memory
  * @pool: dma pool that will produce the block
  * @mem_flags: GFP_* bitmask
  * @handle: pointer to dma address of block
-- 
2.49.0

