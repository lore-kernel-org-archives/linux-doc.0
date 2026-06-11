Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33025282F0A;
	Thu, 11 Jun 2026 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159990; cv=none; b=ETtY6cWaucHsjoQDZ84mQAqSSD+bWBxyXaz/0sHuJHaB03KKvJEBOQYkLE9iWNhcNJ+KWlwGxh4XH1/2SzkGZKHBYMeE/nZxuk0xc2ELKaQy+IfQYldcqlNeKjDz0ob+F1DcP9PLqYqVeb3JCFtbncm60Vvt7YPlxbEJx7rZ630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159990; c=relaxed/simple;
	bh=JJP5wmbZ0MbmCSCbDlWpr53Mun31CkcKjMPRPaxPn24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bScE83I0SxtopHOQDqpsizUybJUMcRuVrZO23VYFjufXK3uQ/+4auXNIoqSFXzcom8F7PhVLfTuOB0Xrc6kOHdTWxBHOBKQA36iQp6HoNR5fow39akoXsAGQGmrzhk8PPNmHSWOp5Jmf6dlwE+XsWVcF7zk52vkZ0f0tNWHBkUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHbdYgWCpqYOJFAQ--.1790S5;
	Thu, 11 Jun 2026 14:39:29 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>,
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
Subject: [RFC PATCH 3/5] mm/slub: print previous object lifetime in debug reports
Date: Thu, 11 Jun 2026 14:39:24 +0800
Message-ID: <20260611063926.38111-4-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHbdYgWCpqYOJFAQ--.1790S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW3Kw43urW8uF4UCw47CFg_yoW5uFW7pF
	W3Gr13KFWqqr47Cws3J3ykCr98Ca95uw1xWFWaga1S9r15tw1DAFn2yryjqFWrAr97ta42
	yr1Y9F1Skr4UZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0pRl_MsUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

When SLAB_STORE_USER is enabled, each object stores one allocation track
and one free track. Reusing the object overwrites the allocation track,
while a later stale free can overwrite the free track. This can leave a
report with the victim allocation and stale free but without the
previous completed lifetime that explains where the stale pointer came
from.

When SLAB_STORE_HISTORY is enabled, copy the current allocation/free pair
to a previous-lifetime pair before recording the new allocation. Keep
the existing TRACK_FREE semantics unchanged so current store_user and
free_traces behavior is preserved. On SLUB error reports, print the
previous completed lifetime when both records are available.

The extra records are diagnostic information only. They do not infer
semantic ownership or identify the root cause of a use-after-free.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 mm/slub.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index 803c597351ce..2dfa8af00a49 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1083,6 +1083,31 @@ static void set_track_update(struct kmem_cache *s, void *object,
 	p->when = jiffies;
 }
 
+static bool track_has_record(const struct track *track)
+{
+	return track->addr;
+}
+
+static void save_previous_lifetime(struct kmem_cache *s, void *object)
+{
+	struct track *alloc, *free;
+	struct track *prev_alloc, *prev_free;
+
+	if (!(s->flags & SLAB_STORE_HISTORY))
+		return;
+
+	alloc = get_track(s, object, TRACK_ALLOC);
+	free = get_track(s, object, TRACK_FREE);
+	if (!track_has_record(alloc) || !track_has_record(free))
+		return;
+
+	prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
+	prev_free = get_track(s, object, TRACK_PREV_FREE);
+
+	*prev_alloc = *alloc;
+	*prev_free = *free;
+}
+
 static __always_inline void set_track(struct kmem_cache *s, void *object,
 				      enum track_item alloc, unsigned long addr, gfp_t gfp_flags)
 {
@@ -1123,11 +1148,25 @@ static void print_track(const char *s, struct track *t, unsigned long pr_time)
 void print_tracking(struct kmem_cache *s, void *object)
 {
 	unsigned long pr_time = jiffies;
+	struct track *prev_alloc, *prev_free;
+
 	if (!(s->flags & SLAB_STORE_USER))
 		return;
 
 	print_track("Allocated", get_track(s, object, TRACK_ALLOC), pr_time);
 	print_track("Freed", get_track(s, object, TRACK_FREE), pr_time);
+
+	if (!(s->flags & SLAB_STORE_HISTORY))
+		return;
+
+	prev_alloc = get_track(s, object, TRACK_PREV_ALLOC);
+	prev_free = get_track(s, object, TRACK_PREV_FREE);
+	if (!track_has_record(prev_alloc) || !track_has_record(prev_free))
+		return;
+
+	pr_err("Previous object lifetime:\n");
+	print_track("Previous allocated", prev_alloc, pr_time);
+	print_track("Previous freed", prev_free, pr_time);
 }
 
 static void print_slab_info(const struct slab *slab)
@@ -4505,8 +4544,10 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 	return NULL;
 
 success:
-	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
+	if (kmem_cache_debug_flags(s, SLAB_STORE_USER)) {
+		save_previous_lifetime(s, object);
 		set_track(s, object, TRACK_ALLOC, addr, gfpflags);
+	}
 
 	return object;
 }
-- 
2.50.1 (Apple Git-155)

