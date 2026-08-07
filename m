Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC7211466
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060882; cv=none; b=aNJvALldYE9rXDiu9mTJK36xbf4x6PLSQuCjSgiS4iXU3NcJto/7qS6LJkGwJpJfSNpWHzsu0Htvdp4W5RYD77QSXTWQKHDPYwV3Z3+h1ZwvBhlJyQt0UBCbtFomuusiZOXkn9gKLPQja3epV/gOOsUma6AZru03weD+Fu1nb/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060882; c=relaxed/simple;
	bh=TQ8cIteOUoh0RN9lFPHnaSOVGs8QySDAURgXCYGyLUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4JcUQQrbhXt3pxHsne8VmT78PiDCwi5zDbE46+BfEGZHwhKqu1FyF4rLeAxa+2kkJ3iFZxM3XgnWvUIzPOhaQAqb/zWMBhr3UBd+c4BnsOeO5LLcHZ5cj2ch9KYdQMU0v02GwHnIP0mwBqgoloFmdPIMp1StB4woiMKo+6/yrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=j7XI1E6q; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="j7XI1E6q"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e55b62640so150998285a.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786060879; x=1786665679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=j7XI1E6qlCf5TctTltWxpPvBJUjCVRX/LH2xTbrnAGkdwDLr55VuAEgrUlarpqDewE
         ttBH+KLrH0CR607FLEtCRZ+yVOjdgcZNxf+l1WXKQE+izMeprjG2x3BRi8dqcPJlb88t
         FoKCMhZ9SP//lIuP43bfmX6lpRMlfKGIBqcBjueYiPQFBoKJpcNfSpohOmR4BaO5U/MH
         Q+2T0S5We1aiGwt1vUy/uvFEOU4gc51SKbhZRHiEsro03j432orSoFx84ht0PfYW7iqG
         r8eJWLCubqf9kK/4A7OTeDijDmrYwD1to4T9raKlsRDWaAo5lAF9zDAhjTiU5rebD04X
         uSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060879; x=1786665679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=aZkGlgBG3CR/Hgsw5bFtrIfP7L+y/kyv7IALQS+u+pb8DP3ximRhZngTpbDTIpVRht
         VVF3ait3zER9glHzUw/vtZNoi/x3zCo7m5YG5MEma1r7BT+zH1JA6xNvDVkQyI0OdC9/
         38iQaAAX4nsPItaYXnaEA6Z9lNhldM90WVUMu2lwqYuEpg04aRFVUA8eEsJxarnDqrR2
         tGjGyuwtp/r1vGHt5JxNM/tZhle3D5AkmfjS/aX3kWEZ+cYszI+KxYvsYYq+9I1/k8t7
         KTTp6GpIAc4EO/XQC8RDbaK+839ga9unQpVOjxFRHybWpezLkXQXOIhuiPShDH61zdMx
         gMkw==
X-Forwarded-Encrypted: i=1; AHgh+Ro43qdKjO/sC1s6t0vhYjQ2a+DwK3kHkd6NECdm+vA5DMiI9tH2Cm4g/aO8/TGqIQY14OxmzgMpst0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nbLw7ABF3YqO0E5nyL5LY9RXktzuyDgCcNVYbNJ+uxm+j9/D
	K+kA+uPf9k0M8UvsNSdt0dihq2HbHtIHJzv+5UMMrGm9zW3ecReEqUlX61wWnzoC64o=
X-Gm-Gg: AR+sD102u0jWCYCmJP1+93CbJ0e0gSeyzhBMEEbNVRkknZmcH3oXOuPrkTjp9GYQKfJ
	dfki/6M9JqonR0Aq/EcTdSwfwry3XLBOh1DFhoCJdp1lmWrVGcTIWf9bgfXWdB+QBeRFpQA5ALr
	UrKhTkuQi6TbeBh3ynpjFotRAhNGwG2wlAkfN6TscjVgDiBx8IkQojgvZlzNEaVMLX8TTxhLlLI
	YPyqcXV3roUuSvKGsp6xXbJDkcBjyPBK6+vJnSV4lMtV2n46fOh9l7xqI85ymp4NegHfO2vWzWX
	MwlVsPwCZ1rI1ivS2342DKe+blyIyf1bgisZyu4+/GDvAtlZaXO525rSlYkJ+uOGxLfAB4MQz27
	CSMYuEmQ2ejBXgR9Dfu94lPO99DjDGfQiOXjAJputlSpgytii2Sp5ITxwuRUWqtKUacHCi2LEkc
	m2UjhgYJtZ/KjtTTPZ43PMVRHK9HwnwGk1wDGrCp+v7ZKUis/ozrRRDAjLacn0FGGqyeO912pDX
	Aa7OXDxA4lo2oqlCjudEg0j80134HXFZXK3ruVvpm58
X-Received: by 2002:a05:620a:28cd:b0:925:56bc:b8bb with SMTP id af79cd13be357-93648fafb5bmr1890073085a.9.1786060875234;
        Thu, 06 Aug 2026 17:01:15 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e279f0esm27341485a.38.2026.08.06.17.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:01:14 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
Date: Thu,  6 Aug 2026 20:01:05 -0400
Message-ID: <20260807000107.1786892-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807000107.1786892-1-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move model-specific report offsets and capabilities into a device
information structure. This prepares the driver for coolers which use
a different report layout or do not include the external fan
controller, while preserving the existing Ryujin II 360 behavior.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 72 ++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 10a1f5aca988..b86b87e33615 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -18,15 +18,25 @@
 #define USB_VENDOR_ID_ASUS_ROG		0x0b05
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
 
+struct rog_ryujin_device_info {
+	u8 temp_offset;
+	u8 pump_speed_offset;
+	u8 fan_speed_offset;
+	u8 duty_channel;
+	bool has_controller;
+};
+
+static const struct rog_ryujin_device_info rog_ryujin_ii_360_info = {
+	.temp_offset = 3,
+	.pump_speed_offset = 5,
+	.fan_speed_offset = 7,
+	.duty_channel = 0,
+	.has_controller = true,
+};
+
 #define STATUS_VALIDITY		1500	/* ms */
 #define MAX_REPORT_LENGTH	65
 
-/* Cooler status report offsets */
-#define RYUJIN_TEMP_SENSOR_1		3
-#define RYUJIN_TEMP_SENSOR_2		4
-#define RYUJIN_PUMP_SPEED		5
-#define RYUJIN_INTERNAL_FAN_SPEED	7
-
 /* Cooler duty report offsets */
 #define RYUJIN_PUMP_DUTY		4
 #define RYUJIN_INTERNAL_FAN_DUTY	5
@@ -81,6 +91,7 @@ static const char *const rog_ryujin_speed_label[] = {
 struct rog_ryujin_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
+	const struct rog_ryujin_device_info *info;
 	/* For reinitializing the completions below */
 	spinlock_t status_report_request_lock;
 	struct completion cooler_status_received;
@@ -112,6 +123,8 @@ static int rog_ryujin_pwm_to_percent(long val)
 static umode_t rog_ryujin_is_visible(const void *data,
 				     enum hwmon_sensor_types type, u32 attr, int channel)
 {
+	const struct rog_ryujin_data *priv = data;
+
 	switch (type) {
 	case hwmon_temp:
 		switch (attr) {
@@ -123,6 +136,8 @@ static umode_t rog_ryujin_is_visible(const void *data,
 		}
 		break;
 	case hwmon_fan:
+		if (channel >= 2 && !priv->info->has_controller)
+			return 0;
 		switch (attr) {
 		case hwmon_fan_label:
 		case hwmon_fan_input:
@@ -132,6 +147,8 @@ static umode_t rog_ryujin_is_visible(const void *data,
 		}
 		break;
 	case hwmon_pwm:
+		if (channel >= 2 && !priv->info->has_controller)
+			return 0;
 		switch (attr) {
 		case hwmon_pwm_input:
 			return 0644;
@@ -198,12 +215,14 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 	if (ret < 0)
 		return ret;
 
-	/* Retrieve controller status (speeds) */
-	ret =
-	    rog_ryujin_execute_cmd(priv, get_controller_speed_cmd, GET_CMD_LENGTH,
-				   &priv->controller_status_received);
-	if (ret < 0)
-		return ret;
+	if (priv->info->has_controller) {
+		/* Retrieve controller status (speeds) */
+		ret = rog_ryujin_execute_cmd(priv, get_controller_speed_cmd,
+					     GET_CMD_LENGTH,
+					     &priv->controller_status_received);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Retrieve cooler duty */
 	ret =
@@ -212,12 +231,14 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 	if (ret < 0)
 		return ret;
 
-	/* Retrieve controller duty */
-	ret =
-	    rog_ryujin_execute_cmd(priv, get_controller_duty_cmd, GET_CMD_LENGTH,
-				   &priv->controller_duty_received);
-	if (ret < 0)
-		return ret;
+	if (priv->info->has_controller) {
+		/* Retrieve controller duty */
+		ret = rog_ryujin_execute_cmd(priv, get_controller_duty_cmd,
+					     GET_CMD_LENGTH,
+					     &priv->controller_duty_received);
+		if (ret < 0)
+			return ret;
+	}
 
 	priv->updated = jiffies;
 	return 0;
@@ -289,6 +310,7 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 			return ret;
 
 		memcpy(set_cmd, set_cooler_duty_cmd, SET_CMD_LENGTH);
+		set_cmd[2] = priv->info->duty_channel;
 
 		/* Cooler duties are set as 0-100% */
 		val = rog_ryujin_pwm_to_percent(val);
@@ -394,10 +416,12 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 
 	if (data[1] == RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
 		/* Received coolant temp and speeds of pump and internal fan */
-		priv->temp_input[0] =
-		    data[RYUJIN_TEMP_SENSOR_1] * 1000 + data[RYUJIN_TEMP_SENSOR_2] * 100;
-		priv->speed_input[0] = get_unaligned_le16(data + RYUJIN_PUMP_SPEED);
-		priv->speed_input[1] = get_unaligned_le16(data + RYUJIN_INTERNAL_FAN_SPEED);
+		priv->temp_input[0] = data[priv->info->temp_offset] * 1000 +
+			data[priv->info->temp_offset + 1] * 100;
+		priv->speed_input[0] =
+			get_unaligned_le16(data + priv->info->pump_speed_offset);
+		priv->speed_input[1] =
+			get_unaligned_le16(data + priv->info->fan_speed_offset);
 
 		if (!completion_done(&priv->cooler_status_received))
 			complete_all(&priv->cooler_status_received);
@@ -476,6 +500,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 		return -ENOMEM;
 
 	priv->hdev = hdev;
+	priv->info = (const struct rog_ryujin_device_info *)id->driver_data;
 	hid_set_drvdata(hdev, priv);
 
 	/*
@@ -546,7 +571,8 @@ static void rog_ryujin_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id rog_ryujin_table[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_ii_360_info },
 	{ }
 };
 
-- 
2.55.0

