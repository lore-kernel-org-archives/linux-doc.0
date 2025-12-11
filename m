Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD355283FC5
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765479542; cv=none; b=Y1n/xgyuIKUDRHCFC3Mpup660eh0nCgR3kN7514ib2T4wqX/ynD4phOCay2h7MDn2UVHcmu+/Fnpy1+0cPn1eF5pYyggRDtU43+YEbjLF1pK8cSTAUPW/aQ5NA70geMI8lpC2+V1EnMoLqpaOzaJuPnh7eK603dnKgpA8j39+v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765479542; c=relaxed/simple;
	bh=MsOIIXRZXWInpi+6YrWnzz4Og0s5+tzlQfpch+ids+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S/TfKXd17TgdqY6oYNo35QpfUVXP5LgMmgUb+7Fal7zIZbIC2CIK4VOR1pQTeCJcvkHoY/e/TR7/VqBWp+AngsKOfTHyuzSrdpOF4CQSiqmoG1ngesKJo5qaltMDKU+1t1OrKAcCY2w326pb2KO/+ysxk32JzCiPlRbL8/WHnVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnSaAxad; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnSaAxad"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso273605f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765479538; x=1766084338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXm/1fe23tTgVaqZTTxGSrbclEuIKybaqnfjNM/NaT0=;
        b=mnSaAxadJ0gejGrMkg0tXv9lCMjomHQCZYz4CMWvg2PI+SUheYYpQVggvBSISGOWrJ
         7s6F8uNuSfd8+NbT4AQUbjxRjVfka4k6RLlhbxq3HAAh9O8hGYimWgb1UAyyuc7wmhlv
         5EZNn869xyRiSneyRisJg/o2yJaLB4jqh20XtXjrL7v61TORXHf2XRLDWwBL7qshHNbE
         jzrQentaHA50nsarqtuU6KqSk5PI0hy62Q+5N8H0MZ3cXjcuxixcevwSFRls/jSkktou
         QVPE84Z+3nf7Vvj52lD+dTX8ZeII7FwuWPSpodiF0Adt2NLu8U/CfR9PmcvtZ4InMelA
         extg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765479538; x=1766084338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXm/1fe23tTgVaqZTTxGSrbclEuIKybaqnfjNM/NaT0=;
        b=krypHQ3b6p+yPxXC7ZFNEeYqU+4WPKVhfJHVSQXjS8tBFT8O/hTeXf4Zz59V9LYEz3
         ooWkKNXrO2/FqulTKBzEm7llLOzxvePzFrTxy/muCjrsxHreESKwMXbABYDF8DQlB3q7
         i8OkujoI+94vLmbWx2eRlfF4pU/U0ItRVkQ0rLh+gushbg/0iUQRa5tfbF23VWUMvsk5
         UaGjEGZQtnLM7Q7l+Aj5wKQx29ACL/mc6NgKCwMxuw7uEyTaDRyJJAmE7qi2ZNBkGEFf
         UDG2Yix2iTGbBIfFHVV5vUljINnGLXqjGdSTSI17Mbgr6Sxck6iBsS5O4hOQ/deVklYp
         l9+g==
X-Forwarded-Encrypted: i=1; AJvYcCXjUhqUw7OQHAQQQortyO1fhl5n5KKJtHOtuiHCffrTPTFnyQ2tq9/LeqSJaU7Y6xengGFscBHkHsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwERzfE5n57cHjd7ZzBApGhGSGNk5g7KaOrO041uhdiLpxfCEq3
	ZU5cVK4hTEGrzV+WPgXs270LFe1ZvwxxMDtZWLmQn8EUZwH5As8miC9UUGLQG7dYVgw=
X-Gm-Gg: AY/fxX5YdpQlLn+q8/j899oNHtXSGHiPKOL5mc+qMPWxmBId5lv6NVu5wBaZY03nj69
	JEKWOKdBoiu2Z6T4h7wxsZwM4D2d8n2PemnJnU9si2jATRddSU1PE7WnRmvlCf35r3w+IppP3X/
	rWsim319CN6JZfXBljFjP3FcA7gIMzoy9kSeSmSiuuv+fcDW42zmArP4A8YWmydbgPtGsJlXJ1g
	EVJd3Zu/s/bZgi5LweyqQeONlgm9k1aHkYhWCEcWXJLtv/UdtHrZQS6S3QT1P7V8E3lXvuPHRHV
	fcrrMirJmLrAbC9SRR559v1VJ7O8CFgqaUeQR6scxFlHa3zPcP7jjsKQ/ga159iEjGEMHbyOkcd
	KlfPcByIS030XSlL2xCEesbWf/h8/WT9/Xs7L8m6nPxGanwsTwoaNXf3lSWgN68ez0NSN7aUGWH
	VSJXy2mOGRWLYBLFs0SQ0hOJYcd93a
X-Google-Smtp-Source: AGHT+IG013pfGbuA8PrYyUUTrBZvvlebxD1waVn4TsP9vOtX3ooXAsQ6AFa0OenHcPr1qqKLDtJBaA==
X-Received: by 2002:a05:6000:1acf:b0:42b:30f9:7998 with SMTP id ffacd0b85a97d-42fa39dbe32mr7690463f8f.27.1765479537785;
        Thu, 11 Dec 2025 10:58:57 -0800 (PST)
Received: from localhost.localdomain ([78.208.202.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70394sm7613731f8f.14.2025.12.11.10.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 10:58:57 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2] hwmon: (sht3x) add support for SHT85
Date: Thu, 11 Dec 2025 19:58:42 +0100
Message-Id: <20251211185842.66084-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SHT85 is a temperature and humidity sensor with the same interface
as SHT3x.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
Changes since v1:
* sht3x.c - dropped all changes, added {"sht85", sht3x} to i2c_device_id[]
* Kconfig - added information about SHT85 support
* Documentation: changed "Datasheets" -> "Datasheet"
* Documentation: added information about SHT85 address == 0x44
---
 Documentation/hwmon/sht3x.rst | 18 +++++++++++++-----
 drivers/hwmon/Kconfig         |  4 ++--
 drivers/hwmon/sht3x.c         |  1 +
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 9585fa7c5a5d..ea1642920295 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -23,6 +23,14 @@ Supported chips:
         - https://sensirion.com/media/documents/1DA31AFD/61641F76/Sensirion_Temperature_Sensors_STS3x_Datasheet.pdf
         - https://sensirion.com/media/documents/292A335C/65537BAF/Sensirion_Datasheet_STS32_STS33.pdf
 
+  * Sensirion SHT85
+
+    Prefix: 'sht85'
+
+    Addresses scanned: none
+
+    Datasheet: https://sensirion.com/media/documents/4B40CEF3/640B2346/Sensirion_Humidity_Sensors_SHT85_Datasheet.pdf
+
 Author:
 
   - David Frey <david.frey@sensirion.com>
@@ -31,15 +39,15 @@ Author:
 Description
 -----------
 
-This driver implements support for the Sensirion SHT3x-DIS and STS3x-DIS
+This driver implements support for the Sensirion SHT3x-DIS, STS3x-DIS and SHT85
 series of humidity and temperature sensors. Temperature is measured in degrees
 celsius, relative humidity is expressed as a percentage. In the sysfs interface,
 all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
 
-The device communicates with the I2C protocol. Sensors can have the I2C
-addresses 0x44 or 0x45 (0x4a or 0x4b for sts3x), depending on the wiring. See
-Documentation/i2c/instantiating-devices.rst for methods to instantiate the
-device.
+The device communicates with the I2C protocol. SHT3x sensors can have the I2C
+addresses 0x44 or 0x45 (0x4a or 0x4b for sts3x), depending on the wiring. SHT85
+address is 0x44 and is fixed. See Documentation/i2c/instantiating-devices.rst for
+methods to instantiate the device.
 
 Even if sht3x sensor supports clock-stretch (blocking mode) and non-stretch
 (non-blocking mode) in single-shot mode, this driver only supports the latter.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 720e8491ae97..955f6b4208ba 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1931,8 +1931,8 @@ config SENSORS_SHT3x
 	depends on I2C
 	select CRC8
 	help
-	  If you say yes here you get support for the Sensiron SHT30 and SHT31
-	  humidity and temperature sensors.
+	  If you say yes here you get support for the Sensiron SHT30, SHT31 and
+	  SHT85 humidity and temperature sensors.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called sht3x.
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index f36c0229328f..08306ccb6d0b 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -933,6 +933,7 @@ static int sht3x_probe(struct i2c_client *client)
 static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
+	{"sht85", sht3x},
 	{}
 };
 
-- 
2.25.1

