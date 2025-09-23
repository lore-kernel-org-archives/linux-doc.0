Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B7F25F994
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638448; cv=none; b=nQ4PtoOMvz9TKqsgPPHcT7seAxqmyu8dpColTBP65fGs3r5FoMi3qrSsOyUx+q4rPBv3mcgb2AVHGk5tS5soGn+zHNhdfOjWi5LfgYKqwj7CdsR9FoeekJ9zuQc6Y98ZWMsHZr5ZV913D5hE5hy4/Qb/NY3Gcf+Kl/roJc1p74c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638448; c=relaxed/simple;
	bh=D3UgrSosq/MOSn8K9Aaz+rOUHHRaOZ0z2hzHPegpLO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1nTA4cVkW4QhTYn3vSYOI64IqhQga+cRWO8757OjwyYmDlpbQFpQcgC8KxjWZQOIduysLjEgkiNHZ4x+mo8kbtnvwAmBglCeiWUo1CmdhYy69cVfiOsf0EBQxPq6K7gAKFRpvxWgIjO4TrT/b0urLJ+FewPVeYjwgzMDH+i184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GagzWDa4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GagzWDa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+erhI99JOuUzOc3CsexcHwDM2IOmUBQdfJnBT87dGw=;
	b=GagzWDa4/hVCM7LsDCdg+EjKuxbtMYSWSXj2ZxDCHquTAhuh0j6ug7TsY9uMhEbfhMVKcC
	f6Zf/oVTEsic3yCkqt9ksnKIK0EqU5nV2SavtocNXNX24eUVdU0HcaYiI3xdXVnj5nsyrK
	peGq64JWtuxpY1H3sOCFfToYdL/cZOM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-1Si9il8dPxudMkcEMH2XrA-1; Tue, 23 Sep 2025 10:40:25 -0400
X-MC-Unique: 1Si9il8dPxudMkcEMH2XrA-1
X-Mimecast-MFC-AGG-ID: 1Si9il8dPxudMkcEMH2XrA_1758638425
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-81312a26ea3so1320117685a.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638425; x=1759243225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+erhI99JOuUzOc3CsexcHwDM2IOmUBQdfJnBT87dGw=;
        b=cd+H+QhQwdr8I7aIX4g26dpxEK2QevyVCMLrMQF/E1pj0sxJMzb2wMZ+az2p3QRIJn
         Fd060EZfYQwNWc3j8Y3Ehq6m/GQV82jkAftmf+S2b+ves2ADu0YEjUGx5mGddRZ9v+Kb
         YWpUuYya1Igt2cBDerw8pzbfkrdm4ZlaRSSjXjPuRWqZxyle3dZZHqjL15ttn8BaLZjK
         o7aOspT9JJBME6FiErESMzZ14Dcljd1syhsLVGDV08SFN4rNgLy/In2MQY8uwdEIrblS
         LuuWVLloH49KLAF3kNoWg1oveCTi+ZP1+goacFZCd4X9VDmgcKDkgy5rgEo39UCVDZdA
         qOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUds8/+pvwq5XFKmuCYsABeF8wMqOO0Pi4QTMklmUcNqMqx5n5UKbLSKof4jQnYTrfE2Lp5lazNUg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YylDtRkjG//O4dY2OYTdHug6cqjgvpy3gmyT/SHO/PN2RfnpqL3
	E0AmZ8Eqb3sHHNrB8ELuMi26qUp0tgA3azkSCZOgTeaLW9OBdTjK9W1I5+HW8SgKGlbxklS6UOH
	EWCdHKcNzHn6O3lR0qecBzUoJgFmGpSv7HME9wN+RNdSSnm4x+ZgWWd2Fc1uXxw==
X-Gm-Gg: ASbGncuNOoT1tSty5tJNxhpyLZi2mBelqZhWYBlaEE0snQCCbvEauIk9RbWcIbP9PZb
	zQX/nPIWqKB3+Z+SH/Ho74+y6rOzaaVnTKoILe1G/E6pTrdWcWSNQWX7y+gESZ9OC3KtfrxEYn0
	Lo9Y8dF3Pa04VEkITdnaOKO2TJ8b+MhwFtlSWvv9R92A/uA7zoq6x7ZrRbfFV4KISvXe5s9PCkc
	gNM4lq7oOXU1jPp1FHKX+LrOaWtzqwYYHcGC8Hn/d1l0NPv0Zm1szx25h777+79bdHPx848Fcd1
	p8M6iZOVb8VQ6lTTfUlHwm6QRn9QB8KRnlcXFAnyeQqnQLlKooaiLs57L4aZbW0gfBQtDVX1J+k
	TyztZ4tGk2FDF2g5EcJdptg2iZjaG5VLAunfoYb4=
X-Received: by 2002:a05:620a:d8a:b0:812:c6e3:6663 with SMTP id af79cd13be357-8516ba5c35emr303166085a.34.1758638424947;
        Tue, 23 Sep 2025 07:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7D73wHsfmP93/Sd0Q4FqlIqORkx+fAcKsqHGCJ9Fpb8lMOLSJtCsdrIjyP8S4cVr0zCMXug==
X-Received: by 2002:a05:620a:d8a:b0:812:c6e3:6663 with SMTP id af79cd13be357-8516ba5c35emr303161285a.34.1758638424314;
        Tue, 23 Sep 2025 07:40:24 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:31 -0400
Subject: [PATCH RFC v4 12/12] clk: test: update divider kunit tests for v1
 and v2 rate negotiation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-12-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6302; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=D3UgrSosq/MOSn8K9Aaz+rOUHHRaOZ0z2hzHPegpLO8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTRcsnyrxlvJRTGXHzxVa+Dbvcaj9kidJs+JwOKF6
 1/P33TxXkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATSTZm+O8bY5OYtenwxQfR
 EVErn77OOchw21lN/b5hqIljzKEw7hiGvzLlRe1WapwMGucS/LR6hc7F9K5R9e+csvHi7b7F4Te
 NWAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Update the divider kunit tests to verify that the v1 and v2 rate
negotiation logic is working as expected.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 77 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7c4d1a50a7dd0bfb66e021ba314a9a9709813d97..87af60d0782274c9faacf7729ed95bf04dfd4860 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -763,6 +763,7 @@ static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 	test->priv = ctx;
 
 	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.negotiate_step_size = 1 * HZ_PER_MHZ;
 	ctx->parent.rate = 24 * HZ_PER_MHZ;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
 	if (ret)
@@ -793,6 +794,20 @@ static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 	return 0;
 }
 
+static int clk_rate_change_sibling_div_div_v1_test_init(struct kunit *test)
+{
+	clk_enable_v1_rate_negotiation();
+
+	return clk_rate_change_sibling_div_div_test_init(test);
+}
+
+static int clk_rate_change_sibling_div_div_v2_test_init(struct kunit *test)
+{
+	clk_enable_v2_rate_negotiation();
+
+	return clk_rate_change_sibling_div_div_test_init(test);
+}
+
 static void clk_rate_change_sibling_div_div_test_exit(struct kunit *test)
 {
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
@@ -833,16 +848,21 @@ static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+
+	if (clk_use_v2_rate_negotiation(ctx->child1_clk)) {
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+	} else {
+		// Legacy behavior in v1 logic where sibling clks are expectedly changed.
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	}
 }
 
 /*
@@ -856,19 +876,26 @@ static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = clk_set_rate(ctx->child2_clk, 48 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+	if (clk_use_v2_rate_negotiation(ctx->child1_clk)) {
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+	} else {
+		// Legacy behavior in v1 logic where sibling clks are expectedly changed.
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	}
 }
 
 static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
@@ -879,13 +906,25 @@ static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 };
 
 /*
- * Test suite that creates a parent with two divider-only children, and
- * ensures that changing the rate of one child does not affect the rate
- * of the other child.
+ * Test suite with v1 rate negotiation logic that creates a parent with two
+ * divider-only children, and ensures that changing the rate of one child
+ * does not affect the rate of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_div_div_v1_test_suite = {
+	.name = "clk-rate-change-sibling-div-div-v1",
+	.init = clk_rate_change_sibling_div_div_v1_test_init,
+	.exit = clk_rate_change_sibling_div_div_test_exit,
+	.test_cases = clk_rate_change_sibling_div_div_cases,
+};
+
+/*
+ * Test suite with v2 rate negotiation logic that creates a parent with two
+ * divider-only children, and ensures that changing the rate of one child
+ * does not affect the rate of the other child.
  */
-static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
-	.name = "clk-rate-change-sibling-div-div",
-	.init = clk_rate_change_sibling_div_div_test_init,
+static struct kunit_suite clk_rate_change_sibling_div_div_v2_test_suite = {
+	.name = "clk-rate-change-sibling-div-div-v2",
+	.init = clk_rate_change_sibling_div_div_v2_test_init,
 	.exit = clk_rate_change_sibling_div_div_test_exit,
 	.test_cases = clk_rate_change_sibling_div_div_cases,
 };
@@ -4017,7 +4056,8 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
-	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_div_div_v1_test_suite,
+	&clk_rate_change_sibling_div_div_v2_test_suite,
 	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
@@ -4033,4 +4073,5 @@ kunit_test_suites(
 	&clk_uncached_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_LICENSE("GPL v2");

-- 
2.51.0

