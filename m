Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427A291C10;
	Tue, 16 Jun 2026 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619295; cv=none; b=F1BSVF48Qj7iqVXJaT6ApCSyA3bO9UdOAR5ApSnGUsG7rN0ebgB3bnTiV0CakZYPvfLni+Ux0popHNCfngIoJzIksqLFbFpIQgCeZIcERAt0y5cPZ836PQnhhwT7iyxWF7vF5SdLr/W87QYWxGu3P96K59VlRgTed6zyApAARj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619295; c=relaxed/simple;
	bh=QBkwnR/6HkGf20mZqDgozcJzpw4LgTsnodl0KC0JUPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJ0IcRZGSfTi50+ONGZHs5phigO1GXBbEcOwzcM/FeN9SPjyJhUm5YqiFXaANxrNZbosLtXKw46ze4AAmucaHmYe/WopMesKlhSS0he8buqepmVIUhQiVpDvBIGOo+P8zKoH4vJWQJSA71l6CizhVlTcpAD4mT9SMSzKQ7akUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHZNtDWjFq5sHvFA--.10727S4;
	Tue, 16 Jun 2026 22:14:29 +0800 (CST)
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
	liam@infradead.org,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 2/4] mm/slub: preserve previous object lifetime in user tracking
Date: Tue, 16 Jun 2026 22:14:08 +0800
Message-ID: <20260616141410.52117-3-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
References: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHZNtDWjFq5sHvFA--.10727S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw18tF4rGF1kKw4UJw45trb_yoW7uF4rpF
	WfGF17Gayjqr47CFZ3J3ykur1fA395Z347XFWag3yruryYqw1kAFyIyryjqFWUAr97Z3Zr
	Ar4Y9F1fKrWUZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
	Ja73UjIFyTuYvjTRCxR6DUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER stores one allocation track and one free track for an
object.  When that object is reused, the next allocation overwrites the
allocation track.  If a stale pointer from the previous lifetime is later
freed or otherwise reported, the free/check report can contain the victim
allocation and the stale operation while the previous completed alloc/free
pair has already been overwritten.

Keep one previous completed lifetime in the existing user tracking
metadata.  When an object is allocated and the current allocation/free
tracks both exist, copy that completed lifetime to the previous-lifetime
slots before recording the new allocation.  Clear the current free track
when the new allocation begins so the current lifetime does not continue
to display a free from the old lifetime.

Print the previous object lifetime when it is available.  This is
diagnostic information only; it does not infer semantic ownership or
identify the root cause of a use-after-free.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 mm/slub.c | 66 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 43d4febd5bf2..358f42e92207 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -327,7 +327,13 @@ struct track {
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
 
 static inline unsigned int user_tracking_size(slab_flags_t flags)
 {
@@ -1080,12 +1086,37 @@ static void set_track_update(struct kmem_cache *s, void *object,
 	p->when = jiffies;
 }
 
-static __always_inline void set_track(struct kmem_cache *s, void *object,
-				      enum track_item alloc, unsigned long addr, gfp_t gfp_flags)
+static bool track_has_record(const struct track *t)
+{
+	return t->addr;
+}
+
+static void clear_track(struct kmem_cache *s, void *object,
+			enum track_item track)
+{
+	memset(get_track(s, object, track), 0, sizeof(struct track));
+}
+
+static void save_previous_lifetime(struct kmem_cache *s, void *object)
+{
+	struct track *alloc = get_track(s, object, TRACK_ALLOC);
+	struct track *free = get_track(s, object, TRACK_FREE);
+
+	if (!track_has_record(alloc) || !track_has_record(free))
+		return;
+
+	*get_track(s, object, TRACK_PREV_ALLOC) = *alloc;
+	*get_track(s, object, TRACK_PREV_FREE) = *free;
+}
+
+static __always_inline void set_alloc_track(struct kmem_cache *s, void *object,
+					    unsigned long addr, gfp_t gfp_flags)
 {
 	depot_stack_handle_t handle = set_track_prepare(gfp_flags);
 
-	set_track_update(s, object, alloc, addr, handle);
+	save_previous_lifetime(s, object);
+	set_track_update(s, object, TRACK_ALLOC, addr, handle);
+	clear_track(s, object, TRACK_FREE);
 }
 
 static void init_tracking(struct kmem_cache *s, void *object)
@@ -1120,11 +1151,22 @@ static void print_track(const char *s, struct track *t, unsigned long pr_time)
 void print_tracking(struct kmem_cache *s, void *object)
 {
 	unsigned long pr_time = jiffies;
+	struct track *prev_alloc;
+	struct track *prev_free;
+
 	if (!(s->flags & SLAB_STORE_USER))
 		return;
 
 	print_track("Allocated", get_track(s, object, TRACK_ALLOC), pr_time);
 	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);
+
+	prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
+	prev_free = get_track(s, object, TRACK_PREV_FREE);
+	if (track_has_record(prev_alloc) || track_has_record(prev_free)) {
+		pr_err("Previous object lifetime:\n");
+		print_track("Previously allocated", prev_alloc, pr_time);
+		print_track("Previously freed", prev_free, pr_time);
+	}
 }
 
 static void print_slab_info(const struct slab *slab)
@@ -1371,10 +1413,12 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
  *
  * [Metadata starts at object + s->inuse]
  *   - A. freelist pointer (if freeptr_outside_object)
- *   - B. alloc tracking (SLAB_STORE_USER)
- *   - C. free tracking (SLAB_STORE_USER)
- *   - D. original request size (SLAB_KMALLOC && SLAB_STORE_USER)
- *   - E. KASAN metadata (if enabled)
+ *   - B. current alloc tracking (SLAB_STORE_USER)
+ *   - C. current free tracking (SLAB_STORE_USER)
+ *   - D. previous alloc tracking (SLAB_STORE_USER)
+ *   - E. previous free tracking (SLAB_STORE_USER)
+ *   - F. original request size (SLAB_KMALLOC && SLAB_STORE_USER)
+ *   - G. KASAN metadata (if enabled)
  *
  * [Mandatory padding] (if CONFIG_SLUB_DEBUG && SLAB_RED_ZONE)
  *   - One mandatory debug word to guarantee a minimum poisoned gap
@@ -2029,8 +2073,8 @@ static inline void slab_pad_check(struct kmem_cache *s, struct slab *slab) {}
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
@@ -4522,7 +4566,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 
 success:
 	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
-		set_track(s, object, TRACK_ALLOC, addr, gfpflags);
+		set_alloc_track(s, object, addr, gfpflags);
 
 	return object;
 }
-- 
2.43.0

