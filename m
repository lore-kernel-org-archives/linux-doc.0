Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E027036A34E;
	Tue, 16 Jun 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619295; cv=none; b=smJLjxxokCBTlsMC2UVZTnIPM5b4ulWwgwd2MqWqs3r+kvkFXxzumlqFEva8JBvOobTeUzHsTB4Msp/+FfRX+VrXR7jADsgvk0lUUAxXtg/DjG2yijUDw6+Gj6Je0qhV+UVqJS86Z03a0LiZxDW7r0kKTvuvjwALHv+NTUe5YVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619295; c=relaxed/simple;
	bh=Y0em1xQDf236VdmuIqcPs9MTxKxky1kYmo0nZfshY3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrOl2a0RmpBaljyaX9F0Qq9h6Z5s+PSA6JpNV1v66VoADmycjm8iFE9gmB196AlN9HMByTvkhpoRj01vcrJ1xHaC/I9oxrhCbYivnJMjCG0zFu/B4SUDmQNAqrexE8kn5uU6neDHG/GFRpnsA2vNEk//hQzILwAH3vR2r35ORps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHZNtDWjFq5sHvFA--.10727S5;
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
Subject: [PATCH 3/4] mm/slub: test previous lifetime tracking
Date: Tue, 16 Jun 2026 22:14:09 +0800
Message-ID: <20260616141410.52117-4-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:rQCowABHZNtDWjFq5sHvFA--.10727S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1xGF15GFy8ZFyruFWfXwb_yoWrWF4fpF
	WfKF15Kr4UXF17ZrsxGrn7ur9akayktr4UCa12qFZ7Zr45Xw1DAF1vyFyjqrs7ZrWxuanI
	vw10y3W3Gr4DZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
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
	Ja73UjIFyTuYvjTRCCJPDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Add KUnit coverage for the previous-lifetime tracking state transition.

The test allocates an object from a SLAB_STORE_USER cache, frees it and
allocates again from the same cache.  The immediate reuse case should move
the completed alloc/free lifetime into the previous-lifetime slots before
the new allocation track is recorded.

Expose a small KUnit-only helper so the test can check the internal
tracking state without parsing printk output or intentionally triggering a
real use-after-free.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/tests/slub_kunit.c | 33 +++++++++++++++++++++++++++++++++
 mm/slab.h              | 10 ++++++++++
 mm/slub.c              | 13 +++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index fa6d31dbca16..debd28c7f7a8 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -160,6 +160,37 @@ static void test_kmalloc_redzone_access(struct kunit *test)
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
+	KUNIT_ASSERT_NOT_NULL(test, s);
+
+	p = kmem_cache_alloc(s, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_EXPECT_FALSE(test, slab_test_has_previous_lifetime(s, p));
+
+	kmem_cache_free(s, p);
+
+	q = kmem_cache_alloc(s, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, q);
+	if (q != p) {
+		KUNIT_FAIL(test, "expected immediate reuse of the freed object");
+		kmem_cache_free(s, q);
+		kmem_cache_destroy(s);
+		return;
+	}
+
+	KUNIT_EXPECT_TRUE(test, slab_test_has_previous_lifetime(s, q));
+
+	kmem_cache_free(s, q);
+	kmem_cache_destroy(s);
+}
+
 struct test_kfree_rcu_struct {
 	struct rcu_head rcu;
 };
@@ -400,6 +431,7 @@ static struct kunit_case test_cases[] = {
 
 	KUNIT_CASE(test_clobber_redzone_free),
 	KUNIT_CASE(test_kmalloc_redzone_access),
+	KUNIT_CASE(test_store_user_previous_lifetime),
 	KUNIT_CASE(test_kfree_rcu),
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
@@ -419,3 +451,4 @@ kunit_test_suite(test_suite);
 
 MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
diff --git a/mm/slab.h b/mm/slab.h
index 1bf9c3021ae3..0b3813696ca9 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -487,6 +487,16 @@ bool slab_in_kunit_test(void);
 static inline bool slab_in_kunit_test(void) { return false; }
 #endif
 
+#if IS_ENABLED(CONFIG_SLUB_KUNIT_TEST)
+bool slab_test_has_previous_lifetime(struct kmem_cache *s, void *object);
+#else
+static inline bool
+slab_test_has_previous_lifetime(struct kmem_cache *s, void *object)
+{
+	return false;
+}
+#endif
+
 /*
  * slub is about to manipulate internal object metadata.  This memory lies
  * outside the range of the allocated object, so accessing it would normally
diff --git a/mm/slub.c b/mm/slub.c
index 358f42e92207..5e94bd1bed81 100644
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
@@ -1169,6 +1170,18 @@ void print_tracking(struct kmem_cache *s, void *object)
 	}
 }
 
+#if IS_ENABLED(CONFIG_SLUB_KUNIT_TEST)
+bool slab_test_has_previous_lifetime(struct kmem_cache *s, void *object)
+{
+	if (!(s->flags & SLAB_STORE_USER))
+		return false;
+
+	return track_has_record(get_track(s, object, TRACK_PREV_ALLOC)) &&
+	       track_has_record(get_track(s, object, TRACK_PREV_FREE));
+}
+EXPORT_SYMBOL_IF_KUNIT(slab_test_has_previous_lifetime);
+#endif
+
 static void print_slab_info(const struct slab *slab)
 {
 	pr_err("Slab 0x%p objects=%u used=%u fp=0x%p flags=%pGp\n",
-- 
2.43.0

