Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563F38F250
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595450; cv=none; b=jOaIbg0C0HYA260LUk6reL0TctHF7M61fh8cG79uqozLUZ6lgnlckEslSTBSAMXnFjVu3qRd0XrqhfgYu6oRQuRTrwac9yCnToq0bU/SUjSNZtNt2XsqnHLFtSCWO0/2x3izE1fBrRAvKEcbMvmBmnofH1ie6TafgM+PKdMLt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595450; c=relaxed/simple;
	bh=4ekraZy/fgRJ8xIH3aZd8XUZWGZ1ch2LOkcS3hFNA/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4t19fEs+NdYb13suO2fBcAFWb+ajwL3ELLTmZDlB43bFWYsNPELNvXuEBLqfIFtm+7Yy6OOPau+EDF9gNRY9kd7kjlG86vpqRhlfKodZKBdAauP+qetyxBuBmqRtksZuNMwwUrFFs8ghqcmwP7M5RpevkAtcinVdRYp+iGcZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNknC+46; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNknC+46"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e257a23aso1253109f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595447; x=1789200247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRZkyYibSQw/TdoJWn+8ggoBMlqJpfdb7cVc+BMe9tc=;
        b=rNknC+46zeL4xMwEPRnti6awsI701Zv3lYwZalIuADh3BDeUVky8h98MbWSTBP8z87
         pTs+O9AFTQ26raXHvDO4E2QnGVG0HAEkX2E1DmSwmiyZmaW/YadsKRgfdfJJs0w4TI0P
         YHO7PRz8OP1SzBbhnRhCKk+6u+E7gi+eSHPrAOfgc/CaKPmZnhTzFTT37j2TumZArEPD
         L6ZNu8pooBagugkySZPFyWWc/0+890eXogAm4yMZlSQDcE8ZeXdeY7hpZI/nrU/GcdzX
         Jj3wmX9cISeOzdnxX63C9lR189pPBYoEelOSR4GO46wFWdioo+2sM3JfeZJKSKN8O+3X
         dglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595447; x=1789200247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRZkyYibSQw/TdoJWn+8ggoBMlqJpfdb7cVc+BMe9tc=;
        b=ZOLBWl7tcdJHdMNXPGl99QSEbuwYKylg7+tUuUgdrRMIiUVozakGC9yKlcCaYW5O60
         OWd6HVB+dXsonxztJAx3a+QWVm2qnvNq4A2keNh7Hyhy0dXUzCCPyihKRukcZGYqgZ8T
         bLKKB3VeYFwIMx817rM9Gw9I98Sv7hg7yizOwtkUNC6A1dWRSqp8d2j9DDjQcbS2O4Re
         OCCww2SKNOU9V/W3p9cVOus+f5hd7ZrR0Zqln+wdViu777XVKgArHCcGjh0bK7zDFYX/
         xMagpjCOW0eBVfc9hLbyGaHFEzh0k0k65/JIyBtVhLH7sHPFktmX4q/mJdFEd1BJztzB
         acVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5mUT4bnygw/0lRnpnCg+pO2/ks59hNU1flMf7JdX6D3FEe0Peqk5WeFGnjwJ6QySCef4y+rd9MXM=@vger.kernel.org
X-Gm-Message-State: AFuF++mDliQBrpoj6bFRdYLLUX9IcbnfAhYfnA+bVpxSP9/8n+mqVECC
	6K/4yUdPN2HU3k3e+0WakcZTYMJeTv+tuzJJHCd47wpTE95ggV57JI0X
X-Gm-Gg: AYBFou1rsXYKkMr4cCScZJ6fQn/0CkY0PvyyrTMXiP6knjOLnYruWkY4JcHq1F/nArz
	fYJLZ/wAwBEb71BH88NK7LOjxdPUZSPWoUnSWCvdP1AzMxLXg6GgXnuavxexQmMwrdsVywtPHZ6
	LaRbMORA/Au+9pdP8WmZozBLs5YDQk/FraEJhCOuPvQ9K/u7O+SKtQJsSjmAAJanPhxbDpa2x8A
	62J2SWBaSgIpecTZFdc3FB+eY/For90QUGXpRwwgs2CyLRXkA6Lit8CzmYOCQbDAcEi3fSjslqx
	jB1mbUceCuHg2HIWJWSPqTW+yHXHVKZlYkPQEuHgyQYYdQlygO7MUC1xXP4OKx9kHdEdDmRoeDf
	HF2Lduo8qoqkeowre43mfhaFGYQLE0zAADGn+M9AUELYRevWYTPe43884nPCzWg/IoZgRIYBQOj
	04NkiVmHwru4EOFjHbe8iN9c5urJ5aD2UIfbrtaHZS73DhtKxNIG9E9UlWUYCEqWbWyNY89PPcB
	zk+6w8V+TeQsejLgbta8wS3qE4JfI927JVGvoDOuG3KUIQzzbI=
X-Received: by 2002:a05:600d:8446:20b0:49c:fc7a:22d5 with SMTP id 5b1f17b1804b1-49cfc7a2342mr62413185e9.4.1788595446573;
        Sat, 05 Sep 2026 01:04:06 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm206542315e9.4.2026.09.05.01.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:04:05 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Mario Nuevo <marionuevo@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING
Date: Sat,  5 Sep 2026 10:03:36 +0200
Message-ID: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Nuevo <marionuevo@gmail.com>

The ROG STRIX Z490-A GAMING and Z490-F GAMING are essentially the same
board apart from the F's onboard WiFi module, which isn't wired through
the EC, so they share the same EC sensor layout. The Z490-A exposes the
same EC sensor set as the Z490-F (chipset, CPU, motherboard, T_Sensor
and VRM temperatures plus CPU_OPT and VRM HS fans) at the same EC
registers, so reuse the Z490-F board_info for it.

Signed-off-by: Mario Nuevo <marionuevo@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index ebed9f8d2adb..7032c40731d9 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -55,6 +55,7 @@ Supported boards:
  * ROG STRIX X870E-H GAMING WIFI7
  * ROG STRIX Z390-E GAMING
  * ROG STRIX Z390-F GAMING
+ * ROG STRIX Z490-A GAMING
  * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
  * ROG STRIX Z690-E GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 7293c48c72b1..19f423e45ce5 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -982,6 +982,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-A GAMING",
+					&board_info_strix_z490_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
 					&board_info_strix_z490_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z690-A GAMING WIFI D4",
-- 
2.55.0

