Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8D3A63E4
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409018; cv=none; b=ZQ08g/GG2UwQCwX602xN5TCCDD1ABd4Bw/wBA1qfMmB/7XPJ0qF8/1cQ5sH83osT7IarO62MeO71WMDv48uhVY0B7J2qgxdLBY1cxmWC0FyZ9ZPrN2ketsCkDR1aPYZjW8usSy1WWoG+JuJTen8fVSvvb2hKEZS1HRjgpxftQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409018; c=relaxed/simple;
	bh=dzaYjfbIZZavp/S2MnKk+6oK1c7oQVF6rcvC3rrGw2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YZ5Asamq1yebjSCAUNw8t5YDlbWkMJUN0zI+pOUjPozSA50gp73EwOYE4yGAU6K6B+2nZLETjuylWF0jDeKhmXYCuISBP+ov+n4/XSclcFD+s8+5NNmJBj541IPlKMogMnl+XLRu4QdPO1TllUOXlYy20aK+j2QZEqtUp8KGClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P/Hf0UZx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P/Hf0UZx"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso196655e9.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768409015; x=1769013815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lp9W32Kped56Je6lvPD7Xlxv6Ozf5Aka/rllxnPof5w=;
        b=P/Hf0UZxSUrFsPl2uLiWbu78LsSUl9fAKysbjchf4cfdZXi5sYyG/CmFj3wO3swjps
         6FP/x3iqLcWAQr3vPZa5rKZXL4siCXZ+LSPpB5z49PSUES77zKJGfnDf74iylfHJaPgU
         NawlIIaN8qpnFdAwaFZ4aBzIr7BnHp8CO7+oBVBGf3uls5LHU03guXHOPzkg1j1FfiYw
         J7goX9e1SVOBPricoMDenmAW5JXpC4f55WFzBL81mfjSyjp+LsbkKZQbRYaoZKBzkz74
         5+1omG5WkndYeDNvY3urlGdvjE2IZ7zrbkFB12Oa3iVhLI6JwK5XajJy+v7POOTeWOoZ
         xFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409015; x=1769013815;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lp9W32Kped56Je6lvPD7Xlxv6Ozf5Aka/rllxnPof5w=;
        b=S4I0h9P5WxPrpYXFsm41APMddoVBZiTID+ODJJ3eS/LIQ/kZmXXDdOlftNEjjcGvcK
         z8PWdy7qO7BrfyTXdTVg3uaT5AT0Cdg7+tTWRq3yvbs/AHkd6Gh17hISoazu1X1y/dpB
         C6B/ohDVzwk0k+GRGVlRWhtjz+rm2jXcYeL4plY0ezIcDCi/Ru1RsJpnnyNurcbyF3we
         FHQgf7FYNs+DICo3WVM+yg1GzFpz41NCm4NTiD8CgE17BaD3DkVaDGZjoIFQor2WmsVG
         QYevBlu7y1c/nKRM3dei3Z1dnjmRGVkcT7bNdXU0Z9gKGT0fLy1YH7s+KDxPOdvtw9h7
         oBKw==
X-Forwarded-Encrypted: i=1; AJvYcCUwemw4ZLfFeUS1rYjDV8UYpXqmYos8yWaDXJSt9ybPyBf5Ddb5PVBb1kS9BJmjrQSldFzJKfAoVPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92ezrMGt+BefFPzwyO4+8Oa+A0LNU6cXoARS0mGCuLmG5Hba0
	fh/eoSsKXH3LEklTN0Sd6kQgaV841dP4PIFFJyxMatZ76Or/XamHKMiCKgpvNBYMZ/2fXV/DWuH
	ZRxcIi7LYkgA9Hg==
X-Received: from wmbd23.prod.google.com ([2002:a05:600c:58d7:b0:477:9654:b44c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5285:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47ee32e0be0mr36180785e9.1.1768409014935;
 Wed, 14 Jan 2026 08:43:34 -0800 (PST)
Date: Wed, 14 Jan 2026 16:43:22 +0000
In-Reply-To: <20260114164322.787125-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260114164322.787125-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260114164322.787125-6-smostafa@google.com>
Subject: [PATCH v7 5/5] iommu: debug-pagealloc: Check mapped/unmapped kernel memory
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Mostafa Saleh <smostafa@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now, as the page_ext holds count of IOMMU mappings, we can use it to
assert that any page allocated/freed is indeed not in the IOMMU.

The sanitizer doesn=E2=80=99t protect against mapping/unmapping during this
period. However, that=E2=80=99s less harmful as the page is not used by the
kernel.

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 23 +++++++++++++++++++++++
 include/linux/iommu-debug-pagealloc.h | 14 ++++++++++++++
 include/linux/mm.h                    |  5 +++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-de=
bug-pagealloc.c
index 3ce3385588b2..a283b5dbe26f 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -9,6 +9,7 @@
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kernel.h>
 #include <linux/page_ext.h>
+#include <linux/page_owner.h>
=20
 #include "iommu-priv.h"
=20
@@ -75,6 +76,28 @@ static size_t iommu_debug_page_size(struct iommu_domain =
*domain)
 	return 1UL << __ffs(domain->pgsize_bitmap);
 }
=20
+static bool iommu_debug_page_count(const struct page *page)
+{
+	unsigned int ref;
+	struct page_ext *page_ext =3D page_ext_get(page);
+	struct iommu_debug_metadata *d =3D get_iommu_data(page_ext);
+
+	ref =3D atomic_read(&d->ref);
+	page_ext_put(page_ext);
+	return ref !=3D 0;
+}
+
+void __iommu_debug_check_unmapped(const struct page *page, int numpages)
+{
+	while (numpages--) {
+		if (WARN_ON(iommu_debug_page_count(page))) {
+			pr_warn("iommu: Detected page leak!\n");
+			dump_page_owner(page);
+		}
+		page++;
+	}
+}
+
 void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size=
_t size)
 {
 	size_t off, end;
diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-de=
bug-pagealloc.h
index a439d6815ca1..46c3c1f70150 100644
--- a/include/linux/iommu-debug-pagealloc.h
+++ b/include/linux/iommu-debug-pagealloc.h
@@ -13,6 +13,20 @@ DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
=20
 extern struct page_ext_operations page_iommu_debug_ops;
=20
+void __iommu_debug_check_unmapped(const struct page *page, int numpages);
+
+static inline void iommu_debug_check_unmapped(const struct page *page, int=
 numpages)
+{
+	if (static_branch_unlikely(&iommu_debug_initialized))
+		__iommu_debug_check_unmapped(page, numpages);
+}
+
+#else
+static inline void iommu_debug_check_unmapped(const struct page *page,
+					      int numpages)
+{
+}
+
 #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
=20
 #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6f959d8ca4b4..32205d2a24b2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -36,6 +36,7 @@
 #include <linux/rcuwait.h>
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
+#include <linux/iommu-debug-pagealloc.h>
=20
 struct mempolicy;
 struct anon_vma;
@@ -4133,12 +4134,16 @@ extern void __kernel_map_pages(struct page *page, i=
nt numpages, int enable);
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static inline void debug_pagealloc_map_pages(struct page *page, int numpag=
es)
 {
+	iommu_debug_check_unmapped(page, numpages);
+
 	if (debug_pagealloc_enabled_static())
 		__kernel_map_pages(page, numpages, 1);
 }
=20
 static inline void debug_pagealloc_unmap_pages(struct page *page, int nump=
ages)
 {
+	iommu_debug_check_unmapped(page, numpages);
+
 	if (debug_pagealloc_enabled_static())
 		__kernel_map_pages(page, numpages, 0);
 }
--=20
2.52.0.457.g6b5491de43-goog

