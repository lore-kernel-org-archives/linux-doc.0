Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EC192D6A
	for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032880; cv=none; b=B2wLU64xiVZCsENOfR2BYkFv8EEa+nvrMPT4TPy2q0J1oiFcVhpHG26uy5bF/FFTX4slg+5y9phPkuTqHaFm0cHgAdRcdhZZI/5QQsu0t2hdzY5HI9DuOQhIovLypkldBhxDBHLRHWvIJ4Cx0cyAr4DuNCyuaksUosKFjtUiVeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032880; c=relaxed/simple;
	bh=VE1/sptLNJO9oRV/s4kfSNaNVaKhi9VwxXf2A7CoZaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYMAQ9/hcI1fRnymANnu9t8IsAqmfjD5yfrmOtX4I4EdY5I3pnGkhfd0huLhs5yHWouACLs+vF1BIOwoxI4x3y+Fhkb0GBluwYyZzfshIk4s9slkiAlody0tzFoZxmtJ0iIKbpIj0eSJOX09F9mt+lWnTt8KDpEbtzMF6DfMVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tiVJgpL8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tiVJgpL8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43622267b2eso52067695e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 01:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735032877; x=1735637677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM6GFa5ErxgDv1duEO96l/YGRIBmSTG/1V9JEZbHJNg=;
        b=tiVJgpL8PBePKmoD8zGPr0UJIMRjAhNnkPq6DXAVzhjZFalqigT4izOb1Hq31ibngI
         /FfR1psrFvXx6TZDWQcge3uhx5rEQxrK9frove+Jpn+7t/NPBrPQi1nl23qKZiYDZh9c
         CVgkfUWclJLO/TFKxXD/59IIET5ru5u32U8aqfbAnW0Pt/20rAk/hRKOSNfBcOJl+oLZ
         7h2LLw7ysPBaRnGf7cnfpB3HZDve0DV6+5ii9TKizoDAyR4+sSyJhV0+1RzyZieLu6dq
         q7SJXn4DlT8HbAF4I5Y6tAeyOCJ6smjJ/DsVSLSodKGZe6/4evHKMI1cTFbIXwKMa3Yq
         zkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032877; x=1735637677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM6GFa5ErxgDv1duEO96l/YGRIBmSTG/1V9JEZbHJNg=;
        b=TM/L4IEmKKE9W4zSdke8IWuqB0jqFjxyrcpQ4CyPrHb1q3ZlJYLTyf3e6fqQToovMA
         Bl7Kszy4H/r9sxYlh1Sthw2gY+eH7L4mF9GpB6AmVGyznmLIqt1R4kN0WH/I66UXeFTL
         ydTI5gnoCEP1Zc+40ww5OM+YPUGbqxTe27/Klkhhbm3EO9RqcGTW9u+ipAyljz86Jz56
         WE/Zm8h2pPnMlEP1TdVK9MGPTz05VVMxDgJ+vUP3UdzqEy5qdXi7JI5WFiueta0RxGk6
         oRbzQBUNsN5v4mXMlJXmPL0X5nPevTPKpuPU8/28PGzfJ63FMPBcJUVoYMws+ol+y7h3
         yWKw==
X-Forwarded-Encrypted: i=1; AJvYcCVolF13+PQnaOt5YOwmVizEDeudA1UMfghQyDUIVEP+jAoTiHvhwoYWPt7h47XWLBgbcGBE1aIY0ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQPjS5foepJbqxisNwxV13oieZKWalN+wC14gnV4QEbbnCjg9Q
	eRZC5JlOT1k+xlm6wco0Z6cPoFr+1C4d1bYjmcOCTLmftZZfJPPSflPTml5XHh8=
X-Gm-Gg: ASbGncsdgFx43wNvQhwI+I4A8aBGsEn6yZcbpPuNrBPTQuJIv0UFpdRa/SGUlWy9ciF
	Wxd3CsRMZjDH0h8k+3Lvh260ggN6Dwou2coVdmJ/NE0aKUsJkX8SAxJHARo1FKTvDqA8DS9vMPp
	V9duqSFUWpwn+7OyoMJ2mwa3wDyu0jHx2cOKRD+iMvaJVhfSamhKAETfvbFyvXw83jXQoU2uTUA
	8X9HyyebKjA2ZC1ZkyiTNCj7ASBqDXoJy1mw/orWSfIkgZNDcLpnxmcbR0GDsh9O+c1x2EfHl84
	QfeXzlZWhXa5pQ5LLRLsPReT5A+MyNOWnPUUjYH1rkhVOmI6YQ==
X-Google-Smtp-Source: AGHT+IGGwBexuuCsSb+2k165A9EG+BSDBn4ld60SJ41FUJ7s7F5ae+cT99SxaOIzBMBk0nh9sB6PGg==
X-Received: by 2002:a05:600c:1388:b0:434:f871:1bbc with SMTP id 5b1f17b1804b1-43668643aaamr168725875e9.10.1735032876784;
        Tue, 24 Dec 2024 01:34:36 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm160932535e9.24.2024.12.24.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:34:36 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 24 Dec 2024 10:34:30 +0100
Subject: [PATCH RFC v2 1/4] iio: adc: ad7380: do not use
 iio_device_claim_direct_scoped anymore
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ad7380-add-alert-support-v2-1-7c89b2bf7cb3@baylibre.com>
References: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
In-Reply-To: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Rollback and remove the scoped version of iio_dvice_claim_direct_mode.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 89 ++++++++++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 36 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 4f32cb22f140442b831dc9a4f275e88e4ab2388e..4e26e0e7ac1d5a1c4c67118dbc34f2921fc171a4 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -675,15 +675,21 @@ static const struct regmap_config ad7380_regmap_config = {
 static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,
 				     u32 writeval, u32 *readval)
 {
-	iio_device_claim_direct_scoped(return  -EBUSY, indio_dev) {
-		struct ad7380_state *st = iio_priv(indio_dev);
+	struct ad7380_state *st = iio_priv(indio_dev);
+	int ret;
 
-		if (readval)
-			return regmap_read(st->regmap, reg, readval);
-		else
-			return regmap_write(st->regmap, reg, writeval);
-	}
-	unreachable();
+	ret = iio_device_claim_direct_mode(indio_dev);
+	if (ret)
+		return ret;
+
+	if (readval)
+		ret = regmap_read(st->regmap, reg, readval);
+	else
+		ret = regmap_write(st->regmap, reg, writeval);
+
+	iio_device_release_direct_mode(indio_dev);
+
+	return ret;
 }
 
 /*
@@ -920,6 +926,7 @@ static int ad7380_read_raw(struct iio_dev *indio_dev,
 {
 	struct ad7380_state *st = iio_priv(indio_dev);
 	const struct iio_scan_type *scan_type;
+	int ret;
 
 	scan_type = iio_get_current_scan_type(indio_dev, chan);
 
@@ -928,11 +935,16 @@ static int ad7380_read_raw(struct iio_dev *indio_dev,
 
 	switch (info) {
 	case IIO_CHAN_INFO_RAW:
-		iio_device_claim_direct_scoped(return -EBUSY, indio_dev) {
-			return ad7380_read_direct(st, chan->scan_index,
-						  scan_type, val);
-		}
-		unreachable();
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret)
+			return ret;
+
+		ret = ad7380_read_direct(st, chan->scan_index,
+					 scan_type, val);
+
+		iio_device_release_direct_mode(indio_dev);
+
+		return ret;
 	case IIO_CHAN_INFO_SCALE:
 		/*
 		 * According to the datasheet, the LSB size is:
@@ -1024,31 +1036,36 @@ static int ad7380_write_raw(struct iio_dev *indio_dev,
 		/* always enable resolution boost when oversampling is enabled */
 		boost = osr > 0 ? 1 : 0;
 
-		iio_device_claim_direct_scoped(return -EBUSY, indio_dev) {
-			ret = regmap_update_bits(st->regmap,
-					AD7380_REG_ADDR_CONFIG1,
-					AD7380_CONFIG1_OSR | AD7380_CONFIG1_RES,
-					FIELD_PREP(AD7380_CONFIG1_OSR, osr) |
-					FIELD_PREP(AD7380_CONFIG1_RES, boost));
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret)
+			return ret;
 
-			if (ret)
-				return ret;
+		ret = regmap_update_bits(st->regmap,
+					 AD7380_REG_ADDR_CONFIG1,
+					 AD7380_CONFIG1_OSR | AD7380_CONFIG1_RES,
+					 FIELD_PREP(AD7380_CONFIG1_OSR, osr) |
+					 FIELD_PREP(AD7380_CONFIG1_RES, boost));
 
-			st->oversampling_ratio = val;
-			st->resolution_boost_enabled = boost;
-
-			/*
-			 * Perform a soft reset. This will flush the oversampling
-			 * block and FIFO but will maintain the content of the
-			 * configurable registers.
-			 */
-			return regmap_update_bits(st->regmap,
-					AD7380_REG_ADDR_CONFIG2,
-					AD7380_CONFIG2_RESET,
-					FIELD_PREP(AD7380_CONFIG2_RESET,
-						   AD7380_CONFIG2_RESET_SOFT));
-		}
-		unreachable();
+		if (ret)
+			goto err;
+
+		st->oversampling_ratio = val;
+		st->resolution_boost_enabled = boost;
+
+		/*
+		 * Perform a soft reset. This will flush the oversampling
+		 * block and FIFO but will maintain the content of the
+		 * configurable registers.
+		 */
+		ret = regmap_update_bits(st->regmap,
+					 AD7380_REG_ADDR_CONFIG2,
+					 AD7380_CONFIG2_RESET,
+					 FIELD_PREP(AD7380_CONFIG2_RESET,
+						    AD7380_CONFIG2_RESET_SOFT));
+err:
+		iio_device_release_direct_mode(indio_dev);
+
+		return ret;
 	default:
 		return -EINVAL;
 	}

-- 
2.47.1

