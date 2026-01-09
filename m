Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2B33659EC
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979100; cv=none; b=HtfagZoHnyAIXozDuPARoTG7d6kfuzrEgeyg4O0vIb2UCDG3K7Y/ugK5ZZ+YXePevATeAVdFcagfxstBGZ2ubbtBVqd+3wKAy9Im852WH8D6onP92/To+6OJo05NUpne8L5aSAMb7gKDiTcim3oZG9fpaC+ld8zi21PEcq8Wh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979100; c=relaxed/simple;
	bh=JyxK9DCFit9BHgUZF8EAQgzBS/s8P5HYnNwnkPHg5Qw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JipRjY/XcrknQ6hIN+LJkLELtHFie5WZ541vBY+nxKykbtKUze0rgTTgsExpzaZNbe9qhnUiAV7+zK7XyoH3tS7nPWZndSqgeTYpLmn9XKgOvlXnNsSjtMiDpRD8ZaIWhC2ldfidX0dOKtQvSFfJtnlWDyc//ZFwgpCF8ToeX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NO60K8eD; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NO60K8eD"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3ba3a49cso39361315e9.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767979095; x=1768583895; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXKfhlVn2c+6UG0/zcj6FymOVg8M3bXQ+ReLnrZOk7w=;
        b=NO60K8eDiYauSb6F/GQlh/r3oOId3xgHGH71dzI80JnI4d7SgrnuXYeL+RQG9bmILd
         0mnoZzuwemwifme8xo0ZzVGxh0UiDfeIcdAhan6G4meQSMPWcIW7513HAXCS8Vuy/LAz
         A9hKZuW6AxSkc0UUtg4q5W70LIfNdTmXhEsyaChZ2Cxa1A/c4o1e/ROpJGG7L3lR3fGh
         XZ83lpfW60qqLkKic9VCqNfy6FQXploEvk0n1T8mtDnrOuRP+86S2n+W/NA2IQPjzXjQ
         fdoJOC/Sw9dk53Ase2a+8GZvUrSK+BJCuMf0/JpADKFaJGXQwPUHGksAB+1P3LM/n/Wt
         r+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979095; x=1768583895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXKfhlVn2c+6UG0/zcj6FymOVg8M3bXQ+ReLnrZOk7w=;
        b=iUgc0suo0WXpfvPahn3BcVlMH9foB24clqBf6MBjwsAVAI/aA4DY9kGbIZPGsHHpiv
         /MCQEBqIqCuM3oGH+6jTwCsLk9b2T/6QyTzSXf+oecTg1BIELwUDfVBnGN9c4NSR3V6K
         xIa/6omqtsJRQzRe3aXOQkUQSEzLieg798ZxMFezE59pRfM4uVk5hjppn1/0Pzs6DslE
         TA+AGhJ3uJOXbhKtUi7o3kd4ILrHL27MTRvXZjpz0dEDz0XMBDvqJZvKND6c0kxgq8qf
         hl17eIovJqJpxoceQXOWWBgFQPJC/RYFQdhRtErOEzrjHsZZQzRHuJqz1ekrgm5yo5wP
         cgxA==
X-Forwarded-Encrypted: i=1; AJvYcCVhuU0n6pkecKX/x3cCpPllhMp8g7GOLoSwb7MdX8F8I5JqFu8Wc0M3yXKQPS0thj2Wvk0vatHOnns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGLUwAz2qhl7h6P+Oo44VexDn2Npc7EGrjP/qWhotMXbTqAQzf
	ZZAu7Ngq/MOFiJO7JBq5e/V1V2mVpQc2owGHMRlx1TkT14hSSN+lUoN7pR+E6CXTvWSfr3A+LwU
	XKHNCU4gkoH9MgQ==
X-Google-Smtp-Source: AGHT+IFk02O2PK0We+1RMI+gkP8sH7Gfm0sE0Pyah5F14OonFiV3bx+oHBAF9FOQ2GaQcAwCLdJfSABlkCnRwQ==
X-Received: from wmbdx10.prod.google.com ([2002:a05:600c:63ca:b0:477:3fdf:4c24])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c4:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-47d84b18ef7mr134197875e9.10.1767979095241;
 Fri, 09 Jan 2026 09:18:15 -0800 (PST)
Date: Fri,  9 Jan 2026 17:18:04 +0000
In-Reply-To: <20260109171805.901995-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260109171805.901995-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109171805.901995-4-smostafa@google.com>
Subject: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Mostafa Saleh <smostafa@google.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Using the new calls, use an atomic refcount to track how many times
a page is mapped in any of the IOMMUs.

For unmap we need to use iova_to_phys() to get the physical address
of the pages.

We use the smallest supported page size as the granularity of tracking
per domain.
This is important as it is possible to map pages and unmap them with
larger sizes (as in map_sg()) cases.

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index 1d343421da98..9eb49e1230ee 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -29,19 +29,103 @@ struct page_ext_operations page_iommu_debug_ops = {
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
+ * IOMMU page size doesn't have to match the CPU page size. So, we use
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
+	if ((unmapped == size) || WARN_ON_ONCE(unmapped > size))
+		return;
+
+	/* If unmap failed, re-increment the refcount. */
+	__iommu_debug_update_iova(domain, iova + unmapped,
+				  size - unmapped, true);
 }
 
 void iommu_debug_init(void)
-- 
2.52.0.457.g6b5491de43-goog

