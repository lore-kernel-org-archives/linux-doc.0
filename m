Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722C3126B2
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457979; cv=none; b=HlQCaC1OaiS+weZdpM66OuK5OK/doBHECq9iDPqMn0mDlD+li2COoOZWeeC9++QE/KfTyFWCu5VkkXRKPORTAhMF2z6D7CQmxC02oTcyNPueX00YfqJorSKPllikxYTil+N5D1VRO6WcOnEZdLmXlPfKccMvjH3rdo/X/uiz3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457979; c=relaxed/simple;
	bh=Fnhd8LPvd1L3p8O010INkgVX2PfErBLIoK6eJUhrlrU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rxF3Xp/i6H5gepkKJ9WOWlkbxDifR9tUXnAVYqH8Y5xdGsiXfbmS9InK7jyUr6QW8SiuoO5gqwkS81z4JKysp+kUUq9YC7Sb1a7+ub9FdP8ceaF9ErhOGXs4PcLJQI8UcghrGaPoz1EHymebPXFHy9+jlYTgUteuktYXzAHq1t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQGUlTEe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQGUlTEe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a11d9f89so261615e9.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765457976; x=1766062776; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uczD8ZdQ8fTq7m0W4DWUDtOuBgHIj4dHD70uVwXhDg0=;
        b=TQGUlTEeTDpsO9g96o5HE2WxvqOduJ4tfOCcoN6Tu803RcoJAPkxw9yXRJCb2i5Lb3
         HgvTeYZLHVt5OsrVlmYh3bmPIs43EJ2H3l3Kjh7OvJpOmfp22CHYLVaEWhlxG8Darsjd
         4w646tnccpbzWYFA2gOkHQPtfIEsDhcuJbJFfWsXL7qb9uHcN6AoJtCf6TalMWDBcu92
         mqljW+cIlreg5fHkiMGQCjgYAVWNpA9R88io/pr579a3z30dIDjcKFTDVFmD5DCXb2+X
         I/646VybXeAY3luIM5/NZRE+tsCecQCVOcM83yUK9bcRx6r/UtPJT3vwUvHg4l3Bkq6S
         FUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457976; x=1766062776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uczD8ZdQ8fTq7m0W4DWUDtOuBgHIj4dHD70uVwXhDg0=;
        b=wo8NJ9IOfMOSbbRyAE1k35REZFn/OKLoOVevP1ELpJ/7/VnT0BrI0b6UsinYEqsj8c
         5utFQYEgshPBe0YPkABpof5FVH2hYE7PHNaaQ9GUJHa8mw0SzwcndEh74z1YZw9XYyxP
         FY6NgLuX/UvTRUEabA3ucg7CQC3VHv4wwoAdWpng58Ts2iJFzWGHIErZYTtnQycFToAZ
         +hinawBHGPnTpXmIifeSqG9n5HHorUFirrZAViFedQ6m+AEcFdqCBN7M7/vu5kpjrbEY
         1/D4sxqGFrE6qpc5sz12+kAyKgQrEZlXEtdsUzrnJi0piODX5nL29bEdUvWbs87DAjCC
         OtTA==
X-Forwarded-Encrypted: i=1; AJvYcCXkTD8+v5iwcotwNjq3qC8JRgFvesRCcsLq030PoOROnkI+rEsWIJyIPCcy05e0aDPjb8EP/j9TvZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjx5zzQyvC9vLp7W4vNVVsBoPzARiA6Inyl4awNXF81IXpK30
	/lgK/dvPQDKlUqmFd1+jBQYXZ4bIiA/cyjfrodJ2XV2S9hYFND89pPs8n+Mh35ChmOy1H1qbTLB
	xEiWOf4nP0EoVxg==
X-Google-Smtp-Source: AGHT+IErtrN5I/szVaeR7W3AXMtZYGQqpX/+3kBobuXH5Exs8vXtzLzu4Ae4t9CTgNjyphsP7lVmH3aKCM1T2w==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:479:3624:3472])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6097:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-47a838065f8mr64380625e9.18.1765457976087;
 Thu, 11 Dec 2025 04:59:36 -0800 (PST)
Date: Thu, 11 Dec 2025 12:59:26 +0000
In-Reply-To: <20251211125928.3258905-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251211125928.3258905-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211125928.3258905-3-smostafa@google.com>
Subject: [PATCH v4 2/4] iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
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

Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
- iommu_debug_init: Enable the debug mode if configured by the user.
- iommu_debug_map: Track iommu pages mapped, using physical address.
- iommu_debug_unmap_begin: Track start of iommu unmap operation, with
  IOVA and size.
- iommu_debug_unmap_end: Track the end of unmap operation, passing the
  actual unmapped size versus the tracked one at unmap_begin.

We have to do the unmap_begin/end as once pages are unmapped we lose
the information of the physical address.
This is racy, but the API is racy by construction as it uses refcounts
and doesn't attempt to lock/synchronize with the IOMMU API as that will
be costly, meaning that possibility of false negative exists.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 28 +++++++++++++
 drivers/iommu/iommu-priv.h            | 58 +++++++++++++++++++++++++++
 drivers/iommu/iommu.c                 | 11 ++++-
 include/linux/iommu-debug-pagealloc.h |  1 +
 4 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index 4022e9af7f27..1d343421da98 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -5,11 +5,15 @@
  * IOMMU API debug page alloc sanitizer
  */
 #include <linux/atomic.h>
+#include <linux/iommu.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kernel.h>
 #include <linux/page_ext.h>
 
+#include "iommu-priv.h"
+
 static bool needed;
+DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
 
 struct iommu_debug_metadata {
 	atomic_t ref;
@@ -25,6 +29,30 @@ struct page_ext_operations page_iommu_debug_ops = {
 	.need = need_iommu_debug,
 };
 
+void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
+{
+}
+
+void __iommu_debug_unmap_begin(struct iommu_domain *domain,
+			       unsigned long iova, size_t size)
+{
+}
+
+void __iommu_debug_unmap_end(struct iommu_domain *domain,
+			     unsigned long iova, size_t size,
+			     size_t unmapped)
+{
+}
+
+void iommu_debug_init(void)
+{
+	if (!needed)
+		return;
+
+	pr_info("iommu: Debugging page allocations, expect overhead or disable iommu.debug_pagealloc");
+	static_branch_enable(&iommu_debug_initialized);
+}
+
 static int __init iommu_debug_pagealloc(char *str)
 {
 	return kstrtobool(str, &needed);
diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index c95394cd03a7..aaffad5854fc 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -5,6 +5,7 @@
 #define __LINUX_IOMMU_PRIV_H
 
 #include <linux/iommu.h>
+#include <linux/iommu-debug-pagealloc.h>
 #include <linux/msi.h>
 
 static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
@@ -65,4 +66,61 @@ static inline int iommufd_sw_msi(struct iommu_domain *domain,
 int iommu_replace_device_pasid(struct iommu_domain *domain,
 			       struct device *dev, ioasid_t pasid,
 			       struct iommu_attach_handle *handle);
+
+#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
+
+void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
+		       size_t size);
+void __iommu_debug_unmap_begin(struct iommu_domain *domain,
+			       unsigned long iova, size_t size);
+void __iommu_debug_unmap_end(struct iommu_domain *domain,
+			     unsigned long iova, size_t size, size_t unmapped);
+
+static inline void iommu_debug_map(struct iommu_domain *domain,
+				   phys_addr_t phys, size_t size)
+{
+	if (static_branch_unlikely(&iommu_debug_initialized))
+		__iommu_debug_map(domain, phys, size);
+}
+
+static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
+					   unsigned long iova, size_t size)
+{
+	if (static_branch_unlikely(&iommu_debug_initialized))
+		__iommu_debug_unmap_begin(domain, iova, size);
+}
+
+static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
+					 unsigned long iova, size_t size,
+					 size_t unmapped)
+{
+	if (static_branch_unlikely(&iommu_debug_initialized))
+		__iommu_debug_unmap_end(domain, iova, size, unmapped);
+}
+
+void iommu_debug_init(void);
+
+#else
+static inline void iommu_debug_map(struct iommu_domain *domain,
+				   phys_addr_t phys, size_t size)
+{
+}
+
+static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
+					   unsigned long iova, size_t size)
+{
+}
+
+static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
+					 unsigned long iova, size_t size,
+					 size_t unmapped)
+{
+}
+
+static inline void iommu_debug_init(void)
+{
+}
+
+#endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
+
 #endif /* __LINUX_IOMMU_PRIV_H */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2ca990dfbb88..01b062575519 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -232,6 +232,8 @@ static int __init iommu_subsys_init(void)
 	if (!nb)
 		return -ENOMEM;
 
+	iommu_debug_init();
+
 	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
 		nb[i].notifier_call = iommu_bus_notifier;
 		bus_register_notifier(iommu_buses[i], &nb[i]);
@@ -2562,10 +2564,12 @@ int iommu_map_nosync(struct iommu_domain *domain, unsigned long iova,
 	}
 
 	/* unroll mapping in case something went wrong */
-	if (ret)
+	if (ret) {
 		iommu_unmap(domain, orig_iova, orig_size - size);
-	else
+	} else {
 		trace_map(orig_iova, orig_paddr, orig_size);
+		iommu_debug_map(domain, orig_paddr, orig_size);
+	}
 
 	return ret;
 }
@@ -2627,6 +2631,8 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 
 	pr_debug("unmap this: iova 0x%lx size 0x%zx\n", iova, size);
 
+	iommu_debug_unmap_begin(domain, iova, size);
+
 	/*
 	 * Keep iterating until we either unmap 'size' bytes (or more)
 	 * or we hit an area that isn't mapped.
@@ -2647,6 +2653,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	}
 
 	trace_unmap(orig_iova, size, unmapped);
+	iommu_debug_unmap_end(domain, orig_iova, size, unmapped);
 	return unmapped;
 }
 
diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
index 83e64d70bf6c..a439d6815ca1 100644
--- a/include/linux/iommu-debug-pagealloc.h
+++ b/include/linux/iommu-debug-pagealloc.h
@@ -9,6 +9,7 @@
 #define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
 
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
+DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
 
 extern struct page_ext_operations page_iommu_debug_ops;
 
-- 
2.52.0.223.gf5cc29aaa4-goog

