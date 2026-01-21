Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021342F28EF
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012589; cv=none; b=H3BxFJ9KrvyXaU/Hzo2r8HeA7jw69Qld0fZ1jBjBwUAs831tOtk314a56E7qQShBQ9ZZo99tQ0BZop27kQjEtDN9aofGWXejmDXMuSO8YeKDsShc1VlaHKkd8739yM0idGTly9HPsVFAij67y2/VXvY3TjQyJJk/y95zw6R2uPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012589; c=relaxed/simple;
	bh=jueaS1qYz8lwqJ6jPeGHTAmiWIc9uM56rJANRez3R/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG4YaN68JiRRBg0wG0bmNU3YT1hN5WLzq+uDLebPZI1mocoxoPB/RmkUAzbfWmsd7A+opdIxMrL73X+9am3H06//C/izpCjjlJYB3eP2lC3UsyEBVY+nSI1ddQBbyVwMAsSVgtyJOhxK471fdmEiFvzKmWXuE+O266WYUTVAEWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLMZN8bx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLMZN8bx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058D6C4CEF1;
	Wed, 21 Jan 2026 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012587;
	bh=jueaS1qYz8lwqJ6jPeGHTAmiWIc9uM56rJANRez3R/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nLMZN8bxH2Udd40MxjPH1NFLQAkzv4wR98Ds4WOBgiGYvOtJj2AetQA9fD1dWVUY7
	 37AAnnjpJNsPrTBZ80Yi85t1Fp1KpL8U3+siq6sxk/oEZcJxD+2U2VeG/DIkBms/0d
	 WkioLmF+peQKNuyDs9NIgCXGfk/I3hRTJ3Yw3WviYsuCzYEtWgMx2sUiEUjruXfpgr
	 laVyjknwUV5LJrzVcCJcfrUGh93UVxElqG+cy/l8vsMpbYf5bpuUmAhpEtv3zFuFVp
	 ZuHroXNuE9gaQ8ND/JczgER4bBmYsdlxa5JyXUh79KQjqE5QA6Lhx9gy4u7EYSn+lu
	 W0LXIOe7xLbAA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 35839F4006C;
	Wed, 21 Jan 2026 11:23:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 21 Jan 2026 11:23:06 -0500
X-ME-Sender: <xms:av1waYaz4zFSYizTd6aBKiknUPJTShmK93jihVstO0YoN9SXpknf1g>
    <xme:av1waSoMfKkwipaSorRVP_x_XFu8fvdCPgVttM3g1Ety4UL6LIWcWSML1mGWVK6ZI
    XTJ3cBvo-82KLoVlOLuHtL6FqaLjLISrWMPFqqgZqrnGNubKRsqSDE>
X-ME-Received: <xmr:av1waVze1VlIGhJbcpLHVZoEDRuyuTt0H0zhnYnm16q8g01Fn7edpWGTUBvdSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:av1waaIseKeNx-WhenFN4MgWtK6e-5MDRiDS8faPibTHuLr50a7ZRQ>
    <xmx:av1waX7V6Bq8B9Tuu77yB7cIj7ar0Td6TqFMmtGVTJH7vDPWPquqGQ>
    <xmx:av1waYxpHZVy-28kND70REPanzbJ8tS-V4zwrDxIJQznk1_wfjH-JA>
    <xmx:av1waZ-ffah9k58iThyfFLiMiXZy4YpVE7sD6YWv7_BfNv4OzB_DrA>
    <xmx:av1wacG67Pb49bjNPFRF_AfpmfW7FGBXZYE0y9ON691ERa062XGAkeS3>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:23:05 -0500 (EST)
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
Subject: [PATCHv4 05/14] mm: Rework compound_head() for power-of-2 sizeof(struct page)
Date: Wed, 21 Jan 2026 16:22:42 +0000
Message-ID: <20260121162253.2216580-6-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260121162253.2216580-1-kas@kernel.org>
References: <20260121162253.2216580-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For tail pages, the kernel uses the 'compound_info' field to get to the
head page. The bit 0 of the field indicates whether the page is a
tail page, and if set, the remaining bits represent a pointer to the
head page.

For cases when size of struct page is power-of-2, change the encoding of
compound_info to store a mask that can be applied to the virtual address
of the tail page in order to access the head page. It is possible
because struct page of the head page is naturally aligned with regards
to order of the page.

The significant impact of this modification is that all tail pages of
the same order will now have identical 'compound_info', regardless of
the compound page they are associated with. This paves the way for
eliminating fake heads.

The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
applied when the sizeof(struct page) is power-of-2. Having identical
tail pages allows the same page to be mapped into the vmemmap of all
pages, maintaining memory savings without fake heads.

If sizeof(struct page) is not power-of-2, there is no functional
changes.

Limit mask usage to SPARSEMEM_VMEMMAP where it makes a difference
because HVO. The approach with mask would work for any memory model,
but it requires validating that struct pages are naturally aligned for
all orders up to the MAX_FOLIO order, which can be tricky.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 include/linux/page-flags.h | 81 ++++++++++++++++++++++++++++++++++----
 mm/util.c                  | 16 ++++++--
 2 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 0de7db7efb00..e16a4bc82856 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -198,6 +198,29 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
+/*
+ * For tail pages, if the size of struct page is power-of-2 ->compound_info
+ * encodes the mask that converts the address of the tail page address to
+ * the head page address.
+ *
+ * Otherwise, ->compound_info has direct pointer to head pages.
+ */
+static __always_inline bool compound_info_has_mask(void)
+{
+	/*
+	 * Limit mask usage to SPARSEMEM_VMEMMAP where it makes a difference
+	 * because of the HugeTLB vmemmap optimization (HVO).
+	 *
+	 * The approach with mask would work for any memory model, but it
+	 * requires validating that struct pages are naturally aligned for
+	 * all orders up to the MAX_FOLIO order, which can be tricky.
+	 */
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP))
+		return false;
+
+	return is_power_of_2(sizeof(struct page));
+}
+
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 
@@ -210,6 +233,10 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
 	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
 		return page;
 
+	/* Fake heads only exists if compound_info_has_mask() is true */
+	if (!compound_info_has_mask())
+		return page;
+
 	/*
 	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
 	 * struct page. The alignment check aims to avoid access the fields (
@@ -223,10 +250,14 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
 		 * because the @page is a compound page composed with at least
 		 * two contiguous pages.
 		 */
-		unsigned long head = READ_ONCE(page[1].compound_info);
+		unsigned long info = READ_ONCE(page[1].compound_info);
 
-		if (likely(head & 1))
-			return (const struct page *)(head - 1);
+		/* See set_compound_head() */
+		if (likely(info & 1)) {
+			unsigned long p = (unsigned long)page;
+
+			return (const struct page *)(p & info);
+		}
 	}
 	return page;
 }
@@ -281,11 +312,26 @@ static __always_inline int page_is_fake_head(const struct page *page)
 
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
-	unsigned long head = READ_ONCE(page->compound_info);
+	unsigned long info = READ_ONCE(page->compound_info);
 
-	if (unlikely(head & 1))
-		return head - 1;
-	return (unsigned long)page_fixed_fake_head(page);
+	/* Bit 0 encodes PageTail() */
+	if (!(info & 1))
+		return (unsigned long)page_fixed_fake_head(page);
+
+	/*
+	 * If compound_info_has_mask() is false, the rest of compound_info is
+	 * the pointer to the head page.
+	 */
+	if (!compound_info_has_mask())
+		return info - 1;
+
+	/*
+	 * If compoun_info_has_mask() is true the rest of the info encodes
+	 * the mask that converts the address of the tail page to the head page.
+	 *
+	 * No need to clear bit 0 in the mask as 'page' always has it clear.
+	 */
+	return (unsigned long)page & info;
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
@@ -294,7 +340,26 @@ static __always_inline void set_compound_head(struct page *page,
 					      const struct page *head,
 					      unsigned int order)
 {
-	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
+	unsigned int shift;
+	unsigned long mask;
+
+	if (!compound_info_has_mask()) {
+		WRITE_ONCE(page->compound_info, (unsigned long)head | 1);
+		return;
+	}
+
+	/*
+	 * If the size of struct page is power-of-2, bits [shift:0] of the
+	 * virtual address of compound head are zero.
+	 *
+	 * Calculate mask that can be applied to the virtual address of
+	 * the tail page to get address of the head page.
+	 */
+	shift = order + order_base_2(sizeof(struct page));
+	mask = GENMASK(BITS_PER_LONG - 1, shift);
+
+	/* Bit 0 encodes PageTail() */
+	WRITE_ONCE(page->compound_info, mask | 1);
 }
 
 static __always_inline void clear_compound_head(struct page *page)
diff --git a/mm/util.c b/mm/util.c
index cbf93cf3223a..f01a9655067f 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1234,7 +1234,7 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
  */
 void snapshot_page(struct page_snapshot *ps, const struct page *page)
 {
-	unsigned long head, nr_pages = 1;
+	unsigned long info, nr_pages = 1;
 	struct folio *foliop;
 	int loops = 5;
 
@@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 again:
 	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
 	memcpy(&ps->page_snapshot, page, sizeof(*page));
-	head = ps->page_snapshot.compound_info;
-	if ((head & 1) == 0) {
+	info = ps->page_snapshot.compound_info;
+	if ((info & 1) == 0) {
 		ps->idx = 0;
 		foliop = (struct folio *)&ps->page_snapshot;
 		if (!folio_test_large(foliop)) {
@@ -1256,7 +1256,15 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 		}
 		foliop = (struct folio *)page;
 	} else {
-		foliop = (struct folio *)(head - 1);
+		/* See compound_head() */
+		if (compound_info_has_mask()) {
+			unsigned long p = (unsigned long)page;
+
+			foliop = (struct folio *)(p & info);
+		} else {
+			foliop = (struct folio *)(info - 1);
+		}
+
 		ps->idx = folio_page_idx(foliop, page);
 	}
 
-- 
2.51.2

