Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF51310774
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535377; cv=none; b=HrLG5swwe/p6utSc1CzGvyq5YqTviLrI1SgyD6yeZOqfoFCL/h+LhuK3IYey5NkD3Fc8yeeL2NrtOIKoXaGzdQsgu2CaRSTRNSpgCuVWbtIfE/ja08ohztrsri8b1KwAEhnGe06JUopO6m1zuOrIJ7IIUc/I8L14dnJc8oPgW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535377; c=relaxed/simple;
	bh=/SjArWhl91MYDI90bvd0/eW+OI/xdQ6cfMLtNYKxT40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BsKnMfNun/0hUlMC+swEQaKoSUdooOLcfyaQVwh8dZhIekyE5NniYytRRLQCvlC8Ke4EPa+0ZyK8apupKVeC2XInNod5s7kwBmOAtscPLg/9CXQsENK2P/kdfgp3/BcKyrK1ozYTzIj4yBy5Y46BUHcR6YWKpceMGLiW2gYO7xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PskTMlI9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PskTMlI9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso26578835e9.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 09:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535369; x=1770140169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uxXfz+R2HYXLp2KDrxuAaoGBhmk4g7IaH8iP247DXBY=;
        b=PskTMlI9fiiA67OGNeV/FB8hPFMa9NIueuYtGsh6yg43iUgb3sSJbnmijXMiAiUIJU
         Zk2+ue+aRHAx8se0IT5M4dll3qtTx6XqtcG4blDcUOD2xi8MKgsy+Xcs4p/uimW7Rhod
         AasLmN1hyCiH4ImkeDt0BVsw86UDxSW2a7nqSBou9y/G0YV3ANn4OyD59VIfjiKOdvjS
         NDV+8V57gKpuEfdCA0B9nKOYCTvmCP1iDwyY/FB+NX8M/jSvcOHhl1dOgP1kyxO+Y5uI
         70rKX2Aq5E3LwoU6tsmCa++XZGfENewE78pAxh/LL9xc+rqk9NxyFQYrhFPsLIbz3+tE
         IKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535369; x=1770140169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxXfz+R2HYXLp2KDrxuAaoGBhmk4g7IaH8iP247DXBY=;
        b=CfrbSmH3YwCMAQ1o8t1dkQ9JPuiUIPXk6z5i70HXu0dwYCM5XAj7QNSGT2xmMwTncy
         qRtif9bpUa3/uUs+6YlX4hC0VVMROiJQ+crUy4g47mqwEnZ+tezlATY2OSOtbOB58/O/
         mDCAB8vrqxtQcF9bcg2PAa/elWqOgIaZQZbSnB5TthiK16xGgbknLVhxFRAtFHd660j4
         2F5012zT5LQ5Y9ND4OTOUly0pbl73pSZnWQqU8/MGrrUSwJKM2ZHBsKC54IXa+H1pJ9F
         p8diJfR3lIKyXu+8pgGeLncjMqyaw2e6evOS8jPaWzJKRtRC/c6ceLZlmqwyI4KdyDV+
         9RIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkV6BumyevxqdZzJY5+eIE6C6eKI9FOiw6oqzMHeFcyixaCoCdk/dhV5OCDlx+QsiuRr/TsuuVims=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNb5qx415Kegzw4UQInxZ/v0AB44H+/UBst+y8Fe8ozpy2YONM
	x249akAbr43uq/YO0l2ty9hoar9ZEEqfjOL91AYWKXueK285eaoygbzq
X-Gm-Gg: AZuq6aJxUsrklS5YdY59kaukpZgxFpIca59U4X9VUsc8Y9lPYonX+UZI0rRTgOGU6Ov
	iLjZ4Mobr8+kxx9lcnH8y6fZ3O/CB0JyRBlzTvKUaskCEQ2I/C4gNkp8fIwNoazIryj/KzKIFVL
	mvu4Fwbfbpkhvnb4fGQjn/JODub5f13eO5R/ySUpi8HR05sqtNyPjbES7WX5UsXL9w6FBLnYyWS
	KhdaDfbIMpj3riu9FgGK/ENkfQPD7AIiOzb9iHWg/JlwWgtmV1T+Q61myo5b6iOCA12VwgOJNK5
	eyxYJ4QAVFVFiKH+gv103FO4yNX6HfFaTzcgntHPscJOvPtku2O3Jbqrk2svBJhDcQLqvqCxVkj
	RS1/86o3hGGF/Es99IqYZUSzQGffnQVaZpCAKHmpFQOKfcM6rpHXzV7W9lTuLVXQGPQIqghksnh
	ZGFHOnVaWSR+PY7+yjQsgHU+j7mlMbx8KeDfOybGM7neLoJg==
X-Received: by 2002:a05:600c:3113:b0:47e:dc64:f1c6 with SMTP id 5b1f17b1804b1-48069c3fb40mr33003035e9.6.1769535368338;
        Tue, 27 Jan 2026 09:36:08 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c4f3edsm72156975e9.15.2026.01.27.09.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:36:07 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH] docs: iio: adxl345: Fix typos, units, and grammatical errors
Date: Tue, 27 Jan 2026 12:34:51 -0500
Message-ID: <20260127173543.72423-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clean up the ADXL345 documentation to improve technical accuracy
and readability:
- Fix "latent" to "latency" in double tap descriptions.
- Correct the threshold unit from "g/LSB" to "mg/LSB"
  to match the datasheet.
- Standardize "axis" to "axes" for plural references.
- Change "generic purpose" to "general purpose".
- Fix minor subject-verb agreement and punctuation errors.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 Documentation/iio/adxl345.rst | 104 +++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
index bb19d64f67c3..020b512cdb74 100644
--- a/Documentation/iio/adxl345.rst
+++ b/Documentation/iio/adxl345.rst
@@ -12,16 +12,16 @@ This driver supports Analog Device's ADXL345/375 on SPI/I2C bus.
 * `ADXL345 <https://www.analog.com/ADXL345>`_
 * `ADXL375 <https://www.analog.com/ADXL375>`_
 
-The ADXL345 is a generic purpose low power, 3-axis accelerometer with selectable
+The ADXL345 is a general purpose low power, 3-axis accelerometer with selectable
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
+X, Y, and Z axes measurements are available.
 
 The table below lists the ADXL345-related device files located in the
 device-specific path: ``/sys/bus/iio/devices/iio:deviceX/events``.
@@ -87,45 +87,45 @@ Note that activity and inactivity detection are DC-coupled by default;
 therefore, only the AC-coupled activity and inactivity events are explicitly
 listed.
 
-+---------------------------------------------+---------------------------------------------+
-| Event handle                                | Description                                 |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_doubletap_en               | Enable double tap detection on all axis     |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_doubletap_reset_timeout    | Double tap window in [us]                   |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_doubletap_tap2_min_delay   | Double tap latent in [us]                   |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_singletap_timeout          | Single tap duration in [us]                 |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_gesture_singletap_value            | Single tap threshold value in 62.5/LSB      |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_falling_period                 | Inactivity time in seconds                  |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_falling_value                  | Inactivity threshold value in 62.5/LSB      |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_adaptive_rising_en             | Enable AC coupled activity on X axis        |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_adaptive_falling_period        | AC coupled inactivity time in seconds       |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_adaptive_falling_value         | AC coupled inactivity threshold in 62.5/LSB |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_adaptive_rising_value          | AC coupled activity threshold in 62.5/LSB   |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_rising_en                      | Enable activity detection on X axis         |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_mag_rising_value                   | Activity threshold value in 62.5/LSB        |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_x_gesture_singletap_en             | Enable single tap detection on X axis       |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_x&y&z_mag_falling_en               | Enable inactivity detection on all axis     |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_x&y&z_mag_adaptive_falling_en      | Enable AC coupled inactivity on all axis    |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_y_gesture_singletap_en             | Enable single tap detection on Y axis       |
-+---------------------------------------------+---------------------------------------------+
-| in_accel_z_gesture_singletap_en             | Enable single tap detection on Z axis       |
-+---------------------------------------------+---------------------------------------------+
++---------------------------------------------+------------------------------------------------+
+| Event handle                                | Description                                    |
++---------------------------------------------+------------------------------------------------+
+| in_accel_gesture_doubletap_en               | Enable double tap detection on all axes        |
++---------------------------------------------+------------------------------------------------+
+| in_accel_gesture_doubletap_reset_timeout    | Double tap window in [us]                      |
++---------------------------------------------+------------------------------------------------+
+| in_accel_gesture_doubletap_tap2_min_delay   | Double tap latency in [us]                     |
++---------------------------------------------+------------------------------------------------+
+| in_accel_gesture_singletap_timeout          | Single tap duration in [us]                    |
++---------------------------------------------+------------------------------------------------+
+| in_accel_gesture_singletap_value            | Single tap threshold value in 62.5 mg/LSB      |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_falling_period                 | Inactivity time in seconds                     |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_falling_value                  | Inactivity threshold value in 62.5 mg/LSB      |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_adaptive_rising_en             | Enable AC coupled activity on X axis           |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_adaptive_falling_period        | AC coupled inactivity time in seconds          |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_adaptive_falling_value         | AC coupled inactivity threshold in 62.5 mg/LSB |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_adaptive_rising_value          | AC coupled activity threshold in 62.5 mg/LSB   |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_rising_en                      | Enable activity detection on X axis            |
++---------------------------------------------+------------------------------------------------+
+| in_accel_mag_rising_value                   | Activity threshold value in 62.5 mg/LSB        |
++---------------------------------------------+------------------------------------------------+
+| in_accel_x_gesture_singletap_en             | Enable single tap detection on X axis          |
++---------------------------------------------+------------------------------------------------+
+| in_accel_x&y&z_mag_falling_en               | Enable inactivity detection on all axes        |
++---------------------------------------------+------------------------------------------------+
+| in_accel_x&y&z_mag_adaptive_falling_en      | Enable AC coupled inactivity on all axes       |
++---------------------------------------------+------------------------------------------------+
+| in_accel_y_gesture_singletap_en             | Enable single tap detection on Y axis          |
++---------------------------------------------+------------------------------------------------+
+| in_accel_z_gesture_singletap_en             | Enable single tap detection on Z axis          |
++---------------------------------------------+------------------------------------------------+
 
 Please refer to the sensor's datasheet for a detailed description of this
 functionality.
@@ -133,14 +133,14 @@ functionality.
 Manually setting the **ODR** will cause the driver to estimate default values
 for inactivity detection timing, where higher ODR values correspond to longer
 default wait times, and lower ODR values to shorter ones. If these defaults do
-not meet your application’s needs, you can explicitly configure the inactivity
+not meet your application's needs, you can explicitly configure the inactivity
 wait time. Setting this value to 0 will revert to the default behavior.
 
 When changing the **g range** configuration, the driver attempts to estimate
 appropriate activity and inactivity thresholds by scaling the default values
 based on the ratio of the previous range to the new one. The resulting threshold
 will never be zero and will always fall between 1 and 255, corresponding to up
-to 62.5 g/LSB as specified in the datasheet. However, you can override these
+to 62.5 mg/LSB as specified in the datasheet. However, you can override these
 estimated thresholds by setting explicit values.
 
 When **activity** and **inactivity** events are enabled, the driver
@@ -148,7 +148,7 @@ automatically manages hysteresis behavior by setting the **link** and
 **auto-sleep** bits. The link bit connects the activity and inactivity
 functions, so that one follows the other. The auto-sleep function puts the
 sensor into sleep mode when inactivity is detected, reducing power consumption
-to the sub-12.5 Hz rate.
+to the sub-12.5 Hz rate.
 
 The inactivity time is configurable between 1 and 255 seconds. In addition to
 inactivity detection, the sensor also supports free-fall detection, which, from
@@ -312,10 +312,10 @@ Configure one or several events:
 
         root:/sys/bus/iio/devices/iio:device0> echo 24 > ./buffer0/length
 
-        ## AC coupled activity, threshold [62.5/LSB]
+        ## AC coupled activity, threshold [62.5 mg/LSB]
         root:/sys/bus/iio/devices/iio:device0> echo 6 > ./events/in_accel_mag_adaptive_rising_value
 
-        ## AC coupled inactivity, threshold, [62.5/LSB]
+        ## AC coupled inactivity, threshold, [62.5 mg/LSB]
         root:/sys/bus/iio/devices/iio:device0> echo 4 > ./events/in_accel_mag_adaptive_falling_value
 
         ## AC coupled inactivity, time [s]
@@ -330,7 +330,7 @@ Configure one or several events:
         ## doubletap, window [us]
         root:/sys/bus/iio/devices/iio:device0> echo 0.025 > ./events/in_accel_gesture_doubletap_reset_timeout
 
-        ## doubletap, latent [us]
+        ## doubletap, latency [us]
         root:/sys/bus/iio/devices/iio:device0> echo 0.025 > ./events/in_accel_gesture_doubletap_tap2_min_delay
 
         ## AC coupled activity, enable
-- 
2.47.3

