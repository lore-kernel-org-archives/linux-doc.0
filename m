Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F76301472
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 17:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765303184; cv=none; b=KVy6e5jW8vP60s0IxkYltjGl0CPZqa2AvnYMMJZNlD5XLI6RftTk3d0HgNe3BsVGEY0ohxZxvHN2CYvaf++I/rSlN414DCzZiaa8aqdsKnT31ItAzJkwaTF/1GN4+7S43WckJdi1SiFxhQvqqHB2kHVK+eqVGhkENwbbojN2MqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765303184; c=relaxed/simple;
	bh=trUqytSqMzgyTg+cHrH5XMl6SvtDBdpUIJvnulwm2n8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oUoRoY7FRpfMHKZVlvOXcK4k95ye+aA9L6Zh5oZr//lDLMMVU6g6xDlvNs3x4HupOVdhvd+Uj4HwiLYGvRZNhb/xI7eFE7AaaQfofJSVAO9XvtIYa3uHnj4IO4IQQcyJU7l63q9P4XmJwV1zTh2gbKNpDuoXLlCEKw16bAQsHfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmz/VyN/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmz/VyN/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e33956e76so2737458f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 09:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765303179; x=1765907979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmI+L2xdkb6qqsUj5IfS911OpjhSCBl5brd80v2kE4Q=;
        b=Dmz/VyN/GAZ88hS+JtbYYPJ+sROEJdQTpKntKtOwWXUHjYzrvjbskKl13q+8TPXPre
         pHFPsddarzJgtp9K7iAAsiK+qvMQt/uf7mQO2PsWlOjSHd0fzVmrMc7zKO0DQFcj2vra
         o+3ZhHVLO4gSTQBUUEhgFUSpQV/Vqfx/IdqqfvWUDoL7iH2CpiqaAVxYOkOgGDd2dTO+
         OQ/ek0fZ4Znf8Ce7F9HGeWGYU2seU+XBT5f8+QkBBbovZQEIHu4JV12FMJal5EMVhLNB
         I1Iac2gULvzRPTf8gj0NYsERVoAlcAmzP1T8p0B2kZQtiVCRwG8HOAfayYGI+bW9xppD
         BKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765303179; x=1765907979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmI+L2xdkb6qqsUj5IfS911OpjhSCBl5brd80v2kE4Q=;
        b=aNB+Ij2BOi9xzPaBZEjPP2Wk0qUmEHx+vrO5c3EYyO27xgZ/KNBrsAhkyLrFvjXlkP
         pIMUMT0C17BItaAWmTN4BeVksZlKMW+eOcjMxJUsFgBkkUgF+cFjTjHVknufEmLfp4ba
         mZhl1wACf2r340jk4gTCntJuoXpyfs1biO2aC24TJrtRuaHG79niyU/DNPO9M57iufhl
         +wZj6W1zrpBHNRT6pGn4NW34565qIyoetNC4ThOt5NxJUdD8n8TGLqf8ZS8MVsrZ2wXB
         xmizP/iJQIyfOk9u0XN6IsB47GzTbtoQhgwFJJr9467qkqIDHGeBpUaLXDzY1O/W/T4L
         YWgw==
X-Forwarded-Encrypted: i=1; AJvYcCX2whSNWr9SP3aDz631l10MmDkkfzUh+e+BkDHtVICcE4RSVNTT2ty8xwblRcRmWFMZx0Wdu0RGU4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLH48oyUbDZ33ioPrXc8eG6/4+z1rg4tmqGeBEg6xz+/fBcx66
	WRyurMJCtIm9w+PJoIqVE0ty7vFKEUfwaAfqFsak2Eabub/3L08Lj/TvHUo6Azpw
X-Gm-Gg: AY/fxX5cMKRDdNyckUvmtGla6nmjyS5Y3hPbkFS6UVUucxOkEZSdSgYI8Uo4J9IgnLs
	bKVE++fL0MoeM38OvJy0VdokvbOqnRGbNmU6tWQo3LbWNu402tjW0y0qRgeSjDQhM1LWM/QSnu/
	yCqxtpnZkTAEf14taqZ27WVWYPBfxOC5ly5HeWoBffPXZmEi9Z10DD3LGyQAH0525aH9YlsBHhW
	pyt5k2rGRloJ9+Ip9valy43P74pAn5Twxphid1uJgXCZPSX7v7d3ndqxEWyXxJxZSLhx3MmCsyZ
	wuJnXdB9MKMt9Qc4WmqLltfNkghpaFrdrsyYA/95WXO6pGjUWXIkm0eyIWk58BZU2o6sI1K1avs
	V1cAb6XWMUA1yYSr7dISXAsQysqJQtpVOz/cDKQVzbC2VQwzcfvpkoVwDeEhbqQZbtMi4YhvXTg
	Il7VHuYxHRLO8z6xvjqG+QVdPBVwU=
X-Google-Smtp-Source: AGHT+IHIbk+NsASFN8Yl14A2F3NzrEUX6QerypsmMAwYamGfQ0x3MH2j03asm9A62GHFwl5iknBkWg==
X-Received: by 2002:a05:6000:2f83:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-42f89f0d880mr12463733f8f.14.1765303178927;
        Tue, 09 Dec 2025 09:59:38 -0800 (PST)
Received: from localhost.localdomain ([78.212.211.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe9065sm32726241f8f.8.2025.12.09.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 09:59:38 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH] hwmon: (sht3x) add support for SHT85
Date: Tue,  9 Dec 2025 18:58:49 +0100
Message-Id: <20251209175848.5739-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SHT85 is a temperature and humidity sensor with an interface very
similar to SHT3x. However, it does not feature alerts (and therefore
limits).

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 Documentation/hwmon/sht3x.rst | 11 ++++++++++-
 drivers/hwmon/sht3x.c         | 26 +++++++++++++++++---------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 9585fa7c5a5d..25c7428f0a77 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -23,6 +23,15 @@ Supported chips:
         - https://sensirion.com/media/documents/1DA31AFD/61641F76/Sensirion_Temperature_Sensors_STS3x_Datasheet.pdf
         - https://sensirion.com/media/documents/292A335C/65537BAF/Sensirion_Datasheet_STS32_STS33.pdf
 
+  * Sensirion SHT85
+
+    Prefix: 'sht85'
+
+    Addresses scanned: none
+
+    Datasheets:
+        - https://sensirion.com/media/documents/4B40CEF3/640B2346/Sensirion_Humidity_Sensors_SHT85_Datasheet.pdf
+
 Author:
 
   - David Frey <david.frey@sensirion.com>
@@ -31,7 +40,7 @@ Author:
 Description
 -----------
 
-This driver implements support for the Sensirion SHT3x-DIS and STS3x-DIS
+This driver implements support for the Sensirion SHT3x-DIS, STS3x-DIS and SHT85
 series of humidity and temperature sensors. Temperature is measured in degrees
 celsius, relative humidity is expressed as a percentage. In the sysfs interface,
 all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index f36c0229328f..eff915d31452 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -63,6 +63,7 @@ static const unsigned char sht3x_cmd_read_serial_number[]      = { 0x37, 0x80 };
 enum sht3x_chips {
 	sht3x,
 	sts3x,
+	sht85,
 };
 
 enum sht3x_limits {
@@ -668,6 +669,8 @@ static umode_t sht3x_is_visible(const void *data, enum hwmon_sensor_types type,
 		}
 		break;
 	case hwmon_temp:
+		if (chip_data->chip_id == sht85 && attr != hwmon_temp_input)
+			break;
 		switch (attr) {
 		case hwmon_temp_input:
 		case hwmon_temp_alarm:
@@ -684,6 +687,8 @@ static umode_t sht3x_is_visible(const void *data, enum hwmon_sensor_types type,
 	case hwmon_humidity:
 		if (chip_data->chip_id == sts3x)
 			break;
+		if (chip_data->chip_id == sht85 && attr != hwmon_humidity_input)
+			break;
 		switch (attr) {
 		case hwmon_humidity_input:
 		case hwmon_humidity_alarm:
@@ -908,16 +913,18 @@ static int sht3x_probe(struct i2c_client *client)
 	mutex_init(&data->i2c_lock);
 	mutex_init(&data->data_lock);
 
-	/*
-	 * An attempt to read limits register too early
-	 * causes a NACK response from the chip.
-	 * Waiting for an empirical delay of 500 us solves the issue.
-	 */
-	usleep_range(500, 600);
+	if (data->chip_id == sht3x || data->chip_id == sts3x) {
+		/*
+		 * An attempt to read limits register too early
+		 * causes a NACK response from the chip.
+		 * Waiting for an empirical delay of 500 us solves the issue.
+		 */
+		usleep_range(500, 600);
 
-	ret = limits_update(data);
-	if (ret)
-		return ret;
+		ret = limits_update(data);
+		if (ret)
+			return ret;
+	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &sht3x_chip_info, sht3x_groups);
@@ -933,6 +940,7 @@ static int sht3x_probe(struct i2c_client *client)
 static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
+	{"sht85", sht85},
 	{}
 };
 
-- 
2.25.1

