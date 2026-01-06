Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF8827B50F
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716539; cv=none; b=RZQayUfzsgmXdoLtmsV/0N2gaoecQh6pXdtJWLXRBK6zs3CzYSvegaYHsivDgQQblAXZpPivqdYfo9mSptLmaTHuxwXqPL0oU88tnLnpowbpT/jjqzu5Y50qFs9CjhDMo4rljpo60Mih6+xNcwJnxsN+XIee/se9F4o/m2vlX3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716539; c=relaxed/simple;
	bh=eLGc7bSI3f2AZ45jSHAuVlKU2/szY3W60QXqUFG1LLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sy1wZka/ujTpqFVnvdnsoU5RLhVlM8Palaw2xk/+FKk/vkYXDnd634bY3xHfp85LrSp/jlfd56ox9wTx9mV+rISQkMiBXQzz6F3yqAAyPHbLnrfPLh0Q5n0aiKNwIC90dE1Mz3B5u28fQpCh56asmqh+MQD0J6EJ6dARMxGKHxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x9YLZPOh; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x9YLZPOh"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64b42e415c0so1820181a12.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767716532; x=1768321332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7euyx2l/lFhNmo6AV48hUE7kw2bo/jzXTOveIYTXGk=;
        b=x9YLZPOhu1DQKyPxKgBg2npAdVXpnaHEJG2YkjdSgzHMXmGect1MXWYmAUu1r10PQ6
         92oaxby2XXrDoFD607OGW2tPC/aFyukgZvEPe0izWqCvVWcOSo0B/8SCqhEgMOCH6hVc
         N5vj9Q6kOglNn6FNGT9TV97MDuWlcjb7yC3SnX1p8O6Lj60dqMCv8IVOjTtiV7BDOX6c
         9L/Js1BEgcEyLhkfx1UNwG6j4l3/pg7yLdJLvE/08VptZvzFAQX21Pt7V/bnZ3Ctyd3Y
         /K/52mQL/EprghpDRdpJTyrjXec9MWN2/GRUsy9cEXLXk7PYw7B0WXz9zEgav55WZGu8
         IgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716532; x=1768321332;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G7euyx2l/lFhNmo6AV48hUE7kw2bo/jzXTOveIYTXGk=;
        b=sJQvjXRYCxvqdXlhwhh6ixOFcPKR4Mx7QmfrNNk6ZslikWQftT2NZZbOwBbKQrzu3Z
         Jmz4hKksBVkZM51tkMMtG7pBNQrRY5aBWNDPfnLld6WKDCo0bLcWh31rzjT6Z6h//Yxu
         hNYqxJv11tGfBFgRD37J/lUjP0NA0kj/Mthwggznjnz8tDIBxdYO+Cn74hvELa8ETI6p
         swBZeoCuftJDQwVCEglEGyRzF6hgR+3vZ5hcHBp7/FtU7wk+9CYra1DrQQ7UIsyWeb1w
         vhu3yRcb+4Kf1ECWHg7F3fJ55j8+mtyANdL1s9eIUA19PU4bbsBRWFbbGrBMMphv5nCG
         C0AA==
X-Forwarded-Encrypted: i=1; AJvYcCXFjjMaFpHAYnfr4cHoweS+tfeVhqTSU31XPXWZMpxNqHxql/dOToIBp2qZJGcOyeVFF3cJ4+W/9SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsEZUh77+bE0q0Z88BsuZGT1jAE9qrj4WmnaisT5t7Zrf0q5R
	mPniwGK9rgBbjXisxuih43S2Ca+WHyUzeJtBr+HsRSbSjtAzKjm6QB/8N40zgzaMJfcc+CcLlc8
	YJtQMP+nzBWiFog==
X-Google-Smtp-Source: AGHT+IHKuH10kjkZ8zaCmrcCmU1cvF8nSsBKUsUrtCQVeYxLXeu/BwvVsndP2KZRLEWkWRgI2bRUPCcpfcbaHg==
X-Received: from ejcrc16.prod.google.com ([2002:a17:907:a310:b0:b7b:bae3:33a3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9415:b0:b7f:fbb2:baa with SMTP id a640c23a62f3a-b8426bf1f67mr332737466b.51.1767716532695;
 Tue, 06 Jan 2026 08:22:12 -0800 (PST)
Date: Tue,  6 Jan 2026 16:22:00 +0000
In-Reply-To: <20260106162200.2223655-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106162200.2223655-5-smostafa@google.com>
Subject: [PATCH v5 4/4] iommu: debug-pagealloc: Check mapped/unmapped kernel memory
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
Content-Transfer-Encoding: quoted-printable

Now, as the page_ext holds count of IOMMU mappings, we can use it to
assert that any page allocated/freed is indeed not in the IOMMU.

The sanitizer doesn=E2=80=99t protect against mapping/unmapping during this
period. However, that=E2=80=99s less harmful as the page is not used by the
kernel.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 23 +++++++++++++++++++++++
 include/linux/iommu-debug-pagealloc.h | 14 ++++++++++++++
 include/linux/mm.h                    |  5 +++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-de=
bug-pagealloc.c
index 86ccb310a4a8..5353417e64f9 100644
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
@@ -73,6 +74,28 @@ static size_t iommu_debug_page_size(struct iommu_domain =
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
2.52.0.351.gbe84eed79e-goog

