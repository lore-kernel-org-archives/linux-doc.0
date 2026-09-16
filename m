Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26937369D4A
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541047; cv=none; b=Q/Q/CkmJWV58rm6S1gPToPaOAo4Wj6KZybpU4Z2XEr63ti2KlFmGi3X5wrqnUcQtVBXc16AJEY7UePpAPBkLn0VYdGuNRZgSHGsyHjMxTMnZ+LTHzLbYRzAmpsVrt8MFd+fx1eAlrwlK8zeW41onylgi3DH1X5p9c3MGBFJvVrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541047; c=relaxed/simple;
	bh=yuRP77nW6fuC094S8aFOWQK8lAaxmYpqi+IRrf5Gu/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgK5+qySImWOOBlhryLSxOIrBmeM1cgiG5Uo754lDv4Z2r6ex6VUkV646g0doqGN4adB/R9WvpuZ4kQ9gDotJBwJ8vIP/RHjikcoihiNd43wD0blxKK80Px02u2shwwK+ba3u8CyyhkGtWSlGxhGzpHr0RMcaVqHBv7OqhMd2ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hsJqX4/Y; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hsJqX4/Y"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eefae4so1578375ad.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541045; x=1790145845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDFzpc+a9bATnmd50P4M+vPlS8YdthhE8ho3W/sX1lQ=;
        b=hsJqX4/YYPHcbizwIaHCQv/jLgIxStbze3exY8AH5Wk2aAh6X9ffSNrMV5sCi7RJF9
         vmEewRNqadtOeQf28Vlqa62M+o1oQHfUL59w8vUMHLeMiT612fUU7gcBfpinPL009Kkr
         Nkx3m27Qt6Voy/4IooArfEImgDnSlobcLbnim4ZO9/bMm3fo/Mee5F+b0itt03zIv1vl
         hUgUfdCYe0CozezckpgWNIRqSCkLMeQoKBB+Rpi4bW/s22R25pmoQi5+keYJhL3mQG4E
         Eqm3+LoZsp7PgdXfY2jgcma5N6L8BWx2t8ckohWtOHclSTSu0g0HzXo+VFR+b2K7XPUG
         /9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541045; x=1790145845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDFzpc+a9bATnmd50P4M+vPlS8YdthhE8ho3W/sX1lQ=;
        b=mE4xa4/6PsO5lLocXPkGUClJ00j9Rx1Qhjd158iizWuLRymy/byTg89WkdNF0ktPWT
         vXkCQtBoxbz+Wsb2KVJDBz68sstz9NUhtrJlRNeSaDc1C9c+sKoIKQCq4UZVnuHMaa/B
         WsiD6oHFTA2LMR66OtaFGXvtUOmMO3MdzIvv8ewhiU9RW11j2xryVnj0xT09Hy61Vw05
         BZr0wQyYY7m9HNiAcfjeRL0RGOWWlwcrgyYwJGKPyLNMAzXYyPyulRWk0W5buqe3lnhs
         CwX4x6OHtL8Jylf24rpRr6eMya4PSeSDYSS+rCKbwLIoPKIhT4U0abae7iO6+ELzMQtp
         hycA==
X-Forwarded-Encrypted: i=1; AKwUvBzRafAZ2n2n7cHaXS/m3BoAjlCjAUPVPwqpKl+AP7JNczGtHGn+yUED8PX8wpKDzj6RzaIic04HYW4=@vger.kernel.org
X-Gm-Message-State: AFuF++mDbXW1OS6BTd6xt2GfBIvKxNzx3JaTOBc5FrIACXgzVIuJdwqz
	2m33/nvpwT5yJYAGVR2Ba1ht2KsetWlovMXhnqBkPJSTZfgbPWSwLCHAvRK1uUMYS4I=
X-Gm-Gg: AYBFou1EpLkMu2ymFI62b3h2eDj+CgiqC11hH+B2qZGwLIqyZ9Hm/QPKtgtMXG4PG2s
	b9+GjnraXk/KXFPFn7ZIgRzOLIAhSW+w69juHNA4VnaPGEQaohCUn9alC5B6gA6ryYa7mmMItXs
	pqzCNMBfg65YzjDhK0YDxpuyqMm8isKFeDyS73Qz0t2tEVaALnXSrIPBzARSgjKp/ur509ltdjZ
	/gIinDUcddJHmJclwGffQCe7Th4n2pEYOancLr2nNxMwzBoP0Cl933+wOVbJsw+3nbUJst8O3ip
	aGLfm2FHxrRJRAZS/lzacnuOIv31Rr1G51BJtxJrhU4iC8fxodqBmfFPNHNx6shg0pHC6TodlVu
	LFv/PTwzRRLaXbzvey7rKKfaAwef6IMNkaXi1lf7wzvpxt43rZdJyGoZuEjPPsHlNWvu2PaZFpO
	dPiUdOaeoQ8rVzuq0e8NQNJLmLj2P7BrB0Il5CyzfVJX7DhaRIPf73KPLbi1fCbMoO7DvNvXm1m
	86MbJFV54Tf5UaBbH8=
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr17328145ad.10.1789541045356;
        Tue, 15 Sep 2026 23:44:05 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:05 -0700 (PDT)
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
Subject: [PATCH v4 03/11] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Wed, 16 Sep 2026 14:43:33 +0800
Message-ID: <20260916064341.1825793-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
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
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v4:
- Collect Acked-by from Mike Rapoport

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

