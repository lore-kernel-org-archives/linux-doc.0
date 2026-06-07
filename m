Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1BB36EAAB
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830458; cv=none; b=t4HO21/h91FsIuUCuStHdGAhye0rCqPalXC0GYSxHU7YoWEgWYaMxbW/AY1PLwbWpaS9pa0qQhklhGm+TBq2WFpOWQWLzW8u2FWxyM4Dvh0iHswvkCEyQc7Oh5cYVIFgcXt+AA7/tKzapa0uSrwhOuFc+p8rJgGfYDMQArhSSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830458; c=relaxed/simple;
	bh=aHNIAZR547ORAamD69jxHP75MUld94pHEiLDYWNStfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5zcg2u2sZV/i+TGBLES8qQug8aZhwhpBHSEdCE/zLaF++u1g7Wq7TyY5qE9ZTzrSO1Zf1lKzLHpxm9Rgi4CWH3cB06T4pa7zkfTtdPxC0Rg6dxXEmlWCwyVygqjG4jXZ9OiGfhAaUz5FAoeYOPph52WcB9ghsbUiIlNMDEhoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJcaUhbc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJcaUhbc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso37804215e9.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780830453; x=1781435253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnxpnnpv+j0cUNV6Xmi0dq5s+yph9snS3pWDXjBt4ho=;
        b=QJcaUhbcz1UA5TnZJsEdvEijpE1dPRgfUCVehf5ZGbPI752x3ytIioeOiGoeWBtZMf
         MraLtqWIpmytvulPpbllPry3mKXiaBskk/0nH5KRm2Go1saroLBu0lbV+u5n/u+7DBvz
         ar5TWVUEP7/GgKU4+vT/+q48v0iYhVJ+f1UanwN/yjjHw28wrObac0P5L6SH4wBE9Ozg
         2e1Yltu/JOlE0GmmtwSRKBFGbsWkWDCoRyk9wYSRa0i3FXwk6rTtjxlBLlYLYV9gYhUK
         bxRirw0/E1Fu2fjwRMGRt69DuloetTBHxqikwXPP9cN3NDaJa9nWvu5b88JJrEovC9Z8
         pe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830453; x=1781435253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnxpnnpv+j0cUNV6Xmi0dq5s+yph9snS3pWDXjBt4ho=;
        b=RsuwyI3xPdyGZXXNZ0oOlZF8Vg08UWRzbBhouZ1EsW0Sp1IVi9P7zFA3jcGxBwFhfk
         1KjkgbM2OMJ4nDkm6BDrRgQnxNTKEw76DqoFu6m6Xb0lMrusM+B5CiiztY2IXzfxBE/S
         qG7rU1eGg83YzlP1jff+A6DLmBQ6M3WHRphAd3N58RV9XIpiOGL3uNFJtRAOCZnCxGIt
         mLeC8hn5qorm4kYLVJF69v7shW0WQwla2BHwkNoeLKNlKS3U/RCmxynWF5GfKDkuJHDU
         AdcXEC8l7+CIh5dZItVIPSPIgCeKXpBR6zaRD6x4ePbs0gUMvh7bKX8in0OSHBKSTlas
         tv6A==
X-Forwarded-Encrypted: i=1; AFNElJ/7QWfBTykHk+nSdqYpKWmyBnhrthP9Tmvmy39O53PbZs4KtvXW+XWghyLLzq/r0MAVeQuEh4V+d5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4UVnJMRd+sNs2CuvcMjBwXyv0iQ6ltMqdr+ZxeTHOrvGp5Ax
	NancZEdO7hLUeQm7SFvKigE3bmxsaLAddPux0fDQhfpe9iWZAZ3jUf01
X-Gm-Gg: Acq92OFN66ScRIfwH22vuInPM+HDp3SDq1XfpGhCHgvRikt96UwOGahtoCSj4ref3Ke
	7b35Vdwr/86V4zEwxv1wHzJqfib7H07BOm5X9hW6HNRr0f3yp78pqxWb1pIOyg07NGJv05OfTXN
	j+pKwpAqfG2n6KGbuIHdw0kR/lHTLUxTI5DwBOjhKzRCWboSOsADxWSIpOdd+b8iJXrR8CuyQdQ
	xlF1L66yAUQQygu4u8rR8xQpyJv01fSZqFdq+BYBrRpCYoW3jEiMTal3oAU5L/ETJ86j4Sgkoft
	aI1+v7W2VzrTrLh/dlLzX4J+a1iZ0EmRQZDdQx7LeWDqx2cTJ4HUxYAgk0m3+Qf8sLDvOLxBp3A
	wM5ocqpVRd85c/x5Ihs+kjxzFyE2wj7+j0ZO6+5qRBNDBp9ZwQZ1QKvSXwVwJJIk8AxDUAptK58
	qgfVRrsRrU/d/ZxkyXKI4zdtbSH6+mAvFU2Fl6EnLHvJOn3F0zX5fe
X-Received: by 2002:a05:600c:a011:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-490c25ee058mr185298245e9.22.1780830453061;
        Sun, 07 Jun 2026 04:07:33 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm41711527f8f.18.2026.06.07.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:07:32 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
	Oleg Tsvetkov <oleg-tsv@yandex.ru>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
Date: Sun,  7 Jun 2026 13:06:10 +0200
Message-ID: <20260607110702.84599-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607110702.84599-1-eugene.shalygin@gmail.com>
References: <20260607110702.84599-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Veronika Kossmann <nanodesuu@gmail.com>

Add support for ROG STRIX B650E-E GAMING WIFI

Signed-off-by: Veronika Kossmann <nanodesuu@gmail.com>
Co-developed-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
Signed-off-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 070bb368f2b7..f351bcfc5679 100644
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
@@ -616,6 +616,14 @@ static const struct ec_board_info board_info_strix_b550_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_b650e_e_gaming = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_b650e_i_gaming = {
 	.sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
 		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
@@ -861,6 +869,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
 					&board_info_strix_b550_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-E GAMING WIFI",
+					&board_info_strix_b650e_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
-- 
2.54.0

