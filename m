Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net [178.154.239.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90640BCA4;
	Wed,  5 Aug 2026 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923437; cv=none; b=b6EjKlkfVklK0bdYLfjSBxTUDBMiKBpRI0tWO227r1d2PIPitQwziKrZlyH63kroeetaYzSTA/YBPiCSAlm87pMzSm9UJQHg4VBQpDgLUSczxjiHw4jUp1rU3+dNYW8Q+c7Ot0wfZwI8M5JWphIX+ZIAKpuiOhm1RXzFUK05A3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923437; c=relaxed/simple;
	bh=+DPUREpJ7JP1BozhW/O6WxiikVuX22GN1ZGO1VmW5WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOkCf9zXXKW9xp3x1Hb7z/eLPzOr6BlTjyC7D/Ycc7XnAT10gk2j6R3nI3rUGCfaas7bXaOJ06pv5KJgekZ0hXhPThvoHg46FgLePVduf90RSDGEF6W2KBbQIqtzRtiUkpOF52BqStyspfliYw0FUuNu50YYabaMKQw5A2dAFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=fxwougjJ; arc=none smtp.client-ip=178.154.239.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="fxwougjJ"
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:43a8:0:640:574d:0])
	by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id 5BBAE80D59;
	Wed, 05 Aug 2026 12:49:01 +0300 (MSK)
Received: from i101646577.yandex-team.ru (unknown [2a02:6bf:8080:43c::1:39])
	by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA id lmErQB23hCg0-VUeLwzBg;
	Wed, 05 Aug 2026 12:49:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1785923340;
	bh=08PDMaN0bX1KTvGS72tD6r1te965RsIsSrHzkPrJ3Qc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=fxwougjJ+IEAxihuunhEEh4xsivbF8OV4Xi2LD10xS2C1fut94Evc0hEphnEX0D7a
	 iwVRysZPTXJawfOkU8VnpHZdXeoV3M0rmZaK0uquvAz2JrPeIaWsZMk1U3xWwmcoII
	 cz0NzXAgAlF6Zc5nRZQawahmuI4tdczDdZRCL1KI=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Hao Li <hao.li@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [RFC PATCH 3/3] mm/slub: add KUnit coverage for the kvmalloc order limit
Date: Wed,  5 Aug 2026 12:48:43 +0300
Message-ID: <20260805094843.292134-4-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805094843.292134-1-d-tatianin@yandex-team.ru>
References: <20260805094843.292134-1-d-tatianin@yandex-team.ru>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The limit has no observable effect other than which allocator served a
request, so it is easy to break without noticing.  Add a KUnit suite that
checks the behavior directly.

is_vmalloc_addr() is what the tests key on: a request the limit denied must
have come from vmalloc().  The reverse is deliberately not asserted, as
kmalloc() may always fail and fall back on its own, which would make such a
test depend on how fragmented the machine happens to be.

Covered:

 - a request one byte above the limit is served by vmalloc(),
 - a request of exactly the limit is not denied,
 - requests a kmalloc cache can serve are not denied even with the limit at
   the lowest value the sysctl accepts, which is the invariant that lets
   kvmalloc_order_denied() get away with a single order comparison,
 - at the default value nothing is denied,
 - requests above KMALLOC_MAX_SIZE are not accounted to the limit,
 - sub page requests are never diverted.

The suite drives sysctl_kvmalloc_max_contig_order directly instead of going
through the sysctl, so the variable is made visible to the test with
VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT and declared in mm/slab.h.  It
stays static, and unexported, when CONFIG_KUNIT is disabled.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 MAINTAINERS                |   1 +
 lib/Kconfig.debug          |  15 +++
 lib/tests/Makefile         |   1 +
 lib/tests/kvmalloc_kunit.c | 184 +++++++++++++++++++++++++++++++++++++
 mm/slab.h                  |   4 +
 mm/slub.c                  |   4 +-
 6 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 lib/tests/kvmalloc_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 716acfc3d7c1..128dd3508e66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24915,6 +24915,7 @@ F:	Documentation/admin-guide/mm/slab.rst
 F:	Documentation/mm/slab.rst
 F:	include/linux/mempool.h
 F:	include/linux/slab.h
+F:	lib/tests/kvmalloc_kunit.c
 F:	lib/tests/slub_kunit.c
 F:	mm/failslab.c
 F:	mm/mempool.c
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1244dcac2294..3025d5693891 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2998,6 +2998,21 @@ config SLUB_KUNIT_TEST
 
 	  If unsure, say N.
 
+config KVMALLOC_ORDER_LIMIT_KUNIT_TEST
+	tristate "KUnit test for the kvmalloc order limit" if !KUNIT_ALL_TESTS
+	depends on KVMALLOC_ORDER_LIMIT && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the unit test for vm.kvmalloc_max_contig_order.
+	  Tests that requests above the limit are served by vmalloc(), that
+	  requests a kmalloc cache can serve are never diverted, and that the
+	  kvmalloc_forced_vmalloc counter only accounts allocations the limit
+	  actually diverted.
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config RATIONAL_KUNIT_TEST
 	tristate "KUnit test for rational.c" if !KUNIT_ALL_TESTS
 	depends on KUNIT && RATIONAL
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 4ead57602eac..19ecc339b227 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_RANDSTRUCT_KUNIT_TEST) += randstruct_kunit.o
 obj-$(CONFIG_SCANF_KUNIT_TEST) += scanf_kunit.o
 obj-$(CONFIG_SEQ_BUF_KUNIT_TEST) += seq_buf_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
+obj-$(CONFIG_KVMALLOC_ORDER_LIMIT_KUNIT_TEST) += kvmalloc_kunit.o
 obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
 obj-$(CONFIG_TEST_SORT) += test_sort.o
 CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
diff --git a/lib/tests/kvmalloc_kunit.c b/lib/tests/kvmalloc_kunit.c
new file mode 100644
index 000000000000..3c792fddc63e
--- /dev/null
+++ b/lib/tests/kvmalloc_kunit.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the vm.kvmalloc_max_contig_order limit.
+ *
+ * The observable the tests rely on is is_vmalloc_addr(): a request the limit
+ * denied must have been served by vmalloc(), never by kmalloc().  The reverse
+ * direction is deliberately not asserted, as kmalloc() is always free to fail
+ * and fall back to vmalloc() on its own, which would make such a test depend
+ * on how fragmented the machine happens to be.
+ */
+#include <kunit/test.h>
+#include <kunit/visibility.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/vmstat.h>
+#include "../mm/slab.h"
+
+/* The order used whenever a test needs a limit below MAX_PAGE_ORDER. */
+#define TEST_ORDER		PAGE_ALLOC_COSTLY_ORDER
+/* The smallest limit the sysctl accepts, i.e. the order of a full kmalloc cache. */
+#define TEST_ORDER_MIN		(KMALLOC_SHIFT_HIGH - PAGE_SHIFT)
+
+static unsigned int saved_order;
+
+static unsigned long forced_vmalloc_count(struct kunit *test)
+{
+	unsigned long *events, count;
+
+	events = kunit_kcalloc(test, NR_VM_EVENT_ITEMS, sizeof(*events),
+			       GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, events);
+
+	all_vm_events(events);
+	count = events[KVMALLOC_FORCED_VMALLOC];
+
+	kunit_kfree(test, events);
+	return count;
+}
+
+/*
+ * Allocate @size with the limit set to @order and report whether the result
+ * came from vmalloc(), along with how much the counter moved.
+ */
+static bool alloc_at_order(struct kunit *test, size_t size, unsigned int order,
+			   unsigned long *counted)
+{
+	unsigned long before, after;
+	bool vmalloced;
+	void *p;
+
+	sysctl_kvmalloc_max_contig_order = order;
+
+	before = forced_vmalloc_count(test);
+	p = kvmalloc(size, GFP_KERNEL);
+	after = forced_vmalloc_count(test);
+
+	sysctl_kvmalloc_max_contig_order = MAX_PAGE_ORDER;
+
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	vmalloced = is_vmalloc_addr(p);
+	kvfree(p);
+
+	if (counted)
+		*counted = after - before;
+
+	return vmalloced;
+}
+
+/* A request above the limit must not be served by kmalloc(). */
+static void test_over_limit_is_vmalloc(struct kunit *test)
+{
+	size_t size = (PAGE_SIZE << TEST_ORDER) + 1;
+	unsigned long nr;
+
+	KUNIT_EXPECT_TRUE(test, alloc_at_order(test, size, TEST_ORDER, &nr));
+	KUNIT_EXPECT_EQ(test, nr, 1UL);
+}
+
+/* A request of exactly the limit is still allowed to use kmalloc(). */
+static void test_at_limit_is_not_denied(struct kunit *test)
+{
+	size_t size = PAGE_SIZE << TEST_ORDER;
+	unsigned long nr;
+
+	alloc_at_order(test, size, TEST_ORDER, &nr);
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+}
+
+/*
+ * Requests a kmalloc cache can serve are never denied, even with the limit at
+ * the smallest value the sysctl accepts.
+ */
+static void test_cache_sized_never_denied(struct kunit *test)
+{
+	size_t size = KMALLOC_MAX_CACHE_SIZE;
+	unsigned long nr;
+
+	KUNIT_EXPECT_FALSE(test, alloc_at_order(test, size, TEST_ORDER_MIN, &nr));
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+
+	size = PAGE_SIZE;
+	KUNIT_EXPECT_FALSE(test, alloc_at_order(test, size, TEST_ORDER_MIN, &nr));
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+}
+
+/* At the default the limit must be inert, whichever way the allocation goes. */
+static void test_default_does_not_deny(struct kunit *test)
+{
+	size_t size = PAGE_SIZE << TEST_ORDER;
+	unsigned long nr;
+
+	alloc_at_order(test, size, MAX_PAGE_ORDER, &nr);
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+
+	size = KMALLOC_MAX_SIZE;
+	alloc_at_order(test, size, MAX_PAGE_ORDER, &nr);
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+}
+
+/*
+ * kmalloc() cannot serve anything above KMALLOC_MAX_SIZE, so such a request
+ * reaches vmalloc() either way and must not be accounted to the limit.
+ */
+static void test_over_kmalloc_max_not_counted(struct kunit *test)
+{
+	size_t size = KMALLOC_MAX_SIZE + PAGE_SIZE;
+	unsigned long nr;
+
+	KUNIT_EXPECT_TRUE(test, alloc_at_order(test, size, TEST_ORDER, &nr));
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+}
+
+/* Sub-page requests never fall back to vmalloc(), limit or not. */
+static void test_sub_page_untouched(struct kunit *test)
+{
+	unsigned long nr;
+
+	KUNIT_EXPECT_FALSE(test, alloc_at_order(test, 64, TEST_ORDER_MIN, &nr));
+	KUNIT_EXPECT_EQ(test, nr, 0UL);
+}
+
+static int kvmalloc_limit_init(struct kunit *test)
+{
+	/*
+	 * TEST_ORDER has to be a value the sysctl would accept, otherwise the
+	 * tests would be exercising a state userspace cannot reach.
+	 */
+	if (TEST_ORDER < TEST_ORDER_MIN || TEST_ORDER >= MAX_PAGE_ORDER)
+		kunit_skip(test, "TEST_ORDER %d outside the accepted range [%d, %d]",
+			   TEST_ORDER, TEST_ORDER_MIN, MAX_PAGE_ORDER);
+
+	saved_order = sysctl_kvmalloc_max_contig_order;
+	return 0;
+}
+
+static void kvmalloc_limit_exit(struct kunit *test)
+{
+	sysctl_kvmalloc_max_contig_order = saved_order;
+}
+
+static struct kunit_case kvmalloc_limit_cases[] = {
+	KUNIT_CASE(test_over_limit_is_vmalloc),
+	KUNIT_CASE(test_at_limit_is_not_denied),
+	KUNIT_CASE(test_cache_sized_never_denied),
+	KUNIT_CASE(test_default_does_not_deny),
+	KUNIT_CASE(test_over_kmalloc_max_not_counted),
+	KUNIT_CASE(test_sub_page_untouched),
+	{}
+};
+
+static struct kunit_suite kvmalloc_limit_suite = {
+	.name = "kvmalloc_order_limit",
+	.init = kvmalloc_limit_init,
+	.exit = kvmalloc_limit_exit,
+	.test_cases = kvmalloc_limit_cases,
+};
+
+kunit_test_suite(kvmalloc_limit_suite);
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+MODULE_DESCRIPTION("KUnit tests for the kvmalloc order limit");
+MODULE_LICENSE("GPL");
diff --git a/mm/slab.h b/mm/slab.h
index f5e336b6b6b0..157845af6e45 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -782,4 +782,8 @@ static inline bool slub_debug_orig_size(struct kmem_cache *s)
 void skip_orig_size_check(struct kmem_cache *s, const void *object);
 #endif
 
+#if defined(CONFIG_KVMALLOC_ORDER_LIMIT) && IS_ENABLED(CONFIG_KUNIT)
+extern unsigned int sysctl_kvmalloc_max_contig_order;
+#endif
+
 #endif /* MM_SLAB_H */
diff --git a/mm/slub.c b/mm/slub.c
index 7287949ea247..2502bc74f506 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -52,6 +52,7 @@
 #include <linux/debugfs.h>
 #include <linux/sysctl.h>
 #include <linux/vmstat.h>
+#include <kunit/visibility.h>
 #include <trace/events/kmem.h>
 
 #include "internal.h"
@@ -6890,7 +6891,8 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 }
 
 #ifdef CONFIG_KVMALLOC_ORDER_LIMIT
-static unsigned int sysctl_kvmalloc_max_contig_order __read_mostly = MAX_PAGE_ORDER;
+VISIBLE_IF_KUNIT unsigned int sysctl_kvmalloc_max_contig_order __read_mostly = MAX_PAGE_ORDER;
+EXPORT_SYMBOL_IF_KUNIT(sysctl_kvmalloc_max_contig_order);
 
 /*
  * The limit only ever applies to requests too large for a kmalloc cache, so
