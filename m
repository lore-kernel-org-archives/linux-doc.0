Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FBE3B961B;
	Wed, 21 Jan 2026 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012593; cv=none; b=KrhoW44p/k44oMyGZPnPJQH+eNuUhPdc5sWqdpthoxh1eZ63WBjCwB9bcEc1Km/xufP14hFbp9/TwA6F7hGsgsH+s92UO+zaKKNNN1UgYX5/Mw6zhIQTFRqVbfxr7kDFe32i8SRnTyfgcuqoDG0fm4ASPya2r2j8XXMUemjDckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012593; c=relaxed/simple;
	bh=O96ch8fRog/gbFpgMz6eS5fD/+jtpBs4wHGNLJ/2IQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onRXZMdMnJtGGUcNV01MU+FncvUwPeqad1Hernoq7muMKV6UGVxtbjRue2w/oqMd4k/ol6cHONVg5WVi5hEUqVkewmplMx1apIZXqS8bJw920IHgakwbGfqfXL+UyVPd4cRYFCVBxcA6uU2auTZ/2DBc1ATGe21Dce2REZMxJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6ynnu5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6ynnu5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D038C4CEF1;
	Wed, 21 Jan 2026 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012592;
	bh=O96ch8fRog/gbFpgMz6eS5fD/+jtpBs4wHGNLJ/2IQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t6ynnu5KcYfiTiKByn5aKPM/KrxY3Mjnr5IfqrW02AkMYI8pyQ7qy2p12o7vvMTAq
	 ekh3X4S/L4GAi1FtV50tI2WVrZv75YHkEbMV3LZJo9B5UgbJSZ0dyiDVpMfUrIf6CJ
	 +LTszXpgJpdYlrPy4oZvOyelbVZlo2ZDKoN67j0uQcg0jGLxOn0apVugad6s8M2cvo
	 UAfC60+cZzVxbmI53uSRhA5EPx2ZB4imA6z9THaKJ7l8GBZhuKXd6ArYPS6z4eSdrK
	 cuq1+A/OXpFFzlr+e5PTY0pDLAHmKW31ZqoITNoDT8LmW/C7QUmd+IQyTUocywLaiO
	 WkW7lSUpBwQ+w==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3C1A3F4006B;
	Wed, 21 Jan 2026 11:23:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 21 Jan 2026 11:23:11 -0500
X-ME-Sender: <xms:b_1waUgNdyt_hrEKOO8N1Ezsw0Mxcjj9jv0olG7LNPtx4sGqs7hQsQ>
    <xme:b_1wacSPtUoVKIiBIEPKfGW1-glC9hvVaK9HDcH4Vsva3oocCbqIdSa03Tp8YfbMP
    qwbJJRJbQox4qtenhtu06yU_h2MWf8UBTqFdfO6aemHUh00vLj90w>
X-ME-Received: <xmr:b_1wae5Ch4m0R2sOBYO0KjKA2uckhpt06YLcOE79PwLLMg2yPb8wC6AD7xNzNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:b_1wacwq86hwmmMXdWwsgRCfXY4UKrmPeQp5OMihHayQ2dvhvzs03A>
    <xmx:b_1waWDJWPeJqlf1CNZfPc1olJfd6riFp69Ek9y_wZFMVLhQjp0rdg>
    <xmx:b_1wacZMPdbasQfsGbR7z2V1onT4nQqWi3arQec1BPe0qQrrRge_iQ>
    <xmx:b_1waVF7r84uQoE1GmaCZV_307C6jcnfbVY-ZUuXRvGFazgr4sdp5A>
    <xmx:b_1waYsxoenm0iNnV3ewZDeHCvyfYZH85VqTJ1XfUdDUhHjR3vO8OalF>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:23:10 -0500 (EST)
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
Subject: [PATCHv4 07/14] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Wed, 21 Jan 2026 16:22:44 +0000
Message-ID: <20260121162253.2216580-8-kas@kernel.org>
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
index 390ce11b3765..7e4f69b9d760 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -91,6 +91,7 @@
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

