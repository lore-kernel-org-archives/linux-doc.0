Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED62C1DF987
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239712; cv=none; b=VHkZ/OQZ1UpRhLTNmdXtcv+ojYVJ4D6zqL4VENjkep3oO4SnXL65V2maO9nT43WQoW8n9hKD9AwdA3L0bj2selRviq/uHmU2Qpb5vAXQ7Hozqr1B9yfZWEssrT09lbIE35U+1pzcXXXXOyGeCA/Pn1CuuzbxnqyKUOVdMmhH2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239712; c=relaxed/simple;
	bh=7qCtycerJ0E7BO6irPTIjHbz+5YMM8ZJmtF+i0cqt8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6Yz8srVpE5qztDEO8tGTWSPKHRxtZF20PkghB2OZT1fXVnWkc1BQzACHkr4kNgWfs5VM1AHgeoBH696Aycu5r70bPu/wOtrkqmgXhXffYLyyWAsNIOpMkn36wWt798H797pVlvqmjubsRsRDB7E+mdPP/wTk9mWBr/Yt8I/GaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZR106Kv8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZR106Kv8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385eed29d17so7228088f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 00:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736239708; x=1736844508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mmx4+6G+rkiZk9IxH+TiIsFUVQG9SU6UNwMqQ7on0Oo=;
        b=ZR106Kv8wgxYSKSLM4LdCIFmQ7uwulcqF3r/8DUqXXPhmXYSguZUiWVeiu6LvA6fdT
         5RyqvLrIpqHxA6UlTeVBkdy4sENXjXJ3miKrOWelWbltTCx6gMrxoLqV2IidlUqhdlOu
         jq1ipV+2PJ7L6+hJvYInHw14OaXhsL98bqnS5iGc2T4rzSBLukfLi7ccJofbkM5oCoya
         oXvlEUnoymC1Veqc6gfF5Qe8iBa//jvFID3r8kI6CIk29L0suILQCgE0IFBDObMktjeZ
         9xnnUDRPmbcRtupDQoYvGmM96KjwPk8CceqqxVclc58Mf+Gf+bmW+AghBkMdrsJCJtWv
         42Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239708; x=1736844508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmx4+6G+rkiZk9IxH+TiIsFUVQG9SU6UNwMqQ7on0Oo=;
        b=wG2S/ASdWefXCWoyEdKVavT7B4x9dsIsfrdgNQgpfY8TXdetBNK/9m09Z4pisf+JOV
         JgzXhW4iCwgYMxag3o1cUdGdIVxSN2KwO0JsbVKVRt0esoluJm7WzSrY60+cnoMSDG4H
         2Dj/PZ7J7YQ4VgLUQ/lYRCv6vqABUKEYbLLIz8Tk75zaYiPsNBYosS5p0RTxJUEzP0z0
         lXQ5GOmePg2HAFIHXOOdmpKmxBFUcrkuP54IELYkdi8o3E9VCuDsxLv+qO/uZgDS03ls
         ozf9XIycBQ1H0OkwLmd8SmFNkKVQr9I5FbghwWma4Wenf2AUNhjT3PdZT4rvrNiZjkaT
         mmfg==
X-Forwarded-Encrypted: i=1; AJvYcCVFQkYjzwdUcX5YZLTuU+23Z7AD9uyH3539EYhM947nZZoxoc/khqyO5BKbrTmlDB9TcEFp1NYyw7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL9ZSo80HmfHx18cPW16txDYoXVEeUrZeyAF4sAqqlHuqIkZvK
	GLot8mo0rVW8mGYvWirRyMxX5vL74VxLQkEvXrFSbnC5gtsfKAaD4/ifZ8vLMjs=
X-Gm-Gg: ASbGnctF8JnuDd3vg7kcyA3Lu2t5a3LNzJHg/3bTMT+Bo3O4neoKyNgHQUXook/Tp5S
	7PU+G5kYuzAhjzmS85PX7/L69H0/E8r54Sa752HHwscIed0hdygeugFY8sDrnrdjbtexkE4VA0M
	Q4wd12fvH8JxlGb1+a/d/axk951dq4cwR3N3WKSpJsSpCnlGzGGTN/QZLT/R4KnWjyQ/4IeIiEu
	4pRLhKeXD2+IW6Uqy72FTD/UCXIDPE6jVpRK9X6QLhBVccbuEMaJH8Kxey452+klL/Z2kQKWxyJ
	96LHeS2Is8L86MLStQqhVLqiFfb8A71ZBmKxJxC+bQiHiiiR4Q==
X-Google-Smtp-Source: AGHT+IGyEcwIUTZtYtssZEIQClpbBVEqxd3T1X/W9wsKPy3pGHiYnZmgLn6QRRS86rH3uHjsZwNMLw==
X-Received: by 2002:a5d:64c4:0:b0:386:459e:e138 with SMTP id ffacd0b85a97d-38a223f71c7mr51700868f8f.36.1736239707327;
        Tue, 07 Jan 2025 00:48:27 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828817sm50722280f8f.1.2025.01.07.00.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:48:26 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 07 Jan 2025 09:48:26 +0100
Subject: [PATCH v3 2/5] iio: adc: ad7380: enable regmap cache
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-ad7380-add-alert-support-v3-2-bce10afd656b@baylibre.com>
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
In-Reply-To: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Enable regmap cache, to avoid useless access on spi bus.

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

