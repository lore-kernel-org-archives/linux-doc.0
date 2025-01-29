Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641B1DC747
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151671; cv=none; b=hKwbdU4UflqsCGvB4RYih5Rx8E2GgpOF4cuVhWgJsi+0D3lKajpUoNcbHKDlbxFhvcuz8mCA8pE6xoUxDjxDX2gbCfwilFkPeJ6fLy1Us98O2gUVWlkc7GKmzAkWcZcLJ75tqKHLBSMa6eyDtp8ll/INkYnPK2kASdh4d+W1Cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151671; c=relaxed/simple;
	bh=CyB+C07mnNjpUZ5lpuoD+B3M65Go6LhWO58CPNe15cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pk6a9zAvaOMUG/315Hfwkj8pH/th2kCt3/veQ1x8/Sa1LpO8d3G3HE5pD1tkZg/OyRm62I5Iphxk/ZvC0IaOypDzjO5NfXriakmjkljT+r9lIqKcRH1HFoVlnWHtoNJvmlz7loI33NOtwCVXYufPN9i3jankWUgT22ZW36yD+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1LrhEnC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1LrhEnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttFA6KXnCKLshNnRCUvMdxdw/LdWUHfs73bnazzKqOM=;
	b=g1LrhEnC7uESk2oRlriQHgV0eXRvyEQiCDb9gBOsv/sT4MlS6MmSy/jY3vwVk/nKJPRp6T
	3FDeUBdVAgNX9tUjyMOrygIJwsT7otQ0cCe7kXG0pn1gWlrhk7McCPDEzOZn6OTMvZb9w2
	lrPO8zUUvPU/gM0uMMX/Dc3bSVoDvh0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-WMMmR6YkMp28soxEJ0jMiA-1; Wed, 29 Jan 2025 06:54:27 -0500
X-MC-Unique: WMMmR6YkMp28soxEJ0jMiA-1
X-Mimecast-MFC-AGG-ID: WMMmR6YkMp28soxEJ0jMiA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385fdff9db5so2367669f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151666; x=1738756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttFA6KXnCKLshNnRCUvMdxdw/LdWUHfs73bnazzKqOM=;
        b=YQH2ym8k90o85wVhxzoM8Vae0lf5qvUAt7nC2g3Ixc+EfwavIKw4k7CZctEeuMaZLh
         1ShS1skGwJwAeLBsfIi1T9zxABwLTAYXb9lgRG2sG8eA5Ko8XacFXZP8mw0j7nRseInF
         EdgJw0IUCHPt7fv1kV4szIFe4hT5MkF05AivaCFUUy4lBrTZX5Re68Pji+kLbTvMdPtD
         qNI5TPagcY+wTNhNJhBGFPsgHAKQAFJ570kHTmzbBtUV9i9WPsUtC8lDswQ2YHuukBIi
         bSMVSTyQg9EBJUyGEt2iN4dvym3cAhGnSDenb92i3hqqq7AMygkULnRmhGleNg0AOUsm
         4XNg==
X-Gm-Message-State: AOJu0YyBXrrIlMog3st+PXXn+0mzs4jrztAzIqNUQgIHTTAY7Ds3OUyN
	abbAJgo+9f+RqviwQLne8ih6f7f72jgW6X6+uyPjyNLG6/jEdBcp4vlA+bhiuoSvFVcvX6K1hyG
	EyYpfuljbIOqY9KD7v+FX+dB+IeqvMtFw72AfKs6TlsytPjzWzFp7LJAXDw==
X-Gm-Gg: ASbGncsnfHzSORROP1+jP/TuEpXiOGLrIMzIz1dowhmndGlQpgj7RlVWvGjrgLi3FG2
	aZwEkcyZ3Y2fvJonO+OE5fw71dfAkvDFTfZrS8CPthsT+OGUXReDP09H6D29ewV+3w7jojaLxOO
	8Es+hZ8e4f5yyY3/v6wN81Df7nsa3oQwTn9PoHZSxEUDYjziKQbFoX3/Ha2KUdXUWpNhZSBqKlR
	HgYpi+eWB55P68jC8cuZvvsLyFH/8BAZ2KTEABjWZB05PCtmmu3KZ/ql/qqXHfG66nKlXU1Op/Y
	NACdoZ1NHbbh96vgEKoQruZBykm7qKWFsKmg26GeqOZmtfmzbS+jfsr6uLEKUmDLwA==
X-Received: by 2002:a05:6000:11c9:b0:38c:1270:f961 with SMTP id ffacd0b85a97d-38c520b7c7fmr2019770f8f.46.1738151666559;
        Wed, 29 Jan 2025 03:54:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExNZpiTenD6CJ57erMOTnO5s4zsyHNUaMa/bCtN9QyTRZVkdeAROPCHCw+IAs2gC6Ff7tvTA==
X-Received: by 2002:a05:6000:11c9:b0:38c:1270:f961 with SMTP id ffacd0b85a97d-38c520b7c7fmr2019743f8f.46.1738151666064;
        Wed, 29 Jan 2025 03:54:26 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1bb0besm17079668f8f.79.2025.01.29.03.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:25 -0800 (PST)
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
Subject: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using folio_walk instead of rmap walk
Date: Wed, 29 Jan 2025 12:54:02 +0100
Message-ID: <20250129115411.2077152-5-david@redhat.com>
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

We require a writable PTE and only support anonymous folio: we can only
have exactly one PTE pointing at that page, which we can just lookup
using a folio walk, avoiding the rmap walk and the anon VMA lock.

So let's stop doing an rmap walk and perform a folio walk instead, so we
can easily just modify a single PTE and avoid relying on rmap/mapcounts.

We now effectively work on a single PTE instead of multiple PTEs of
a large folio, allowing for conversion of individual PTEs from
non-exclusive to device-exclusive -- note that the other way always
worked on single PTEs.

We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
that is not required: GUP will already take care of the
MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
entry) when not finding a present PTE and having to trigger a fault and
ending up in remove_device_exclusive_entry(). Note that the PTE is
always writable, and we can always create a writable-device-exclusive
entry.

With this change, device-exclusive is fully compatible with THPs /
large folios. We still require PMD-sized THPs to get PTE-mapped, and
supporting PMD-mapped THP (without the PTE-remapping) is a different
endeavour that might not be worth it at this point.

This gets rid of the "folio_mapcount()" usage and let's us fix ordinary
rmap walks (migration/swapout) next. Spell out that messing with the
mapcount is wrong and must be fixed.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 188 ++++++++++++++++--------------------------------------
 1 file changed, 55 insertions(+), 133 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 676df4fba5b0..49ffac6d27f8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2375,131 +2375,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
 }
 
 #ifdef CONFIG_DEVICE_PRIVATE
-struct make_exclusive_args {
-	struct mm_struct *mm;
-	unsigned long address;
-	void *owner;
-	bool valid;
-};
-
-static bool page_make_device_exclusive_one(struct folio *folio,
-		struct vm_area_struct *vma, unsigned long address, void *priv)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
-	struct make_exclusive_args *args = priv;
-	pte_t pteval;
-	struct page *subpage;
-	bool ret = true;
-	struct mmu_notifier_range range;
-	swp_entry_t entry;
-	pte_t swp_pte;
-	pte_t ptent;
-
-	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
-				      vma->vm_mm, address, min(vma->vm_end,
-				      address + folio_size(folio)),
-				      args->owner);
-	mmu_notifier_invalidate_range_start(&range);
-
-	while (page_vma_mapped_walk(&pvmw)) {
-		/* Unexpected PMD-mapped THP? */
-		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
-
-		ptent = ptep_get(pvmw.pte);
-		if (!pte_present(ptent)) {
-			ret = false;
-			page_vma_mapped_walk_done(&pvmw);
-			break;
-		}
-
-		subpage = folio_page(folio,
-				pte_pfn(ptent) - folio_pfn(folio));
-		address = pvmw.address;
-
-		/* Nuke the page table entry. */
-		flush_cache_page(vma, address, pte_pfn(ptent));
-		pteval = ptep_clear_flush(vma, address, pvmw.pte);
-
-		/* Set the dirty flag on the folio now the pte is gone. */
-		if (pte_dirty(pteval))
-			folio_mark_dirty(folio);
-
-		/*
-		 * Check that our target page is still mapped at the expected
-		 * address.
-		 */
-		if (args->mm == mm && args->address == address &&
-		    pte_write(pteval))
-			args->valid = true;
-
-		/*
-		 * Store the pfn of the page in a special migration
-		 * pte. do_swap_page() will wait until the migration
-		 * pte is removed and then restart fault handling.
-		 */
-		if (pte_write(pteval))
-			entry = make_writable_device_exclusive_entry(
-							page_to_pfn(subpage));
-		else
-			entry = make_readable_device_exclusive_entry(
-							page_to_pfn(subpage));
-		swp_pte = swp_entry_to_pte(entry);
-		if (pte_soft_dirty(pteval))
-			swp_pte = pte_swp_mksoft_dirty(swp_pte);
-		if (pte_uffd_wp(pteval))
-			swp_pte = pte_swp_mkuffd_wp(swp_pte);
-
-		set_pte_at(mm, address, pvmw.pte, swp_pte);
-
-		/*
-		 * There is a reference on the page for the swap entry which has
-		 * been removed, so shouldn't take another.
-		 */
-		folio_remove_rmap_pte(folio, subpage, vma);
-	}
-
-	mmu_notifier_invalidate_range_end(&range);
-
-	return ret;
-}
-
-/**
- * folio_make_device_exclusive - Mark the folio exclusively owned by a device.
- * @folio: The folio to replace page table entries for.
- * @mm: The mm_struct where the folio is expected to be mapped.
- * @address: Address where the folio is expected to be mapped.
- * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
- *
- * Tries to remove all the page table entries which are mapping this
- * folio and replace them with special device exclusive swap entries to
- * grant a device exclusive access to the folio.
- *
- * Context: Caller must hold the folio lock.
- * Return: false if the page is still mapped, or if it could not be unmapped
- * from the expected address. Otherwise returns true (success).
- */
-static bool folio_make_device_exclusive(struct folio *folio,
-		struct mm_struct *mm, unsigned long address, void *owner)
-{
-	struct make_exclusive_args args = {
-		.mm = mm,
-		.address = address,
-		.owner = owner,
-		.valid = false,
-	};
-	struct rmap_walk_control rwc = {
-		.rmap_one = page_make_device_exclusive_one,
-		.done = folio_not_mapped,
-		.anon_lock = folio_lock_anon_vma_read,
-		.arg = &args,
-	};
-
-	rmap_walk(folio, &rwc);
-
-	return args.valid && !folio_mapcount(folio);
-}
-
 /**
  * make_device_exclusive() - Mark an address for exclusive use by a device
  * @mm: mm_struct of associated target process
@@ -2530,9 +2405,12 @@ static bool folio_make_device_exclusive(struct folio *folio,
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		void *owner, struct folio **foliop)
 {
-	struct folio *folio;
+	struct folio *folio, *fw_folio;
+	struct vm_area_struct *vma;
+	struct folio_walk fw;
 	struct page *page;
-	long npages;
+	swp_entry_t entry;
+	pte_t swp_pte;
 
 	mmap_assert_locked(mm);
 
@@ -2540,12 +2418,16 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * Fault in the page writable and try to lock it; note that if the
 	 * address would already be marked for exclusive use by the device,
 	 * the GUP call would undo that first by triggering a fault.
+	 *
+	 * If any other device would already map this page exclusively, the
+	 * fault will trigger a conversion to an ordinary
+	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
 	 */
-	npages = get_user_pages_remote(mm, addr, 1,
-				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
-				       &page, NULL);
-	if (npages != 1)
-		return ERR_PTR(npages);
+	page = get_user_page_vma_remote(mm, addr,
+					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
+					&vma);
+	if (IS_ERR(page))
+		return page;
 	folio = page_folio(page);
 
 	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
@@ -2558,11 +2440,51 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		return ERR_PTR(-EBUSY);
 	}
 
-	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
+	/*
+	 * Let's do a second walk and make sure we still find the same page
+	 * mapped writable. If we don't find what we expect, we will trigger
+	 * GUP again to fix it up. Note that a page of an anonymous folio can
+	 * only be mapped writable using exactly one page table mapping
+	 * ("exclusive"), so there cannot be other mappings.
+	 */
+	fw_folio = folio_walk_start(&fw, vma, addr, 0);
+	if (fw_folio != folio || fw.page != page ||
+	    fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
+		if (fw_folio)
+			folio_walk_end(&fw, vma);
 		folio_unlock(folio);
 		folio_put(folio);
 		return ERR_PTR(-EBUSY);
 	}
+
+	/* Nuke the page table entry so we get the uptodate dirty bit. */
+	flush_cache_page(vma, addr, page_to_pfn(page));
+	fw.pte = ptep_clear_flush(vma, addr, fw.ptep);
+
+	/* Set the dirty flag on the folio now the pte is gone. */
+	if (pte_dirty(fw.pte))
+		folio_mark_dirty(folio);
+
+	/*
+	 * Store the pfn of the page in a special device-exclusive non-swap pte.
+	 * do_swap_page() will trigger the conversion back while holding the
+	 * folio lock.
+	 */
+	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
+	swp_pte = swp_entry_to_pte(entry);
+	if (pte_soft_dirty(fw.pte))
+		swp_pte = pte_swp_mksoft_dirty(swp_pte);
+	/* The pte is writable, uffd-wp does not apply. */
+	set_pte_at(mm, addr, fw.ptep, swp_pte);
+
+	/*
+	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
+	 * does not count as a mapping (mapcount), which is wrong and must be
+	 * fixed, otherwise RMAP walks don't behave as expected.
+	 */
+	folio_remove_rmap_pte(folio, page, vma);
+
+	folio_walk_end(&fw, vma);
 	*foliop = folio;
 	return page;
 }
-- 
2.48.1

