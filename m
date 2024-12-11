Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63C1F237B
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 21:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952043; cv=none; b=hQer4zcmJI/cQ0zo3QSVngFRemmI36ZeXiiDfhNSRGMq2NT38v/uXNPik9IHi0yZNqSozVPB+Bvnzq3VhuJB8ybjATqIlX7TGjZkYqKSoCPLQxEwk2X6mji6mz7dU31CfroC+H1ROJOo8OoJrO2cUdJLxr7CMIyfznff6FJELt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952043; c=relaxed/simple;
	bh=2jfORmA3BpQKqPymRv0Q7ztYndICOlLeutvP3frs5fM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z0Pq/bMTa0TWijBTo9u7HFQTKO94cv13hHcJ7enIPf0BBlSy/5FMiiA5PtP8n1FHsanyuLXeIHj5bDnYEBO7T/KjOASZMDiJVGJOltRFBMt33H68TRE7Kr22ZREyxo9vBnFbFpccuTD90JCnHB8b4tpHIG4K/Aw+xe9FKNe1XW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QpUrHs82; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QpUrHs82"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso3853281a91.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 13:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733952041; x=1734556841; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FM/slA5nw2rdy331TOQTDkUyJFKnKJSONZ98aa2Mh9o=;
        b=QpUrHs82Lfzkpb4bh88YPonXIc2OHBMG7p1aAmHjJxaC8xraR+Uu6zD9S74AW32u0u
         xq5RfJnyXaY7RJRGiuvddTtGfkm57hGOvXrxaCXl7HTHN3IDVUB8ldPyA56t9Y8xCpSp
         2sT6xAfGWseL7D7FCfZxo0UJI6ymhSIly1+y3DeG+8RotVdydKj4fic4efHv5K8y3ZmU
         lQmC2uAwxpGGbWMoi+7K5lPdffYFAzvevUpoy949QgccEHhthS2+F2QC/988h+4Zqrsy
         Kq/K22bE1Yd7bgaNo0wwJW9u6svSrZf0wcXcB9htD9vlByVbUG4GLs6EdscKgkKW0kGO
         8/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733952041; x=1734556841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FM/slA5nw2rdy331TOQTDkUyJFKnKJSONZ98aa2Mh9o=;
        b=bjk3qeNm94xiA78F5c5zQolP5O9yN98J7Hb9jqh78xPPK8GA9YhHYLpuYg8Aega7nx
         9QdXba9Ms7viiAh8FwongIlEny5ndCF1zFcNMUz+/dxObUa4HCx36hWsSjwjzDGu0530
         2s8fPByQEa11acJYUEJK7GVSN/7WDR0LtUqZgZMF/SF2JYf6EKOD/4odNG1WWNcRacMh
         X7wQ/94yKUSBQwtoaeBgOuI8AC5Qc+r6TbSt4EECU14BDjdmWhaiAcBRgp3T4FxF5Amm
         Gi7/M6OslfbxHB0wtokdhhp/cUXI1bI4noC7t6lwxJx3Dsa8yOX7FWh6xVCu/qTdLpRo
         WSow==
X-Forwarded-Encrypted: i=1; AJvYcCX6y4xu1Co34OtRGJajvfGjXa6sQljBQvLwJmtME9obLMk1yFJRujtcUtHy9GvKt7A1+LVnOdJ4Zxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnA4nrVLG/5Jpokfgm79lPirSihsyeZ++PwsSOnbb9D/SHYZSH
	/dDuYGaWNMsqOmLQOz321Ioa5J/gtlMMtGmhU+zqYiH3dkYbuOYsbtKkLwT1/hGg2NvLU1qfu2W
	tYE9lKmgIPJ7i4hBXcex6jA==
X-Google-Smtp-Source: AGHT+IFKGSYNgoQ2YviqqfiKTGp9vrd+/ZJrCWTHUKyr11+B2AR5/fODajQoxs0yxpOTuQOugTCOlKnFKeu/B0rvlA==
X-Received: from pjbtb5.prod.google.com ([2002:a17:90b:53c5:b0:2ea:7d73:294e])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b50:b0:2ee:9a82:5a93 with SMTP id 98e67ed59e1d1-2f127fbd84dmr7212398a91.14.1733952041202;
 Wed, 11 Dec 2024 13:20:41 -0800 (PST)
Date: Wed, 11 Dec 2024 21:20:31 +0000
In-Reply-To: <20241211212033.1684197-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211212033.1684197-1-almasrymina@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211212033.1684197-5-almasrymina@google.com>
Subject: [PATCH net-next v4 4/5] page_pool: disable sync for cpu for dmabuf
 memory provider
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

dmabuf dma-addresses should not be dma_sync'd for CPU/device. Typically
its the driver responsibility to dma_sync for CPU, but the driver should
not dma_sync for CPU if the netmem is actually coming from a dmabuf
memory provider.

The page_pool already exposes a helper for dma_sync_for_cpu:
page_pool_dma_sync_for_cpu. Upgrade this existing helper to handle
netmem, and have it skip dma_sync if the memory is from a dmabuf memory
provider. Drivers should migrate to using this helper when adding
support for netmem.

Also minimize the impact on the dma syncing performance for pages. Special
case the dma-sync path for pages to not go through the overhead checks
for dma-syncing and conversion to netmem.

Cc: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v4:
- Special case pages to reduce perf overhead (Jakub)
- Add page_pool flag to set dma syncing for cpu (Jakub)

---
 include/net/page_pool/helpers.h | 35 ++++++++++++++++++++++++++++-----
 include/net/page_pool/types.h   |  3 ++-
 net/core/devmem.c               |  1 +
 net/core/page_pool.c            |  1 +
 4 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 95af7f0b029e..e555921e5233 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -422,7 +422,21 @@ static inline dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
  */
 static inline dma_addr_t page_pool_get_dma_addr(const struct page *page)
 {
-	return page_pool_get_dma_addr_netmem(page_to_netmem((struct page *)page));
+	dma_addr_t ret = page->dma_addr;
+
+	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
+		ret <<= PAGE_SHIFT;
+
+	return ret;
+}
+
+static inline void __page_pool_dma_sync_for_cpu(const struct page_pool *pool,
+						const dma_addr_t dma_addr,
+						u32 offset, u32 dma_sync_size)
+{
+	dma_sync_single_range_for_cpu(pool->p.dev, dma_addr,
+				      offset + pool->p.offset, dma_sync_size,
+				      page_pool_get_dma_dir(pool));
 }
 
 /**
@@ -441,10 +455,21 @@ static inline void page_pool_dma_sync_for_cpu(const struct page_pool *pool,
 					      const struct page *page,
 					      u32 offset, u32 dma_sync_size)
 {
-	dma_sync_single_range_for_cpu(pool->p.dev,
-				      page_pool_get_dma_addr(page),
-				      offset + pool->p.offset, dma_sync_size,
-				      page_pool_get_dma_dir(pool));
+	__page_pool_dma_sync_for_cpu(pool, page_pool_get_dma_addr(page), offset,
+				     dma_sync_size);
+}
+
+static inline void
+page_pool_dma_sync_netmem_for_cpu(const struct page_pool *pool,
+				  const netmem_ref netmem, u32 offset,
+				  u32 dma_sync_size)
+{
+	if (!pool->dma_sync_for_cpu)
+		return;
+
+	__page_pool_dma_sync_for_cpu(pool,
+				     page_pool_get_dma_addr_netmem(netmem),
+				     offset, dma_sync_size);
 }
 
 static inline bool page_pool_put(struct page_pool *pool)
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index bd1170e16cff..6ae003d3647c 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -164,7 +164,8 @@ struct page_pool {
 
 	bool has_init_callback:1;	/* slow::init_callback is set */
 	bool dma_map:1;			/* Perform DMA mapping */
-	bool dma_sync:1;		/* Perform DMA sync */
+	bool dma_sync:1;		/* Perform DMA sync for device */
+	bool dma_sync_for_cpu:1;	/* Perform DMA sync for cpu */
 #ifdef CONFIG_PAGE_POOL_STATS
 	bool system:1;			/* This is a global percpu pool */
 #endif
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 3ebdeed2bf18..0b6ed7525b22 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -335,6 +335,7 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
 	 * dma_sync_for_cpu/device. Force disable dma_sync.
 	 */
 	pool->dma_sync = false;
+	pool->dma_sync_for_cpu = false;
 
 	if (pool->p.order != 0)
 		return -E2BIG;
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 060450082342..51b8264de74a 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -201,6 +201,7 @@ static int page_pool_init(struct page_pool *pool,
 	memcpy(&pool->slow, &params->slow, sizeof(pool->slow));
 
 	pool->cpuid = cpuid;
+	pool->dma_sync_for_cpu = true;
 
 	/* Validate only known flags were used */
 	if (pool->slow.flags & ~PP_FLAG_ALL)
-- 
2.47.0.338.g60cca15819-goog

