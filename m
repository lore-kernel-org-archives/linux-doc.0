Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64E20ED
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103024; cv=none; b=MeeLdtCTJ69AVKcNqZmXT0cgbEd6bG4qOB2dJivNzkMqMy1Rct1EV65eJgTuIxploX1YsP0ot5yq3Al6EyLMycZduHFqackcSDwdw+qcbCiA6kkRhrJJiwWrQ9nE9/9e6+hXr5Mrbc83f+MKgzG+QbO7ibpWgQLqFb+LYbslZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103024; c=relaxed/simple;
	bh=o93Z9Y+DL/D2s+9gaMivcy0VdYP+V7A91VZF+QexHA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siLEshbjmFiJ0F334NgwCG/WjEQj0tRuVbeZSi5d7j5mtSCJj7IwGnuxlv1/Mtma1NilFir1GpRiKqb6ygfeL3GYQSSPoPnRbXlijWNhWRg1GGOV5lS32YSTgTKfTrCXIiMe0oSO9FESFYHatYZAab7GQQPh/T3HvbEU39CRBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AURoCfLQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AURoCfLQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so488816a91.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103021; x=1789707821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otJyn0+LhJb8oZRc2DA2ivaMEPoP7qIjxigOuUE5KLU=;
        b=AURoCfLQJ8uQDhpBI1nyCRQ3l5kb5f6Osmb0qnvILyHTajkmIDE1x4Ge5hm6JAqP68
         /wjJSG69CWv6JTEt8dw/GV91tIeBKamMnj/4XlG40k0PvDs2jigZd87k6Kle1bjzBr3B
         9C9wtWPqmXSwXIJ45r2UpiHvXsDw9oCc7u9p9tWVDlQxUVcImI3ruCZ/h/n0CCuzg+05
         l4Gnv32oOHt4mQt8fz+hkmhdf4cFMjJ0y6VRVzHk1y57X99AUw0heWibv7F1cJyk16pC
         /8OSW2974Beg++5SmUZphB/MtYOGD9bAFOQoShSzm4UMSGePMWdhcIzj6ciD8q1JQqN4
         Lwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103021; x=1789707821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=otJyn0+LhJb8oZRc2DA2ivaMEPoP7qIjxigOuUE5KLU=;
        b=cNn8eHr32HkSeQbjW1GtDh10qcG+wPrQC7eL/Jz/RMKMU/AOGm6amwLa+bds8T7wt1
         82srzXQYjqF6O6ClUsRd/LUHrR/yP6pKatlDWGn8vajOirZl2xax7lx5Ogd1zR9aXGhm
         /rm4nPMmtLrEQhrVXtItl5vuK1CMhIanU0YJe4ikXlNp5/86246NlKqhFULsMQVRhlRB
         OdhTl3bfXZxYR0V/47Ynignu5xCshLloRfg6GTWmR81pfiZQPUwM12MHL5V83WlVbhiv
         50HxTuFimw9nbI96w4TBslk0XUNGWIDJ7d1ujmJ+CwaUq1htPBgHpxr4iFYaM2js9dQM
         pZcA==
X-Forwarded-Encrypted: i=1; AKwUvBzIQyZNccm4+XaoV/IC/BUmpddYduLjTB2GkbnjKUDSwfMkascN83qBAyjRFdpK2xAUglfF/6l3Ui0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXpEBxPnmKMfUAcTJgYXZm14Ggdrj1BT5QdqcORDDOkIFHTbnE
	NieCesnprWR81/kBSCwMNrkMFzXQoWtPotHRvRZHVQnUHdCsYPqPsCo9kfzyPPXy/54=
X-Gm-Gg: AYBFou21vJ7j26UKS7ouD/9usOmiy4u3vaOJt7Nh2xbnaDzG/wGv8EPm8qq/D0ZKKys
	ipEk82FTmLZyKbJpSDjG/I2ukzKM2t9/BQFzbl4BbVP+1TnqYfpCW1E0AMp/s0X0yArKh20Z5aI
	PrCr2BS0FF2eHanj1hhtPeQxQqTCxmQYbwi2KzbvcdMTVmRadqKv+qXaePuzogw/iYxwMqxrSAW
	r+m+fWxsUfiB/yRQVAbavATbgfWH5t6KF9G8bVL6qcjewsOZ0owXlUyiJ92VLFIvP/ixdQTnlQ+
	ArCRK0Br+7e1J/6ULnQq+YtC9NnZTgIKQKYE1g5xhWacKlK+ltf+tcdVT3UuxT8g76HKDwxXhWx
	912rKtWejryHBkkyKRtyopOiD7js6LybFZamoKvQdWQIf+GzQFvaHcIUBxPOZU1z9Xj7ensX93Q
	a34vt1a4XQ3xOKIrtNEU/FzhRJe8kqM53WsNwG5LiYJCAXk8aJWNIBFXzuI7Yjlbw/6Z6cejAFK
	QAdTTvwOYVGg30yWKOCJH7LqfLSoS3rUWXcOA==
X-Received: by 2002:a17:90b:588d:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39d9bbc823fmr4102685a91.5.1789103021399;
        Thu, 10 Sep 2026 22:03:41 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 03/11] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Fri, 11 Sep 2026 13:02:20 +0800
Message-ID: <20260911050228.58884-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_compound_tail() is only used by vmemmap_shared_tail_page(), where
the shared tail page setup intentionally passes NULL as the compound head.

Keeping this helper in mm/internal.h exposes that special case to the rest
of the MM code and can make the NULL head argument look generally valid.
Open-code the initialization at the only call site so the special-case use
stays local to sparse vmemmap optimization.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Acked-by from David Hildenbrand

v2:
- Collect Acked-by from Qi Zheng
---
 mm/internal.h       | 9 ---------
 mm/sparse-vmemmap.c | 5 ++++-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index da14c56fb24e..0dca33db068f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -786,15 +786,6 @@ static inline void prep_compound_tail(struct page *tail,
 	VM_WARN_ON_ONCE(tail->private);
 }
 
-static inline void init_compound_tail(struct page *tail,
-		const struct page *head, unsigned int order, struct zone *zone)
-{
-	atomic_set(&tail->_mapcount, -1);
-	set_page_node(tail, zone_to_nid(zone));
-	set_page_zone(tail, zone_idx(zone));
-	prep_compound_tail(tail, head, order);
-}
-
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 7388a5b5cce3..861e09b2b096 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -189,7 +189,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
 		mm_zero_struct_page(page);
-		init_compound_tail(page, NULL, order, zone);
+		atomic_set(&page->_mapcount, -1);
+		set_page_node(page, zone_to_nid(zone));
+		set_page_zone(page, zone_idx(zone));
+		prep_compound_tail(page, NULL, order);
 	}
 
 	page = virt_to_page(addr);
-- 
2.54.0

