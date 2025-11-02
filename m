Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FE2D8DCF
	for <linux-doc@vger.kernel.org>; Sun,  2 Nov 2025 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762083690; cv=none; b=a/dRzOo43f5Zge+X0CHrgTgUfAdVDTBTsulgQ5DEUqzAXRJD+uJDYSg9SkFFf9NtMvPP7Nu/8XpUc6pK2PJUbb7/Q2PJ1/5Ev/Gh5jka0yVp4NzSi+tH67HzVadvazLv2MDH3/D4W+Ne39/+2rB5W030nNeIIfDiVkjJnb9fZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762083690; c=relaxed/simple;
	bh=VE04nYBxHQRsPdLjqT4ucuOmSxe8WDwlwIgyAhJMqM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GU0xcwHxLunmmsLybxmh8fvJXh7ykc3+nJTDKnRMkOyWxoVUufoKfG5VHgDjKnuPVpej7//hbYV6rMxsPnSlkkmprbmD4qFxqr7vkXPAchDKZDXk2XP2YnNuiDqtV+syFchenL8JV+Lz9Yen5wX5JYfioPN7ZzmmnrSA7fzTMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhS6ZDlW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhS6ZDlW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-426f1574a14so2237028f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 03:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762083687; x=1762688487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIsrhF8fKl6xpi4S7c5S0dmkUD1dE7woU6dFPC4oses=;
        b=KhS6ZDlWU/qRiK8YDzB7GGYfqqQ2nxJbtF2Un4k5j1bvqJCO+5/TPucUeQcp+93oTQ
         2iSc3K19HnolbTUL27bo04iMopQEQTMmleOgH3peFe9g8kZfzAaEqq/KgkOEp5qPJQ4y
         Dd9/EncN/epgCKPM6Dv2PQtKsmm/9Jmkyo0jAa4bWpCVvWhtKLkqCN+FLMNwlNscYJhU
         KLY+uprwHF6wUn+o8oQDc/BlCU7oz/gK6YbAOdtqBGpsN/ODRLwJWLc2Xbwo2bIwkboB
         TDm9cGxX8uZ/7QulpxCAR3cmQHEhE08tcLRENyNbtvR2uGBC/9c+08a/pM1JtC93i3HW
         y4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762083687; x=1762688487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIsrhF8fKl6xpi4S7c5S0dmkUD1dE7woU6dFPC4oses=;
        b=rKGPqp7FsihKcD7dnM0HfelcOjaM5uy0vF8GeIbYbAFG0t9VXBW+5A6T/Igs+PpPoE
         n+QSeJ1PFtNDQ3V6sJ6uMdkiduR9fQfqrLU1vg4kLYVzl4MduAdNTfbMfAS7l7V5YOgu
         2VaQKCcb39J21W4XBqjnqg4J/b9XGMquV7ESBgEE1nY1NdGKlKfubN+vqHXCm/eozgnf
         A5o9F7xGEyGeigEXkHv8knNYWzYMmwKI/8zFMstS308Akucylsyq294uIMB0oxV0ln6t
         u5dYuM3ZONeNyPiiERwDKWzTI2sre2XaORLS1Jit79hFLEgn+DqUxcgrUkqRVS6wqcaL
         hQmg==
X-Forwarded-Encrypted: i=1; AJvYcCVVUsaTyRkntt2kfOGnbtUNMu+1l99m7npZxdSsreM5+eWE4/YEIchGBqLmtGpe+ikIuuPBcaIurJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKa9amkoXihn7pi976PmsokBH45lQ0rjKhx0lu/EZ3mgd1vH6d
	mdycVrDqB+uEQlwpvwbwEkK6+MkX5UO66z+o+p1DgX/kKr4jgKgQ/nK3
X-Gm-Gg: ASbGncvPi6FAftD73JdnHfRdoFZ2OrmLO4FRj5bv2gqO6CQYORgCvKUdEjgaDY/6SVT
	szJxoOSp5TF6hCKfszADVOE60FTFc4Q0Yfvc7lgcqVikwD7bK7fb7PkDOMXBgxN6QvSre6hCjzd
	OTsd76mIEHiU4xLRIHljzZqMpeO19TzmHKKsl+ICglcPOzMlg6LqVRAbgiIbnQyEvo74PHRXb3H
	IHyQRNrqsMsTrDQ+fhDmqvhTNj4p/57a+ovkN3eOtiVWkkkwge9ThHJZw2HoJlVRfNOvMeNe7MQ
	YmpWjBjb16+oim9PSXb8G+o9XhfkfdoE1Ps1omKa4O7/CqtO/I2CnA8XXvTGZSyxOI/gWpMSqHd
	L1w+ENrHYt79ZEql/cZivQXeLgiMHzj7KLYlcQFuQ7ivdsJBg2W/9uKYJ24kkKGbnOfexs7IchL
	YSlBZecWYv/0qG+0mWqg==
X-Google-Smtp-Source: AGHT+IFAW1GPGUitxzTNuVNXNVuU2PyIJB0/vZWm1b5inLEgfI1x1Obc+/SLssdUjGZyc5c64jbrIg==
X-Received: by 2002:a05:6000:2489:b0:427:608:c660 with SMTP id ffacd0b85a97d-429bd6adc06mr8057538f8f.59.1762083686851;
        Sun, 02 Nov 2025 03:41:26 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f4732sm14138925f8f.43.2025.11.02.03.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:41:25 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X870-F GAMING WIFI
Date: Sun,  2 Nov 2025 12:40:28 +0100
Message-ID: <20251102114038.283396-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ROG STRIX X870-F GAMING WIFI board.
Testing done by the board owner [1].

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

[1] https://github.com/zeule/asus-ec-sensors/issues/83
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 2666ed3a8ea3..f0a92ce30a02 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -36,6 +36,7 @@ Supported boards:
  * ROG STRIX X570-I GAMING
  * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
+ * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
  * ROG STRIX X870E-E GAMING WIFI
  * ROG STRIX X870E-H GAMING WIFI7
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 7f35eade3a9b..8c5eadd8786d 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -645,6 +645,13 @@ static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_x870_f_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -810,6 +817,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-F GAMING WIFI",
+					&board_info_strix_x870_f_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-I GAMING WIFI",
 					&board_info_strix_x870_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI",
-- 
2.51.2

