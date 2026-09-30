Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D54F5E0D
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777276; cv=none; b=i/uKgwfda/X82I3PibljJJbkmlK64mO7Y6WW6lcpu9XUzLr8y10KkkzRCKoLHc1O89e7cSwINI22jVyycTOhbsc9e+sj19Km3uOEECaXsHRLEC/iKgDDRxjsh6DFYrTLRYvBHDm2yQb8lN6mtaNy/YC2h+Ujm5ZafDiIkLmAlhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777276; c=relaxed/simple;
	bh=SrznztIB/f6vOcKTwvzKhzP/1LKgvK79VDYBCXjTf7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjjhgCUXBa8Hzx77zwjbsBOZPpz+p960Zt+fQxPBiMffq0KLaWAMCfguM+WWMhTECUQob6OVu4mIyVgzABXUw+BModn20YS65f4swjnbIx4nP2PTPdKR4XXkxBUE4RA8w/NyRVstaYaSGfNDXg9S3QR3iU5sZoZh+bcdreZ4dEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RECqfBaF; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RECqfBaF"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so2111145a91.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777253; x=1791382053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYebeXJuBW0flbBBO8JM/NAxNtBzSIotmtzU/jzSaT0=;
        b=RECqfBaFh6Yv/IPWxhoMBr+S1bXpEG0jNxEcyH60Y5c9NG6W0lh0JQTqhfdw1pmuKZ
         UxUlM84K8fd7ZIqDpeFBRjkiiMSaaUNXaYmLGeAkVUKodNrRfnpQi+43LRMNccWDgD0v
         68Fn7k2ph2AW06N4ZsJ61KWzPws0sM4GF6YcLN2BJTg7a2LOUVrtV5NPZ7zHIdqmfhPe
         ixt9mJkgiPIwXRpIWu1lQH08VkdtzX5KmSzdJGn5mzTY15tg5fNeSEo7m56XpdPOZN1H
         KpQn6qggV+sq2wT6OgH8uEwmURAC2CkxVKGZn/6/t6eRYGyklhw+4RZ30qCFoJACRX7g
         5sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777253; x=1791382053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYebeXJuBW0flbBBO8JM/NAxNtBzSIotmtzU/jzSaT0=;
        b=zvJjNg5PhBvXymvxDoFbZFgdwWUbcUDhZUPkhGwUezfsk0zXmvaoiu+Kz/N+99oxb3
         YgPz6v9KMvYiqpahkorUmoiGr88hMx6joGjFPO+KcJ3lwpF1pEoKFWoAFwMBP70kCwVG
         Jcm3M6vopEZ4LOqReiBiFYLtZOJkWpY4qi3Jz7PNnOg1z5Pcqcwrs8aVA/yERrc892h/
         Z1vn9M7X3Sgq3ogKQUwSGoIeDJNKM8t95YvWKDPcCy2wkwCKI9mNTijwyIxG7GQkRYr5
         C5qFiStm6/9aSYV0yKPsJVb2RhYwzlfqrb9CRW7wdS9tAacnMzAAnjBsatuqCDYRu6Jm
         0sBg==
X-Forwarded-Encrypted: i=1; AKwUvBxK1Wmutqp8+3n6h9056xSo+M23bt7oNefDPKBBB6eOgxsEd0ZS9Yczyv0QXxjfIyPNuL7QqzJY2V8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+3VNp6tCugkrqUOlo/DrCLZ+gnOhrMXN/P3Es863Bzi7JuuI3
	HoYN9izcds3N7s+2+NaD8B2fCiMxUcOdl/IBRfwTF/EZsCcKEPyEgfVGowzCrCwwQlI=
X-Gm-Gg: AYBFou1kmoqZJ0kVArp7cXioupdo2hz7FwW6cvRsTpAb/aVfPckBGPM986cc3/TEDAp
	B/k52nOHqm66Z8d5aFZIY2YuGSEkscuhfjVEknGkA1HAc9fCZdj9NLWiMO6AHGIu3G4y2QGCcDz
	gH9bm7PBzC8kSh3wI15R1qWcvT4fj6uqT9YIZNcX6+nTY7F/oQK8IBGZPLhhb8AMSTLEqdcF4gK
	bg8dIZkfhNA9HzqLWfW02sj9UuoSrNwVxDkqJJ0a3ac9JusVLeCrH1kQuh1KGJr15IhtIXdACH/
	jjasxMXPqbFsKdRajLQM9DRr2SliXoS3iijkEPdo4+sr9kS/Qzv87NeeTRxDalBZ2+g2K0gQ0m9
	H7AQ9rKdHMb1ZO5t8AZ+iIx6mVk3dD3rgxYtlXfvygYSSbxekMK7RDXdEzeOr7YK+zHx6Lwydnm
	8AET/Od6X4ytjBFdOmtwNlo5Tm2FBrS68rrDvIP8nZA37zFRthb2ktA9tC0xZ7BJBaEJOBQfK4B
	YCVaEsP87REjQ==
X-Received: by 2002:a17:90b:134c:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a4d199cbd8mr1390228a91.67.1790777253237;
        Wed, 30 Sep 2026 07:07:33 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:07:31 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 02/12] mm/sparse-vmemmap: allocate shared tail page array dynamically
Date: Wed, 30 Sep 2026 22:06:17 +0800
Message-ID: <20260930140627.57431-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
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
v6:
- Move the shared tail array lookup into vmemmap_tails() (suggested by
  David Hildenbrand)

v5:
- Add this patch to fix the RISC-V build failure under the configuration
  reported by the kernel test robot
---
 include/linux/mmzone.h |  7 +------
 mm/sparse-vmemmap.c    | 39 +++++++++++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 10 deletions(-)

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
index 9af349581fbd..0ace48268095 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -170,16 +170,47 @@ static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
 }
 
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#define VMEMMAP_OPTIMIZATION_NR_ORDERS	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
+
+static __ref struct page **vmemmap_tails(struct zone *zone)
+{
+	const size_t size = array_size(VMEMMAP_OPTIMIZATION_NR_ORDERS,
+				       sizeof(*zone->vmemmap_tails));
+	struct page **pages = READ_ONCE(zone->vmemmap_tails);
+
+	if (pages)
+		return pages;
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
 	const unsigned int idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
-	struct page *page;
+	struct page *page, **pages;
 	void *addr;
 
 	if (WARN_ON_ONCE(idx >= VMEMMAP_OPTIMIZATION_NR_ORDERS))
 		return NULL;
 
-	page = READ_ONCE(zone->vmemmap_tails[idx]);
+	pages = vmemmap_tails(zone);
+	if (!pages)
+		return NULL;
+
+	page = READ_ONCE(pages[idx]);
 	if (page)
 		return page;
 
@@ -194,12 +225,12 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
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

