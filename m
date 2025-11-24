Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FD32E120
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014903; cv=none; b=HOmnZIfUXhJBWDVxsNkvYSrPNKt3VZfOfRXLpZRZqp9VGvFu5OyGIQddM+p3iFwK2Pq4voS4fhBM8Jrhjo2IdBSVZ32WF3nIzY4g93duhd92f7ckfahCdxHwe3smC7SnRjX59fpOx2GSV8M3l/3RUOBp7dm8svO/ZLElIKdkxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014903; c=relaxed/simple;
	bh=2qH5glu3RK4jq0FudiZEVYWMd62BIFVjJ1znk/NDeck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bU6elXqVnpNazZ0mDZX3Uh4d5kzTAUMR4Ll24s98pXiKOBlcs7/6bC3sdZJ5GjWrDu3wTkriNEGLpVCneSRik9EAlZTES+Qtd/Mb0MmxCd2o4ibD4gw7F/2xmf/b2JTWZPovNgoUVuWVp8QLAgcjiQDX9lXim5YY6NFv8ER4Li0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hdJyW9G5; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hdJyW9G5"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b56125e77so2236334f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764014899; x=1764619699; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ngu03ozlByRiFoMKVX4H/wPPA/ikA9JmIOYfKZmpaLQ=;
        b=hdJyW9G5aHulV5N8VSuZJbHc2jQHI0XNNCMp2UoqcywmLGSvbDU5acW0747NwXkwos
         MgiXxH2rB/s8SVf1Av0e3GJ+zMJwFeXURc/4fxmoReXHXs8EFYKtanG4OWcRLvLrnHvJ
         SuBe+iOX4IZ1WpwaUnBNnds8SpYyOX5oB8yXTQ+N32MSrRczEsVyAceiM/HTsxmjtedA
         I8F0mqDL3ObaibwUbpTgx2id6McOVBlGKbmxnLpjvyLcpR+kliCB35E/QnB77y/PPHkt
         IcqRVbL8dweDTUCEbV9gkUJrA5aipX6aEzcvtwqgzmD4g1I+EHtRFt0t7URCJT3FFoOB
         reGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014899; x=1764619699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ngu03ozlByRiFoMKVX4H/wPPA/ikA9JmIOYfKZmpaLQ=;
        b=tYJw/mXrJO67jhoQTtWS9ThsuIKC4QtVjDpMmouXkJEABsx49EetNsVmmd+xQx372l
         0zjQsJs36kOYBPqaj9fYO9KgGsSmJdMjPVcWQU9J5Ol3e05aejAk4Y5n0pORTDxfbVqP
         KdoNWSO93OxPole/AJ8fFDmUWS4mJr3qosfP3bcyPLneffgaYwfbMeRiTVm/dSrnlT7E
         vHFi3SO21guRG3UYZt7Ek/Q2BO2BgFTfjvUUq8aLMp2QUCXwcJM2ATxe+AUnxn6ioVZd
         eOVOcwTUjt3QRb1vvfVc7u4DeBkT1nQMeRjznb12/hXyo3lb5kTtNGmiLocsPrqimge+
         1FIg==
X-Forwarded-Encrypted: i=1; AJvYcCV7GiD9YqRdY1/MIDXutGx+ZeSKNxonLiwxpU86yazuhz26TBPDYIwt4QC1qpCofY+hs8RQJ2MejdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypkHqrjL+gGJBu0T2nedYiTeGWyj+bZI6ecfGIXZMhdG2T16Dz
	hoqXVlqLXGrcoCwcZ9oIihnuu2+Ds3aud+Jw1JRwuoZkhRNo3Wqi2iLCn/tpfugiO/qC4SO6F9Q
	hlsAs9gNuUV7+CQ==
X-Google-Smtp-Source: AGHT+IECVEpnx2vzM6OsM8NmV1jTz+svgzK08aynDQT0IzGD5OgDIXmVO/7cpeDrwW2l1WNEm+YJw4E2NM/CVg==
X-Received: from wrqo3.prod.google.com ([2002:a5d:4a83:0:b0:42c:c2d6:28a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3106:b0:429:cc1c:c2e with SMTP id ffacd0b85a97d-42e0f1e3499mr164660f8f.1.1764014899687;
 Mon, 24 Nov 2025 12:08:19 -0800 (PST)
Date: Mon, 24 Nov 2025 20:08:09 +0000
In-Reply-To: <20251124200811.2942432-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251124200811.2942432-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
Message-ID: <20251124200811.2942432-3-smostafa@google.com>
Subject: [PATCH v3 2/4] drivers/iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, Mostafa Saleh <smostafa@google.com>
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
 drivers/iommu/iommu-debug-pagealloc.c | 26 +++++++++++++
 drivers/iommu/iommu.c                 | 12 +++++-
 include/linux/iommu-debug-pagealloc.h | 56 +++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index 4022e9af7f27..5665fd7360e0 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -5,11 +5,13 @@
  * IOMMU API debug page alloc sanitizer
  */
 #include <linux/atomic.h>
+#include <linux/iommu.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kernel.h>
 #include <linux/page_ext.h>
 
 static bool needed;
+DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
 
 struct iommu_debug_metadata {
 	atomic_t ref;
@@ -25,6 +27,30 @@ struct page_ext_operations page_iommu_debug_ops = {
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
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 59244c744eab..4d1dc321e400 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -18,6 +18,7 @@
 #include <linux/errno.h>
 #include <linux/host1x_context_bus.h>
 #include <linux/iommu.h>
+#include <linux/iommu-debug-pagealloc.h>
 #include <linux/iommufd.h>
 #include <linux/idr.h>
 #include <linux/err.h>
@@ -231,6 +232,8 @@ static int __init iommu_subsys_init(void)
 	if (!nb)
 		return -ENOMEM;
 
+	iommu_debug_init();
+
 	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
 		nb[i].notifier_call = iommu_bus_notifier;
 		bus_register_notifier(iommu_buses[i], &nb[i]);
@@ -2544,10 +2547,12 @@ int iommu_map_nosync(struct iommu_domain *domain, unsigned long iova,
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
@@ -2609,6 +2614,8 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 
 	pr_debug("unmap this: iova 0x%lx size 0x%zx\n", iova, size);
 
+	iommu_debug_unmap_begin(domain, iova, size);
+
 	/*
 	 * Keep iterating until we either unmap 'size' bytes (or more)
 	 * or we hit an area that isn't mapped.
@@ -2629,6 +2636,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	}
 
 	trace_unmap(orig_iova, size, unmapped);
+	iommu_debug_unmap_end(domain, orig_iova, size, unmapped);
 	return unmapped;
 }
 
diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
index 83e64d70bf6c..454303ec09c2 100644
--- a/include/linux/iommu-debug-pagealloc.h
+++ b/include/linux/iommu-debug-pagealloc.h
@@ -8,10 +8,66 @@
 #ifndef __LINUX_IOMMU_DEBUG_PAGEALLOC_H
 #define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
 
+struct iommu_domain;
+
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
 
+DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
+
 extern struct page_ext_operations page_iommu_debug_ops;
 
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
 #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
 
 #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
-- 
2.52.0.460.gd25c4c69ec-goog

