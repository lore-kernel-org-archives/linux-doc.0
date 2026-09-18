Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5E282F0C
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720880; cv=none; b=WNmeNzvQHzp8zORYftzXJccJcGjpGe8zsusd2FwaJqcXLjEBvA3qdZQPxN7VOf6pu1ALRRu5dJmlIYK371tHDAmJ6dAbojtefpHyJE7aEobI6t9cGgAb86Uq6i+okUae5LqYsEEnzSAeRzS+o7NqlTLin5rjGyuKplSBnhKQiP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720880; c=relaxed/simple;
	bh=cKMdC3Knc018ust5Oawrm7rJamFu3163yoo/EBNe9pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZFRFMZG+31O2jC1UNDAm7Y6x+o3rFwDk02io4kwv8Y4TQSx2md0UeW1njnDfAdi/uIZj7x0eo4PR/AP//G6zDdIJF7/46K9CT3fzixp7q7Y9BJ9UXZapKWaqEIhcFiJaWQyOjNOKyqMa4ZSMrvf+vLg3/mmNmL/dmSM+0DvY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtHOMhXz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtHOMhXz"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso506418a91.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720878; x=1790325678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTbNaeeT4nGpdtG9r4mO3gpUBEuw4FJbJhqWWjich0c=;
        b=EtHOMhXz6mH9DuEaAkFXAPM4dJERDO7iNPuvIuWp4kFOGqwVOrqih/Eb6KxAM/N7kq
         bUkWctKB6UCGpnfRlet4/q48nvjEkm+Xrc4JGYnM1Zj7H6xorheu4jpEtUf14nBAudHB
         h8+L3rpjOgKMkpEfgxw9HgcVo9nAlI9Xi4n1YcabwiIbW1O/cESh4XMW6W6Ay3/RdJRP
         yiTAUtFWeKS+/fKKwdfu2xROuB3YJpV274wRtzo+Uy+UfKWLpdA4OdLQ71H0t0l1+XfP
         Tfawn5YU4H15zTUl4NQPRnTmPAkyZwnaAmWxuqTe0HpyF5730ma8g17kAV4kzu3GjMOy
         b0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720878; x=1790325678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTbNaeeT4nGpdtG9r4mO3gpUBEuw4FJbJhqWWjich0c=;
        b=e9a8yEjgog3zGF179T77qqF/nhU3mZMfWC3/8VA67hEUafgnnfsSPjD5gG6T+4N8p5
         +acNk+bayqxknLr82l83J0JsNePM/8XSMF49i5sqlHD1UCMevF9+FVo5utvun17uau1p
         XMHUdST6fDw9QdV6BE9Ku5iF0VkgvrFxBI1Vs1lsn5mSgEcUOgc5XMZZXeQgKB3IgxFk
         qiVKoBzxAwYGIdX+Qws+BapNXRGxnSC5yReXIT+4DJgalUcJhWPUbS6fAuVWlQbCx6Rw
         SZK5WjkpCxg05OuMPsOdQRlXRTVGUqxVsDXDCISUjYmrrFfV9oq+u8Kc4lXRZOty5Nj8
         +AUw==
X-Forwarded-Encrypted: i=1; AKwUvByjBsfFkIXcCzS56rYNwhF4EDTGWjICW+g/nTu/HzvSZeds0+yESUdb/8vrFgeOh5qNFjLV7U9z2uc=@vger.kernel.org
X-Gm-Message-State: AFuF++m+TAJz2lC4ZV+oleQM66CuxgufV5+IQ5Dp3chspZ6M1maUIZvi
	pLEIY2eN4d4odKbHb+Uhzyue8QH9ur9rYDTNuxEca7TO0tq3UkY0XdOc
X-Gm-Gg: AYBFou3iwqkjs62RP/kPAkGzCBUSZYPhYyXIQzDUls4CffsAO+Nv/T+WGR1mQJs1NIu
	cVdXfSrmWR4tGj8UbK+NlGG4lYJ/RD2R7T1rewFZZmGgJz5QdsoNs3Vs/DoX7Y+9sBujGKLDZl/
	y/6ERpdJ6Bl4swMhUI2P8vPLXXfIMAfGeeUw8qVM8y1INE+PLyni6yD6UqAziu6GSCr+w9duJa2
	aTaOG6GwpN8xTuqLiNCz1lYBoakQwmCC3haGBt0J467XKBvCver0EShdn6T7gH4cmFl+qmelNxY
	XCUB9IVeEtcL7bqFE+mVvndCG4bT/k2VybIrToMuiWjxBpAy035WltzBJ4g08Cr49lVVARhHuFr
	6X8P/O9xImSIHjZQse7S3eE3Z6JWa9qtWVt9uT4rhkcdUJwYaehNShk26VJOSOwNGWKCoYhlqWt
	5ASI0Owbg8Lf2/IaY2Ca5Jg0G1yPivjVLVkPoBMCc334yH+hiZQzQOU58qrVTYE7aqzisK6I0V2
	oVj/E3Y58utVzJsSq0cftQAKFLtYzholrtrye65eUS9K8P5Jue3gxDPK00Wkm9O0VxNs7h8zql0
	GQ==
X-Received: by 2002:a17:90b:5287:b0:39e:3285:b776 with SMTP id 98e67ed59e1d1-39e54cb9c71mr4316549a91.7.1789720878593;
        Fri, 18 Sep 2026 01:41:18 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e35f-d966-bfea-f724-5ada-7374.emome-ip6.hinet.net. [2001:b400:e35f:d966:bfea:f724:5ada:7374])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm2093716a91.9.2026.09.18.01.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:41:18 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] hwmon: (lm75) Add support for Nuvoton NCT7715
Date: Fri, 18 Sep 2026 16:40:41 +0800
Message-ID: <20260918084042.19541-3-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918084042.19541-1-syhuang3@nuvoton.com>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

The Nuvoton NCT7715 is compatible with the LM75 temperature and
limit register layout. Its 16-bit configuration register shares the
TMP112 configuration layout.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
v4:
- Correct NCT7715 conversion-rate initialization during probe.

v3:
- Reuse the existing TMP112 handling for NCT7715 configuration,
  update intervals, and alarms.

v2:
- Use the standard SMBus word representation for the NCT7715
  configuration register, removing the NCT7715-specific byte swapping
  and updating its configuration masks accordingly.

 Documentation/hwmon/lm75.rst |  6 ++++++
 drivers/hwmon/lm75.c         | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

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
index 2d2d752aeac9..6b482f688c9f 100644
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
@@ -259,6 +260,16 @@ static const struct lm75_params device_params[] = {
 		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
 		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
+	[nct7715] = {
+		.config_reg_16bits = true,
+		.set_mask = 0x8060,	/* 12-bit mode, 4 samples / second */
+		.clr_mask = 0xc080,	/* no one-shot mode, clear conversion rate */
+		.default_resolution = 12,
+		.default_sample_time = 250,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+		.alarm = true,
+	},
 	[tmp100] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode */
@@ -417,6 +428,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_temp_alarm) {
 			switch (data->kind) {
 			case as6200:
+			case nct7715:
 			case tmp112:
 				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
 				break;
@@ -486,6 +498,7 @@ static int lm75_update_interval(struct device *dev, long val)
 		if (data->params->resolutions)
 			data->resolution = data->params->resolutions[index];
 		break;
+	case nct7715:
 	case tmp112:
 	case as6200:
 		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
@@ -848,6 +861,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
+	{ .name = "nct7715", .driver_data = nct7715 },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
 	{ .name = "pct2075", .driver_data = pct2075 },
@@ -972,6 +986,10 @@ static const struct of_device_id lm75_of_match[] = {
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
-- 
2.43.0

