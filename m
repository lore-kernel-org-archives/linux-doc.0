Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96333FE26
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070609; cv=none; b=FNFHBx4VsmoX88RR++vWTWh1eWiOjOWUdGpk/RQu7jhH0w6EXXDrzmHD7tbmL+MR+pnYQ2Taxgg0Apu1FbNJC46LNpZHe3MtcIRNJKkblkFTGfMgR8MRDC7Y6Z2JRQo1AFrqZXnxXbd159wBa1RLHSyid7BMWEISL/Frr3RlUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070609; c=relaxed/simple;
	bh=Kq8kgjoW35TGaaX30yH963wFdY5bwi75+JeGAznZYJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c24Qjxzwd5dTcstN/PA/BuoRnwBIjYI9MsbhX8z+C7Lql6Wng0PlbGHVkDxyNo1/YVMXfNLd+8+MZUkSP1a0TespkrVidL9zrBtk2b6xKDcJTvp0MnrrUPDcQ+g4IExPakJ974PMA8OTSV2DuOVzxJGC3/uJnZU037fm4+NnVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb4n0ptR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb4n0ptR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C44EC4AF0C;
	Thu, 18 Dec 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070608;
	bh=Kq8kgjoW35TGaaX30yH963wFdY5bwi75+JeGAznZYJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bb4n0ptRDJm6VjhnYzuel9TvhDmDm8afHnxfN299Vv0IUMOIywzNAPgis0QWIrhQQ
	 xLLAokV3eSgWrkiZ+G3KhmC59xc/T4UfdBH1UnJGmbsTutp0bFn+Fa7eXngHKXKTsi
	 ipQkIaVb2Ewx34QoHUZetmqR+SpIh7V68Ctwwn7PChUWpQXfyNx2Ag3dwnhuqr6FiB
	 edOKlBNjXUmWk6/jAI6c+ESBqObRDFBdh6u9FSlH1JeLDqpHhgswxyKQTdx32Mvbzr
	 bkXUq1IMNs6Yhs59j5oqTOhCKo9JYTfLD8DdHnweaBLTFwzupYmsMOmW8q3HcvXMeV
	 pBoXMOVwPQPLg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7AAF9F40075;
	Thu, 18 Dec 2025 10:10:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 18 Dec 2025 10:10:07 -0500
X-ME-Sender: <xms:TxlEabIWyVJEPc1vvT7pYxwo5pRjJPOVz21HT1hiQz0VsLKP74BVZw>
    <xme:TxlEaebN0Fa-Eavj28VKh9aZHUHiiDG2qeEcsM6adMvADBPUOfUIL-kxi9zPqgKCz
    cwvoAA68gnOaCRd3zwL8LegHWY9_VsvncEe8DfufBZquJTFsAsnn28>
X-ME-Received: <xmr:TxlEaWhDS-7njyLKCjRFcDI-PWd-adO1lpwP5_M1Z3HX6yGY1ZF4yBIjC9t4OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhudefjeehhfektdeuvdefveejffdvhfevtddugfduffejfeeikeelhedvtedvveen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
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
X-ME-Proxy: <xmx:TxlEab76TOXWwZ--_9_2hmYohUFMppOsReYQYIu_3SK9xprLmwxYyg>
    <xmx:TxlEaWq_gekXMPhYC4eM2XIgt3eUMbXrLwiZeTU5ZWUv17eDW7W5pw>
    <xmx:TxlEaQgL8zu1avJMidJlLQodS-2HziR1i8g9ExD0aaXrdmkh_InVLw>
    <xmx:TxlEaWvJ2Aa6MRihbSn7XOppGBJD9YbJwBlAXUJhSVXszhA6NPdXOQ>
    <xmx:TxlEaZ3OWnv-da7CSJyndqebjV9mCslo1SQtMyMdy1eg8R-REOHK96st>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:10:06 -0500 (EST)
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
Subject: [PATCHv2 07/14] mm: Make page_zonenum() use head page
Date: Thu, 18 Dec 2025 15:09:38 +0000
Message-ID: <20251218150949.721480-8-kas@kernel.org>
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
index 9f44dc760cdc..7e4f69b9d760 100644
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

