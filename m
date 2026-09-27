Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B13815DF
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477703; cv=none; b=lVYT2HqJrGJioq+7MlD9OFrR/sN0J7YLtDReWIG57OolqrNtes4paLvCj3914J8pzH8ANPJaAehALqMXyK2mjecS9MBGcrAKRl1qccDoGI6gHtf9gf2INfb+xrOTn/AlhI2BZ1XamFojhOxkinVWglNqmo51e9vBoxSa6AnflJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477703; c=relaxed/simple;
	bh=2MnAw3qDU0h5NcXjiq6FPvAsAhwiURQ1dI9OBBFi+jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtcX2+tFdg/ck31M80d2PSu14kCHVtvaQwGEqEwLYuataE+PWf+qlDelbs0ljUelyQ20zZp59yQNPAlcn7M7Qe6qv6wo8GEHJKDlcFnBUFvq97+zWSG9Ja3h5aYGyowYCo0y3Ob2uw39rdrR078zdvKpsYsLCeA2uUWiWuFR+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Cct/T6gM; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Cct/T6gM"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1070897a91.2
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477701; x=1791082501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAkta7mZeKcSnQKAIidETfQVRbQyIgGdyROsCEAgaZU=;
        b=Cct/T6gMJz1AU5PfctlfVvFGYAzMSouNP7eX8Xdvl/IITx51UTfT9Jg+cM7i6lIW01
         BQ+EFPZ32xVQWIx4y/rG5hyVWknX63k21wzkxRuI17kgVMdpepo5QlHzuHUnYjZUSe9p
         q43xrpnowBvnxYF42EvaANrcKxtR20+qMhIoWxsJQ7qwQZbydHCuXATOG+FzUS1WPtHl
         w5+LTcvEYTtF4QKoAb3tiRmB9GErevw1dj+IzYmnkXcCttHSIK0OVS4vRw+79sygw2Re
         FMu4MEOlIzIO4sKyP3XNwUw81DpKFDrgrytbS8nCXEJv9UY4TYf3BHIyIkv+er13iCGj
         Thfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477701; x=1791082501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAkta7mZeKcSnQKAIidETfQVRbQyIgGdyROsCEAgaZU=;
        b=GPEhQvx/V6JBoCR7PJSAtBVB8i0hVGfFfZKdP5u8LsHLUot5Ty/10NXnx2EOiUXkZi
         Wo1C9gxCC1wwdJ4ewXDMjdF7NTAAT19cgXnP9enMMPTa25oPB1WukWR8Z8OItIDw7d2q
         64t4+LhSEC3Tc4jxaUjp7gR/fCeTHZTMSxiBTtIkCWKSqPQcyqB4nORT9w0AP1GOPp/Z
         X0nshhSrR/SZ/0b62Sf5yDSFIdLCNbNxLrqOLtnbxcY0oSZdy28pYTMaNK1P93kTSPeV
         +zsuLw8JmyzeqJ9dcnuul/Ips+9gCL0Gr6BZbVYN7IRfwPXX44TSZM7WRA6U2cdlnZ8V
         LYFw==
X-Forwarded-Encrypted: i=1; AKwUvBztyYaRkkRYsrYt7kGQrKq1fBrH4EJirewz1ukWpH2x7mOqzMD+r0FTvxMGEGZU5iik6FJV7VwMwBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh4jj/gw+WOUfOPyB73f3HXhSY9uHr/H717u45EoB7Q4GnGo3S
	DHpX8kIU/C0Wk+uWSNF7+JPl+tcq4uKVArNmBNvUne34JYdMLlAxE1uVUEhBNET+Dqo=
X-Gm-Gg: AYBFou2BCBFd9qstOjPf1jAUmKQX10K9qJpalSMEN+yjKlAOdnTEU06m7H3waC7NtT5
	bHu4wSgYL1pHt3pNOtyFdPCgoSPVMKClSb7wV1RJVDH6ZFHSmQSH6uCl4J55lU9ID51nfVi1+RN
	MIyOsLg/1fjDZY23uaGS8OQuj9nTM8nlDJGECny4DjVwFVjotW5+o/qIcPY2/umYhD02vd/3GwS
	/kbFTkpXz27mW8omYUNk1pUZWUXJFlqnd1b0KPaf5DFVRNde+c6oeaWbnFDb41uEUMPyjFOE6U/
	vwHhg0bydEGXnpBM+qFdxdnghKpyAliuPAnVvRGvxw9j/uiw9pyV3UDs58trY7DTEw3nEgk5DV9
	BU/wU6yv66lLczrf8GCugqlsSqAyKZg+nYoRoQSyF3d6E0XLF4eQVaVgtjKaQ3DBDJEo3t4Ue09
	bKD9S15iE1hsE9g9b5JwUH49+9qxmFvjrTo2q8/0kIA+v6LgKCQB7Lp2WMbJNXe8XTJ6wAJhjMe
	1UO1vg14QheVvpaLuDY
X-Received: by 2002:a17:90b:17c8:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-3a098b973c5mr8380169a91.5.1790477700749;
        Sat, 26 Sep 2026 19:55:00 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:00 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 02/12] mm/sparse-vmemmap: allocate shared tail page array dynamically
Date: Sun, 27 Sep 2026 10:54:31 +0800
Message-ID: <20260927025441.741633-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 622026e87c40 ("mm/hugetlb: remove fake head pages") added the
per-zone vmemmap_tails array. Its size depends on MAX_FOLIO_ORDER, which
had been moved to mmzone.h in preparation for the array.

PUD_ORDER is defined by linux/pgtable.h, which cannot be included from
mmzone.h without creating an include cycle. It was therefore open-coded
as PUD_SHIFT - PAGE_SHIFT.

This removed the dependency on PUD_ORDER, but not the underlying
dependency on architecture page-table definitions. PUD_SHIFT is
generally provided by architecture page-table headers, which are not
guaranteed to have been included when mmzone.h is parsed.

The dependency remained hidden because vmemmap_tails was originally
guarded by CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP. Under that condition,
MAX_FOLIO_ORDER resolves to either MAX_PAGE_ORDER or the fixed HugeTLB
limit, rather than the PUD_SHIFT-based definition.

Device DAX, however, does not require CONFIG_HUGETLB_PAGE. When it is
converted to use section-based vmemmap optimization, MAX_FOLIO_ORDER can
resolve to PUD_SHIFT - PAGE_SHIFT while it is being used to size
vmemmap_tails. This would make struct zone depend on architecture
page-table definitions being available when mmzone.h is parsed.

Replace the embedded array with a pointer and allocate it on first use.
This moves the order-count evaluation into sparse-vmemmap.c, after the
architecture page-table definitions are available, and removes the
dependency from mmzone.h.

Removing the compile-time array also removes the original reason for
keeping MAX_FOLIO_ORDER and the vmemmap optimization sizing definitions
in mmzone.h. Follow-up cleanups can place each definition in the header
owned by its respective subsystem.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v5:
- Add this patch to fix the RISC-V build failure under the configuration
  reported by the kernel test robot
---
 include/linux/mmzone.h |  7 +------
 mm/sparse-vmemmap.c    | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index acd94cecc0d3..68807ff7f946 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -113,11 +113,6 @@
 	(VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
-#define __VMEMMAP_OPTIMIZATION_NR_ORDERS	\
-	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
-#define VMEMMAP_OPTIMIZATION_NR_ORDERS		\
-	(__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
-
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
@@ -1156,7 +1151,7 @@ struct zone {
 	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
 	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
-	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
+	struct page **vmemmap_tails;
 #endif
 } ____cacheline_internodealigned_in_smp;
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 9b00085122b2..46d9a25b3275 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -170,16 +170,43 @@ static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
 }
 
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#define VMEMMAP_OPTIMIZATION_NR_ORDERS	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
+
+static __ref struct page **vmemmap_tails_alloc(struct zone *zone)
+{
+	struct page **pages;
+	const size_t size = array_size(VMEMMAP_OPTIMIZATION_NR_ORDERS, sizeof(*pages));
+
+	pages = slab_is_available() ? kzalloc_objs(*pages, VMEMMAP_OPTIMIZATION_NR_ORDERS) :
+		memblock_alloc(size, __alignof__(*pages));
+	if (!pages)
+		return NULL;
+
+	if (cmpxchg(&zone->vmemmap_tails, NULL, pages) != NULL) {
+		if (slab_is_available())
+			kfree(pages);
+		else
+			memblock_free(pages, size);
+		pages = READ_ONCE(zone->vmemmap_tails);
+	}
+
+	return pages;
+}
+
 struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zone)
 {
 	void *addr;
-	struct page *page;
+	struct page *page, **pages;
 	const unsigned int idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
 
 	if (WARN_ON_ONCE(idx >= VMEMMAP_OPTIMIZATION_NR_ORDERS))
 		return NULL;
 
-	page = READ_ONCE(zone->vmemmap_tails[idx]);
+	pages = READ_ONCE(zone->vmemmap_tails) ? : vmemmap_tails_alloc(zone);
+	if (!pages)
+		return NULL;
+
+	page = READ_ONCE(pages[idx]);
 	if (likely(page))
 		return page;
 
@@ -194,12 +221,12 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 	}
 
 	page = virt_to_page(addr);
-	if (cmpxchg(&zone->vmemmap_tails[idx], NULL, page) != NULL) {
+	if (cmpxchg(&pages[idx], NULL, page) != NULL) {
 		if (slab_is_available())
 			__free_page(page);
 		else
 			memblock_free(addr, PAGE_SIZE);
-		page = READ_ONCE(zone->vmemmap_tails[idx]);
+		page = READ_ONCE(pages[idx]);
 	}
 
 	return page;
-- 
2.54.0

