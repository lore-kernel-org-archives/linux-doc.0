Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64A35CBB2
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428755; cv=none; b=WyH4vxM0G0ncziVFSwRtBJgWMsdPZZW8TiTzMZRgT6/aQyy+olK65LPRmNMYor2hkVBEG0ILf04Z+AYKMJW3sBwJWuwe2/VwNJ/VoxiUAw5duLHJ63ndSBe/y8l67cdK5mBCXFSnIThA1lP23eGxHFp70FUaif9fCKIPc7e3zeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428755; c=relaxed/simple;
	bh=W+mERa2bshCV1HgasC8vl/IXM22iJcfrOm3qbS2eccc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkNJDSZSAeA/g/4ZO1OOedWTV5nR7AZ0a5d21pF3IoIYjJlNBFV3Muon0HwpbJgoQuUQK7KYHGn/SkM9hadBkZ7hcS0xjvK29yavho1lkT1gweG+PPsgsVz2e9Q1CF+nSBRV2YpAg8swBgMXZNn+Y9F4vd/7AMOGot28On0Soz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=gqJKUKfT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="gqJKUKfT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so1796015e9.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428739; x=1769033539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l+g792kSXhbsjX0MXutJrSM3vyj28X2EglOqZxof90=;
        b=gqJKUKfTrDrdP+rvTyNDaKosQpGMIY8SrBROm5d3tgNoFC3qw9nc+DTIf5wjuq/Pn6
         MG+XmJNw1Sxa7AEz1M7kAN/nWEBdxm2XlxhizjN2v2NRtHSMQ9we7f2e0w1FMM6OTxJv
         uMFa+BhkzxS6U0M8l8bf9UxHVGTbn1gspXxRjwxlnp1dvzwQNBzEwNddw3mhjTaWbi8i
         NzgMLeyi0uJm/FvlnZAvlrcJNMcbA1+MHJyE6yXn4PLVLSOBIWEd6/HCHy6Y6xsdwaB2
         +dfnSh8+d2lFzPxM1RETn7MpvvjmJQpKxLz2GllC+fB2iJx4PTNeyfPUWXnsYX3fBiU9
         8Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428739; x=1769033539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l+g792kSXhbsjX0MXutJrSM3vyj28X2EglOqZxof90=;
        b=AkGa906JP9QvhGRczx2xO+rvifiqj4ABTkTbigkjk85GLms8Dw+axH8O67MoC7+CUO
         NiyDRZAYgM7VXptkCGRZOdyhF+9A8Hxh0gPbwIzO01FRTHQLHF/sr9MF1NcyuuPaVdL0
         Hi/q0fwp+9OlT0mnMb3H4jRZrchN3gzgQj4s/fNM0d+HDb5c/6kz3TjBr/bbXYKIgiAm
         fNB9otzCtsRnooxY2/PAYgh6enuFcjl0ZPyDw658lt6/xGP8smInKcOu6GPGcjWqWHEo
         uw0lKO9uwKRd2MDQYH8OsRowzBlKF8XMAAmpWOCgDxY/NrxUgC6/P1w8dk6XBt1sgnPq
         co3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1N/dD/+4LeWFKUFxO1f/quivqc9pWr6nvdX34ngfkFGnBbSd9QBVU58YO1cSZfwXVhnaJ5S7xgnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5LEAmThWmT7gKN/EawllkXIlktjBrhGITESfsyMc+9tbXa2K3
	YO7viM441dytlaF17XPRO/QGZWAmVcT+wHL9Oh2DiBmpKtP8SzZIpnpmoSxHEgk37A==
X-Gm-Gg: AY/fxX6LumRN65jfn1usJNIzJeElERQ2eNJ+lq88+SxBynADxWLNBtBC93LcK3XfRr9
	dGb0CZh6kqZqKJwPOSMCHUhosIOgEJdgu3n1NEbN1TfGC5zrCMbLfz1w0z5mvzofGG/jj2/i2ms
	4EaerAnTCz3sGzO8TNP+F9KWBox/1U/2y1R6PVI37bytXr1IukcrpYysfacYhM4WR5YSQu7TQGv
	2W0emFLA2aFBhbTD7Yvj1NJV+Zz/VMhZ1jcqHzXXMmYs8yELssMVBKoF/cTyWIFzBtuuCdOkmqD
	v+oiXOh+5XN2o2U67pnodnOjRhUewXDtjKzdytnRsNQimgEMSWnSOMbFz5p/hrUkpnHeWWt5lGo
	UjtsQR6uSM+6NQmQVWGVt0SlBKhWqMqUyQlkZLSQRueuT8flaADD4AhJb40pAhuYXeLNqCvKDGX
	8A+Z3AdJrnVQa2NinAbCaR5ipRXW5T149+wqjbcXEZchACnZ2Daupfj2oQtFra9WJsrn1qtC+WU
	SRFsqAw6uibQpNcNA==
X-Received: by 2002:a05:600c:45c8:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47ee3071491mr51527195e9.0.1768428738756;
        Wed, 14 Jan 2026 14:12:18 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:18 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 5/5] hwmon: it87: add IT8613E configuration
Date: Wed, 14 Jan 2026 23:12:10 +0100
Message-ID: <20260114221210.98071-6-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260114221210.98071-1-yahoo@perenite.com>
References: <20260114221210.98071-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IT8613E feature flags, resource counts, ADC scaling, and GPIO
quirk handling, then document the chip in the hwmon guide.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 Documentation/hwmon/it87.rst |  8 ++++++
 drivers/hwmon/it87.c         | 52 +++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index 5cef4f265000..fa968be84f7c 100644
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
index 4453bf3e8ef4..6a0ee13bc95f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -333,6 +333,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -552,6 +553,14 @@ static const struct it87_devices it87_devices[] = {
 	[it8613] = {
 		.name = "it8613",
 		.model = "IT8613E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.num_temp_limit = 6,
+		.num_temp_offset = 6,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
 	},
 	[it8620] = {
 		.name = "it8620",
@@ -612,6 +621,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
@@ -641,7 +651,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -748,6 +759,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -3171,6 +3184,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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
2.50.1 (Apple Git-155)

