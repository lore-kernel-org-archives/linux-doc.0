Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A31F91D6
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757835699; cv=none; b=G6SEsOblbJQCOAek5ecFmSW7FQ55d+aegnGc+JwMe0riHwIw6vaR+i8YRdIgmahDn6Ez5asbYEuNR5LDJWW8OcmtmGa1UAy9sIbJyFM9J+5D7/se2B+NfDYlFnoSE5gjxtEq+cuLom4QYYaTG0zIXW4Z8fD+apnE1J6CTa+2AR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757835699; c=relaxed/simple;
	bh=pmQMhinXOhrMn7twXeioOkcACZnshftCDLBST5UA2PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deWUIECriTyBb6CpFIlvLWdBmiXYUer/4+m+05pY6JDiEVFQgO9sKdDIROlL0hEWNu9CiPyOTFllrVP+KHDs91CpmdBissqLHDH40Tjd4WG85rzFp7M/SSzXzcgr8SAEWztexeU0/hmLyS6nl0Gj8D+Ic7yENzF9a6PfTNX2+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2s6XjVD; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2s6XjVD"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62f2b27a751so492063a12.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757835695; x=1758440495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVz0/HlF5BDemuRDpr/RdeWre5VSdXxEH0yfhTNk8c8=;
        b=h2s6XjVDG8ESFF4BN2Y0WoCpxUxuhCPWc5yiZtIjAYPim5ltN0OfYKsHkon//iklmU
         aIZg1EIXrvsYK5HxtcE8Ms9uUECdoPSqrAzwXJ7TVYvq54yOFDC/9VSF7fXvwdi6fvDT
         5ZRNRfE8UFReeyMrdV26wIgwck/w5WSESf7L4/qE2144EP8FMEFOfneZUXO1GWtDHhfN
         Y+Ub4I3qMVzYAqecTBodbNuzSGxQDHk4+pZrX9xTH3He8uAXFuqPOyLWJWc7aFJPHJcR
         utXvW8qvmGweqEPxNjODSX4pXHmdh76yA6BkmRIg8oCV3VDH+3Wse4bUdqOmz7430490
         EEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757835695; x=1758440495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVz0/HlF5BDemuRDpr/RdeWre5VSdXxEH0yfhTNk8c8=;
        b=W5KJ00eAyO3+mv51qHH2nyv7McJ4BtwUxGIon/OAiVqeGRJp34Y0OZ1w8GAv6o7+Gf
         +hvtv5BY3x7lsPSjR5ZrRHUkziewGChWJVZAqM9k/QRrjHnK4MSq1UV7npImuxnVPHCz
         DSq4fOJjh9ipDLVHzdBZW8lzPd71bQXBSnzT2gwQCOZf8Qm2w1Khiq0UXkDIfEPkfHb7
         N7F+RxS39QpeM37aKGFwgO5lnau64JC18DXJRrWaU0wT8R5S6i9wcdjgx3+xZI7dXh7H
         pd/p8qd/GBw8wn61NHCbKoHb1RFmZeAPnfrqlo5/4s0U8oe7BvEIr06hlAd0mNFCE1NP
         ZbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo1vlJ3MJAEtXEoAaHi1jsO2uCA2FPRiBrr4lvJtH/Ts3k/dZ8XGYG6veiv2EiSTrWE73gcqte8TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbM2O/bZo3S7UuNkgH+Y3aN+NMSgqdOWVcNzuwX2u4dzp+/fPb
	v78tyUpUoYjAiRdEZsyyc3/soyFWnCo8Bzys5OCbxZIEGkxy8HUMAnMa
X-Gm-Gg: ASbGncsFBvA+BlBzhAGuc8YwotBV5QtNZpqHE1gmhtMpuLV1oWwXrOYYRaIlose/ZYq
	Zh5VociLrm1yA5eMUyXYGWd4EddoWBjBcfrQFzjMbZsX92em1btsMdxiMMoJwHAXFpDPctJVqHB
	VKNtmVuzk9t6jOeWI0RCKV6s5Lw4ByA16PBOHx+TgyYJE3MbAhosAfTgXJolpvSQQXg3seDy3iI
	fWzG8gB0Fpg3cLBSaQZEeL+HtobUh32v2XnE3qsvDjRXfv0qiMRDCnTVJnacKG2U1tbdQBcd9vu
	0BxZTcD1VOuctdmlDfOdPeb291W0NnBL4oyOxXzVGxsG5O6Xuo148c05VX1B308V/sDAlHrtiU1
	Oat3RP+TmAR+7P/OeGhgFE/V1llENjmnv7dVOLkxueiq+53JO6fxD1A==
X-Google-Smtp-Source: AGHT+IGLYz4jfjdFSz+MYmIiQbcg7D/ueOUPZPKysgwUDND7TVCItTEm/+HVOxXfc/JBMcUVkJEbug==
X-Received: by 2002:a05:6402:4559:b0:62b:2899:5b31 with SMTP id 4fb4d7f45d1cf-62ed80b6b91mr7436333a12.5.1757835694751;
        Sun, 14 Sep 2025 00:41:34 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad741sm6752413a12.21.2025.09.14.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 00:41:34 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Shane Fagan <mail@shanefagan.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-E GAMING WIFI
Date: Sun, 14 Sep 2025 09:41:14 +0200
Message-ID: <20250914074125.135656-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shane Fagan <mail@shanefagan.com>

Add support for ROG STRIX X670E-E GAMING WIFI

Signed-off-by: Shane Fagan <mail@shanefagan.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 6a9c5f30e016..836d41373848 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -33,6 +33,7 @@ Supported boards:
  * ROG STRIX X570-E GAMING WIFI II
  * ROG STRIX X570-F GAMING
  * ROG STRIX X570-I GAMING
+ * ROG STRIX X670E-E GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
  * ROG STRIX Z390-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 32d4dd26aa84..3f6d89bcc8a2 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -614,6 +614,13 @@ static const struct ec_board_info board_info_strix_x570_i_gaming = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_strix_x670e_e_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB  | SENSOR_TEMP_VRM,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 			SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -764,6 +771,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x570_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-I GAMING",
 					&board_info_strix_x570_i_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-E GAMING WIFI",
+					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-I GAMING WIFI",
-- 
2.51.0

