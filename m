Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3639E6F9
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941852; cv=none; b=ET+XsVw7ITWHsXuRwyRf3L1ueuPapWth7NXuHfDwCtwa32FqBp0glrHY//6qJ46dzRz49bB2UlMC5kb7KDsw2Ymn+OwrX2sl9D8tf1vVFLukX/GOChaOclaigx99yLFKHxlo2W5pRMK75PdM3g8JGtazXkvFhobvQU/kbv/dGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941852; c=relaxed/simple;
	bh=au0e4ypE6x/0jDdOhryMt7CY81fCNnbWNQRijiJCi8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLUYedza8MrjhsZAoqoZwRKKfvYR3b4R/0suWqQOw3tK4/cEIdZHJvVVwMOp1sqE+QXsRoWEJXyiYk9rW3rydVQbNrDQBq9HjP+Ucz5vNA7ReFaFgL1Zt0CkYjYvoYZ03KNBHmw6j1kjLbSRYJLaP6BzkQapvPaARipT4SNMVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAYqyike; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAYqyike"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483a233819aso54148585e9.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771941848; x=1772546648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ecdWDoUpwMTmcnEbrWr6+7wrPFW+milCk6Hirg8t6A=;
        b=RAYqyikeoeHLs9HnL3NsRYx4WoH62zSUshSllM1ASby/aWFWCSkDmEBrTXNGEKDCKy
         fMfsAP4uvy53IMeDSu2YqTFMBQ0Ubr8mH6YlQ+Ece9E2Sj27bWnJ6BoClqdyqe6VhICE
         fvtnFtLlBy+d0SOauubwQdTt7PMYj9Tnw6U3myphBRuQypjiADbAh8bKpiXilEAKLU40
         wlf7oaAEeoausjMVvoYImJFHi0GTN7hcyYSdMrZ5uzzam90ukEh/5cbkoDZY/rDWnH1p
         kz0Zrf9oilRNcSd7etbJyXOxMJ4G6tlI+u1zr6N5DCH9CSDWC4P1chF9H1PIVTufy3x7
         E7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771941848; x=1772546648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ecdWDoUpwMTmcnEbrWr6+7wrPFW+milCk6Hirg8t6A=;
        b=Br5eILs8fd5zYy1xJv1nCpLQ2xxVwOVfQM+/CjjtUcBkOY9MmhbUN0fwKf8EQeYBpi
         j5iGfquHQt7830HrOAYgHXGNRwfS9qcsMR2mRaMHdmrkXKWpOgUKuCOjA+r9n60bsH0u
         IrWkkyEOzEsk3k/Nvb573nDlATu1eTlKtSRezxdp03KGggusaNRwvB0cLZV/+T6dNs7w
         XZZABhCHiJ9zOu6sYwuV2drg6EJkRvDsdCkMQM/AWmk6jhEbypMehkMzhFQDi2r7fncJ
         gzdCNYwxzvK8usPuG1cbsm4F+DuOWnNB0ziINW4o9oBdmeXgEyZ8G9wUn4OqAcie+LgF
         OGMw==
X-Forwarded-Encrypted: i=1; AJvYcCVHl3QqaKBXxUMdqe+wN6+8A8YdKPDawAl3Q+zu/zGS3uQXb7nxAfkf2WI+14NZHe+K4p+vhixKL6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlT3hLFmVVJ/1hSWX0Vr436+4BnYX1CD8KO/OF8o+oIt6imMcM
	e35u85XoeEP00vfNprYFlJlgbsneLNIfY2ISbEElcwpHlG4S13yAtK8w
X-Gm-Gg: AZuq6aLMv3QXqnWdHiW12sYdxCGn4YCSu3Q2k+jx9bpAYC/7gtMcmzdm32wIszdCdos
	VqTl2FHQUvXao88AqhA1YGurjiL9OiV0+pHLpSY45d2JaMYiOZtgiT9iJGVI726CAOUCW3tYLYG
	Nweyuwsk2lMm+M5H728ZoxS9VJXUaUn1jvM+LHt39CbkN9ix9bX08XogLurLY3iYiZgZGp3dDHz
	eyyNACf06zsut+i8roLC0YV3XzvfsGCMTiyyKRxcoyW0qeR58X7A45Ysv3WvMrFe7wCxzFt0KZj
	IZOnCyrwXvuP2008owl1BzPze/znQI/1G7yKESlXSiWYUDanUdwnDzQNkSSaUAEWfMR+NNexGKg
	vIb8OkkZRI6mMpfE69V/iER5f6Y1cyEWGeAmW1rx6pw/5smL93lcjk9BRwozoWafRSBkQlEByzR
	m7FE+Rc6lFNH0Pj+oKmkQpvc5kNpxYlABvbXP4onQMYQtPoloTdrndHtdzXi1Cww==
X-Received: by 2002:a05:600c:1e1d:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483a9637a55mr221457985e9.25.1771941847732;
        Tue, 24 Feb 2026 06:04:07 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7010a0sm1043505e9.5.2026.02.24.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:04:07 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v5 4/5] iio: accel: adxl345: Implement event scaling for ABI compliance
Date: Tue, 24 Feb 2026 14:03:47 +0000
Message-ID: <20260224140351.27288-5-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224140351.27288-1-0rayn.dev@gmail.com>
References: <20260224140351.27288-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADXL345 uses a fixed threshold resolution of 62.5 mg/LSB for
event-related registers. Previously, the driver reported raw
values without a scale factor.

Implement IIO_EV_INFO_SCALE for all event types to provide the
conversion factor (0.612915 m/s^2) as required by the IIO ABI.

Consequently, remove the obsolete comment in adxl345_read_event_value()
which stated that the scale factor is not applied.

Add explicit write rejection for IIO_EV_INFO_SCALE in
adxl345_write_event_value() returning -EINVAL.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/accel/adxl345_core.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 1ac99263ad8e..722b5018757e 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -213,7 +213,8 @@ static const struct iio_event_spec adxl345_events[] = {
 		.dir = IIO_EV_DIR_RISING,
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_ENABLE) |
-			BIT(IIO_EV_INFO_VALUE),
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE),
 	},
 	{
 		/* activity, ac bit set */
@@ -221,14 +222,17 @@ static const struct iio_event_spec adxl345_events[] = {
 		.dir = IIO_EV_DIR_RISING,
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_ENABLE) |
-			BIT(IIO_EV_INFO_VALUE),
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE),
 	},
 	{
 		/* single tap */
 		.type = IIO_EV_TYPE_GESTURE,
 		.dir = IIO_EV_DIR_SINGLETAP,
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
-		.mask_shared_by_type = BIT(IIO_EV_INFO_VALUE) |
+		.mask_shared_by_type =
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_TIMEOUT),
 	},
 	{
@@ -238,6 +242,7 @@ static const struct iio_event_spec adxl345_events[] = {
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_ENABLE)		|
 			BIT(IIO_EV_INFO_VALUE)		|
+			BIT(IIO_EV_INFO_SCALE)		|
 			BIT(IIO_EV_INFO_RESET_TIMEOUT)	|
 			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
 	},
@@ -277,6 +282,7 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_SCALE) |
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 	{
@@ -286,6 +292,7 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_SCALE) |
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 };
@@ -1343,6 +1350,16 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
 	unsigned int tap_threshold;
 	int ret;
 
+	/*
+	 * The event threshold LSB is fixed at 62.5 mg/LSB
+	 * 0.0625 * 9.80665 = 0.612915625 m/s^2
+	 */
+	if (info == IIO_EV_INFO_SCALE) {
+		*val = 0;
+		*val2 = 612915;
+		return IIO_VAL_INT_PLUS_MICRO;
+	}
+
 	switch (type) {
 	case IIO_EV_TYPE_MAG:
 		return adxl345_read_mag_value(st, dir, info,
@@ -1357,12 +1374,6 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
 	case IIO_EV_TYPE_GESTURE:
 		switch (info) {
 		case IIO_EV_INFO_VALUE:
-			/*
-			 * The scale factor would be 62.5mg/LSB (i.e. 0xFF = 16g) but
-			 * not applied here. In context of this general purpose sensor,
-			 * what imports is rather signal intensity than the absolute
-			 * measured g value.
-			 */
 			ret = regmap_read(st->regmap, ADXL345_REG_THRESH_TAP,
 					  &tap_threshold);
 			if (ret)
@@ -1403,6 +1414,9 @@ static int adxl345_write_event_value(struct iio_dev *indio_dev,
 	if (ret)
 		return ret;
 
+	if (info == IIO_EV_INFO_SCALE)
+		return -EINVAL;
+
 	switch (type) {
 	case IIO_EV_TYPE_MAG:
 		ret = adxl345_write_mag_value(st, dir, info,
-- 
2.47.3

