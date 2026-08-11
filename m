Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE654334AF
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491596; cv=none; b=bREd7y4BKzXACCs+2Wrcs/IQiu+VFjup0IRXcYRpVLZhJPfNc6kIC+INw1y9qjnP7TkKa4t0PMAKdZg9+3k3FsU9k9gaDoj7fv6OgnSEYJlGDTNuUN1j+Hnpf8pWm0LlJZsUNorElq1PeNEW9cfCLrfCx2fDSJm/PL+ANUyN/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491596; c=relaxed/simple;
	bh=TQ8cIteOUoh0RN9lFPHnaSOVGs8QySDAURgXCYGyLUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3xo/YejMweJo5jPA5JXFbG0fb/+mRwe4Yg6+6DA8O4zUTMHueWjBUzxGXC/mLL2OD/80UnVvP8DQFw2oGvnUisgSAwEgKQOzUD46nWxR2jBUZGsCh9NGmMhawcFh2+Azngri/I4KGfAqAu499oqXjed9ricfY04YWf+o4AP6Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=Y5wbjcwL; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="Y5wbjcwL"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8eeb4508f29so2752516d6.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491594; x=1787096394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=Y5wbjcwLR7n/kmAnAVNpFnb/AWZYjXPmXxAHBOBaHJCTtyTH2JxbLeSc54LZcjRNMo
         /ZQkFq5arRoKzEZHZ5ffkCltL3VxFhqLq0zL9/OELtVkTcZrlhBmVKsB6E9zI9k3xz8W
         qVuDNjEQXubMU4AeU4lIat4dImkXzn9th8LQQ7yQr9S6fzM5o8iiRDQ0rcqr7NwpotJH
         Lc1cuOon3/FyLAV3mA+vBlxmKQNEh/aIzNAMkiR+g/xEqEn2Zy4vh/2tPAIzIjO1t8bE
         VhRjVmk36910UYYWpAvX2leWk5sQ1Gn2LCDI8LnEZeAf26ZBAAlfxAJzMR2U+o17frgH
         z4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491594; x=1787096394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxycei7+Mdbc9lEQ9ESQixLANLMD+YSTOeLWke3pkoY=;
        b=n6Ti4yz+EgobCyH2peNP48J0YkNj6Dy0gFHh/fDr/WREb2tQ3NDn1nPZf8jPfTPY/T
         AQGFdBmdbqQWkeCru/AjtHvJ5vavOfhAfv8lyV355WVrv5PxvLQZnGItZm4dFOdSDIWE
         xGK4hjwArCGgddL0egg2Hp9+JSyWXlbs7JaFRRksME2uctpqZxqps2/0OGq029iWtpWn
         7lJEicCm4WAnmFyDfClGrFTOo84/HM4d8oiKkrxUFG76yxbwTi9uG0MKqujkCWpVVQG0
         c3sWtbzm7pUiYNcpEnKrntefUpR6Y5pZz/ufIfMHsgB6y2MunVwuD8ps0hCZJ5V8fYRh
         j2Cw==
X-Forwarded-Encrypted: i=1; AHgh+RosPQuDggoGqTaIBUPFNYCotfRayHL4ldpFq3YOFOItF6wbqehE+NeOPEDK8kpkVjhL577IRqwHG/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZw2xoFt+YBU1WR+cX1y2HTcFeaji+hBiwuJzSJ/NJsGJxiFxK
	jM9DaeMvVSWz6MViIORg+IVPLHYTO+r2oCPNiUVXt6RtmyVs2aO2iB7MNXKnaGHZ/cU=
X-Gm-Gg: AR+sD13iizIaymfmq+qyPsZq+bJAh6aiAC7BLtptqT1/wKg6/lsYCWiRjFuIkQCDARO
	SiYE6EYznyfofN9KXuzc56+lSCoR0cWOPtW+y15SIJy/tnGdYn+MvBO+FU5E9ggoPL4zl4CCE9B
	vpR3tr4LjlMmXePAOSMuPQDXSPuUEVqtycRtcPAX1bgc26TheD9xGNXYukIcmrZe25XDDRqBYZK
	Hlh/xFNDqgm93LPuHg2WSw7KFdr1E9z4AZ0fhK9xFyZmqJ++CjFNGlBWGe38uvnfmUhN2bVSbSs
	IJJH7NQbErXwKlImvssgMSkTLxZdcBiglEb55iPATVJSxv986qu2+aGCRPrC+orRjdrlFAEV1JR
	310hpfORQNEeAqCIefNQnvojvobboSodE27+qdijjFJNaZCeE6rWw3LnirGx6cLvSa0ErM9i5pR
	6QzG2SQSWWVApaUuPCmHhzLfG2ssyxAU6H6CE6blKlJde4DVDVxZJqIZmfvZHF4pa1vXoZrSCpK
	Up3VHS9L7GjJp10QXlx9eqfadWd6GQgdQ==
X-Received: by 2002:a05:6214:2d45:b0:90a:3291:7ba3 with SMTP id 6a1803df08f44-90a6ff1cea0mr8295346d6.5.1786491594021;
        Tue, 11 Aug 2026 16:39:54 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:52 -0700 (PDT)
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
Subject: [PATCH v2 1/4] hwmon: (asus_rog_ryujin) Add per-device configuration
Date: Tue, 11 Aug 2026 19:39:40 -0400
Message-ID: <20260811233943.319729-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811233943.319729-1-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
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

