Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EFE3A8FFE
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012586; cv=none; b=C+W0DmmEm5W2FlcrhzvfZOtyz5gi6Dft2CyEwNXBuSoHjJuNqQl65M8nB6GS41mRPyhYm2MKny5lEZfzdILXP1kx91loru2WpB2Nm6MTlS+6RcMCFNjyohAZfRmG31Ojvj1HoPGgVXMuFKrdXY+8Wt5+68prVkH0zMh4Ty9xSao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012586; c=relaxed/simple;
	bh=WUDBQAa58qP3pHbP6EnrIXpUoC+TsGSOWrtaUEZdRJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8ogBFMPJ5DT1OdbwuA1KikvUf480ryokMzsCmd6RJrC5KCGpjeawoeRX7hjIQPDOuDcq0FZ1qiz6WzkXU76e7QlZDw7ojZhee+M9XHeLJ4mjxYMJ35lZcTXkT4pJmHRLQkp0tH+V2VChHtjkmQHjD1syYzwsDBm/YoaAr5R5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAtevbhU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAtevbhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2244FC4CEF1;
	Wed, 21 Jan 2026 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012585;
	bh=WUDBQAa58qP3pHbP6EnrIXpUoC+TsGSOWrtaUEZdRJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OAtevbhUCPo9k0pySz8G9DSKtyNBlwoLHDiR0ZkdSVRuz3RD9n9+WwTgagPRyJcby
	 y1xYEL+KRTxPH0/ZxTLhmZqTKVIe5pvPHAAL9W64F+eE3U8hKFen+eQG2IbxFQcGnj
	 FL6eGOYy+cjCPiQuJ84kolNkScVgodtMb6WQLVjYrIQZlaxEVYiYng+eFnll5VTZy9
	 K+iRsy/cWWrUKx9upEjTgXWXBa0xjxs28pSWXidHxZGiRGcYVmy8cRdrXapJkaOnWA
	 1JxlBWsV1GUFQjjL4FanffXqTYkAH1I87G4A/Zr0lfrV/TAjAJhHQOj2msAmy6PvQI
	 W86kV4TgqoHMg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 575C2F4006C;
	Wed, 21 Jan 2026 11:23:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 21 Jan 2026 11:23:04 -0500
X-ME-Sender: <xms:aP1waWWTAax4WtGH0oovPFB9A-J9Ob76BE7jN_340rxD5MdgWyJMHA>
    <xme:aP1waR246kLwYAe6HT8rUqpnZhis-L_T0k1st6HzgLGDKB7peMUc_2XdPqx0Da--u
    ulRxSQNPqdASyEs3IixY3Y757coLmh_fkGcaz2So8vyvl1rMgrmzQ>
X-ME-Received: <xmr:aP1wadNmdVooacr0mLTi6tgxY9byPHiR-h4HZ_Y-XN8UPzRbqQb33P69-jVhBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefjeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:aP1waU0xtD8gUV_H7GUCKSHqtAFSI-XiPPnn5hWRk2MtovlW_gQtQQ>
    <xmx:aP1waU10THAa_Zm-7wyE6Nrh78Ctde0qDlA6D93zm4vFtet6D2h-gQ>
    <xmx:aP1waa8BClrSoqbW1_0pQkxUXvIVKOLPgsL9d-RYHCnL7UiT0996DA>
    <xmx:aP1waYbYLayB2ed9s8S-ASvCXlzltaNE80-pDfyxuVSwNDzWnKvPqg>
    <xmx:aP1waRx_CKPZ0dCQZtWGrfT83dcp5nYKcptuVGA8hfdW0R5S98RTJyOZ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:23:03 -0500 (EST)
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
Subject: [PATCHv4 04/14] mm: Move set/clear_compound_head() next to compound_head()
Date: Wed, 21 Jan 2026 16:22:41 +0000
Message-ID: <20260121162253.2216580-5-kas@kernel.org>
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

