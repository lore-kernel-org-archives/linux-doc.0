Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC60264FBF
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416185; cv=none; b=Mlsl72kQ77FqX3MoWR/7opM0cn4hUKJX0qArFzIABJzLDJngs5r9SPS0KsyggPnJNQbn/Q+90nOCePLmENo/Y1IHBHLKjZOVLo4UouVdgXB19E14ajeI90K56GFcDt5FtiyIPO9X7UylzTKQGZWfGdmoZdSMtm+CTJ45EMhYJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416185; c=relaxed/simple;
	bh=s7pp9IdgM2n/jUNyLSIifV8ruKPYElCOLPo+/ycD/IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErZgM0mxkzAhBYMnheI+eFgvPRcU6UrFBxjajWiMcC9trf/0DPXRfnrnTiFGMCrV23skjzWiu6yp8D9Jrlo5pzzKN4+NXCFP6ln0N0jbeXSPP/XmrQldImTBhsza5BRygS/gm2RzaO0vNUTVVOz3aRcT3g0UbsTO9eLIhzh19H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+yuxY12; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+yuxY12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evcOi+TBEtbvV15MXszgYeJTQO+N+ZLjDDY2W9tEmL0=;
	b=O+yuxY12L7k+yH6YpNPcl7BVhBMt3InJ+Pv10KgfL6qvaLOidNULqdXtT6Tld0ORrHYnY9
	MeNmTSY8H99GOqNG8VmMS+uk6mYykTWlAy7lVv9pDT9VaKpxh1hTXRgVHUVwkr0Uos/aaw
	BD5yh+JNkEZj2rgCIiCTJYcCZFIsbrY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-JTUZ3IuAOXm472MdnXyHXw-1; Mon, 24 Feb 2025 11:56:21 -0500
X-MC-Unique: JTUZ3IuAOXm472MdnXyHXw-1
X-Mimecast-MFC-AGG-ID: JTUZ3IuAOXm472MdnXyHXw_1740416180
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c0a58e7so39168535e9.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416180; x=1741020980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evcOi+TBEtbvV15MXszgYeJTQO+N+ZLjDDY2W9tEmL0=;
        b=f8C2LWL4GlMFMNLz0y4PCsPKA/VpJXGskjYlh90CS17l0TZY2iIAbcbPG9G1mrjlsq
         RuLEMFHzlfi6bC2tvHIO77uT+fbGap/ASgAPEmeZv1baK8JOlq79Oli6ouI/08dO8XAc
         3rkau95l7hLyCvWsoLXLTb8rhDwV511PrYMbxMI4buVLmq/3Wtd83Ek/NX+N9NGSdhcI
         YKymsUjV5FqhwHwCDsqk1BRR474qgEEWth2LchpujgH9MHEV/Okhds3QvD9/by4IN1SZ
         OcO9fN50VI5Y6CTC1u3rpvR0BweGSquFGaUijkdx+4O1x4UZCPOf5yxnAJxiIYHEr0Ni
         w79w==
X-Gm-Message-State: AOJu0YyC9glLjCl9FMgUzFshC0gqaDGZ1if1FhfjYKHZMlJejiktheqH
	jh0CI9qUgU/mkOC0OmJar1hnSuoQOG59gXSa4gbARXYg4la0yhP7idDoFInlwCZwO4XbG5HZhYY
	427Wsecv1TP5Jcs4rSYQryscVDK6HvYZku9EVgGGUkyyYr69nQL25xkthDA==
X-Gm-Gg: ASbGncuoFFbGWXEbx1ovwDK/xBuPdOhuK79XCTiTpoV1LK5jJaBzY7ejtcqYnenwvpO
	3bcPVbn1yvZ+u/tvl7NOrnNt6dst5sUAzaJStGH8cTny7JHyEVtgnvorZVgTaAJRwCdp8sDdMgT
	UkDnLKtMx7fdR+A6eQlGvyUAxTt723JKP4O0K0/bz5uWPFgBdTSp23pVxVJzSj1xPj2LGdC3O11
	67aSYHt6G4XWsb2li2O9lzdJyNQLIz5K4nMBasGhRZW5q3H1+1MRE+4mrsu1yEBiK9giG890cU8
	6lDg5nXgE7Bl49HHIWOzgbWMNDnxWK12zqXjk1tzpg==
X-Received: by 2002:a05:6000:18a2:b0:38f:50bd:ad11 with SMTP id ffacd0b85a97d-38f707840afmr10692070f8f.5.1740416180205;
        Mon, 24 Feb 2025 08:56:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ0CTZOs7oip6JQ6V5mLo1AyAa7BC2bCEfy4T3EJKtPxndTNVUXGmx+vtnsEhrmmF+DjMIVg==
X-Received: by 2002:a05:6000:18a2:b0:38f:50bd:ad11 with SMTP id ffacd0b85a97d-38f707840afmr10692042f8f.5.1740416179763;
        Mon, 24 Feb 2025 08:56:19 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439b02e489esm111463335e9.21.2025.02.24.08.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:19 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 07/20] mm/rmap: pass dst_vma to folio_dup_file_rmap_pte() and friends
Date: Mon, 24 Feb 2025 17:55:49 +0100
Message-ID: <20250224165603.1434404-8-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224165603.1434404-1-david@redhat.com>
References: <20250224165603.1434404-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We'll need access to the destination MM when modifying the large mapcount
of a non-hugetlb large folios next. So pass in the destination VMA.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/rmap.h | 42 +++++++++++++++++++++++++-----------------
 mm/huge_memory.c     |  2 +-
 mm/memory.c          | 10 +++++-----
 3 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 6abf7960077aa..e795610bade80 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -335,7 +335,8 @@ static inline void hugetlb_remove_rmap(struct folio *folio)
 }
 
 static __always_inline void __folio_dup_file_rmap(struct folio *folio,
-		struct page *page, int nr_pages, enum rmap_level level)
+		struct page *page, int nr_pages, struct vm_area_struct *dst_vma,
+		enum rmap_level level)
 {
 	const int orig_nr_pages = nr_pages;
 
@@ -366,45 +367,47 @@ static __always_inline void __folio_dup_file_rmap(struct folio *folio,
  * @folio:	The folio to duplicate the mappings of
  * @page:	The first page to duplicate the mappings of
  * @nr_pages:	The number of pages of which the mapping will be duplicated
+ * @dst_vma:	The destination vm area
  *
  * The page range of the folio is defined by [page, page + nr_pages)
  *
  * The caller needs to hold the page table lock.
  */
 static inline void folio_dup_file_rmap_ptes(struct folio *folio,
-		struct page *page, int nr_pages)
+		struct page *page, int nr_pages, struct vm_area_struct *dst_vma)
 {
-	__folio_dup_file_rmap(folio, page, nr_pages, RMAP_LEVEL_PTE);
+	__folio_dup_file_rmap(folio, page, nr_pages, dst_vma, RMAP_LEVEL_PTE);
 }
 
 static __always_inline void folio_dup_file_rmap_pte(struct folio *folio,
-		struct page *page)
+		struct page *page, struct vm_area_struct *dst_vma)
 {
-	__folio_dup_file_rmap(folio, page, 1, RMAP_LEVEL_PTE);
+	__folio_dup_file_rmap(folio, page, 1, dst_vma, RMAP_LEVEL_PTE);
 }
 
 /**
  * folio_dup_file_rmap_pmd - duplicate a PMD mapping of a page range of a folio
  * @folio:	The folio to duplicate the mapping of
  * @page:	The first page to duplicate the mapping of
+ * @dst_vma:	The destination vm area
  *
  * The page range of the folio is defined by [page, page + HPAGE_PMD_NR)
  *
  * The caller needs to hold the page table lock.
  */
 static inline void folio_dup_file_rmap_pmd(struct folio *folio,
-		struct page *page)
+		struct page *page, struct vm_area_struct *dst_vma)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	__folio_dup_file_rmap(folio, page, HPAGE_PMD_NR, RMAP_LEVEL_PTE);
+	__folio_dup_file_rmap(folio, page, HPAGE_PMD_NR, dst_vma, RMAP_LEVEL_PTE);
 #else
 	WARN_ON_ONCE(true);
 #endif
 }
 
 static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
-		struct page *page, int nr_pages, struct vm_area_struct *src_vma,
-		enum rmap_level level)
+		struct page *page, int nr_pages, struct vm_area_struct *dst_vma,
+		struct vm_area_struct *src_vma, enum rmap_level level)
 {
 	const int orig_nr_pages = nr_pages;
 	bool maybe_pinned;
@@ -470,6 +473,7 @@ static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
  * @folio:	The folio to duplicate the mappings of
  * @page:	The first page to duplicate the mappings of
  * @nr_pages:	The number of pages of which the mapping will be duplicated
+ * @dst_vma:	The destination vm area
  * @src_vma:	The vm area from which the mappings are duplicated
  *
  * The page range of the folio is defined by [page, page + nr_pages)
@@ -488,16 +492,18 @@ static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
  * Returns 0 if duplicating the mappings succeeded. Returns -EBUSY otherwise.
  */
 static inline int folio_try_dup_anon_rmap_ptes(struct folio *folio,
-		struct page *page, int nr_pages, struct vm_area_struct *src_vma)
+		struct page *page, int nr_pages, struct vm_area_struct *dst_vma,
+		struct vm_area_struct *src_vma)
 {
-	return __folio_try_dup_anon_rmap(folio, page, nr_pages, src_vma,
-					 RMAP_LEVEL_PTE);
+	return __folio_try_dup_anon_rmap(folio, page, nr_pages, dst_vma,
+					 src_vma, RMAP_LEVEL_PTE);
 }
 
 static __always_inline int folio_try_dup_anon_rmap_pte(struct folio *folio,
-		struct page *page, struct vm_area_struct *src_vma)
+		struct page *page, struct vm_area_struct *dst_vma,
+		struct vm_area_struct *src_vma)
 {
-	return __folio_try_dup_anon_rmap(folio, page, 1, src_vma,
+	return __folio_try_dup_anon_rmap(folio, page, 1, dst_vma, src_vma,
 					 RMAP_LEVEL_PTE);
 }
 
@@ -506,6 +512,7 @@ static __always_inline int folio_try_dup_anon_rmap_pte(struct folio *folio,
  *				 of a folio
  * @folio:	The folio to duplicate the mapping of
  * @page:	The first page to duplicate the mapping of
+ * @dst_vma:	The destination vm area
  * @src_vma:	The vm area from which the mapping is duplicated
  *
  * The page range of the folio is defined by [page, page + HPAGE_PMD_NR)
@@ -524,11 +531,12 @@ static __always_inline int folio_try_dup_anon_rmap_pte(struct folio *folio,
  * Returns 0 if duplicating the mapping succeeded. Returns -EBUSY otherwise.
  */
 static inline int folio_try_dup_anon_rmap_pmd(struct folio *folio,
-		struct page *page, struct vm_area_struct *src_vma)
+		struct page *page, struct vm_area_struct *dst_vma,
+		struct vm_area_struct *src_vma)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	return __folio_try_dup_anon_rmap(folio, page, HPAGE_PMD_NR, src_vma,
-					 RMAP_LEVEL_PMD);
+	return __folio_try_dup_anon_rmap(folio, page, HPAGE_PMD_NR, dst_vma,
+					 src_vma, RMAP_LEVEL_PMD);
 #else
 	WARN_ON_ONCE(true);
 	return -EBUSY;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 13152313e77ce..a3264d88d4b49 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1782,7 +1782,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	src_folio = page_folio(src_page);
 
 	folio_get(src_folio);
-	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, src_vma))) {
+	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, dst_vma, src_vma))) {
 		/* Page maybe pinned: split and retry the fault on PTEs. */
 		folio_put(src_folio);
 		pte_free(dst_mm, pgtable);
diff --git a/mm/memory.c b/mm/memory.c
index cacf6d53bdf32..ef74c4f009f84 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -845,7 +845,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		folio_get(folio);
 		rss[mm_counter(folio)]++;
 		/* Cannot fail as these pages cannot get pinned. */
-		folio_try_dup_anon_rmap_pte(folio, page, src_vma);
+		folio_try_dup_anon_rmap_pte(folio, page, dst_vma, src_vma);
 
 		/*
 		 * We do not preserve soft-dirty information, because so
@@ -999,14 +999,14 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		folio_ref_add(folio, nr);
 		if (folio_test_anon(folio)) {
 			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
-								  nr, src_vma))) {
+								  nr, dst_vma, src_vma))) {
 				folio_ref_sub(folio, nr);
 				return -EAGAIN;
 			}
 			rss[MM_ANONPAGES] += nr;
 			VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
 		} else {
-			folio_dup_file_rmap_ptes(folio, page, nr);
+			folio_dup_file_rmap_ptes(folio, page, nr, dst_vma);
 			rss[mm_counter_file(folio)] += nr;
 		}
 		if (any_writable)
@@ -1024,7 +1024,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		 * guarantee the pinned page won't be randomly replaced in the
 		 * future.
 		 */
-		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, src_vma))) {
+		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, dst_vma, src_vma))) {
 			/* Page may be pinned, we have to copy. */
 			folio_put(folio);
 			err = copy_present_page(dst_vma, src_vma, dst_pte, src_pte,
@@ -1034,7 +1034,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		rss[MM_ANONPAGES]++;
 		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
 	} else {
-		folio_dup_file_rmap_pte(folio, page);
+		folio_dup_file_rmap_pte(folio, page, dst_vma);
 		rss[mm_counter_file(folio)]++;
 	}
 
-- 
2.48.1

