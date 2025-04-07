Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8031217F32
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016010; cv=none; b=IaHG6/Xz8NGN+qL4PMgomJK3btQh6m7co7CymNFh164viHbq0LIvMyG6PqK993i0+aW8Slc9fqRMa5QoJ34EI5Sp3j2GifsQsqG7jkp3vGIMqOR9AeThY6VIGXskPW7sw7hKmHObHAmWbZ08YjEdStvYjrdgZlLfoeJY0yKlab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016010; c=relaxed/simple;
	bh=pCpjDjmBZOzK40k+vljZr2BliJA0xp91AOXjRWTRx0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9J1hmSi4HBjGHm4fb/DrGaelTB7RMsX76iYVqL+zt/f0lRHjh9qqqy9XHGkTlPFXIBDD2R1oL/PlY7oBFuYRYD9i/TTDkXq0Q82cd+6h00uz2YH8cyaT0K6xNrxcvCf0BLFaITOWwFos46OwVLsrpjblde5bGlk9aFOw8TfM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yIFdg0gr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yIFdg0gr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so39009385e9.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 01:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744016006; x=1744620806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOf9H7BQRbk9vcOFRZPDyvrAxaPKr+t8x7+lT2OYigQ=;
        b=yIFdg0grHJGVGw0+gsygFH0k/IVKY8xSqACiOs45DwJXts5N0quuuSVZpk8bS+hI6I
         P+i/odY97IRb7kIkW1FyqcaNgJk4x4v4Ycka+hZxYLElJTKnBaHhD9D8l5hwPpTosR/h
         S/a0iGwyFF7coiDzu8YKpb0qcKf7TnSsstiXdT0yS6bGu91FdzINefnkRIFC0VjkyQ79
         ZWh1PdcaSQ43k7964WsXTud/yyl0FWHDzLiZ5drtD8l+R4+hrYaUV2OEpjC4cxvYFsyP
         Ihc+mW1+DXck3Q3hTtutXkIV/iwuE6+yusS6GvquJHCbJPoVrAh1q3egT6ojvT3E13QK
         jm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016006; x=1744620806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOf9H7BQRbk9vcOFRZPDyvrAxaPKr+t8x7+lT2OYigQ=;
        b=QKyR/GmzQEItO5AF4O1ZGYxVpvM0zNzqOpisMxKAqg2j2Y03wtt+AljwD1jKp1gN7Z
         pLvRBhC3Nb4NsYPlQkCRZ3eSdxKdg8Hv9CMpZaF+RGrVkhN2DWRqLKgvbC/1pm5dJgQZ
         pzNkDKqwQVJ7IjOv7S8VCeCpeBODOhaRIXGgiaoW5gYvf3fkITfznW1M6es6MEJieXsk
         a5llS0ye5jjTk61VSwZkNImvrXMmIvgeoNcMCZCzcl1a5kAlb45Jn4l6HEfV9CK6cj3n
         fMRMSzbq4IgP8HhLCctV90XKd7IgBOS+ehWNGTK9MhMBkeUYtizMay4Iw5k1ThvvmriC
         DzOg==
X-Forwarded-Encrypted: i=1; AJvYcCW7RX9e5Ylj9pBTjZ+FAFeHGcfTG/JcfwJRHHUpN7N+FG4SFPK3wJA+1VNDg5GtpJIFHLU9aeYeU24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhRY3GT2bYyapCRcwlRAZ1NALw9VkpPkDpSnZKm6N5fVPBVOw
	IXxqejhcCoH5kcjVR1XmYbQH9lOM8OW4QgJididrAUxhjefr43kykWcW1q8uGdc=
X-Gm-Gg: ASbGnctEquZh7YFlMfDI3IEY7mluMmOdeF7pQnPcxBvK5eycbo4ijmQ1SQsE9cwh0KG
	vBVaJBg6vaJK9XHpFlm2EYkm7E1yHRzUGC2ZWL7LB/0IRkIOuSodz63SXxlEGHRn772ar9oZ7Ng
	v2io5S9sWrS1D43UzRkRo8efQzZB0KwTQD7EIOKBzri6I3C4bwNb+iHk/YWUVpyqZpwzv6iyffN
	R37aKpO7EITLBBLCASsSjsU43RpP1WI6vAhyKe34h0+xYoBwqK3roVWdCokGzpyY2m2hyt0I4MT
	aQXkMWLgyVsg49akX0XMcShvQhhhl1sG69eC8J+KzDR1aSx+nMG/sEwhfkkkhkmSba+8liQIbx5
	EEHE5zqmbkQcOl+DV82KGuQ==
X-Google-Smtp-Source: AGHT+IEESbUJjv5zNbby1nRneFXpbSe5k56jX92f688Vnu++FT+Kfoz76Ak446pwm5EA80vwmYPa0g==
X-Received: by 2002:a05:600c:1819:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43ed0c6b9famr79797225e9.17.1744016006024;
        Mon, 07 Apr 2025 01:53:26 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm126966995e9.0.2025.04.07.01.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:53:25 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 07 Apr 2025 10:52:03 +0200
Subject: [PATCH v3 1/5] iio: dac: adi-axi-dac: add cntrl chan check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-wip-bl-ad3552r-fixes-v3-1-61874065b60f@baylibre.com>
References: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
In-Reply-To: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=LEhJ7d3UZmGONv0UbtL1XfLYWtYo9rliWEIHzqon6QA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/PMnG9U/8FZZrZ1Y86Vm0d8aLM0XaJgz2gVcWMub12
 bOofmdX7yhlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCRa4sYGdZZ8RndWTNjdst5
 H46K6Dl7Hu/8oCFaJ7hZ4rHxZlsmsUZGhi2PJJKTOWKnC34/tfRBvHBAdSRHTcYGOz7pLYtDVY7
 5sQEA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add validity check on CNTRL_X channels (valid as 0 to 15).

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 892d770aec69c4259de777058801c9ab33c79923..f86acb98b0cffb09bf4d4626f932bf1edc911e2b 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -84,6 +84,7 @@
 #define AXI_DAC_CHAN_CNTRL_7_REG(c)		(0x0418 + (c) * 0x40)
 #define   AXI_DAC_CHAN_CNTRL_7_DATA_SEL		GENMASK(3, 0)
 
+#define AXI_DAC_CHAN_CNTRL_MAX			15
 #define AXI_DAC_RD_ADDR(x)			(BIT(7) | (x))
 
 /* 360 degrees in rad */
@@ -186,6 +187,9 @@ static int __axi_dac_frequency_get(struct axi_dac_state *st, unsigned int chan,
 	u32 reg, raw;
 	int ret;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (!st->dac_clk) {
 		dev_err(st->dev, "Sampling rate is 0...\n");
 		return -EINVAL;
@@ -230,6 +234,9 @@ static int axi_dac_scale_get(struct axi_dac_state *st,
 	int ret, vals[2];
 	u32 reg, raw;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (tone_2)
 		reg = AXI_DAC_CHAN_CNTRL_3_REG(chan->channel);
 	else
@@ -264,6 +271,9 @@ static int axi_dac_phase_get(struct axi_dac_state *st,
 	u32 reg, raw, phase;
 	int ret, vals[2];
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (tone_2)
 		reg = AXI_DAC_CHAN_CNTRL_4_REG(chan->channel);
 	else
@@ -291,6 +301,9 @@ static int __axi_dac_frequency_set(struct axi_dac_state *st, unsigned int chan,
 	u16 raw;
 	int ret;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (!sample_rate || freq > sample_rate / 2) {
 		dev_err(st->dev, "Invalid frequency(%u) dac_clk(%llu)\n",
 			freq, sample_rate);
@@ -342,6 +355,9 @@ static int axi_dac_scale_set(struct axi_dac_state *st,
 	u32 raw = 0, reg;
 	int ret;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	ret = iio_str_to_fixpoint(buf, 100000, &integer, &frac);
 	if (ret)
 		return ret;
@@ -385,6 +401,9 @@ static int axi_dac_phase_set(struct axi_dac_state *st,
 	u32 raw, reg;
 	int ret;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	ret = iio_str_to_fixpoint(buf, 100000, &integer, &frac);
 	if (ret)
 		return ret;
@@ -493,6 +512,9 @@ static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	switch (data) {
 	case IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE:
 		return regmap_update_bits(st->regmap,
@@ -521,6 +543,8 @@ static int axi_dac_set_sample_rate(struct iio_backend *back, unsigned int chan,
 	unsigned int freq;
 	int ret, tone;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
 	if (!sample_rate)
 		return -EINVAL;
 	if (st->reg_config & AXI_DAC_CONFIG_DDS_DISABLE)

-- 
2.49.0

