Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6D483BEA;
	Thu, 13 Aug 2026 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637710; cv=none; b=jiF1yAG6Z7VWzqHBAHves+viJORrYobhmQ8+cOzih6NBjzyqXfu0B0SdqGe2O7kkHgkD6TkQONfu41xP/83FJXMTgK35EniIAMoIx2/3cnZnkhCyXTpxdVNDXHl9HF0EQR4qLIloYGIM6ZPQSP48vwthQqv2gvWqBzGacTmLz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637710; c=relaxed/simple;
	bh=/b8dj4WPBJ/BF07nUnl5sh2fz/fbPpitkJRQ3E6aV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHY7CbTEhQ3q4/wJ71O4l5HR0rMV88hrVmaIwsyNU7h3d03odB9OEjcaeM/sbNj4RPcDqus/bAVSfh3ck7ZOZ8+E3XyJSmxDedinRJLsg94l2nnPP+FYsas+goG0kth3pyh4xaC8GjxrR5h4d5LJK10F0YstJ7FWQgTn3WB4RFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACHWe187X1qrr17BQ--.55428S2;
	Fri, 14 Aug 2026 00:14:52 +0800 (CST)
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
Subject: [PATCH v2 3/4] mm/slub: test previous lifetime tracking
Date: Fri, 14 Aug 2026 00:14:52 +0800
Message-ID: <20260813161452.75035-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACHWe187X1qrr17BQ--.55428S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy7Xw47Xw4kKr1fCrWxWFg_yoWrWw13pF
	ZakF15Kr4UXF17XrZxCFn2kr1SvF4ktw17ArW2qrWkZr4Yqw1kAF4vkryjqFs7urWkua1a
	vasrt3WfGr4UZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9S14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x0pRLIDwUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Add KUnit coverage for the SLAB_STORE_USER reuse transition.  The test
creates a non-mergeable cache, pins the task against migration, verifies
that a fresh object has no previous lifetime, then frees and immediately
reallocates the object and verifies that the completed pair was retained.

Exclude KASAN configurations because quarantine can intentionally prevent
immediate reuse.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/tests/slub_kunit.c | 35 +++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slub.c              | 10 ++++++++++
 3 files changed, 49 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index fa6d31dbca16..62d0f5e64268 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/rcupdate.h>
+#include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/perf_event.h>
 #include "../mm/slab.h"
@@ -106,6 +107,38 @@ static void test_first_word(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+static void test_store_user_previous_lifetime(struct kunit *test)
+{
+	struct kmem_cache *s;
+	void *p;
+	void *q;
+
+	s = test_kmem_cache_create("TestSlub_prev_lifetime", 64,
+				   SLAB_STORE_USER | SLAB_NO_MERGE);
+	migrate_disable();
+	p = kmem_cache_alloc(s, GFP_KERNEL);
+	if (!p) {
+		KUNIT_FAIL(test, "failed to allocate the first object");
+		goto out_enable;
+	}
+	KUNIT_EXPECT_FALSE(test, slab_test_has_previous_lifetime(s, p));
+
+	kmem_cache_free(s, p);
+	q = kmem_cache_alloc(s, GFP_KERNEL);
+	if (q != p) {
+		KUNIT_FAIL(test, "freed object was not immediately reused");
+		if (q)
+			kmem_cache_free(s, q);
+		goto out_enable;
+	}
+	KUNIT_EXPECT_TRUE(test, slab_test_has_previous_lifetime(s, q));
+
+	kmem_cache_free(s, q);
+out_enable:
+	migrate_enable();
+	kmem_cache_destroy(s);
+}
+
 static void test_clobber_50th_byte(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_50th_word_free",
@@ -395,6 +428,7 @@ static struct kunit_case test_cases[] = {
 #ifndef CONFIG_KASAN
 	KUNIT_CASE(test_next_pointer),
 	KUNIT_CASE(test_first_word),
+	KUNIT_CASE(test_store_user_previous_lifetime),
 	KUNIT_CASE(test_clobber_50th_byte),
 #endif
 
@@ -419,3 +453,4 @@ kunit_test_suite(test_suite);
 
 MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
diff --git a/mm/slab.h b/mm/slab.h
index f5e336b6b6b0..15634d9603f8 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -518,6 +518,10 @@ bool slab_in_kunit_test(void);
 static inline bool slab_in_kunit_test(void) { return false; }
 #endif
 
+#if IS_ENABLED(CONFIG_SLUB_KUNIT_TEST)
+bool slab_test_has_previous_lifetime(struct kmem_cache *s, void *object);
+#endif
+
 /*
  * slub is about to manipulate internal object metadata.  This memory lies
  * outside the range of the allocated object, so accessing it would normally
diff --git a/mm/slub.c b/mm/slub.c
index 355fbffb981f..d6b7487fb300 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -46,6 +46,7 @@
 #include <linux/prandom.h>
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
+#include <kunit/visibility.h>
 #include <linux/sort.h>
 #include <linux/irq_work.h>
 #include <linux/kprobes.h>
@@ -1148,6 +1149,15 @@ void print_tracking(struct kmem_cache *s, void *object)
 	print_track("Freed", get_track(s, object, TRACK_PREV_FREE), pr_time);
 }
 
+#if IS_ENABLED(CONFIG_SLUB_KUNIT_TEST)
+bool slab_test_has_previous_lifetime(struct kmem_cache *s, void *object)
+{
+	return get_track(s, object, TRACK_PREV_ALLOC)->addr &&
+	       get_track(s, object, TRACK_PREV_FREE)->addr;
+}
+EXPORT_SYMBOL_IF_KUNIT(slab_test_has_previous_lifetime);
+#endif
+
 static void print_slab_info(const struct slab *slab)
 {
 	pr_err("Slab 0x%p objects=%u used=%u fp=0x%p flags=%pGp\n",
-- 
2.50.1 (Apple Git-155)

