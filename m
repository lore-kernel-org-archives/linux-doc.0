Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159241A8F
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638427; cv=none; b=GP51PUq2quPaks8DJya3r+McRYA/Rvghx1T7PAyp78PEcAYo9rU4VKQWNNq0ZjPO72JE639yHW5HjMlhzZbjryFe66rnC7Ul0/gqBwM4idM3wKgDdmoyZaJepJ+YHpCCHxr9y4Tv3XI4NrYzMTR1L1n/IrxG4+d219afrN6G6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638427; c=relaxed/simple;
	bh=TiAVMMX0BhZ88QrzXHt9pRkEcv8jwTCO6wBg4capGYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hi5AdCS6zP0Ee/JGC4kRTLys8FtpY+OCnOVDmL3OFm62aSma9tN9FqKKm7tvQHMEsB0aWrbzor4nRtiDCStZx9Upgpe7hcicwwC8s7Y900LraaHcDNHgfKCw6o2c1KLwp37wN4U73owg6bYLED9bmpmY8IedkKformYpgXHfP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVgebvW5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVgebvW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttJMiiiNX3mRY18NUefNDmQ3WxdD+1OalFtqeM6LpeI=;
	b=GVgebvW5RtJ4FetCAH2QfBLRlck5623YYBAPubyrnN+sSX6Xv6woX9f9jgMuwrFWVZU9n1
	EPNXp0qnrAxzkcwFsIMerrO1vXqW6pK7M9HKfErwQXxqkVE0bwA8dPT0OVWOhjn9oufqkT
	Wy+aaeeFE/kWfIRZo1vkNKYsk1vK3K8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-4ukWa0rBNIuu-azIFMCuyw-1; Tue, 23 Sep 2025 10:40:23 -0400
X-MC-Unique: 4ukWa0rBNIuu-azIFMCuyw-1
X-Mimecast-MFC-AGG-ID: 4ukWa0rBNIuu-azIFMCuyw_1758638422
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-82affc73452so1189400485a.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638422; x=1759243222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttJMiiiNX3mRY18NUefNDmQ3WxdD+1OalFtqeM6LpeI=;
        b=qoX4PD7M0OtJJQToeyPFxOpciChz13p42sIUHDYveWHBUgrOKzav91+tAuZnaWEQ3C
         BLQbArmdYJyjIf3psASzfSU7Wy5gdMM3rQ3XLt4c3lm/Fap20FJB2P+iZIOjy+oqAlG/
         4UXLM6u+ung7t0i5RiZExFtbhfzmP5qMplaNLrq349MUHyr7eTZLZxtBkQWJlkfxpzqv
         BaTo4Rj4mBvYLBRemiwNCJP0Zkir/ODWw18JyPOos6jmao10cKUmyyW3H962w2moQ1aI
         1n3RehtwOTILPIomZNc3d9qW1x37C7mJ9ftizB1HvEwF6JF9cm4y9VV0l4HC1kVxp1No
         +BPw==
X-Forwarded-Encrypted: i=1; AJvYcCU4vtBy8zLA/THL8DQ7mGyOjQZ0z2l5NIl2r4d14OTL3ZRXGFMhETMgysB4LkoXah9VFZTUYVycofM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/kPmdNRhlAVg95ZSMb/Jj8Y14dYAxvDpgaIvB/HNd6+GglaW
	Aynu0t3lUTThr2k7/Ql7gG+b8dvKPmLO70jEMBbNVOHa0Y+uHoo3A/qQjg3Yn3Yq1Xrn4dHDbHq
	xgF4JTW4ExSivN8Q6rUx45D9UpkcQ6XGcqKkeHjbHnyupS76kuoiBbI8nBuwTKg==
X-Gm-Gg: ASbGnct8RB1CriNevGq4ElvPvgm3eAkgh62i79BtNYqGshQgNz7iLKAfUXPDB2i/TNR
	iTS7TVhxCtX+rZFjKtYw+rPoByLmt8o77+POW2uJXaLlnKk+L5Y+WoYL67v4ysRFyHEFENpVSVt
	qxD2qtBu65MieRLDB65Zki0DXzP0b87UwoLfkAheAWK7v2E1rf+CnCX1Hj6wy7OWkPaIJnGKqv5
	6tKxLS2AvDccHwOnaF2Nj2eWUtM9hGYIMsh9ngFUwZYg5MpKh9ytJTmgBsmABl8zrPOlTSobU4+
	pgI08M6e58ZdmFOeVsXEH7NCWMqhhl7RuLvwgsmmGFcSYgYUV/suGE+U5sdvxut55yiD0Wpxccg
	chWoEQIIiaI1m88NkMzWw4B/Y56FI45ALbvJdWLQ=
X-Received: by 2002:a05:620a:3905:b0:84f:fa6f:8dae with SMTP id af79cd13be357-851b786ab49mr314755085a.30.1758638421497;
        Tue, 23 Sep 2025 07:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUK/M1zsnzUN9MP0pcbn4lT/oOtPlFmMyQzwG6v93P6G8aw82V54M2ccRD4QNt3HkJwTzLZQ==
X-Received: by 2002:a05:620a:3905:b0:84f:fa6f:8dae with SMTP id af79cd13be357-851b786ab49mr314751885a.30.1758638421010;
        Tue, 23 Sep 2025 07:40:21 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:30 -0400
Subject: [PATCH RFC v4 11/12] clk: test: introduce negotiate_rates() op for
 clk_dummy and clk_dummy_div
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-11-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=TiAVMMX0BhZ88QrzXHt9pRkEcv8jwTCO6wBg4capGYg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTS4dPWjtbXpB9tlnQwnJMKmrP7TWLkzU2FljPjRP
 +9Psz2531HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE5ugx/M/qvHHrxuJr7Bse
 f3+m9FUgwG/XuecNl06o2Bw5xSv1aUYSI8M7hUCrhjl3p7Dq/F/LJPDL3myq7j8N3oql3yMUBCL
 fzGcBAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is needed for the v2 rate negotiation code where the parent works
with all of it's children to find the best suitable rate.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 32defaf1972c28224108c32aef1e74796aae8bc0..7c4d1a50a7dd0bfb66e021ba314a9a9709813d97 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -29,6 +29,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	unsigned long negotiate_step_size;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -97,10 +98,31 @@ static u8 clk_dummy_single_get_parent(struct clk_hw *hw)
 	return 0;
 }
 
+static bool clk_dummy_negotiate_rates(struct clk_hw *hw,
+				      struct clk_rate_request *req,
+				      bool (*check_rate)(struct clk_core *, unsigned long))
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	if (WARN_ON_ONCE(!ctx->negotiate_step_size))
+		return false;
+
+	for (unsigned long rate = req->min_rate;
+	     rate <= req->max_rate;
+	     rate += ctx->negotiate_step_size) {
+		if (check_rate(req->core, rate))
+			return true;
+	}
+
+	return false;
+}
+
 static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.negotiate_rates = clk_dummy_negotiate_rates,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
@@ -175,10 +197,28 @@ static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+static bool clk_dummy_div_negotiate_rates(struct clk_hw *hw,
+					  struct clk_rate_request *req,
+					  bool (*check_rate)(struct clk_core *, unsigned long))
+{
+	unsigned long rate;
+
+	for (int i = 0; i < BIT(CLK_DUMMY_DIV_WIDTH + 1); i++) {
+		rate = divider_recalc_rate(hw, req->best_parent_rate, i, NULL,
+					   CLK_DIVIDER_ROUND_CLOSEST,
+					   CLK_DUMMY_DIV_WIDTH);
+		if (check_rate(req->core, rate))
+			return true;
+	}
+
+	return false;
+}
+
 static const struct clk_ops clk_dummy_div_ops = {
 	.recalc_rate = clk_dummy_div_recalc_rate,
 	.determine_rate = clk_dummy_div_determine_rate,
 	.set_rate = clk_dummy_div_set_rate,
+	.negotiate_rates = clk_dummy_div_negotiate_rates,
 };
 
 struct clk_dummy_gate {

-- 
2.51.0

