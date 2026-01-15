Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865AD3A784F
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488383; cv=none; b=a7bU1n+V5La5IhSv6v/fcS1M+ipKh1+1FtfbkywgEJ339NyTlI0ajFVixN/Fw99vVRJZ6gUONrDlptXJC9nVrfho0bAtec3/ogmocxxwk3iyLm1dG2rhVT13/VDXa7il+tD+0NLLTRBFH4kbHjbNT87sZwUQLerop13LoUxZ2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488383; c=relaxed/simple;
	bh=6g9s/Zv5Bx6BabFSpoMhFmX+Y4IAWEXocX3aiWMnCgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYLkCiOUXWd8ILUnsQVYKlTjjnFS0WL0gtnmpVXAYiWohj5aFP53PDGN6crKEHMfTPghNpziOrHEPBJ7sW0GRdUpSZj6IgUSjWo4ibx89n3ZkzFqTuQRMAgu9qwS8Bzh7ROrngXs4vIe5CPA1vF5N52MN4OXWu2f0Lkn9TG60Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZikTKWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZikTKWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D1DC4AF09;
	Thu, 15 Jan 2026 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488383;
	bh=6g9s/Zv5Bx6BabFSpoMhFmX+Y4IAWEXocX3aiWMnCgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZikTKWWRDRCncKDnsWIQuNB3lIxtLlBsbSUOlbBs3oJB3Bzbek7Y1pB8x2RUgq/T
	 gN+gyS2t/ABkcjykSQ7QYZfvOlLpEhN9d94MN3JaOQwn8P0nQbJOimRXtbZ2g0Kwgc
	 Pa4Vihv4FpvENgxaNep3Wi88Dv6zSh9ePIPZ1yF+a66L3DIJRpi3jPGq5NFXxmfg3q
	 mKr5mKXFqrX0+NZzdGr8nOSkqdKc5LJoj3bTuP0RH1PRd19TPiu5p8Oh3uEUV9BD9M
	 2yyoS0+CbkfUWbMd5V2ZHqBovGXKW1xorCIuV3wBGKNmWCAhKt1mC6u/K25n7+WhJz
	 jtSGyDOSOLgvQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id E8866F40068;
	Thu, 15 Jan 2026 09:46:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 15 Jan 2026 09:46:21 -0500
X-ME-Sender: <xms:vf1oaVymPEzPHNKiDVkgp5BBK14Pl7vpbDUein-JD28T_w3w8WK6Mw>
    <xme:vf1oaaZxeDKkSrAZS_e0E16_K3rPoguVOm5iZ1skzZ69pC6F3i_xO9xNQ7dqNb8dL
    lAv-LgQv3gT9IfBBEXJ22GFk12g-QAynX1nZ432kP4hE3Z5Mvw4MKui>
X-ME-Received: <xmr:vf1oaSRfPen2a8Pq9IqIVrqLR-aOMbiktRd1pxIV5XgyZSS43axHNg6PdVmRrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:vf1oadgiGJM1-h9PJssj4IKVbs0nQrUwCDG6TMIRneHnvKmEAbd7GA>
    <xmx:vf1oad40uJuKdKOcskNdsejVIhJ_Ofj80I3a65kiMzeTteqTjGiQzw>
    <xmx:vf1oaYndqRb9WegMFAfpBN8DNdNbNhGWIJVCC7GE6oRVCZoFjoyCwA>
    <xmx:vf1oaWNTG5_wh-3ycIHLMakdoht9kCcUXXb2JPwnvacOZ1RwDz1uow>
    <xmx:vf1oaSosPYBTbR9kl-glKLqs80Lz7CkKDtAwQL_UPZYO1g-PiG-oXMEf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:21 -0500 (EST)
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
Subject: [PATCHv3 08/15] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Thu, 15 Jan 2026 14:45:54 +0000
Message-ID: <20260115144604.822702-9-kas@kernel.org>
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

If page->compound_info encodes a mask, it is expected that memmap to be
naturally aligned to the maximum folio size.

Add a warning if it is not.

A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
kernel is still likely to be functional if this strict check fails.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/mmzone.h | 1 +
 mm/sparse.c            | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 590d1a494c4c..322ed4c42cfc 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -92,6 +92,7 @@
 #endif
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+#define MAX_FOLIO_SIZE		(PAGE_SIZE << MAX_FOLIO_ORDER)
 
 enum migratetype {
 	MIGRATE_UNMOVABLE,
diff --git a/mm/sparse.c b/mm/sparse.c
index 17c50a6415c2..5f41a3edcc24 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,11 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
+				    MAX_FOLIO_SIZE / sizeof(struct page)));
+	}
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2

