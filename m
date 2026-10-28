Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149581;
	b=ZTObRgEytS18KwhIYHYnp5mH9fi9G8AJC/W9Hrej/YvMvGVhBiWv7BFVzu80GKzdvGqR
	 Jc7WtCB82yV6f0I3QO/RhuoyC1z6R9pwLs/n1XhR9nSDqGwMK5jaZMz+IsOY8LZLCUFPW
	 w57+UW8EbFBhDDb5hCvckxT6ir09UO37owugR67vymAmtnjuLM+MhgimIWzeVJnA8Zdom
	 5ZOHEpaQt+LJlI5QsdOTdUS0zxwitsKVqxyeI/C7Z140tn6Ic8kl5EMvUu6HL/2/sf3gN
	 zxumf+3+3QAr+X5GyYnCp59fDt5lzcnDwd4VFREhF9zVKX6mSbnjvSby2C/jFJ1l1cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3zcW+5YXwpWgAlstk9X4uWBFChO4Av++o92U1iDImK4=;
	b=rZrb57zlLzfnqz/3aHYg/x6u0W04q5Y0y3gohL3UBCX0VOqa/6m64mr8G++Qs04wyeGq
	 7kibUs6+QlB3Mo8HLqqroY9NNk1gnK6wV2ZmeJpw/fvly9Qt5MgrSN+70P3rfHsF/RSBy
	 41D7738ZHH+I5Iixr5njxpUVojJI9zFE4yMcZlSGLOaUErqzgHLenNTBUy+FyZHoAMrK0
	 Z1qUs+kLxl3EgvXDj/uvuf5v4fSm+DC+83HpLUnZ4EDJMT+kflc1F5zEUS8CrD9cHsSZ1
	 Ki2zT8bLztYu9V5mOQNFStismB7jfbcpIELE3bsQXNCENaB9glw5dAAciH+19A0be0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUDkWSOc;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0A606A323
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 01:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE0A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUDkWSOc
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so441670a12.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793149580; x=1793754380; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zcW+5YXwpWgAlstk9X4uWBFChO4Av++o92U1iDImK4=;
        b=LUDkWSOcPb9F6RsSuNpHkpeq2oPkJVL1bNUvM/wgwBs1vJAQ+pzxMsfoleYav07b9n
         0bCX2f/lu5EZoJTagA9tI1v1mi4pbidDxwbJHP5JWTvNqH/GBK4LxvKWL3t4o6Sxo2HK
         rPdf2IeAHPWcONw2k0azXKIiv5O1UUtMC9MeaQ3L5CPOGxPchhIQQaLR2g01hb/XK0vE
         AOc0ISOYbewo84ORL85KUJkOp4m0n++49YLGUHavkKQ2hh/8+nkss/hb2rKT3XSEcM57
         YcN+ghkD6R8K0l2IvepVkEgmWC+I6ayy8tBd72VhspdqziwF54EjV7eIUXIjEDWonimY
         IWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149580; x=1793754380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zcW+5YXwpWgAlstk9X4uWBFChO4Av++o92U1iDImK4=;
        b=uBtIiYOYhENYEYfkHGdskawq3dbyeUc8hj4PRfQFtLoClOyWoQr7PV7Cufap6nibbe
         o6cQxNlXeaZOf3vrdLmlAO5weeJsvu/cspHSZS2FXaxGlTNjaBisyo+Zn5WhwxQul/K7
         J4f4O0inTvYDrlT7jZjcSchIuBd8z22xP8l4Yyw3ieOcKCdEJVqIElrlzjQbms/6JtYb
         cnWyLX44rKrU9DmnOZ3ldewaejNwxA2QX12N+CwqoW1fbne9Yfi5A/tuSCrorqSjcq2d
         932mycnUkApSiLxot9smHytp4JwbL6UxfPMunKGcPZ7PbpSr8HOVq9NRe219C8mskvb1
         csBA==
X-Forwarded-Encrypted: i=1; AKwUvBzriYu1IRz2WYBG0oIudigmLJ52h7wpDGeOn11N3rWoID8zZKbFSFBa84Kqx5UbNqEdPmBK4qlv7fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj856h9PDlhq9h3r63AsI8NJcJkt5fvA7NLxr6t42uiM3sLXUq
	DfjoQN8oHhFonlllB/OHaOQ8keEkEnkK4dpBK5dnhEzlrl7vH7hxXkSr0L+clw4k+3Fry9oYXVo
	htreyiBSLkHUv5IJcPg==
X-Received: from pgbcl22.prod.google.com ([2002:a05:6a02:996:b0:cc7:aab6:f8a6])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:5482:b0:3e2:7225:d14b with SMTP id adf61e73a8af0-3e9023f5055mr675991637.72.1793149579547;
 Tue, 27 Oct 2026 18:06:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:06:06 -0700
In-Reply-To: <20261028010611.3929937-1-tjmercier@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028010611.3929937-3-tjmercier@google.com>
Subject: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old generation
From: "T.J. Mercier" <tjmercier@google.com>
To: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Cc: cgroups@vger.kernel.org, "T.J. Mercier" <tjmercier@google.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

lru_gen_offline_memcg() moves an offlining memcg to the head of the old
generation of the memcg LRU (MEMCG_LRU_OLD), so that global reclaim
visits it first and evicts the folios it left behind.

Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
dying memory cgroup for LRU folios"), those folios are reparented to the
parent before lru_gen_offline_memcg() runs, and nothing can be added
back to the offlined memcg's lruvec afterwards. Putting an empty
offlined memcg at the head of the old generation no longer serves any
purpose and only delays reclaim from the memcgs that still have memory
due to additional shrink_many() iteration.

Remove lru_gen_offline_memcg(), so that an offlined memcg is rotated
like any other memcg below the reclaimable size threshold until
lru_gen_release_memcg() takes it off the memcg LRU. MEMCG_LRU_OLD has no
other user, so remove the op and update the memcg LRU comment as well.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/mm/multigen_lru.rst |  4 +---
 include/linux/mmzone.h            | 14 +++-----------
 mm/memcontrol.c                   |  1 -
 mm/vmscan.c                       | 20 +-------------------
 4 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/Documentation/mm/multigen_lru.rst b/Documentation/mm/multigen_lru.rst
index 52ed5092022f..b532ce961371 100644
--- a/Documentation/mm/multigen_lru.rst
+++ b/Documentation/mm/multigen_lru.rst
@@ -234,9 +234,7 @@ the active/inactive LRU (of folios):
 1. It has the young and the old (generations), i.e., the counterparts
    to the active and the inactive;
 2. The increment of ``max_seq`` triggers promotion, i.e., the
-   counterpart to activation;
-3. Other events trigger similar operations, e.g., offlining an memcg
-   triggers demotion, i.e., the counterpart to deactivation.
+   counterpart to activation.
 
 In terms of global reclaim, it has two distinct features:
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 7f078ff0dd76..542e465ee7a1 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -626,12 +626,10 @@ struct lru_gen_mm_walk {
  * per-node memcg generation counter, whose reminder (mod MEMCG_NR_GENS) indexes
  * the old generation, is incremented when all its bins become empty.
  *
- * There are three operations:
+ * There are two operations:
  * 1. MEMCG_LRU_TAIL, which moves a memcg to the tail of a random bin in its
  *    current generation (old or young) and updates its "seg" to "tail";
- * 2. MEMCG_LRU_OLD, which moves a memcg to the head of a random bin in the old
- *    generation, updates its "gen" to "old" and resets its "seg" to "default";
- * 3. MEMCG_LRU_YOUNG, which moves a memcg to the tail of a random bin in the
+ * 2. MEMCG_LRU_YOUNG, which moves a memcg to the tail of a random bin in the
  *    young generation, updates its "gen" to "young" and resets its "seg" to
  *    "default".
  *
@@ -643,8 +641,7 @@ struct lru_gen_mm_walk {
  * 3. The second attempt to reclaim a memcg below reclaimable size threshold,
  *    which triggers MEMCG_LRU_YOUNG;
  * 4. Attempting to reclaim a memcg below min, which triggers MEMCG_LRU_YOUNG;
- * 5. Finishing the aging on the eviction path, which triggers MEMCG_LRU_YOUNG;
- * 6. Offlining a memcg, which triggers MEMCG_LRU_OLD.
+ * 5. Finishing the aging on the eviction path, which triggers MEMCG_LRU_YOUNG.
  *
  * Notes:
  * 1. Memcg LRU only applies to global reclaim, and the round-robin incrementing
@@ -675,7 +672,6 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr);
 void lru_gen_init_memcg(struct mem_cgroup *memcg);
 void lru_gen_exit_memcg(struct mem_cgroup *memcg);
 void lru_gen_online_memcg(struct mem_cgroup *memcg);
-void lru_gen_offline_memcg(struct mem_cgroup *memcg);
 void lru_gen_release_memcg(struct mem_cgroup *memcg);
 void max_lru_gen_memcg(struct mem_cgroup *memcg, int nid);
 bool recheck_lru_gen_max_memcg(struct mem_cgroup *memcg, int nid);
@@ -709,10 +705,6 @@ static inline void lru_gen_online_memcg(struct mem_cgroup *memcg)
 {
 }
 
-static inline void lru_gen_offline_memcg(struct mem_cgroup *memcg)
-{
-}
-
 static inline void lru_gen_release_memcg(struct mem_cgroup *memcg)
 {
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index a05d9a8baa1b..e2ddf0680e62 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4475,7 +4475,6 @@ static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
 	memcg_reparent_objcgs(memcg);
 	reparent_shrinker_deferred(memcg);
 	wb_memcg_offline(memcg);
-	lru_gen_offline_memcg(memcg);
 
 	drain_all_stock(memcg);
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 636152d8c94d..45a2c1021f4f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
 enum {
 	MEMCG_LRU_NOP,
 	MEMCG_LRU_TAIL,
-	MEMCG_LRU_OLD,
 	MEMCG_LRU_YOUNG,
 };
 
@@ -4560,8 +4559,6 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	/* see the comment on MEMCG_NR_GENS */
 	if (op == MEMCG_LRU_TAIL)
 		seg = MEMCG_LRU_TAIL;
-	else if (op == MEMCG_LRU_OLD)
-		new = get_memcg_gen(pgdat->memcg_lru.seq);
 	else if (op == MEMCG_LRU_YOUNG)
 		new = get_memcg_gen(pgdat->memcg_lru.seq + 1);
 	else
@@ -4571,11 +4568,7 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
 	hlist_nulls_del_rcu(&lruvec->lrugen.list);
-
-	if (op == MEMCG_LRU_OLD)
-		hlist_nulls_add_head_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
-	else
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
+	hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
 
 	pgdat->memcg_lru.nr_memcgs[old]--;
 	pgdat->memcg_lru.nr_memcgs[new]++;
@@ -4613,17 +4606,6 @@ void lru_gen_online_memcg(struct mem_cgroup *memcg)
 	}
 }
 
-void lru_gen_offline_memcg(struct mem_cgroup *memcg)
-{
-	int nid;
-
-	for_each_node(nid) {
-		struct lruvec *lruvec = get_lruvec(memcg, nid);
-
-		lru_gen_rotate_memcg(lruvec, MEMCG_LRU_OLD);
-	}
-}
-
 void lru_gen_release_memcg(struct mem_cgroup *memcg)
 {
 	int gen;
-- 
2.56.0.307.g5fe7bd680c-goog

