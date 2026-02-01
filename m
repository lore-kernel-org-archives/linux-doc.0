Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8A26ED3F
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970829; cv=none; b=iy0noO/npWzC6OHkvgPr+QcJTKRhuYAmzYz8EyBsuMm1BMeptBnv2xNSqfCcyuFPLec4lZ0LzZ1Y9bEHG0CR45H8+vzomkrlv1qdSxkAbX31Ntqa48qI8M4QKxDK+o+z5fLE+pwqangxuaEZZH5us+oWE4saCEq9T74Co5R2EUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970829; c=relaxed/simple;
	bh=ZCpnkgLOatzf4jWZphZI1+PCO8fjiEtTsfpE3S5Xwmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuLkEor/uJeTbKEXm4Uu/dnV9LPIb4jF8d0ug/UQdqTPUKNJ/pSHh/VldHKt2gYWVijCTfBmRZUxKWi/SfH5iRsiS2ITroD57fLDBBKV0zxZ+R6fsBam8/ymn/vttwUcRigOZN+ma7YNEa+cQOH1oJSWNSc3Vz1e+fb1FPgXGYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tg+gA0jX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tg+gA0jX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2467170f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 10:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970827; x=1770575627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaaojGS173TnJlve70QP/+cu6NF4HjbgNLZcKgOyGYw=;
        b=Tg+gA0jX2o+9qmJTtjBA1UC2afxELJv807VGWDjHZC7BWlapLfnBAILxexVO8i2MbI
         28nCGzQ6CiQ1fB9l1zR1eMs41HKCwlz3TWmXERo7UlDCYxJF262aE7PrkFvB4OKrhDzS
         m9BTUvuzRYxG2/BtTZimK7nrdvcLHnX6dckuMiaqugHxJ+YcICFcliXYTM+j7U9oIE/W
         eT4PRH/0+8MSaZL/4n6+8rRaYwbTxqCBlj0NtiPEf1mxYcpnBybZpMqHsifv0HuPZ3VO
         3ckNPDCFFbT8Y84HX3dACKcQcEHO/b7hJmSvfvwR7P5Btz23vYomi1gDP3Pm+l/FQ7Hk
         5Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970827; x=1770575627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kaaojGS173TnJlve70QP/+cu6NF4HjbgNLZcKgOyGYw=;
        b=HaRcsEPF1ZDzv22UvxNKARTWrySMpt7f3sLxHuJcfwXdVGPSGPSMpMBi88YZ4DvQ58
         JdmSSbG4aZs+W5b/4ey01Jwyf7qCFr9Xhf0mrqh4xh3bTgMcgZDMroGWfIMo8HqnYoaG
         qEVs97RbGvNMfMNCIO/JimBRZLUphM2iNxwxY72ttKsj90f2SIOps3R0EWRmqHLK7tCK
         B2GtIHnlPUqDTVOQor/Y0NfIAbPxUK1NlKVSn3UAq87VveY19CnVq9S9u8FIt7NMh0tE
         uRAJ9rTVAHraxF7x+QYo0iodo5rokHxd8BuzmA5omCnyiwZfbD+WxcNaXwkWp1h7YW1r
         RV0A==
X-Forwarded-Encrypted: i=1; AJvYcCUHHGEFpKinzJJkQfLCSOvHlAQtaELbmyqP+rUr1WUFpCZqa47+92t/zShUJVqxas1IQxGb38pFNeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5RPlq5NwwYJyw7SK4enYVocNHGzN9oHYblnivRniqyZlbazi
	ti5BO/iJ4Z2R8G+oBkVibsIh686NDzuizZPmsspVBVgUgh9UX8O/usmF
X-Gm-Gg: AZuq6aKuSkOAjW61Iq2fGKVYRx/a1hGMQEZfcQVoZH3ZoBql6NorzA59gH+sEbPNd8K
	+6jvm8qguj+cZ0i3UOD/71iP7yaTZBXRmbuSHRU/3YOIQzKJcXjjpsydErUJnBzLRVJS4J314pv
	UviKQnbPo2Ikipvt66z0sTPEuG1ENbL3coqHrGEwSMsCN/y+SUC1bI+bGqqgoUAkDm5sbMNR4NQ
	u2eeG9P01xpGr8IKvhpOC6DgHbk8t4AlF8TeM95wfW6Y5ZDN10TMp6BIrlyXm5Bs0CQvYGiRVe6
	vv24XME7lVmj97Rd+RdM49kw36h21AFeK5prSjrq1EHOd1ITvELF96eIO+e8KNO28TpHI2t2ozM
	hDY1KjAaSp1I3zMK3Nh+TZtDdN7oRfBRIre86yA92ege8Mq9mGyRA664jKFzQaIGaFuHPNkjwb3
	P4C2tX4Er3t+Eohbk9paRvUQ9EqdR7Rjj23KBUDtjgHO3VTffZUhJmNFJ8
X-Received: by 2002:a05:6000:40c8:b0:431:104:6dc2 with SMTP id ffacd0b85a97d-435f3a674f5mr12407152f8f.8.1769970826540;
        Sun, 01 Feb 2026 10:33:46 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm41400084f8f.13.2026.02.01.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 10:33:46 -0800 (PST)
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
Subject: [PATCH v2 1/4] docs: iio: adxl345: fix typos and grammar
Date: Sun,  1 Feb 2026 13:33:10 -0500
Message-ID: <20260201183320.27023-2-0rayn.dev@gmail.com>
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

Correct several grammatical errors, typos, and pluralization issues
throughout the ADXL345 documentation. Key changes include:
- Changing 'generic' to 'general-purpose'
- Correcting 'axis' to 'axes' in multiple tables and descriptions
- Improving phrasing in the device attributes section
- Fixing 'latent' to 'latency' in usage examples

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 Documentation/iio/adxl345.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
index bb19d64f67c3..41d209a4dccf 100644
--- a/Documentation/iio/adxl345.rst
+++ b/Documentation/iio/adxl345.rst
@@ -12,16 +12,16 @@ This driver supports Analog Device's ADXL345/375 on SPI/I2C bus.
 * `ADXL345 <https://www.analog.com/ADXL345>`_
 * `ADXL375 <https://www.analog.com/ADXL375>`_
 
-The ADXL345 is a generic purpose low power, 3-axis accelerometer with selectable
+The ADXL345 is a general-purpose, low-power, 3-axis accelerometer with selectable
 measurement ranges. The ADXL345 supports the ±2 g, ±4 g, ±8 g, and ±16 g ranges.
 
 2. Device Attributes
 ====================
 
-Each IIO device, has a device folder under ``/sys/bus/iio/devices/iio:deviceX``,
+Each IIO device has a device folder under ``/sys/bus/iio/devices/iio:deviceX``,
 where X is the IIO index of the device. Under these folders reside a set of
 device files, depending on the characteristics and features of the hardware
-device in questions. These files are consistently generalized and documented in
+device in question. These files are consistently generalized and documented in
 the IIO ABI documentation.
 
 The following table shows the ADXL345 related device files, found in the
@@ -42,7 +42,7 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
 +-------------------------------------------+----------------------------------------------------------+
 | in_accel_x_raw                            | Raw X-axis accelerometer channel value.                  |
 +-------------------------------------------+----------------------------------------------------------+
-| in_accel_y_calibbias                      | y-axis acceleration offset correction                    |
+| in_accel_y_calibbias                      | Y-axis acceleration offset correction                    |
 +-------------------------------------------+----------------------------------------------------------+
 | in_accel_y_raw                            | Raw Y-axis accelerometer channel value.                  |
 +-------------------------------------------+----------------------------------------------------------+
@@ -68,7 +68,7 @@ present, simply assume its value is 0.
 +-------------------------------------+---------------------------+
 | Channel type                        | Measurement unit          |
 +-------------------------------------+---------------------------+
-| Acceleration on X, Y, and Z axis    | Meters per second squared |
+| Acceleration on X, Y, and Z axes    | Meters per second squared |
 +-------------------------------------+---------------------------+
 
 Sensor Events
@@ -78,7 +78,7 @@ Specific IIO events are triggered by their corresponding interrupts. The sensor
 driver supports either none or a single active interrupt (INT) line, selectable
 from the two available options: INT1 or INT2. The active INT line should be
 specified in the device tree. If no INT line is configured, the sensor defaults
-to FIFO bypass mode, where event detection is disabled and only X, Y, and Z axis
+to FIFO bypass mode, where event detection is disabled and only X, Y, and Z axes
 measurements are available.
 
 The table below lists the ADXL345-related device files located in the
@@ -90,11 +90,11 @@ listed.
 +---------------------------------------------+---------------------------------------------+
 | Event handle                                | Description                                 |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_doubletap_en               | Enable double tap detection on all axis     |
+| in_accel_gesture_doubletap_en               | Enable double tap detection on all axes     |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_gesture_doubletap_reset_timeout    | Double tap window in [us]                   |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_doubletap_tap2_min_delay   | Double tap latent in [us]                   |
+| in_accel_gesture_doubletap_tap2_min_delay   | Double tap latency in [us]                  |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_gesture_singletap_timeout          | Single tap duration in [us]                 |
 +---------------------------------------------+---------------------------------------------+
@@ -118,9 +118,9 @@ listed.
 +---------------------------------------------+---------------------------------------------+
 | in_accel_x_gesture_singletap_en             | Enable single tap detection on X axis       |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_x&y&z_mag_falling_en               | Enable inactivity detection on all axis     |
+| in_accel_x&y&z_mag_falling_en               | Enable inactivity detection on all axes     |
 +---------------------------------------------+---------------------------------------------+
-| in_accel_x&y&z_mag_adaptive_falling_en      | Enable AC coupled inactivity on all axis    |
+| in_accel_x&y&z_mag_adaptive_falling_en      | Enable AC coupled inactivity on all axes    |
 +---------------------------------------------+---------------------------------------------+
 | in_accel_y_gesture_singletap_en             | Enable single tap detection on Y axis       |
 +---------------------------------------------+---------------------------------------------+
@@ -330,7 +330,7 @@ Configure one or several events:
         ## doubletap, window [us]
         root:/sys/bus/iio/devices/iio:device0> echo 0.025 > ./events/in_accel_gesture_doubletap_reset_timeout
 
-        ## doubletap, latent [us]
+        ## doubletap, latency [us]
         root:/sys/bus/iio/devices/iio:device0> echo 0.025 > ./events/in_accel_gesture_doubletap_tap2_min_delay
 
         ## AC coupled activity, enable
-- 
2.47.3

