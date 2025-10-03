Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4242D47E6
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512770; cv=none; b=ooICptglb0gH4blVGiYR3taarxWSHfo9sobaAIQL1yrkBIeo5gPz6atJonAKMj5jHw0Oy6M3j2sLYRp3OUBEF0/2A4xhflDeCP1eMQic6S/z2SWCtddMC5/dqwK22QZ1L6vZzgV9MCUhtSKZ3lUd/SCm8mGgjbtG007IhOiQUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512770; c=relaxed/simple;
	bh=h8HRZAYE3mjXSc5Xyx6cIjeKK3BF7I4Fd5OR1DdLMiY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u2Ezh1hfxHjL0q+0JtTOffw1IM2EuXuPDl6C8u2w/Qtk1kdW7wmgeEYGmjAwpbLjSxiQ0gfYXcmB1RgLM/Di/SfGy6SACw0VbQPqCqKQbwmEsS5BegBqIE4HoFKfScjDwDWvVtIUGRwlrcLEUUTviLjTusIcMDQWKz3Ew0VKTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RipcE+HB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RipcE+HB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e4fa584e7so11345435e9.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759512767; x=1760117567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSJf223vDYvCAejMgpz8FoiY2GVLX/OUVEV8AW8P3rE=;
        b=RipcE+HBunm1LAWdVy/tQHlnskUKKlmTsX3e7PrCC5gslRSMr1iKOaRRFi2bcS7eV2
         ZJz69qcrahzXrEJJWH0rE1YYT8ryA9+dm5//pC19fUfGl4AmKhwMP3E9J1FcFk7oEsRF
         eqrDhQO5DNRtb8OrkjYVONTgC94d/xNZx/1OGXJFNwSIPMt2SKgYeavfZCL6GtQs1Ytd
         NnA6yJLpUhuPpiHmkJYaLTTn1sCbI22YJ6CK3mXEmw77oplJJEV1E8fLl0Tf4W/bCqgB
         41/CrLUtp6ZLwFntaQ6znQV90US4xxJs2o9xCXRmO+1MpBX+hyyT4KumXTrSgzGRla67
         kTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512767; x=1760117567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSJf223vDYvCAejMgpz8FoiY2GVLX/OUVEV8AW8P3rE=;
        b=XxEfgTRjV6OKscH2fMYZsKOg532Zq+ifTZo0al4sKwVt4P8sb2LV5j6pOVQIxxT0YM
         vl5xvnXWtkp8vnhipQLQU5DjSQoeWL2p3z62pJndHInuHOBo/JDyCPj65mgFXqk72QwY
         LsOk+zjyRw35foGfEszFHhpLH8AEoJMXqHH9dwRz2HR/ijqarpwqEhDiTnFtRPEmb0e9
         cmuIcKVM2JXVtMgTNfBHp/vCRosF18WiZsmAOiRQq8Apya7raZbGZtpbj13qXbWvRqyH
         zJOvuzcAvL4lDtbweFssen688lXlTkmjjVskQP7Tw13RKYnZqCZH03uNE/S4hBE9+WWn
         ONqg==
X-Forwarded-Encrypted: i=1; AJvYcCUxca+nCQI46ZDQKRGutxo6WvJm9Aiw/CNV+3upOfW4T12/dEoC65eMuGURRjV+unnV017TV4toEa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64V2Qo5Lq6r1/Bqw3sOIQmGDgPw5jufAkbzBn7dacrAA5v4y9
	/VzoiPi4hCDIBJ+wh8hDukINNzHCFesdO/f+2LeSAPwPMAWTbVxNfyeUfvhNKPUYM/9FDFEF64m
	4WOoCszRV+N2fiQ==
X-Google-Smtp-Source: AGHT+IEWfYLAMSMP+OGgRaTAc1dXj7/wh5+WqknFdRddjMd1FN58CkXD5Dr6K3xA5OvV0fh2LeDAOUQkcNX7zw==
X-Received: from wmna4.prod.google.com ([2002:a05:600c:684:b0:46d:6939:1b46])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c9:b0:46e:4341:7302 with SMTP id 5b1f17b1804b1-46e71155b8cmr26105425e9.34.1759512767276;
 Fri, 03 Oct 2025 10:32:47 -0700 (PDT)
Date: Fri,  3 Oct 2025 17:32:27 +0000
In-Reply-To: <20251003173229.1533640-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003173229.1533640-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003173229.1533640-3-smostafa@google.com>
Subject: [RFC PATCH 2/4] drivers/iommu: Add calls for iommu debug
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
- iommu_debug_init: Enable the debug mode if configured by the user.
- iommu_debug_map: Track iommu pages mapped, using physical address.
- iommu_debug_unmap: Track iommu pages unmapped, using IO virtual
  address.
- iommu_debug_remap: Track iommu pages, already mapped using IOVA.

We have to do the unmap/remap as once pages are unmapped we lose the
information of the physical address.
This is racy, but the API is racy by construction as it uses refcounts
and doesn't attempt to lock/synchronize with the IOMMU API as that will
be costly, meaning that possibility of false negative exists.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug.c | 23 +++++++++++++++++++++++
 drivers/iommu/iommu.c       | 21 +++++++++++++++++++--
 include/linux/iommu-debug.h |  6 ++++++
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu-debug.c b/drivers/iommu/iommu-debug.c
index 297a35137b38..607f1fcf2235 100644
--- a/drivers/iommu/iommu-debug.c
+++ b/drivers/iommu/iommu-debug.c
@@ -5,11 +5,13 @@
  * IOMMU API santaizers and debug
  */
 #include <linux/atomic.h>
+#include <linux/iommu.h>
 #include <linux/iommu-debug.h>
 #include <linux/kernel.h>
 #include <linux/page_ext.h>
 
 static bool needed;
+static DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
 
 struct iommu_debug_metadate {
 	atomic_t ref;
@@ -25,6 +27,27 @@ struct page_ext_operations page_iommu_debug_ops = {
 	.need = need_iommu_debug,
 };
 
+void iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
+{
+}
+
+void iommu_debug_unmap(struct iommu_domain *domain, unsigned long iova, size_t size)
+{
+}
+
+void iommu_debug_remap(struct iommu_domain *domain, unsigned long iova, size_t size)
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
index 060ebe330ee1..56c89636a33c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -18,6 +18,7 @@
 #include <linux/errno.h>
 #include <linux/host1x_context_bus.h>
 #include <linux/iommu.h>
+#include <linux/iommu-debug.h>
 #include <linux/iommufd.h>
 #include <linux/idr.h>
 #include <linux/err.h>
@@ -231,6 +232,9 @@ static int __init iommu_subsys_init(void)
 	if (!nb)
 		return -ENOMEM;
 
+#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
+	iommu_debug_init();
+#endif
 	for (int i = 0; i < ARRAY_SIZE(iommu_buses); i++) {
 		nb[i].notifier_call = iommu_bus_notifier;
 		bus_register_notifier(iommu_buses[i], &nb[i]);
@@ -2518,10 +2522,14 @@ int iommu_map_nosync(struct iommu_domain *domain, unsigned long iova,
 	}
 
 	/* unroll mapping in case something went wrong */
-	if (ret)
+	if (ret) {
 		iommu_unmap(domain, orig_iova, orig_size - size);
-	else
+	} else {
 		trace_map(orig_iova, orig_paddr, orig_size);
+#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
+		iommu_debug_map(domain, orig_paddr, orig_size);
+#endif
+	}
 
 	return ret;
 }
@@ -2583,6 +2591,10 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 
 	pr_debug("unmap this: iova 0x%lx size 0x%zx\n", iova, size);
 
+#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
+	iommu_debug_unmap(domain, iova, size);
+#endif
+
 	/*
 	 * Keep iterating until we either unmap 'size' bytes (or more)
 	 * or we hit an area that isn't mapped.
@@ -2602,6 +2614,11 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 		unmapped += unmapped_page;
 	}
 
+#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
+	if (unmapped < size)
+		iommu_debug_remap(domain, iova, size - unmapped);
+#endif
+
 	trace_unmap(orig_iova, size, unmapped);
 	return unmapped;
 }
diff --git a/include/linux/iommu-debug.h b/include/linux/iommu-debug.h
index a9c11855c4ed..8d3ea661660f 100644
--- a/include/linux/iommu-debug.h
+++ b/include/linux/iommu-debug.h
@@ -11,6 +11,12 @@
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
 
 extern struct page_ext_operations page_iommu_debug_ops;
+struct iommu_domain;
+
+void iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size);
+void iommu_debug_unmap(struct iommu_domain *domain, unsigned long iova, size_t size);
+void iommu_debug_remap(struct iommu_domain *domain, unsigned long iova, size_t size);
+void iommu_debug_init(void);
 
 #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
 
-- 
2.51.0.618.g983fd99d29-goog

