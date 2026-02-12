Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014C2DCBEC
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885912; cv=none; b=DF9p+ZBDigaFdVBJjKzlO5bT5vXFdtPf6CeGxEYNU1vayH+QSkklQN2wSATLuuJPCjAFFpAFTnjag5MNc5QTnwJAgYxMGGzqCJREwpGfPlYWPm3S+wm5mAIU3lxiyQ4OfMERR812RyGriBr3cYBVp1a+S+IbtkYg1aMzn5/CEzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885912; c=relaxed/simple;
	bh=c4T0y/hzZHDuIAz/fbVwxQ6Q4j0rUNvQhG2sxxLl4ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JjoMPhVjwr/cNMYPPBNhK44WODHOD9zF6rfh8zY/iQqoALfxyP+UToW8CAeFUn2bt/2tM2zG0784GagDEi4YFn70jD3CS3n/wbJXrzqLtQg1izUnzjAHCCC0qZF/qlkn7PacUeFwe2kX/I1GPBHjtmPHtKolCRRAw1moShVph0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RJY4P9tC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RJY4P9tC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-480142406b3so60788565e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770885909; x=1771490709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pKMLu2vrVoz0ZANHaXBigtawgekohjYcNvHVashll8=;
        b=RJY4P9tCmNGoU7tLbopsCk9p4SX11tZ9UCCWKGQmw0ZMcm/LSPGdzZOSE2VvJ09ArE
         68s6nrSi+BDicSnp5YNo1QeOPZxcxxXWBJGTFYQgPRqWLk5ufHZqlrA7NjrG8yRqEQA8
         EyVH4k1iQeq/GEKwtqscqjd8d2AFQ5rO8OSKDir7wHX60WT38/xne9ZDVwB92pOKBAZ0
         KCQyTMf3RX98zA61KYMf9v/RqGvpzLA79GO1hDnAYMUc5Wea6rqVsFRA0hnXAXeYV6wX
         ZsISslqHe491IjKGlspWHqi65W2C//fdgt20z+++p/jMHOfA/jTyWjV3F+xBYpQf557S
         xjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770885909; x=1771490709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4pKMLu2vrVoz0ZANHaXBigtawgekohjYcNvHVashll8=;
        b=exgOV4XCOL/rdYZ5HY1pkA+7CEnF4frba6kgEOo3Yd+zTPfOuxuGWuEx89U9Hp9vdu
         9hLRrd5xj44GlC4+NqNuzWjwMrK0PImTnXaIKZWfBDydUcqJCLvq1lZTDp0yVTqpPWAN
         RldJEyFmZekxVrRcZ9N8JJGFs1Z6xj88WS+Hd+YBXpndZR/RVizF9DOOa4QgBUTu3l89
         fG4TMF2syXLhP6n4+fPyy6xByN9xWzoquzjEtwzZCXxfJSK1uy0vekfbbfNYi2NgOyfC
         SX2vDjx4UhhC4IactTp7zX9aWFoUW8dNIko59+ptil7XNbTWDfuHqYr+eoMK7P0rLPZN
         HQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA0mRO8IVRIQFEa/zcdpozjvb9KkL2y54+RKwO5W4Xqw7Ff7C75dUNHrXYWkTzhQ44o1gtlRg45Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSac2OJkZ4u/kofa3RbHAzQzdkDmOTfAt48IT4jTdZmd0p7Ki
	9S0jXRIhhhKgtbNL1JKFS4ujXoKmsqdRlpAglkF9hKlmMdXBgih34bYmRJOQg4GcLXA=
X-Gm-Gg: AZuq6aIyKoEJPWsmOlSbVleo6gyMvugChU3YFA6fQpvEnMMjTXEJhtA1YktFSVBofTT
	qgQ3er3iaUafip1mDNj1dShClXa9x19qLWOMKvR20PIo/0DAoZ6e6as9KMnOhehazQTmsVww/dX
	y0+Z3atya4HVpUYYTxaFu7exzSjbg8qgIRXE8MJoEeLjgcC1Po+Ik19eWPfGkliizYrKkM7HMP5
	wUebX74riKHceV3vze4FpNxOlsxh62tJRxNcm0HTC+wr/e+uV/vOCWx027ft8jo53h2sjZHDkxy
	fEw+USGxFBbOVOfJcryNRty2g1hROZ7IxVxSG2n5J5pIsrBpb/IszM9grYyQ5af17Z4xb959Jht
	daY4kKQOFcec01cq/xmJQH3/NnjIIrgEfR3ywDkQG/kTIID1edtu4g2UufNxVeVPKSBu12mCFg4
	A3OuHGqCgGYEdg5neGRcYfsRDPksmsBeu90dh931X82y754X3EmAf7C2t0W7kacZFkRXSjua4CD
	Kjd/Oz7ag==
X-Received: by 2002:a05:600c:848d:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-48365716033mr24734255e9.30.1770885908815;
        Thu, 12 Feb 2026 00:45:08 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm82753705e9.13.2026.02.12.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:45:08 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v1 3/3] hwmon: (pmbus/tps1689): Add TPS1689 support
Date: Thu, 12 Feb 2026 10:45:02 +0200
Message-Id: <20260212084502.1795-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212084502.1795-1-sbogdanov@baylibre.com>
References: <20260212084502.1795-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend tps25990 existing driver to support tps1689 eFuse,
since they are sharing command interface and functionality
Update documentation for tps1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 15 ++++---
 drivers/hwmon/pmbus/tps25990.c   | 70 ++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
index 04faec780d26..e8bc9a550bda 100644
--- a/Documentation/hwmon/tps25990.rst
+++ b/Documentation/hwmon/tps25990.rst
@@ -9,26 +9,31 @@ Supported chips:
 
     Prefix: 'tps25990'
 
-  * Datasheet
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
 
-    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+  * TI TPS1689
+
+    Prefix: 'tps1689'
+
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
 
 Author:
 
 	Jerome Brunet <jbrunet@baylibre.com>
+	Stoyan Bogdanov <sbogdanov@baylibre.com>
 
 Description
 -----------
 
-This driver implements support for TI TPS25990 eFuse.
+This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
 This is an integrated, high-current circuit protection and power
 management device with PMBUS interface
 
-Device compliant with:
+Devices are compliant with:
 
 - PMBus rev 1.3 interface.
 
-Device supports direct format for reading input voltages,
+Devices supports direct format for reading input voltages,
 output voltage, input current, input power and temperature.
 
 Due to the specificities of the chip, all history reset attributes
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 268e361b6fd3..3d4056724303 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -370,6 +370,15 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
+struct local_direct_value tps1689_local_info = {
+	.m[TPS25990_VIN_OVF] = 3984,
+	.b[TPS25990_VIN_OVF] = -63750,
+	.R[TPS25990_VIN_OVF] = -3,
+	.m[TPS25990_IIN_OCF] = 7111,
+	.b[TPS25990_IIN_OCF] = -2133,
+	.R[TPS25990_IIN_OCF] = -2,
+};
+
 struct local_direct_value tps25590_local_info = {
 	.m[TPS25990_VIN_OVF] = 10163,
 	.b[TPS25990_VIN_OVF] = -30081,
@@ -379,6 +388,60 @@ struct local_direct_value tps25590_local_info = {
 	.R[TPS25990_IIN_OCF] = -6,
 };
 
+static struct pmbus_driver_info tps1689_base_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_VOLTAGE_IN] = 1166,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.m[PSC_VOLTAGE_OUT] = 1166,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_TEMPERATURE] = 140,
+	.b[PSC_TEMPERATURE] = 32103,
+	.R[PSC_TEMPERATURE] = -2,
+	/*
+	 * Current and Power measurement depends on the ohm value
+	 * of Rimon. m is multiplied by 1000 below to have an integer
+	 * and -3 is added to R to compensate.
+	 */
+	.format[PSC_CURRENT_IN] = direct,
+	.m[PSC_CURRENT_IN] = 9548,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = -6,
+	.format[PSC_CURRENT_OUT] = direct,
+	.m[PSC_CURRENT_OUT] = 24347,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -3,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 2775,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -4,
+	.func[0] = (PMBUS_HAVE_VIN |
+		    PMBUS_HAVE_VOUT |
+		    PMBUS_HAVE_VMON |
+		    PMBUS_HAVE_IIN |
+		    PMBUS_HAVE_PIN |
+		    PMBUS_HAVE_TEMP |
+		    PMBUS_HAVE_STATUS_VOUT |
+		    PMBUS_HAVE_STATUS_IOUT |
+		    PMBUS_HAVE_STATUS_INPUT |
+		    PMBUS_HAVE_STATUS_TEMP |
+		    PMBUS_HAVE_SAMPLES),
+
+	.read_word_data = tps25990_read_word_data,
+	.write_word_data = tps25990_write_word_data,
+	.read_byte_data = tps25990_read_byte_data,
+	.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+	.reg_desc = tps25990_reg_desc,
+	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+};
+
 static struct pmbus_driver_info tps25990_base_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -428,18 +491,25 @@ static struct pmbus_driver_info tps25990_base_info = {
 #endif
 };
 
+struct tps25990_data data_tps1689 = {
+	.info = &tps1689_base_info,
+	.info_local = &tps1689_local_info,
+};
+
 struct tps25990_data data_tps25990 = {
 	.info = &tps25990_base_info,
 	.info_local = &tps25590_local_info,
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ .name = "tps1689", .driver_data = (kernel_ulong_t)&data_tps1689 },
 	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = &data_tps1689 },
 	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
 	{}
 };
-- 
2.34.1

