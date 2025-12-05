Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64B2F1FE3
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963845; cv=none; b=lkgxYc4tPEfDEIkOI4FIz3FHfdwo2kS2EQtN5OHiDMazzZ9Z2M5UghvwLX/DCh2yM2qDT2c4c+3wY3YGLlRe+7myw7BEV3IE7fqXeB7HAcBYyxlpM8Hxq/fETUo1vMRyBUE90jD2kS92yN+prSRFJmkQCsz6nq+dKN0oYto9J/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963845; c=relaxed/simple;
	bh=aRuaBPQblmvTnyI7HZyvBqu8OdLwNSnG7V4pefLWmQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLPS6f2bceFZ3A9v2GX6PhDDUSKg00YcfWUOisJyFyIEUd4v1i0gHF8BTAm7JL3SR2ZSGvX3OxzfDx+Tjv9bulMaqrlYaZPMSFFCneMoeQSWXv65bQsbRwg9kLWB1n6KJjBw2OLiFPCUFLDkxNI6qMcaNtk+lm3CYpLZ7d9hyzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muUXzYzP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muUXzYzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6059CC116B1;
	Fri,  5 Dec 2025 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963841;
	bh=aRuaBPQblmvTnyI7HZyvBqu8OdLwNSnG7V4pefLWmQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muUXzYzPTZQahAVBZqR8QkKNYYbCUCQ82RE5wG40dlaj0ckgKcfUsaX5II6z5Pidk
	 +P3QpJDVk9uK8Z5k23oWhn8dH98deA+biXDjwovCzcoKFsJ0n9GkQLFRRTY1A7HD/V
	 poQDtWGEy1/DgeLNpQEzPXFcizOtdl+R7hqrYuLGX6gg9UQrWgCzk+gmuC+dmIovSy
	 rjlX5BIBXE3DVQoSijWxqJl70QNqIqNZNyJ4FmM1G+m/BQS+WjqdnwUmCbBaCf/me/
	 HLTPBmkVR5BdCv4iDBo/PhN+WZLK4fKBnaqs9eWkGWwzOoWBQ1Ax+umvjAyceEEkno
	 iKwCBf6/dw2wA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id AF453F40070;
	Fri,  5 Dec 2025 14:44:00 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 05 Dec 2025 14:44:00 -0500
X-ME-Sender: <xms:ADYzaV-3Lxo_1wb1YWuc63ysXpclfvXSSTqpb8H55n7NKQvUdcaOkg>
    <xme:ADYzabEEv9SaIwu4yu5EhdYy5cmM494YRa-bzybY-auTk29aImMHrtbPK6WuDUzkQ
    0i9B3_a869k0mgli45miG3zgW23oVeb6-DQuUbpIJ5RP595SDGfAqI>
X-ME-Received: <xmr:ADYzacTEbqB6s44ZmjKw-b9s9I8-maBbjxU9KoMzxvJZnI80ob91_KTvoGNjCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ADYzaRuWmDQfq-bVg_E6V7R1GTEsow3LcyJbGcuUVEnsv8XgRCSEfQ>
    <xmx:ADYzaRA1XlwlGqlOeDMkbi2fsogyScQTqv0nxVyMxDitVJNyHfiYJA>
    <xmx:ADYzaWdVbNdKZpOdLK2AsI3nxW-4FwxKkknH72r5VSWpTS3U6GEQog>
    <xmx:ADYzaRo5vswsnSAOn8MMUqVU5uzqEmZPD1uokEacvE30h7WKFS7Yvw>
    <xmx:ADYzaS7k-WhrWx8Jrii6xDUVe280lYcLtyoYIa6D9CIfN7WLMDu3wiNy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:44:00 -0500 (EST)
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
Subject: [PATCH 04/11] mm: Rework compound_head() for power-of-2 sizeof(struct page)
Date: Fri,  5 Dec 2025 19:43:40 +0000
Message-ID: <20251205194351.1646318-5-kas@kernel.org>
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

For tail pages, the kernel uses the 'compound_info' field to get to the
head page. The bit 0 of the field indicates whether the page is a
tail page, and if set, the remaining bits represent a pointer to the
head page.

For cases when size of struct page is power-of-2, change the encoding of
compound_info to store a mask that can be applied to the virtual address
of the tail page in order to access the head page. It is possible
because sturct page of the head page is naturally aligned with regards
to order of the page.

The significant impact of this modification is that all tail pages of
the same order will now have identical 'compound_info', regardless of
the compound page they are associated with. This paves the way for
eliminating fake heads.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h | 61 +++++++++++++++++++++++++++++++++-----
 mm/util.c                  | 15 +++++++---
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 11d9499e5ced..eef02fbbb40f 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -210,6 +210,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
 	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
 		return page;
 
+	/*
+	 * Fake heads only exists if size of struct page is power-of-2.
+	 * See hugetlb_vmemmap_optimizable_size().
+	 */
+	if (!is_power_of_2(sizeof(struct page)))
+		return page;
+
 	/*
 	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
 	 * struct page. The alignment check aims to avoid access the fields (
@@ -223,10 +230,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
 		 * because the @page is a compound page composed with at least
 		 * two contiguous pages.
 		 */
-		unsigned long head = READ_ONCE(page[1].compound_info);
+		unsigned long info = READ_ONCE(page[1].compound_info);
 
-		if (likely(head & 1))
-			return (const struct page *)(head - 1);
+		if (likely(info & 1)) {
+			unsigned long p = (unsigned long)page;
+
+			return (const struct page *)(p & info);
+		}
 	}
 	return page;
 }
@@ -281,11 +291,27 @@ static __always_inline int page_is_fake_head(const struct page *page)
 
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
+	 * If the size of struct page is not power-of-2, the rest if
+	 * compound_info is the pointer to the head page.
+	 */
+	if (!is_power_of_2(sizeof(struct page)))
+		return info - 1;
+
+	/*
+	 * If the size of struct page is power-of-2 it is set the rest of
+	 * the info encodes the mask that converts the address of the tail
+	 * page to the head page.
+	 *
+	 * No need to clear bit 0 in the mask as 'page' always has it clear.
+	 */
+	return (unsigned long)page & info;
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
@@ -294,7 +320,26 @@ static __always_inline void set_compound_head(struct page *page,
 					      struct page *head,
 					      unsigned int order)
 {
-	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
+	unsigned int shift;
+	unsigned long mask;
+
+	if (!is_power_of_2(sizeof(struct page))) {
+		WRITE_ONCE(page->compound_info, (unsigned long)head | 1);
+		return;
+	}
+
+	/*
+	 * If the size of struct page is power-of-2, bits [shift:0] of the
+	 * virtual address of compound head are zero.
+	 *
+	 * Calculate mask that can be applied the virtual address of the
+	 * tail page to get address of the head page.
+	 */
+	shift = order + order_base_2(sizeof(struct page));
+	mask = GENMASK(BITS_PER_LONG - 1, shift);
+
+	/* Bit 0 encodes PageTail() */
+	WRITE_ONCE(page->compound_info, mask | 1);
 }
 
 static __always_inline void clear_compound_head(struct page *page)
diff --git a/mm/util.c b/mm/util.c
index cbf93cf3223a..6723d2bb7f1e 100644
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
@@ -1256,7 +1256,14 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 		}
 		foliop = (struct folio *)page;
 	} else {
-		foliop = (struct folio *)(head - 1);
+		unsigned long p = (unsigned long)page;
+
+		/* See compound_head() */
+		if (is_power_of_2(sizeof(struct page)))
+			foliop = (struct folio *)(p & info);
+		else
+			foliop = (struct folio *)(info - 1);
+
 		ps->idx = folio_page_idx(foliop, page);
 	}
 
-- 
2.51.2

