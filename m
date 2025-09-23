Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0A2FFDF3
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655786; cv=none; b=TWdTOJgJew6hcT8pqOn0FtsxOjFyhJya9YIUJW17vWoqtXQmNN7Xmai/mqLOAxCt25YtMrhT+UusgloKWhVGTVML4AmDcgPu9/uFGFsr2+IEp6jP3RNDJ04sshtmUWguJ62r+ALqZumXzV6NnzxbLMHTmafBFg+pR8VEgnypAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655786; c=relaxed/simple;
	bh=bNPIQa1hzSUEp21UxvqcCD/DXZb5BW2TnmlqseXqEIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRh8nCH/iFL8ak7VeyLexjNITyInxcPUE0OQSSxU2/T88eYGlmDHpFBz1joIgclx4c1s97l7DF/J2CTimlhogS2q5Z7rXluosbmqFu1v7gfL4jFiBOChTcMoHnLJMGaahEuC/3b/809QrLoB+rjIFsl38ZjZJOR355vzfRINjwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ctc9sJDq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ctc9sJDq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3164978f11so130909966b.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655783; x=1759260583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvvR3TD1/hZKig5BdYwMjCQxtKWaPvP8LVDupYgSUE4=;
        b=Ctc9sJDqwo8AQm2YQNJq3lrL3mgGpYCtgSAb6KnN6fjA7GCiCeUiGb4xJghtJUT8/P
         CteZmkXX+lwZgcYtFIbzyCb1MB77uaB1o9mtMMX8ZX15pOJ8ecQGE+D8ikbTxRI1eVDw
         VMMgmbzxQpGu9z4chiII8xj6bVouRypev0ePBoJN5DycEnqNoClHNoFcwIbN5tb6rpd2
         jS7BRpJXB8vc8P3yfNNaZ4iuE2j5h0JnWuWdxf3ZiZ9UHQvd6uQUmr+MSXxamMoAUJaC
         83wT7J2qVken2nrKdgUCpaYZoLnEfmqSz+k+5g2ZOFB0dvcQThAM2YPNuxD159DJA5wD
         YnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655783; x=1759260583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvvR3TD1/hZKig5BdYwMjCQxtKWaPvP8LVDupYgSUE4=;
        b=TAQfV16de6XbGvR7a1syhZ4bN3H2zdVKzhR68w/NHaoFjRVVxABA8vOSq9Si3oVm4i
         IsLdhrs/tLr3Li78kWBwvBBG9vgwSijUVnYMbxQ2rRrJj4QugqilLlWrp6K54rXo4XZr
         uzUk6bk7DoJ/vFTsWof24IU6W0NPShrxTybiocO+UGYjYk9vA/DT5mGQ2Np7Xeyw5WB7
         sJJdH+x/6fZ7vvVne1o/4KRMvTJ4y4lJRymdm9SsJeULC/MtO5ca7nROo3+abzk3XBeb
         NgfudZJWzgUv5LnEz23owyHHY3NtoUeQ+yYBchXEmtm4UnUZ7+lwQUeowyv/5VmttpY2
         SUIA==
X-Forwarded-Encrypted: i=1; AJvYcCWH1aEguX2H8TEEYINbjIR4XzvYW/KZh1FEEhYzG8Y3u49i1qRHzbUN7uKyhsDyWAXTTSKhFXF7fIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qa111EAt6pAwQvSYTe4sIJG+RsnqkC/p7KWoXUPbGOiYjbkI
	AUwH1haXfIU611YRCdCuGr4froBalBB5lK6lILCXNYiD2f2XUSP6304aiOyqAabO/24=
X-Gm-Gg: ASbGncsLsZP3arjs6DQUUlkb6K4iKmVP5ImCroqGeNIN8RPGWuSatKQvb0D99Y5W+GT
	889mrH/dluSgNRFQYKN3Ux8W3p4/KQqJkzn3bwEsoHbAJtFdPAy2wVmA+VyYq+aLPMkUINDFXYl
	zEDj23JK49xXqVERTWwQN0k0n0Xs1EP6yl4IdqAYOCDqv+L53Ht+52QDIfAgYJ9Wl1yNQHygLVp
	mCZJqnFUdKBl0lUJPQSPwd0dIpSm1za0aLvY1CEEZV8E5HGYH4gKhdISlY8Z+pGl/i1n1liW3Lq
	QgE8U9Uyg8xpd1R9R/Fpv5KbPuS2uPpNJRdre3yTIA8M5UyCU/y904f3jXikzswfgAG8tOMkyUr
	pUka5k9g+XIQr8wKJZe4kHHzafN60nxc8THj2rHuM1T4=
X-Google-Smtp-Source: AGHT+IEI1qY18abvzA/F7kn9QvR+PwKMk7ak3Dt4UcaNlDekyOebnd5iqa0LFl9nA8m6jghAwB8cpA==
X-Received: by 2002:a17:907:7f8b:b0:b28:f64f:2fd3 with SMTP id a640c23a62f3a-b302a17b9e9mr306236866b.35.1758655782832;
        Tue, 23 Sep 2025 12:29:42 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271f895sm1370710466b.97.2025.09.23.12.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:29:42 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI
Date: Tue, 23 Sep 2025 21:26:55 +0200
Message-ID: <20250923192935.11339-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923192935.11339-1-eugene.shalygin@gmail.com>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Copeland <ben.copeland@linaro.org>

Add support for ROG STRIX X870E-E GAMING WIFI

This board uses the same sensor configuration as the
ProArt X870E-CREATOR WIFI motherboard.

Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 4a99b65338bf..a5a58c00c322 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -36,6 +36,7 @@ Supported boards:
  * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
+ * ROG STRIX X870E-E GAMING WIFI
  * ROG STRIX Z390-F GAMING
  * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index dff13132847c..ce3ea0333fd9 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -635,6 +635,14 @@ static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_strix_x870e_e_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_strix_z390_f_gaming = {
 	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_VRM |
 		SENSOR_TEMP_T_SENSOR |
@@ -777,6 +785,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-I GAMING WIFI",
 					&board_info_strix_x870_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI",
+					&board_info_strix_x870e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
-- 
2.51.0

