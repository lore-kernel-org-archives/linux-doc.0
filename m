Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CFD3D6CB4
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540620; cv=none; b=ueko7OZbKoEJFRsWabegBd1fG1UQ0CB8RGY4/OUGo1yW2Rmu4aVkf1WL6HPXRcPNOBCjNBEczlH0dZpxuoUeNjfarELzE4U2HJDWPC1m9YBr5fEyeD11qvVlwu4w/0CzGJfWmbR9/cwx+3eklHXsk6lZdA6+7Ir2p3eSZNzpQ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540620; c=relaxed/simple;
	bh=TDMWQykWRLH+xUnH6dEBJSSnBtEoUJ8mDeu0JnQ5ykg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFqiyg2jbNMiAQRVlgeB5h++wVt+scduDJ/Fpsw6gupMN1GJeyhzKEJWAMsdNlqvsviencCi1+UmIZ8sYznYEaoPXh6f1fvWkKzHw73llK/roTlk5tMGUaflT5j96vrfzJ7fwZEh+m+wwnUlyyj/5dFLo2NfjsO8g+p5XFH/aKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcmKbYqi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcmKbYqi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47d6c634f45so71006f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783540618; x=1784145418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PaQGGp+ro7L+efkwpTdWheFx/o+vkLCN2v+zKVvSvAg=;
        b=ZcmKbYqiVcMyuzKc4D9jDtykAF7KSPC1oacuUhHAZ8PbA/aNA29OJhqRnViL4bq11+
         2YMMLyUoTp4nGSpLquun1Z2Yp+6k+1BakUB08IAnwSorDE2mRbBfeZzrndv+vvM8g8TA
         blazTaRXiPAWnckhBnvKB11qyDMX/hdIL/ibGNkkhYMAI9OD+JlYiNpNLbTWjrkxnnUG
         DOr7XA9GOkwCU5VKn9XS7PeALz51MxxFtHCz8RIzXu7qtm26pCyeaoGDgFCQcDGe+Zkw
         zCI7iYw6dyJvNiRmizARLnidpMmHJl8vKIPn2mCqWAwdL6knGAxlLtpo+ZairUis48o+
         aKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540618; x=1784145418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaQGGp+ro7L+efkwpTdWheFx/o+vkLCN2v+zKVvSvAg=;
        b=V74mq+UVZYuOQ24Ic40ewPtb4eSZBlnzY+MFewmEPTYlLHz89gdNtJRtoxLXFh4nQE
         GuTqD8cRvwVtXVxSn7lZ3aeboWfA+rbmmqz721T7IgAhb4suy0cQJt+lCrep2nwnkdBG
         InfBRYoHmjEC6XcvYmXOziKl4xPrHrTCQMrpO1Yo8FU+1yl2Uwn1NgF53GHh1k8POtRw
         YYTicYHeqhOPzcXkkraaDt/wdFK9iO7tKofQodcUAQS5se6S92DnjTwSgIBqHLBU88zY
         +zDc+bxqIIE6W3FhnvrKlHY39d2sDa54awdP8tEvQ+3uQyCYShDsz+/VnFvVlpWjKdZA
         H+Xg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4guQyDRRtE3NQnu35yiB+6bMHaH0Othou8Q2M5cUagfrKKbW/Hkbu1lBQK097gnFBx8KY/MnuRjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHmKldYIlLCr46MEEItSLwD/zdAIDzBj01KWELWnhJlNsC6nxy
	cfT2RwVrfjhRmRa/3CWYEmmjDdvJSy+n/gwV6dLqYxJso3gT8YN5IV+c
X-Gm-Gg: AfdE7clMpQzC9NCo9N/bf553OF1Dhk79H4iNH0PJPOGOVXYA/e11U7nWBDtLd8rmELF
	SAu+7/bZpS8dTyWM4QVy4AQpzl2oc8gVyt3U60RDrBI/7/S6GOyk9n2biOTdS1aAu4E7C4bjO8o
	bx1RYg2G4SzmR/sW3YLjGAgPdBaNAiAOGIqmADtAXE1WJQgNm33UJ8psteWsKFO9+cPhnH3HqAw
	OmQE4KGjDuXw9dS+4AFWldfbmG/BPsYvzWsiYtllf4iNiXtK28Uj5k6Vz/MzSqHxbO9uTQUmu45
	4B+wSAb2UO4pcd8UYmq4kAEOPfWL2FvUuqdDaE6Qn2YNqlcek1zGAAIvqo6ZTxmz583DbmSX5p5
	+ozHxfLWO949OINTD8o/f2m/mkxpOGdZONi/0jPDm/gzlZcaAULPI1sV/2pkFbnLNrAuJA255ly
	qL1W8HYahJq6UI4aj/KGB3FTcQMjplqOw=
X-Received: by 2002:a5d:5f53:0:b0:47d:e0da:fe6e with SMTP id ffacd0b85a97d-47df073179emr5473702f8f.27.1783540617473;
        Wed, 08 Jul 2026 12:56:57 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm43090783f8f.34.2026.07.08.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 12:56:56 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI
Date: Wed,  8 Jul 2026 21:56:26 +0200
Message-ID: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>

Add support for the ProArt Z690-CREATOR WIFI board

Signed-off-by: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 77a709517437..d76e6356acce 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -17,6 +17,7 @@ Supported boards:
  * ProArt X670E-CREATOR WIFI
  * ProArt X870E-CREATOR WIFI
  * ProArt B550-CREATOR
+ * ProArt Z690-CREATOR WIFI
  * ROG CROSSHAIR VIII DARK HERO
  * ROG CROSSHAIR VIII HERO (WI-FI)
  * ROG CROSSHAIR VIII FORMULA
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..389f8ee129fe 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -386,6 +386,8 @@ static const struct ec_sensor_info sensors_family_intel_600[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
 	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_fan_water_flow] =
 		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbe),
 	[ec_sensor_temp_water_in] =
@@ -590,6 +592,13 @@ static const struct ec_board_info board_info_pro_art_x870E_creator_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_pro_art_z690_creator_wifi = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PC00_LPCB_SIO1_MUT0,
+	.family = family_intel_600_series,
+};
+
 static const struct ec_board_info board_info_pro_ws_trx50_sage_wifi = {
 	/* Board also has a nct6798 */
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE | SENSOR_TEMP_VRME |
@@ -859,6 +868,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x670E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X870E-CREATOR WIFI",
 					&board_info_pro_art_x870E_creator_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt Z690-CREATOR WIFI",
+					&board_info_pro_art_z690_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI",
 					&board_info_pro_ws_trx50_sage_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI A",
-- 
2.55.0

