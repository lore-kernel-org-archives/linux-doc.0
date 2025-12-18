Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA633EAFC;
	Thu, 18 Dec 2025 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070603; cv=none; b=m2EXfxQVSf4+vMJ8CUUPU4lCRvYVxrdPVJKI75oDRzRPJFTWVqgreEhjUnpvRlsQllWSYkdRikiquiQ9LbSx/6smJ0MJi4utBnOWLdS3uEQXfY/dVCjc/j0OoS6P/DjRX2XzsCi39PVYg9pX8EEK65HFo6BGRZvgj6kPbSRsb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070603; c=relaxed/simple;
	bh=xpVALRLGrlC3mdPn6EctNGLeNqovC9Y7xpC9d4Hifqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeEKWL+pSiOec8MPuQYmhz8VdkUJg/wX3AQzJCgsfyavTtBmJGbDdG52Lif/lj31jhUErKNGtOoN+4+pQut9xr+8hqYnUylOfgpZ/rmLOkiSgn7SHsxiZ2qLnnZ3tD1i5HrKi9y7M61lO/tjZrjp27s2BUorU51KZR3ZDwJi8vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkoW3Fct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkoW3Fct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6BCC19421;
	Thu, 18 Dec 2025 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070603;
	bh=xpVALRLGrlC3mdPn6EctNGLeNqovC9Y7xpC9d4Hifqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LkoW3FctTcoQzT6GlDur/1mzo5wawRrQ8Pl/cnl1exw++199oKw1Cy1s1qxqiQMIg
	 A9EqbhmFBAYG3FVmJDrktjHwCZ7g4JXi1wjuQyKHCfnABpNDNMogRF49E6C2zjcAyD
	 mf4RBDievwEEqpaV2Ondj6Pix4bZuMey/tM9wYquc0yVBZggMVWFUuirpjO0Mf4Yrg
	 8qKlEZJjvRn4vEbdueXOJel8HoQ70ii5/nHgy1kTqc130CCuKKelXbib5UhDQGNZhR
	 FUDRaqJ3ke9MZT7kZZomrmR9lz+nfkCevg69KKvY3TtjG+YQmHbBtQbHHpnJ1pmWIs
	 Q1jUYjF1IYXyQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 20747F40075;
	Thu, 18 Dec 2025 10:10:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 18 Dec 2025 10:10:01 -0500
X-ME-Sender: <xms:SRlEac1_SGreXn1zEfcYFGmHyHGlKwNyJRdt1nU4R4-ctiJAU2Y6dw>
    <xme:SRlEaWXQYh89avwgyqAEmmmrtTOu-yzSO400gKolhSRvo30tof2An26Vn6gGU2bzP
    0ikFA58Q9G9mpIxoDr7pRzoEaZ8vN_kT8khjDdDu_dfcIZ6DVBiWX-T>
X-ME-Received: <xmr:SRlEaXttyPF9xmoJssyHXMa0yiyHXy79AvefaH209QkpCNR-E-5o912gdb4Ang>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhudefjeehhfektdeuvdefveejffdvhfevtddugfduffejfeeikeelhedvtedvveen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
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
X-ME-Proxy: <xmx:SRlEadX26BhIbd7kxepSo9UwKozctXZA69lvYoY149naSxdfPipLow>
    <xmx:SRlEaTW_nF5QJeR62FC4jmNNGd8n3awcFDQq8Njxer5g0Mu-pQEzoA>
    <xmx:SRlEaXdWZjPqFy-glcoiDYQKMc4VPzqoE-RFUCpzWCngaunaOBw6jQ>
    <xmx:SRlEaa6hCcWXykXa_FqO22TQpdJJCnI_Mua-A5iEiDK3OFyicdrWVg>
    <xmx:SRlEaSQVN9Dcj6ERM-oacNFEPE89s6pz81-tXcRydvM_6XTjWQmHWd26>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:10:00 -0500 (EST)
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
Subject: [PATCHv2 05/14] mm: Move set/clear_compound_head() next to compound_head()
Date: Thu, 18 Dec 2025 15:09:36 +0000
Message-ID: <20251218150949.721480-6-kas@kernel.org>
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

Move set_compound_head() and clear_compound_head() to be adjacent to the
compound_head() function in page-flags.h.

These functions encode and decode the same compound_info field, so
keeping them together makes it easier to verify their logic is
consistent, especially when the encoding changes.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 72c933a43b6a..0de7db7efb00 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -290,6 +290,18 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
 
+static __always_inline void set_compound_head(struct page *page,
+					      const struct page *head,
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
-					      const struct page *head,
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

