Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380BB34BA46
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447216; cv=none; b=HMDDucryQuTaz3clYU0yyE5wx69F276Ua4iMAYCg+Wjrqcifh8OSlH75ZpK6m/j1FzrjHkzjv0HKiz/HswjxsBfLBjVFHhBldZVwMr5Ra52gpwT40jnPmrLO4JTnry7XMzQuocBU7H5MW5v4slHfFB926LirCiHYeL9at3h5s+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447216; c=relaxed/simple;
	bh=QPnuTeoHkJAdsy3GLHh3OinUFPR46uTzV5UBwbwi06c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VQ84w/BDbuQ9TGk+awPrJjHuX5M6RrRsJxgfnaknPGg8OKVXyPpGiGHQRCIdgx4iX1c1JRQKoly5+E+aGTqjSw9GS+gHMsPpFtuQaYqFhxoWYTwncLycvC2XPl62L4+TNUKoJD6zCcWu3tlJYzt7bn8t6OKKKFcXt5ESVE6+Mo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k3WylvHt; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k3WylvHt"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429c76c8a1bso868291f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 08:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762447212; x=1763052012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NM/GZbyZiL8bh5z49/8PTeWfbgNSwSL55H6jI2E+lmQ=;
        b=k3WylvHth50gK6qApAeHkMJsGWajNky8dUpWySaoNpFfHI1c87KNlb6NqJqH/qO22q
         fEH2hziWn1rIzGcSi37TvguDB0dp4dVQdo/VjlnK+xHDKT7hRJhjgG6uq3+L1iSSTDT3
         L1yy5UksmzIIgMxXPirJvMZkPTEVwqZQIYTyGAd0ryveWarhmdOUxQ8vUZwO7qXWMbzS
         7UNKMEdJ+IefjJSh+UiQuyT962HOePlcP12VKOsn0jigriqeW8zQ32oSRxGlJNLu+QSO
         /511l4eQNRGKr/eT0UcML+jV2OP8k3dOOUiT5dELd/1cDN9ki5ZN4JFne6yJOG8t2xD5
         PRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447212; x=1763052012;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NM/GZbyZiL8bh5z49/8PTeWfbgNSwSL55H6jI2E+lmQ=;
        b=hifNqIv3WGdRp/gZS6whuT21WapEJjuwLhvhLGlti7Mi0FJcslb1SaRtj3JbtIihhf
         uG3VkcR9N0oCzfHxx4uoWcpxnS9geriLq5nfcODvAEor4iQwB7eSSDHoFDE46iOr30vM
         zWB20TaSfbZaW3H+biWLuQGjFuNQ386Ns/UPgVtn7Mq4sJAyN0Drw+Uf/NX8rUmofXho
         xnZ5WfNNAG99vUmRyPvJ/5DJsXy4ncVAXYWlalOAAxydnq8aEpiobvklkobDvLo6AVLQ
         RuXHceDuhUlRBCwl55c/aceFp85xnL1JtSNbwkGdllEe8EWApX9QBFKO7wHDbaSybYc0
         BYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVwAaCi4TA6tS/qEbXglwUdSnin6+1Z+JENjH+YzLR+PntZ5PN55moHL5pcx5UMlShfCpowxWs7U8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFL5AGHzQcToenSs5b7WNEdjiuwN4oQ4MBK6Htl9zCd79rVQ5D
	6CuyQND771xwp6iBpXoS18cGyLAUnZ/Z2wUG7hd8csK6NxzzITdQvKEvYlS6zMQQOI5opEPDCl9
	qBRrl1a/AOoKNOQ==
X-Google-Smtp-Source: AGHT+IFXE6Qsd8iIgYNiQDlI0sqI8FtMmoIupsqXvZU2YQ+mpshBBiH57cinC3fDVEftkTGmawxtksFJp1JKIw==
X-Received: from wrsy17.prod.google.com ([2002:a5d:4ad1:0:b0:429:dc18:dd64])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f87:0:b0:429:b7cd:47ff with SMTP id ffacd0b85a97d-429e33083c8mr6867222f8f.40.1762447212631;
 Thu, 06 Nov 2025 08:40:12 -0800 (PST)
Date: Thu,  6 Nov 2025 16:39:53 +0000
In-Reply-To: <20251106163953.1971067-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251106163953.1971067-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.2.1026.g39e6a42477-goog
Message-ID: <20251106163953.1971067-5-smostafa@google.com>
Subject: [PATCH v2 4/4] drivers/iommu-debug-pagealloc: Check mapped/unmapped
 kernel memory
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	Mostafa Saleh <smostafa@google.com>, Qinxin Xia <xiaqinxin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now, as the page_ext holds count of IOMMU mappings, we can use it to
assert that any page allocated/freed is indeed not in the IOMMU.

The sanitizer doesn=E2=80=99t protect against mapping/unmapping during this
period. However, that=E2=80=99s less harmful as the page is not used by the
kernel.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 19 +++++++++++++++++++
 include/linux/iommu-debug-pagealloc.h | 12 ++++++++++++
 include/linux/mm.h                    |  5 +++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-de=
bug-pagealloc.c
index 0e14104b971c..5b26c84d3a0e 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -71,6 +71,25 @@ static size_t iommu_debug_page_size(struct iommu_domain =
*domain)
 	return 1UL << __ffs(domain->pgsize_bitmap);
 }
=20
+static unsigned int iommu_debug_page_count(unsigned long phys)
+{
+	unsigned int ref;
+	struct page_ext *page_ext =3D get_iommu_page_ext(phys);
+	struct iommu_debug_metadate *d =3D get_iommu_data(page_ext);
+
+	ref =3D atomic_read(&d->ref);
+	page_ext_put(page_ext);
+	return ref;
+}
+
+void __iommu_debug_check_unmapped(const struct page *page, int numpages)
+{
+	while (numpages--) {
+		WARN_ON(iommu_debug_page_count(page_to_phys(page)));
+		page++;
+	}
+}
+
 void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size=
_t size)
 {
 	size_t off;
diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-de=
bug-pagealloc.h
index 180446d6d86f..84110e4ecfaa 100644
--- a/include/linux/iommu-debug-pagealloc.h
+++ b/include/linux/iommu-debug-pagealloc.h
@@ -22,6 +22,7 @@ void __iommu_debug_unmap(struct iommu_domain *domain, uns=
igned long iova,
 			 size_t size);
 void __iommu_debug_remap(struct iommu_domain *domain, unsigned long iova,
 			 size_t size);
+void __iommu_debug_check_unmapped(const struct page *page, int numpages);
=20
 static inline void iommu_debug_map(struct iommu_domain *domain,
 				   phys_addr_t phys, size_t size)
@@ -44,6 +45,12 @@ static inline void iommu_debug_remap(struct iommu_domain=
 *domain,
 		__iommu_debug_remap(domain, iova, size);
 }
=20
+static inline void iommu_debug_check_unmapped(const struct page *page, int=
 numpages)
+{
+	if (static_branch_unlikely(&iommu_debug_initialized))
+		__iommu_debug_check_unmapped(page, numpages);
+}
+
 void iommu_debug_init(void);
=20
 #else
@@ -66,6 +73,11 @@ static inline void iommu_debug_init(void)
 {
 }
=20
+static inline void iommu_debug_check_unmapped(const struct page *page,
+					      int numpages)
+{
+}
+
 #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
=20
 #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32..895a60a49120 100644
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
@@ -3811,12 +3812,16 @@ extern void __kernel_map_pages(struct page *page, i=
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
2.51.2.1026.g39e6a42477-goog

