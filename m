Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776B2E54A2
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638415; cv=none; b=kGgTm8JCl3yEzWCckuQ3TOV3Ymx9Pt3GY4EWfyVH15qOokYXvya3QHWur/3OU/VYQ+LG8sTaVHn90y5KMB24wmF82jMWikzSvuF6w7vCf4pbA2/o/KiphbWfMshIRazRiHaDvTh5AAaXowVlRUVcMI50UzdcwZSOTU/kT4E3dng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638415; c=relaxed/simple;
	bh=yAsWE58IkjsKCLEl/DPZcoJASm8AUAsFuoIvwC4HaqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMHc8/8aXl4TTK43Tkby43lC0d/OI5fHN+CyXqtDpmINiboZlRFOGoIWRFKGqJyrN3YluoE5oyLoSvZQTApXrihgJlrj7l2Q+UeY1xewyTWHZOJa3YguUD+SKHhLFCL8FcZAZ0X4FeZCkeb75t64BMu1z0BtTBRPaYl4RRQs4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fojaQM/3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fojaQM/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGMWuqBzhBNfmX/zEHWn5ay04MO78lPZtspT3NW2/jI=;
	b=fojaQM/3RzoxxnXfWFe49C36/FnSNpYucaNTs4f6poyXrFmbQ8QBLRdgSwaddRtX3qIv6K
	AnitUVHgFlUpTUdbWOdI/e59JD+G0dfwbbYU2uNxGtwHPXwwxTPwQU2/E4RLtJm0LztfZ8
	RFAtwry8SbsyOSstn4rFpbd05x+6B1s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-fzSJpjPtM_GbG0SwYUTZxw-1; Tue, 23 Sep 2025 10:40:10 -0400
X-MC-Unique: fzSJpjPtM_GbG0SwYUTZxw-1
X-Mimecast-MFC-AGG-ID: fzSJpjPtM_GbG0SwYUTZxw_1758638410
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8502939d0f6so250958785a.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638410; x=1759243210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGMWuqBzhBNfmX/zEHWn5ay04MO78lPZtspT3NW2/jI=;
        b=j9CkapGyCHWSBppd1ocG0smIMAjpOuSwQWz9m6WZl4jJz3yxHTip5/V8lF5emEapfl
         hnZRQHYDGAGlrC/BtzRSliQbXWfjeBhvAOALlVqINEFrfBevz/CVJ/Z2YBj12yqX6Lxb
         LKOTyj8dpk0/pnUKG06kjWE0pLsldbLL9ErLxuZnZprTI8GA3TttB9BS0sUxHF+DUHD6
         enNqmSGr9PhVDI7XGsjuQHtD0+SNtUgJH11wyDn855e233BnARXpDfTRbE1zEr7SZe5o
         G4hQnMIfAzSSadZv62cMWMTXBHTxooOWB8x6B4ZQtEjFRa/T414jGswck4xdP2/W5+0y
         wrVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxJZXEXh5cSlt/3QhiNU+dZ+rjpkTHShczURTW+RAnz2CQ2xZdnbrSMeeyiPEpyj+EugSRZFgWT7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4yUhk4lJ8AV7hSVLzKBHBUv4v8Ph6Kzr36Z/3RZkauTvBK9LS
	b4hJH+lD24tp4541rJWU5s9JXRJHCbR7/ClDXXIw/ICvMzxdys16j7bS11hf05in+DH15wDlKxI
	NZf8V5PMMkjz1lTZSf7ec5uBXwkT2v4LFr2th2t9dDhHk5oOJuurCAjEIClzzQA==
X-Gm-Gg: ASbGnctnwO6HgQIBx1K2dBNfjutK1C/JlVscXgo/vmEqALQCQsD8vBT2176PUTkqwNx
	UOFZYwq5Ma+KV7OUpkmJlch+xzAVHeIIEL4r5HAKGwxGRAKFAyJ85JiHoc/L1bkGl28URB61hye
	FOLDmTKHeKwUo5/OBtKBRcuXZjYwWjh/trSCydAp05gQr5GgvAvPAq+hEfrchIjRfTbp6yKdU36
	ux3fMlyULvkK+yGvZcTniIrz3kJQO29C8q6pZQJF7YTrDjeQNSlFVtGceJXBi4N4TowSZarp7WK
	YaisSUIzNXTDBRXSw7Jw0u8YV9PrN5HLq74ebEfRVWGkButUBV3iVb5ctuhEPblOnOZKlvbaz0M
	2XtzKzrw0qE/xugXfwjTdoUTaqa/LDUbLYdl9n8s=
X-Received: by 2002:a05:620a:5dd0:b0:854:d17b:27dd with SMTP id af79cd13be357-854d17b2bf4mr77507485a.40.1758638410156;
        Tue, 23 Sep 2025 07:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+fyJ54UA/mPzWWxl9qvSXtQD04gMoGv1VTxXaLInAlQY+mfo1Pg0oNEkRJMY6/YiNVKGOcQ==
X-Received: by 2002:a05:620a:5dd0:b0:854:d17b:27dd with SMTP id af79cd13be357-854d17b2bf4mr77503185a.40.1758638409310;
        Tue, 23 Sep 2025 07:40:09 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:08 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:26 -0400
Subject: [PATCH RFC v4 07/12] clk: test: introduce helper to create a mock
 mux
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-7-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7421; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=yAsWE58IkjsKCLEl/DPZcoJASm8AUAsFuoIvwC4HaqM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTR4saX+p8yLXOFiU15Rs5qbF6/+EnYvczhh1jal1
 LhduH5SRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZcZPhf/XLULP4maF7J2ox
 dUY3lEatcUuyDLxzeoH21KtBveu0Yhn+cH7cyuoremXm4sk6k3ftCeIwu84ksOpqgyPP8s9H91i
 6MgIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a helper to create a mock mux to reduce code duplication.
This also changes it so that the relevant clk_hws are registered with
the kunit framework.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 141 ++++++++++++++++++-------------------------------
 1 file changed, 52 insertions(+), 89 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 5fb908a8c764f3c3d2c744022bd61e6307c890c2..a330de8bd8dc2cdda558d364a3c6d87a26791c8d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -538,45 +538,64 @@ static struct kunit_suite clk_uncached_test_suite = {
 	.test_cases = clk_uncached_test_cases,
 };
 
-static int
-clk_multiple_parents_mux_test_init(struct kunit *test)
-{
-	struct clk_multiple_parent_ctx *ctx;
-	const char *parents[2] = { "parent-0", "parent-1"};
+static int clk_init_multiple_parent_ctx(struct kunit *test,
+					struct clk_multiple_parent_ctx *ctx,
+					const char *parent0_name,
+					unsigned long parent0_rate,
+					const char *parent1_name,
+					unsigned long parent1_rate,
+					const char *mux_name, int mux_flags,
+					const struct clk_ops *mux_ops)
+{
+	const struct clk_hw *parents[2];
 	int ret;
 
-	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-	test->priv = ctx;
-
-	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
+	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT(parent0_name,
 							    &clk_dummy_rate_ops,
 							    0);
-	ctx->parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
+	ctx->parents_ctx[0].rate = parent0_rate;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parents_ctx[0].hw);
 	if (ret)
 		return ret;
 
-	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
+	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT(parent1_name,
 							    &clk_dummy_rate_ops,
 							    0);
-	ctx->parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
+	ctx->parents_ctx[1].rate = parent1_rate;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parents_ctx[1].hw);
 	if (ret)
 		return ret;
 
-	ctx->current_parent = 0;
-	ctx->hw.init = CLK_HW_INIT_PARENTS("test-mux", parents,
-					   &clk_multiple_parents_mux_ops,
-					   CLK_SET_RATE_PARENT);
+	parents[0] = &ctx->parents_ctx[0].hw;
+	parents[1] = &ctx->parents_ctx[1].hw;
+	ctx->hw.init = CLK_HW_INIT_PARENTS_HW(mux_name, parents,
+					      mux_ops, mux_flags);
 	ret = clk_hw_register_kunit(test, NULL, &ctx->hw);
 	if (ret)
 		return ret;
 
+	ctx->current_parent = 0;
+
 	return 0;
 }
 
+static int
+clk_multiple_parents_mux_test_init(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	return clk_init_multiple_parent_ctx(test, ctx,
+					    "parent-0", DUMMY_CLOCK_RATE_1,
+					    "parent-1", DUMMY_CLOCK_RATE_2,
+					    "test-mux", CLK_SET_RATE_PARENT,
+					    &clk_multiple_parents_mux_ops);
+}
+
 /*
  * Test that for a clock with multiple parents, clk_get_parent()
  * actually returns the current one.
@@ -2541,7 +2560,6 @@ static int
 clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
 {
 	struct clk_leaf_mux_ctx *ctx;
-	const char *top_parents[2] = { "parent-0", "parent-1" };
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -2549,27 +2567,11 @@ clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
 		return -ENOMEM;
 	test->priv = ctx;
 
-	ctx->mux_ctx.parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[0].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[1].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.current_parent = 0;
-	ctx->mux_ctx.hw.init = CLK_HW_INIT_PARENTS("test-mux", top_parents,
-						   &clk_multiple_parents_mux_ops,
-						   0);
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.hw);
+	ret = clk_init_multiple_parent_ctx(test, &ctx->mux_ctx,
+					   "parent-0", DUMMY_CLOCK_RATE_1,
+					   "parent-1", DUMMY_CLOCK_RATE_2,
+					   "test-mux", 0,
+					   &clk_multiple_parents_mux_ops);
 	if (ret)
 		return ret;
 
@@ -2757,7 +2759,6 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 static int clk_mux_notifier_test_init(struct kunit *test)
 {
 	struct clk_mux_notifier_ctx *ctx;
-	const char *top_parents[2] = { "parent-0", "parent-1" };
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -2768,27 +2769,11 @@ static int clk_mux_notifier_test_init(struct kunit *test)
 	init_waitqueue_head(&ctx->pre_rate_change.wq);
 	init_waitqueue_head(&ctx->post_rate_change.wq);
 
-	ctx->mux_ctx.parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[0].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[1].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.current_parent = 0;
-	ctx->mux_ctx.hw.init = CLK_HW_INIT_PARENTS("test-mux", top_parents,
-						   &clk_multiple_parents_mux_ops,
-						   0);
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.hw);
+	ret = clk_init_multiple_parent_ctx(test, &ctx->mux_ctx,
+					   "parent-0", DUMMY_CLOCK_RATE_1,
+					   "parent-1", DUMMY_CLOCK_RATE_2,
+					   "test-mux", 0,
+					   &clk_multiple_parents_mux_ops);
 	if (ret)
 		return ret;
 
@@ -2871,39 +2856,17 @@ static int
 clk_mux_no_reparent_test_init(struct kunit *test)
 {
 	struct clk_multiple_parent_ctx *ctx;
-	const char *parents[2] = { "parent-0", "parent-1"};
-	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 	test->priv = ctx;
 
-	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
-							    &clk_dummy_rate_ops,
-							    0);
-	ctx->parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
-	ret = clk_hw_register(NULL, &ctx->parents_ctx[0].hw);
-	if (ret)
-		return ret;
-
-	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
-							    &clk_dummy_rate_ops,
-							    0);
-	ctx->parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
-	ret = clk_hw_register(NULL, &ctx->parents_ctx[1].hw);
-	if (ret)
-		return ret;
-
-	ctx->current_parent = 0;
-	ctx->hw.init = CLK_HW_INIT_PARENTS("test-mux", parents,
-					   &clk_multiple_parents_no_reparent_mux_ops,
-					   0);
-	ret = clk_hw_register(NULL, &ctx->hw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return clk_init_multiple_parent_ctx(test, ctx,
+					    "parent-0", DUMMY_CLOCK_RATE_1,
+					    "parent-1", DUMMY_CLOCK_RATE_2,
+					    "test-mux", 0,
+					    &clk_multiple_parents_no_reparent_mux_ops);
 }
 
 static void

-- 
2.51.0

