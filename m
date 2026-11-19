Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071643;
	b=WVSOxey7U8pIGk/NJtJxQ61I6rPObC8BxPlPmqx+uazr6TeM7i5PuXKir93oJ6LnGCHy
	 ODeWUkFHKmaWwJpmI7s8Fq7zIFlCgF5+H+wFvklZe+pR5SjpMYbwvHOvD/KCqVht9yYm1
	 5yvujE7o6nMYbyh33Z+sMm5nuU3lvGbGGhuZPwIpPIysv17N9B3OPMAeUFos3bYxnVn7a
	 L/q/kehdQmd6YzUPJGr75ZFN7nWg43uk7AN/ANsGSkMTG9v37zWEUTAhuDbRudlpTWgl3
	 6ijn/Cz1nBEl8+RbYxypJ0LZ2tjy9Coglk+6zMP1jPtrLv/dnbBd0ACbfUoRNFwshkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+3lWud7DQJXjUbfSMY4r4QoMTzIguNTYupF3jSPDUjo=;
	b=Ez9yGTOMMe0HHyqUJCEDLsCOBNbxHgj6+b3UqOG86dkk7pZNBAMWByDW55OAMZt7cl8F
	 RC/mFtLGpnIY4ptC9nGIaFkRfFQNm4bkd3/gZVHtig6TTNb5+5184QV/VlUG3/q7QIwxX
	 bSQFMuP7rYSKrwLjxPJaEBEzpOkEITLHxH6X11ayI6uU2Qh4aAKi7S4jX1ztRl5HBSFgl
	 yuBmvYIbOaVtkAWmWY/G/4/4r8T18O8lf9JDWdY7OK4Dc8oosw5jvpd3nHwcz37zpm88T
	 RwxbDDHH796lcTN8cnvcwRpTtfcaDsWG+gpCBg4hsR3KEeoOpK0mF+Xf/9cktCZ/TFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RhN6XcK7;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606D606A337
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8606D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RhN6XcK7
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1147517a91.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071643; x=1795676443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3lWud7DQJXjUbfSMY4r4QoMTzIguNTYupF3jSPDUjo=;
        b=RhN6XcK7rtTOALBpHLfvjj9XLW2rc/8jOJCdb9xw7TPohqJkzx+2ERhcUMJIgOuiZ4
         meZ8RpNBc1xHvn/BU5yqau6LDQUoj7t1A8ZCvOMGyaiu2pesSFni6DC3RcNNaZkPEKjz
         YdUy65kvhy2CciczTxnwH73KZle/u+u3AKpXOFD2OXHXOc+5kqkujxNLWw5MeUJrRfJM
         tqt2r7dKkRSm6RhtDnUo7NO+7oyiLH1YJz6i9gBZm2pICtDzJNg+i1a0m1Fe055oUiok
         KJ+bYzvm1flbgKv5DTZwYmyQaSZJMIty5logG7vEDdwAu//NNDdsuh7PebHEkSC32PmA
         s1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071643; x=1795676443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3lWud7DQJXjUbfSMY4r4QoMTzIguNTYupF3jSPDUjo=;
        b=MR/4UNaafaXuAYhGLml0PwQqQwEJ23wBJBTZZoclEBjvN7LbqEPOM0QgtdGlLpfoiv
         gNtTx/hUNb9NPARHQMCH3udmBs/K+1aFvB6Wqrh405ju/lifHndq4es4ZUNQ7DXTjZKI
         JgHfNxaPZsGQvAz9zeSraiqAxglZx9IqDMYcTAJ+H1rA5ImetNmQ7aYXxvaDTZ/h1HvS
         AgQfWeYdTvH1xS+TssjoP9n8s4MwdVqh8buGuvw1DBDOF69EHd4f4zVRV+ZRRnjVY4zc
         EVhppxO+kSpAney3jqKVf508GbKmgWz+y7oifBPhfTe+KXfBSjhlq3P2Xm+fcTyuB/FE
         PFbQ==
X-Forwarded-Encrypted: i=1; AL+hErEQVAT2BFHqrI2ztEU0yQ/qBpvoRZF4jO8MKmwn28Axzxr8X+BXWH53bErDzItE4ZlG6UjrtdP74zQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mIHMOtJpF2HawsNZaMkuuKfCWY4xi/CWVHmXGcBo5+B3cuu0Q
	Ncl1aei/+XdYtAItz1U0quAx2bv4+OcMMU37VpUOFKZnUDFsoxHtQcfxnVgzirRv7bw=
X-Gm-Gg: AZFdTZcLJta+8Q7P2axvI7HFNr+Hbm9v4tQk0umnDQLAmCP5orXJDjayMTdq8kktCXn
	pgvX6J2o7pGFeAnWgUCbI7yRiKmYy7res/KWsC7NOVzB4Ed3APRemSicNRfeZ4vGONNhmQ1i07d
	CueYRkvb93yKbSfRpYTQ+sn3zIQ8yNrRK/J6QQA6zjhe2R5klh5POAUiGZ05pdReAHWkJ1mVSKr
	S9icXm2TLBiqKm4TCiM2aZJdO9TJdge9a7YOHgrDVRZpoGHIGqpW9TYmp0e5TX3IZgnmpZJCQBg
	IiWdxt1UlWTpnCpRTncvbp02PyQmmupOimbf9a1eTC+x2nhv/ldbO2L+RMNCmWYJkE/uNHFbK5I
	YzvTwXjXsIEHzHLPUUXEaF5s/uTYJJ7gPFGxFmC9+Qys0jw4GBjRapZ3yOnGEDRGzJMx4bOwVK6
	pfQ2kgh6ZRF868gf0qNlcE84QhGG65yMXpC48YvMp6MiNNVPsE7I3agRf218rOuFvwmeAO87ya0
	yyBW/gZvDFex1St/+9L4TUDtLEhkoo6UEwIcqpPz5oZ39Yqzq7vi3QRf5w6JumFycALFfIBg8mQ
	OlGwf+c/y79qyogSqdRUVjSekfvq41cuwlUSJXlNvW7gJnaZWWfNYy3m+9Y=
X-Received: by 2002:a17:90b:3f85:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b3d07ca535mr5027632a91.51.1795071642703;
        Wed, 18 Nov 2026 23:00:42 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:00:42 -0800 (PST)
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
Subject: [PATCH v3 4/7] mm/page_ext: use common allocation and initialization entry points
Date: Thu, 19 Nov 2026 14:58:09 +0800
Message-ID: <20261119065812.89959-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119065812.89959-1-songmuchun@bytedance.com>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
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
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by from Mike Rapoport and Chris Down
- Collect Tested-by from Chris Down

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
index a9d848c92678..bcc4e7e8cd1f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2709,7 +2709,7 @@ void __init mm_core_init(void)
 	 * page_ext requires contiguous pages,
 	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
 	 */
-	page_ext_init_flatmem();
+	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
 	report_meminit();
@@ -2725,11 +2725,6 @@ void __init mm_core_init(void)
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
index 6196bab6868c..aff00f4e1bdd 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -185,7 +185,7 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init_flatmem_late(void)
+void __init page_ext_init(void)
 {
 	invoke_init_callbacks();
 }
@@ -243,9 +243,8 @@ static int __init alloc_node_page_ext(int nid)
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

