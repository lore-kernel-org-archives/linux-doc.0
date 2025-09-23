Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B32E3B0D
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638412; cv=none; b=Q4Otc1Ap/mEFtwX/+cPJRRNBe4uoTCthHmLS+YUTVV17t+e6/xqq4dfL43Pm1xj4oNpmJ7g8v3X9SDdlEEGoNHN05+R6lPTGKXEu/Au+s6VzEjqMucOvr7uB3br1iJAE1u8gigFZfo3jNYWFrZNUcLrcUVHC7PJJGtPsfX87m2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638412; c=relaxed/simple;
	bh=pFcsx99BIvhSJs9EZjHposR2YHdvSFZidHEyknZiq+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjiU+kLFK72D9UIIu/0hG2xWYyqsTCNEzWR1Nb4Zh20m/yi6fN4WdPrsOZSu0UC7t47WvtNvspZrgEHKWCm0qqF12j5NobtKfo2KG2BHy9rDQOVdbXsVzqtZqN8iUByi0gF/dqHlBigUlJWB/mCj2lCHUGxTTRBZFdoKBjHceZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9ujMzrJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9ujMzrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9GRgIWzFYj7dDBWP7AZSAac6SnS5DXh5UVkU8dbhRY=;
	b=Q9ujMzrJ0fD1+e2lUrwkwKUyU8gqKuEYJwtOkrznL5bxdRV9OvajxgP4vevRXVozled/d8
	5Vo5nzQS6YrC/peIxE2IEV+yLaaMqnEWhP7Z4FNylSfPmskMZPDFaZBWvp7vvcC/fYxBdy
	MAxR9eFipoGzb8jpKDIcK4MOAe1CQ8g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-GMbX1NNKOemi5DHfXZ45QQ-1; Tue, 23 Sep 2025 10:40:04 -0400
X-MC-Unique: GMbX1NNKOemi5DHfXZ45QQ-1
X-Mimecast-MFC-AGG-ID: GMbX1NNKOemi5DHfXZ45QQ_1758638404
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-83622c273f1so662506385a.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638404; x=1759243204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9GRgIWzFYj7dDBWP7AZSAac6SnS5DXh5UVkU8dbhRY=;
        b=M+ktiwOiEX6xUcpbD6ZyO326vWeG/qra77tpvGqO9KL/sV0pZrBen54OaI4Zn/9qO/
         FaC6Q7q+hHaHHgmuyCJoc7cP4E8W03w3CqOwK2NaaXxN6BjlqWuVoy7f2ZWumBmqMfwg
         KSw92dWQ60SXve9bdj0Cark0vMc0LuNPrgDu5BeQt5NKXFQjSt/pqrJhOpft5CApt+yu
         N7zJc7ZsGdvgMFWkvCHN3OWm/ru3EktCJwWvBqSqpAjQvEL9sNiJWtefx0HGAojmOx9m
         wEa+vvTDAZbyUW6XpGdNRBmTSO5vI7L/My182lft8GqWEudEq1HomGPZ0K4zr1b1gg6o
         ef0w==
X-Forwarded-Encrypted: i=1; AJvYcCXBYz/DwKOCN7p7cnOgvu9gt2jcUP+3GmmQyA3R13PQRgFpBtcL6/mA/prQYveJdognhU7HYeQtSLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgEjV0OjJNnjbHmbsxd7tAj5cu0HetIKbE9cAEOgmCSY3mlww
	iemheOyP87hjeilbNUN2/saoUb55qLtRBsi9ytLWh+gBj+Z7H2OMPOf+yfw3CcHLJ8FZ6pz4KIA
	7b2mSqChp9+DydJREp2zM2cgArhm6fbqyRRd7o0Kii/x41aNO+dzS12UQmZhc5g==
X-Gm-Gg: ASbGncsONEbUDUEpr2kidA/GFHYNPQb7jpzkPD8Pjoxhd9W3J/QLgoPsm+e7IgSFOhG
	OsrTAPeYroxNTrnf/6mQq2iAFZIr2P7qGlZVDoh35aMkP5wMizr5Q/L3zQwHsXB5JBHahKI9jJ9
	X1zs97qLYKa4qyHDcXY2hkXwD3FB0W92DVdwHhx1fYUD9Cw8XiHoa0YhSxkcdNsdpZgiGWsoggp
	cAAQVyeeydg4/hrHwurlhVC6m+c4Q2C3c/+LSI3ZPHQIWELze+mj65I7AUHFq9i3qfstiFV+vwR
	mOr4AFm0jXxuAY8EMKn8kXDEupw+FLpgTf3S88GmW8Y+VIrIRTDgQBJIUimBpr/oODnyHrfRLi8
	vaJ96w27lX2OM/1pqYjExIhXqZEMzL5gtWOlrmNY=
X-Received: by 2002:a05:620a:2893:b0:849:a372:24dd with SMTP id af79cd13be357-851724be79cmr315043385a.58.1758638404305;
        Tue, 23 Sep 2025 07:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB1IVa4PYBoaIhw9LnlRHxc9bCRkENFx/qDelC+j1q0D87GHSENwmL4JOuTI63o0roDkoNIA==
X-Received: by 2002:a05:620a:2893:b0:849:a372:24dd with SMTP id af79cd13be357-851724be79cmr315038985a.58.1758638403658;
        Tue, 23 Sep 2025 07:40:03 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:24 -0400
Subject: [PATCH RFC v4 05/12] clk: test: introduce clk_dummy_gate for a
 mock gate
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-5-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pFcsx99BIvhSJs9EZjHposR2YHdvSFZidHEyknZiq+Y=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdRX8HNayV7rWPh6F3dtv+xR1zDb26FZK3vvbOiy5
 ouTnGjRUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ0vzIyTIn91u717/Zus7S2
 9FulzUv5fcQYC75fvT1beMV/32UFGYwMT80s0+27gvmuVftwXFXeGnz7dO2XbI8p/hqTtpfO31T
 PAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is used to mock up a gate in the clk kunit tests.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1aca266f9922beb7d81124c07d21b2a3d700dc5c..e798ee0591b5db6a7728eda20dcab167245a9834 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,40 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+struct clk_dummy_gate {
+	struct clk_hw hw;
+	bool enabled;
+};
+
+static int clk_dummy_gate_enable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = true;
+
+	return 0;
+}
+
+static void clk_dummy_gate_disable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = false;
+}
+
+static int clk_dummy_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	return gate->enabled;
+}
+
+static const struct clk_ops clk_dummy_gate_ops = {
+	.enable = clk_dummy_gate_enable,
+	.disable = clk_dummy_gate_disable,
+	.is_enabled = clk_dummy_gate_is_enabled,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.51.0

