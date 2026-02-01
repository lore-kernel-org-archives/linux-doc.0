Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7C288510
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 18:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970832; cv=none; b=LOGGYyLFbVgKoQYEtwJIB+7DM3PgzX7emoV1Pv3nJSF2oZSDLIh5pfWEul1akucWOvWIg372uaBfsjZMteDnsWlgvuHaewJqn8QOFpDY73oI0JvCVvVSDqTNY1h1ZUaIBXIjMWB6Uizy9H6ve1y55sHdy/5FKYO6kKLOsp/U+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970832; c=relaxed/simple;
	bh=IUjmltrTFO4YbZQalOEcuCS0vZJiq0YFeUYJfges9VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pz9Gk6MVX4seBjpAEzYzPelx7DkCg37Xe7ctA3WZmddLvMxWXsdVRSAfjbdisZY9HYRaZxmfUr0hde5iOnKWe0LU4KXNQonbjOVXbAH2LWacpe3SFDS87YzSLcdVCZ5/AsvkFYfNgCqOuAReZjnkjWjGbXNYoFO3EYNJDVuPe2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD9CQpIF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD9CQpIF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3085280f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 10:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970830; x=1770575630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8B3KYHW7oN1cE0ooieHtgCbkDaH2P1LrwaeA4680tA=;
        b=VD9CQpIFSUADbBs2JiiTlI141An8Tyr5zbxeu4fuQkGHoNcITQFfo59yeUT1waKb5Z
         c4GgeN7ogPx7S9iEVcBtlIgHeYX/3D95w5SAzipQLwBAoizsiWUuFGFqouSm9C6YjeRU
         pvgeF4U1w5atwGleDQDJUKF24ID07z7RCjUAJBkPlz+ZuHZi3nZo5IBGH58G34tHkmy8
         nUILFE5i70sUYaXXpRetO7EvojTA/Y9NkV7srXx1fkLLnUaDD8etRJK2tuMaUpuPINEZ
         2KurmRnGZklOsqW4y+jZ8N3C3eNbDorNv/Bn/PrftXt1fjGd++2kKwsRxzeXukXCgbb5
         zpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970830; x=1770575630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8B3KYHW7oN1cE0ooieHtgCbkDaH2P1LrwaeA4680tA=;
        b=DmkQT5AIKmpCUyubem2oetsiwcFI9Yce7xNq66kiQOgvP6ZNSXTeCks9FkRzjwRcFw
         k01he6JPEDC4+MhZvn3hZw81J06bSEgdzRxIHG94fTkXlc/15QvdcwMmYiXaAUoZmWmA
         D4Ob5oQiEHtimchpbSSYYTR9WFPpu4ndab886dtLnxARwwclQuPa5lNOzORb9W8ZPjln
         8zagZEmBj5sAfrOJC1XphQTgRntAdF/UweAT03m3semPDr0aQ369Eq/tHbY8mIwV8MTH
         bKnut3HXwI9RKalsU4NpUxDUjliEpBBpza7n0E+t2br9V3pkRe3SeAbmcFTQqYpE+AYo
         An8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXik2hQg1AbbLuzypSlIQfqhk/eCxvazsFSzvmWgzrMqneI0iZQnlns16cgcogYvnOT2lXeDxlYXDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgTWiUGVHFT1mgA9WiT6sP1Nq+sUAygGmIdWQKEOn8G8p2ZPpq
	WyhOTcT9PB+VXfBB5o81lwB02eRixeO3xquOAxUDMjJSuMEHJIUOs+xH
X-Gm-Gg: AZuq6aKwbceAElCLJzmhWv/jXlhFflYpyEJ73dunmDPWYGS1EBDJN3XB0JMjE4YInPr
	ZfZWkCCKuGKLe9yPz6F5yvhtNwUWGPS92C3f/19MNEiPfA2SCHdrm3fCuIIbeBfb39vEfmUz+F+
	x674OAaqx4b3wxcfwq/pUS1H1V4DDPTLZ5NcvBWyDmVJJuo4PxQEkTJ808asyavtrtLoPPN2vgt
	ye+rJAjRFUTAFhwyXKdJ5opBwy7Kj2br2rjr2SqAOgXDL3Bii1mqsA68HXrYubwwZpO7ygH3aml
	uy7dZIIxP9OO2xU8cX8DX1Dh4Tkr115VymOD/UxaNC4lAFsrkJprKbHcVielkpe+0AaTOhYSDD5
	rQV8qMfGmKRxDrz9hbngFKbHt6yC75Ra6U+SinFnYjwjc/WDOrbEmvZ9ZFn0h0TimP4IQkjRItz
	ajFxlJ0Bj4Pa7bAA3GuKhh94IGl12Fuy8oQh/qh2h9QaLqJw==
X-Received: by 2002:a05:6000:4381:b0:435:8ff3:cd5d with SMTP id ffacd0b85a97d-435f3aaa753mr12566531f8f.32.1769970829536;
        Sun, 01 Feb 2026 10:33:49 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm41400084f8f.13.2026.02.01.10.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 10:33:49 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v2 3/4] iio: accel: adxl345: Implement event scaling for ABI compliance
Date: Sun,  1 Feb 2026 13:33:12 -0500
Message-ID: <20260201183320.27023-4-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260201183320.27023-1-0rayn.dev@gmail.com>
References: <20260201183320.27023-1-0rayn.dev@gmail.com>
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

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/accel/adxl345_core.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 78e3f799ecc1..dfe3169ffc5f 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -212,7 +212,8 @@ static const struct iio_event_spec adxl345_events[] = {
 		.type = IIO_EV_TYPE_MAG,
 		.dir = IIO_EV_DIR_RISING,
 		.mask_shared_by_type =
-			BIT(IIO_EV_INFO_ENABLE) |
+			BIT(IIO_EV_INFO_ENABLE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_VALUE),
 	},
 	{
@@ -221,6 +222,7 @@ static const struct iio_event_spec adxl345_events[] = {
 		.dir = IIO_EV_DIR_RISING,
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_ENABLE) |
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_VALUE),
 	},
 	{
@@ -228,15 +230,19 @@ static const struct iio_event_spec adxl345_events[] = {
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
+			BIT(IIO_EV_INFO_RESET_TIMEOUT)	|
+			BIT(IIO_EV_INFO_SCALE)		|
 			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
 	},
 };
@@ -274,7 +280,8 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.dir = IIO_EV_DIR_FALLING,
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
-			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 	{
@@ -283,7 +290,8 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.dir = IIO_EV_DIR_FALLING,
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
-			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 };
@@ -1367,6 +1375,14 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
 				return ret;
 			*val = sign_extend32(tap_threshold, 7);
 			return IIO_VAL_INT;
+		case IIO_EV_INFO_SCALE:
+			/*
+			 * The event threshold LSB is fixed at 62.5 mg/LSB
+			 * 0.0625 * 9.80665 = 0.612915625 m/s^2
+			 */
+			*val = 0;
+			*val2 = 612915;
+			return IIO_VAL_INT_PLUS_MICRO;
 		case IIO_EV_INFO_TIMEOUT:
 			*val = st->tap_duration_us;
 			*val2 = MICRO;
-- 
2.47.3

