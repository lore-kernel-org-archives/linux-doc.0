Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436493;
	b=yAsQXAIG5/Cplj0muO/1+QnZDb7tKgprq/ZQhRDhDMom5VIIbql9MJ/8BkMWtBnWYhe/
	 tzRlkvoI69aGXmFLHrwBhsF0qBE/xvcmrdHBOgey8JEx+ryE+LzzTIdos2IqUlXEZ7JTa
	 1S55sZdSF73IxG5YXxmrG0XlZD0bWfwX9wEEIHLiLbXNsGUIwc5elk0jXQlEIn7K0vIPJ
	 xk349wWMDHfJAzSE+yo15Gr2eTl40qi1ElwOAtSXWGtfm6/9E3Kkypaz3sfCUyPPOSzgk
	 cW6NsBtm7L3we4k+4KEqh+biRNsvETjUd1dm0H/xonWsmi6W+OLXq3mf+G299Kkx6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
	b=yLM/PkXG9JbeMOmBBuwBG4ODbfn+hW5OtY0GIl9Yqe0O89+NC63OJFnbmGwTIpAXZOz7
	 FGl7cVG+p45FD7bCjBmrd5kRvFCS5gWGUQPQFvVhCBi66EM1VGoXtXqPzlJvy6KrY4RF8
	 2vtS/vQqfJ0EXhZEgc1++/LYp0C9hrgpAYDmUzvgRyNXpxgDsQQ1pzGOE3j7HZRhW0iAj
	 aGFyQ+ODde2+dmGxVGCPR6GPGov0/eqTA4rj76D1xXJkYJkWJD5dv6qqimOiTBDAWJkQ8
	 HkOddXLnZdw1vtDKoPQ5qjcy4IfUmTp47IsViQawj13BQ4qNhzPY2t3sFerDvT1SJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQq+KE8x;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C9606A338
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 19:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0C9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQq+KE8x
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e985106c0cso16436915ad.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436493; x=1793041293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
        b=BQq+KE8xOXbY/uqMBJRUuuiRWixMIYgasL2Q6oCe08KuYbbGLBcRh24ixnfWFYSdS+
         dCiH4G1K7vTp7FQiasyc/3m9GP5veIG+hi/bMw6XJT9kgi/wSJmKm372tZ0JKJdfCLaH
         7FoNQeI1qbJzVaYfIhpmC+tqgs9LZRyoUr7go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436493; x=1793041293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
        b=la39lemS8V0BVy7qgBlpbb0MptDi12pr7VT8fhHN3MHWkP4MNcPHQNLM91Mp98b8Ku
         yOMd69lpn2DnfvTIfdkoNryc6L2aXvYxXCAgS/bzoekZRovAeEw+gvmbVB/ea+eKsFko
         95C4ZCsHWgivuufNG6gEKQWP50ynQ9D6uRrqxLGD/ncHuFV+TajDRxBE+XNK9nF7IVJI
         M8EM2QtrY3cKwnBz3Iyiin5inX9AHOrTAMgigMDyLVHd1lLCpCcC2A2WOMMLGy9OmZiU
         0rXYfEnMpGw0YSDTSFhtI8PXcHGzFK91xhe3bAMs8GTvp2P+sXNlQrHxTtgCRVHCBC1z
         QOaA==
X-Forwarded-Encrypted: i=1; AKwUvBwvG48030Dc6wiHe5uwl6smQEDst3Bieuy6v0XjqcfZSuRSuDRyWjMkmZUeJNIGX7F2hdWqcBnYKqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg6aKWkO0Qvp7HwCKD0Vb5naQV7wtF6Smxfz4xTIGJK5HAXCn5
	5TVUURMJxiAYlj7eKIywwi7+rNYm4mGedwb4+1hpJqD10slTstcOMEOQid/KdARl/w==
X-Gm-Gg: AYBFou2HR1eSuw1UO8fNsWl4xyXUQbJZsgEJhSZaP7A1z0CaMfJAb1N1M2EFEYO0Ydl
	O+XftGwTENFqg2SX7tzluRhxUz4p96sOaj2rsk753FPyguTlCj7HrsDUEJkJEdu8c+LA+EpLwZY
	VlrUf1DAcIQhd1YTjqDfmSE2kpT1H0Soy4RtrGAMKcU1KFqFy+6LCJTZ77VPKyhI08XI1usdJhH
	b1Mcx4Cxxr40F05nS4cpp++lRJeeCH4a1IKn05OJ7OAEN9/7N6Ohj+QiuVwvyWejiGUA2rXXmwk
	2jJZ5ALm4PLmfOyBRsDlPEArPGWRMaWWZw83W9RFGaG6ddqtA8evtvijVZcZ9etFU4rMvuQxJOR
	DRDvertVNjTmRbx4eJNwEeYulwSjBpIoiAH/gYSdInrPC0wRduNdl8lv0rKB9Q+zc9apsNIgLyS
	MxQjlvaMZPhqUaDa38I60ZSpM1mPDNKpGxi52uSy69nCSpW1e0KyZLkNXuVrLmx/6wCulUyqteD
	f5uiv9/25kMxS/jNrBuBEgrgSpPWzCdSiduFTp0J0DeOqT2QV2q9OkCdRUGTFS6x1mVw6GpXYwe
	Qgl2DQ==
X-Received: by 2002:a17:903:283:b0:2df:90d4:1193 with SMTP id d9443c01a7336-2e9a704f530mr82162035ad.45.1792436491907;
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:14 +0000
Subject: [PATCH v6 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-send-upstream-v6-2-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=Z/2OynYTrncR3whlCD+8cLrRCycyd9G1cnZSFD18TV4=;
 b=lJc8V8Nqjo1jioaiCACjgd6Onu1pi3IF5K3H7O9O0Ysv6de+/D34pDGq9QMvDw8mebB528I80
 2kaE6ZZjzlGBGFbwmdNzil47p34PVsQJh7RrChGNGuNtij++kwe8mZX
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/hid-core.c | 3 +++
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cd..1b9dbb7515ad 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2373,6 +2373,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_SDW:
 		bus = "SOUNDWIRE";
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..45f713fe9982 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -821,6 +821,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)

-- 
2.56.0.212.g129ede20d9-goog

