Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC9345CCD
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963847; cv=none; b=Qnq959S4Z7hBftz2doXoZcbDkGIRKVSN4Z0tQmTaisgGMe6pJcCWHI4nqUl1na1tnjRKyAkNvJSmCStwRjpzOT1nK+CPv2oQF7u1ieri2SgSmqnwSOXPdKH4dcdQnlHh6AJgPSMLE/9uXw26TQcTqqDPobBINke4LROnxQ4TCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963847; c=relaxed/simple;
	bh=QSFmiqQuAu4Xe8qwQuUx5JcV9uyzyjf22IqZdZAyLHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHDtUd7q2+QcjhvaqAt4hmvx5zIv51cb4y+P/7+R3ZtcrbMWnokpG1QvUoxjgd6qHsRv0VaGNL3QJxSpvS8eFIskok5TLFFYwUF/y/ZmgwL/24pJUNhx/TgyWf6FqM0QciFVUX9nN0mMkX7QHbEwLIeuUgtx7nZ/RUOwDZQ5K58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYBZl+RF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYBZl+RF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D23EC116B1;
	Fri,  5 Dec 2025 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963846;
	bh=QSFmiqQuAu4Xe8qwQuUx5JcV9uyzyjf22IqZdZAyLHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YYBZl+RFV5ksiVH6NISnSSMBo/mhcOKzJuEWY5Pp+wC7asR3BN6qPaFjNKjZfrimC
	 K8OxiULVd3Yn2ye9Kfr2j5ecodkEZkAENl+M9xuunlVPEAxyIJlCD9H9iFNSh2rske
	 JeX8z5NuAJejFQkx8ckt4LKSzQevIAOEXOv5GfQagVMATh0/ZKqPVbAzmnvgRJglHx
	 YWcygjV0yCovSob3ppuLwR6tFh6Kf3KGYH9BdCogYM+QYfBL+A5TyHkuZmBqQTLGEk
	 rydEW+5V/WMIaLl6G/N8ojQTR3WaK/6Q/y+9MBHtO39pi+znAircJ+QRACAUp52FZ+
	 VTMBULgDSVbqg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 882CBF40070;
	Fri,  5 Dec 2025 14:44:05 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 05 Dec 2025 14:44:05 -0500
X-ME-Sender: <xms:BTYzaUiH0EleHELMpgzNYfeRWNpDBGLhGQeCsCodEuQbhArq_9QkbA>
    <xme:BTYzaebgzk82Q_-pS8TTpGy8ZM53h9OeSesYBDF__EaeCvzcibj8MpAdi25X8DRvx
    GWoCaZPw9mYzetdLTW-SCedVaioag9vXa7Y-oRn21KV3iEnGJa0lnA>
X-ME-Received: <xmr:BTYzaVUl4zylC-TQGQMgpfXIIiisJZ3TbAuF8c3byXwQtmH6R5EWXGMls3_97A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    ephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdevnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
    hlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddv
    keeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrg
    hmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmh
    hutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpd
    hrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghk
    rgesshhushgvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorh
    grtghlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepiihihiesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:BTYzadj5kyRkWn0mhn5ci5DWGDJkMzomCYi9Wmc91nhPG1yANlNEIg>
    <xmx:BTYzaYl6Pz7ooWqAWChz3x0Nb8ZvfJklcoCL_OpcHlXsck7v84Ps5Q>
    <xmx:BTYzaeyfTWIDVeuRVN8Hb29SVDKaZ2__rWG3ECmTnqkZHfh_MFzRMw>
    <xmx:BTYzabtxOmArYk9XX8-9gOJQKlzuOuRiQs7CMo7wPdLy9XHeRV3leg>
    <xmx:BTYzabumKqJHXStWHe43bAEv_2IpqUB2w9Kfg-rgbZ31SC6h4DCxpm7f>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:44:05 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Usama Arif <usamaarif642@gmail.com>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH 07/11] mm: Drop fake head checks and fix a race condition
Date: Fri,  5 Dec 2025 19:43:43 +0000
Message-ID: <20251205194351.1646318-8-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251205194351.1646318-1-kas@kernel.org>
References: <20251205194351.1646318-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fake heads are no longer in use, so checks for them should be removed.

It simplifies compound_head() and page_ref_add_unless() substantially.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h | 95 ++------------------------------------
 include/linux/page_ref.h   |  8 +---
 2 files changed, 4 insertions(+), 99 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index eef02fbbb40f..8acb141a127b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -198,104 +198,15 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 
-/*
- * Return the real head page struct iff the @page is a fake head page, otherwise
- * return the @page itself. See Documentation/mm/vmemmap_dedup.rst.
- */
-static __always_inline const struct page *page_fixed_fake_head(const struct page *page)
-{
-	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
-		return page;
-
-	/*
-	 * Fake heads only exists if size of struct page is power-of-2.
-	 * See hugetlb_vmemmap_optimizable_size().
-	 */
-	if (!is_power_of_2(sizeof(struct page)))
-		return page;
-
-	/*
-	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
-	 * struct page. The alignment check aims to avoid access the fields (
-	 * e.g. compound_info) of the @page[1]. It can avoid touch a (possibly)
-	 * cold cacheline in some cases.
-	 */
-	if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
-	    test_bit(PG_head, &page->flags.f)) {
-		/*
-		 * We can safely access the field of the @page[1] with PG_head
-		 * because the @page is a compound page composed with at least
-		 * two contiguous pages.
-		 */
-		unsigned long info = READ_ONCE(page[1].compound_info);
-
-		if (likely(info & 1)) {
-			unsigned long p = (unsigned long)page;
-
-			return (const struct page *)(p & info);
-		}
-	}
-	return page;
-}
-
-static __always_inline bool page_count_writable(const struct page *page, int u)
-{
-	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
-		return true;
-
-	/*
-	 * The refcount check is ordered before the fake-head check to prevent
-	 * the following race:
-	 *   CPU 1 (HVO)                     CPU 2 (speculative PFN walker)
-	 *
-	 *   page_ref_freeze()
-	 *   synchronize_rcu()
-	 *                                   rcu_read_lock()
-	 *                                   page_is_fake_head() is false
-	 *   vmemmap_remap_pte()
-	 *   XXX: struct page[] becomes r/o
-	 *
-	 *   page_ref_unfreeze()
-	 *                                   page_ref_count() is not zero
-	 *
-	 *                                   atomic_add_unless(&page->_refcount)
-	 *                                   XXX: try to modify r/o struct page[]
-	 *
-	 * The refcount check also prevents modification attempts to other (r/o)
-	 * tail pages that are not fake heads.
-	 */
-	if (atomic_read_acquire(&page->_refcount) == u)
-		return false;
-
-	return page_fixed_fake_head(page) == page;
-}
-#else
-static inline const struct page *page_fixed_fake_head(const struct page *page)
-{
-	return page;
-}
-
-static inline bool page_count_writable(const struct page *page, int u)
-{
-	return true;
-}
-#endif
-
-static __always_inline int page_is_fake_head(const struct page *page)
-{
-	return page_fixed_fake_head(page) != page;
-}
-
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
 
 	/* Bit 0 encodes PageTail() */
 	if (!(info & 1))
-		return (unsigned long)page_fixed_fake_head(page);
+		return (unsigned long)page;
 
 	/*
 	 * If the size of struct page is not power-of-2, the rest if
@@ -377,7 +288,7 @@ static __always_inline void clear_compound_head(struct page *page)
 
 static __always_inline int PageTail(const struct page *page)
 {
-	return READ_ONCE(page->compound_info) & 1 || page_is_fake_head(page);
+	return READ_ONCE(page->compound_info) & 1;
 }
 
 static __always_inline int PageCompound(const struct page *page)
@@ -904,7 +815,7 @@ static __always_inline bool folio_test_head(const struct folio *folio)
 static __always_inline int PageHead(const struct page *page)
 {
 	PF_POISONED_CHECK(page);
-	return test_bit(PG_head, &page->flags.f) && !page_is_fake_head(page);
+	return test_bit(PG_head, &page->flags.f);
 }
 
 __SETPAGEFLAG(Head, head, PF_ANY)
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 544150d1d5fd..490d0ad6e56d 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -230,13 +230,7 @@ static inline int folio_ref_dec_return(struct folio *folio)
 
 static inline bool page_ref_add_unless(struct page *page, int nr, int u)
 {
-	bool ret = false;
-
-	rcu_read_lock();
-	/* avoid writing to the vmemmap area being remapped */
-	if (page_count_writable(page, u))
-		ret = atomic_add_unless(&page->_refcount, nr, u);
-	rcu_read_unlock();
+	bool ret = atomic_add_unless(&page->_refcount, nr, u);
 
 	if (page_ref_tracepoint_active(page_ref_mod_unless))
 		__page_ref_mod_unless(page, nr, ret);
-- 
2.51.2

