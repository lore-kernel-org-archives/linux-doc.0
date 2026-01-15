Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF953A1E8B;
	Thu, 15 Jan 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488378; cv=none; b=EaAqdaZujkHbDbSg20fC+cJYokUDlG0DK/MJmnBz3AMmB1GQm6DThrAAQrwavWKCjwjqMvI3GlwwNf5J4S5H8hy5L1TvrwhLIXr0pTPBlTWla3xbzUs+Ah0eNn8EV5s4i9ns5jgCQiJfNSN2I9Pm2Spa8MBXQO6DCBY6OH/L1TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488378; c=relaxed/simple;
	bh=WUDBQAa58qP3pHbP6EnrIXpUoC+TsGSOWrtaUEZdRJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wd/WMSc6Y1rbph63Ja9iyPEONyICWi9Uf0tO0UtFylYlIeuZzg9JEXzZeHrlyMRZy6BgnUBUzYotLjpmv33cfIWb8lOWgzP7V5z98QeTIfx6PAZCmSpzzB+BiLHGocg4FGC9P1LGgqW2/inPnJhVF7FjR3S4NvRqC/e0H9m6JzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOk/BYUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOk/BYUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C6DC116D0;
	Thu, 15 Jan 2026 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488378;
	bh=WUDBQAa58qP3pHbP6EnrIXpUoC+TsGSOWrtaUEZdRJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vOk/BYUF3RLC3PapuN4FEHV/ZzzuMRtsVLGbNO8Fw8rkeQ8nQuXzAp0W00erckRm2
	 ikAKfh6ZLwYL4muFR4byIG0GEaBtCpIbrE4bPmux7crS4Zs8o73h64VuhCLw9i7mIe
	 poJrb8uDmXrmxLkI0hCMJeqsv4FMjc5+LngPmnFsG3aJ3aLHxoMI7rU2e72bMYy1Gh
	 f6VIvEMhvG4ZLAg3vWs0AJWXRa5Qyy74PBWbaJH+FJjJu/ZQVTGVRE0jEhiKok0x7h
	 Hg1vn32C3A19TpX6QN/iHeKXLd1X2diRI7IRQKw0B7VyDvRKwDWQxPcKMuYSmqMk42
	 FodVyw8c5ts8g==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45A69F40068;
	Thu, 15 Jan 2026 09:46:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 15 Jan 2026 09:46:17 -0500
X-ME-Sender: <xms:uf1oaXkP45D0zP2yku0ESobsdwM3amD7FO-SjS2kL5uux3FAlrXr6Q>
    <xme:uf1oaaGE1gY76qcxlANxUskvtzw3vIu8QidSdpseQwp3EuVadhZ_eXDHhgsGM69Nl
    OA0KCpYlzqcZyhQIwwPEv3utlIp3i25RZPmXmkzkiReOgx-Zq_t1gH9>
X-ME-Received: <xmr:uf1oaQcTSqH06vT4vZY0XWihEFoP3PsUIMTMYi_3__7Jf01OKx0iYPOHeNBLbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:uf1oaXE76FKl22Qozw2n8bhcH3ADVhpV-2YNeF8TLVwTjw0A4-Z07A>
    <xmx:uf1oaaEdwe_YQZgTaPL1Z8YNQoHqP6nXB6GyQ8___rl3IdsSjFRnZQ>
    <xmx:uf1oaXOSR2CR0GJ9rM1FzUi9cZeNU6-Y2C7tkVuYTrdWvWXgmvESfw>
    <xmx:uf1oafqTJBFcqRohiZJEz6HGcCMVVsRFIjWc7ehMJP1_bXaAvBIjAQ>
    <xmx:uf1oaYCHcLMe9Sq8ZZGMwpWe7bAM84e1FxGB_-bN5RlWk25Qwy-kxufM>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:16 -0500 (EST)
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
Subject: [PATCHv3 05/15] mm: Move set/clear_compound_head() next to compound_head()
Date: Thu, 15 Jan 2026 14:45:51 +0000
Message-ID: <20260115144604.822702-6-kas@kernel.org>
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

Move set_compound_head() and clear_compound_head() to be adjacent to the
compound_head() function in page-flags.h.

These functions encode and decode the same compound_info field, so
keeping them together makes it easier to verify their logic is
consistent, especially when the encoding changes.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
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

