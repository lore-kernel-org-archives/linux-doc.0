Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718C3A7829
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488382; cv=none; b=MYAHGzHLipwtAy9oIv81tp6GOkYtp2oq2+oWU9fwwZV1yezViNrd9QL8tJEDyLzT18oyivk6dV0VwKKN9JC6Ceb5UzIRuRB3gK8/HTNYxlcnzVBF1RXRJ9h0Vtzq+wkRX05Oex+Y40o21d9ZDCi0a4TEdCkL9drwIXZ1SiLI1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488382; c=relaxed/simple;
	bh=T8UK/c799JlRwYME3UvlwD+wczrXw9AaT7vDCkxDE1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nl3Nr/wRJBwfvYQ806Ooa+d27C7uc79uaNYMXgEz2D28xN91pdst9KBcRVpmNkHL21NXKMBeBcD5ZUT5ZTpouzH03qxF6VI7GL0Ox0crRNeGm4w2cOofcjZ6645miiI3/9V7CSb7qV4KTDYItsk12nYzEI2cIaA5eMWVoRS/LEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZ3g8gbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZ3g8gbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C30C16AAE;
	Thu, 15 Jan 2026 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488381;
	bh=T8UK/c799JlRwYME3UvlwD+wczrXw9AaT7vDCkxDE1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WZ3g8gbnEiCuhI8vMJDySSJbBbUKB/9dP+m6ZqhSJibYs4S/FWvO4YDs9A6Wyc6xV
	 G4hjEhzGcCBoUsrgPDJLPumCmCs+SY1gFt6+q1155iTdVaqZ4elE2bMIbKZcGXRZBg
	 AbXxkSUiF3cVak2vqJGG+QsTohAbcxAl0QWXG6HN8gwZhdwdPwhxcATH2tj61O+BFf
	 9aSZwge4QVwtWWbdyCYBOJX5Vf5A2YsGvT/rtmJG9nIcv9l8s7IWusrOfAWMPwdVt3
	 ctw4WkyFvmhH8oDTivbbK+QRUYoCUa2j4YGWkgXPu5jzj1K8+J0eyfYYY1Qof+B2Ph
	 xqM8AKKNGWhgA==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 797CDF4006B;
	Thu, 15 Jan 2026 09:46:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 15 Jan 2026 09:46:20 -0500
X-ME-Sender: <xms:vP1oaTm3OOTSUqdiltgu6cpY5YhOGft_hcZnqQEIZBW0BZtngNy-kA>
    <xme:vP1oaWFxBZw-onh67tdVi9FLIw9txGxmJeDmvJHIJC-Ek7oMjh3egbJT5Ybc7B09K
    ztNEL-N6wUYj9LYrIDVLvkemvYA4DDPiVHO6VyLbUqYU5qiEmQGhg>
X-ME-Received: <xmr:vP1oacdg-Q9rjHOz346c3dE0Nmg1bcrL60Y2o8yEE9hJmm9XTm07zdwxlhvbLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:vP1oaTHWZiBFLjng2zgR0eQ7HF7XmJX1XNNVWbWuXUjk0sUGfGxcWg>
    <xmx:vP1oaWGBsVYm8zfHBxeFsb8j3le6i8Sk1b8jhQmdHS77Ky-CPmbxlw>
    <xmx:vP1oaTOLQKPSDHLp4o-eKxhIYBydkthiudER5ukz0Zodo2_JKTQnNQ>
    <xmx:vP1oabr9ohV2gSDsLQyRyvzoMJq4pU77gUQlmDmXK3K4cSh70aIF0g>
    <xmx:vP1oaUAORi2kZsXA33Ie3yjdMvJqWAMPTF6z2Nofp6eOtvZmVZvPUP_c>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:20 -0500 (EST)
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
Subject: [PATCHv3 07/15] mm: Make page_zonenum() use head page
Date: Thu, 15 Jan 2026 14:45:53 +0000
Message-ID: <20260115144604.822702-8-kas@kernel.org>
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

With the upcoming changes to HVO, a single page of tail struct pages
will be shared across all huge pages of the same order on a node. Since
huge pages on the same node may belong to different zones, the zone
information stored in shared tail page flags would be incorrect.

Always fetch zone information from the head page, which has unique and
correct zone flags for each compound page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/mmzone.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6a2f3696068e..590d1a494c4c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1224,6 +1224,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
 
 static inline enum zone_type page_zonenum(const struct page *page)
 {
+	page = compound_head(page);
 	return memdesc_zonenum(page->flags);
 }
 
-- 
2.51.2

