Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0F3DB641;
	Fri, 24 Apr 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039296; cv=none; b=mN7aygucZiS6qRpi42YIC7rjy5wzXg7FEM3yJrS3g3xpfUTZqdmuXcpeBvf4avhuvfvs1kqAkOzOHnOS+ik+1i3p7+7/IZxa5XZYyPA9qflJxObyxnO/p1bQ0TCLtvbKMfZsVmO1BFI4KSUP42+V5Qe35pBb45ejHhC6zM5TlSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039296; c=relaxed/simple;
	bh=gwxMHRj8xZWjbOPpjwiAWwZJt+gKEClkO6VJvO7mI2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7BmvlOof36kbkwvvMk1ngjmpYAtai61RwW4sLGXSkelEr91yqD21EqD0kqsn/QqAzzDjnzjaAFOhSL0vqMa5GUywkK/5Wwk8Xr0oCFTHYOCKmq0Z7iD1W6bFiZH31NSlD6ZLS8xEpTbCmtaQfZ1eQvzV68xDsmQMYV3Lw+B46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1SHrCEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1SHrCEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5A0C19425;
	Fri, 24 Apr 2026 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777039296;
	bh=gwxMHRj8xZWjbOPpjwiAWwZJt+gKEClkO6VJvO7mI2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1SHrCEXRbPW4i0FC6+hGykEQzaarjMtbE/zFBFVEziiPwgJTwjYdtV/iQBP7pubm
	 9qbG8iE8eXHWezGjh4Jg8AAKoYThApjtNHa/ex5k3hY3flw0VibgOxpOEW+MuO+gSb
	 ncjbv0WpYcaOFCsvThPJ/64n3RNw/kOKlOtsFIy0I7U8PpJ2Dyan7zZyfPtjarevMW
	 pnHup9+o0D/oSQS4CofK5Zsp0Z6LjoRfswjABP3aqqXWDZfhTrWlNDpuAnaX87wOdS
	 PSAhy5olALkX2a/B6tBaf+HWeuQte5UHAWc/NAwqx1x4eDriYDLxGFC4KqRQ1Rb9Fl
	 feb1a3zyL9CPg==
From: Sasha Levin <sashal@kernel.org>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@nvidia.com>,
	Sanif Veeras <sveeras@nvidia.com>,
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: [RFC 7/7] mm/page_consistency: add KUnit tests for dual-bitmap primitives
Date: Fri, 24 Apr 2026 10:00:56 -0400
Message-ID: <20260424140056.2094777-8-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424140056.2094777-1-sashal@kernel.org>
References: <20260424140056.2094777-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sasha Levin <sashal@nvidia.com>

Add a KUnit test suite that exercises the dual-bitmap algorithm used by
the page consistency checker. The tests verify that the core invariant
is maintained through various operations and that corruption can be
reliably detected.

The test suite covers several scenarios. The initial-state test confirms
that a freshly initialized dual bitmap with zeroed primary and filled
secondary passes validation. The set and clear tests verify that normal
operations maintain the complementary relationship between bitmaps. The
double-set and double-clear tests confirm that attempts to set an
already-set bit or clear an already-clear bit are properly detected and
reported through the return value.

The corruption detection tests are particularly important for validating
the safety guarantees. These tests directly manipulate one bitmap without
updating its complement, simulating what would happen if a memory error
flipped a bit. Both primary and secondary corruption scenarios are
tested, confirming that either type is caught by validation.

The suite also includes boundary condition tests covering the first bit,
last bit, and word boundaries to ensure the bit manipulation logic
handles edge cases correctly.

Based-on-patch-by: Sanif Veeras <sveeras@nvidia.com>
Assisted-by: Claude:claude-opus-4-7 <noreply@anthropic.com>
Signed-off-by: Sasha Levin <sashal@nvidia.com>
---
 mm/Makefile                |   1 +
 mm/page_consistency_test.c | 274 +++++++++++++++++++++++++++++++++++++
 2 files changed, 275 insertions(+)
 create mode 100644 mm/page_consistency_test.c

diff --git a/mm/Makefile b/mm/Makefile
index 2ee360001456..7106aeb79cf5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -129,6 +129,7 @@ obj-$(CONFIG_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_DEBUG_PAGE_CONSISTENCY) += page_consistency.o
+obj-$(CONFIG_DEBUG_PAGE_CONSISTENCY_KUNIT_TEST) += page_consistency_test.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
 obj-$(CONFIG_SECRETMEM) += secretmem.o
 obj-$(CONFIG_CMA_SYSFS) += cma_sysfs.o
diff --git a/mm/page_consistency_test.c b/mm/page_consistency_test.c
new file mode 100644
index 000000000000..6cd587f8146f
--- /dev/null
+++ b/mm/page_consistency_test.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for dual-bitmap primitives
+ *
+ * Tests the dual-bitmap consistency checking algorithm used by the page
+ * consistency checker. These tests verify the core invariant maintenance
+ * and corruption detection logic.
+ */
+
+#include <kunit/test.h>
+#include <linux/dual_bitmap.h>
+
+#define TEST_BITMAP_BITS 256
+
+struct dual_bitmap_test_context {
+	struct dual_bitmap db;
+	unsigned long primary[BITS_TO_LONGS(TEST_BITMAP_BITS)];
+	unsigned long secondary[BITS_TO_LONGS(TEST_BITMAP_BITS)];
+};
+
+static int dual_bitmap_test_init(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->db.bitmap[DUAL_BITMAP_PRIMARY] = ctx->primary;
+	ctx->db.bitmap[DUAL_BITMAP_SECONDARY] = ctx->secondary;
+	ctx->db.nbits = TEST_BITMAP_BITS;
+
+	/* Initialize: primary all zeros, secondary all ones */
+	dual_bitmap_init(&ctx->db);
+
+	test->priv = ctx;
+	return 0;
+}
+
+static void test_initial_state_consistent(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+}
+
+static void test_set_maintains_consistency(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+	bool was_set;
+
+	/* Set bit 42 */
+	was_set = dual_bitmap_set(&ctx->db, 42);
+	KUNIT_EXPECT_FALSE(test, was_set);
+
+	/* Verify consistency */
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+
+	/* Verify individual bit consistency */
+	KUNIT_EXPECT_TRUE(test, dual_bitmap_consistent(&ctx->db, 42));
+}
+
+static void test_clear_maintains_consistency(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+	bool was_set;
+
+	/* First set the bit */
+	dual_bitmap_set(&ctx->db, 100);
+
+	/* Now clear it */
+	was_set = dual_bitmap_clear(&ctx->db, 100);
+	KUNIT_EXPECT_TRUE(test, was_set);
+
+	/* Verify consistency */
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+}
+
+static void test_double_set_detected(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	bool was_set;
+
+	/* Set bit 50 */
+	was_set = dual_bitmap_set(&ctx->db, 50);
+	KUNIT_EXPECT_FALSE(test, was_set);
+
+	/* Try to set it again - should report it was already set */
+	was_set = dual_bitmap_set(&ctx->db, 50);
+	KUNIT_EXPECT_TRUE(test, was_set);
+}
+
+static void test_double_clear_detected(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	bool was_set;
+
+	/* Clear bit 60 which is already clear (never set) */
+	was_set = dual_bitmap_clear(&ctx->db, 60);
+	KUNIT_EXPECT_FALSE(test, was_set);
+}
+
+static void test_corruption_in_primary_detected(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+
+	/* Corrupt the primary bitmap directly */
+	set_bit(75, ctx->primary);
+
+	/* Validation should detect the corruption */
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_GT(test, violations, 0UL);
+
+	/* Individual bit check should also fail */
+	KUNIT_EXPECT_FALSE(test, dual_bitmap_consistent(&ctx->db, 75));
+}
+
+static void test_corruption_in_secondary_detected(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+
+	/* Corrupt the secondary bitmap directly */
+	clear_bit(80, ctx->secondary);
+
+	/* Validation should detect the corruption */
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_GT(test, violations, 0UL);
+
+	/* Individual bit check should also fail */
+	KUNIT_EXPECT_FALSE(test, dual_bitmap_consistent(&ctx->db, 80));
+}
+
+static void test_multiple_operations(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+	unsigned long i;
+
+	/* Set bits 0-63 */
+	for (i = 0; i < 64; i++)
+		dual_bitmap_set(&ctx->db, i);
+
+	/* Clear bits 32-63 */
+	for (i = 32; i < 64; i++)
+		dual_bitmap_clear(&ctx->db, i);
+
+	/* Validate entire bitmap */
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+
+	/* Verify expected state: bits 0-31 set, rest clear */
+	for (i = 0; i < 32; i++)
+		KUNIT_EXPECT_TRUE(test, test_bit(i, ctx->primary));
+	for (i = 32; i < TEST_BITMAP_BITS; i++)
+		KUNIT_EXPECT_FALSE(test, test_bit(i, ctx->primary));
+}
+
+static void test_boundary_bits(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+	unsigned long violations;
+
+	/* Test first bit */
+	dual_bitmap_set(&ctx->db, 0);
+	KUNIT_EXPECT_TRUE(test, dual_bitmap_consistent(&ctx->db, 0));
+
+	/* Test last bit */
+	dual_bitmap_set(&ctx->db, TEST_BITMAP_BITS - 1);
+	KUNIT_EXPECT_TRUE(test, dual_bitmap_consistent(&ctx->db, TEST_BITMAP_BITS - 1));
+
+	/* Test word boundary (last bit of first word / first bit of second word) */
+	dual_bitmap_set(&ctx->db, BITS_PER_LONG - 1);
+	dual_bitmap_set(&ctx->db, BITS_PER_LONG);
+	KUNIT_EXPECT_TRUE(test, dual_bitmap_consistent(&ctx->db, BITS_PER_LONG - 1));
+	KUNIT_EXPECT_TRUE(test, dual_bitmap_consistent(&ctx->db, BITS_PER_LONG));
+
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+}
+
+static void test_dual_bitmap_test_func(struct kunit *test)
+{
+	struct dual_bitmap_test_context *ctx = test->priv;
+
+	/* Initially all bits should be clear (not allocated) */
+	KUNIT_EXPECT_FALSE(test, dual_bitmap_test(&ctx->db, 10));
+
+	/* After setting, bit should be set */
+	dual_bitmap_set(&ctx->db, 10);
+	KUNIT_EXPECT_TRUE(test, dual_bitmap_test(&ctx->db, 10));
+
+	/* After clearing, bit should be clear again */
+	dual_bitmap_clear(&ctx->db, 10);
+	KUNIT_EXPECT_FALSE(test, dual_bitmap_test(&ctx->db, 10));
+}
+
+/* Test with non-word-aligned nbits to exercise partial-word handling */
+#define TEST_UNALIGNED_BITS 100  /* not a multiple of BITS_PER_LONG */
+
+struct dual_bitmap_unaligned_context {
+	struct dual_bitmap db;
+	unsigned long primary[BITS_TO_LONGS(TEST_UNALIGNED_BITS)];
+	unsigned long secondary[BITS_TO_LONGS(TEST_UNALIGNED_BITS)];
+};
+
+static void test_non_aligned_nbits(struct kunit *test)
+{
+	struct dual_bitmap_unaligned_context *ctx;
+	unsigned long violations;
+	unsigned long i;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->db.bitmap[DUAL_BITMAP_PRIMARY] = ctx->primary;
+	ctx->db.bitmap[DUAL_BITMAP_SECONDARY] = ctx->secondary;
+	ctx->db.nbits = TEST_UNALIGNED_BITS;
+
+	dual_bitmap_init(&ctx->db);
+
+	/* Initial state should be consistent */
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+
+	/* Set and clear bits near the non-aligned boundary */
+	for (i = TEST_UNALIGNED_BITS - 5; i < TEST_UNALIGNED_BITS; i++) {
+		dual_bitmap_set(&ctx->db, i);
+		KUNIT_EXPECT_TRUE(test, dual_bitmap_consistent(&ctx->db, i));
+	}
+
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+
+	/* Clear them back */
+	for (i = TEST_UNALIGNED_BITS - 5; i < TEST_UNALIGNED_BITS; i++)
+		dual_bitmap_clear(&ctx->db, i);
+
+	violations = dual_bitmap_validate(&ctx->db);
+	KUNIT_EXPECT_EQ(test, violations, 0UL);
+}
+
+static struct kunit_case dual_bitmap_test_cases[] = {
+	KUNIT_CASE(test_initial_state_consistent),
+	KUNIT_CASE(test_set_maintains_consistency),
+	KUNIT_CASE(test_clear_maintains_consistency),
+	KUNIT_CASE(test_double_set_detected),
+	KUNIT_CASE(test_double_clear_detected),
+	KUNIT_CASE(test_corruption_in_primary_detected),
+	KUNIT_CASE(test_corruption_in_secondary_detected),
+	KUNIT_CASE(test_multiple_operations),
+	KUNIT_CASE(test_boundary_bits),
+	KUNIT_CASE(test_dual_bitmap_test_func),
+	KUNIT_CASE(test_non_aligned_nbits),
+	{},
+};
+
+static struct kunit_suite dual_bitmap_test_suite = {
+	.name = "dual_bitmap",
+	.init = dual_bitmap_test_init,
+	.test_cases = dual_bitmap_test_cases,
+};
+
+kunit_test_suites(&dual_bitmap_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit tests for dual-bitmap consistency primitives");
-- 
2.53.0

