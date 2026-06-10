Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C83370ADE;
	Wed, 10 Jun 2026 04:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781066170; cv=none; b=BPUFvXR7UsPfExSUwDkE8pcNyF+yMCESH4kgNBsGGjGxRC7TYUMojVGeYRTPp5bGZL6n9IRwUWFWJ9i0+ucj4eRoe/rKgSZouZmMjT3Cujy5cUMxOiHU4/MtgqOj5ktyi0W9xPkWQMxA8CuohLjvdGreNWRjes12U4MzWMjpypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781066170; c=relaxed/simple;
	bh=EQ0kWJg0soLbAjU5hu5xaNnvVzvbJHppGej5Gc7U2sU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YngXfZhrnaPdJRc3g/Ren/hZJCyvZaPjLPSwxXO5wFQBNwdQtL8+ObwORbEdp/5sO1JOJ4lTk/VrY9Yh3VxCdytCfLD04QXCMjm1SccAwI77otYf8FpKnnr7RS6GXLdq2jgSTr93MoVrI09eEWMjRnvCVz/cdwd080PAD/nSHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p0XMTQr6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p0XMTQr6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9A0D471B;
	Tue,  9 Jun 2026 21:36:02 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1FEC3FD88;
	Tue,  9 Jun 2026 21:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781066167; bh=EQ0kWJg0soLbAjU5hu5xaNnvVzvbJHppGej5Gc7U2sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0XMTQr6CwEoVcot48UChEGP9uQKE7daiKe/47nvZuQwoV8U6mrO/xYx2BZr2LdXv
	 BI/Ivkn+7cTvWByYt+ww8TM1i/S107v8sdqUtHwkARvgDfNHf+qZ8mNOFtqm8g8VNJ
	 AdwSsj67tRPGavtpY9I5neVLn1YzLK8K7nllVqok=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC V2 2/3] kunit: printf: Add test for pgtable entries
Date: Wed, 10 Jun 2026 05:35:44 +0100
Message-Id: <20260610043545.3725735-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260610043545.3725735-1-anshuman.khandual@arm.com>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test for new pgtable entry print formats with entry size being 64 bits.

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org

 lib/tests/printf_kunit.c | 57 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index bb70b9cddadd..850bfc0e3409 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -791,6 +791,62 @@ errptr(struct kunit *kunittest)
 #endif
 }
 
+struct pgtable_test {
+	u64 val;
+	const char *name;
+};
+
+static struct pgtable_test pgtable_test_cases[] = {
+	{ .val = 0xc0ffee,		.name = "0x0000000000c0ffee"},
+	{ .val = 0xdeadbeef,		.name = "0x00000000deadbeef"},
+	{ .val = 0xaabbcc,		.name = "0x0000000000aabbcc"},
+	{ .val = 0xcc,			.name = "0x00000000000000cc"},
+	{ .val = 0x1,			.name = "0x0000000000000001"},
+	{ .val = 0x11,			.name = "0x0000000000000011"},
+	{ .val = 0x111,			.name = "0x0000000000000111"},
+	{ .val = 0x10000010001,		.name = "0x0000010000010001"},
+	{ .val = 0xc0ffeec0ffee,	.name = "0x0000c0ffeec0ffee"},
+	{ .val = 0x10000000000,		.name = "0x0000010000000000"},
+	{ .val = 0x11000000000,		.name = "0x0000011000000000"},
+	{ .val = 0x1000000000000001,	.name = "0x1000000000000001"},
+	{ .val = 0x1100000000000010,	.name = "0x1100000000000010"},
+	{ .val = 0x1110000000000100,	.name = "0x1110000000000100"},
+	{ .val = 0xfff000000000ff00,	.name = "0xfff000000000ff00"},
+};
+
+static void
+pgtable_ptr(struct kunit *kunittest)
+{
+	char buf[64];
+	int i;
+
+	if (sizeof(pte_t) != 8)
+		kunit_skip(kunittest, "pte_t size is not 64 bits");
+
+	for (i = 0; i < ARRAY_SIZE(pgtable_test_cases); i++) {
+		pte_t pte = __pte(pgtable_test_cases[i].val);
+		pmd_t pmd = __pmd(pgtable_test_cases[i].val);
+		pud_t pud = __pud(pgtable_test_cases[i].val);
+		p4d_t p4d = __p4d(pgtable_test_cases[i].val);
+		pgd_t pgd = __pgd(pgtable_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%ppte", &pte);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pgtable_test_cases[i].name);
+
+		snprintf(buf, sizeof(buf), "%ppmd", &pmd);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pgtable_test_cases[i].name);
+
+		snprintf(buf, sizeof(buf), "%ppud", &pud);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pgtable_test_cases[i].name);
+
+		snprintf(buf, sizeof(buf), "%pp4d", &p4d);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pgtable_test_cases[i].name);
+
+		snprintf(buf, sizeof(buf), "%ppgd", &pgd);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pgtable_test_cases[i].name);
+	}
+}
+
 static int printf_suite_init(struct kunit_suite *suite)
 {
 	total_tests = 0;
@@ -839,6 +895,7 @@ static struct kunit_case printf_test_cases[] = {
 	KUNIT_CASE(errptr),
 	KUNIT_CASE(fwnode_pointer),
 	KUNIT_CASE(fourcc_pointer),
+	KUNIT_CASE(pgtable_ptr),
 	{}
 };
 
-- 
2.30.2

