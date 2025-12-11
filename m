Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1EF3126DF
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457980; cv=none; b=JALzJektDDulIO5me/xgpxETCQQ+bNlC8KOQvb6rPw+5oSG+Iy3jTxDwBbLWhu9zsmGMwgMteQAzCdY6vk4tFCxU04zpu6/08WvyLLb5KTqIvCxRlUy9oJ/O9+G9/48gxDmPK+c6jNgsEyQJMvoYkkjgifjXw5RnYKD0Vbk1muw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457980; c=relaxed/simple;
	bh=VCIDEHcBDKXrPII8rmrru2UH/2SzH06NLiPDOJeAw3Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IfgCTJAIW8ETB7rkawN/uDqgi3xDh+jbr72Aye+g++/HjpNJv8bJjkRsHIHa8ev587+OkfGXxqXGWKr+Uc0ZCdWVyZEDqZVAs0fsB44P5ojc1xnw2G6kuuQ2vYodBUmyfkMfGHqWTV1NRF9MzFiuJb6hPhyRFH6cNUN+Rq/dFIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eUGpia4n; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUGpia4n"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2f79759bso38804f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765457977; x=1766062777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4W3L7Gncmv3IAVELs7REX8BF9wWmgyedLiyQWjFe18U=;
        b=eUGpia4n57r/D15rdrJLmcYge7wGJHlqqXxo00+Fful0yla+iTMGaSyQxR1zKXmE1h
         MfcyY/frjOcA8emhX15UF1dOunhWAPoTreIMmnt8WWAExsSp18lFNayFbjiTWvhd4F8O
         e7NmocYKeU23FOgI1PzDREpnzdOSf1BYLvsHxOrcdj/b5grXs1fCPDxfFAUFj9LJT6TX
         4mrvTzjxo+gRsd292YK8cRe7wBF3Q/8M1j5GyuEz2Qu+zEWzG9MB73IleoNk8pcnNP5/
         LtRx7JOeGLVz6CaxiDZNAuZvv4l2avOr9uFiwbQo1Goe6c1KtfCE1LibTGAfQuB+s2Av
         RrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457977; x=1766062777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4W3L7Gncmv3IAVELs7REX8BF9wWmgyedLiyQWjFe18U=;
        b=FjgbApAJ8qen4PRuFiE2+9x4nB0m7J3HAXJF1AanojjV30FHb2hkZrX5lxOIRGW+sD
         3Vw/FyXDWTC5h0TGPPBZx92t5fVg4cLJF+ityuj9m5tdbnPS5KQxalPbySEBpOquv89z
         c3sN/DYV0Cb8r57opAJ5Ebp5Hug4QkG+dJTCtP7B62nvL46jo2ZbX44o3Kak/2zrrEs9
         PTub1Uy2udfM3l/4LuSOhhMF3P5XmgoegfKqdlmqJ3pKpvYypsI2ELldI4hTn2dtFg4K
         MoCPmrYW3pYcvjSLAQhFZe9vIDNLYJfg6m9vzMt+7HKR639Hxf/Qb4FsSrfRH8X8pyZx
         kTqg==
X-Forwarded-Encrypted: i=1; AJvYcCUSx+ngRy5b8YNokgyxop/bP/prTe2VBnFPVKMDsRQK04V5KCgC2+3pnzEQZqqA4dLv8wCNoTjJw6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwluMfMHb6fJ9Z1ouV1AMKwzhLL4Oh8YPLT7OoMjFh4PJbqZ5pi
	0eMGc6TfybmGnBAiZhSay3tf9biJPkNJOpgwfqnzBLSsUqNzuocU9lDB1zYQDyb0EOzXnsKloJy
	xsMXozpY3CYLNyg==
X-Google-Smtp-Source: AGHT+IGT9KfwHQf97dyte1BqZ2MoVgI51JA3s7OwveB26iyIwRb9n5NdLB5eerBZ7imEENFZ9FQDui0qZLsYyA==
X-Received: from wrsb10.prod.google.com ([2002:a5d:45ca:0:b0:42b:5422:4add])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c10:b0:42b:4061:241d with SMTP id ffacd0b85a97d-42fa3b137dbmr6252217f8f.59.1765457976998;
 Thu, 11 Dec 2025 04:59:36 -0800 (PST)
Date: Thu, 11 Dec 2025 12:59:27 +0000
In-Reply-To: <20251211125928.3258905-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251211125928.3258905-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211125928.3258905-4-smostafa@google.com>
Subject: [PATCH v4 3/4] iommu: debug-pagealloc: Track IOMMU pages
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Using the new calls, use an atomic refcount to track how many times
a page is mapped in any of the IOMMUs.

For unmap we need to use iova_to_phys() to get the physical address
of the pages.

We use the smallest supported page size as the granularity of tracking
per domain.
This is important as it is possible to map pages and unmap them with
larger sizes (as in map_sg()) cases.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index 1d343421da98..4639cf9518e6 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -29,19 +29,110 @@ struct page_ext_operations page_iommu_debug_ops = {
 	.need = need_iommu_debug,
 };
 
+static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
+{
+	struct page *page = phys_to_page(phys);
+	struct page_ext *page_ext = page_ext_get(page);
+
+	return page_ext;
+}
+
+static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page_ext)
+{
+	return page_ext_data(page_ext, &page_iommu_debug_ops);
+}
+
+static void iommu_debug_inc_page(phys_addr_t phys)
+{
+	struct page_ext *page_ext = get_iommu_page_ext(phys);
+	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
+
+	WARN_ON(atomic_inc_return_relaxed(&d->ref) <= 0);
+	page_ext_put(page_ext);
+}
+
+static void iommu_debug_dec_page(phys_addr_t phys)
+{
+	struct page_ext *page_ext = get_iommu_page_ext(phys);
+	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
+
+	WARN_ON(atomic_dec_return_relaxed(&d->ref) < 0);
+	page_ext_put(page_ext);
+}
+
+/*
+ * IOMMU page size doesn't have tomatch the CPU page size. So, we use
+ * the smallest IOMMU page size to refcount the pages in the vmemmap.
+ * That is important as both map and unmap has to use the same page size
+ * to update the refcount to avoid double counting the same page.
+ * And as we can't know from iommu_unmap() what was the original page size
+ * used for map, we just use the minimum supported one for both.
+ */
+static size_t iommu_debug_page_size(struct iommu_domain *domain)
+{
+	return 1UL << __ffs(domain->pgsize_bitmap);
+}
+
 void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
 {
+	size_t off, end;
+	size_t page_size = iommu_debug_page_size(domain);
+
+	if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
+		return;
+
+	for (off = 0 ; off < size ; off += page_size) {
+		if (!pfn_valid(__phys_to_pfn(phys + off)))
+			continue;
+		iommu_debug_inc_page(phys + off);
+	}
+}
+
+static void __iommu_debug_update_iova(struct iommu_domain *domain,
+				      unsigned long iova, size_t size, bool inc)
+{
+	size_t off, end;
+	size_t page_size = iommu_debug_page_size(domain);
+
+	if (WARN_ON(check_add_overflow(iova, size, &end)))
+		return;
+
+	for (off = 0 ; off < size ; off += page_size) {
+		phys_addr_t phys = iommu_iova_to_phys(domain, iova + off);
+
+		if (!phys || !pfn_valid(__phys_to_pfn(phys)))
+			continue;
+
+		if (inc)
+			iommu_debug_inc_page(phys);
+		else
+			iommu_debug_dec_page(phys);
+	}
 }
 
 void __iommu_debug_unmap_begin(struct iommu_domain *domain,
 			       unsigned long iova, size_t size)
 {
+	__iommu_debug_update_iova(domain, iova, size, false);
 }
 
 void __iommu_debug_unmap_end(struct iommu_domain *domain,
 			     unsigned long iova, size_t size,
 			     size_t unmapped)
 {
+	if (unmapped == size)
+		return;
+
+	/*
+	 * If unmap failed, re-increment the refcount, but if it unmapped
+	 * larger size, decrement the extra part.
+	 */
+	if (unmapped < size)
+		__iommu_debug_update_iova(domain, iova + unmapped,
+					  size - unmapped, true);
+	else
+		__iommu_debug_update_iova(domain, iova + size,
+					  unmapped - size, false);
 }
 
 void iommu_debug_init(void)
-- 
2.52.0.223.gf5cc29aaa4-goog

