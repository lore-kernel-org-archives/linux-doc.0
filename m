Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7112D5C91
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168686; cv=none; b=HlgbvysS+qew//ABsZ3ODHtevZruXCD3fNzgH0WKH3S0Fze1cVnvqqYRgXXCE7HNmDw/zdVssnZjOJT5dBlyoSnlzj/No/b4tjmzwm8i85rkPbODBXIkQIuRhW2YB/3Tl+eA01r0VR7YFOoFsERmDVMP8ftJjSEw18O1oB2Wl2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168686; c=relaxed/simple;
	bh=7Xou6BeoDUg062t3v4WbguwvOhTj1X5FEnFoGhfJxFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QExppkD8eonnc+HfTSfOVhctE4X9wrlV+bChkhVTMMdD6F7gAiHITAT9uuJHseRYCtDDwxNvSFYRVkDLifxlB/dWaBqEc8wYteyZqu5O4wmpvZ2UZUY1tXttx8a09Osa5UmzkAQcQwDAZs5hH+34GsDcRr2KIoiwN3x5kilDu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HG95zMW7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG95zMW7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso17891655e9.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 07:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168683; x=1771773483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq6iApMut+rGGhxYyAWXWyRP0DMksZQ7585oGqUom+I=;
        b=HG95zMW7tV7KbTAW578NRbm7821mEzN3rPGKD6GGHSip8b7zATFBha7lcsC8jzh3T5
         SAzFj+/nrNE10XTPPAQqIK5WFGcYW9gVFiy2HD9uKw3Bml+N4S+IxBY6O8EtC7OX8GmX
         9ouiROJ2VJfjSOh+7ELp4OtTU3xP3sM+SOLzSbNG62wkfgDF8RV1Ih2I/ctKyVFZbMSk
         NnZANFoqEiD2Xq1QNLMGanm5VJK+356UYSOzWShhwc0aJBE+IZsZ40dPBoo4VuCQgdTY
         VMVf9pftQQJLPzZyKdj7szASeAISOpV/d1mgP9b/N9tRwj18QyCN5pOsdLSVzjMPl5tX
         rRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168683; x=1771773483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aq6iApMut+rGGhxYyAWXWyRP0DMksZQ7585oGqUom+I=;
        b=ZmvDeyVU/vIHhtCR9fnkn8qWDIoLzbTZttm07DmX0CMVBhLDTEh/VfiF0R7eGMNifP
         BrJG8gC/S9dbd2ropo9SQm27mLm1sAqKbY57aiM5QWEU+KGV9PDAiAD4YJZJ4pJbz9qm
         b98e3CM8MIxx6anlqcjAm6tF7roQzNT6/l4Wg7T5K2XqjDW8DXgRNESdDNbvIBkwByRU
         APlxpepnr9nm8rxuW1Uh5rnSA4Qw7NOOkeY8FXTPs1nOe9L3lZIhitfjkIAlNRSYsHtl
         RSH6u8a9GkH8diPs29Z0SVb7Z3B1nlvd6LFV1J02gjanCF/og3X+7M0VRkcmOh3KQfrl
         qvZw==
X-Forwarded-Encrypted: i=1; AJvYcCW0BMKD5iCIrl5sMVokbtJdZS0so6RRAxHT1bJGxAjE4kCz8BZn02+9B/RY0FcEQT2vzJCgheS5nKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6clK1bfkn+2PhLw5G7wLbpbaIHbjzP84RmE3p4ieepnstEfhg
	WFej7wkd1BqTAMpGjp7Hq3lj6T58dcTcKP/1YGvsL6hjjzp8fzv63V1I
X-Gm-Gg: AZuq6aLUNmZ7x53a74hwg0bD2PhUIjBCykURLMkez6sPy28Kr/LmKX3qtKsxKLNPIlq
	WgBGJVCkiInmFJws+TLMf9KTQ2EGr2im3FXcUtUtFBcrkqh4iHefqG4acIy2wxqDdyAacLq1ahO
	hWy9OX6O9+nGkROlt0R4OyrxToiroCTPY3RbvpJmXMOgWddsKHeDzFkUinVFnXLWrQYFvfKLsRC
	FCiQ0EbYi2VqphL/NJn1gdrL/8frZaUfFmAFdkPMZxKtFeBj02swl2Q2i19E+NDOmFk1E4/En9T
	gWMwMCg9Iw029Pi+bfIiLc/Br3w3GoQlMiyRqzTplDokjNiN4LfY2JHl27zU2KCY3lYUsxnd57/
	10w3+eRCfOW7ZnN70vS7JhO5hqV7EJ6iyH57DWwjvD+K8KSVlkOc7r8tVhxPQjbOsLjhf6CkyJ4
	UGamYVBIvuVN/FVhZji0GOopsoI7c2LmzfKF2jQ7eocg==
X-Received: by 2002:a05:600c:8486:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48373a1c41emr118665725e9.11.1771168683219;
        Sun, 15 Feb 2026 07:18:03 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:18:02 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Varasina Farmadani <sina@sinanonym.my.id>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING
Date: Sun, 15 Feb 2026 16:16:19 +0100
Message-ID: <20260215151743.20138-4-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215151743.20138-1-eugene.shalygin@gmail.com>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Varasina Farmadani <sina@sinanonym.my.id>

Add support for ROG STRIX X470-F GAMING

Signed-off-by: Varasina Farmadani <sina@sinanonym.my.id>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 8a080a786abd..84b92093771e 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -33,6 +33,7 @@ Supported boards:
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
  * ROG STRIX B850-I GAMING WIFI
+ * ROG STRIX X470-F GAMING
  * ROG STRIX X470-I GAMING
  * ROG STRIX X570-E GAMING
  * ROG STRIX X570-E GAMING WIFI II
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 976dc04a6aaa..ba1db62ad646 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -630,6 +630,14 @@ static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
 	.family = family_amd_800_series,
 };
 
+static const struct ec_board_info board_info_strix_x470_f_gaming = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT |
+		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX,
+	.family = family_amd_400_series,
+};
+
 static const struct ec_board_info board_info_strix_x470_i_gaming = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -851,6 +859,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_b650e_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
 					&board_info_strix_b850_i_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING",
+					&board_info_strix_x470_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-I GAMING",
 					&board_info_strix_x470_i_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X570-E GAMING",
-- 
2.53.0

