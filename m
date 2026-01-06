Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA6331206
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716537; cv=none; b=nT+Om2EFds5w92aZlkYMzlzUhBQpgZGPSCM9194G1sIS0SFmzLymM0qHP4ee/5ykTuckh/tdLlDmLD2DD/kC+Qr9qa78BgTftwaoDV9rSLHHC5vyL5AyvVb0Jr/JK+sqNebFjLvgfDBCP/U/YrW3K0Q/I4rFfRLTmM0cUQzqmaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716537; c=relaxed/simple;
	bh=5InwaW+ltmBMP59PvN83ke1/4IxUcekoo1u8qB7OebI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z65J7oqxXddUPFuRfJBvrKEPhdozJ69eR4bTXwaBdkHPoO3LYLGSJg3lyY+rbmC0cXERE6mfZ2PLC8IEScpYoEmujEp/Ee/6WCwtYnul8Bdlv7N2IzlfZG5m/zLx9Fa0TEAeNoNboVmV8jJFxAQi+tVj26GshTCxVGYy2J9qrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WO436d98; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WO436d98"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4325cc15176so566457f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 08:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767716532; x=1768321332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkB0OPkib0nA6oaGKP1dgUq2paM+wkefemX2KuvLm1c=;
        b=WO436d98B/6rzgZFPefOJpSDFwqPmlDlaUcYK+wGYzqPNc0qqv8l74YiHjVTC+vaFX
         03nCZRGwrmd0OkUP33qhJ3w/ZLmii5fb6wMOyHruCSkMO/bW2HisDAH+S0K2cdNBa2PA
         OVtguu3NqCYzYDFG0gMwKB8g3No632+/LcIlnwuNPBHcRqql7UALMW+hfVfvJlSadHul
         cDdLxGulGUtP4ys1uph76a9KIZTi/JQpun5XIBZ8XZjGSS44DMSZk9eVW8AZTWOWdOBR
         P8iF2Po1RprxlpBXvPfVSJt8wYusH8aejIb8rixxQwBnI9lvCpbNyIxui0AWyHcD2dl1
         vxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716532; x=1768321332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkB0OPkib0nA6oaGKP1dgUq2paM+wkefemX2KuvLm1c=;
        b=L5PTNGZDLRvkDLdsR3fwIDAZXz6czwuUzSNkGk09EZ/4pxi21dspriv+dM5jwo/EJc
         kLoxNqoHaFaTeNngHTAMSqFVJjA6U8L3G3RYHKQ0elIBjVQqukoV8mGWm2dRFUQKYMg8
         ic5DGA1xzaO4nYDH4E8ArkIkHH4OTjZhYn7CIY32mEAnG/7Ln5/tiFEcDiTqCzMn5g7W
         Zlfs6vSy+wtvvFky5n3qyoAYy7mclRduG6+ITJ/yWR8zElDEXNsMyKWgtMM6J0tl033f
         rTaFiGvgvUfrpDb73d9YwoMd/6cshhdQIcFqfH19P/H6cAutm5XJgpI2J+mdqaPQvRbi
         rV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpXXpY6kVDOCaxV9B/Upj2G0vTXNAzQpYpP3Wd+BEDq5RMv4GAM9/tq/y1PjlkjSXiDChkAo82LYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5o+7cobQ1LxTbJurNeFdxQ3riWb2oQxS78KlQG8v4Ofnn0p6
	bCri+DS4tsJMJRbULls9QTiXclsdZ4c1m8px0wcfwWSqeBNZ/mftHJhD+ZmcNQvlCjZcFEf4uJX
	0lj7BBdRFwO6MjQ==
X-Google-Smtp-Source: AGHT+IFQc8/Ih6tMLdszCIxSM7So3dMycZRLhJrz2no7PbcgYmWCWwIwp4Op4ZOQgvLHVVNUlH9GZoqjW7mvIg==
X-Received: from wrbgv17.prod.google.com ([2002:a05:6000:4611:b0:430:f5d7:f015])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c3:b0:42f:b707:56e6 with SMTP id ffacd0b85a97d-432bca45aabmr3978012f8f.34.1767716531688;
 Tue, 06 Jan 2026 08:22:11 -0800 (PST)
Date: Tue,  6 Jan 2026 16:21:59 +0000
In-Reply-To: <20260106162200.2223655-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106162200.2223655-4-smostafa@google.com>
Subject: [PATCH v5 3/4] iommu: debug-pagealloc: Track IOMMU pages
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

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index 1d343421da98..86ccb310a4a8 100644
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
2.52.0.351.gbe84eed79e-goog

