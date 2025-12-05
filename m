Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A6346E7D
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963850; cv=none; b=Cn4592k7MpD/3txmtYijyN7eb/ckGT6kUher3HhMh9G6D58YtBMgAxB2dE1hTLHqj9UvNAOW51lJ5P4qDgmdYOtAtcbuqWhB4nz5Q7rXkd7h0KEHc+sM9cDoSlVaV4Az0fL/Mo3xoqZMFl/dnJMOI1c9CadNZLLleuGEZWL7Y4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963850; c=relaxed/simple;
	bh=vhq429tIDs6D+pc33PO6NtrAK6m6SZT/09TRSadLOc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bL01wM5MqMbjgCATwRM8kE3ZmELL1W9N09+QiyYgJoZiDglVOApbEGAk8TvgWjK42p/unahdH7ih6Qa3mFPjT0zkampa5BysKwt1+7k5C+pjETqQLoxw8Mh1W5pzXgy5s6DPg+ZevX7egq7T9D5gH3GX6hg/Z2uqAa4NVYmBCWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLf/PxO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLf/PxO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E7FC4AF0B;
	Fri,  5 Dec 2025 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963849;
	bh=vhq429tIDs6D+pc33PO6NtrAK6m6SZT/09TRSadLOc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLf/PxO2bIa2dLsNQWmR3fp7RUrn173XdagBc/dThaXfI/1qYUq32/aNQjfu2yZTc
	 qkF4cam8ltdgjwlqW53nmM9v6FlPVYuJrn6FJzIlUJE5FORYNycBnhW8LTtsKAmoCI
	 oiIEg8TId8GDsd6sCvPZmMp3/9gjKfC8za55ldVUaDYeDOFPWvS8b0VStgEAje0E6/
	 7moY5p66hY07yVE9lMT9TrTvey+YiGVER7i4CNA1d0ybI3D/51Naw7JOKlLzorfxTg
	 VCESekFSP1WkFk3YzQsWkB0Sc3co1usThtKhhEJbWU21TrRcWgarg0IepuNhE9Ij0k
	 FZpw8mYgSwCew==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 76B72F40072;
	Fri,  5 Dec 2025 14:44:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 14:44:08 -0500
X-ME-Sender: <xms:CDYzaefIZCTiqGXYT5WkuWRJR8sscdkVkaL5JToyA9Y76EPlq3cM4g>
    <xme:CDYzaZmrd_RLPJ15ayil_GEj0CavyYqE3Gn2EDtHQnXxiyUKKyJy9ajyklkeAdpHT
    KQxSQQfdxCXtpKuuwPno5BwQ5-adFv0NOGyFqRDH7faEpHMulZAPD5S>
X-ME-Received: <xmr:CDYzaYxF4hWozMdNyo9CCCCe4Emc9wGVPNRBbIxP2BICvrdpNVGRQ5IP89Sgrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    ephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdevnecu
    vehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
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
X-ME-Proxy: <xmx:CDYzaUMb2iRiA5kEGlZbJmJdxlsxBBb6tLUuPccIGtppBZ-jCWla2w>
    <xmx:CDYzaRjXxfZcYsBbj8qyhp0d6vF-03iuSZNVSklt_yJ6wgCPMXUzUg>
    <xmx:CDYzac-CfwCtvoil9w1pMlLMt5npTKtBKiz17Ud5d4zh0ffwn0xNRQ>
    <xmx:CDYzaWL-k5DV0bieawBRqM7csVn1hagY5nwUlNkNqEt1OU3piNzkhA>
    <xmx:CDYzadaTnSjredx5HS3876LIJPKpoX8hnpt7Vyfy5GbW5qIqFHwRg7Kd>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:44:08 -0500 (EST)
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
Subject: [PATCH 09/11] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
Date: Fri,  5 Dec 2025 19:43:45 +0000
Message-ID: <20251205194351.1646318-10-kas@kernel.org>
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

The static key is no longer used.

Removed it.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h |  2 --
 mm/hugetlb_vmemmap.c       | 14 ++------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 8acb141a127b..02a851ab7f5e 100644
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
index 0f142e4eafb9..81f5160ff216 100644
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
@@ -432,10 +429,8 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
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
@@ -548,8 +543,6 @@ static int __hugetlb_vmemmap_optimize_folio(struct hstate *h,
 	if (!h->vmemmap_tail)
 		return -ENOMEM;
 
-	static_branch_inc(&hugetlb_optimize_vmemmap_key);
-
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -589,10 +582,8 @@ static int __hugetlb_vmemmap_optimize_folio(struct hstate *h,
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
@@ -658,7 +649,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
 					&folio->page,
 					HUGETLB_VMEMMAP_RESERVE_SIZE);
-			static_branch_inc(&hugetlb_optimize_vmemmap_key);
 			continue;
 		}
 
-- 
2.51.2

