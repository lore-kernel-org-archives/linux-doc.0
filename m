Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E72236E0
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656368; cv=none; b=FvhA9NmPrJ2aPYn+QRlAU9+1ApHf3hTSxSALvE2ZRMiGE50EBJt2uwjsiw+TRyzbdmzkGMrBPrKnjlp86nmZ10TpDPegu0ejnv41abxTnrYpIiXDGhYJ1cr4XvYY5gx866W2jd5E34gAb3fOY5sPLuGH2qK+KdB93GbN9PpmC5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656368; c=relaxed/simple;
	bh=vHDffevPJvWn0TDEIr3DY9YUUhJW/hc5O51BO7cTGxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3BpFGXwAnSeTJalD6LLp9FB7HZydrCxHqKt0uoMaDC3v+nxIaqDHigp8uAraPhXePonruys19GB+AFxg9IsWzLUN2X9sbtWrZ/j3QzKYpBV4wqhmTVZl+qyFUzcdNpg74YfYtYrn/DepeGQsg1u1WyBnobmBsSeWp5uqfnWSZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf7ijr3g; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf7ijr3g"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso3543321a12.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656365; x=1766261165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=Bf7ijr3giFWr6wLCJeqPScXVbjkFP1Qp2rQ+djQR7ssHG0/P9eIiXwlh3ZqA+PCiza
         CwzquzFYUp19z39q2NHVUeEJs+bXlO/aMz4ErsIgnMVYNBiWD92DCcg+t/o/NV+U21He
         2f3AI/77DZJoJa8sdNN/MknPPd+WENkgUw3s6dKNEGjJxB+lG6+G54JqOoAoo9cJuJEh
         1JmwD5eKAt2kHUDIOoRCCUh+wyrP007JVmbdTP+crTtZpHiS6VKKugKLPt2p0cN1q1Kq
         yfAIUGmsB2YHsFUeL9uR0B0U5DR7eIyehcpQh05X7TfbU/GhpSq73Pnb7a+unTDz3F+x
         gaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656365; x=1766261165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=rCTNMyu2nIAvCf2w4YHTswYskpR/vjL9TLUPZercfRRMi1UtwsboN/0AMxbLpouaIV
         F7BSwL2/pw7ceD0Fbgle89RpwLevX4UvXUfjwn0vvMBbqzP8oXjH8fBSwG3CXPtiTgJC
         qZZw3N38E2hKFgqOXTi7C5XTnaGadOhHfX/mrzwtLzM3j2b0QKM08dad/pE+LENPL+HU
         OXKC0svmuWxWI9IHXaNkZ1Z9UZYbI36UnK3URpI8aEShGZM57+ztqsIECBqBeepamq31
         iuaySrsV9ZVvR2TiHKeLu3N3UC8a3Xzo2/ngv5e1pMsXzqhx1ewcMTIl4KsLqMHKoXeS
         WO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUVQG3v2GUxwco/t6NgoW3ltg/C1Ljg5NG0Lxg9BC7EoLAfX87RjZ0zGHbPiezMk2S6N7fGnsGto10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhzC8oP4SQgIyjBYYFQjOx1/DV+WtXPYuqU/nV264WlAYA4pl
	u3LkRJjh5GME8OV6FaeLFlbyGZk9z3BWiprtjiYE+GBHS/UdNmO5Lfls
X-Gm-Gg: AY/fxX5deaBMHABnw+VgDeLcu3KmnZnJNleRfNHqvWlZwKrcacQ+bGHy6xDeOnT8Skl
	3DW+JHGfjq4A44aC4qV+ufWnbFauG7lrhqKCgj7G1F1NMkXzAH1wXK8Wnf+M/L9cH3OkeKMevXa
	2d5QWFvCZF2et73bEmO7J34rtzSkysGRpzWbhNfY8thaXoW32aMvhd0ET76n5lRH7KG/6j+jMn8
	2PA7gUyr1Wjr1i4YpC8l/CN1D3dQIGF5RpZqB1lMgv2kMpavKGDBlmRpgGNWKdhyanrmXaYZSv9
	qxxIYJzNTzwIZY7cm/5pkDfZQ5AoMl0pou7h+40DDvItu8dgFKbHghbMGHSD672YCoOgCiMGToH
	w8hv8ClcJNJhZkLX3uvekotRHipKIHgBB99RugIhFzHGsSoqQ8lsYswFH/Fz/cIh52Qg2b9lwlo
	SJKQeAq/Qh5gohHubh3UxYQDRJhbHFyA==
X-Google-Smtp-Source: AGHT+IHyGed32ODALWiA3VxEmzJhRm8zqPkOmjtz4tMKYDQKKRya7+LJKpZFXDUO8WDaJs7zgWyz6A==
X-Received: by 2002:a17:907:60d2:b0:b73:9892:7f46 with SMTP id a640c23a62f3a-b7d0251dcc8mr1158285666b.29.1765656364614;
        Sat, 13 Dec 2025 12:06:04 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:03 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Robert McIntyre <rjmcinty@hotmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A
Date: Sat, 13 Dec 2025 21:03:40 +0100
Message-ID: <20251213200531.259435-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert McIntyre <rjmcinty@hotmail.com>

Adding support for Pro WS TRX50-SAGE WIFI A, which is identical
sensors-wise to Pro WS TRX50-SAGE WIFI

Signed-off-by: Robert McIntyre <rjmcinty@hotmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index fb32acfec0f5..58986546c723 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -10,6 +10,7 @@ Supported boards:
  * PRIME X670E-PRO WIFI
  * PRIME Z270-A
  * Pro WS TRX50-SAGE WIFI
+ * Pro WS TRX50-SAGE WIFI A
  * Pro WS X570-ACE
  * Pro WS WRX90E-SAGE SE
  * ProArt X570-CREATOR WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ef4561ae38f9..8435be30c3f7 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -801,6 +801,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x870E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI",
 					&board_info_pro_ws_trx50_sage_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI A",
+					&board_info_pro_ws_trx50_sage_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS WRX90E-SAGE SE",
 					&board_info_pro_ws_wrx90e_sage_se),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE",
-- 
2.52.0

