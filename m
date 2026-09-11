Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7111403B11
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111639; cv=none; b=Z6pkBAzlkyNEMKkOqQJ6AG+twWiWKX/4GffJTrPeFb/uZA7vE/zGqYtST4LBwGa9yZFUdILVNGP3UC7UshTlvlBcKEyGzbeLCibCd8BrjRotwZCUOOKzoc2dRucxX+8KsO3Ts/o+NQMBrqWs6XlgFD47UEzCQgk0yA3PTVXub9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111639; c=relaxed/simple;
	bh=9LCSHI9dJmXTshg5eLes8LVmGe5qn+MubAPy/BL7Mt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTlcR3QRuLexhFSCnRnvnOR1f8Dd1vxhX+YuijpuhnZhLzpfcAr8fqwP1Ak2Q6EhsDpE0LGo/PYYiHuSVJrfQkAuGGF9rsBXHZ4GHlj3AXKF1cuUq8XCEY96WpHydRzu8v+3jgCBWWgjGQ6oMEM7ehTsaBjwQsuipKDfeoSGiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4JcEx1h; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4JcEx1h"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7c1176317so609769a12.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789111635; x=1789716435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSWkYiMfJ8v4uw6eOjZdWs71agTehwoYxv/jnWrsoXU=;
        b=B4JcEx1hDuSeKhTCHtTabCuKYgIH2g1jqjeZEGicQhEfBs19FV412SZ7oQLe6ZAstv
         6/Lpw1pAzRyHhXgXN7IcsEZtCFQ5g9KUewU63yAQpj2gRty8gW2sfcZ41J9k+fR+GAzn
         0TKO/gj9ZKebxkpmsYN9QIswrz/7qQeaDJxAbSKxKgtOZafiUvMmZfq59niCYoc/V8xZ
         6ELbYNoGP8TI2kvV1pixABVQifDPpbbo0B0+nCMkeDJKY+HPX25JdDJSTRhK14ZrPOfh
         ykgrD7GDpbqMPH1fbFDJHn5Zd94ZwhNBjf3+E8Jsd/idMaW3jZABGNQy63th1VyhmSy4
         Xv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111635; x=1789716435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSWkYiMfJ8v4uw6eOjZdWs71agTehwoYxv/jnWrsoXU=;
        b=cU8sSKr2ZFfO+EFTCufmK5N0FIwb+ON3JxDoCHmGAQHm4iEFYHSO87Li16ouFaE3GB
         boRwIRX3fpIcOfduEeFRL7Qy04+ExJWziE4aIjrTxVJ69UYND5wY0iibJcQivxFeBV2Q
         Yk5cfo4MUPVhbI39vhax0iAfaPPkltKlF/RWTWPvGgDdli9ZY2OooKu5oPHmljGuTM1h
         37LYJ7DDWDwGNsQB+0FRPMZcMrYnY+oZ0d4UwRiQpJDmt57moZOkmbnaA7YbXUSEYgu9
         SH/zTSfJP6Cd8e4UlK7Xe8FT3MuthE3MybO54wDwAohUl1UZxNIbmGREiiaxvk0BD8QN
         pqEw==
X-Forwarded-Encrypted: i=1; AKwUvBzZgHnn9LMI10hcaykNZstHyMLfkLtyx4e4E7Tk7TRmtq8bLAHgpBTwSBmYd0fK6YlrnQ9Mm1j/6lM=@vger.kernel.org
X-Gm-Message-State: AFuF++nJTpW8L4HQY3m18wRVhXGF4oRkciSeaXT1Aqd/+32Qktii20+A
	onRHO3Rm0r+q/8Jm43pYeLj559uRiyxQJ/J7XJ35V/ZL9MTWqyuyzYT9
X-Gm-Gg: AYBFou3dHC8y6z29zUVpzWQRbbfkwmyKl51udoVxl/fnoArRxDmc0eae1BkxW73U8CB
	EfFXtmU/9yC5LVgyQJHXOVwSdva4N8MLbJgD0de23+Fdpi4Oy+MpjnC4cwS/oPS/a/C15AIvqjx
	vM0qL+MCv6UYo+VZO0SUSG0UVF5ZCNZKCPiYa5Bg6YWtJ53pEC0LQFxbBcpc+Q509X/1DLzWrPj
	k2yWr4s3tyNonjI+PmajXKEf5Zsbtosb9c8eXu7SwwfKK+X/9xzl5TzePAd/g/snakiT3GGBnqD
	e6Bpp7iRbKFsoEEZett/DvZU5sLX+8kARb0Z62H8xORkHo40NEo6eGotZe3l9i5B4nBGzh3U7lL
	XCbFhNxjtxYCaFPipUsqUrgdEtBnJVKcPObEDj4ijJsvJ+VBD79azeXBngd/BtCOzbS22Cw7TLv
	O4jCQSKnCe8wl3fFZZ1yUuE4hueTmEjNYjIRbY8Ujk7tr0okW7NcP15L/i9MJ6RCdQaWapO33J6
	PLqFUkETH9EdxUkOs6uwTFInLLKmnKNBjmfsT5DrBuBrTcblpV2o/PHonjuaVA/nc+3RJ4Yhm5s
X-Received: by 2002:a05:6a21:e58d:b0:3d3:ae0f:5268 with SMTP id adf61e73a8af0-3daed38e438mr5837524637.20.1789111634934;
        Fri, 11 Sep 2026 00:27:14 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e381-6723-6ed9-0e2b-d17e-b72e.emome-ip6.hinet.net. [2001:b400:e381:6723:6ed9:e2b:d17e:b72e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm4023136eec.13.2026.09.11.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:27:14 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm75) Add support for Nuvoton NCT7715
Date: Fri, 11 Sep 2026 15:26:53 +0800
Message-ID: <20260911072654.15722-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

The Nuvoton NCT7715 is compatible with the LM75 temperature and
limit register layout. Add support for the NCT7715, including its
16-bit configuration register.

Handle its conversion-rate field and shutdown bit separately, since
their bit positions differ from the standard LM75 layout.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
v2:
- Use the standard SMBus word representation for the NCT7715
  configuration register, removing the NCT7715-specific byte swapping
  and updating its configuration masks accordingly.

 .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
 Documentation/hwmon/lm75.rst                  |  6 +++
 drivers/hwmon/lm75.c                          | 52 ++++++++++++++++++-
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd721f..832a8c5d83e9 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -31,6 +31,7 @@ properties:
       - nxp,p3t1750
       - nxp,p3t1755
       - nxp,pct2075
+      - nuvoton,nct7715
       - st,stds75
       - st,stlm75
       - microchip,tcn75
diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index ca46754e028b..fac0b8f29ddc 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -150,6 +150,12 @@ Supported chips:
 
                https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
 
+  * Nuvoton NCT7715
+
+    Prefix: 'nct7715'
+
+    Addresses scanned: none
+
 Author: Frodo Looijaard <frodol@dds.nl>
 
 Description
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2d2d752aeac9..ad7128629e56 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	nct7715,
 	p3t1750,
 	p3t1755,
 	pct2075,
@@ -107,6 +108,15 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 #define LM75_REG_MAX		0x03
 #define PCT2075_REG_IDLE	0x04
 
+#define NCT7715_CONFIG_RESOLUTION_12_BIT	GENMASK(6, 5)
+#define NCT7715_CONFIG_SHUTDOWN			BIT(0)
+#define NCT7715_CONFIG_CONVERSION_RATE_MASK	GENMASK(15, 14)
+#define NCT7715_CONFIG_EXTENDED_MODE		BIT(12)
+#define NCT7715_CONFIG_RATE_0_25HZ		0
+#define NCT7715_CONFIG_RATE_1HZ			BIT(14)
+#define NCT7715_CONFIG_RATE_4HZ			BIT(15)
+#define NCT7715_CONFIG_RATE_8HZ			GENMASK(15, 14)
+
 struct lm75_data {
 	const char *label;
 	struct regmap			*regmap;
@@ -122,6 +132,10 @@ struct lm75_data {
 /*-----------------------------------------------------------------------*/
 
 static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
+static const u16 nct7715_sample_set_masks[] = {
+	NCT7715_CONFIG_RATE_8HZ, NCT7715_CONFIG_RATE_4HZ,
+	NCT7715_CONFIG_RATE_1HZ, NCT7715_CONFIG_RATE_0_25HZ
+};
 
 #define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
 #define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
@@ -259,6 +273,15 @@ static const struct lm75_params device_params[] = {
 		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
 		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
+	[nct7715] = {
+		.config_reg_16bits = true,
+		.set_mask = NCT7715_CONFIG_RESOLUTION_12_BIT,
+		.clr_mask = NCT7715_CONFIG_EXTENDED_MODE,
+		.default_resolution = 12,
+		.default_sample_time = 250,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+	},
 	[tmp100] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode */
@@ -354,6 +377,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
 				    u16 clr_mask)
 {
+	if (data->kind == nct7715)
+		return regmap_update_bits(data->regmap, LM75_REG_CONF,
+					  clr_mask | set_mask | NCT7715_CONFIG_SHUTDOWN,
+					  set_mask);
+
 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
 				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
 }
@@ -486,6 +514,13 @@ static int lm75_update_interval(struct device *dev, long val)
 		if (data->params->resolutions)
 			data->resolution = data->params->resolutions[index];
 		break;
+	case nct7715:
+		err = lm75_write_config(data, nct7715_sample_set_masks[index],
+					NCT7715_CONFIG_CONVERSION_RATE_MASK);
+		if (err)
+			return err;
+		data->sample_time = data->params->sample_times[index];
+		break;
 	case tmp112:
 	case as6200:
 		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
@@ -770,7 +805,7 @@ static int lm75_generic_probe(struct device *dev, const char *name,
 	data->orig_conf = status;
 
 	/* Enforce polarity active-low (default) or active-high (devicetree) */
-	if (!data->params->config_reg_16bits)
+	if (!data->params->config_reg_16bits || data->kind == nct7715)
 		pol_mask = LM75_ALERT_POLARITY_HIGH_8_BIT;
 	else
 		pol_mask = LM75_ALERT_POLARITY_HIGH_16_BIT;
@@ -848,6 +883,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
+	{ .name = "nct7715", .driver_data = nct7715 },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
 	{ .name = "pct2075", .driver_data = pct2075 },
@@ -972,6 +1008,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "nxp,pct2075",
 		.data = (void *)pct2075
 	},
+	{
+		.compatible = "nuvoton,nct7715",
+		.data = (void *)nct7715
+	},
 	{
 		.compatible = "st,stds75",
 		.data = (void *)stds75
@@ -1129,13 +1169,21 @@ static int lm75_suspend(struct device *dev)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
 
-	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75_SHUTDOWN);
+	if (data->kind == nct7715)
+		return regmap_update_bits(data->regmap, LM75_REG_CONF,
+					  NCT7715_CONFIG_SHUTDOWN,
+					  NCT7715_CONFIG_SHUTDOWN);
+	return regmap_update_bits(data->regmap, LM75_REG_CONF,
+				  LM75_SHUTDOWN, LM75_SHUTDOWN);
 }
 
 static int lm75_resume(struct device *dev)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
 
+	if (data->kind == nct7715)
+		return regmap_update_bits(data->regmap, LM75_REG_CONF,
+					  NCT7715_CONFIG_SHUTDOWN, 0);
 	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, 0);
 }
 
-- 
2.43.0

