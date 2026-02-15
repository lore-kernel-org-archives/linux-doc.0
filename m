Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F024503F
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168685; cv=none; b=tZFMWDWJ7jnNRPOTKYdNqSS4Gz2OeGNzwBBEHt830WYkPPoCX/hdS7q4QgAGTjwnLsEi+y2p5dK3o/w+cyYjHF3DCghSRR4OVz80tC7Oo0owtsdm70p/sjeBJP3DtflhtyTg1vYwuazCcrYwryZehTE7WAFDfwKRndA8GjLHkMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168685; c=relaxed/simple;
	bh=LRYqZNpTFVMl2hVGatHMpwm4ag75quu37E9Xmwr9nfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVF64AFB8Bmk5yru4q14WCHKQ28pURjH/wMWH02MPLGhKUmXLezA38970+rQHTjrhJHLRlh0bbnfCu9EwHfWpci1mGKGc0LXMbHwISZaFJWqPNCVEHWmvWGU8YBS4/Haqca9/6N+NwbnPdPTv1Ty4olpSz4eNiprG8BFfPQoGEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhs/zB+l; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nhs/zB+l"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48372efa020so15689455e9.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 07:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168682; x=1771773482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onE4x45lq0T0QEKBaoA448DSP5vQxIMuhDTKkki9WBY=;
        b=Nhs/zB+lq4cVrUyPT12r8gnv4/2Eg/iAicn6JrC7iWE7eEMtbYlFTY7W2LFlVMVzmx
         WcZYiT0KCfrbrrHT2AHXv8+MgwAJF2x15MOiCiP8yr6+vc1y/9IVVdWm2WRClVfYrnZB
         91e8zN3iFu8L7Ihjn6qslidwAelykRotp+JsKMQbnRvDM1JxIUiJg15YDpprOPt9N8En
         AecTgGxBo75g6F8yB16Yd//FYYc7dubCzYqIbSXyW8B9F9rDqWfMOknUP/1qTURLhmzy
         MucOR0m/3tM8ev9HMmHKYIe2ialCJyGr6yREVVt2JMCq9FB/ZzFc0htOandUekv1+rAU
         s8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168682; x=1771773482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=onE4x45lq0T0QEKBaoA448DSP5vQxIMuhDTKkki9WBY=;
        b=MWA2upGWySgSd4FjLm+u5FAilOGEBE047BgtAlXiWdtJz7NTCRKcTtgafxRoJqSn4J
         7wb4JBLSuChTrfgoVuozGy7ldfw/UW7uKuXqPuvgaeAYSYtuXeBhtd0ugiecpv7In6mk
         bHbq/pAL1pYD26U9UK3nJQy9hMcju9vyQvsbSXGiU9ocn3qHBVwDyPptfdAV0grol7WX
         iagriRBmOVrM++61WZZowstZgNem1yBYR3XQlpKuIsivon9SnIiLPySWjg30bm83v0uy
         P/ZPyaTEGTBkxA1GvCD2pnW+Srfh9Rx4ZldeQ1wQvYJIheGeUSZ6GOGRDUWW9hV9jo0O
         /nvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkfJ3jWkvjPE4E45J5XH24x0JFewYN2oiHSYu0qSv5KMoZfEM1UT9QKsYDVFIzMWxIwcFE2vmGIUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxIZyE5DnkousjkB05ZNZLuoiFw3I/TwPVV84GcnJ8tlORYBg
	prrGzd2t+JWT4Gf9CghA0VDtib6J2hQpKVcBwFTkb5dTUfxWImWK1DCL
X-Gm-Gg: AZuq6aKZe1BOk2BeGtHk40jCenzbTgUl7pt97JsweFLBJYMVAqr2PRGP2tDlu9BFF/j
	jTchFTEAramK485BaqulX+wi7Xhl3gmR6pSEB4ZwQDS1rjZ4hdbK5lKVLEtHbTyVQEs0er5YVJ3
	xG4f15ineboESLrV0aW/X/Cc0++F55ycyIFpW4vdgpCLvERn9QHedtMvyjaRT7rEed/9gYq0VWr
	JzQuo2rf05nhf66a37HWXb1W29wUt5eL95EVw7mMFPuLIxoWbqbWxFb3g9Aa4dBlhdSPtq/184B
	+VUfzc9uCJdIQiPbmlkAySnFgDyyjZmzUmEGu6wN6FewVvbAUL1BaAgBH1HNhxTeMoJ0IZkQXWi
	E791h45H526q5Vkub3Go2+ijLojZSo1dFxFXyGIzyL1UfW0hswxdQE6f3XWHDZRMDkiUXNN/C5L
	bXRNNlVXQ7HNC/pIdOav9MH7trc/5UyneqD0P5pYTDWg==
X-Received: by 2002:a05:600c:1c07:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-48379bac86bmr105580595e9.5.1771168681982;
        Sun, 15 Feb 2026 07:18:01 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:18:01 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E EXTREME
Date: Sun, 15 Feb 2026 16:16:18 +0100
Message-ID: <20260215151743.20138-3-eugene.shalygin@gmail.com>
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

From: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>

Adding support for ROG CROSSHAIR X670E EXTREME

Signed-off-by: Timothy C. Sweeney-Fanelli <tim@zerobytellc.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 58986546c723..8a080a786abd 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -22,6 +22,7 @@ Supported boards:
  * ROG CROSSHAIR VIII FORMULA
  * ROG CROSSHAIR VIII HERO
  * ROG CROSSHAIR VIII IMPACT
+ * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
  * ROG MAXIMUS X HERO
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 86f444498650..976dc04a6aaa 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -451,6 +451,15 @@ static const struct ec_board_info board_info_crosshair_viii_impact = {
 	.family = family_amd_500_series,
 };
 
+static const struct ec_board_info board_info_crosshair_x670e_extreme = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_WATER_IN |
+		SENSOR_TEMP_WATER_OUT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_crosshair_x670e_gene = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 		SENSOR_TEMP_T_SENSOR |
@@ -820,6 +829,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_viii_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VIII IMPACT",
 					&board_info_crosshair_viii_impact),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E EXTREME",
+					&board_info_crosshair_x670e_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E GENE",
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
-- 
2.53.0

