Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777651FBC8D
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340588; cv=none; b=hhruix/X/c1MAQg5Eo4Nh+YVSOnf7iuwx0wGrfsmbw4DOmBRV/7J0IbRJKl/zHz32R++jquGmvqTeRsB2vGRz0CA29J2fF2AbPrqudSgfEFuP/iER+sB3DcdC3c+W5R6Lc4TZClbmk3dqRfD9rMtGD4T51Bhki5pdnTj1oi+HAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340588; c=relaxed/simple;
	bh=JiKbZ9Dc0gtggUQQiZa957Mbp+mx1KjmP3cEz6HLKJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXYGxy09PV/IwQpPo6f6YRPvrkatPSJTcgKjx4Pm5/9D0iox8E35lAZIA5Rendjh5I7Mxy7SlCTaT8jjVd7QjZyYTOiIF0FIWC89LSyj0rUlPHLtbGC+SgtESYmzh/RW5L7/wO9G7xsF29GfixiVmZPZn/lMDrZt5vRM1HtK20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V1ji1sbT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V1ji1sbT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e0e224cbso8364016f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736340585; x=1736945385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpTEVIUx2zsR6KrubLLJzhSMtP7WWrv/YPCN+rrmWfE=;
        b=V1ji1sbT7uWp1qrT4j2zGjg6L/9duvaEvyOxzlgOzLcOwi+2Fj0Ydgwt7zFTkbIJ2W
         9FtCY4hNFke058XvGBVABecSG0n9EU/oSSO93JK9ZqqMRNm1sgD2DoVLrGWBnZiEN0go
         Eoi555EqOe8ey5uTmzdNvHI/KxZ0ZFwqp3IdZNoX1go4y/c19+YTsIt65tLK5Fq3DzFj
         dSsdTu96wscA5USTLlZhSOhCjRvC9Hr1MFuWBiTRsp5uETcqduvgw+RV/lb6rclz1KWT
         2F3BFosXZjSs+s5rNzyUqSImLdy0fOYbWZ09JrtBln7+KUvlDC8ZhZsiOO85yV9L/QEh
         eEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340585; x=1736945385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpTEVIUx2zsR6KrubLLJzhSMtP7WWrv/YPCN+rrmWfE=;
        b=hjaTW5r1vpVUAFZvAaEt9ADX1Lc0HkeytIHIcFxJ7grC+vaQO9XJyFjQ41vdYGa87b
         b8ZOnPez85M5Hdcs0s9CILqbE5qt35GnCkU0XFBowKh/aMYjmYZSWoUUyDbTq3cKS+4Z
         idmBH5w488HzYPWTuz173eBb4lnqZKoD2lfJc5LkKF5ErMujWcrhkxgnFieOhSsxAUq6
         OAf02TiPWwaWhDX344wDdDg2KY5sH2rpHIL9quwd9D5BAsNo7q6MVOjbr+/srRPux1f1
         93rbL74OrtFIYzjmA3DQBVTrmBXjfgvJq2vFBb4jFlYfUWUVDZzBsBhecWBto5sN5M27
         X8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdgOe581goKqmwo7GoP3oXJyOwA2K/QlC3iMH+VIRXlbMOHNMa115oZroOLGwadBE1l6KiyozLBjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtQmlSCDaMS817Z3Lw/PrXVs9Rm0RJjpkAaK6J9kht/YPqf2t
	M3LfLfzWRsNX5v+Z8ciahU9Ac8Vud7SRa1PtUaErbZxlPfulv1+ZrE7B0f7o05I=
X-Gm-Gg: ASbGncurpj44b/emI7NPOm0lK8DRreBvASsYo5duzaB5S48r3D21mx/jWKZ2x7KiPpr
	Hp0V4v4T4pfrjdfWtrntQLFU9mOQ3T7M293Cfsv2EZVQ9Ttd+LxAdRLsi2KqO7uxofHOxmKWpJp
	SSk2D4W64KJoT3k43eDKCLICWfz6115OTpaqhCtryczqAgToU4QgSn/W5b/c/VcO4+zt8TsiSEP
	3nTrh/99KxpB9QTbnOeB2ajsyGNRqzfodIjFayB8mL0p2EJlbgkSjfHtSAS5nIkZ3MHM2MQQSVe
	3QirRpJIuYyKSZWNL+g/nUQ00YsD+L6IG9ztLOQxYiuyMPq5fDfDQQ==
X-Google-Smtp-Source: AGHT+IHvoSPBsQF/zm7w0rdXalA6GzUY9WExMWrYVqa4uKyDTat1oJdLA0hTNsE97vT1IdC9ulsKTg==
X-Received: by 2002:a05:6000:186d:b0:38a:20d9:32e6 with SMTP id ffacd0b85a97d-38a87308c4bmr2326100f8f.45.1736340584729;
        Wed, 08 Jan 2025 04:49:44 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da63eesm19846805e9.3.2025.01.08.04.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:49:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 08 Jan 2025 13:49:34 +0100
Subject: [PATCH v4 2/5] iio: adc: ad7380: enable regmap cache
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-ad7380-add-alert-support-v4-2-1751802471ba@baylibre.com>
References: <20250108-ad7380-add-alert-support-v4-0-1751802471ba@baylibre.com>
In-Reply-To: <20250108-ad7380-add-alert-support-v4-0-1751802471ba@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Enable regmap cache, to avoid useless access on spi bus.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index bc7d58850a3e2a84a241d81377e3dc14c43fc101..b97d2978289e92ad502cd6a67de43d2b51cdab56 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -663,6 +663,20 @@ static int ad7380_regmap_reg_read(void *context, unsigned int reg,
 	return 0;
 }
 
+static const struct reg_default ad7380_reg_defaults[] = {
+	{ AD7380_REG_ADDR_ALERT_LOW_TH, 0x800 },
+	{ AD7380_REG_ADDR_ALERT_HIGH_TH, 0x7FF },
+};
+
+static const struct regmap_range ad7380_volatile_reg_ranges[] = {
+	regmap_reg_range(AD7380_REG_ADDR_CONFIG2, AD7380_REG_ADDR_ALERT),
+};
+
+static const struct regmap_access_table ad7380_volatile_regs = {
+	.yes_ranges = ad7380_volatile_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(ad7380_volatile_reg_ranges),
+};
+
 static const struct regmap_config ad7380_regmap_config = {
 	.reg_bits = 3,
 	.val_bits = 12,
@@ -670,6 +684,10 @@ static const struct regmap_config ad7380_regmap_config = {
 	.reg_write = ad7380_regmap_reg_write,
 	.max_register = AD7380_REG_ADDR_ALERT_HIGH_TH,
 	.can_sleep = true,
+	.reg_defaults = ad7380_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(ad7380_reg_defaults),
+	.volatile_table = &ad7380_volatile_regs,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,

-- 
2.47.1

