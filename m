Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE734418ED
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012604; cv=none; b=PCVZbZxD/NXsqgWofK7OmubwtuDwq6ksz0s8w9FfwqhQTy6DR6kpCptbatyzzgPgPl5EiGqkN6c7QoTGZiqV2f2mIct+2xPKiIDxd0DUAsVZ3pyCgBDakV2kaUUXmocbIYXQrGovOpxoe2ifnKD3gPxPY65miBLNjKHGDnaLEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012604; c=relaxed/simple;
	bh=G+MNU7DgEj1sJhXfeeHNFOyPFz1DCwEooo5Fb5WVje8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwTjwt/eWgt54cSpeHaVEDRtiPZJBnmyO2b1Cq+/5fqavv7MqBL0duKI3FXs68AgDkMG/GF5Bw+cgoPfHl/g1IHUZGRKkPYcx8+hrr8zEulLT7PpMU1vn52DDuQpu96uA56Nu/oBgQI+iu4cXie/aMDwL5bw9xkk5A7+5x1pCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0UiE6bv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0UiE6bv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3172AC116D0;
	Wed, 21 Jan 2026 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012604;
	bh=G+MNU7DgEj1sJhXfeeHNFOyPFz1DCwEooo5Fb5WVje8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t0UiE6bv8f+PXXOPMzCiP95b0GOq5UC6rU7QbO2Sa9zYWze4hreBBdDNRBhOcU3tP
	 i9SaBhxLqiocz8mixlkjKuixQH9R0AEIMAK5xu+P9vlftTXdt4w078kzuz4DZgWaK3
	 0ejuINFTR9I1NAjLGdCgy8VDb2SGhihwYP5KOFJSB/xtIrRQyE3xU/ehNRcEPY7AsI
	 fhwob2gUV+aGc2n8e4EtoACAGYfTmbXXOU5ia9tNiXoZRv4Tm1PMmcyXbGB9anki4B
	 Wz/4X+MRgYOIwK2uHGaLV1ubf/a2x9CBFgm0nTL01q/1ZW++gDmy4WH1RPt9RzwHQx
	 HNidvDd7iaH0w==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 69871F4006A;
	Wed, 21 Jan 2026 11:23:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 21 Jan 2026 11:23:23 -0500
X-ME-Sender: <xms:e_1waaIRGXem0bx8iG_3QfLRUNEy_WBX74IpPIiGRGgjaQg8egIcYw>
    <xme:e_1waXQCOxOUeyXPwNjywubSL_7hBoD2yZnN7uTiAS5_XKtTNdyWGLz3O9vcjvDDL
    rKoGhm7_9iwjuLwSCGC2ZU7xUjHhRDItjErpJfYhdx8ncEwcoA_Crg>
X-ME-Received: <xmr:e_1wadoaFoy6I0tsZ6MhgAU8bPnE21Ssk0G6C1VzdLAlw_p11lcLtmS17LmOqQ>
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
X-ME-Proxy: <xmx:e_1waVaTzYGafPWupelOvSd9QsFm8fy3wgjGPHFEcc5geWru_P8sZA>
    <xmx:e_1waYROMjpu0b23YrY5iLqH-auca5B7Pyk4ZtmJBlUAqrqWejG6PA>
    <xmx:e_1waTftudyh34O1p0wQp9CffgBRA0WZ1io8tzKT7H02tLIAtvJFTQ>
    <xmx:e_1waXlUcLqpvIjvfICQFoLnilMfFGGu9rKGeRDGgqyZAiuCBSPpmQ>
    <xmx:e_1waYhmsJaXTEJWwGGyUrLuoW86a4EuIXnNZobCxWGGm5zB8rsG6zJo>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:23:22 -0500 (EST)
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
Subject: [PATCHv4 13/14] mm: Remove the branch from compound_head()
Date: Wed, 21 Jan 2026 16:22:50 +0000
Message-ID: <20260121162253.2216580-14-kas@kernel.org>
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

The compound_head() function is a hot path. For example, the zap path
calls it for every leaf page table entry.

Rewrite the helper function in a branchless manner to eliminate the risk
of CPU branch misprediction.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 include/linux/page-flags.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f89702e101e8..95ac963b78af 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -224,25 +224,32 @@ static __always_inline bool compound_info_has_mask(void)
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
+	unsigned long mask;
+
+	if (!compound_info_has_mask()) {
+		/* Bit 0 encodes PageTail() */
+		if (info & 1)
+			return info - 1;
 
-	/* Bit 0 encodes PageTail() */
-	if (!(info & 1))
 		return (unsigned long)page;
-
-	/*
-	 * If compound_info_has_mask() is false, the rest of compound_info is
-	 * the pointer to the head page.
-	 */
-	if (!compound_info_has_mask())
-		return info - 1;
+	}
 
 	/*
 	 * If compoun_info_has_mask() is true the rest of the info encodes
 	 * the mask that converts the address of the tail page to the head page.
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

