Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E842FB09F
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638428; cv=none; b=fTxv0/Ztg554En9UbvOFCYXRqRkW1glbCfO/SsIi9IkAgGqVUVLmehcyvr6N3xcFR5A+ZavdwiTmpoV6jqD2YE5lQ0O2hjtxvZ0PkXTY0SdfHFWGsf3pUdjqIvI1HoIPa3/5EMdTY+hPDV9MXuDGVSA5WHKuZjO+mkled411nOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638428; c=relaxed/simple;
	bh=CBq4gpUSfkFVa42LifJPSpuY6RfDWwyJToNVFFTmN1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okkzxbvujt1XtG8wOe+BXvxF9obyPyKav9wYJLu2utR++Nwmkwa1RNljobcKBm7loQmZVhQdfjt/uHz1MsmMP95jRoaBxBhgzhA3XtfolyzHJ+4bxmCT7lDCkGv051RO4jK0PzpuH4a2zt6VuQtk7+tHmJSbnBDVWtPxTXf0oJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JRda3Mbp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JRda3Mbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/qs4aNKvqEO+6lTRrN0KMMX6ekNLCCx7OU6VhGwFBo=;
	b=JRda3MbpfVR3F3ecgQUGTscaxafJUuLlUKmjIWdYm7N5TJSZrmsZ7svBkvUAFCBZhsysXc
	g+P1YV+WsrZTFQ9nS7QOm3st28zXxUidTHznLW5BeBk6xdtFUSsKwQONN8mWl+X3++j9D1
	dtuj1GfS8f8xiRPha0CbpKRolyCs4Mw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-qG5SRHD_PI6jN6ntObBR3g-1; Tue, 23 Sep 2025 10:40:21 -0400
X-MC-Unique: qG5SRHD_PI6jN6ntObBR3g-1
X-Mimecast-MFC-AGG-ID: qG5SRHD_PI6jN6ntObBR3g_1758638416
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-84ef374c241so300925785a.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638416; x=1759243216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/qs4aNKvqEO+6lTRrN0KMMX6ekNLCCx7OU6VhGwFBo=;
        b=JXztjnwGTbc4RdwC8PBLTMCa7iLRUnf4/ydLmA+p3Tw0GVr6jGim4Y8aKCFsLJxq84
         Jm4pQfEWVk0MsJuel1mm+/UeKmwGjRbUzH/OxjgkoaRM/q65I0Qc1S2+qpsWFPxu5zji
         8s33SnN9HBb+RmjuxxYF1kutVUNcFC4Vwojd+79TjeAF/Pqm3kG/LoD3g1Mgti6JnsJe
         F5/UT8kbeAANcgKxp1ay5XOHdIJk6c7QsE3c8tOOZZI0NBmDTz2t0JIFVyImfSAv6B8d
         rztYhrV1WarApuppNsWcK/DZsqj0o9uvHVjMONUMUWkM6OJjnn4QuGYkmcz+dck8kh44
         Jjmw==
X-Forwarded-Encrypted: i=1; AJvYcCVGzR9n8pJq07XFHlJAWaR3da6e93geKEmsqH1lWxiq2bcmUbJq2YMeXgAk12XZBgqa0tYRMnhVJfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/tjBwuD2/ODlgEiwJQKDqnN/sBuNSkPXUJjCU9QoltxTdTHe
	IlCwPWeG+M3x69XRI4FEmOHuynIDDGpU8bhjXtb6nlaGPClGbCByGovOJXsdViguoMAUfvj3xNU
	7Hi8wINqswzWI7KVrjp9QOMBW7q2gUMLuPbPA6lxvO4cPJFl4napMS5eTKk/tgA==
X-Gm-Gg: ASbGnctUMaW0p8lYeUeFjzGB7+9XZhMqTOpb45AYybmnfw5XZOYSW8cpMgqUEVewBnQ
	d4i00MYv5mg1YJTlC9KoumUmkG8j8sP1gir2XsUvjzm+pNr3TRov18d9M1WEgIlD3RoAN5uooPM
	h2URDMdPDv6IcLD5Iz2gQQ0tLGOKQMoIvwflwpr2pRpW9roF5CWLCIBCf9tmHpIO5W5mGxpMZjh
	MAreSWYDpG0Wpe1ubFVFNWppBBFmDWXGHYGIA87MCbWacjW5R5XxcPVBqZK93KbTwr86hjrJ+yQ
	1Su31dBLJX/j6C6LdrE/2cThV3uWmViUwsi/EUMjeEpvFgwbAshL0EuJK0Gow5PgCNr+gCPWphN
	uYzDQwn42z1m8RcrrcGPdZrFuapEwFhB5eMkdEMw=
X-Received: by 2002:a05:620a:7006:b0:82e:ce61:f840 with SMTP id af79cd13be357-85177762e54mr266600185a.84.1758638415997;
        Tue, 23 Sep 2025 07:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkjrs9K+x4Mp+DvIuL0w/NCd2l+jLO7z2+XRg4C4o1bR3l4p1tNVqZ+0EwMNqqqZJaF/rzkQ==
X-Received: by 2002:a05:620a:7006:b0:82e:ce61:f840 with SMTP id af79cd13be357-85177762e54mr266595085a.84.1758638415376;
        Tue, 23 Sep 2025 07:40:15 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:28 -0400
Subject: [PATCH RFC v4 09/12] clk: test: introduce test variation for
 sibling rate changes on a gate/mux
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-9-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2523; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CBq4gpUSfkFVa42LifJPSpuY6RfDWwyJToNVFFTmN1s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTRQMn2475bDjy/SG6e89L8/e8PjLZ6GU+LsQ+ckb
 NYvnbh0ZkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQAT+ZTFyDBX2/hd7Cu292bb
 SsrF2cw2+h78ud5RIWZP8kZO/Y2/Dgoy/GK6OHVfkeDHO2o2Aqlnrlzlead1ULZYRPhTle2CANu
 PbZwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a test variation that creates a parent with two children: a
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 0344f3f62251728e15af277ea0d143dc1f40fd94..32defaf1972c28224108c32aef1e74796aae8bc0 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -949,6 +949,46 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
 	return &ctx->clk_ctx;
 }
 
+struct clk_rate_change_sibling_gate_mux_sibling_context {
+	struct clk_dummy_gate child1;
+	struct clk_multiple_parent_ctx child2_mux;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_gate_mux_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_gate_mux_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ret = clk_init_multiple_parent_ctx(test, &ctx->child2_mux,
+					   "parent0", 24 * HZ_PER_MHZ,
+					   "parent1", 48 * HZ_PER_MHZ,
+					   "child2", CLK_SET_RATE_NO_REPARENT,
+					   &clk_multiple_parents_mux_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->child2_mux.parents_ctx[0].hw,
+					     &clk_dummy_gate_ops, CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->child2_mux.parents_ctx[0].hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2_mux.hw, NULL);
+
+	return &ctx->clk_ctx;
+}
+
 struct clk_test_rate_change_sibling_test_case {
 	const char *desc;
 	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
@@ -963,6 +1003,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
 		.desc = "div_mux",
 		.init = clk_rate_change_sibling_div_mux_test_init,
 	},
+	{
+		.desc = "gate_mux",
+		.init = clk_rate_change_sibling_gate_mux_test_init,
+	},
 };
 
 KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,

-- 
2.51.0

