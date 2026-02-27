Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5194244D689
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220641; cv=none; b=CnC42GObtTktrncN01SqzfJCDHKYjyhfK/tT++Zznd4/xHaT847xZUiXvETy+3VZugReWvzWIxZHot+RRk268JGz2r4yAgDQkSF5iC0jWkDq+RBWzIY4d4CAtN/GBH7NRiV+YOIqQE7Fg4z3+1LJMdkggyTSMA8a65goAP3mO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220641; c=relaxed/simple;
	bh=Qa3n5VKBU/DN+usEuz8+Om7G9sqmqxUGPeiY6zJ/Qrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBYAHHshDv5pSRPbmR4wYN/xI2BPrY5ugK4WWpWHwZp8DdECer7NH6a+ug+7GMjjAhviS8obDB3TptEuRMVCfYP5RLyYnqLrIlX3pRRufhUj6c8i1TKFzJUL16f3GuuRbMInDxNO+nR5ff68I/QBEn2g3jUdCJ5Rd03oUh4Mdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twtqxl9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twtqxl9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A84C116C6;
	Fri, 27 Feb 2026 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220641;
	bh=Qa3n5VKBU/DN+usEuz8+Om7G9sqmqxUGPeiY6zJ/Qrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=twtqxl9wczz8diLrFrYNxgeFeytvN4YMaxSDd/cMX902a+pgp5qetAQ/6PVnV/CQm
	 Cll9M9UVTlsAbFWs5BwTvAN+NwC3QC+Z+NOKsyJsoafaP+QrfTjt6Pzc5+g7go7gS+
	 k+uiHtXCTq1isYOJ213RRV8yyIs3jODHMsnClBCIL1BYiMW9y6JM7dnZ/FGhrvEySq
	 A5ajdc2Xrkw6WN1qHpWu2dPTdlgHqIa3QVM0RTKJd15bNbqxRhR7kDVkmp5vHx1zgt
	 RBtyvvoTG1iyRZLZfj2wzO1lZHKvg202vJSLbx1Y40yB41gWgXa+b/USXqk/JrIWLQ
	 V/e4Xpm6aU/Aw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6E0DBF40068;
	Fri, 27 Feb 2026 14:30:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 14:30:39 -0500
X-ME-Sender: <xms:3_ChadvCHZYgu4ElP8zMfhuMRciOJHShA5u69P7IDBw6KGL3WD7n4w>
    <xme:3_ChafrCUYNBan7yhJIdA3KDZkASgxhPm4rhvyKMd4OdNwdlYbTs5F1TU0z1dKiwG
    hB_KHQW-JE4zLMJmke4AUYPhbdh0H27Cwcr8b5QTsNxokM7nmM5wMw>
X-ME-Received: <xmr:3_Chaa6BIueRlqQ1KSPVTvfPcHmAOlT31szbNcCLvcTAMYvENjh_216I7S4nUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:3_ChaVHevhdXivQcseAaeVX2FctwBGXs_5X-Zfkm6HDKqWz_a8R82w>
    <xmx:3_ChaZ5YaK0skCo2vdHE6vp5aNjmWkcz1gmZLtZ-Bzrx6pT9nPbh9Q>
    <xmx:3_ChaQgz_8bi52yOT1KBhYhcg0vhJyGjNKO5FWPluzkOBvjz1bGZfQ>
    <xmx:3_ChaT5SRyp7_xZYUsaceo-lT2rtO10HUqhbfDidI5aypULvE4LshA>
    <xmx:3_ChaZCYcReL99Appy5OfpchsxXbwwYOm-GsYIoey2fqCgjQ8rqG4zRP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:38 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv7 05/18] riscv/mm: Align vmemmap to maximal folio size
Date: Fri, 27 Feb 2026 19:30:06 +0000
Message-ID: <20260227193030.272078-5-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiryl Shutsemau <kas@kernel.org>

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to the newly introduced MAX_FOLIO_VMEMMAP_ALIGN.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/riscv/mm/init.c   |  3 ++-
 include/linux/mmzone.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..e8fb2239a0b5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -63,7 +63,8 @@ phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-#define VMEMMAP_ADDR_ALIGN	(1ULL << SECTION_SIZE_BITS)
+#define VMEMMAP_ADDR_ALIGN	max(1ULL << SECTION_SIZE_BITS, \
+				    MAX_FOLIO_VMEMMAP_ALIGN)
 
 unsigned long vmemmap_start_pfn __ro_after_init;
 EXPORT_SYMBOL(vmemmap_start_pfn);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index be8ce40b5638..492a5be1090f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -92,6 +92,17 @@
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
 
+/*
+ * HugeTLB Vmemmap Optimization (HVO) requires struct pages of the head page to
+ * be naturally aligned with regard to the folio size.
+ *
+ * HVO which is only active if the size of struct page is a power of 2.
+ */
+#define MAX_FOLIO_VMEMMAP_ALIGN \
+	(IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) && \
+	 is_power_of_2(sizeof(struct page)) ? \
+	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
+
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
-- 
2.51.2

