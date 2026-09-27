Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81243AA1B0
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477713; cv=none; b=Bgclv0+Z0KcO1bVPWwBePuxpL6Bv0xmzxOS6ZwYYOyYiEsMISH7e8JJ0cIiKuhElDeRczxWCCFNN+W8uec5DpgFoE+vtFwJDm6VGRI4iC2zhoaJrEunaSFhN2OwpcthzO7tLzc3MPR7b0Ak1ljtj8zFZBjv+EpHa71M4FG10dvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477713; c=relaxed/simple;
	bh=q3HT6xfHRoYAMNVXjK1x5yO75MJw/sRMzAnm8tJtAus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQpysyMTVXfq4SlVgrseAjlsFUwOBmP4WNdneWzkZM39tNTYx+RMiC+MC5zLnaTksWZ6SWaIh75j0rH/ABcHqudU/jjrZrOduzF1/fqY5jsS7eh1Zya5oFQJOSuIfdnAtgesjzie0VAFPuHINGiG1n0dDnqM5V8QMP0ev5ZyRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LlSh/SJi; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LlSh/SJi"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso850303a91.3
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477711; x=1791082511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPILxKtLMatcdEGLhusrMdFPdqn1uhqgdU3ISddJAJk=;
        b=LlSh/SJiosXrurb9TIRGu0Ea20ZiYnaq72lYh5jCfM+3UX75QEJjBJb8KCQReePxOX
         mxeVjVEECtAVNHzu1TwCG5HcI1Kt7sNnj0/GpD+1TqZw8JkaOuIKVPkDuyaDYF8MfMp/
         vnFyjJyvbF8yE1mzwfW6slN5K/sm0W5i0xWtZV5HAu5cjkSDXuwjwcQidSf5VHIJ8YUd
         Ya1GURYhSzwDikW25mhtMGvQMY2zoPeFy27TIfT0vZ8E6Povfg2xwJhU2HUQKTDhMZkG
         fYjJ3OKI2A9ldxGkPPmX/0OW50UxTG6cifxDf2nidg6YHTl+ylvsuB1lufILUyyA+iBp
         lS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477711; x=1791082511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPILxKtLMatcdEGLhusrMdFPdqn1uhqgdU3ISddJAJk=;
        b=bYmftqTSNvL9sJko/Dv/IGMjjVPQh21YwDcmTML5rH7vnpOeqYKEhZPvccF1bQh6IZ
         vuvKrqjXIw9GH/ub7vqj88rce/oH1A8GD1idkymxoVxfcEffbtiHqam/02n4eFE95MSn
         tdyTPq8C3z8FMSom+aahL1HGyNubjT7XH2LfgdrPtNbjB2j/xoQxYlyc/l5MQezT1t5m
         yU+aWJBUuB5fq4osdv+ikcJGE0mNxDILa7mgQnHSb0ftuicmfMCOvt+rR+xn5xuMHFwg
         g8eNSSIPJOsdVNkIsO4zWnQElKMAmlvzME9nj4A4YwuFn1P8U4cQQT6L6hKlI9C9iEzD
         7/ng==
X-Forwarded-Encrypted: i=1; AKwUvBxRxlags3Eth4wuZGV8gbY5WG43urI8990AwbIGvMd0nCsHxCIgPm7zBR2mRi0YnpduNiw7fR+U4bY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOui79vwP1I7ISu4URI7zZK1eNBTHvSD8INOfTgV5ARMZdalbt
	S9sVqxU2TvMTnyZEFVaKGt43JUTVHnskk4to2M9W1EklPIOxAZgadlPaN1HyolSj/AI=
X-Gm-Gg: AYBFou1wD2pQUH/484b1psd+otOWtbf0jBDq9lkm5ItNGHeUUT595VLVjL5fyIZiIch
	Kh8MdwsrZFnJjreUpydX5YYiJXS840xlHgM9nCvYersaXo7AQ8NvXnmaO0gJ9o6KC838uM+3L6J
	LzEVDjgK3LQpIdObtY17TMn1aRLT5b6QyVAgwfQvaI+Mu0argazsE94/G8fc6Xh3Jj5Mbc6delv
	wvo/N9jy3kaQldlz3zjXHbpveWwT+24ButeKZmZ3pR3qZIFWwIddDxY+Et93psOzHVLwcI/mMAg
	eAuc/Tnare+YmzH6xaUIBVNs46dAHayNa+7yqDR+L7Bq/Y2O50Xp55tNxGC6i+2paoez/KZFWWX
	UVt9tzCdNi8CrfJrAkEt7vawiawR1ubOKGOvR/EYV3xNES9nEw98kqUDgI/V5w7ETgIxzn9dL4+
	tX9/xmeJ5R8Ooo7lI3U1lLWyXhCSYttjVub4blKopjU8UIUqdcEbVUg+4GMD2ovxXGL9EvMjPSo
	x+beSNXK6ehqbX/JgFo
X-Received: by 2002:a17:90b:1807:b0:3a0:c8be:3227 with SMTP id 98e67ed59e1d1-3a0c8be4232mr4636947a91.13.1790477710866;
        Sat, 26 Sep 2026 19:55:10 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:10 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 04/12] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Sun, 27 Sep 2026 10:54:33 +0800
Message-ID: <20260927025441.741633-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
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
index 38c36399f53e..e4dae98ba7f8 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -217,7 +217,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
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

