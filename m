Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A027F724
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 16:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716537; cv=none; b=TDdNn6q/dqhLg6ZzMFP451TXwtHADhFaQZ2FmTmonioWfixd8ZuBsLC6mzSAzCbLXRBSG5dMEpMZKC5eUmQyu6HQLzo72136dP4IRC8nzDyhoDWVNEn3WnNeUt+HNjHA8Gyitfe+h2LGTvN80yVkdxLfj+rK2Y6zTatPmcOd31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716537; c=relaxed/simple;
	bh=uGJH3OwtU28KQYqTVTbSMhKaQ8LQ0V576tuTXY692fQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UgAZQKJFsG0Acs4/z1MvbAPhqlaPiXg89jH4wnicgMrka2WS0RzsldCdL43EsM8BB7HbCUs4ECtQ0xLlhhQRKBu1hqVYtjhHTB3drMA+jVPXlJldTEgtdYrXljJ9xgGaaFQmXuRKYHD/u+reszMwXwyKmBShbklbm6pFvnzkzUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cfeYbicJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cfeYbicJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso7590335e9.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 08:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767716530; x=1768321330; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9X9rqTkWjrzThKptBrhyRL/ynMrRsQ75CmjmrFVf+E=;
        b=cfeYbicJy+jCEHqETOgSyPWfN/760TizjqPjAoOPztti1+eiIq11RFY9oBzGst6H5J
         2PUvR4NJdQRaMK3Y12FsrYxdbFdkR0ucHdPBrKGaH/D20DaboZUTW8ExnUVe8cAhDF+j
         KK44BgyhJOsSl3vUGjLps8V94TVBw54UwRZxIjpw/hTCA+W/AKOEiznOM7oJOJeSDHnM
         fCOIjeQ6VeBUwDgivV9fDXx39VHO8g4dozkVP8/WNkhd2RmIzZfvon0wIo9SvgfaBcJ6
         eSvNyQ05Z4fPqe19E22PS98vidsV/VnOSHVaxhugp80jrMTJjd0gg3q8x6IDnTFRjLSd
         P/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716530; x=1768321330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9X9rqTkWjrzThKptBrhyRL/ynMrRsQ75CmjmrFVf+E=;
        b=RSSxTjLeB9Mkx6VGZMsy7pVyYLhPPigSS7FG7/tjaqj4glObiH9MehZUbhfwuGj0t+
         1ijPsYRspYd7CSfyuyUWoe0qig6w4BLaRIJhU362mvivHXfs4/sNW8Ctn9iG3zSJ7LNq
         fafhpEVcQm0ivalkp6Nuf1ICb8YKw+8Dy9Vm9Z10BLH7fCbkCAT5b5/uw+iufpYqNjJn
         FRzyOEFGKhsRtb7qFxa5ivlNIrCKsIjD9v2tcfvSXtWgMLeQwHcCATPzPSUvjCilgluf
         /CTLc9RrzCgMDA8UK10wwf8KYQut5JaycvcDaDC3+wPBi5fwfutPtZG770rKWWm7CSNU
         Y6kg==
X-Forwarded-Encrypted: i=1; AJvYcCVMWU9dCWKEPhwbSvlj7I/v0V9vr2Tf4onT7flYmNjbjW3Pmu/483DPbO0EOm1ImsBvpz6sm5v1A9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwupK4eTUuCb1vGCywFRC/LgXVVCDHmFE3PmSdNA5nJjeB3sQkB
	fYsv6juVKplxqGksCvY726q9mnZdAii96gR6jUACP35OxsfZRvBj2qd8fus80bhKU8PufJpwPpC
	N0dXudhGrZ+xVJg==
X-Google-Smtp-Source: AGHT+IHqvnTTwxVskrfx3Eg8hmFCGc9E3YGwzHwaaQ6Tg3cJl1Q59lJm5Ql2VwSPg4sK/MOiLULHClg+R28+Ew==
X-Received: from wmbgx18.prod.google.com ([2002:a05:600c:8592:b0:47d:5bef:a379])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc3:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47d7f05d451mr38748745e9.4.1767716530548;
 Tue, 06 Jan 2026 08:22:10 -0800 (PST)
Date: Tue,  6 Jan 2026 16:21:58 +0000
In-Reply-To: <20260106162200.2223655-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106162200.2223655-3-smostafa@google.com>
Subject: [PATCH v5 2/4] iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
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
2.52.0.351.gbe84eed79e-goog

