Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91392339A8
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757839228; cv=none; b=OrZbuqwBpVRUMWof13ZW9HkXkqjbFGnasPV7wtv2TMkDw13GYUAHzouqBjzX0jb0uOtGqL6EirW1lHt54XL3I/lejvtEeqiORXIOg569tI8MVYfASLuJKQ2wBMK33CcSIIBzo4GlSW0VDB+q0wAcg5/TnIgtQwIYvFhNORHeGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757839228; c=relaxed/simple;
	bh=hvqqhKDwn0KttZ7YI/pFa/dPygt7+4qJkMXYteumt+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeGAaMWjsdSvl66PTIsTAV2nqONQOnyQ3eB8+doPJ2NggkSDV2quTIQM9hi2eS0B6H/8n2pKI/eoqy+aRCNpt4oKu2avjsI8A3G09itXCSg0cvDPj3ToM8B5mk3lCnCVtnZ6dHm0pp5lDXlfmPIjKSDZYx5tsZq0yQPRNpXNlFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At8o9FRl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At8o9FRl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0415e03e25so414182266b.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757839224; x=1758444024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8jAyzV+acKcWO9q4mFH0eEwR5GYgn/NUD1fgTglKnI=;
        b=At8o9FRl2eAk38KzuOlRAiZ/cRwD8tV1W6ynXM17DfpuMari9+LTOfGeZAH8Ll7RZm
         QILe7XZ95daOSh6ypaZoYjMNGQYilv4YuLKN9g9gxQlCanSsGhDeks/+MiXvaoAWlEJb
         nZxnK8vCC2xVKXcdx6IdYdS5SKyAmN12H+f28GEqLpkJRiRIhYYzARP8HuGpT4wANb7L
         IDKy2SvqfGAvkv7b+Z/GRb8+E9N5Pwin8T0rsWMml4RGqymhYe2GRrcFrJ1WofniLIWh
         IwL4DQzg1NpMrMkTIJWxQHADCR6lvNLz3wH/UF+q3pnhpShWnVnZBGI4hokEYk+x+3NX
         JMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757839224; x=1758444024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8jAyzV+acKcWO9q4mFH0eEwR5GYgn/NUD1fgTglKnI=;
        b=CdLaO4DIWbIy/X7IAoxp0ZIWSvR3T3E2sDx/LkOstXsV+4KMMwe2veROVY9Ihz7CXO
         lCxm89pxhqyzVBO8zFKdsCflOWey1x3qs4ea4EUee3BgJxBoW733RpiLPeyyEgRYEI1Y
         2wVnaLZd1pZX7ZuozK5c2ac0t3K7LfgFfSMSkf8nJxejFSnigdGkBm9eNIpjRdccBzc2
         YkbQ7tVx9iWXkEEK2teuMLyg66+zdkeWPIb20+b8DqvmtMU7ttBeyjfHEssDKwT2EtvM
         1Y7nMA6zDKFilWTJHZjRoR9MW9fifUa2LHNEl0tuhZPBcAq+7W6SIRRD7rJ7aFvsL4xh
         Lmeg==
X-Forwarded-Encrypted: i=1; AJvYcCVBUYgoN3Zeol7H2480r4rYbBWHzUYSdESAN49gaobTMLZQM3A7YaOZo/mX/hlDrte5lHnll9S0ImM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLbd68q0r203MCvygiQ0q1ydUfMstljnTY3B0iqeX8Jq7n49T
	kZ9+XrVHmMQwWWRgyN88v4kMSe0GvPm7HPQJQuaqAbNvLuz4MuQ7ZPl+xW2N0h5ThKE=
X-Gm-Gg: ASbGncs+XOq8o0k0RyB/TPCbKFG4e2PH4aRCP8IKuyTk7aQAW4MLlTa1Eor0xqix4LA
	MkaQkBRTQjhPe6p3YhOdGWfSk0t43an09X1rwb6OilBwe7z3KB737Y0/Eoe2Xjbe8vxJEQaLvTD
	pe7Wd02gnozzpjSV0Kh9gqobu6EcF8N8zQIfVYO8QRK5+EDFGl++15GdHytJ7tn/pVCkmAYESGZ
	Sk17bR5kup5xnEatK1VrH2X/0dIyDJYNNu6Pisros8Fp8AzmHAseh01yp1x51lLldCAwvanuZkV
	eCPYZBQmoBYoogO5WY85o4OtJjzv+qUN3RnBkyla0luJJ5KVHSLxJFpKaRTfMBehJKOFQ83wVXj
	4LTH3hdvzZolIJ9964hQ8670TncF4ToVc+lJs4EX4/KUbR8tEoYbhNQ==
X-Google-Smtp-Source: AGHT+IH5BreF0jNdm1JhmaZYhd36b3wPJHK9s5ZiIRSzQP1rPJTWRUoxQcoEakCnqIxdeYIuh1MxAQ==
X-Received: by 2002:a17:907:9621:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b0ed4777388mr94391266b.25.1757839223690;
        Sun, 14 Sep 2025 01:40:23 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f21a2sm721370466b.83.2025.09.14.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 01:40:23 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Mohamad Kamal <mohamad.kamal.85@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add TUF GAMING X670E PLUS WIFI
Date: Sun, 14 Sep 2025 10:40:10 +0200
Message-ID: <20250914084019.1108941-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohamad Kamal <mohamad.kamal.85@gmail.com>

Add support for TUF GAMING X670E PLUS WIFI

Signed-off-by: Mohamad Kamal <mohamad.kamal.85@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 836d41373848..4a99b65338bf 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -45,6 +45,7 @@ Supported boards:
  * ROG ZENITH II EXTREME
  * ROG ZENITH II EXTREME ALPHA
  * TUF GAMING X670E PLUS
+ * TUF GAMING X670E PLUS WIFI
 
 Authors:
     - Eugene Shalygin <eugene.shalygin@gmail.com>
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 3f6d89bcc8a2..dff13132847c 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -795,6 +795,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_zenith_ii_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("TUF GAMING X670E-PLUS",
 					&board_info_tuf_gaming_x670e_plus),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("TUF GAMING X670E-PLUS WIFI",
+					&board_info_tuf_gaming_x670e_plus),
 	{},
 };
 
-- 
2.51.0

