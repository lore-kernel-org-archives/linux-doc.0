Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8FF1519B4
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168683; cv=none; b=ZkpeCSsCITcQjGHQxp+AZBYjvf5Nrg0ppFrbjQK2MkxezVjP0NWslzCFd21N4wRQF0ykQqASZhfOhpel4eKauN4iDo0QVFHfxy+DX07MP7CFmMewqPoN1u0mkXJu6+kgfErsDruJxJHdXTht7HwhShMoEZ+TySNgmW4oYvxwkvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168683; c=relaxed/simple;
	bh=ZE5wO03ByAP6iG7XU89PRA8P8X3DWw2l1wy8NJLHmwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiQUsiHXcmeC2ADqizliiq8CbuPCbsYH7TBd64nBn07RmpeB8e7nkyzQA2cgqunvQuDjlPhillfeyNbXOqX2/lf/JqfJLbWcSwHDwauUk8xZvFoko3L/E/Gg5dpVzs7ZTYGbljWYXrq4GRMSZ+cn3Supwr+XUoMSk0nuVgzHWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RytmHYpY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RytmHYpY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so31735745e9.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168680; x=1771773480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLLlHCS4a38rbIEKVaC1wzdp96LtY8Dp8FKU6XhKumE=;
        b=RytmHYpY8zrb71cT/Rih4ewKpTyqSpIR8eXehd3/sSfLRU1CMDg0pefibTltFbmUFt
         BpqU7gm66D0DQJwZjSXzlB/N8Xg9IWdjGDAKC+EznYhTdx78RxlfL3+FYWZgsZfM7kdx
         8xHvhnYuSB+z0tLQZNw0W2jsGHepnzPr3hFJ7h55GSnigvlKCz3DLLE9Nh5J0QbnaSwd
         Q7r2EPABCLnCLi6nsfztYfAVrzKXOlOtIBKl/7VpzeSjvSPW4Tje+bnr+vKCw2df/cnm
         IbADcoHTBUnq2O1BtQyziQh2HSLu5Xjz3rnifHBYkZ9oZKWdKkUEFR45b2qHhGBsWEnn
         rwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168680; x=1771773480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLLlHCS4a38rbIEKVaC1wzdp96LtY8Dp8FKU6XhKumE=;
        b=d+kzU2qcERk9Mmi7w3jT98mq4Wq0KNhadW/kEKPavu6A7g+eDOT9qNbcqVC3CfX9BN
         1AmV9xVRI6KhwEWYrRlInwo2OpOWzaQF9J1Z01561oXICKD0NkZy451ZIgcsdxZOSteW
         wR7VSbodJliBM0vG2/As0Keg00kzenPplLUpoR5kAFKOkCMDy2VZguCRTkDhsoi/TlQu
         M5hO1TvELE6aU/EN6mnQLood3RkupRSnl0qxU31K+tRVJnfH3RD6L2D3fA+hagQhUqjv
         dSaixQg4wyvUmD9JWQH6VW8to4hCRtDL/3NJCwkPiGN1cJ4p6XlXO8gqycFJB1w8UYCO
         sh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMGk++ztS6rp02YU/nbn6XtkJpdTxYCAALccjuSo6Lcw+Tk0GdoyMhbiG8rVX/1goDj4B1bAfwuqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIT80zX6vFWqfU9p2SrPs9gulzBSn1T4lMFsTvdvMyhE2bHVWD
	JWokhgnOIC5821xdaJ5+ObGE03Xwu+iUsGgkZat9zP2qaqyluQ/Li5bS8BgTHA==
X-Gm-Gg: AZuq6aLRKyVrqAnn4c11/7Yomz+3nQt5JYwAI+JWpPoa2C66Mt90i7WkVNasVd/vIRO
	duNfm9jNYxps44zyk1Axt3/jFKCF7P12sCEEOsdtYk8M8JtN9hQdXi9gIla5sqTC2vo97dJP7hM
	Pkjt8p9+r944dq6sI6p/T0/TnoX4CXVLWoJgKGgOLYKb+6EJkOVeS+c38bjxrGDjKcP7pwXOtVV
	eQ4YDAxN/gXPNfKvYeUN2+uNZuaKRYIoQ89Zl8PkfokkH8jQWxus9Y1A7wOTXEaVaqhyTS0Q4/b
	YnC558dMsopv/MFF3qdk5fi0ntkDT+pw5lDUGB9o0o9dbcBD44MSRHLAf/F5QPdPiGa1gKzvGs5
	rnj4R7R0sGQS8nlqYfVppGrJeHqIFmjGeA+rqiEEx3OdTiYiwMPy4oi2TeNGBYMovU61qINc0fo
	C40NexrzwFDJig12qxHWkhLeFAZRzAyb1n1G0gqmFDOw==
X-Received: by 2002:a05:600c:8183:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-48378d9ccc7mr97627215e9.9.1771168679774;
        Sun, 15 Feb 2026 07:17:59 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:17:59 -0800 (PST)
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
Date: Sun, 15 Feb 2026 16:16:16 +0100
Message-ID: <20260215151743.20138-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
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
index d4af5fdd28b1..cd706a602dc9 100644
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

