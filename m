Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288B239E9A
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970836; cv=none; b=vBmI/ePNFYSmoxfh9yGpmOQcC6c6RXSIMgGf/NHzYGr47LLLvGLcdZLBldnodzygNRsTcoq0gwNDsZtvYOp82izElv4skkYipEPn/7KRcnoTyTpebtOw1bwq5N6iR9sSJ/KZm0zJWsuEbyWPl2v19qpcNianb1fXmNJVyH90j+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970836; c=relaxed/simple;
	bh=NTtrU9ALUW0H2U3GdQ0runI6luxdsHByzTjH6ivbrbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mu7r7bLeM9nv8KaVfw59yAzSjqlzbHDQJaRYSVSFLrS4SqKP3ofP1A4hqLSvnmhw6RutUYzhZ52do29giaL+hTFfOaVg1mvMRJquuR3pfETN0eH4cmKeNNL4k3jKBcVsfO7gL4vf96K9uZy+rhM5C67TWlAunRS+6mr3RpSsiR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ki5c8XGe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ki5c8XGe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f454be5bso4345105e9.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 10:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970831; x=1770575631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HE8QDa+6YuW+XTKb20xWh2n+IRJ7xpzuDbFeuNPC7Q4=;
        b=ki5c8XGePA382RFGWVi7BpJYx98HiLojahqpMeswg/TkGt82lic4rohm5jlTCc1lJy
         mDpvq0a3b56yTpvlNc2LELiGaiF4Uhnhzo8daymxhgbPYjD5At0Zuxv1rNaygliySZhb
         PiYveRyqo0deiKVzwVKQocrqHNY+uPewG6m+sPKo3rnF7u/3EWPdQQdpe9IphEhnUW5w
         M1plSuhAC7+7X5ueylNV9wF2q6lfpRA19b2gnmmMrS6/HNCCdgNxRFZOvmjre3geI/rS
         Lc99Ner9PyKFLXwWp61Gw+u0cdZaS12OZYoNUfHxaRaTB739tjFWKFLJ64Hgt7o6zorh
         Ocvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970831; x=1770575631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HE8QDa+6YuW+XTKb20xWh2n+IRJ7xpzuDbFeuNPC7Q4=;
        b=qrSpvuOf/YNmoJbKuzugNg0LCsuDk7haCyVQmvLRqgtP0yozQ6P2HWJc6/WNzHBcyF
         koe5rRc8AIc6zkCLG1S2g7bpxR7H7PgAijz5danZBpTIXXFQmb2SO4fOkQJJfxGigUco
         hpm4LVZkcx0lRGes+dBzz0I46behnIfLIO/kCr3xXPVqqTgC0MBowKdybKzeifSlFkUk
         H7A3L6k8mBQyy56l2UGaLlWn1KOC+ItQZUYOeTsHtA39xreuh6LdACpf1hpxJa5/pGWX
         hr2/8rq8nXqC5ts/zq3NM5KBZ/W0CRGukQqNzRja9pTxUx6WTGE7sS6X5TGjnzCBVnTk
         ZRWg==
X-Forwarded-Encrypted: i=1; AJvYcCXCRk+GK3Vmdpdvmhrp/k+JblCKUE/reyw5kIQQeBvO3YaOvqloBnL0hasiVSVk/e86QE2Pg0zAKeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb5uayCdHeGGtCYJZs9jtJnb1fCYx95fsMhEK6FwFGDD7YPlyX
	c0Zg3vTF2fBp+NsxXr6knWrtgzcwRJXLQGYdcSBBk0nfd5ug0lNNbGbY
X-Gm-Gg: AZuq6aKjjDtc9BB6fbsA58uZJSM76HyoD9E5KKvVWLKCSrW1125VNTeeWwCr84D1WDD
	LYzQgwBsL8lHec5QlBovKPdJmg6vTFEszTAfQsNjs5CxIUQeCRuZDVqoEF2twWSw2Iyy+pjSKjs
	zNKRHV5ZLecUtZbpLJSmGtK9iADPYbQCAON3dZOjLvRsj3PXCczr414iX241iIiAytaH03cfHBx
	UFT2OmtReMjpj4cKluk3BhqlLrqchfacbZMyyFzOHk8QJPfngqEXJKHvxViUsta/aX7t4meXaG7
	5AtckfYFzOdFJJJnZZTURDu5MovXGbHD1PfVtJ+buhwtih0ps8RX+/W6IYoiC9haNL4FZ9cK3Ql
	pDQ7GUK8kWVZpc8hLe+CF0O4/EBcbHkWHLA4J8tE77SzZE/NnlLuATVNcWHcGfN2jRpXKu0rEHE
	1tYsxeig//ZDPAPTZj0pjxnurfzDLEE295hboE+wB6192VMQ==
X-Received: by 2002:a05:6000:24c5:b0:435:aaba:b904 with SMTP id ffacd0b85a97d-435ea06715fmr17840324f8f.8.1769970831095;
        Sun, 01 Feb 2026 10:33:51 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm41400084f8f.13.2026.02.01.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 10:33:50 -0800 (PST)
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
Subject: [PATCH v2 4/4] docs: iio: adxl345: update math and examples for scaling
Date: Sun,  1 Feb 2026 13:33:13 -0500
Message-ID: <20260201183320.27023-5-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260201183320.27023-1-0rayn.dev@gmail.com>
References: <20260201183320.27023-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the documentation to reflect the addition of event scaling
and correct existing technical errors inscale values.

key changes:
- Fix the 62.5 g/LSB typo to 62.5 mg/LSB and add SI unit conversion.
- Correct decimal precision of in_accel_scale and
in_accel_scale_available to match actual SI unit (m/s^2)
values reported by the driver.
- Add sysfs example showing how to read and interpret the
newly implemented event scale factor.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 Documentation/iio/adxl345.rst | 41 +++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
index 41d209a4dccf..2f51a2a4fbd0 100644
--- a/Documentation/iio/adxl345.rst
+++ b/Documentation/iio/adxl345.rst
@@ -13,7 +13,11 @@ This driver supports Analog Device's ADXL345/375 on SPI/I2C bus.
 * `ADXL375 <https://www.analog.com/ADXL375>`_
 
 The ADXL345 is a general-purpose, low-power, 3-axis accelerometer with selectable
-measurement ranges. The ADXL345 supports the ±2 g, ±4 g, ±8 g, and ±16 g ranges.
+measurement ranges. The ADXL345 supports the following ranges:
+- ±2g  (approx. ±19.61 m/s^2)
+- ±4g  (approx. ±39.23 m/s^2)
+- ±8g  (approx. ±78.45 m/s^2)
+- ±16g (approx. ±156.91 m/s^2)
 
 2. Device Attributes
 ====================
@@ -98,23 +102,28 @@ listed.
 +---------------------------------------------+---------------------------------------------+
 | in_accel_gesture_singletap_timeout          | Single tap duration in [us]                 |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_singletap_value            | Single tap threshold value in 62.5/LSB      |
+| in_accel_gesture_singletap_value            | Single tap threshold value in               |
+|                                             | 0.612915 m/s^2/LSB                          |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_mag_falling_period                 | Inactivity time in seconds                  |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_mag_falling_value                  | Inactivity threshold value in 62.5/LSB      |
+| in_accel_mag_falling_value                  | Inactivity threshold value in               |
+|                                             | 0.612915 m/s^2/LSB                          |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_mag_adaptive_rising_en             | Enable AC coupled activity on X axis        |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_mag_adaptive_falling_period        | AC coupled inactivity time in seconds       |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_mag_adaptive_falling_value         | AC coupled inactivity threshold in 62.5/LSB |
+| in_accel_mag_adaptive_falling_value         | AC coupled inactivity threshold in          |
+|                                             | 0.612915 m/s^2/LSB                          |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_mag_adaptive_rising_value          | AC coupled activity threshold in 62.5/LSB   |
+| in_accel_mag_adaptive_rising_value          | AC coupled activity threshold in            |
+|                                             | 0.612915 m/s^2/LSB                          |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_mag_rising_en                      | Enable activity detection on X axis         |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_mag_rising_value                   | Activity threshold value in 62.5/LSB        |
+| in_accel_mag_rising_value                   | Activity threshold value in                 |
+|                                             | 0.612915 m/s^2/LSB                          |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_x_gesture_singletap_en             | Enable single tap detection on X axis       |
 +---------------------------------------------+---------------------------------------------+
@@ -140,8 +149,8 @@ When changing the **g range** configuration, the driver attempts to estimate
 appropriate activity and inactivity thresholds by scaling the default values
 based on the ratio of the previous range to the new one. The resulting threshold
 will never be zero and will always fall between 1 and 255, corresponding to up
-to 62.5 g/LSB as specified in the datasheet. However, you can override these
-estimated thresholds by setting explicit values.
+to 62.5 mg/LSB (0.612915 m/s^2/LSB) as specified in the datasheet. However,
+you can override these estimated thresholds by setting explicit values.
 
 When **activity** and **inactivity** events are enabled, the driver
 automatically manages hysteresis behavior by setting the **link** and
@@ -270,13 +279,13 @@ Scale range configuration:
 .. code-block:: bash
 
         root:/sys/bus/iio/devices/iio:device0> cat ./in_accel_scale
-        0.478899
+        0.004789
         root:/sys/bus/iio/devices/iio:device0> cat ./in_accel_scale_available
-        0.478899 0.957798 1.915595 3.831190
+        0.004789 0.009578 0.019156 0.038312
 
-        root:/sys/bus/iio/devices/iio:device0> echo 1.915595 > ./in_accel_scale
+        root:/sys/bus/iio/devices/iio:device0> echo 0.019156 > ./in_accel_scale
         root:/sys/bus/iio/devices/iio:device0> cat ./in_accel_scale
-        1.915595
+        0.019156
 
 Set output data rate (ODR):
 
@@ -312,10 +321,14 @@ Configure one or several events:
 
         root:/sys/bus/iio/devices/iio:device0> echo 24 > ./buffer0/length
 
-        ## AC coupled activity, threshold [62.5/LSB]
+        ## Check the event scale factor (0.0625 * 9.80665)
+        root:/sys/bus/iio/devices/iio:device0> cat ./events/in_accel_gesture_scale
+        0.612915
+
+        ## AC coupled activity, threshold [0.612915 m/s^2/LSB]
         root:/sys/bus/iio/devices/iio:device0> echo 6 > ./events/in_accel_mag_adaptive_rising_value
 
-        ## AC coupled inactivity, threshold, [62.5/LSB]
+        ## AC coupled inactivity, threshold, [0.612915 m/s^2/LSB]
         root:/sys/bus/iio/devices/iio:device0> echo 4 > ./events/in_accel_mag_adaptive_falling_value
 
         ## AC coupled inactivity, time [s]
-- 
2.47.3

