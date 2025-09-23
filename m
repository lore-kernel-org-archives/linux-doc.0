Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81B2E62B7
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638416; cv=none; b=MayfYStOiLc07PzY28F9Z6Qd4uYrrEy6nWZCLsdNV4tqbFacgDF8XX0lSjR9sToLD8wCvl1X7FKjTfEkHxGLTgc3qBmWAzSqaSCP+sYRgYuyfb4AzvccFaMCnEyMveE4GWF74V4MXlMZTkhbA8/aI81drkJB26gobkriWJ6zQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638416; c=relaxed/simple;
	bh=zpyuXvyiYD9eeqhZlOVx8F+Pl/6qjadEKFFcmOgiDiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8iWiFCeaaE+Ci47lXP0osm+bcKEj4Mk7xcQ1rkhpOSBDSwqtDooCiZEhcsxe5f5scNLE2FG7sZ8IpBGnlh7YdbUUaRDEDCS9bcejmnW2bGcRi6E5N9yGPWtbX06JAW0b24P9jD89cKWuQJZ751jtm0O+dgKMNml84ctIEbTRyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/l73Cxq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/l73Cxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYAaIRlhQfgUHW4R/ndesV2wqa5bdYWvu/q6ojx4leM=;
	b=i/l73CxqNh11l+jiTTnHtYSZ2inow2lOLBdUJS/upqB8R71gpjrS7cTDPqik4bTxHgYxg+
	q6pP8e//2ukESVybYS23WV9OoJpE2NAceyl36F2lZsF1x+9bO3F5XKlcyNn8E12LkYFnsG
	2v+msDldiyq11Dt1R+yaI3EDwU5Y3Vg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-f_1QJ-6sPLqPFkjB75m1eQ-1; Tue, 23 Sep 2025 10:40:07 -0400
X-MC-Unique: f_1QJ-6sPLqPFkjB75m1eQ-1
X-Mimecast-MFC-AGG-ID: f_1QJ-6sPLqPFkjB75m1eQ_1758638407
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8178135137fso1356595785a.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638407; x=1759243207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYAaIRlhQfgUHW4R/ndesV2wqa5bdYWvu/q6ojx4leM=;
        b=Z3nWoAyC0hpoJoxVGximLC6Za1EX8VpkNrPjuYf4uKVsVX4HtKf1TyuwRxk32WaThk
         0CS34baRLQAWImEVBYCpgZXBGKb7kPht1I5U0NaI2FPEtHeyFmIn8mrClS87Kj5kKG2h
         M114S6qaUXOkMI91gu/NfAxA6MCB6TUIZbVC5eYuZo+n50uaq7R7JjLy0d+GSoWDJTle
         lOKxUhEtsLXS3C/ADpi60VcCzmBUR1A3baX0jLaxjlo1kdoIiyUIg+YOd3UtbsHW/Sxt
         zo3hRNtIkqaObKvV9XMs4KwZxEO3KlPdDQHawFxnFeSS8U9iSPXSh4JwGd04rcMFnYEE
         ivzw==
X-Forwarded-Encrypted: i=1; AJvYcCUhqTB9Rn/pbALlgE4GaJNbbeIB+ihEgOuQZDfUw9cFAL1RpAn4qhze/gcXOSkkEIuq2bu26DTbvgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVK4mlkdMb52Z7xCgkZWDlCpAJa/XXRbPFb3ROs9T0e89HyHMK
	WG+AM8DbaCPhvkgQjhMlVwvhU5ae/0AUK91qJlOQZgAozVC0YSNYK2YnmRVvNIiyEwYbijhlXbH
	LRUPh1sU5pvunUwMwWWbo4rCWWfuffHQa3bt+5WijDJGmRCTcYZSn7nBMi5rmDQ==
X-Gm-Gg: ASbGnctJDXQrGiuk5kNyjt8KuQXnHlh/QB/ds6BQcDvlIKVGM3UqcA0bF1Mlk5qLg9c
	qCkOCrKCUE2cfXepAMNCy5F8SyiYAjsKuEajkHxvPhgJ3NZOk/jb8CLk6ie+1mZxg9zQ6jqHsTY
	/KbOliHUmVF8pN5FqbrkMVGbdgz0PV7nY4d/hnJWE/t9v2JYnVn722qufJdDocJaadL46NhfQ55
	nKw1u6Ch+c4QiB7P7rzkfcjSRcXrNKaTjZRxT0uphzIPyT/YJMAG28KNoA77iUHBCyNYmhFGLy3
	SxYUX5EH4H91zur2QsbCJkOEA0kqAfgG21Q1bNPHDwDDxwzYTSY6aD4D22TwsjZU5RKbjLCm8iR
	B6sFh0gVXAzAEIC1fs4DPJZL7Z86V4SOaCwgw2P0=
X-Received: by 2002:a05:620a:414b:b0:84d:b0e0:4183 with SMTP id af79cd13be357-8516a919802mr345616685a.23.1758638406875;
        Tue, 23 Sep 2025 07:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdjlcch00PashDlzbuTTmPoVSqMAIOcWAUI4Pr/QX+fLOPi2xGS7zPFlAxGgH4hNbH3DSn5A==
X-Received: by 2002:a05:620a:414b:b0:84d:b0e0:4183 with SMTP id af79cd13be357-8516a919802mr345612485a.23.1758638406285;
        Tue, 23 Sep 2025 07:40:06 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:25 -0400
Subject: [PATCH RFC v4 06/12] clk: test: introduce test suite for sibling
 rate changes on a gate
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-6-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zpyuXvyiYD9eeqhZlOVx8F+Pl/6qjadEKFFcmOgiDiU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdSv7e01MH5uv3z93sjYY2E7mXaeku561bHeSyOgx
 cbYfoZnRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJP8LwP/LOtXvqsaeYte4z
 8niv/6JesMvukd93mbu28XINq8+8q2Zk2HRdPCgi4XXDNIbK+R9d5Rwrstz2bTZw2rxZvKBBaQE
 DLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a test suite that creates a parent with two children: a
divider and a gate. Ensure that changing the rate of one child does
not affect the rate of the gate.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core. This is also implemented as a parameterized kunit test
since additional test variations will be added.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 155 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index e798ee0591b5db6a7728eda20dcab167245a9834..5fb908a8c764f3c3d2c744022bd61e6307c890c2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -831,6 +831,160 @@ static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
 	.test_cases = clk_rate_change_sibling_div_div_cases,
 };
 
+struct clk_test_rate_change_sibling_clk_ctx {
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+static void
+clk_test_rate_change_sibling_clk_ctx_put(struct clk_test_rate_change_sibling_clk_ctx *clk_ctx)
+{
+	clk_put(clk_ctx->parent_clk);
+	clk_put(clk_ctx->child1_clk);
+	clk_put(clk_ctx->child2_clk);
+}
+
+struct clk_rate_change_sibling_div_gate_sibling_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1;
+	struct clk_dummy_gate child2;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_gate_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = 24 * HZ_PER_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw, &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw, &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk), 24 * HZ_PER_MHZ);
+
+	return &ctx->clk_ctx;
+}
+
+struct clk_test_rate_change_sibling_test_case {
+	const char *desc;
+	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
+};
+
+static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_sibling_test_cases[] = {
+	{
+		.desc = "div_gate",
+		.init = clk_rate_change_sibling_div_gate_test_init,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,
+		       clk_test_rate_change_sibling_test_cases, desc);
+
+/*
+ * Test that, for a parent with two children with CLK_SET_RATE_PARENT set and
+ * one requests a rate change that requires a change to the parent rate, the
+ * sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_1(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *) test->param_value;
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+/*
+ * Test that, for a parent with two children with CLK_SET_RATE_PARENT set where
+ * one requests an exclusive rate and the other requests a rate change that
+ * requires a change to the parent rate, the sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_2(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *)(test->param_value);
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ret = clk_rate_exclusive_get(ctx->child2_clk);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	/* child1 is rounded to the closest supported rate */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	clk_rate_exclusive_put(ctx->child2_clk);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+
+static struct kunit_case clk_rate_change_sibling_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_1,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_2,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two children, where the children can
+ * be combinations of a divider, gate, and a mux. Ensure that changing the rate
+ * of one child does affect the rate of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_test_suite = {
+	.name = "clk-rate-change-sibling",
+	.test_cases = clk_rate_change_sibling_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3772,6 +3926,7 @@ kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.51.0

