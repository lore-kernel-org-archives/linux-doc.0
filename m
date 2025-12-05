Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0DD3469E4
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963848; cv=none; b=WEdA2h7e/pbvFczJfaGTF7Pg+vWc9AHMFDWe/CCQ91QZ/MxeAs7bgi45bsjuyTwEYNHGBXA0+ZcstRoLeLJOqg+Th5K6bjlYjt3BZxwBZNPPjz9U8PWyIrqBMZGDio7LK0gV5fGrgqYziGZZVz3pd5VPDJ74oQ70qfSR3tWOQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963848; c=relaxed/simple;
	bh=U5PAArSwkT6xaG+oWnh1pdHULJkKB8HiCIVlrRlQHnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIz1SeT8izaK+V3p6jDY5chTpCngz31mu/GdJQAQK22aqG6GjoyRLVzQXr2slhNuCb2fMWJjC5EwUkalG6YjbBHkwzSP15GRcItu8Yahweg+2bAdbRE5K6vGlCHwon/I+3WV8+AWcy6HJJiG+ydfedqo86FvySNrcolscf3T+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrSR2azR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrSR2azR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B75C4CEF1;
	Fri,  5 Dec 2025 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963848;
	bh=U5PAArSwkT6xaG+oWnh1pdHULJkKB8HiCIVlrRlQHnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IrSR2azRCEJSUIH2Jw3c9F+KDAtoo1B2MAclcw1BISGTs3nhmGYF1Q75BuylzusBv
	 Qgf+KjjD0G6B7iFg+0Tu7WYYf/Hja4X+vMnPj2Q8rSXAjL0eIWngZD5iy4i58tMEwr
	 /cgsoiRxIK1BATAJ49jnE3PxrsjW1br2nqxRtB2GsqP788wKbpICSMEKm5UVDVaT3M
	 o5xZFTge44HcLE/WrMoIasQNEBrDmiqNbp4W6OAbYmdfd5rUh9kVr4YEnObOygqPJY
	 1UW7Fm377C7jYoLUFsaWuXw1NYi7kmS2DxV9PO/hrqqkyaruz2WaY0soQCcdsg6r+a
	 aSWhCSASHCXzA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 05BC3F40070;
	Fri,  5 Dec 2025 14:44:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 14:44:07 -0500
X-ME-Sender: <xms:BjYzaREoeFSHQs3p1cKf9XBcvsI98ZMgBC-B9wU5EIkn19FBCxOVGg>
    <xme:BjYzaXvs7vpJCIDkGyQ-IB1dJeLBu8ZlnFzdC3NE5QE0R8FOba5P1bD1sj6ihHZei
    fzT252_OpCq8ibqOrv3kQ1Fqib6qUCMHMDG3qNI0GETuRN--rKcJ7Js>
X-ME-Received: <xmr:BjYzacbxS8e0TANbEdBzFcabR30IfKX8vQAIc6Z81lwKjIcaYuuoMieXzcex4w>
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
X-ME-Proxy: <xmx:BjYzafWLDLE4kIJQxjck657nYCMThqOWoipn6jbIH-3JZz-hLugUHw>
    <xmx:BjYzaeK-lznUZbJXdED-0Ji026VDgwOIu2Ocv9fIJ--gdn7CK3rLmA>
    <xmx:BjYzadGvVuTh9COt4QvlQWkR9dTIidW2JZS6XQnTvGMe1jiVAs-9gw>
    <xmx:BjYzaTz0eR-g7qxvkkoxFyLAQHdQU6PXo5G_QtEsIaQa_wPz3RqKiQ>
    <xmx:BzYzaagdYUzw-jYHUdQKWbBeqp_Tt8Co-MXqGnzIrTtoyOHK-ZRkOw0b>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:44:06 -0500 (EST)
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
Subject: [PATCH 08/11] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
Date: Fri,  5 Dec 2025 19:43:44 +0000
Message-ID: <20251205194351.1646318-9-kas@kernel.org>
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

Fake heads no longer exist, so there is no reason to synchronize them
with page_ref_add_unless().

Remove the flag and the synchronization with synchronize_rcu() that is
gated by it.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 mm/hugetlb_vmemmap.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2543bdbcae20..0f142e4eafb9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -48,8 +48,6 @@ struct vmemmap_remap_walk {
 #define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
 /* Skip the TLB flush when we remap the PTE */
 #define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
-/* synchronize_rcu() to avoid writes from page_ref_add_unless() */
-#define VMEMMAP_SYNCHRONIZE_RCU		BIT(2)
 	unsigned long		flags;
 };
 
@@ -423,9 +421,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
 		return 0;
 
-	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
-		synchronize_rcu();
-
 	vmemmap_start	= (unsigned long)folio;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
@@ -457,7 +452,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
  */
 int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio)
 {
-	return __hugetlb_vmemmap_restore_folio(h, folio, VMEMMAP_SYNCHRONIZE_RCU);
+	return __hugetlb_vmemmap_restore_folio(h, folio, 0);
 }
 
 /**
@@ -480,14 +475,11 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 	struct folio *folio, *t_folio;
 	long restored = 0;
 	long ret = 0;
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
+	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
 		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
 			ret = __hugetlb_vmemmap_restore_folio(h, folio, flags);
-			/* only need to synchronize_rcu() once for each batch */
-			flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
-
 			if (ret)
 				break;
 			restored++;
@@ -558,8 +550,6 @@ static int __hugetlb_vmemmap_optimize_folio(struct hstate *h,
 
 	static_branch_inc(&hugetlb_optimize_vmemmap_key);
 
-	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
-		synchronize_rcu();
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -621,7 +611,7 @@ void hugetlb_vmemmap_optimize_folio(struct hstate *h, struct folio *folio)
 {
 	LIST_HEAD(vmemmap_pages);
 
-	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, VMEMMAP_SYNCHRONIZE_RCU);
+	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, 0);
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
@@ -649,7 +639,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	struct folio *folio;
 	int nr_to_optimize;
 	LIST_HEAD(vmemmap_pages);
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
+	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
@@ -702,8 +692,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 		int ret;
 
 		ret = __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
-		/* only need to synchronize_rcu() once for each batch */
-		flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
 
 		/*
 		 * Pages to be freed may have been accumulated.  If we
-- 
2.51.2

