Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492A267AF6
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638400; cv=none; b=ZNvhY6qSXt1+/DfFdeMIOH2avEIOMx2X7y/nX+Hqoa6KaseQLHH9HsgqTvweQAkOgBilMG19m1BUNQcwpuPgxddkZ+mhXtYX6vGHcK9Z+Qv1mTBtL4o8GTvmzrHBe2s5K/BdDbwF6CJSE2qWmNTFcNftyn9zKgMoogAB8ACkcVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638400; c=relaxed/simple;
	bh=cfNqvBT+4t4p82Xzh3cs6GlN0grJes6Be3PtGF5MnJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTMbdTOhc8YVBP/qyJsXjF4bQYUfchicEaQmJIvun1BKVSHZVklWQg6OPsPPEPxPTgPoeozBAMFVAgiUWZtS7PDKvIQ8jhnINzruyqJk6cY0Tqw7XlvJu+8ROjWKxvInxp5kLKUUwikEAilL+R3zL3g5tBeExO19DoH+qdh4p3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YSOtBHW1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YSOtBHW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOLL9fGO5xV3TbAIppZMqjfRBpE7K4vhEZj54a7DmcU=;
	b=YSOtBHW1vgC2hYGn+mhh4hMlS4bXoXN983guaiXu6wWITX5Sa+HhSeFXpcUYP/f2E25LVj
	QubJMIICnPfAXsMh1Eg27tbvCvjF6rFsn+MGcnUuKoGva1dDauS5vGcszifzE3xZhSewpR
	NRf+jtn+jSC5budjcGyD2blZ0mHG9HQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-sA3VlKq2NFaVXzFv3Bi1Gw-1; Tue, 23 Sep 2025 10:39:56 -0400
X-MC-Unique: sA3VlKq2NFaVXzFv3Bi1Gw-1
X-Mimecast-MFC-AGG-ID: sA3VlKq2NFaVXzFv3Bi1Gw_1758638396
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-81ea2cb6f13so1096039185a.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 07:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638396; x=1759243196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOLL9fGO5xV3TbAIppZMqjfRBpE7K4vhEZj54a7DmcU=;
        b=tvOy+ModizfjRpb79tJtdiF02bgcq1izpfSJ996jr3J+AoUqUMaiG+kjojut1l69Ep
         GTQDNNbKCst3K3TztE9gLqNrYcH0R2AG1XAvYROq1LSl2q/BsMwS0G2+Dc6EMFjKjkhC
         Y4VwC+cebHPNGXtUJwAJczHU2SD27MjBX4whIsavNfJblU/ICtzmQxJAyDFFM2mYeusM
         dY+yp+LGHy9sTGBzYD9VMiP9tFvOjQUx/boeD1J96Qmp4ihQQhCB+BP6lkPUu6xhgNOp
         UJPyHHu21b6Gp4Y4Veuh3mRK8fQPr2W5z77g1Zufi/r81dZpLPMcMAWIUcPKe63czFL1
         17Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXoXsFQGDvRc0Ov7BuaNh046Y0tS6fKJVB1FTK3N7HSDyQvo3wr/tXuSSVziXG6bBvBzfQ4X+hHvJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6agH5+Znx4JN7AirbbywZ2RCvhRENOd3mxCc25MMza2jBjoX
	yg4tQr1Mh6kEekcs1w5ZtdEYk3lNqcWBrCvPuqGB/39aK5t5/0KHUCtIy6mbzwzvR4scw+s1YZQ
	GjBctCsUnnLKZYhciucbmcqaUUy/BSaAN8sYGRdYisiSJbQlZZDO/bDYH2gBFcA==
X-Gm-Gg: ASbGncugAYeZ69Zoya5U1MNnHu1TgVTiPR+G+TgKLip/bLQKqBC5RVov2uEi81KBtpr
	F/Sorp0/ZvdST1hX3Z9yIDGJ3uZxLko2t+RKE2QChz2YHaPkGvgaG4pXqHu22VLc8Cxtzypx7ft
	CxYzaJU/gwo8FP9ZhBDYX+cAJCdX0HbBVte9CrblroOPuQmyUHSAj75h4NrtZf6VAABT34Sg3Q+
	R/3EeCn/7jSBVFrU58g662mrVUhBlOvu4XGzmDFKq2yZvd2RCqdMzP6KMIZOIrefdyx7EQX/LrH
	Y5nGhYtuwV5dvZE0GKvylrGyIQFCAqOP03CzbVEsFfUo1tidpmKBfnB4rTew4yGcZ+5it8tSAvl
	eGuRWulD8WeXXGysnx0vK0vgG7nK57MMwAefWbCg=
X-Received: by 2002:a05:620a:6cc4:b0:810:731f:32ff with SMTP id af79cd13be357-85173701be0mr359451485a.50.1758638395846;
        Tue, 23 Sep 2025 07:39:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9XR7K20CVO+2Sa3lgEN3xj1f6+KE/9jAZOYv1Eg7JSuBt2rHxjTNSu+IgMsqfCnyBEcwOqw==
X-Received: by 2002:a05:620a:6cc4:b0:810:731f:32ff with SMTP id af79cd13be357-85173701be0mr359445285a.50.1758638395207;
        Tue, 23 Sep 2025 07:39:55 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:21 -0400
Subject: [PATCH RFC v4 02/12] clk: test: convert constants to use
 HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-2-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cfNqvBT+4t4p82Xzh3cs6GlN0grJes6Be3PtGF5MnJM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdRXn7B+t4L05d5y9vOdYadeiyq828T9W+dX28Fkk
 evNvGHyHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzEWJWRYQK76J1DzGbvDqb2
 ls2cnGOVbNyZu2Jze/oyDvEHOh2BHxgZzn1Zf3nDqW0t8s/CZmxey9F4UTdN9J/Sm2Tvno0tf2I
 CmQE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..372dd289a7ba148a0725ea0643342ccda7196216 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -7,6 +7,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 /* Needed for clk_hw_get_clk() */
 #include "clk.h"
@@ -21,9 +22,9 @@
 
 static const struct clk_ops empty_clk_ops = { };
 
-#define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_INIT_RATE		(42 * HZ_PER_MHZ)
+#define DUMMY_CLOCK_RATE_1		(142 * HZ_PER_MHZ)
+#define DUMMY_CLOCK_RATE_2		(242 * HZ_PER_MHZ)
 
 struct clk_dummy_context {
 	struct clk_hw hw;

-- 
2.51.0

