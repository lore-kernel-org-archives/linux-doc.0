Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9BD265620
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130936; cv=none; b=ZQIThbRoYZqPtAk2pWV6+1k0QhPqT4NlqIyEBUzF13RajvlQrlpFHgbJSw3klL8UvLUqlWhdHuuqEQvl325w4DWUVOGXnlwx9P+mvn0KQgfHdxRgAU8/RQ0jj3OOYowWmOTPaLJkCOIDcemqPPfXD6YPd4SI8d8bmknf71Ku0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130936; c=relaxed/simple;
	bh=28S+hwf3FQ9UQMsWLsBpPG3yCFP+JNRXsC8IN1JFl2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOhr0wp4mbjK4kgfDUk45Fawko8FHIC0Xe6vTpFpUzz1Br7TIRmSw+36eGjgwT6BU0xrS1KftS9ETxfZ7NFWKzZW0X4LiH2SWHk42JT4jhlYJsC0ff9SuudAv47drMoPn7RH1lLohbUojrKeI/s/Ziiun9s3MvRX4+J8A2MtLHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9NF73pp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9NF73pp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso4277565f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782130932; x=1782735732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaQZWDz5cyx/OORRvlw+BuYWZasvfEG4FxKB1dhqSgI=;
        b=i9NF73ppSlIjr88WDg7U2PVyj73XRezqE7s/J+yfiIvXkjxB5HB6dpLvVFipPTGprI
         tlhE/uVAjJpPk/nUJeYwnG97b6FSL/uVbuEJOYNbCMgeT9Af263JTVIhQs9PjiEtJKxc
         LpVpVWqEDz0fEDD+HyRT6K3nTmrw1ZzApAsszEIk/rKVgkiwqSmF+HN9sNQC4SWgXxlH
         LlODTo+tH9zz9IuJ+iAaw/E897k7A0LQApJX+5TIfG2QV5+7JAMKGZ8DbILdurPouWkw
         rdw86h6GtC2WaEe6Za4HPCnhF4KVHPPgUM1bodvBDrGD01HrGa3CBq/1H7W5woUTQ4AT
         K+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130932; x=1782735732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaQZWDz5cyx/OORRvlw+BuYWZasvfEG4FxKB1dhqSgI=;
        b=gPrGPRRToD7Dl3rHrAmsAArsHZ0ByvQMhkU6IGiifHvUHiEH36aBRnIU2iXDyeXDe7
         cdjCtVEYVn6EXpzLKYT3tmED5fBW9yY4STloRzxsMP1/9+EDF5UEXdTHCliIDKUKGKRR
         cV3/7AFlyzQwz0wyTAc9WTNG7e66FzuFvPAn9Yrn5pUKpmaq0CAOGolRTBprdu0K+soW
         PNjg1VR1s2WZ/lG6VlsWf1MalbDtDy/ubW7sTEineQJRDbbJVHWNR/Q6BYyAjvsR1IBn
         KOmx2qB6zO9pF/cyopfKfNCsMV+wzU/ewXX6Tpiob1WwRjyUQHsz2IiBzAFMhgglbZ5i
         Khug==
X-Forwarded-Encrypted: i=1; AFNElJ/xasn1R3nJHepmCGsD9DBRPupdQTGOCo6/axxhOss0DgpfShUYvyRExkp5UAsqpzFexABA3M9sd7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHSiiKTt5NB9INaXluWxht9ixGm1JWNHz2SgLsgxyvEhDo5IFC
	Y9fK2cscBtl2jjUwIFVxWLVTdt5Nl9YpopTC9PnAXs7AhjbobWYde0n7
X-Gm-Gg: AfdE7ckyOa184OlupTjun8qYu0Ew/ftBAC+G64H3PjbZsTDZFVtHjLaFHTvXccIV0Ze
	/MsrlhlvDVoEfQCK+DoPGuh/3U44IuX1n/1pzrOw4ckf7qJ1WqFI0H9fB+/eNbBSjDIiHMqGsEO
	dTxLn+QyajoRE2l7WvWJlHZcI7xj9uqK6xwL+muLjuSK0kLK8pVAgipZYJbMglDH9R07AkS3hPe
	2x3A+8fRQd4g3L0y6WyPfyf53Ije4X3m4uD5BlRAqMXfDWHX2CV3Bll1pHdhBx2il1dICEEGZIh
	Pm3rV9ds2QSy5coCWZNuILwfqBJfiIKdJlsD3rxU/4HOZsFo50cATzbDL4XEOYjYUkNlAJsfBnB
	Qrsgve4+f3FdzZ+pwG6VHXXoFxoE0L6fChEcGOGbtPBbTNkUu5xsYre8j34fUsAkuB2JzUPl+H0
	9HziAAiJ5c4K73Vrcx/FunLMAxdlMn2GXd3XMWhM7i04reQHV3SpRkM+/7BzZV6Q==
X-Received: by 2002:a05:600c:5489:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-4924668299emr195917525e9.6.1782130932269;
        Mon, 22 Jun 2026 05:22:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm27255637f8f.12.2026.06.22.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:22:11 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (chipcap2) Add support for label
Date: Mon, 22 Jun 2026 15:22:00 +0300
Message-ID: <20260622122200.14245-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other hwmon devices.
This is particularly useful for systems with multiple sensors on the
same board, where identifying individual sensors is much easier since
labels can be defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/hwmon/chipcap2.rst |  2 ++
 drivers/hwmon/chipcap2.c         | 25 +++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/chipcap2.rst b/Documentation/hwmon/chipcap2.rst
index dc165becc64c..c38d87b91b69 100644
--- a/Documentation/hwmon/chipcap2.rst
+++ b/Documentation/hwmon/chipcap2.rst
@@ -70,4 +70,6 @@ humidity1_min_hyst:             RW      humidity low hystersis
 humidity1_max_hyst:             RW      humidity high hystersis
 humidity1_min_alarm:            RO      humidity low alarm indicator
 humidity1_max_alarm:            RO      humidity high alarm indicator
+humidity1_label:                RO      descriptive name for the sensor
+temp1_label:                    RO      descriptive name for the sensor
 =============================== ======= ========================================
diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 4aecf463180f..086571d556b7 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -22,6 +22,8 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 
 #define CC2_START_CM			0xA0
 #define CC2_START_NOM			0x80
@@ -83,6 +85,7 @@ struct cc2_data {
 	struct i2c_client *client;
 	struct regulator *regulator;
 	const char *name;
+	const char *label;
 	int irq_ready;
 	int irq_low;
 	int irq_high;
@@ -449,6 +452,8 @@ static umode_t cc2_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_humidity_input:
 			return 0444;
+		case hwmon_humidity_label:
+			return cc2->label ? 0444 : 0;
 		case hwmon_humidity_min_alarm:
 			return cc2->rh_alarm.low_alarm_visible ? 0444 : 0;
 		case hwmon_humidity_max_alarm:
@@ -466,6 +471,8 @@ static umode_t cc2_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_temp_input:
 			return 0444;
+		case hwmon_temp_label:
+			return cc2->label ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -552,6 +559,16 @@ static int cc2_humidity_max_alarm_status(struct cc2_data *data, long *val)
 	return 0;
 }
 
+static int cc2_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	struct cc2_data *data = dev_get_drvdata(dev);
+
+	*str = data->label;
+
+	return 0;
+}
+
 static int cc2_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		    int channel, long *val)
 {
@@ -670,8 +687,9 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 }
 
 static const struct hwmon_channel_info *cc2_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
-	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN | HWMON_H_MAX |
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_LABEL |
+			   HWMON_H_MIN | HWMON_H_MAX |
 			   HWMON_H_MIN_HYST | HWMON_H_MAX_HYST |
 			   HWMON_H_MIN_ALARM | HWMON_H_MAX_ALARM),
 	NULL
@@ -680,6 +698,7 @@ static const struct hwmon_channel_info *cc2_info[] = {
 static const struct hwmon_ops cc2_hwmon_ops = {
 	.is_visible = cc2_is_visible,
 	.read = cc2_read,
+	.read_string = cc2_read_string,
 	.write = cc2_write,
 };
 
@@ -710,6 +729,8 @@ static int cc2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(data->regulator),
 				     "Failed to get regulator\n");
 
+	device_property_read_string(dev, "label", &data->label);
+
 	ret = cc2_request_ready_irq(data, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request ready irq\n");
-- 
2.34.1

