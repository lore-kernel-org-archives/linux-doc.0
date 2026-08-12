Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA42427A10
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530946; cv=none; b=P7PIKCT08ZOvwSFGtgUJO8i2CjruvLGhPfF6KElDItl9+pmeiBcB8F/hAgq+szOSaNXXL9o20E98/KptKtBs1+YWxYHK/WGBTrZTNreJZqRCpyB2XU7+2hRcDzLo0cTn9bdJkvegmROoVj1Nw9Bdh7bOQZsFfyVEjYQ5L6wt19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530946; c=relaxed/simple;
	bh=FQJBQhgjZb1RX/e4wc0m6QodCj403YS0hRdwNpBEnLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQ5cf8e0cE8/0DfWaWFMd5Pwosr/cWlct4X5lgfIsz2vJ22j+13EXtAMmXs+b/Pgc4g9nQV96qJxQw+GQlMRpt2P/HfkojzEW9Bz2GxTqlzo+5nUZrG2qrLpHyjPozqufznwKY7p9eQy8ilSqr6X60Nd3jKbYsyxdnYZ6I7lSv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=LjovySjG; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="LjovySjG"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8eeb4508f29so5776126d6.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786530943; x=1787135743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qz5IS5RcDj1noT8ncMYxPnyxq+wgolMrwdoOFMS+O4=;
        b=LjovySjGlkOKOymAtv7CT1Wa11yufXwtyDF97DJG3BHj7+d8YHhGtRgjlsGEyZmjSj
         H0RHxeBKYy8RAAhHKuqUYRLqcQZVkjDh4t8mzw7rAfX4KH89qaB7yTwbGFk2Q8Y2LJok
         OrUq+UYNq3w6qb+5DLl+M5O+EYJOtJJliBegmjAibQehcaTpU5Lpx5q6Z3UAe1cgbrab
         K9hejZ8QnJxFE5kGF9vNA0yAhQiz+0juYACPfnPRku3wMV1vQoXsirRKpuBGEid/yLlZ
         v3qSH9WN4n3pJ8TUrd5VxeW/rzWsLbqdhd93C/nWAc8atlBw1/VJT8zeBSMtsBXubMeV
         hrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530943; x=1787135743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qz5IS5RcDj1noT8ncMYxPnyxq+wgolMrwdoOFMS+O4=;
        b=BxmVRiz968SsSLSt3tgL82g3QWOAL+x3X55xIwYaJaeLKbSIs63QY4NRbsZGLASXgZ
         bCoGZ0zzSfJNM5JaIiBofEVgxN/1Itjbzar0g1x6unZH78d+e5+eGDxc1YgxLysVl9tJ
         prr5BuZJEzMP3gtCuSRaS4f9DyvXZB21x+/kqbaeqBB4wpAoyYADaohI2FHFOtTSuijL
         K/gfpNFi/p/tnAqDriQaoKHt2/eRwjeOZ243Fhb5TbtlAcBeAVvhdG3s780evDim/Hgm
         t/qNUwuJdsoOSUwD5b5T0R8B9VlPiVjSgNZPcztjfsF8exfAnkKnrA0nEpBDFbAx5Ch2
         LgvQ==
X-Forwarded-Encrypted: i=1; AHgh+RryNIIlcD2QH8+814MvGoFN3ODCtukLgUCDz9ezB0LTK0lWLiiGPQ8K65z/h4qV0jVW1tRIkfh1fYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMFCfzvqcNLeWZ8tiZNUF81sI8i2+MJ0Ru3aJQ4Sm/rWcUCLw
	zE6DFxzSci03+4WuhUXqQaNATCPIW7c/II2QAv66y/xm2IcMpdCCpjNkPNRP70qjsBQ=
X-Gm-Gg: AR+sD11WW6l+IHmtCZpnLrEkLrCVU7meq571hBoNmMiobpFU5jZFmeEi/vox9RYeY67
	H8MvaJruUQ/kkimnqBwmbsh0M5Cw/wn7TNbL2z8m9d1GU6m3zBpT17YbRiaApD6FQPwkQ5KVtot
	Fyf3ZAMhNSWgDsOW5Jw/0vhRiCAadJbtyNri9NJlhcsX1q+1tTmHaAouCUfSX3L/AHObKOnpZiT
	af8cwRN1IcqmsKkkjc5zKgR/DEyjdu+JQ4BWUtO74yHG7Xc0r+dg4FLviv1v3IIjq4PKo1uadpX
	fPF5J0wtQbWMSmWRV8hY6RLhYWpe317fuJtqmMS3qS9wh2+3ZC8S05JnqvbjxjP8n6Zmyk5V0p8
	+RPxTkzAT8Div4doIg/2rBMB6gMLMBVV8WiIU6nPMje6ieXUVJEU+PQHudZS864xcQF8F2o3jI4
	ObCsKdR3BQXOEhtQBLkYsZ83tvC9e5y9MFZA5ugHVbEvdCXQn2lGKyb6RZcOgarxYklDvcq7Sf+
	PrPu/gncXKiz9lGijWHJ1VWkDFPOPukRQ==
X-Received: by 2002:a05:6214:5097:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-90a6ff631ccmr30481976d6.14.1786530943279;
        Wed, 12 Aug 2026 03:35:43 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c29e942sm18718386d6.12.2026.08.12.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:35:41 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
Date: Wed, 12 Aug 2026 06:35:31 -0400
Message-ID: <20260812103532.395049-3-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812103532.395049-1-renari@arimil.com>
References: <20260812103532.395049-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROG Ryujin III uses different report offsets and a different
cooler-duty channel from the Ryujin II. It also lacks the separate
external fan controller supplied with the older model.

Add model data and USB IDs for the Extreme and EVA Edition variants.
Skip controller commands and hide the unavailable controller hwmon
channels for these devices. Update the driver documentation, Kconfig
text, and module description accordingly.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 Documentation/hwmon/asus_rog_ryujin.rst | 24 +++++++++++++-----------
 drivers/hwmon/Kconfig                   |  4 ++--
 drivers/hwmon/asus_rog_ryujin.c         | 18 ++++++++++++++++--
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index 9f77da070022..cfdfe3712f19 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -6,6 +6,8 @@ Kernel driver asus_rog_ryujin
 Supported devices:
 
 * ASUS ROG RYUJIN II 360
+* ASUS ROG RYUJIN III EXTREME
+* ASUS ROG RYUJIN III EVA EDITION
 
 Author: Aleksa Savic
 
@@ -16,10 +18,10 @@ This driver enables hardware monitoring support for the listed ASUS ROG RYUJIN
 all-in-one CPU liquid coolers. Available sensors are pump, internal and external
 (controller) fan speed in RPM, their duties in PWM, as well as coolant temperature.
 
-Attaching external fans to the controller is optional and allows them to be
-controlled from the device. If not connected, the fan-related sensors will
-report zeroes. The controller is a separate hardware unit that comes bundled
-with the AIO and connects to it to allow fan control.
+The RYUJIN II includes a separate external fan controller. Attaching fans to
+the controller is optional and allows them to be controlled from the device.
+If not connected, the controller-related sensors will report zeroes. The
+RYUJIN III does not expose these controller channels.
 
 The addressable LCD screen is not supported in this driver and should
 be controlled through userspace tools.
@@ -33,15 +35,15 @@ supports hot swapping.
 Sysfs entries
 -------------
 
-=========== =============================================
+=========== ==========================================================
 fan1_input  Pump speed (in rpm)
 fan2_input  Internal fan speed (in rpm)
-fan3_input  External (controller) fan 1 speed (in rpm)
-fan4_input  External (controller) fan 2 speed (in rpm)
-fan5_input  External (controller) fan 3 speed (in rpm)
-fan6_input  External (controller) fan 4 speed (in rpm)
+fan3_input  External (controller) fan 1 speed (in rpm, RYUJIN II only)
+fan4_input  External (controller) fan 2 speed (in rpm, RYUJIN II only)
+fan5_input  External (controller) fan 3 speed (in rpm, RYUJIN II only)
+fan6_input  External (controller) fan 4 speed (in rpm, RYUJIN II only)
 temp1_input Coolant temperature (in millidegrees Celsius)
 pwm1        Pump duty
 pwm2        Internal fan duty
-pwm3        External (controller) fan duty
-=========== =============================================
+pwm3        External (controller) fan duty (RYUJIN II only)
+=========== ==========================================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 43418633e2e8..81a9a1d40eec 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -293,11 +293,11 @@ config SENSORS_ASC7621
 	  will be called asc7621.
 
 config SENSORS_ASUS_ROG_RYUJIN
-	tristate "ASUS ROG RYUJIN II 360 hardware monitoring driver"
+	tristate "ASUS ROG RYUJIN hardware monitoring driver"
 	depends on HID
 	help
 	  If you say yes here you get support for the fans and sensors of
-	  the ASUS ROG RYUJIN II 360 AIO CPU liquid cooler.
+	  supported ASUS ROG RYUJIN II and III AIO CPU liquid coolers.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_rog_ryujin.
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 80563ce38519..79e5b6d6dae0 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * hwmon driver for Asus ROG Ryujin II 360 AIO cooler.
+ * hwmon driver for Asus ROG Ryujin AIO coolers.
  *
  * Copyright 2024 Aleksa Savic <savicaleksa83@gmail.com>
  */
@@ -17,6 +17,8 @@
 
 #define USB_VENDOR_ID_ASUS_ROG		0x0b05
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
+#define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
+#define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
 
 struct rog_ryujin_device_info {
 	u8 temp_offset;
@@ -34,6 +36,14 @@ static const struct rog_ryujin_device_info rog_ryujin_ii_360_info = {
 	.has_controller = true,
 };
 
+static const struct rog_ryujin_device_info rog_ryujin_iii_info = {
+	.temp_offset = 5,
+	.pump_speed_offset = 7,
+	.fan_speed_offset = 10,
+	.duty_channel = 1,
+	.has_controller = false,
+};
+
 #define STATUS_VALIDITY		1500	/* ms */
 #define MAX_REPORT_LENGTH	65
 
@@ -576,6 +586,10 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 static const struct hid_device_id rog_ryujin_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_ii_360_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EXTREME),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
@@ -605,4 +619,4 @@ module_exit(rog_ryujin_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Aleksa Savic <savicaleksa83@gmail.com>");
-MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin II 360 AIO cooler");
+MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin AIO coolers");
-- 
2.55.0

