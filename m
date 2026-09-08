Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28735310784
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836686; cv=none; b=EAQnAcVws2Fi9ssGnXs2XRh2aDkajji5YGW6qB+9lBqhqhBgt6zmDfs4CO3cXDScN9P0l9ERJ3lP5dfi7oHz7ZZz1CrngIfxnTp88Px3bpYHt6EVKEFxz5qr6PPpbd3edEU0PWdXP5NXAUAtrx5n+WDqTHCMq0uelM42zrfcmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836686; c=relaxed/simple;
	bh=0craoejHz+yL27FxB85ch1A7TZcJ/6nPjXoONqTOYGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k63opLgBnCEZ21G4ToqHsI/j8++Xy6En6zB3UonVjw3oe101QDkeWNP++o5tCjRYnEBCm/i42AGGdHtiYVxgKKvV7c1OaIplDcn8Rk8AXvcmFNT1hmdLAy9cpVd0FsQAZr/5OMh3alqE6UimdZw7yKPfdC1S0WteES/Ul8GN3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZmcYB/kI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZmcYB/kI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e27035206so3756010b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 20:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836684; x=1789441484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Uns/ZJlTRrXsZn1DdaJluablabo4P2O8/HR8HKp5bE=;
        b=ZmcYB/kIbdeQGeaxzrQXuGgGp2FqSs8Hrh3it9lidPD6Qxv3OhZQ4VDw5kuVC/71GK
         k6zJNDMcscltrPZvF/1Vae/y1wbZHX3IsZ62GXjNePc+EdEmviv9W9KX/QgXcQToq2ok
         hR692KkqMoZ0pBgAydYaq8bWM6KBSDMp6UJYd28QzfE/Wp/tDsJaAYx615DANiW4Qy4z
         Yx81BlHQ+YhNrbhcoxTzD7iEOqT8i8PSG5PSH0q0y28sm1EOK0wzhHhDTk1claUtc2b2
         Uuqa+WctIKl7qxgimbVBTN+lDxTp2qHpdpGJpoWas8SF925tBlxLcVyF90KSgk9+Lv12
         DbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836684; x=1789441484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Uns/ZJlTRrXsZn1DdaJluablabo4P2O8/HR8HKp5bE=;
        b=AayNqaBK5vtCa9OXkQMUd1i7y2rrPfMm5bUohc3TQVWfIHfX+UlLXmo8Dt5ucTHre2
         GB2J7ZRpRQXepXf1KkAl8KKF0xxcPrO9c5Ej83TxVJb5BOZjb/blsVSbtmnxZZgsJjyf
         xetSR4IKkqKmts4gI0tnCei1x7LT8xWLH3m5NxfIdYLckZm/KNy9t7m2Kd+LvSxRrt+2
         LlqZ9u4dwFNogJu9y6igJ9nJefyPJu2kgXk6UzHmDO+XiY0KKXUSRstEWgwAwlGhAThc
         r9B3KS4fpZx1JuPymoh/hx4i9fj2Ik1GGRPQr2ErdSEny9hBBs6O7xOkgxnqq4EW2PXx
         aKng==
X-Forwarded-Encrypted: i=1; AKwUvBwCweN9NDGIx2B/SV2jqPrWrwmHLrVNMJkrjM1JKENzNCDE2Vpyie9EdytG3lvo1zyZtxkAFbj8C9k=@vger.kernel.org
X-Gm-Message-State: AFuF++lFzOSpBUK0WCQ6/PQrv81IgXivroS9jl9te2crw4mRTjehBKGW
	0u7wVvERccgUsDr5O4kqqp20qec2ibbvyfyH8lTdT2WPdteAVknmGKLUxiYmVEnP/WU=
X-Gm-Gg: AYBFou3r+ZM3g8T066Xzm8sQBgt3djOiX6vPsAAjcss/L+PF1u3y54AKFleCoesT51b
	OAZ8ntyB0cguGrZFUqe420Y1ILAVd82doEBDICJSkeNVUmIKufdfmN33vWJo+MQXzSviyPBy693
	0T9b4CC/klzIHazDTNHdjdf4yzcKv3UJbopvKzGygHmCbr0thqh4Hg32Bm+Lnb62+DehwJ0dLSP
	35aHXKTpP5PNoUs/bIKXfBTm2oiIl33ImYcwJMxLYiMF4YoD6OqxPB2ENzYPwB27v3qZEXg+zgn
	E6KfbEFVTYHeZ6OF8k1+zXW+BO9HZ7YPJYKkFf38x+b8XZDR2bVprBFF3lhp8JvuLPIYm86RVya
	iVfQe+P9QAtq4Smn8G81uuGOPQVy8eiClGTjF/j9869H376nCImUUza/RO1BTWGfgInJYe9lwjq
	MaiZ2S0LbR0Pk2/nUPn6B0laZ0/AIcTPV8cnXVD79mQ+rPVSvztx53gs8Q7tJtddJmCMKLdrNTm
	gLvY8v6bXGVpkpNaPJQCcWpzg==
X-Received: by 2002:a05:6a00:3494:b0:857:726d:2e95 with SMTP id d2e1a72fcca58-8616a96c426mr38438397b3a.18.1788836684381;
        Mon, 07 Sep 2026 20:04:44 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:43 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Tue,  8 Sep 2026 11:03:34 +0800
Message-ID: <20260908030335.96549-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

section_nr_vmemmap_pages() no longer uses the altmap or pgmap
arguments, so drop them from the helper and its callers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 10 ++++------
 mm/sparse.c         |  3 +--
 mm/sparse.h         |  6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e655d9d1348f..4950ac2a1c01 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -131,8 +131,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
 			start, end - 1);
 }
 
-int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_order(ms);
@@ -637,7 +636,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
 						      pgmap);
 
-	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
 	return page;
 }
@@ -648,7 +647,7 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
-	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages));
 	vmemmap_free(start, end, altmap);
 }
 
@@ -658,8 +657,7 @@ static void free_map_bootmem(struct page *memmap)
 	unsigned long end = (unsigned long)(memmap + PAGES_PER_SECTION);
 	unsigned long pfn = page_to_pfn(memmap);
 
-	memmap_boot_pages_add(-section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-							NULL, NULL));
+	memmap_boot_pages_add(-section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION));
 	vmemmap_free(start, end, NULL);
 }
 
diff --git a/mm/sparse.c b/mm/sparse.c
index 9349ed6326c0..adf057f54c0f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -251,8 +251,7 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 						nid, NULL, NULL);
 		if (!map)
 			panic("Failed to allocate memmap for section %lu\n", pnum);
-		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-							       NULL, NULL));
+		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION));
 		sparse_init_one_section(__nr_to_section(pnum), pnum, map, usage,
 					SECTION_IS_EARLY);
 		usage = (void *)usage + mem_section_usage_size();
diff --git a/mm/sparse.h b/mm/sparse.h
index e511d99fc26b..5d0f407bde7e 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -70,12 +70,10 @@ static inline void sparse_sections_init(void) {}
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 void sparse_init_subsection_map(void);
-int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
+int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages);
 #else
 static inline void sparse_init_subsection_map(void) {}
-static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages)
 {
 	return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
 }
-- 
2.54.0

