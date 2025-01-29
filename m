Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC61DCB24
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151684; cv=none; b=sFz0AveNR9p1Ozeh3xUy5Z3+HvSi1MPHgvJ3UF2W8zWJ+hQuk0tcYyARdCfmP/uE58HZpRRX2pFA16SOQnbZty3Ck6C1pHsKFeWkmB6tamQpoq9yyTpWZ0Hpyt9bNAwwRx7N+Qm8kqYpxMe+gLAigni/AMbbcgix37EIizC/hiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151684; c=relaxed/simple;
	bh=6kVwOBl9xLzEExlS8FoIh4QwM1O96E9UpXBajCBA64U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0mtCpL23rOgBcd4diR6o8XXgJKIoSmCitMXpTXk5ng+OaSRW+yX4BsjlURxD54K3jceAeUuNYnV0TImymGHkrft87dHEKHAjJQoiRw1jfgGY+Rm6fvJYB1meJr/Mey39DmEKJBbmTTymcr5ZNJ7AAXpnzHWxsFbt75II0QxBto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iwLYDqfx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iwLYDqfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBI2mWOVOmwqsdVlja7jNAEkV5b5lmKCa22lnGaqVYs=;
	b=iwLYDqfxo6xR2DH811l6bMixTrTnUM9LY4OzZeTIEeiJfE2EWUD/uqGRtKE5dzDpHhN3dt
	pqyyuMZHaznHnStT//nwEGnDRYuFVTAq/ppZa+ef10WErInKDZiz0EG4bGINFrw+8Hn0M6
	K4JtZgbSG8x1331azZDmhjuwis9D4tc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-sDepqUSUNhewB0RYHgYvaw-1; Wed, 29 Jan 2025 06:54:40 -0500
X-MC-Unique: sDepqUSUNhewB0RYHgYvaw-1
X-Mimecast-MFC-AGG-ID: sDepqUSUNhewB0RYHgYvaw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38bf4913659so5053249f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151679; x=1738756479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBI2mWOVOmwqsdVlja7jNAEkV5b5lmKCa22lnGaqVYs=;
        b=Yg4uS+hH5ve3s6KBgtxopS1LX/e+XNJFvHh4P2scZK76DBa1EKQELRTDwg/Jm+jgC3
         SoenBSLxrc/YyODWsZ4qTL16yxLg+C6VZ0QjQUEDTKWYzs2t+3AAsLQdMXAQSmvqbg/u
         rgOMylBzDM9jjuKrhfEFYvk5Ipd48llCek5TjTVvHXGtjUJz9kVsxz4IXOVfaHAm218F
         s5wNQhLta8mLkRJJ/UUtsC94HlpSxGxtV/yvLtC/QdnqXhsjD5Xb0+eBV3WJ/nTMRh50
         sS381KI7z+fBQZcWzDhT+OXAXGbArAvqANptjtX0oftEG7v4E5hyxH10pgpVAhGg/NOj
         yoQw==
X-Gm-Message-State: AOJu0YyrmHetYTxnZeMHlsy6bb4LtP7ToUUpdVkds4rmx86yaOuA73eJ
	+PQs4auNHR4ZQbSgxcGH7XzHfbIe6imUiSy5mP1cYyrxTpTGfORfW1G/dyVR/jknHMkiy8DvL8f
	IEhoYGOekecakhH1KXfafHf03ERnQkjACI53p1Xo3RRvt9d/jzXHrPKOc7g==
X-Gm-Gg: ASbGncsqbnjnCm42BvuUPh4GaG4urgy3JHlRqTpfu7AZZoTuzSqCX1XlBQ4DBVthkXb
	utu5VGaiU5FU8/T71UqgT/nOqcUvqTg5RCKGsNy3WDdjcq2VKslNbVSpWTbieGkfqsxy1tAL6Zn
	21povRctxsBywOid0+JV4CKhjv2Oqvn2VHKRX2VR0K8GYrExna6o43KYzu2KDw+vLd0TIJuQIGx
	3IlYA0lLZGkgx+M8zBhf2fs8X/t8S0iXhowYeDKNyeZpyZ+AUNZQcG15EOjjYHGEGj5DU8OT5De
	ukMLVLi7WOR9QqOMyKbroDP6xfm+LSV4VhqUkAD2dI/ZrAWXvIjL+8FHJ+BKPDViIw==
X-Received: by 2002:a5d:47c9:0:b0:38c:3eab:2e17 with SMTP id ffacd0b85a97d-38c5194dae9mr2038622f8f.2.1738151679493;
        Wed, 29 Jan 2025 03:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuFMqyDWaa/JVieaul0deYFiTz0a9oHzheZm+vFN4IrpXYFm3MUhtZq6TOTjv8DbS0i6Ouqg==
X-Received: by 2002:a5d:47c9:0:b0:38c:3eab:2e17 with SMTP id ffacd0b85a97d-38c5194dae9mr2038593f8f.2.1738151679034;
        Wed, 29 Jan 2025 03:54:39 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1764d3sm17086479f8f.19.2025.01.29.03.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:38 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 09/12] mm/rmap: handle device-exclusive entries correctly in try_to_migrate_one()
Date: Wed, 29 Jan 2025 12:54:07 +0100
Message-ID: <20250129115411.2077152-10-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

try_to_migrate_one() is not prepared for that, so teach it about these
non-present nonswap PTEs. We already handle device-private entries by
specializing on the folio, so we can reshuffle that code to make it
work on the non-present nonswap PTEs instead.

Get rid of most folio_is_device_private() handling, except when handling
HWPoison. It's unclear what the right thing to do here is.

Note that we could currently only run into this case with
device-exclusive entries on THPs; but as we have a refcount vs. mapcount
inbalance, folio splitting etc. will just bail out early and not even
try migrating. For order-0 folios, we still adjust the mapcount on
conversion to device-exclusive, making the rmap walk abort early
(folio_mapcount() == 0 and breaking swapout). We'll fix
that next, now that try_to_migrate_one() can handle it.

Further note that try_to_migrate() calls MMU notifiers and holds the
folio lock, so any device-exclusive users should be properly prepared
for this device-exclusive PTE to "vanish".

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 125 ++++++++++++++++++++++--------------------------------
 1 file changed, 51 insertions(+), 74 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 12900f367a2a..903a78e60781 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2040,9 +2040,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
+	bool anon_exclusive, writable, ret = true;
 	pte_t pteval;
 	struct page *subpage;
-	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long pfn;
@@ -2109,24 +2109,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		pfn = pte_pfn(ptep_get(pvmw.pte));
-
-		if (folio_is_zone_device(folio)) {
-			/*
-			 * Our PTE is a non-present device exclusive entry and
-			 * calculating the subpage as for the common case would
-			 * result in an invalid pointer.
-			 *
-			 * Since only PAGE_SIZE pages can currently be
-			 * migrated, just set it to page. This will need to be
-			 * changed when hugepage migrations to device private
-			 * memory are supported.
-			 */
-			VM_BUG_ON_FOLIO(folio_nr_pages(folio) > 1, folio);
-			subpage = &folio->page;
+		/*
+		 * We can end up here with selected non-swap entries that
+		 * actually map pages similar to PROT_NONE; see
+		 * page_vma_mapped_walk()->check_pte().
+		 */
+		pteval = ptep_get(pvmw.pte);
+		if (likely(pte_present(pteval))) {
+			pfn = pte_pfn(pteval);
 		} else {
-			subpage = folio_page(folio, pfn - folio_pfn(folio));
+			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
+			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
+
+		subpage = folio_page(folio, pfn - folio_pfn(folio));
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2182,7 +2178,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			}
 			/* Nuke the hugetlb page table entry */
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
-		} else {
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+			writable = pte_write(pteval);
+		} else if (likely(pte_present(pteval))) {
 			flush_cache_page(vma, address, pfn);
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
@@ -2200,54 +2199,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+			writable = pte_write(pteval);
+		} else {
+			pte_clear(mm, address, pvmw.pte);
+			writable = is_writable_device_private_entry(pte_to_swp_entry(pteval));
 		}
 
-		/* Set the dirty flag on the folio now the pte is gone. */
-		if (pte_dirty(pteval))
-			folio_mark_dirty(folio);
+		VM_WARN_ON_FOLIO(writable && folio_test_anon(folio) &&
+				!anon_exclusive, folio);
 
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (folio_is_device_private(folio)) {
-			unsigned long pfn = folio_pfn(folio);
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			if (anon_exclusive)
-				WARN_ON_ONCE(folio_try_share_anon_rmap_pte(folio,
-									   subpage));
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			entry = pte_to_swp_entry(pteval);
-			if (is_writable_device_private_entry(entry))
-				entry = make_writable_migration_entry(pfn);
-			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(pfn);
-			else
-				entry = make_readable_migration_entry(pfn);
-			swp_pte = swp_entry_to_pte(entry);
-
-			/*
-			 * pteval maps a zone device page and is therefore
-			 * a swap pte.
-			 */
-			if (pte_swp_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_swp_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
-			trace_set_migration_pte(pvmw.address, pte_val(swp_pte),
-						folio_order(folio));
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 */
-		} else if (PageHWPoison(subpage)) {
+		if (PageHWPoison(subpage) && !folio_is_device_private(folio)) {
 			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
 			if (folio_test_hugetlb(folio)) {
 				hugetlb_count_sub(folio_nr_pages(folio), mm);
@@ -2257,8 +2223,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				dec_mm_counter(mm, mm_counter(folio));
 				set_pte_at(mm, address, pvmw.pte, pteval);
 			}
-
-		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
+		} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
+			   !userfaultfd_armed(vma)) {
 			/*
 			 * The guest indicated that the page content is of no
 			 * interest anymore. Simply discard the pte, vmscan
@@ -2274,6 +2240,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			swp_entry_t entry;
 			pte_t swp_pte;
 
+			/*
+			 * arch_unmap_one() is expected to be a NOP on
+			 * architectures where we could have non-swp entries
+			 * here.
+			 */
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
 				if (folio_test_hugetlb(folio))
 					set_huge_pte_at(mm, address, pvmw.pte,
@@ -2284,8 +2255,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
-			VM_BUG_ON_PAGE(pte_write(pteval) && folio_test_anon(folio) &&
-				       !anon_exclusive, subpage);
 
 			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
 			if (folio_test_hugetlb(folio)) {
@@ -2310,7 +2279,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte. do_swap_page() will wait until the migration
 			 * pte is removed and then restart fault handling.
 			 */
-			if (pte_write(pteval))
+			if (writable)
 				entry = make_writable_migration_entry(
 							page_to_pfn(subpage));
 			else if (anon_exclusive)
@@ -2319,15 +2288,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			else
 				entry = make_readable_migration_entry(
 							page_to_pfn(subpage));
-			if (pte_young(pteval))
-				entry = make_migration_entry_young(entry);
-			if (pte_dirty(pteval))
-				entry = make_migration_entry_dirty(entry);
-			swp_pte = swp_entry_to_pte(entry);
-			if (pte_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			if (likely(pte_present(pteval))) {
+				if (pte_young(pteval))
+					entry = make_migration_entry_young(entry);
+				if (pte_dirty(pteval))
+					entry = make_migration_entry_dirty(entry);
+				swp_pte = swp_entry_to_pte(entry);
+				if (pte_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			} else {
+				swp_pte = swp_entry_to_pte(entry);
+				if (pte_swp_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_swp_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			}
 			if (folio_test_hugetlb(folio))
 				set_huge_pte_at(mm, address, pvmw.pte, swp_pte,
 						hsz);
-- 
2.48.1

