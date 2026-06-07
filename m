Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B9338E8A1
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780835927; cv=none; b=f/+Y8zVm5ZIFadPRUMCPDIWgVGqpqd9ZqN3YJqVzsJB1xa/Sci3n+S7giKxVTdQcsJV2+TYZQ6O3GDT/FeutBARbD7JiZa78XXCDWB/TRtOe4J4+Ogi3t+125OiFYqVKS32FBvNbW3UMucD5zYQpI0NIGKnaSeVcr42Y2pjCCkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780835927; c=relaxed/simple;
	bh=FjCBCQBvhI4rXGY6dvIpXGNM2bbD+NZ1EykLABFEHf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YC581rVwuRN0oZbc9QycE6bixNAHMBGj7i+GkDhhVDbWJUYHqeZOImjvdQxFwdazrhlhEJNrGX0Rnnh8joH2XuzYjvbw4utkC6FB3rspcIzzmThjt/+ObbAaqmPMFDm64oguodkm1rorV6+GnXQqY9EorH1wZ+/fB3rHqQTUlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Idz9DF9T; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Idz9DF9T"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490af320e2aso38233915e9.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780835924; x=1781440724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLMHQNDlrf3MjGpXdmjqPlUzy/HY8aTD4m3wECplFhc=;
        b=Idz9DF9TQOzhOhj1Ng6PntYcrZHg8vU/BVX7kkf27SXIFyrJBmfxg3BKJ5d+yfN81N
         l2wN/zL05odfqtmz7pBVj8LxFHztYBoqbZBbkLhYUYL70SkgSSEjOAPuY1JF0TLrNj3f
         qY11kpYo84imhvsUHFqg+P8NV75cPTxpP87DwlSc2ov00EXNN/lRzHpdA+tvMEQWjDZ7
         cONKbdTsGzeKY8fkiS9ak/b5XIF5DUkuM4ZI6pqgPBZf4XuPLEos5R/vYgIxOZAME+Rs
         xk5C0yIDyCz1fuQmhzUSx2Gx5vDQRDDPDRlnBIxiHk4OkqN4B89VcPibq+XkPBXWkEGG
         ymAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780835924; x=1781440724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLMHQNDlrf3MjGpXdmjqPlUzy/HY8aTD4m3wECplFhc=;
        b=UfKC8hPt1QBPgCnRfumu4xDR3ujOcwELrmosLC44kk1Bzc6FBYmaQOZa/ht2nnH4a4
         JnwqGNZPz8pqEhxnmJXFrH2CyxuPTNjXMI6KCAHBOgy76bn9xURBFVLpAHwtCRroXlZy
         NNMEcVchqeAXhwyt3OIVZ+1sMiheW7gwyMLAcdsp07jFAYKvxVkSjgwi5zYebABEPIn+
         6w2sPWLyl6iC6bXT1PiOiSROWd3epoa9v+gHHCkiYtZs+VRMlzipHoAlf0ebH+iAap02
         pjF8D4knYKrz+fok7TjeIjXQKJb46TswyPXdLH2y0LKK+u8xT/+ltyiy4nf1E/+KUi1k
         7MAg==
X-Forwarded-Encrypted: i=1; AFNElJ+toGaAGE9W2f2E0a0x+pFRJP/b75FeDPFqXblMPxW6H6KrV+3MdEUE5Z9MV6tzHJW5Mmymq7xCS+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvnsBp6Uhc+yQDcPA4hlK7esoKF+DRmwPRcCh7QDtLah5hyWiU
	6okkfNzwu+FpDFMIkLjU7ZB7kPxlcTGrOo/Mw2r08K0QGhIBDCxYK++J
X-Gm-Gg: Acq92OF0Wm/MVQU+pEpN4+FKq0C5oegqUkujqOK1WKz1BZgpSmbwEsjWGw9wkm61gPH
	9pDxTg7jfjZo7XM2EkKbYchPyO/O58X964gV9pe94EgbB2GaJztgfRfy3U5jnZ5dy14a+0FSMEK
	pedXl8gDBO7zX4wxIXnqEhPrfDuLW3mtxW/comu7RrrpC10wCbxJspoLLjwJDHA5ZFTEhrAHaTE
	nXjjUySNMZEV7whdCeJMV9sf/C1fZdHSvGhrPRVYi7cHXGkBK8Uh6dkVTS34EMq+fZw6rmFZU23
	HKQZSX8M+1vub5II1sVTG0wl759GIvxsBznjnA/IyUcDZD85XvkTofaZgZJfAcNRZuzSFXQHVp0
	uT/llJmGj7LxNF14oAJj1s2m/8Eq9AGrsLnyB+kajRsjqLidZzGk6IEPfMmzxKaDMjU61CO+L+T
	JNUqfpqthwEQFwlf3R5++pR0snal01cdSLwvAwBCDoFm2Qj/EKI70KAkxr5NIF7Q==
X-Received: by 2002:a05:600c:c0d3:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-490c265c107mr160929215e9.1.1780835924164;
        Sun, 07 Jun 2026 05:38:44 -0700 (PDT)
Received: from puma.museclub.art ([185.189.115.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d4891csm150256475e9.1.2026.06.07.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 05:38:43 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING WIFI
Date: Sun,  7 Jun 2026 14:36:16 +0200
Message-ID: <20260607123626.100630-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board has a similar sensor configuration to the
ROG STRIX B850-I GAMING WIFI, but includes an additional
T-Sensor header. The patch was provided via GitHub [1].

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

[1] https://github.com/zeule/asus-ec-sensors/pull/105
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..9669e729bb8b 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -32,6 +32,7 @@ Supported boards:
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
+ * ROG STRIX B850-E GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
  * ROG STRIX X470-F GAMING
  * ROG STRIX X470-I GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index b5d97a27f80d..27e39138011e 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -628,6 +628,14 @@ static const struct ec_board_info board_info_strix_b650e_i_gaming = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_b850_e_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -868,6 +876,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b550_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
 					&board_info_strix_b650e_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-E GAMING WIFI",
+					&board_info_strix_b850_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
 					&board_info_strix_b850_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING",
-- 
2.54.0

