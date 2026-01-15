Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0873A89DC
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488391; cv=none; b=joaBhcTNy2ovqawSKuwNyXTRPfgXx/yQdHD6L9B6ZkomuAJVAY2PfmYwPNCJZoEDhYGYa6xRaIE/yR1Qcz6f//0UuV8trgenV9R4iDJy/iWjEhziqQk9YE2g3GdsJLT+nRFBJthR7iQMBtb4uKDQy2GTlbve4RQsEv+J3FGFTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488391; c=relaxed/simple;
	bh=56Ngy67RioCpKMVBbaFXYfTVQpop0DnoZP0CjrywvUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lhi9aPPNOpvoIJGUorPV3qBNHi6lLtmAShq8rxMQSRE+SDoAh+/J9Dgm9624QQu36B/YQzY0wBPVOdMmDZAM/Ok4Y7qMujBle4IxoRoeSZJSxkonwJvlz41O87AZABlxAvIbge+yS7AtFuSUNpSSeTKXvhj5TSTIknjYBzqpng0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pA6CGn4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pA6CGn4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C76C116D0;
	Thu, 15 Jan 2026 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488390;
	bh=56Ngy67RioCpKMVBbaFXYfTVQpop0DnoZP0CjrywvUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pA6CGn4WdvIlo3kJaEuXqRZZjAE7y9qNKASN6s8JbUDe8xrrrlgxrPjFmUbacP5L7
	 bsgZJ8g31/3OaOvjgwY/Z5nMtL5WkpufqQoj4qjVmx5aCn5hK1uN183Gilp4/A8xQE
	 d/oDctX9+gmHuwuNdlMYheyPejMY7X58lWxexLetjWLdjk0z+CVM0tLr2hmfSnygnN
	 IgUO+WEwfh/jy8bB+JIQN/yS55LdMlExeRFYZvZEBzUrKc17RDO0Ho5h0C/HBTKNvL
	 9jK99H3BLOBjnrBEJiDy6zDKDiNAvxOZJMJovG0X4HR2a9JiUMMha1owVhu9Fsosjw
	 sAOvwkM2ne29g==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id A2945F40068;
	Thu, 15 Jan 2026 09:46:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 15 Jan 2026 09:46:29 -0500
X-ME-Sender: <xms:xf1oaTLkX8meUF9nP-4-GBiqHPAJu27RuS8q68_R5ZWbG1Iq6pV9pA>
    <xme:xf1oaWZNp8Oe5kFMC6eoW1IxPOaAm4ZjfTF9AQD0IUhiUsih1FJkDMrdFdk0rrmYG
    NfJ4Dhj2RFRE5N1nphDaEH-e5AvxvchuwiZDN3SCt1A4_Ub0Vs1lGA>
X-ME-Received: <xmr:xf1oaeiMLIa6UCiOo3JL7MwcIRAI575eTI57pO7YEFnGstfT2lfNAtYX3JTrTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:xf1oaT5GQrryz3IvANZNyFUX9ewr0-Mar5f6dzjx6UNxv25sxNBjsA>
    <xmx:xf1oaerkx5F2pBotJohXjO_GELTkHFGroaRSYRhC5poa8r6gdDtsrg>
    <xmx:xf1oaYgCgnm66BfDrDLFOnxk4KSe58EeitT7c2Mve4UmToMMg67YyA>
    <xmx:xf1oaesqFdkvTiklhR_Mpu6JN1tjOK5D6rdxAM0POBK-Y0qG0AKHDQ>
    <xmx:xf1oaR1SqSBNb2GLEaI8n8dUFU_Ei4ie7SCMDtwDnNQdy_M9Czliz8hA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:29 -0500 (EST)
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
Subject: [PATCHv3 13/15] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
Date: Thu, 15 Jan 2026 14:45:59 +0000
Message-ID: <20260115144604.822702-14-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260115144604.822702-1-kas@kernel.org>
References: <20260115144604.822702-1-kas@kernel.org>
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
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 include/linux/page-flags.h |  2 --
 mm/hugetlb_vmemmap.c       | 14 ++------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 660f9154a211..f89702e101e8 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -221,8 +221,6 @@ static __always_inline bool compound_info_has_mask(void)
 	return is_power_of_2(sizeof(struct page));
 }
 
-DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 5a802e292bac..5afd9f4231e3 100644
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

