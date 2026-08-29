Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CAE417377
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023166; cv=none; b=iBdNaTauzCOcOV76BaOK+ThgflUhbN7ks+RCEequQTXCzxbscQPyCgSnkwBfbkPYuU4yG+55ZIIq5k/0fWbqyzHzB2wvhrESXrsMwQZg1zFzqzwHzPWQVE8J7FWJ5VPn9qWqLYlNuRRWHdCklaw9eibUSnDNxQfYklZEeJCcbL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023166; c=relaxed/simple;
	bh=/ESLAF9xL9OgW79vd2hVpl4AEXYy9EUVtkY1xmIQ9z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hP/zKxD4AuxjaeifzOFbyrnYKFYRCYMaPLFFPixc683nEFFPEQMdHukXPaqBHpwCTr+kW2sFc/w27zmbYAqqnGMmHqUBRNPrkPqe7Uh/Jui9O5Gv+ZJKKkC2fXXmFU/ur4rXOa9gqkxhWouYCWcq8ebFKwG29iFNra0M2VZnpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTuNIaO1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTuNIaO1"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c25099bb1fbso276908066b.3
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023160; x=1788627960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+O3FjPNkpZ9C9VUnIRaSGoxe9eYJb6Pa5F8ITJvBpI=;
        b=jTuNIaO1r97Ogg4ZzVzZx2QPIAccnX/8GyC246cns04CU4bbtbgOTCT4EeTlASi3ON
         23FBiq0WsrhECRbHipItl+V6ZKfJQ80tQfdSjYvBPrcZ32ouvv7Hq7AMr0mO4kpN9DdT
         qgdJqF8MDQTgttvh3hF7ip/LBiaVvCSUga0bR7kmt/CLQZOZfCGuzcPcv8rvK82Nzk4M
         YhvIW84QcYD9yeRuloC1Sx8I1jH0LqpWGCq1a+EFYgkPRIgTxd7GqWTQibeRVj0XBoKl
         B7BwtGj98gusr4BaoIS2OsBT6XaCcRub8dPwrdHQj6Rl2mLzMCX45s3izkt6AodTFtnM
         VoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023160; x=1788627960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+O3FjPNkpZ9C9VUnIRaSGoxe9eYJb6Pa5F8ITJvBpI=;
        b=jmxVx9NWPGs2WrX3lERHl3tAEdlHUdgKD3JXVAdjfH7Z05s7AuAmqUWmxHKt1Q3TNY
         PkKxh8n5B5f4kr4VyFiNE+Q5xcLqm+5O7awbViZqOWwsCZeksKb8bOmSX4wRD67x2ueE
         Mqk8zyb6dUuP0txcGSkKXeujY1aGQG074IvBkER+SUZ/nSAM91JAn4VF0dU3ZoW2CB7n
         +tQf+YGlxV9nGDX82zItA2oXJ7cDSV9zARl6fnbIF3OZm3ADgQT58CGp0gbZmigSjsfq
         SjxflwCiFrk+emgJ6qNzuVlMEyW+oYPML/VNu5c4wrFS9Ol/dkR5T5E5udqR6z7JkfvA
         xDGA==
X-Forwarded-Encrypted: i=1; AHgh+RpTNSUwwxf+Zqs0WD3K/cBptlMN0ZpS+qdqCUfCxolIK+9TJVXvkjSWrvGwOXwdwy8Zw30+P3CQ5IY=@vger.kernel.org
X-Gm-Message-State: AFuF++lIuT7JaJNQ+4wN4I58d3VGHM9RjKqgCWNtUnwqTaqpZZaoHR7D
	tzI+HaCkiZtKWCpes3C5AyUw+Dxdp0ZrZcNahYJNjGG6P5OlOKTGFrz6
X-Gm-Gg: AR+sD128pIzxW7txnmsj5WshNFaT+3UMfHpUJSUEnbvA/XweTMN7WFM9QD3n8X5vVsY
	ifB0yHj1iWzRX+1C26CSbVzhmMDcJC0QQCySs1sa4N6LrcGuTItdKgS9LFGqEGEgqAtP87M4Ay8
	YkWPfRNzq11inNcMIjb/fZSMN0qTqPxP6fsdh4i2Nkz70AbSa3MSy6m7I0YYzEd4TMWY7QAv0ys
	x4AgvoYx5qjlBU18UHPjpNpO5tMAMN5ZTh+de055pyquHqaiw8kPTEYS+iNV2IjjvTefBbjdUKn
	t1upIdIG1yeTropZX0hzx8iNRi5ezv9tdRjhJmXt3HsVcxlDLewaIy/uXTwbOVGIaVXXWCXVKsx
	MYitOsp7h+AJ29gz5JTxSZXSJc6En5Pl0uzxp6A/W9LyhwjOUdiAheQ+QMqiVVzFeLXGbk6z1HI
	kGuemUiwf/WlHceoXRuAIPMdICRop6srGDN/AilfxxNBWjeEKgQHphMhE6gbzsHog1mWVt8C3Fo
	AANvG1NzmLxoJw=
X-Received: by 2002:a17:906:9fc8:b0:c25:1a5:62a4 with SMTP id a640c23a62f3a-c2557164d51mr1038686166b.17.1788023159688;
        Sat, 29 Aug 2026 10:05:59 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa6a7sm207780466b.46.2026.08.29.10.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:59 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v5 4/4] hwmon: it87: add IT8613E support
Date: Sat, 29 Aug 2026 19:05:45 +0200
Message-ID: <20260829170545.33401-5-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829170545.33401-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Teach the Super I/O probe path to recognize IT8613E and add its
complete hardware monitoring configuration.

Add feature flags, temperature resource counts, 11 mV ADC scaling,
the IT8665-style PWM register map, and GPIO pin-mux checks. Document
the chip in the hwmon guide.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 Documentation/hwmon/it87.rst |  8 +++++
 drivers/hwmon/it87.c         | 64 ++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index fc1c90b02..c33ba8a07 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -11,6 +11,14 @@ Supported chips:
 
     Datasheet: Not publicly available
 
+  * IT8613E
+
+    Prefix: 'it8613'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
   * IT8620E
 
     Prefix: 'it8620'
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e44ec65c7..67a94761d 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -36,6 +36,7 @@
  *            IT8790E  Super I/O chip w/LPC interface
  *            IT8792E  Super I/O chip w/LPC interface
  *            IT87952E  Super I/O chip w/LPC interface
+ *            IT8613E  Super I/O chip w/LPC interface
  *            Sis950   A clone of the IT8705F
  *
  *  Copyright (C) 2001 Chris Gauthron
@@ -65,7 +66,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
+	     it8792, it8603, it8613, it8620, it8622, it8628, it8689, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -159,6 +160,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8786E_DEVID 0x8786
 #define IT8790E_DEVID 0x8790
 #define IT8603E_DEVID 0x8603
+#define IT8613E_DEVID 0x8613
 #define IT8620E_DEVID 0x8620
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
@@ -333,6 +335,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -549,6 +552,19 @@ static const struct it87_devices it87_devices[] = {
 		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.reg_pwm = IT87_REG_PWM_8665,
+		.num_temp_limit = 6,
+		.num_temp_offset = 6,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -621,6 +637,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
@@ -650,7 +667,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -757,6 +775,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -3006,6 +3026,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
@@ -3183,6 +3206,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		sio_data->skip_in |= BIT(5); /* No VIN5 */
 		sio_data->skip_in |= BIT(6); /* No VIN6 */
 
+		sio_data->beep_pin = superio_inb(sioaddr,
+						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
+	} else if (sio_data->type == it8613) {
+		int reg27, reg29, reg2a;
+
+		superio_select(sioaddr, GPIO);
+
+		/* Check for pwm3, fan3, pwm5, fan5 */
+		reg27 = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+		if (!(reg27 & BIT(1)))
+			sio_data->skip_fan |= BIT(4);
+		if (reg27 & BIT(3))
+			sio_data->skip_pwm |= BIT(4);
+		if (reg27 & BIT(6))
+			sio_data->skip_pwm |= BIT(2);
+		if (reg27 & BIT(7))
+			sio_data->skip_fan |= BIT(2);
+
+		/* Check for pwm2, fan2 */
+		reg29 = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+		if (reg29 & BIT(1))
+			sio_data->skip_pwm |= BIT(1);
+		if (reg29 & BIT(2))
+			sio_data->skip_fan |= BIT(1);
+
+		/* Check for pwm4, fan4 */
+		reg2a = superio_inb(sioaddr, IT87_SIO_PINX1_REG);
+		if (!(reg2a & BIT(0)) || (reg29 & BIT(7))) {
+			sio_data->skip_fan |= BIT(3);
+			sio_data->skip_pwm |= BIT(3);
+		}
+
+		sio_data->skip_pwm |= BIT(0); /* No pwm1 */
+		sio_data->skip_fan |= BIT(0); /* No fan1 */
+		sio_data->skip_in |= BIT(3);  /* No VIN3 */
+		sio_data->skip_in |= BIT(6);  /* No VIN6 */
+
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
 	} else if (sio_data->type == it8620 || sio_data->type == it8628) {
-- 
2.55.0

