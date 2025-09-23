Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DABB26B769
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638404; cv=none; b=Mh4Zffl1PLw142X5f+H6YAEkFYefuvKjA/we95UaXkEyhq7vrBggngnkgleOprznEb7/XL+DVgM4TCm9RX/9+Eg7ZbKPrIBhP8GQXyJlthZcDfF4Fpg2nTP2n8jbSTPvXhUtKB8xosLi2MveyYWOO32JekOdVX+kcNM8PBHjcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638404; c=relaxed/simple;
	bh=cKxFZ1V9JkbMvlvajDHPLZ47CwL2tRpgNY6Q+YW/aF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBD6yTGx1qAVXHGfpLzwm4LlFOfAgo542uOqfxd+6YxfyAAj/uDpAqPt91Mzuhj9q9zGz3wIzc4Ip8yDJxS0LdiynawXCg0s2RoQ5x7MrPuWpiSvRU/VbbzeUYho3ec0OLGzrjFK18R38nSxK69EfhBGyeenmqYoR1Ehj5tYdYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E6kihLUQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E6kihLUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbj/S0aRmzh4H+OIrc3SDD0aZUBHX/EMobfhnl53kHo=;
	b=E6kihLUQRUHf+xhS9iUwjuWUMka3b6ChCjJMjeFQDSh7Ttmd1Ra9Mewf0RPJui3HtHvhvf
	dFVp8+uw9vU2Ka5Sr/lan2fXTNS/uk27CG2NUqFHmKNRmxbIifcA0Q7fzVwtmx78Tzfefr
	hjxHasae1dzDwmf2DnfNVpQcfl0rFSo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-qOOmMyyVMS2Vyiuo4UoCvA-1; Tue, 23 Sep 2025 10:40:00 -0400
X-MC-Unique: qOOmMyyVMS2Vyiuo4UoCvA-1
X-Mimecast-MFC-AGG-ID: qOOmMyyVMS2Vyiuo4UoCvA_1758638400
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8502939d0f6so250920785a.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638399; x=1759243199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbj/S0aRmzh4H+OIrc3SDD0aZUBHX/EMobfhnl53kHo=;
        b=w7a3JJUctcCeWj40jw9VvxCve9nKd8buWgfj91IEA6VeMAUpkdGkwKVpppl+2FUKzB
         qWxKWSs6HeTLWDBeUGCulrkCZSOb289R/3D+qkR91p1JUUevENcptTJoeQs9yig7/6QU
         B0/T8bbSOH+gVuP05XD8pw0jaHvoTijlmLG+jln6sFSbI1RVhCYRWTBFsBAZI11t+S+v
         OtL72vg5aNWZuxFqPylCkJmcAHwkPXBWBxMS1hYkHpfnqKePcAICRop3P2dZjVdmAN9U
         oAVvi3zXLDi6N3Pg7AHy/tdtGMKTTTmHjgBKCH0aLyYAvgkE5EHULpvA7ickyl1cNPjm
         HJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtC5ufpY2He8nYZbjPtBgSRQX6dXvWgUxpGFx+26YRw5m/saoXnPovUQueFEyNaaamSz/aAreyP9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIf5/ZU5OPV2prdbU+HzvAtncm453YTXVE4ahjFctFD/Ppcd/X
	tLDDX2kw0N3lBqBI3L7bjE27CffMQu716AsMK//zJeYtMJiq/Tn0waknF8Pq+liB+FNv7xVTEUN
	3sycvCF4STgT8oY3H2DDZaZh/3bsI/LlEJgzfLvSSCMOYtYHXOwnaQrYf0BLCg4/ofyX/EA==
X-Gm-Gg: ASbGncvVYaj29vkbcoBgK++DPNHvIIg4bieGrzGo8U/U0jNpTheJDYnGBajMsfD/3NY
	PNh3LTZQrUF4hMhFxhiVnnTz4jlWDyn5YCn7Qhzb09q3FHxmsjoWiWnVCeI1GX9FY4yzvS4XqEp
	fRp2GKwIvjLRKIm2npjyw7fuZgIXGAhH7T3NbbsHiII4nKfjZnc4b/VpY72ewLpsNU+IUGI0xO9
	VQeLOYvFw8LI6wd+My7rncN/5+sbZV1UqH4yh5J5LDBsehoCUMUtaKGTihzmq9ShUDM56zUwL1s
	4W/NsrBx6fzQBMi9BuiqhckTgaeeKmFtvhFtIHwcF3Xhb3RWRbn2G6vmzJ/SEC1cHOWJKQ3sgQn
	bVbG5LERtoxGdiaIkwM801Y4yopKKICYbtvqM5pE=
X-Received: by 2002:a05:620a:29c4:b0:82b:7a80:e48a with SMTP id af79cd13be357-851b634daedmr251399785a.24.1758638398627;
        Tue, 23 Sep 2025 07:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkgaHgsa3dAnSghMgykCefgHSWKnQmgpmqmcnFrZsNTEAFjdJhOXkXgMBQKiKbRdGNJDtlSQ==
X-Received: by 2002:a05:620a:29c4:b0:82b:7a80:e48a with SMTP id af79cd13be357-851b634daedmr251395985a.24.1758638398130;
        Tue, 23 Sep 2025 07:39:58 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:22 -0400
Subject: [PATCH RFC v4 03/12] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-3-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cKxFZ1V9JkbMvlvajDHPLZ47CwL2tRpgNY6Q+YW/aF8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdSfu+BVmmykusC/m7o5639rzjv8RT2I0TLZPu7aB
 4tcE7PlHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykg4Xhv09Y6ua9e74b7dv9
 spTVMuTANluXe6ZNC2ZOmupvWntPUp2R4U3vYoHW2Suv6lqpGSfOFSr/qKqyqftUWfvSEiY/qZT
 lXAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 372dd289a7ba148a0725ea0643342ccda7196216..e1f72fcede1df1d486744b171728231ec8fa8836 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -137,6 +137,50 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+// 4 ought to be enough for anybody
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static int clk_dummy_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DUMMY_DIV_FLAGS);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.51.0

