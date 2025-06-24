Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421682D12ED
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772378; cv=none; b=SCvBTj5XVoV0KkBpsDiNo09RX8HI6QPRCz8kDXNfwv3IiMAtrERLrcTLHNuoAUHrr2Z0gbWR62cg0YwkZVQluCu3NFcYURqUIqE0PBDWKMUo3Bact6bMMMuIDxipMB1pQUr5brof1emkMSMdgx8ltiyuoKxmb5f3bV3SFYMiQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772378; c=relaxed/simple;
	bh=j/lxvBE0W8RtTSwNWKrFB81pW4iq0UIccw1Ghb9PK6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meYbugDG3h2QdYP86HQYA7YLplRwkr4UNYe77eAUR023IS88j2w/12wrkeUe04mAodWv9uPCf0X1hjRrGk0GJUf9bq7azFRNL4gkp+Z/KxUyvJR3nJpxNZLtkzpxljntmuiAfbjvTKX/f0qPzaCGL/7Fz3+brIKbdEFrW3Af1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SLNOunRH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SLNOunRH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45360a81885so1931425e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772374; x=1751377174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMoobju51S3yheRJ4nJb50lwjewYooD5+oD7p0lsIPI=;
        b=SLNOunRHP6SCuVgfQ8GbZUpNZiUJWrBqvSIladPPuo2blIty134Qs2A6ARfTcZuv0Q
         tbDTfBeXYyNeGU2O+8CWtQ+zseQDkpnXBIk8XUkhoUlnfkuA8i1Ze7cE+VDZi2m+ioTO
         FDYRM6AZh4XO+ZaW175gWY/V6R+EcpOx2C4o39KKcEbslSmJFot5GO0GbzYvl8Wfckhk
         YNgBW9PTbrFCLiM1m5rc3uxaCiGbIVn8kxq17IF7ASL39M+Bzu8m4p5ChpEZGtE90bUP
         9YDmYRKWdyYg4Ax7Xzfy2AiYx66KlhKXLUs9/mcoq95Krlx6lCmaDDIMYOqsDoF7peve
         +RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772374; x=1751377174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMoobju51S3yheRJ4nJb50lwjewYooD5+oD7p0lsIPI=;
        b=mLYCxbwByuyLgy8kdVVMkwkXREuiAq6OeYFCQ8ZjSilbuf84bpVlWj4AXDsLlvhHEd
         elee6Pe41ufE1TH+tvMcJqtZBy9audQ1YlB8QlnLChlHB8vH+lti4wojao+C4jrg41Si
         pmzfuk7r0tiH0RsmoYjGA2QeSBB1ba0oT2fVZSkuVEOXcEBR2AG1ZQUEzZ9lgXWVAZSn
         6uVd1HJXdpxrfoa3lqah/7djPJhnlW1IRnxZEsB3Ubk3Cr+Qh+Rh977UbqqBWB7moRYF
         sN6GZIZx/vj/cy26/VHceF2CTkkGcSLQ1SEAPkJwMsgSJuolDwx3x/o3Olthr45OfSqO
         q4nA==
X-Forwarded-Encrypted: i=1; AJvYcCUe2Glslqsll1ElIBJaZ/1zJrEdnoRJIzu5jJCVd1Fq//Q4dc/ycxcpRVL2WJyyl34zhhsej7jS7CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YznwtH8ztStMcDH+2L1BzSycP4kIc7B2hoX1Qjhc91TRytHymzM
	KfdFG0QPMLx7gY+fsgx+mdW3HFlxKRBvghNIFbR4jSSQSlTbspLEQbN38fSau4ojpkg=
X-Gm-Gg: ASbGncsA1qDL1gnI/SkXebVFGjr+SoBEWPwE4Eog0u3yMTeSULuJO0msQ9FvicF55hh
	ajRfjcakiB6xEcmylG4TrQSmYZasomK3i++aSNSavHeyVQOPYLbMOQAZt45meyNQ7WYtEnTPK7F
	Eq0a25NH3KVd2Tint/NZFrvANqeo1FKTTmu1OYAU0H65fRwzJpO/yD3/umSOrSNKl3zNFHfM3gw
	RIE1vnzyC/a05ZEObnLYLhodaDoCUzpx0i5ZetvZtSIZiZ8iZumMZ+o4ND8QeSWAtZmsxPpX65D
	EkFBYAz0hyyXnE4prrun5F0IRRoc3p+ooms7cCz+BFZIoDS4XI3HQx2nuH8vwVBikqaICsxepxJ
	HFCSgjXhKxdcD8OxXYLQk8kyG4gOAfw1jco903Tb0zTxHtBBIgnk9
X-Google-Smtp-Source: AGHT+IEJyYo9lnu2Mk5wM3vEKd7mlfp5WCsbwymCeOMIaa9JZYjSHQ3akdWqQqS/IC1aMCHvKzNu3w==
X-Received: by 2002:a05:600c:4747:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-453659ca904mr62554965e9.9.1750772374485;
        Tue, 24 Jun 2025 06:39:34 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8e19sm175941015e9.21.2025.06.24.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:34 -0700 (PDT)
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
Subject: [PATCH 5/8] docs: dma-api: remove duplicate description of the DMA pool API
Date: Tue, 24 Jun 2025 15:39:20 +0200
Message-ID: <20250624133923.1140421-6-ptesarik@suse.com>
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

The DMA pool API is documented in Memory Management APIs. Do not duplicate
it in DMA API documentation.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 62 +-----------------------------
 Documentation/core-api/mm-api.rst  |  2 +
 2 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 3e89e3b0ecfd..f7fddaf7510c 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -83,66 +83,8 @@ much like a struct kmem_cache, except that they use the DMA-coherent allocator,
 not __get_free_pages().  Also, they understand common hardware constraints
 for alignment, like queue heads needing to be aligned on N-byte boundaries.
 
-
-::
-
-	struct dma_pool *
-	dma_pool_create(const char *name, struct device *dev,
-			size_t size, size_t align, size_t alloc);
-
-dma_pool_create() initializes a pool of DMA-coherent buffers
-for use with a given device.  It must be called in a context which
-can sleep.
-
-The "name" is for diagnostics (like a struct kmem_cache name); dev and size
-are like what you'd pass to dma_alloc_coherent().  The device's hardware
-alignment requirement for this type of data is "align" (which is expressed
-in bytes, and must be a power of two).  If your device has no boundary
-crossing restrictions, pass 0 for alloc; passing 4096 says memory allocated
-from this pool must not cross 4KByte boundaries.
-
-::
-
-	void *
-	dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
-		        dma_addr_t *handle)
-
-Wraps dma_pool_alloc() and also zeroes the returned memory if the
-allocation attempt succeeded.
-
-
-::
-
-	void *
-	dma_pool_alloc(struct dma_pool *pool, gfp_t gfp_flags,
-		       dma_addr_t *dma_handle);
-
-This allocates memory from the pool; the returned memory will meet the
-size and alignment requirements specified at creation time.  Pass
-GFP_ATOMIC to prevent blocking, or if it's permitted (not
-in_interrupt, not holding SMP locks), pass GFP_KERNEL to allow
-blocking.  Like dma_alloc_coherent(), this returns two values:  an
-address usable by the CPU, and the DMA address usable by the pool's
-device.
-
-::
-
-	void
-	dma_pool_free(struct dma_pool *pool, void *vaddr,
-		      dma_addr_t addr);
-
-This puts memory back into the pool.  The pool is what was passed to
-dma_pool_alloc(); the CPU (vaddr) and DMA addresses are what
-were returned when that routine allocated the memory being freed.
-
-::
-
-	void
-	dma_pool_destroy(struct dma_pool *pool);
-
-dma_pool_destroy() frees the resources of the pool.  It must be
-called in a context which can sleep.  Make sure you've freed all allocated
-memory back to the pool before you destroy it.
+See :ref:`Documentation/core-api/mm-api.rst <dma_pools>` for a detailed
+description of the DMA pools API.
 
 
 Part Ic - DMA addressing limitations
diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index a61766328ac0..de0bab6e3fdd 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -91,6 +91,8 @@ Memory pools
 .. kernel-doc:: mm/mempool.c
    :export:
 
+.. _dma_pools:
+
 DMA pools
 =========
 
-- 
2.49.0

