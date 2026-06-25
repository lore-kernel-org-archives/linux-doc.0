Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62FA3E51CB
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403518; cv=none; b=K0oL85UCsfkSU7Nux+2nR3DL7fCC11ofpw9LFtW46McKPGLMsmnwJ68dtIux3+INd85+6BERjNyigY4fqCdHesIvETcVNnOOGQ+bWf95ulg+YcpoQRvI/CvpTigvAJBiLnMZEJI0O0e50Igaj9z2w4SlznCKJ5n8zJt48edHr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403518; c=relaxed/simple;
	bh=P3Fmu2M7yicfX8YegW+8uTR/Xoo2VqnCcOOBa6qBxYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMVU9vyzI2+yhZuhOOaYoWriEo4OiVoh4F2DEYpDiz307xAarrQZuKU117oMyljRhaA8sVJ/+p19cWJJ5vq00PfOb845PrShwik/CsyFRUCRCTk7VGMFmRR9kd70Va2uKQ+rH2aLewyGT4Nlm4vD7IntwFFhDHO7o8lUhG+CBBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDOZDhT2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDOZDhT2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b3637b90so137515e9.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403513; x=1783008313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWN54lw7/VCj9KUx153JrqSzq8vKsCI/ogPA08qnUmE=;
        b=qDOZDhT2z7s2cP2F/Ki17zjN8ywlqzv7zqql5VMvdG8Huf+9syzT1zLhMyqGk+3+fN
         UeBNpalNlkiR4O47kcjxdYmssT5kpuD+owGX4mRjhOsoiXqt7c3PfGpxgojJHTXcVvkH
         rd6/STA45x/gcN9bsUYze9tI7+eTlqC7CgPZshxIdh2Fcow0DfsPaqDQdgaaN3oUSh7f
         /VoomYd/VLbOom65KYn9YgHmWga4DQNohX/Bci4TLi0oV8l/qWyia6PHA+5NbKY/Lo6X
         5AScUahZpoV3bxoU88rGp+LI4Mrtj3OoYnF+a8bqPlZy/zF/7x9G7qg7NZwFkguYDpBJ
         5HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403513; x=1783008313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JWN54lw7/VCj9KUx153JrqSzq8vKsCI/ogPA08qnUmE=;
        b=CJiurUgh+2yGAXftITBr8gpmJFPJXuLX4u6oH/V08Nt7YgB3sAtUQBbhZc7ZOtOXuI
         LgCA0NNe3cM12Fm6zKSqetHHyrtZ1uoShS2ruzOA8LcV4QvlzhgFPSRhshxo2ILvQajS
         4UJbx6Rk9BJKfR6uKDJceKl37lRgeJGofDPeUbzo6OAOjOoVzPwN9bkf3cOtF9NtQdav
         boWL2fuIe5EfuwKM4wDsfc2Zt1UXFaFVeGqA5KDtWNcGlfrINXUppvhGSagSEXQfyc5Y
         Y3OLvsrZ5mxLhL1MqNLiABlAlFsDK2GEuTYvmQQ+YVqBD6jjS+nMHJkyVNV23CkuXbTL
         x8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8UbQKMpnrx7b7lO0TGE1/xFdXTi3V7gLfGYB9NqcX8gHcViwn/7VqjtSsyGRhkxATii2lsTbBu5Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6/9y64lK2kFBmn0wBZNT4ky1eliydDCUEb48CduuI9PsK5QX
	xSZauevKFn6pq278R9wehJPDvO/vaeJg6KFV9hUZk/fNBDKBJG19kUFL
X-Gm-Gg: AfdE7clH1nx1kuV5DloeckP06C6qYZkMDApvHdwc50gztqwqdQfnk0eJ7Oxi7mFraNh
	IcLJ3A11Dq99ESTZsrHd5nos8HyKHPW2W4aEWUakfepXaiakiafn4XmRr7J5J9G5m4oyMo30Sd+
	+J6MuvBun2FElCojf6nt57oSAQdExYiOpGHT2xOzc6j2cIvePIhUbAWU/wW9fO/5ESUFEuqWxo+
	BW8oFqCRSOzO+NasOHDXtZ8Z3DdTphzMzafEFQ4GzgB5jfkRk+a3eRVHtEMim+y07ZOO39ero8i
	c5wjn33ShN1ujUqXQYIALOh1Ut4+NWpsqB/fbW8jFJaaArSqQAU/WlyOa8VP859BibAfb/PUzVM
	3O4QpEPZcbkfeS8BSO4huQamcjutaUx1g0F2unSqQdzhdlUgpIrnREg7/yZU+8DSiTNQn4sEwlZ
	sabggoc4WkterH3YQmqnNFJJJrywoN3fygozH+3n3dbii4NTmFgl8G28fRU6Nu8w==
X-Received: by 2002:a05:600c:6b70:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-49266893253mr29913545e9.25.1782403512695;
        Thu, 25 Jun 2026 09:05:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926543be74sm52220975e9.1.2026.06.25.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:05:12 -0700 (PDT)
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
Subject: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Date: Thu, 25 Jun 2026 19:04:23 +0300
Message-ID: <20260625160423.17882-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625160423.17882-1-flaviu.nistor@gmail.com>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
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
Changes in v2:
- No change for this patch in the patch series. 
- Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.nistor@gmail.com/

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

