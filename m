Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF433644DB;
	Thu, 13 Aug 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637585; cv=none; b=bcEDaQlq7nbdjNbn2vhwTws6nbRKfRIcdIHS0Zl66kdfxKb/xUg2Ta0UXAj1NkZqHXCIAAh5H6oIM1aMbRDS9F2wp8m5p9Jehr9/xHAe+665lRqYG40LqmoyK3hVGEqtq+QDi9d4YfiEBj4V8rUXo+VAsnLWACx4l0YWC9OkS3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637585; c=relaxed/simple;
	bh=1ff+wG+sa6Xy4dzpGLnrxgFQcPwOCiE3zi7n1C8cTPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCvpibJTLkW7EB3vYDkgJByyxnJ5oeWsdaQEjXKpOrLYsbwQkIDNLdGm2UKW7PIhZtC8JLwQTM6xBb7UXuxPQ2YMT5ptt1u+4l75JkG5DMDrKIgiJjHLDOwJuZlqTXbi1h62J+cmJRCm0qewXKQoH1AyAioJKNBNW4XiImSkpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnffH87H1qu6l7BQ--.41802S2;
	Fri, 14 Aug 2026 00:12:45 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 2/4] mm/slub: preserve one previous object lifetime
Date: Fri, 14 Aug 2026 00:12:44 +0800
Message-ID: <20260813161244.74476-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
References: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnffH87H1qu6l7BQ--.41802S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4fCryrKw1kAFW5JryUAwb_yoWrtryDpF
	W3G3W7JFWjqr47AFZxJ3ykCr1fA395A343AFWagayruFyYqw1kJFZ7tryjvFWUAryvvasr
	Aws09r1FkF42vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7sRiKsUtUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER replaces the allocation track when an object is reused.  A
later stale free can then replace the free track as well, leaving the
report without the completed lifetime that created the stale reference.

Store one additional alloc/free pair.  Before recording a new allocation,
copy the current pair to the previous slots only when both records exist.
Keep the current free track intact to preserve existing SLAB_STORE_USER
behavior during the reuse window.

Print the previous pair when available.  These records are diagnostic
history and do not infer semantic ownership.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 mm/slub.c | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 0653def0fe36..355fbffb981f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -329,7 +329,13 @@ struct track {
 	unsigned long when;	/* When did the operation occur */
 };
 
-enum track_item { TRACK_ALLOC, TRACK_FREE, TRACK_NR };
+enum track_item {
+	TRACK_ALLOC,
+	TRACK_FREE,
+	TRACK_PREV_ALLOC,
+	TRACK_PREV_FREE,
+	TRACK_NR,
+};
 
 #ifdef SLAB_SUPPORTS_SYSFS
 static int sysfs_slab_add(struct kmem_cache *);
@@ -1074,12 +1080,23 @@ static void set_track_update(struct kmem_cache *s, void *object,
 	p->when = jiffies;
 }
 
-static __always_inline void set_track(struct kmem_cache *s, void *object,
-				      enum track_item alloc, unsigned long addr, gfp_t gfp_flags)
+static __always_inline void set_alloc_track(struct kmem_cache *s, void *object,
+					    unsigned long addr, gfp_t gfp_flags)
 {
 	depot_stack_handle_t handle = set_track_prepare(gfp_flags);
+	struct track *alloc = get_track(s, object, TRACK_ALLOC);
+	struct track *free = get_track(s, object, TRACK_FREE);
+	struct track *prev_alloc;
+	struct track *prev_free;
+
+	if (alloc->addr && free->addr) {
+		prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
+		prev_free = get_track(s, object, TRACK_PREV_FREE);
+		*prev_alloc = *alloc;
+		*prev_free = *free;
+	}
 
-	set_track_update(s, object, alloc, addr, handle);
+	set_track_update(s, object, TRACK_ALLOC, addr, handle);
 }
 
 static void init_tracking(struct kmem_cache *s, void *object)
@@ -1113,12 +1130,22 @@ static void print_track(const char *s, struct track *t, unsigned long pr_time)
 
 void print_tracking(struct kmem_cache *s, void *object)
 {
+	struct track *prev_alloc;
 	unsigned long pr_time = jiffies;
+
 	if (!(s->flags & SLAB_STORE_USER))
 		return;
 
 	print_track("Allocated", get_track(s, object, TRACK_ALLOC), pr_time);
 	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);
+
+	prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
+	if (!prev_alloc->addr)
+		return;
+
+	pr_err("Previous object lifetime:\n");
+	print_track("Allocated", prev_alloc, pr_time);
+	print_track("Freed", get_track(s, object, TRACK_PREV_FREE), pr_time);
 }
 
 static void print_slab_info(const struct slab *slab)
@@ -1366,8 +1393,8 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
  *
  * [Metadata starts at object + s->inuse]
  *   - A. freelist pointer (if freeptr_outside_object)
- *   - B. alloc tracking (SLAB_STORE_USER)
- *   - C. free tracking (SLAB_STORE_USER)
+ *   - B. current alloc/free tracking (SLAB_STORE_USER)
+ *   - C. previous alloc/free tracking (SLAB_STORE_USER)
  *   - D. original request size (SLAB_KMALLOC && SLAB_STORE_USER)
  *   - E. KASAN metadata (if enabled)
  *
@@ -2024,8 +2051,8 @@ static inline void slab_pad_check(struct kmem_cache *s, struct slab *slab) {}
 static inline int check_object(struct kmem_cache *s, struct slab *slab,
 			void *object, u8 val) { return 1; }
 static inline depot_stack_handle_t set_track_prepare(gfp_t gfp_flags) { return 0; }
-static inline void set_track(struct kmem_cache *s, void *object,
-			     enum track_item alloc, unsigned long addr, gfp_t gfp_flags) {}
+static inline void set_alloc_track(struct kmem_cache *s, void *object,
+				   unsigned long addr, gfp_t gfp_flags) {}
 static inline void add_full(struct kmem_cache *s, struct kmem_cache_node *n,
 					struct slab *slab) {}
 static inline void remove_full(struct kmem_cache *s, struct kmem_cache_node *n,
@@ -4493,7 +4520,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 
 success:
 	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
-		set_track(s, object, TRACK_ALLOC, ac->caller_addr, gfpflags);
+		set_alloc_track(s, object, ac->caller_addr, gfpflags);
 
 	return object;
 }
-- 
2.50.1 (Apple Git-155)

