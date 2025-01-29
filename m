Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307B1DF248
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151681; cv=none; b=SR7H9e9vAAHEf3At/lC5xPdWRHe52potdRppqkofNdEkvWUPDPMXYA2qhCNJVzH3yGFp6X4eumq+BJvRQ6XBlIkUZzErEqZutuysMCDm0OEtUFYhkeEGwQmOe7cf9WLVO1UOLfXgf8LCHWoS8RJAAKnNE7UZUjNhrcoOXgEFFr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151681; c=relaxed/simple;
	bh=zoty/tDG38rtCLGJyP6VjP2nShgp7/XdAgyaitu3lVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NstqMsRONtB5cI1bFE7HEMqvjIeY3lw9Fi3tZBsztUXsWETynIO9k+a7Zfk9YmDkKH/SxKILYaMT1kogYtPLmHkTHB9VJevpqCyFWK0/fLEWN+pGSqnZWlOd1XRg/ARMB6hlvjY6FHZxqqP88kgViHxmLT5/0Lv6giZLNB1xQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ITBRxl0s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ITBRxl0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PlRguNVTZsTlNEYBD/J+r00pj+4jYSoE9sS4zp2ee/k=;
	b=ITBRxl0sR8HSx/Tp0knZ5bVlvPqhrx5qqfyvT3X8P8q6IAAi2/9EyLwTISKmN4Cgjr48L0
	oWUvkrQt8c+7xKe2X1T/TVd+qgQ5+15B7NLweIGJLaW6fPTsBagz5D7LZCtlJaljWytn+x
	IKqw6hUAib2cWioD5vpraUtB8KktlQ8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Q3JXWpy7Nj2dLJpSTRNQKg-1; Wed, 29 Jan 2025 06:54:38 -0500
X-MC-Unique: Q3JXWpy7Nj2dLJpSTRNQKg-1
X-Mimecast-MFC-AGG-ID: Q3JXWpy7Nj2dLJpSTRNQKg
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-386333ea577so2499008f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151677; x=1738756477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlRguNVTZsTlNEYBD/J+r00pj+4jYSoE9sS4zp2ee/k=;
        b=T0YdZ+W6fhTlEkLAUfVLgW9mrh8Sspd6UB43hbYYAbZL3wRiJAmVANdVOue1bvdUAf
         YeLELVZgszW7Sh17MuZgOaRmicZxJvbVcKacVuyVHjojZECJ8wvDKWK5fTZqHhKh0aTJ
         wa0l2ULpAj2lzWXkm+IsU5ske8qpvosm20s5pAHhaBpDJ9tdlX3uyss4VJKSRQZ9bHpP
         8ZYqvoMFy+lTKzO3aPW14Uq795viwzjSBVr4rgSIY4/bF4Q6gfYSTSl1Tc/kuaQ9WLku
         YJ9kyDowGjOGdMGyL/QgaaXsE99v/llzL/65T8JalclG6CShMBeakdEcbwsnDJgrad8t
         tcLQ==
X-Gm-Message-State: AOJu0Yws7NgteJMy0kl2DOOEkP8ngh2HWit5R7ABVmO52pRx3ZKvWvd4
	Sf/tiNoucwGbAze6Rc7zppzjJr2gkbUMBSmmnqoPMt5H+UrLQPZ4bJ7Vzt0KXcpRfQNSUWSMiCy
	JZ1KwT2mcEpMsBEEg0OYF6aFxoYLyabtddEnwpXks+ndmQ9t3Z3i6x8Jh7A==
X-Gm-Gg: ASbGnctXuw4KwI3Vwilyw6loVTl/iRJ+YxVLwOEdXFd3OB8YBnyuuV0WLU0tnWFildo
	6396Tknx5D9vDVu1NGyxprsCHpBD5kzKHW23GKj0IEYqzNqbOYWamkT34ZOYLgDaJIsChpCa7ag
	DyO6ZUdksQLae9ePTW0BUa3z8cmEzn3DkIg580LEEMDwW2EvA1OWnJRZqSZHWZgxsbB0Q2QRuJq
	w1jh4WOBlDI7K0Ih1L/hGicEip/j+T+B3QRBuyCsToOahiQhX15nhn8GsX9hnsNuU64ZhWwaffx
	VYErz1swN+JokfwEtJbuHD2ztbsOb+zBVuUR0NWUW4Vyb3Jmwqth7WOANxnC8ZzfLw==
X-Received: by 2002:a5d:50c2:0:b0:38b:d7d2:12f2 with SMTP id ffacd0b85a97d-38c520bf925mr1637959f8f.54.1738151676881;
        Wed, 29 Jan 2025 03:54:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE238aJbXQykMLxOmkA/GlxflTBLrEd6FkSw7fKwOzieBzddAgHKUTAMn1ykR+OZNV3l083wA==
X-Received: by 2002:a5d:50c2:0:b0:38b:d7d2:12f2 with SMTP id ffacd0b85a97d-38c520bf925mr1637927f8f.54.1738151676497;
        Wed, 29 Jan 2025 03:54:36 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a17d7a7sm17234978f8f.32.2025.01.29.03.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:36 -0800 (PST)
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
Subject: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries correctly in try_to_unmap_one()
Date: Wed, 29 Jan 2025 12:54:06 +0100
Message-ID: <20250129115411.2077152-9-david@redhat.com>
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

try_to_unmap_one() is not prepared for that, so teach it about these
non-present nonswap PTEs.

Before that, could we also have triggered this case with device-private
entries? Unlikely.

Note that we could currently only run into this case with
device-exclusive entries on THPs. For order-0 folios, we still adjust
the mapcount on conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0 and breaking swapout). We'll fix
that next, now that try_to_unmap_one() can handle it.

Further note that try_to_unmap() calls MMU notifiers and holds the
folio lock, so any device-exclusive users should be properly prepared
for this device-exclusive PTE to "vanish".

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 53 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 65d9bbea16d0..12900f367a2a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1648,9 +1648,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
+	bool anon_exclusive, ret = true;
 	pte_t pteval;
 	struct page *subpage;
-	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long pfn;
@@ -1722,7 +1722,19 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		pfn = pte_pfn(ptep_get(pvmw.pte));
+		/*
+		 * We can end up here with selected non-swap entries that
+		 * actually map pages similar to PROT_NONE; see
+		 * page_vma_mapped_walk()->check_pte().
+		 */
+		pteval = ptep_get(pvmw.pte);
+		if (likely(pte_present(pteval))) {
+			pfn = pte_pfn(pteval);
+		} else {
+			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
+			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
+		}
+
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
@@ -1778,7 +1790,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				hugetlb_vma_unlock_write(vma);
 			}
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
-		} else {
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+		} else if (likely(pte_present(pteval))) {
 			flush_cache_page(vma, address, pfn);
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
@@ -1796,6 +1810,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+		} else {
+			pte_clear(mm, address, pvmw.pte);
 		}
 
 		/*
@@ -1805,10 +1823,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
 
-		/* Set the dirty flag on the folio now the pte is gone. */
-		if (pte_dirty(pteval))
-			folio_mark_dirty(folio);
-
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
@@ -1822,8 +1836,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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
@@ -1902,6 +1916,12 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				set_pte_at(mm, address, pvmw.pte, pteval);
 				goto walk_abort;
 			}
+
+			/*
+			 * arch_unmap_one() is expected to be a NOP on
+			 * architectures where we could have non-swp entries
+			 * here, so we'll not check/care.
+			 */
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
 				swap_free(entry);
 				set_pte_at(mm, address, pvmw.pte, pteval);
@@ -1926,10 +1946,17 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			swp_pte = swp_entry_to_pte(entry);
 			if (anon_exclusive)
 				swp_pte = pte_swp_mkexclusive(swp_pte);
-			if (pte_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			if (likely(pte_present(pteval))) {
+				if (pte_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			} else {
+				if (pte_swp_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_swp_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			}
 			set_pte_at(mm, address, pvmw.pte, swp_pte);
 		} else {
 			/*
-- 
2.48.1

