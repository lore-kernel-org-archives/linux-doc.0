Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DC1E8329
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771683195; cv=none; b=i+PmghzdA0O3k4WWL8hEn6lTMHBozyUUgHN3ulBf90lHWULCn8m+JvqmCLZnOx2bVAmJulaDQClH8h6zC2EHG2kuDGfLY3GQhWHTE5WBcIYMAfN7410WTJw2vu1JPd2JoE0neZnP8IeORoJI0KuiMFChSlEjbceQxcUHgAKLzwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771683195; c=relaxed/simple;
	bh=6ghLbRzOpxQn9OiRcxj7ZSUoK/TJaCcU0SrAfILDiEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzUpUIDV3bUmkAz3EMQZs5UVmXTS3cXsi6TpLm1RUNwhYPEysJW/D2v1ERUpjIaWKltdccTawXgn7vbUf2slWgJVLQQGGhhCpy35VMFEp8fKO3cWUi5xTbi554q6zouIJQRXTUX+tMqD8EcJ7yGlKBxDuJ3p0h1h6WB6Otd27Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY7Rz+Fn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY7Rz+Fn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48375f1defeso21032065e9.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771683192; x=1772287992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQDbxuvZXARR/5hnSiCglzij1Z7nJyORRk4T/d/X+yA=;
        b=TY7Rz+Fn2yT6NaMz5c9aNAB2t4hpzdrkGtAPZI3+obkfK8qDdSZsmOW8gjqR2o8+10
         6JD/aJ5Kv1EZJQKoapr1PBVtJ3zLBHQWzPqy1o8R+XRPmqWfmihYlPONAlIyvXIUHc9x
         5lLtPyVnmVFEwkyS6UQs7v+6qkvEskhXfjbbJJl2ZP7R88H6eIe3R6b/e8y+Y90VJxPX
         qv7+Qf+CmVh9t/D9m36xc2m8hBTi6QsKrLtXOjKqC4wk3mvgtORuv8V9Yr9i1uwBjZnx
         BBiYuotKBbp/j8XqG4JYqQ4MFrvxjEopQPLP3vDUKKxI9w0wvkJvKVIpI+TyDcMeUTVR
         AqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771683192; x=1772287992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wQDbxuvZXARR/5hnSiCglzij1Z7nJyORRk4T/d/X+yA=;
        b=h+Ed6rPW8af1XwDWuJg8Sr24jPAURyqOqRuQKFJYWHcOVaRww387WId8b1u9quAKnk
         JYIRGq8H2xVAerqrtawhRdGE3Lupe8fMiRPH2Z7NCMk996Exu6HJoX/C9KVE2azaNTlU
         0VBoRdxDmnqL5ut84ulUcC/xqHhxx5KkrkFjO0vU8LNys/CdoyzS71d5rCPJygEf3mLT
         UsTFwGSUaimEeRO5LSRndJ59jejUqfDWlH4jui62fNgy4zhSw1XLgR2Mj0JJE2wejUow
         4akMUKfR7cQkGCXxu5JZcrErSwH3OAbCg+ijexUXco56KmknYSUDPjnAMcnTBM0oy2rX
         3pOg==
X-Forwarded-Encrypted: i=1; AJvYcCW2H8Xvkc9aOwDa+kvdX14yykIo9ouMOGFVdteQ9Eph6O2R/+A8ofqb0svs7z+rkFIRfrTCWKnvKB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8adS4bL5xVLvXycwQd1s/RyENF4xmNgYHC/Qj+1Ax+xXhLNG
	DblC/pYYn5So5TJQkAO35rGU7f9emEXEqiTglANcb+GOoom3XtB+HED4
X-Gm-Gg: AZuq6aJ6yGE+6HBTdhgOa0tgPdvlEyEMoWpsNRPr2cW+U4jkfpIce67ZTmOx2XK5e3R
	U+IgArcHM7zZCsFpTcd+zK8cXli9pf+ZQMe0/jVx0LeHBr3XCsznK6YYm0Yv7gLkaNBEAGxVjIl
	hyNGjoobuMCkrYebvb3u0l7hMM8oXayfirw6dH2ckUaUHRSCduidhwQkPUzQguuE2mTgOo3rLhI
	tAmucwMz8HOAj9GSQnIqk4GHE3yBuD4DcpPfKaphvew2tyfi8aVuAMwlQzzy9UJsRdqpw17enhl
	zzKA5PshBae1XEpkRAYnkla8F0C+BWqLw6kImGAXN1bHEQgyYsaWfrO5HXindjW0IbwjQkBPh2k
	qYH8nz+UpQUsX6B0ANaTCatu7K1h5DCta/kRrhtNjR2PzVkIdj6/YP5vq3RfrET5zhra+oAMGdz
	UavikD0XX/RVzG5F4fwyqQLhkkeGYH8Xm93k7uAn+ul5J9YO9mvxT4bjfWXbjL12zwiqQRmldX
X-Received: by 2002:a05:600c:4fd5:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483a9637a61mr40665565e9.26.1771683191847;
        Sat, 21 Feb 2026 06:13:11 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e01c27sm50169825e9.9.2026.02.21.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 06:13:11 -0800 (PST)
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
Subject: [PATCH v4 3/4] iio: accel: adxl345: Implement event scaling for ABI compliance
Date: Sat, 21 Feb 2026 14:12:46 +0000
Message-ID: <20260221141251.34855-4-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260221141251.34855-1-0rayn.dev@gmail.com>
References: <20260221141251.34855-1-0rayn.dev@gmail.com>
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
 drivers/iio/accel/adxl345_core.c | 37 ++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 78e3f799ecc1..eac4ab052fa2 100644
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
@@ -221,22 +222,27 @@ static const struct iio_event_spec adxl345_events[] = {
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
 		/* double tap */
 		.type = IIO_EV_TYPE_GESTURE,
 		.dir = IIO_EV_DIR_DOUBLETAP,
-		.mask_shared_by_type = BIT(IIO_EV_INFO_ENABLE) |
-			BIT(IIO_EV_INFO_RESET_TIMEOUT) |
+		.mask_shared_by_type =
+			BIT(IIO_EV_INFO_ENABLE)		|
+			BIT(IIO_EV_INFO_SCALE)		|
+			BIT(IIO_EV_INFO_RESET_TIMEOUT)  |
 			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
 	},
 };
@@ -275,6 +281,7 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_SCALE) |
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 	{
@@ -284,6 +291,7 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_SCALE) |
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 };
@@ -1341,6 +1349,16 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
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
@@ -1355,12 +1373,6 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
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
@@ -1401,6 +1413,9 @@ static int adxl345_write_event_value(struct iio_dev *indio_dev,
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

