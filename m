Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578C3A7F57;
	Thu, 15 Jan 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488393; cv=none; b=qQL9CQC3BGqA1dw09oP2RM6VzG9cczQgyMTFTATtAQg+Tn0uhIkWPmxriEm/PcIlCASlbnaQDOok8SvVsFbN5i3Rff8KeUy877ObrZr+TPxdcgYKJLPVZ5Bt2XI4lC5IjwRud1Lk9IpiTPRNf/waTsOHPLzMsAV7MU/Djx+68no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488393; c=relaxed/simple;
	bh=G+MNU7DgEj1sJhXfeeHNFOyPFz1DCwEooo5Fb5WVje8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eoy9dNfT8MxHe2LeI5i1YJPjh5TSarKZzy82wQzK02LP9//9hD7EjjwPx4nAkPM9ogjkfMuap2tZe6l8zmC5eCot5AwFnAPnfCuL2jQcsKVeCF+zmQu+uih7WsQa+BUy/bVtbsuGn2Ql7BEDr8Y78yEHBWOqAuA5g0eYCmWqENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TH5fO+yM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TH5fO+yM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9F5C2BC9E;
	Thu, 15 Jan 2026 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488392;
	bh=G+MNU7DgEj1sJhXfeeHNFOyPFz1DCwEooo5Fb5WVje8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TH5fO+yMgEA1svpjFaAUNdTpySr4fbVFPv4QdN9JW4Hma8kixvp9X0lmWEzRNEq4g
	 fDJ62es05oxfLpQhp768VtI2TC3YmYwTGu7VAkQNIZX7/A43BOEztoOo8ujeq1mQjW
	 o/2CtwIjdhWd+D7/nX2tqdDdRFiIE5wBUEIzlglOaYvdIJE2owBH6fh/hUDW0Fh1Bp
	 iNt0bJccXiuc8LgvfMKrlwdYqo3wz9qmyJZWblR+i/iJxooCdQIrsg8L3w6lFQpFzv
	 ngpzqt//A+Cuir5WGkyXl+erJyfM9KoBIGx8En1EXeG5vhpbcONuouL2gO9OV4x61e
	 1psnlI+DBdcjw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 444DDF40068;
	Thu, 15 Jan 2026 09:46:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 15 Jan 2026 09:46:31 -0500
X-ME-Sender: <xms:x_1oaQc5oJ3yrvSwQ5Dgypr2fFPiKj_4jm070IJqYWx2E2TeSaRafQ>
    <xme:x_1oaRfKntkF78ewqIb-rEh9dfCvNBe5aIWsGBtubKRg4idX_gXBTO2pPqyoa8Qja
    HxW5hwYAgpcgD-HMVvHxFlBsQnTkWDMhgpiPb8AHCtmWt0GCU1RllI>
X-ME-Received: <xmr:x_1oaUWqv6sj78ckfbCDJBr4z5y8xa7G3WXZdNqdNanhALz-xCOJdbVl8Y_Itg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:x_1oaddUA56X3fs-iuQRJ1QnKtc-gNo7MnYZuq0AeLhTeB-KMcbPgQ>
    <xmx:x_1oaQ-SJCFqGgAxUsEEniqK-vv4BWuutPD8QclqqXHLq7BGIhLsLQ>
    <xmx:x_1oaUn5onvvHh1EVAeytEY1cOTOhF8HJq0yx1RJ94td0SGQMzIYMQ>
    <xmx:x_1oaRihuzb0f7mvxtBuX0-0piyImqEYrHolA0y3iLzWqEf-MpVQRQ>
    <xmx:x_1oaUYRMoaJFFd8vcTnzEKkITJRwaYwxEbT3J_B7s1x8Y9VVYuHiJaH>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:30 -0500 (EST)
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
Subject: [PATCHv3 14/15] mm: Remove the branch from compound_head()
Date: Thu, 15 Jan 2026 14:46:00 +0000
Message-ID: <20260115144604.822702-15-kas@kernel.org>
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

