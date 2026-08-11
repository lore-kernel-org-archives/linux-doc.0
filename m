Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE70439F92
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491600; cv=none; b=fJtjTxY6MoPGuKveAhDR3YXUwu2Pv+cumHDmAhqKD8IqdjxaP0rjz8u9pB4W0SG7GITDPL5jeg5+ByQjABW47Y4tLBJ/9MLW41etK50VeYU6VBM93wK9fzFYSOcqgmBlUm/jDgshsTd3YWMMjlbGu4jok+J2Vu1jXsBVNa6+3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491600; c=relaxed/simple;
	bh=FF9HXWxDTVLhUqX4glSZuOoqPBEcZsxC5l1oGk6Ia1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEL4HQt1YYsxK7t1ob5ZzdSxftN6wVVX1s0GKy7fr0XOBye8eFXC+3AvSYyILbpZUerRqCFUniTcu6PLx99CPYErfNM/1Rizc6Mxv7vZw5YIB+J81SMkrpg3nDBP6hXioTl8xPAQuJHcGgHU4vIH50Fwp0nSNhEFFWH6ALzEjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=qsv68ErG; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="qsv68ErG"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so3301636d6.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491596; x=1787096396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txGUvPcweaXa+JQI6EskjE7GouVljVyZ+c/82mGniPY=;
        b=qsv68ErGS1+duev3DMrGvkWujj+Txk5an9hkJGNdUx4D5Bz7gcN5G0/Atq31LG0ARq
         499X24JlwsVBuc00TSMrYPsJsNvLjdNftETVVniZ/qIVTK5PxUH0YqWr/hO6mKYMyuek
         Rik5VjY7CD2TSCMOJuq3Ko8kM+UCGRnFHvfonFu9sLLDJFaEzEO2K9AyAI5tanZBdjgn
         p60QSh0wxeymqBrDsUUkeKlGthQtzatBaLt1MRK8/ZO7qaFyZHmNGoG8BeOj6YFfF14R
         V0NVqvTuWQl6gfDatt0OmAtRMS0NONzLEGYCQGy/0rP83xC8Pgj0M+dZR+vhLjcSpcJk
         0bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491596; x=1787096396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txGUvPcweaXa+JQI6EskjE7GouVljVyZ+c/82mGniPY=;
        b=mJD1JoSIQu4Uow9DyolOFbmg1+dmmsVS5gawpYueJEu4C9UlES3IhGaOA965Sst4Oh
         4aBU+pl6hAvkCf/GGob6+FuuxGRf+xG0cq9MscXWRiClMgpw7vZloQ5YAG8M4l7GHzyO
         Jg9YjQYvbNas+PwkfXt4gNjleCOl4MBv5D8VgQSUMqZNjWU167Tg+CXRbDbpvuJF7sKA
         tX6y4aeVYFXkfEkE1N+kt3ySjfaEh3AqBxajMap0SBUcVHCSUSOYrk57LZVqxty3LiGW
         vRLivwspkgTFjPenDNLDSqSsezMwielHzwL0DAvXCUZaOODWPe6WB5J1UP4WQNQEq5yn
         IwUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQef1YjRkTF8UelNpljlX7Y+dQtRLd8uOZC6RtbqFBnoku62Df09Kz3R+6aCvBUs10I/DpIHxQLis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TtPK+lVtseY8dId6oN66/JpDf8E+JxwNoe3B2DEwUxdvYwJT
	fibPH+zrX7rirWk3ygwgIIZUH9I4MMHyuAbaKu2h74u8wzIeG4Tz1qrvujOQq66aQpI=
X-Gm-Gg: AR+sD12KPfXlI0VuGToiob2cY/D+gIkmDE1Regv2XsohPOqo239kAYgVHp/J1efgEC8
	hPpTOfQeugGnohgIgG3J0cXFzSw0kzqmCPwD/W6S57QCeEy2iaoXM40USLgVLOeZDXTSgot6uVD
	nXeJRRWMPJWvw13Wdxi0/fZ8ODNR8ajHq5G+w8brOU+1pAzfrvVFnE7ZKEfoh+bO89/XC7CGpzw
	7NWijNAi2TcfLLFjiNLUiIYcNR0BaCjkSgC2m28dv/Z6pwXKAUh37kd8U3jXzHr4szoCRELQ+YQ
	NfpzIEWlaVeKrxjKv493i1UUSJOovrHiNkrupKhvPXzUFTl14/1u9Fk9RM9T1HTjQiAjGs5DY48
	3pPX1pSmL5iq46Mt1kCdrkFPxG+X6W+syrBUeyF3o6+xcW1xUdStFJ3hIZtcLdGme3B+a+vTehq
	k1lyYyG69hYJCr8kTYKcHAFtVjYp6QLWY9GL2Ms8lSRlyIsjPT8f4xVL2p1WWtgPTJdxbBjwf/+
	g8sLsvx2hrnZUF/NSWVL3sNsWFNET+u6Q==
X-Received: by 2002:a05:6214:2e41:b0:8cc:f074:95e with SMTP id 6a1803df08f44-90a701d8216mr8088466d6.30.1786491596359;
        Tue, 11 Aug 2026 16:39:56 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:55 -0700 (PDT)
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
Subject: [PATCH v2 2/4] hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
Date: Tue, 11 Aug 2026 19:39:41 -0400
Message-ID: <20260811233943.319729-3-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811233943.319729-1-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
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
index b86b87e33615..5bc60c6036de 100644
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
 
@@ -573,6 +583,10 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 static const struct hid_device_id rog_ryujin_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_ii_360_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EXTREME),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
@@ -602,4 +616,4 @@ module_exit(rog_ryujin_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Aleksa Savic <savicaleksa83@gmail.com>");
-MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin II 360 AIO cooler");
+MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin AIO coolers");
-- 
2.55.0

