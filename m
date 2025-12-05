Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CAD322B82
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963841; cv=none; b=OXzsmNAGYj5fz8s71eUV8POe+lf/QT+pdtmiXoOCq4DRnm8YU8wIuyp277jBhKdRSJGZ3inOeActA9rbHVL+BfrN2j8SfGVoTaUkqDZ427pgR2dvvGJHq7JHliHpehfsuBsstaz3QRTpUkb4waZfo+vJKS+BTPAc+lPALTKz9iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963841; c=relaxed/simple;
	bh=lqawaKMvHwfyi4yljLF/OMqkCt81UZ5brr29AJIhMIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtstVnklS5hSmGU0i9azgLkOkC9cXRwvlPJTMPg+BEiBv+N+r0P5VFL9cvFaR7mNqwBiqwmTFsxlnJyvGyAi3RZHGl4gEeNidUL+T5y+adw/Q64eXdXHejhKZ1sPY2w4bn9HdCYjzuMOhr4+mRjpBGLHia/FPTbbsxByGTh8DTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gi4MD8No; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gi4MD8No"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4565C4AF0C;
	Fri,  5 Dec 2025 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963840;
	bh=lqawaKMvHwfyi4yljLF/OMqkCt81UZ5brr29AJIhMIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gi4MD8NomMzj0O+AMBedHkwGfambz+m0F+Tba2x2erGIDjddTOmm3Kd7kopq8GqVq
	 g5PDE/PqZDT5Y9Xy4gxuIYo8RcsKcO0GKb1LPH41+f7B501vjg9UKiX9WvLI4eYzh1
	 bkzRqWsZ+tB/HWdZEq/0BTBnDdHGeI12T0UxR7pSGE5xacVIClSWk8xouYBc4Ca7YD
	 FMergGKVTT7c1uURvlndM3teOTrqp1TaCUfDwrGx45jPuS6WFNS5Y7QGkwsyOXocbK
	 m+29dX7jr6ssGAQoUyh8DCZstp3cV8t9K2UyXg8Mx0cPdodG6FavpboGPQbb7C4/Nn
	 mEx3zdx/7pU3Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2241EF40072;
	Fri,  5 Dec 2025 14:43:59 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 14:43:59 -0500
X-ME-Sender: <xms:_zUzaSfS--_fGNmWqwJDbEa67LylLakxjlo_JKYpnkJY1lU12THVlw>
    <xme:_zUzadkbFl3wVqHfFI19I1a3fqSE9_bF-6G0JOwVZ1FVj7iMQ8esgmLhVO_gmwIT3
    BGN6A7o0QTPMwVrQnviPzpMZPJws7sMPMxdjJuwostSHi3OjGOV3do>
X-ME-Received: <xmr:_zUzacyQMfX0nrGQDIaL-usFAZVEh7FJYQY_5_SaUffPQAxEzTIbmDNaIKidDA>
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
X-ME-Proxy: <xmx:_zUzaYOlOFYdeeZX4MrjqeTcac2Q8vm_XD4XhQZy-zrTI54r6O0tiw>
    <xmx:_zUzaVg0PN_mNac7LtwGASmNr0ufPsODLm5tqf_2ILS-oM3QQ2fAeA>
    <xmx:_zUzaQ-3rMmcx1k2zS5Xj0JWhbtwHCVUqSrm_oQRwUFbTGeVLWVs2A>
    <xmx:_zUzaaK9xIB2GD_bwwiMF0UMKBFYrwG_xBvb1TnfwPf6LlpDx7BZlA>
    <xmx:_zUzaRaCMgh8g-8xcspfDIJx-BQ7UO4tir_Rcs-Yy790nIoictNvG8ZH>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:43:58 -0500 (EST)
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
Subject: [PATCH 03/11] mm: Move set/clear_compound_head() to compound_head()
Date: Fri,  5 Dec 2025 19:43:39 +0000
Message-ID: <20251205194351.1646318-4-kas@kernel.org>
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

Move set_compound_head() and clear_compound_head() next to
compound_head().

Their logic should match, and keeping them together makes it easier.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 446f89c01a4c..11d9499e5ced 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -290,6 +290,18 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
 
+static __always_inline void set_compound_head(struct page *page,
+					      struct page *head,
+					      unsigned int order)
+{
+	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
+}
+
+static __always_inline void clear_compound_head(struct page *page)
+{
+	WRITE_ONCE(page->compound_info, 0);
+}
+
 /**
  * page_folio - Converts from page to folio.
  * @p: The page.
@@ -865,18 +877,6 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page,
-					      struct page *head,
-					      unsigned int order)
-{
-	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
-}
-
-static __always_inline void clear_compound_head(struct page *page)
-{
-	WRITE_ONCE(page->compound_info, 0);
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline void ClearPageCompound(struct page *page)
 {
-- 
2.51.2

