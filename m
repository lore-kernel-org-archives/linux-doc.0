Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917251;
	b=qHAVPkOGzynhj0o715E24BGFMRvAObHbShqNam9mUPg1CMXHUHRrO/RoR84B8SQh/CBA
	 rbpUqysEkApDnui+9Hi3xldG8+BgOUNtRqvRyi2eZrghfsW3rQ7bl3YpkZwtJn1zHfvv7
	 MS79Ff8Pc0qdbmh3NfeUEJUwNOYtyWb7pOYfXEAuNozafxS9S9C4GVoJz450WQeUtdCS/
	 l6xyYSwf3FGzjOqVHwxdXQFfdx6t9B1zBBf2F8cD2e4a1yE5IGTSZnKPGXYZyoqFcUvIp
	 LQOlXgpZA062/MI1G6XQZHzZXjSRXo+ZcTuKt/AtchdT7tOMN+01kfZNp1+gzzYAiFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
	b=LyIkHcLNQkkZOx05pcRiqLm3ccVu/scL7yUzoJvHh/f5LWFLa9iRKOzIU5fQxtpDBeqB
	 WVGUOyxqT2QpWU0XjyqwoDIvs7eJEeRBm9MGaMPUQuasAWRXyNlo4lmaACEVImYZHsXWp
	 qodp8OUqEBrL/RWp7ma1VO5C/Cv9fIcsypXc85F8C0Ng06akl+PyKEwmCYqR53MM6W7qk
	 KpwuYHRDoh415Cvpf+dTYRInxUuXQyxZejkFgsRNBbtreaQYnltCdDZOsSj/Vpwe1+T4+
	 7Ltp0eJ0iDEelvhpAOblr82dRNaHibYFm7XHS8k+6yCvh9B/LwUiuyv5xDihPvMGtKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=amzvsOJh;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6244B606A333
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6244B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=amzvsOJh
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so5501044c88.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917251; x=1795522051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
        b=amzvsOJhuycHMOwm4UcjChoSDwWx8ViiScRU0Qi3yrQqMlkr6nzNrW1lrKENx7GSio
         s0YawlWHmheXeVx9DCYoKIl6N3jL1T6+uqD+S4XqrPlkNLRM4mZalTdNSruDa0G5BnPm
         aIjgeV5fwOKJHzSB5eVawOrfoJOXwB8Os6jOKJNccDAX6kUcsPan2BHLNN3w1866kUu4
         00QsqrwlcLVdst2sBL4ksoginF5eLTLI8Awku3y9VO/7DXC1tIihqEg3q3cKJABlsNN7
         msQZSmEYONchx3qKztxTwIN/275681w6nXbU3t+QTjzM8ar8FEarGkXhGAbWc09NxDda
         Kw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917251; x=1795522051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
        b=vkCRaZ20UgHy87zRHtshnskeAYowUFTmluyAeWD7dMVM+R2j9FvvUsaeLq+VlSt+w4
         VoD23BQgYI0p6XRlMywISc5/SUAUDBAWrYSWJn1iBu+sGy6pRNXl7aUf3rATEWykiUB/
         XC+FkcPxY2G5DwjnZAiAZBphR/gBQxX4e6YENfMHje9dBbaSoLBzBfywCMxyLaIEZgFu
         DDG73EjWHrgQKo68zi9nEzp5MJDOU/KHTJA1QZEG7IPGSC3LN4s7OvaoANufhwa1vOYN
         0gFx+VodhuieM+Cu85KyIlI8tuqQBoKQrrGmQ96dlOQkB8eq+g7FU9m+72ZkIIAELAVx
         fz5w==
X-Forwarded-Encrypted: i=1; AL+hErFZnc8kyPnn8sQR9XJILAx3cf7cFqNMo/+1FNT+HYFwyQx0ZHC69O7yIROe7ujtrO89njIhJRjUYrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BHkbgbIHOU9tIT2/YkhHv7fwmlOUopSKOrUo+Buz28UPLNMsH
	waDmLoVw9l2hFZXAzFTD/9Uusj9g73ARXT24AoIWEBYgtUscuQgtZZsrzt/hWtE/P5k=
X-Gm-Gg: AYBFou2b3rEfKP16P/qFO1t99b7I+kxhcLs1TKISyH7BlG1l4EwelKP+gxoE+R/KIrB
	L2nPXy83IGlC34zdQsiKQ6JwKFRAc7vBh2/oMu78Is1DxbtAAsmfdZRAF38KV68MAPY87pOMFwh
	lw75niMHlR5RontrqZb9MfTVWbyAxCi6ATF9hPXs188G1zfDqjXef86po3OwyBeK3VzYOc3Akmg
	QlBgBLNo5BINfEAnbLhNuBEiztd978eMy8cbB2M775CM+782eNS6Dy0Twtfb9ve5pC1kn7CrQ+u
	Y1NDNhoWHH/n2sK322OqOd/gFYSMCphh6K0lH7JV5u6F03QFvPvi0acxAnViepIrc7rQHiuhCQg
	8MNHJL+SUBsPyL0PIglccCI3B5ZvCM7XElg4sB44u0mqRjZnRvyIUKuA3vjZhhYBJhe2c1d6Hyw
	zONqZ86qkC2wEd5x1ZWS9bY3c2wrYPgd/AFbElaDyIVkh1gopJMy0jBRfbB2Wv+wWvUgqgivyL8
	R+XVc3yBe0tDc4GEy5foA0NTS6F/5+DVmicsZqZZCTMCfwXq4suBwUoUqKWlNth5tqBMlNOEPWJ
	Yrch0EIfIw6PvdNv5zZvVzKh5qHKWw4rLZSgND7wC+VjF/TZFEg6zFI6lh7GNI5unQ==
X-Received: by 2002:a05:701a:cc97:20b0:1b5:2dce:1b88 with SMTP id a92af1059eb24-1b52dce1e79mr5203228c88.45.1794917250013;
        Tue, 17 Nov 2026 04:07:30 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:29 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 4/7] mm/page_ext: use common allocation and initialization entry points
Date: Tue, 17 Nov 2026 20:06:24 +0800
Message-ID: <20261117120627.50601-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FLATMEM uses separate page_ext_init_flatmem() and
page_ext_init_flatmem_late() entry points, while SPARSEMEM performs its
work through page_ext_init().  This exposes the memory model in the
generic boot sequence and obscures the allocation and client
initialization phases.

Rename the early entry point to page_ext_alloc() and use
page_ext_init() for client callbacks in both memory models.  SPARSEMEM
keeps its existing late allocation behavior for now; its
page_ext_alloc() remains an empty configuration stub.

This also moves FLATMEM client callbacks from immediately after
kmem_cache_init() to after vmalloc_init().  The callbacks still run
after the buddy and slab allocators are available, as required by
page_owner.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Split the common allocation and initialization entry points into a
  preparatory patch
- Document the later FLATMEM client callback timing (noted by Chris
  Down)
---
 include/linux/page_ext.h | 20 +++++---------------
 mm/mm_init.c             |  7 +------
 mm/page_ext.c            |  5 ++---
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 79c53ec45dfa..911a84bbb3db 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -62,13 +62,10 @@ static inline bool early_page_ext_enabled(void)
 }
 
 #ifdef CONFIG_SPARSEMEM
-static inline void page_ext_init_flatmem(void)
-{
-}
-extern void page_ext_init(void);
-static inline void page_ext_init_flatmem_late(void)
+static inline void page_ext_alloc(void)
 {
 }
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -79,11 +76,8 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-extern void page_ext_init_flatmem(void);
-extern void page_ext_init_flatmem_late(void);
-static inline void page_ext_init(void)
-{
-}
+void page_ext_alloc(void);
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -205,11 +199,7 @@ static inline void page_ext_init(void)
 {
 }
 
-static inline void page_ext_init_flatmem_late(void)
-{
-}
-
-static inline void page_ext_init_flatmem(void)
+static inline void page_ext_alloc(void)
 {
 }
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2367af05570b..7344e7cb8196 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2711,7 +2711,7 @@ void __init mm_core_init(void)
 	 * page_ext requires contiguous pages,
 	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
 	 */
-	page_ext_init_flatmem();
+	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
 	report_meminit();
@@ -2727,11 +2727,6 @@ void __init mm_core_init(void)
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
-	/*
-	 * page_owner must be initialized after buddy is ready, and also after
-	 * slab is ready so that stack_depot_init() works properly
-	 */
-	page_ext_init_flatmem_late();
 	kmemleak_init();
 	ptlock_cache_init();
 	pgtable_cache_init();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 3b581242fd52..b41d4a957bc6 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -180,7 +180,7 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init_flatmem_late(void)
+void __init page_ext_init(void)
 {
 	invoke_init_callbacks();
 }
@@ -238,9 +238,8 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_init_flatmem(void)
+void __init page_ext_alloc(void)
 {
-
 	int nid, fail;
 
 	if (!invoke_need_callbacks())
-- 
2.54.0

