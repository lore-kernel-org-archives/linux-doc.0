Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE383A0B06
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 16:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012580; cv=none; b=jNue2JFEeohRlBi7QBpvXfSGt1LHE9Iwpnt6WAHbrNzH2wuwoLW7epjD0BLjbLOVFf/Cvk7Me06yOAM4cYeTtYlSXeyNdPzqg8+zn23eE7YxcLVlULZjtC/4IGQBQomv4fCATwVmLUdyjCu0wBCTajUIqBqCY/tnth6zEwpfgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012580; c=relaxed/simple;
	bh=94U4vpoj3XC1XsIsIF8ogVhKHsiDO0aWlPB13fldaPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWkygKGmy8VParO/aURFEehDbd1epfGv5Nm0GcRy1FfZFu5X3mhLM/y/N2mgNFNaYrgJrToyfkxaTAeCyziIPoa7c8peaPGgMtMzfDqimYNWXnX7nO1+XCZ6v6OaRQ3OYahhPFbrcDxFSTGKUjJAYF5NYkq+J4yn8Jlguj8iSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK4NqiUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK4NqiUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE11C4AF0B;
	Wed, 21 Jan 2026 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012579;
	bh=94U4vpoj3XC1XsIsIF8ogVhKHsiDO0aWlPB13fldaPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JK4NqiUZ+MIPgVTwafVFr03CziRVivVoT4DgfgkO8x7AoJcHHMIJvkhrCDVBS4Gj4
	 TkUFa3gsbX0kDTms3flfsV6Kl3hGj8NqtEVwfWHBa5ACoPBbRwZksgX0YznjDdeBB3
	 ZOjZ78dXo5yIh26UdiJCLQLtxEuPGOwBoS9HnYsHJ9DprsGPXr8twMNZKoV4P85aO5
	 yKf4lonpDK0v2wpV7SlhiVtR9+1y8Nq2VlYhNiqvEtBUTL+UUnHfO7N//2kX3jGVqa
	 7ed543VPAax64WQy2m6uhE05KoLKXNfKIqrq8ydLFf45zQZAU1ptO8N2S7chfmMWX+
	 r7bvWtJ/OcR6Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5DCECF4006D;
	Wed, 21 Jan 2026 11:22:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Jan 2026 11:22:58 -0500
X-ME-Sender: <xms:Yv1waVqtPPVfV3hDkNLEGqIx3ef9zYss_8Biei4bGLY7CK-6KoV22w>
    <xme:Yv1waW7jQu4uvc6hSNsKEDKIKYGQzb7meOnSXIQNmaIe8PpicDfCIt9XPVw_S7fjl
    2PmleuvicrkaSGBMCThi8edPXvDx57X-3j-bZAHGeuq5zmkHVLTSXg>
X-ME-Received: <xmr:Yv1waVCelrJ12Q_UvMOdhJwf_4ck6rtOQUtblwnqHoNoMgHy5-U02PYBK2b9hw>
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
X-ME-Proxy: <xmx:Yv1waYYf7ypftXewdAjMM6uQdv6TTijhxZFan-Z7DWF6ML3c8z2ZYg>
    <xmx:Yv1waZIY95RoJrmuwlproUIyq3XDIjrXSFVhp4GICYkVcPZfCYwwbQ>
    <xmx:Yv1waRDx44szWG5JVIbhvWH8j1so-lacDnSntax79R2WfAadLgp2_A>
    <xmx:Yv1wadPqdX5X7vvE4a_14QI0tRZh4ieZMqaEOlWHMfEIdYe1pXg0dg>
    <xmx:Yv1waeV3JZFBvcrTQhbCeMvdYKnL9Cmf0rsBQoFUZg4slqFiKAl01xcP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:22:57 -0500 (EST)
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
Subject: [PATCHv4 01/14] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Date: Wed, 21 Jan 2026 16:22:38 +0000
Message-ID: <20260121162253.2216580-2-kas@kernel.org>
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

Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.

This is preparation for adding the vmemmap_tails array to struct
pglist_data, which requires MAX_FOLIO_ORDER to be available in mmzone.h.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/mm.h     | 31 -------------------------------
 include/linux/mmzone.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7c79b3369b82..2c409f583569 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -26,7 +26,6 @@
 #include <linux/page-flags.h>
 #include <linux/page_ref.h>
 #include <linux/overflow.h>
-#include <linux/sizes.h>
 #include <linux/sched.h>
 #include <linux/pgtable.h>
 #include <linux/kasan.h>
@@ -2074,36 +2073,6 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
-/*
- * We don't expect any folios that exceed buddy sizes (and consequently
- * memory sections).
- */
-#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
-#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
-/*
- * Only pages within a single memory section are guaranteed to be
- * contiguous. By limiting folios to a single memory section, all folio
- * pages are guaranteed to be contiguous.
- */
-#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
-#elif defined(CONFIG_HUGETLB_PAGE)
-/*
- * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
- * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
- */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
-#else
-/*
- * Without hugetlb, gigantic folios that are bigger than a single PUD are
- * currently impossible.
- */
-#define MAX_FOLIO_ORDER		PUD_ORDER
-#endif
-
-#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
-
 /*
  * compound_nr() returns the number of pages in this potentially compound
  * page.  compound_nr() can be called on a tail page, and is defined to
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 7fb7331c5725..6cfede39570a 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -23,6 +23,7 @@
 #include <linux/page-flags.h>
 #include <linux/local_lock.h>
 #include <linux/zswap.h>
+#include <linux/sizes.h>
 #include <asm/page.h>
 
 /* Free memory management - zoned buddy allocator.  */
@@ -61,6 +62,36 @@
  */
 #define PAGE_ALLOC_COSTLY_ORDER 3
 
+#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
+/*
+ * We don't expect any folios that exceed buddy sizes (and consequently
+ * memory sections).
+ */
+#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
+#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+/*
+ * Only pages within a single memory section are guaranteed to be
+ * contiguous. By limiting folios to a single memory section, all folio
+ * pages are guaranteed to be contiguous.
+ */
+#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
+#elif defined(CONFIG_HUGETLB_PAGE)
+/*
+ * There is no real limit on the folio size. We limit them to the maximum we
+ * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
+ * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
+ */
+#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#else
+/*
+ * Without hugetlb, gigantic folios that are bigger than a single PUD are
+ * currently impossible.
+ */
+#define MAX_FOLIO_ORDER		PUD_ORDER
+#endif
+
+#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
-- 
2.51.2

