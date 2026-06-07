Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1514D1DA23
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780843497; cv=none; b=DvfIbuQckZb9QeNZokyD+h2qyc4L+wjW/Cx9VLHNr+rX0H/c3vwTUB6hz62goiken2GORC+ixFUUF6uIi9KYlVXIAeyM7y2Nvo3psNLpGrsbDVPhT0zL6mAF5jmEuN3zXpB/KAHNgdRKY/ziZxq3mpSLraDoxZ07RVRMrAFGFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780843497; c=relaxed/simple;
	bh=kxINBfME1DycLCerbjJmzqLubr59t4fd7N5s0uKnc5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/aV2BuW1c2408VhOlqjlCqyigIBxs+KAuhVoY4OKy+I0WydfxEZfPzC2Dq2GdmhMu/qioaXqKUD8pWsb4hFl0g02HkaIJK4m8C3/M4MG5oyypEhJP9WPOxAKnVqCGHQplZoaMLnW2K03EXGkeE2W1rWL67SJNUOR0f9aIeuESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjdzt74D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjdzt74D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a76757e5so21541825e9.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780843494; x=1781448294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSKb4Co68AkxuyD+X3nlTFn4HBTTLSES8AUS4z8O11A=;
        b=cjdzt74Dy2a1LxF6dinhaFdRPKVwcP1CY+anY2e9mrlqETFjQq+oF1NPAn/OggJ/to
         EZLCicGGh5hzsyodE8fMyVoXVd5SWm6m4sQHsnYfPttxK5ToEyQZuXCd2uTTcjsosc+x
         CHiuZO46eItnb2q30Fjplme2dYT/5do1kMlE2RKRS5W118t6Bf4yXDQsGaKwLdYSsiXJ
         1FYCT2ex2sPtbyOUu5/aVklKA4V/zCaKqDH7qy1898hbQbKxNHTz/SVEKiykj+ONXRPq
         4YaQ2AUoALYPejm0ecpFLHpm65aTAMnZm7nuCP0gYhbqaIzoAfCnhoT16ITONY4BfwPR
         dmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780843494; x=1781448294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSKb4Co68AkxuyD+X3nlTFn4HBTTLSES8AUS4z8O11A=;
        b=tR+gUUJJ+vTYt9uFjaYbeiy3oVOXc6gBzrLyIdwnSEJ2LgvF2ukHtFNtu+w/7aYWsQ
         j9QEaezrGZUa1HLnHw1eZvoleg59v1petgu1QEXA6bwX3Qkcm14XkoCnmrIgfTGLDrs5
         0fiuy8vjTU/kpYi6p8HFSByvaPUMSUMJcSokmxL9UV/dAZKPGji2+VDVP96+dYPL8ZLB
         qfLBEiGRmV6dmfQqNcfb1jIvab2uE+bmg+SVMHlTBDOax50vnzplyj1ZC9FxDiU3V2rz
         qyFbOue1bZfS3NhlWaHecgWASq98PmWq0oBElS/hbrAPcvABApDKlFOmu234JnlLJaSR
         Vv5w==
X-Forwarded-Encrypted: i=1; AFNElJ+8yC1UR6VN9uQSKDyomkqHtyxvbEK5OpSGHv/C3zDVxaAd+rgAW50U7k7pzSdl+sRGIFfcx6r64bE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqGT/N8Q8cxHHuVvgg2OJZBley2qdkQbrsfopg8LdSVLxH2WtB
	LabJ+a4Mu2OL4tkp3l+b2ddOOeZ/VEiS23y3BFhnxZOHn+I2mVgwoo/Qd22atowJtt4=
X-Gm-Gg: Acq92OGo3sEgZRkODns9w8AhCpuRYZsB1bGdIclgU2MFYz4tq4X7qwxyRpFyAIuh7RV
	/Wvg8vZvAXxy/CtbR1SoQavcNd2rF0q5PNy2wSXQdqHOkONj81hoJCDrL7gcKNX8dDe//umdqiT
	oHDHJ3RMxh0UsluVloiRSXY/lAoUQz/upJkI7DJAuF9FAJUMbNyZe5ETz3S3Dcer6S4JKDdWnEI
	LeXJNXWv4k+fRHIbTFEeujO8iBc6iXPjNq8ZUoh9Nv0/U+5nTqKZVAjvOxthzSTsT0H9OOs04OJ
	Rs8ZX4qzBSexJ/ges1cr9kDyZeT8HpQhLaNJZOQiITtUUYFObXiD4nNLbsQPlgceznKC29yu6ks
	LGzA77KE+HnrjMqHoBJQCLGQjInWElEwdPGPUF6OZRPBP0nUunRrCQbWwiSwbwtrcwkA1ixSHUH
	foV0yjTGdjYMAlmpLUrDPNnyQj6D4+p2/j4KUR4caYEHAuCUsmdlQ=
X-Received: by 2002:a05:600c:5488:b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-490c25b1277mr228088655e9.12.1780843494385;
        Sun, 07 Jun 2026 07:44:54 -0700 (PDT)
Received: from puma.museclub.art ([185.189.115.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm314427815e9.8.2026.06.07.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:44:53 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Brian Downey <bdowne01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
Date: Sun,  7 Jun 2026 16:42:25 +0200
Message-ID: <20260607144238.128259-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brian Downey <bdowne01@gmail.com>

Add support for ROG MAXIMUS Z790 EXTREME

Signed-off-by: Brian Downey <bdowne01@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..60f1a6036538 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -29,6 +29,7 @@ Supported boards:
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG MAXIMUS Z690 FORMULA
+ * ROG MAXIMUS Z790 EXTREME
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 070bb368f2b7..171f06a4f120 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -509,6 +509,13 @@ static const struct ec_board_info board_info_maximus_z690_formula = {
 	.family = family_intel_600_series,
 };
 
+static const struct ec_board_info board_info_maximus_z790_extreme = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_700_series,
+};
+
 static const struct ec_board_info board_info_prime_x470_pro = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -857,6 +864,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_x_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
 					&board_info_maximus_z690_formula),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 EXTREME",
+					&board_info_maximus_z790_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
-- 
2.54.0

