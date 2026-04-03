Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DBF358389
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 21:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250234; cv=none; b=MSsXjCSG4gPedKW10R9KaC2mDrwV5U+6BgNHt5Bbl1bxAHND6ccz7ltLC1BXoKHfBe9G5W6w65CvwqIfCjv3AtswERm8HFhJDLKwf1cz96s+yG3sN1LXpMYudGQMubpp9RPiU1O7dcoMLgHn44zy90z+dZbZ45mJxgRyiAIfZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250234; c=relaxed/simple;
	bh=LXftvX8hx2pbwLHcvKo/rJLmJNm1kgbL0Eb4+J9xkRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfYRC73+J+MQd10xI5fw/E3Q1NHSTDCGJql1UxOddfZj3slYBqpAnqZBmZzzWrtyD4mDZnPJYg5aODjD3YT/zRTEqAmYqLWOZGovkEdUqP53/AM2iWrc3TuMwGKSZyFgg0h5srLnH8B6B5hLL1I+7xrQjlVuLd/hnVMWndJQPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+VkgDPf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+VkgDPf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1321207f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775250230; x=1775855030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngz23gOzMdtyswYMlfME9TO2H0rC3SBjwg9WNYEgHzs=;
        b=E+VkgDPfLmYDVtQ0yuzT5SXa8XXVeBbpxM5xikY3EC37CRQkMMn/FgOQe6m7wnEKPS
         8KbaKOOpIAPU0VUd5e/SAf34UPh5dVuPZBH0HmCmEqgdpbevrJfQ6rB27syzAuUUb4AL
         yAf8/W41uJqgPr/f9nq2hA9vcvqnsWSul5l1TyfsylPwa02TZvPQZYfeQ9C5F6IXi6rm
         j75KEtK6A1PetV4tNgjioGc/qs1NQIH3FLtDRZoGS19iOm6FsSGxBkLU5f7oIzJ8MU02
         v1FEoCNllNdRn7YDvHVItElWOGnYmZw9P/e987hicXXmb9KxQDx8saFJXPQKvt0IsrdW
         zo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775250230; x=1775855030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngz23gOzMdtyswYMlfME9TO2H0rC3SBjwg9WNYEgHzs=;
        b=JqWohD/aXhG2nZQ+fvDndoj0ywgBqgG3+8272lpB6bcblVekJMXtlvZkkri3P69VKQ
         bckdO/huvBAMR0VVWk27MguTD2X9ADkpUabjXSeE7Nzy/nF2LUlCf9PODHlEx9j+IegD
         cldPHGIUvLKc1wTuoWscXnc7FPNxZDBJhxXJPXCifqc/XVhvvx/kFu0eYRF6yJ2kEhVr
         MwNQiPSkX9SxlmHIkMtLM/i7Ks77bFlic8fnk0T+RtHtz6Or7BKOPcjFFZBoL2xdzfUW
         g851L9dMqsP3Vfy41qLLjcEdOsxH6ErpcyCsZP9eU7F18h5wgiZZDB7hkwXwk9PzG7sl
         sudQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwH8HcSYFPkRZms7BE3Au1iQQGIcwp0V7u85GfrdsrPXpgJozlt3o2GUxN2DWJD9Q5G6K9RX1n5a8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAfPtsEKU8OWOj6khyPjqAi24L/xxzvHa2ehpU93yXuxP0Wv9
	NS/KUAcfXd6aWTmCXA0WZ7z8ewjFadLaQvSlOqpyd5CyOMLzReeD8dpC
X-Gm-Gg: AeBDievDpFgyF1EKb2COUL+P3nd1b0q9dslhSHuP4CniQBdt25vAj0YY9AEAfzQKX7o
	CEqtHInP7iDAXRdWrzAmBFGXM0CvXtUfEEtCsMdXRT++5r+7kiXKbBsd1BLrmtm9kp+sdVin2MT
	v15E+YoEhpKSiKq3J1e/9Pf2x91TyKjHvfLhQ0kTBQq65yOYrK7tfnn4nT7KeDch1LxgKLKgqtd
	XqROz6R3ObG21OJ3mqqWNMsHvD3NcXCxneptsqqqH7sTjeUs4E4FqU2oC2KCthGA+Ie2c64y3PT
	Ged43MMxvP9WBW+d5dUUbr8qu9zvY3XtHHjrHBWf8K6hzotz5wDgdY2gNrd3V3IqOeQ5Hozm9zr
	NdhvEUk+qCZELWTwB5tb1cxyLPCp8YaDMwI7UQbtaUKol1jqObUxOdY5qgJIEyiu+KVeane2Tjt
	q9A22NDqRsvRDOioBJ+bB9LPPfJwPDzgAp6s2ab7MJ1zrkYBRoxkFD
X-Received: by 2002:a5d:5f92:0:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-43d2928fc60mr7222728f8f.22.1775250229407;
        Fri, 03 Apr 2026 14:03:49 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm18108418f8f.0.2026.04.03.14.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:03:48 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
	Veronika Kossmann <desu.git@rxtx.cx>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
Date: Fri,  3 Apr 2026 23:03:33 +0200
Message-ID: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Veronika Kossmann <nanodesuu@gmail.com>

Add support for ROG STRIX B650E-E GAMING WIFI

Signed-off-by: Veronika Kossmann <desu.git@rxtx.cx>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..e14419811aac 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -31,6 +31,7 @@ Supported boards:
  * ROG MAXIMUS Z690 FORMULA
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
+ * ROG STRIX B650E-E GAMING WIFI
  * ROG STRIX B650E-I GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
  * ROG STRIX X470-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 070bb368f2b7..8c53cd9ed8f3 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -274,7 +274,7 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
 	[ec_sensor_temp_cpu_package] =
 		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
 	[ec_sensor_temp_mb] =
-	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
 	[ec_sensor_temp_vrm] =
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 	[ec_sensor_temp_t_sensor] =
@@ -616,6 +616,13 @@ static const struct ec_board_info board_info_strix_b550_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_b650e_e_gaming = {
+	.sensors = SENSOR_TEMP_VRM | SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_IN_CPU_CORE,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_b650e_i_gaming = {
 	.sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
 		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
@@ -861,6 +868,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
 					&board_info_strix_b550_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-E GAMING WIFI",
+					&board_info_strix_b650e_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
-- 
2.53.0

