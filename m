Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA735DCEA
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563132; cv=none; b=OvyTirqlCxhpgsyC9YuXRSvj5drsngHTK4YKJznJov0yT+IfI1Oq904JgSxJwp56v4zf01ggnVZiKxVEpGksj/fUcsbsNKjO16eyc52GbROOaGGAfGaQfIO7zn1F6GEaVZTxC+qEcgpCVAOZg6Qg3GX6PzryPXFSIE33nau+Cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563132; c=relaxed/simple;
	bh=jygn9hfhuwiAljKBRe7Yu0fCo7DdMqIwgB/WQt9+uSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSMrpvBmPBN4CBhzkjhwE1gJW+mIDGkLQFOD8IDLg7jyq5VmPlW6lSv3rXKjRB5ZtgJQEcqyCdAUpr976PEZa787CpoFKNVClGt5sxXNQYVla21fZmKJOxSOqY4mXhS3c2HNErcRrhmPLulyEXB4NKK6AhlN8HuBVGR1QDrlDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoU4LkkE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoU4LkkE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso24826105e9.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 07:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563131; x=1771167931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Det23t3gXSrsxwybIdE4hiHLe2ZCpMnMdOVYGU14wcw=;
        b=WoU4LkkEKKjdgz4uUELhdJzj8gV+vqhZ+BTYOpTj1N6cpjakp48L2e7ajZ8Tdj/KLn
         Z6Jsp/Psl3g8H1Fk64g9puPTOX1zqRR9DNn6c2nMKbddq/lfWQ9ox0Qye6YazrnEDKXS
         K+2Sw2COoIMuC4jOPfepglULfIAabNsl+FOeA6BiX0WVxiHQAe1BJCZY/JsuBIv6gp6/
         WCz5cWrBUhDrN6BqfcLMBxiDDyMSQN0ItrUkudhuBMcQIoFeOQK7ge0A3yiUTEFX4DSb
         MsUdejKjtHptIFddK/d5L7BLd6OwFNsuM245TeHpGJYq7TTapUi6N/ovx+R36xhgmJHl
         Ai2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563131; x=1771167931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Det23t3gXSrsxwybIdE4hiHLe2ZCpMnMdOVYGU14wcw=;
        b=Vhv0NvLClGpU3nkxzCojtvtzkFF+qMRZRd/Durfi/lipe79yxxKfIs6E/2QjcsXEoz
         veE7yQeCzn0gZdMTe/zb7gkX+ir5OmazvKerjPrMMv9MGWwBwwcv2r7/TXXRmbAV3jZL
         FkaAPFiSfjkW9aiq0GqlY6uHv/3VCwSe3tsLoaEiLxhuCXGa+PzbnG7YFqtesGWVTA7B
         9ZCYNsLq4pOfqy+ZFH4mNoJR2uaKsaiFdUjZ5eKC8n+tY/jI7v1/3gOaQhCpdUjPkFIA
         uEseC4HvyJPh5zfT5odEBqIR+qp7KTzKqcH8WjPVipNxtXyG6o6/KOGSQ/RaUhINTS/+
         nyNg==
X-Forwarded-Encrypted: i=1; AJvYcCVdwPpLqIyS04EZVwfVsjzN/P+hjASd4zwr3TB020b2jcNZO25VkH7HISy6VnQGw05TC8MfS17URgE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3oVfjkl2XAkLWEPCOHFQaK9V73A5biAeYkmCHe8xRjC2y8As
	4Me0Ta60RrCVku55RPg5clJHp8CDNmexo+vVMt9zt0HVFuEJrX4KZrOc
X-Gm-Gg: AZuq6aJsznHQKjDP4GcWAtjMIfNKi13Ga4pZu1OPj+if7JLRbw/xB9BcUCHJ46bv0z6
	U03rpl4Ojn0JtnCBjFGtX6OEp4zg6SQUaSYiNjd786x6zxH4QyiRmR0t+sqJjlC5Q/QHsv6bsgg
	o0qdr+ZXpmldj6iciFvDgODhJN9ypzlZ6IYcXLzKtlradevkescitLUt06LTNbJkl53n05ozH8B
	t/B14StGZBD+U9SfqovYTpnJIfvW9qQ9q1LKsEgrSE1xG+bStolOzqC9m4It6xbqqcoQ8QpGnrn
	GKW0Zg1nw17BTsfVEV6qWNsJhh15bdlbCoKOuEJRV2IdqpYtR2n2Q55kkVfPQz4Snp5Vy0fvOWg
	siv9kBLfDMk9Wz9a40/vVxLop5dSjNebhYVq8dondtjri6K4SDhJAQm2SEifrUXr+W76QmonjFd
	Siua1+PoR/AHX9cqxwQhJ/7R0L8UXC9q5BhYOZrvM8nm4hG/iwXg==
X-Received: by 2002:a05:600c:6094:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-4832021e967mr128737845e9.26.1770563130612;
        Sun, 08 Feb 2026 07:05:30 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm179326255e9.5.2026.02.08.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:05:30 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 1/4] docs: iio: adxl345: fix typos and grammar
Date: Sun,  8 Feb 2026 10:05:02 -0500
Message-ID: <20260208150515.14798-2-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208150515.14798-1-0rayn.dev@gmail.com>
References: <20260208150515.14798-1-0rayn.dev@gmail.com>
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
 Documentation/iio/adxl345.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
index bb19d64f67c3..3ca6a78feb5b 100644
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
@@ -78,8 +78,8 @@ Specific IIO events are triggered by their corresponding interrupts. The sensor
 driver supports either none or a single active interrupt (INT) line, selectable
 from the two available options: INT1 or INT2. The active INT line should be
 specified in the device tree. If no INT line is configured, the sensor defaults
-to FIFO bypass mode, where event detection is disabled and only X, Y, and Z axis
-measurements are available.
+to FIFO bypass mode, where event detection is disabled and only individual
+X, Y, and Z axis measurements are available.
 
 The table below lists the ADXL345-related device files located in the
 device-specific path: ``/sys/bus/iio/devices/iio:deviceX/events``.
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

