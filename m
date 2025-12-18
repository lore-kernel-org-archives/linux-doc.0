Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B483446C6
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070618; cv=none; b=ZMKRN3f53f5NP5aC1FCV6y5CqfULWiZY/Dld72Lkn/UXRN1CaKNtotJWXuubDXq90jfsoBLc272vR00ytFyr3KacEAPrHmLTyIEGWDyBobd33WsOwDUrw20+c0ct0WhZUZrY8/0189x0zbMVT51KHLlSAbHiOXt+URH/00wH1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070618; c=relaxed/simple;
	bh=QHkl3U8ZtD9yZJLHGmP/g7omcn3YG8UOJmM+dOgs4Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvlvEFdU76nDZdL9J0PGKnyVwGeJZAzZXjzd6Ka+oXF+wre3VlZ+wrrpxKdneOW7SluPMkW0x++94tEseBXA72UYnLPHHkZjGa90VUChc/qG3hO+0gXx467LlJa/be+ysJaVLQMtngwjktFge0gelEgcMrSGoq66Z1xh3mdxAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mld3UlRp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mld3UlRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D44C19422;
	Thu, 18 Dec 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070618;
	bh=QHkl3U8ZtD9yZJLHGmP/g7omcn3YG8UOJmM+dOgs4Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mld3UlRpXdkAqoVa4eG6+AE4I23cxtdxS765AtGm9OB9FGQx2B29yweHd1gLJGWbr
	 6JeK7T38JOzsPOnBn05+/itAVsjRwK8PScm3sc1T2i+TfQ14szvc4/Ks01IsvmnI9n
	 UiDO2d9JB3ikjOFmyrCkXhtJk093mz4BUA4BrXOzFb9mVCQJcMYkSPNC5UWrbyRNFT
	 xQ7RVeeRppOmpJ9H/++hxKozbIkYznsW4T8+KsIBbijjTJwM/0M14o7cjsDF0Rrd91
	 poKMMaNs4FzUsOe5eobB8jeT8/WlhPMjm1/iG7RtOhM1q0P59Q4DShj5+8qkYoT2HK
	 3bcDgv8G9YR8Q==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id E5EE8F40078;
	Thu, 18 Dec 2025 10:10:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 10:10:16 -0500
X-ME-Sender: <xms:WBlEaZovwVR03RF5Acpg4wU6YPxRUfBBFEQwZgoPFERiLQdUsO49JQ>
    <xme:WBlEaa7YszlCT8p9ln7nFAYAImCh0ykL2vScArW2RKrCArQggU4E-6Zk3NN_myBk6
    z8-YsqXNUufFiEc_hggBEUk73PAff2-kJHhfKpNlW9yVghb-Sx6Ig>
X-ME-Received: <xmr:WBlEaZCKBuVfv0EvypD9qo7xwAsPXObyu6IPC5a2JYS8ZQxgWLax_rH3ujFH9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:WBlEacY22H2MkTgLzMYosUxBiThL0G3oyKQP57hHVDNFnoKCoUFdMg>
    <xmx:WBlEadJ-GTy0FsnHqqjU5zThpJ-XoMx8A_Ya79145CGZ-xZhMQfWFQ>
    <xmx:WBlEaVD6ZmBDQxSjaA6JLf6PEZZjVEOoHYw2Ox6p_DOOKLUujULGEQ>
    <xmx:WBlEaRNbkLvg1T72So11L5qZA9mQu6anoCYe32Vm4TAc5J7kIyGo6Q>
    <xmx:WBlEaSXDQFHzUkRw45qjwYR4JQe9bFJEnGQq8vnWW7oLhO79s-BXt65n>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:10:16 -0500 (EST)
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
Subject: [PATCHv2 13/14] mm: Remove the branch from compound_head()
Date: Thu, 18 Dec 2025 15:09:44 +0000
Message-ID: <20251218150949.721480-14-kas@kernel.org>
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

The compound_head() function is a hot path. For example, the zap path
calls it for every leaf page table entry.

Rewrite the helper function in a branchless manner to eliminate the risk
of CPU branch misprediction.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 2255e7e6759c..6d5ebd66eda6 100644
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
-	 * If the size of struct page is not power-of-2, the rest of
-	 * compound_info is the pointer to the head page.
-	 */
-	if (!is_power_of_2(sizeof(struct page)))
-		return info - 1;
+	}
 
 	/*
 	 * If the size of struct page is power-of-2 the rest of the info
@@ -219,8 +217,17 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 	 * the head page.
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

