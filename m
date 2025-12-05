Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC633FE12
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963852; cv=none; b=iLT1esWpAkFATmhKd+g/RD63KR9lvOT5fq5JRT12hzWiX4wqs0FFilTfhQKCIdSR95bUEr8e/MVhXgUTEwH2OH6zJkZ7PA/YJVagyCQrxHnC28hSJysqHPDfuZ/CP+u98FMUjuRu1XGkoX+kiyi6mGP5le5BpO7KH4qO99EijZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963852; c=relaxed/simple;
	bh=e3wrkcKXK7At84UNMrZ9gGBzqGquM8K+OStBHfBuTTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taLTV/biHNdbPtuNBbTC0F2JhO5YgXcmvAMX+Lp01yOeDHiWHhMBUpWU2dGnr+bTHR7rQ4jXNjshmD9YrLQQ7GvOxO+LZBZRBW0Yx6JZzz0f2dOM7sJqSwqMpYiTlqrlETezMK9n7PpEUtgCmTiVfWr1pLOyg8xluCmEPtu0aW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kl8VTnLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kl8VTnLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD04C116B1;
	Fri,  5 Dec 2025 19:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963851;
	bh=e3wrkcKXK7At84UNMrZ9gGBzqGquM8K+OStBHfBuTTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kl8VTnLQf1CWis52kXFpH9Tk3Fb88PBP53VJFp6pMHlJH2GBB/DQdaE2v7wRnTXNe
	 47c64EZg3f82AC28dHXx8hyH8rIa+GHLmTpriimcwx2/ZJDAMf4T1j57QSfTJqiMsZ
	 MdzhtX/7wA7T/J/Q/2VgSjV15EKVUYWJ4AO1kKX4cr9KDebNt2I8RJm/E5qZ+oSQ0l
	 Iy9ZD2UcOXdW50CvOM/jqsp/SoX75Qu8NBhRGYv1Xnl0O0c6p6R8Rw0eqLS6exIOf+
	 OTvgQgHByDjl1VQ8kdA/JSJ6NHydxSwR1H4+LPJ6If/PzzNenmBvHsjbCFweT8lqMm
	 a0m2I0qkVO/mw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0C816F40070;
	Fri,  5 Dec 2025 14:44:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 05 Dec 2025 14:44:10 -0500
X-ME-Sender: <xms:CTYzad8sb67eQBQx-cZwL4F43ilnP2bfV7OU2er13Ily2pEVUPWOAA>
    <xme:CTYzaTEMVUmrLUxSSgKVvlbLXgxHtP1JuS3zPsIkl24IqWOmzgTNYqIjWjKBHbG-l
    P9c7f_owcS8IZL2AfLeGweo8FP9maxwzYmM_pxtFTGH1_z8SCYqFNg0>
X-ME-Received: <xmr:CTYzaUT2DPl5815X4J_4uftIYP1ElgNHhb6HMyBJ06ztmyaECiNJkegoRctWvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:CTYzaZupbLLz3jgKuYSwQgA4yl95OHAW-hzzSJGKdaczvBBPluE7Cg>
    <xmx:CjYzaZCCL3OPOCUZ4PQyE3DCOH51OeGX5KCqfhza45XXHN1yeb5afw>
    <xmx:CjYzaedUKwwllE6-6__bGegO4IBvawXgiN1dclM0hCe9GF7FmPZQ9g>
    <xmx:CjYzaZoCnmU5yVdjivnwZThyZ0GkmN3XYMhTRUwWqkDHj-VKOyy0tA>
    <xmx:CjYzaa6vS1FfMoHWf7gzcM9rHXuA4inT2hDnhmD82q1mmUsk5kNyRVHW>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:44:09 -0500 (EST)
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
Subject: [PATCH 10/11] mm: Remove the branch from compound_head()
Date: Fri,  5 Dec 2025 19:43:46 +0000
Message-ID: <20251205194351.1646318-11-kas@kernel.org>
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

The compound_head() function is a hot path. For example, the zap path
calls it for every leaf page table entry.

Rewrite the helper function in a branchless manner to eliminate the risk
of CPU branch misprediction.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 02a851ab7f5e..01d9893c4bd8 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -201,17 +201,15 @@ enum pageflags {
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
+	unsigned long mask;
+
+	if (!is_power_of_2(sizeof(struct page))) {
+		/* Bit 0 encodes PageTail() */
+		if (info & 1)
+			return info - 1;
 
-	/* Bit 0 encodes PageTail() */
-	if (!(info & 1))
 		return (unsigned long)page;
-
-	/*
-	 * If the size of struct page is not power-of-2, the rest if
-	 * compound_info is the pointer to the head page.
-	 */
-	if (!is_power_of_2(sizeof(struct page)))
-		return info - 1;
+	}
 
 	/*
 	 * If the size of struct page is power-of-2 it is set the rest of
@@ -219,8 +217,17 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 	 * page to the head page.
 	 *
 	 * No need to clear bit 0 in the mask as 'page' always has it clear.
+	 *
+	 * Let's do it in a branchless manner.
 	 */
-	return (unsigned long)page & info;
+
+	/* Non-tail: -1UL, Tail: 0 */
+	mask = (info & 1) - 1;
+
+	/* Non-tail: -1UL, Tail: info */
+	mask |= info;
+
+	return (unsigned long)page & mask;
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
-- 
2.51.2

