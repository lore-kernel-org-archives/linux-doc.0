Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEB33986C
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070597; cv=none; b=YMRSzN1/lWD6al3XSp7c4Rdz7JdD3chJOnSuqsxFyrtqE6Hcl8O7jcGS6JBj50JrIROFjK7wwLvjvmXuDq+IjKZmSfhTRvrsTNPa6llrNSKIWu9ZnMEkRcKnmKTZVBc4YxfH/hMO6NzxrZdbxooriLzNqxp26IHxCDCIFYO4UGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070597; c=relaxed/simple;
	bh=9tLpQ9D7laIhJe2k13i2JMUzd18FwyrCUsedyAAXldw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rD9e2vj1cf3awo48/bJj/PeJAbAxYjDFTrewCpUVBbVMwXaiUwQbFADpULUumF6T13FhMtkal43li82BmDw0Aoy1GfT4pdC90S7wmYTUCM9CsCUhfFwQf1SLv0rY8lx4Oz6U0CJ38IauJ6mJjxprfylloZu+rHwCcQctU+/SiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQSva+qX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQSva+qX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21BFC19421;
	Thu, 18 Dec 2025 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070597;
	bh=9tLpQ9D7laIhJe2k13i2JMUzd18FwyrCUsedyAAXldw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQSva+qXAV/iy5U1+Gb1iCUvWGDgAUWoCxTdIxlEzvm3gjMlXKlFAmGWvuvRb1nAn
	 G++siGXaPMw2oW3hDZ6e3lmPQfgw82PUxPEtLgG/Sf9rMlLfmIO2t5lKlBhtfEbPri
	 gRdwMG1mnHkWRmHNlrLbSEAWdEbIcYB2SuyhsleYH4A0Mu6MBgkF5qrRMGcNrsD+95
	 iwoIh5vUXWvCjlKQOjwG7HF4RHD9vgt9bBxyKr0PRxwMFCOFFCx9ScYtTU970nSIH0
	 gc2FkgrlSYakJRiRAtSmwJNr0LQiaJuyCOOVIf0lm9l5aLOLX+/Y1LbzmG/v5xZ7Ij
	 xZXApF1PZjbzA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4AEC9F40072;
	Thu, 18 Dec 2025 10:09:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 10:09:56 -0500
X-ME-Sender: <xms:RBlEaR2fhvEo3I9H223A72c6QsadcD4W7NTs-DWLoZ2GIiX0IS_J5Q>
    <xme:RBlEaXUFuML-YtoKCtgPb_v_qpZoAEklCVMMLXU11m9Psq8aVzztt2CkknpUJUBFT
    R7LdTn8byNjQJsVYBtF_x4RObdLjo05rDA-Oe6MavTdvloco9LGNg>
X-ME-Received: <xmr:RBlEaUtlfNUdPkONed9hQfRlWsncL2uJc28fJUvNEA4HznICdEcGmEbDEefAZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:RBlEaWVa7pBUSoyh5o9OpVxLvmRGihXg4NkKFWXPF89VPvA_4O8dgg>
    <xmx:RBlEaYWDG_mf7dg3FyvkwvsuduL1uWK99-R01OILjMXZhE-vfM0kvQ>
    <xmx:RBlEaYfMfznDdC95GykU4faxoeMRXO47A96pX_L0hdHAqVQTyt6MVg>
    <xmx:RBlEaX5Gs_RBbVT_gsY8ikb1t26jitSlNbV2JM8p7aFa71YUjGoGuw>
    <xmx:RBlEabQhRdV8GFZstDQfSbfpFuwG7ZmiWxUtbFjrhnEuxW2ppVacABTz>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:09:55 -0500 (EST)
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
Subject: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Date: Thu, 18 Dec 2025 15:09:33 +0000
Message-ID: <20251218150949.721480-3-kas@kernel.org>
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

The upcoming changes in compound_head() require memmap to be naturally
aligned to the maximum folio size.

Add a warning if it is not.

A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
kernel is still likely to be functional if this strict check fails.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/mmzone.h | 1 +
 mm/sparse.c            | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6cfede39570a..9f44dc760cdc 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -91,6 +91,7 @@
 #endif
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+#define MAX_FOLIO_SIZE		(PAGE_SIZE << MAX_FOLIO_ORDER)
 
 enum migratetype {
 	MIGRATE_UNMOVABLE,
diff --git a/mm/sparse.c b/mm/sparse.c
index 17c50a6415c2..c5810ff7c6f7 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,9 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
+			    MAX_FOLIO_SIZE / sizeof(struct page)));
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2

