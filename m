Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176C2E738C
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203948; cv=none; b=las24JSsOQs7rjqy+YGbNKxl9YQp6u/YqY/dzX80ttRdgUhptWdoY15eIjPafh/F0TJ2288Kix8qFkr2WX9w4sMIXvoq6DfZ5hTRxZ3krYjpUJPhIoQDJGDkojbSlndPPaibX5SUAhSJNs5QFMi0rwH4oYa7tVnOEtdqW7TDE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203948; c=relaxed/simple;
	bh=WLubSJnK1lH3E3SqhojYZmqtUZ/AuVEmxpP5LIx1NI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kV95mxJyFquw0VvlN1WQppTRZv8JpkhBdFsWqkMcPrDdmW5J+fkZt84G7etz39v2gbQgyUBK9UREnbqgGew4qiYFi+fCeKXCPNqDI9JRtekkuuf/XFGWSVoC/1xg+d3SjUgs9ACyUkROZavQdyQhq40u11T8s72qzBrXixNJ4gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SUUMFRKV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SUUMFRKV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1809531f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 18:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203944; x=1785808744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BXefn9YkCGaSly50U2hcwiUfqXNtCoLrI+IDcpsBXc=;
        b=SUUMFRKVp4i2mmpafD+4eIG2K98tiTFtUkk0xL2HfbkBolTJMnmNBLHefQ3jm6V1bS
         sriJXRPYYbcmGDo3LLm5E125rpipcI/pIL7eCc4V5+IC8wSj6vtn7yvGbYK6BbZ0a6cx
         YKhL5ddKHOeKRjhdsCIRqOd972ZiG0sKprU+kchSwsmw9mdxTSj0URmSsFd9uZRwAv1U
         2mb4lD0Pyy1y9tciZbRkjH82JXQ0GyDM+Z5MoFovkIpBBJ7ZDx2qxImAddPmSCoxlHTX
         PMm3U6ykK89Ln/XxFSSOipQdT3PCRgPNKStiCRvF92IqQgrDznuEsYOV1F7MCwz2pnJp
         Iqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203944; x=1785808744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9BXefn9YkCGaSly50U2hcwiUfqXNtCoLrI+IDcpsBXc=;
        b=NpkyO+z+H9KMAqmNfrORonIHdM1uGlEV22udRWzmim+azgtcD/Q1O1RmBjZAKn2ihX
         slJ/gzYBPyFzshWqUkoRvV2VCG1bEV8/u/W/3SQUiQ/FGzT8ZaWvyvl/ny1uuabqH2XT
         cRpZhnqu4t+Ez/dEqRvTrDH3lE4wWWIf3njTC8ufxPM2KU9JLCYra2fOiZaXIwhNDly6
         VOW3uprtxnLixH0QlEHLsiR8Rn3gdlCxMnb3xR63LwqxuXhG73GvFmIyp1VCFAKiwVZw
         ryeXyKtb1p72sAFoXt041HJoRiwUvK7Vr+0qohQcW434BPkgV3f29LiRuDEP8JVqUfo7
         ZCNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7VOiumXErOMMrTl3ibE4oR6CXED4t0Dq4toasDwECaJcXzCBkX4n1sfh6XTDKLU67JZ2m+JzvZL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzez2dgBi0vMoztfjVCMPsLwG9HSCiY+YhcAaIzEEG0g38dWdzb
	uHzGgCmveFBl6bvmU0H8XDnVwbkM1GDCCgJfbaU5pjjoO2zmeG3CKgwC6+vJBuq4WNA=
X-Gm-Gg: AR+sD120WJ8DiLc1z3Z7dUSvDgwNMiqgf763NuY5Hb97VKWp9cXJgp3Fgdnm8f1ATx+
	CYu4TeazAHMlNq5Q5T1rkGjw9I6ECY/eQ+jXSROpv/T/hdNast/NIHTqhNLo4qVgROF9rHr/Un9
	8J7owax0o+Du34ANPt2WPma9WntZJrMcCNWpWL+SLMwrr+wm6wPCf/U2lXevBPdfU6416UwhSU7
	dzm1joWgL83DRJ5wcjaB5KlFJI5WsPdxIQC8ngP3v3TeBCty0C0nNpvZ7b5qNouXPJZsvGZ3aqB
	ose1/2FQYdWXYX0abuTWosCT7yYvK28+lIHepP8SEeCerAxdrrRQRrbsV/Nv45/X6kYuByPH17M
	2Sa9YXSv5zWwwdQ4N/kTT9WbZizWgfODLCx9mPZV8KXSRa6I1KE59pk1SsPnD0KDWAPYBUzWk+q
	Iuguo8OcxbR4x4EY1wRIeDa3eTkLzq2dBo1oZBim1vQ6OGGGrYwzjXR5Ghnn5aIKnpvFM5Fw8XU
	//50pFTIWADp2H/aZVmQ9j9KrAkcGHi7r9JW/VAUHitOLI=
X-Received: by 2002:a05:6000:2011:b0:47f:962a:9f4d with SMTP id ffacd0b85a97d-47fb1ed97bdmr338114f8f.15.1785203943778;
        Mon, 27 Jul 2026 18:59:03 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:03 -0700 (PDT)
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
Subject: [PATCH v5 1/3] hwmon: (pmbus/tps25990): Rework driver for multi-device support
Date: Tue, 28 Jul 2026 04:58:46 +0300
Message-ID: <20260728015857.193890-2-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728015857.193890-1-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework existing implementation to allow adding support for new
devices to the existing driver. chip_id is used to identify the
current device and differentiate logic where needed.

Changes include:
 - Add an enum listing supported chips
 - Add a structure to hold per-device m, b, R coefficients

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/tps25990.c | 123 +++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 9d318e6509ab..490dcd2a5fa5 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -47,6 +47,15 @@
 					 PK_MIN_AVG_RST_AVG  | \
 					 PK_MIN_AVG_RST_MIN)
 
+enum chips {
+	tps25990,
+};
+
+struct tps25990_data {
+	struct pmbus_driver_info info;
+	enum chips chip_id;
+};
+
 /*
  * Arbitrary default Rimon value: 1kOhm
  * This correspond to an overcurrent limit of 55A, close to the specified limit
@@ -337,63 +346,65 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
-static const struct pmbus_driver_info tps25990_base_info = {
-	.pages = 1,
-	.format[PSC_VOLTAGE_IN] = direct,
-	.m[PSC_VOLTAGE_IN] = 5251,
-	.b[PSC_VOLTAGE_IN] = 0,
-	.R[PSC_VOLTAGE_IN] = -2,
-	.format[PSC_VOLTAGE_OUT] = direct,
-	.m[PSC_VOLTAGE_OUT] = 5251,
-	.b[PSC_VOLTAGE_OUT] = 0,
-	.R[PSC_VOLTAGE_OUT] = -2,
-	.format[PSC_TEMPERATURE] = direct,
-	.m[PSC_TEMPERATURE] = 140,
-	.b[PSC_TEMPERATURE] = 32100,
-	.R[PSC_TEMPERATURE] = -2,
-	/*
-	 * Current and Power measurement depends on the ohm value
-	 * of Rimon. m is multiplied by 1000 below to have an integer
-	 * and -3 is added to R to compensate.
-	 */
-	.format[PSC_CURRENT_IN] = direct,
-	.m[PSC_CURRENT_IN] = 9538,
-	.b[PSC_CURRENT_IN] = 0,
-	.R[PSC_CURRENT_IN] = -6,
-	.format[PSC_POWER] = direct,
-	.m[PSC_POWER] = 4901,
-	.b[PSC_POWER] = 0,
-	.R[PSC_POWER] = -7,
-	.func[0] = (PMBUS_HAVE_VIN |
-		    PMBUS_HAVE_VOUT |
-		    PMBUS_HAVE_VMON |
-		    PMBUS_HAVE_IIN |
-		    PMBUS_HAVE_PIN |
-		    PMBUS_HAVE_TEMP |
-		    PMBUS_HAVE_STATUS_VOUT |
-		    PMBUS_HAVE_STATUS_IOUT |
-		    PMBUS_HAVE_STATUS_INPUT |
-		    PMBUS_HAVE_STATUS_TEMP |
-		    PMBUS_HAVE_SAMPLES),
-	.read_word_data = tps25990_read_word_data,
-	.write_word_data = tps25990_write_word_data,
-	.read_byte_data = tps25990_read_byte_data,
-	.write_byte_data = tps25990_write_byte_data,
+static struct pmbus_driver_info tps25990_base_info[] = {
+	[tps25990] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 5251,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 5251,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32100,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9538,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 4901,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -7,
+		.func[0] = (PMBUS_HAVE_VIN |
+			    PMBUS_HAVE_VOUT |
+			    PMBUS_HAVE_VMON |
+			    PMBUS_HAVE_IIN |
+			    PMBUS_HAVE_PIN |
+			    PMBUS_HAVE_TEMP |
+			    PMBUS_HAVE_STATUS_VOUT |
+			    PMBUS_HAVE_STATUS_IOUT |
+			    PMBUS_HAVE_STATUS_INPUT |
+			    PMBUS_HAVE_STATUS_TEMP |
+			    PMBUS_HAVE_SAMPLES),
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
 
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
-	.reg_desc = tps25990_reg_desc,
-	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
 #endif
+	},
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
-	{ .name = "tps25990" },
-	{ }
+	{ "tps25990", tps25990 },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
-	{ .compatible = "ti,tps25990" },
+	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps25990_of_match);
@@ -401,8 +412,9 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
 static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct pmbus_driver_info *info;
+	struct tps25990_data *data;
 	const char *propname;
+	enum chips chip_id;
 	u32 rimon;
 	int ret;
 
@@ -415,15 +427,20 @@ static int tps25990_probe(struct i2c_client *client)
 		rimon = TPS25990_DEFAULT_RIMON;
 	}
 
-	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
-	if (!info)
+	chip_id = (enum chips)(unsigned long)i2c_get_match_data(client);
+
+	data = devm_kzalloc(dev, sizeof(struct tps25990_data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	data->info = tps25990_base_info[chip_id];
+	data->chip_id = chip_id;
+
 	/* Adapt the current and power scale for each instance */
-	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
-	tps25990_set_m(&info->m[PSC_POWER], rimon);
+	tps25990_set_m(&data->info.m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&data->info.m[PSC_POWER], rimon);
 
-	return pmbus_do_probe(client, info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static struct i2c_driver tps25990_driver = {
-- 
2.43.0

