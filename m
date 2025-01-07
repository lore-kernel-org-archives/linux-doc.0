Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F91DFE1B
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239712; cv=none; b=p3KPYwGd8a13VFruzKQPArihs8PWJkkYUEq4AWFzqX6W4/AchCbNeaqjS1I09qUs8w+AVzmM4tmcn0u3Sm/Yh0BPqjjcrWhGs7904Ok3lSzXvJO6CifgxHq6de4tcKDxrbejvgp8m9bk82DkBWaf7CYQNg4K0tVW1Xo/zFjjB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239712; c=relaxed/simple;
	bh=eSSplP/3FY91YR2XwZTXJZ2Ax/rrzWeyNFYg2OhghvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNgHhyGkJX+O4lQUOLSHiXYqbSTnAxvhKCPQqQv+QBw85g4Gtki6PKLyl/kEY+01RZloNLHBdP06ExemwPG6nncArPF9hc3C7+SZOro1hTlqhqvroiDxEQvprd5SXfgo38/cYW/AJvNQ7UW6N3EImEOzA0VGRVpjMinUtWdsofo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QmbOoHym; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QmbOoHym"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43635796b48so91869015e9.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 00:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736239706; x=1736844506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZ+/3KnECndMbh/2k2JKBTk8y/NjC4Kknkr3b9iFCA8=;
        b=QmbOoHymiXR3HSPWS4+gtQR+EwmtBPja7KgOHX6jD3cKInHr78dlnaAXdAYrnQys35
         m3KLBez06RVWIiuDMFc5JzUhdBia+Ql2MEECtqOd5PdAuPEC8050yHjKV84CqxWkVIWs
         wDPW5LskeTD+mB1QxjHWucJbTtj1eK882mV0PaQBHPt3zbl3dCgdzMU5DLX1CW/nYKoH
         qnmK0Yzg3I8WYtDCEClssUqzqbTIvN8hncqrJCKJ/Vr8+85xLiyF/PWVp1Heo6GjANgu
         rKFXOqxEk68zPgC1OGm40+ltp23QZWeijHa6UJ5wlmEwmE2PAr+iV2iSSFY2xegEMBLL
         /VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239706; x=1736844506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ+/3KnECndMbh/2k2JKBTk8y/NjC4Kknkr3b9iFCA8=;
        b=YCor0XMcZBB09PKU5zMDvne5p4MhZKmogmiSynQfghPkpegFOnOF4J0Nw1p133/TlF
         OTr3JbYMLcE7GO7w0L3j5nJT9d8iaq2AlrG8zF/I5sNjqa4iaKHTvDG0/X3wMYyNbS+a
         GXUbJNbBTrAL2ttxL6BqYGRGjsLz7REjP5ceg94At8B+l/fFqg6bp6D++RO7nKkkvy52
         1b9mvJaXMeUYQwe8TQbTx1r4g/QTkmY3FuM8dchZDNyKMH1wi51gPREKgYJPIZmKU1QI
         mFDhA4cESgN4+uUJrpWDr+Z1ApiADgE9hKJO3s666HxF22gE5PWm4dXVi+MmJ8D5rfup
         6vlg==
X-Forwarded-Encrypted: i=1; AJvYcCVvcxAXzrggU12o40TxVhh7ELW79+sepuq9DDahyS5C8dPIh3lwm9oUkawcWNm5OMjLJgRB+iSrn44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfj9j8DwP40KPgrrKGNvuQ2EiYg74/qa2l0N8B2TzmNYdtXdxb
	Te5F87OKrlyg5gbACckSQqz5ET+JoXyrt/fg5Zz3uKBJbhGto3z5PEeDZ1T2eCs=
X-Gm-Gg: ASbGncs8IetP1qwnUOwuZT3jNgcB32Zo8kKDvEWjYuCaDY/D/YOVZ+rtyRqFOYew0P9
	XtvRjgN7mldqeCy+K0hjUjtT1cONRQtbBKsHHfPKRWqVidqZWjIJQ3iXA/2Fyuxycrqu+bPlY+B
	waiYS7U6FyR98GwWdQui4tQ23/wcFyOhURcTHLdv4N5BuzvSv+CKPc++fCDGC/780+1sWNPbMpJ
	n8ZCwF51wp9EgXY84/OjtwBJxVYI8wepyg5x2iza41RNMaAs+o6r8ATwzm2aHMF6K38lXSsu0j5
	PJaHxWfjxpFsWdxGrI2sYfnVIPru6YaqTsSun9ij4ucgUr0b1Q==
X-Google-Smtp-Source: AGHT+IGQ4V3dSc3vK+Zyhlr0chhocUMOJ1bGwH2LL7mekY4ZcsViuFPyGalpXb4K+Ellw6y7xZP6gw==
X-Received: by 2002:a05:600c:1d12:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-436dc20b0c1mr16203915e9.11.1736239706555;
        Tue, 07 Jan 2025 00:48:26 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828817sm50722280f8f.1.2025.01.07.00.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:48:26 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 07 Jan 2025 09:48:25 +0100
Subject: [PATCH v3 1/5] iio: adc: ad7380: do not use
 iio_device_claim_direct_scoped anymore
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-ad7380-add-alert-support-v3-1-bce10afd656b@baylibre.com>
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

Conditionnal scoped handlers are turning out to be a real pain:
readability issues, compiler and linker handling issues among others so
rollback and remove the scoped version of iio_dvice_claim_direct_mode.

To impove code readability factorize code to set oversampling ratio.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 110 +++++++++++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 43 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 4f32cb22f140442b831dc9a4f275e88e4ab2388e..bc7d58850a3e2a84a241d81377e3dc14c43fc101 100644
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
@@ -1008,47 +1020,59 @@ static int ad7380_osr_to_regval(int ratio)
 	return -EINVAL;
 }
 
+static int ad7380_set_oversampling_ratio(struct ad7380_state *st, int val)
+{
+	int ret, osr, boost;
+
+	osr = ad7380_osr_to_regval(val);
+	if (osr < 0)
+		return osr;
+
+	/* always enable resolution boost when oversampling is enabled */
+	boost = osr > 0 ? 1 : 0;
+
+	ret = regmap_update_bits(st->regmap,
+				 AD7380_REG_ADDR_CONFIG1,
+				 AD7380_CONFIG1_OSR | AD7380_CONFIG1_RES,
+				 FIELD_PREP(AD7380_CONFIG1_OSR, osr) |
+				 FIELD_PREP(AD7380_CONFIG1_RES, boost));
+
+	if (ret)
+		return ret;
+
+	st->oversampling_ratio = val;
+	st->resolution_boost_enabled = boost;
+
+	/*
+	 * Perform a soft reset. This will flush the oversampling
+	 * block and FIFO but will maintain the content of the
+	 * configurable registers.
+	 */
+	ret = regmap_update_bits(st->regmap,
+				 AD7380_REG_ADDR_CONFIG2,
+				 AD7380_CONFIG2_RESET,
+				 FIELD_PREP(AD7380_CONFIG2_RESET,
+					    AD7380_CONFIG2_RESET_SOFT));
+	return ret;
+}
 static int ad7380_write_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan, int val,
 			    int val2, long mask)
 {
 	struct ad7380_state *st = iio_priv(indio_dev);
-	int ret, osr, boost;
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
-		osr = ad7380_osr_to_regval(val);
-		if (osr < 0)
-			return osr;
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret)
+			return ret;
 
-		/* always enable resolution boost when oversampling is enabled */
-		boost = osr > 0 ? 1 : 0;
+		ret = ad7380_set_oversampling_ratio(st, val);
 
-		iio_device_claim_direct_scoped(return -EBUSY, indio_dev) {
-			ret = regmap_update_bits(st->regmap,
-					AD7380_REG_ADDR_CONFIG1,
-					AD7380_CONFIG1_OSR | AD7380_CONFIG1_RES,
-					FIELD_PREP(AD7380_CONFIG1_OSR, osr) |
-					FIELD_PREP(AD7380_CONFIG1_RES, boost));
+		iio_device_release_direct_mode(indio_dev);
 
-			if (ret)
-				return ret;
-
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
+		return ret;
 	default:
 		return -EINVAL;
 	}

-- 
2.47.1

