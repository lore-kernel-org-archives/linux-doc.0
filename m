Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E9344031
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070616; cv=none; b=GMB3ALT5bkEDXf/w3p8uji9QKjzwYg56ktQ691Wmss1vkvpLGMDFVrHTohQXSZcZJEHvoTJ+OW/fNfvvZaWRQJlsa5jYS5XJkIWFk3MALqVbue7eSOX+x+3cj5/jKoH48WA/tjucy4kZZgemqAtMUcJ3Kg35t8kLVp6Voc7HEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070616; c=relaxed/simple;
	bh=gUJboi084+oJ/+7QBnw/f3iBTg5QbRgqWMYm6NfXmSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqgsFiLnovR3O+bYUINvIDXVyTPg/ms2C7XC1nbtRrDG89hbdkw0SP38lLjnasKgDpEMufLvtieumLotAxVgXjGhrctCZ38DfYp3pSR65BCTkR1OyDeKs8xn9199eeGq9jqtu0eD7NOaUFVxMT4tWxGpURi2VJPzPuDpr4jT4aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIq6z2Mb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIq6z2Mb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E443BC116D0;
	Thu, 18 Dec 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070616;
	bh=gUJboi084+oJ/+7QBnw/f3iBTg5QbRgqWMYm6NfXmSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iIq6z2MbTCm85m6bFIbnBycalop6OftakaUBDSFiEYt66jEGEiz6tgjaDIwVC5qmk
	 HqcvKtaoTsTjQipEUGcAoFpkj345wNaV2S4IyDjJWpdIWZSFZC3pAIwBK9NGldIJ/r
	 SkGCaEh5jxMo9FmGxZZ7smE7Dscav9bvlN7mk3vJx0JvzDOEjDp5AKNd7wQO/Up3VW
	 y/KNGtq/yUmx/WRSxe5RTSPGS6NkdJ5ayJkv97SNxIwXegjItP6erYK+p4QzSK5hSK
	 SaRgD+WnJx9f6KJmtnFxJfl8j1ohG8uqJ1qJzYVgLeCMX8Qr8edVWO2BznZ8Sx5RTe
	 eNyCNInjwMPCQ==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 41F17F40078;
	Thu, 18 Dec 2025 10:10:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 18 Dec 2025 10:10:15 -0500
X-ME-Sender: <xms:VxlEaaVuPks7R6wFtEDdIRQst4L0eZII5IxfeesvzBw2zQWV4wZK7g>
    <xme:VxlEaV2Sz1sC-al6neE3iWWLrmBqmOYDcrsSAI1bG7Bk1eKjSV3lVjpXrmRmvoZGh
    45pVUfeuaPhTTsD5Fut4f3rDiPeQs0rGazKDjZpO4_vLvoX0LkTwg>
X-ME-Received: <xmr:VxlEaRPU-0IGZbBXnCcORcqggFh6n7ZMQjt1oBR1xnBMGG1lo3v53nhcyXeYCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhudefjeehhfektdeuvdefveejffdvhfevtddugfduffejfeeikeelhedvtedvveen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrug
    horhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:VxlEaY01GD6ZoysoBopTypgNlWdBBwY27VD0U7FB309DXJkzfAc7aA>
    <xmx:VxlEaY3DswfPDhOqXXnG9Y24GlsHYwBv1uTzO1uaso0zEqoMVD6XTQ>
    <xmx:VxlEae8_OjEKaK1E1ACpgVsQX8cQtZLLqmqrzPll3krKjhm6c8hqMw>
    <xmx:VxlEacbZpYbK2_Lc-86Kkn4fZ0j98DTsrUbG9E9OWBJn0Sv2ZzErLQ>
    <xmx:VxlEaVyHQCDTEmAITVu5K3-xSZ367ekPRu_NBoygEbUs0YfDl9RKDEdA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:10:14 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv2 12/14] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
Date: Thu, 18 Dec 2025 15:09:43 +0000
Message-ID: <20251218150949.721480-13-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218150949.721480-1-kas@kernel.org>
References: <20251218150949.721480-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hugetlb_optimize_vmemmap_key static key was used to guard fake head
detection in compound_head() and related functions. It allowed skipping
the fake head checks entirely when HVO was not in use.

With fake heads eliminated and the detection code removed, the static
key serves no purpose. Remove its definition and all increment/decrement
calls.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h |  2 --
 mm/hugetlb_vmemmap.c       | 14 ++------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 9d89beed9df6..2255e7e6759c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -198,8 +198,6 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
-DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index cc0fcf847810..f68ed7ebf873 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -399,9 +399,6 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 	return vmemmap_remap_range(start, end, &walk);
 }
 
-DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
-
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
 static int __init hugetlb_vmemmap_optimize_param(char *buf)
 {
@@ -431,10 +428,8 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
 	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
-	if (!ret) {
+	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-		static_branch_dec(&hugetlb_optimize_vmemmap_key);
-	}
 
 	return ret;
 }
@@ -566,8 +561,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	if (!vmemmap_tail)
 		return -ENOMEM;
 
-	static_branch_inc(&hugetlb_optimize_vmemmap_key);
-
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -604,10 +597,8 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 				 vmemmap_head, vmemmap_tail,
 				 vmemmap_pages, flags);
 out:
-	if (ret) {
-		static_branch_dec(&hugetlb_optimize_vmemmap_key);
+	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-	}
 
 	return ret;
 }
@@ -673,7 +664,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
 					&folio->page,
 					HUGETLB_VMEMMAP_RESERVE_SIZE);
-			static_branch_inc(&hugetlb_optimize_vmemmap_key);
 			continue;
 		}
 
-- 
2.51.2

