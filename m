Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026A38F92D
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428749; cv=none; b=J3mYvDxAAlHJU2BPK7OUJmEP7PPpOFqH/etDZZt9J67+a70DBULEut+hhSH150Dw4S90askGAMPdM4IUm9M4/vKs+SiQjmLImJH99Ml7SkG0uWlin6jUpcBQV+fygnKhVyE3673LYcD70lDwCYRacUYprNiLY48P5Ns/0qcDhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428749; c=relaxed/simple;
	bh=AqQ7D7MZG5dCwk0+FI4LPwFjNnbWzQHDbkY9jbK4f6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoUkn2eS577gQMy7CZm8Q2ZikjU/j4bUqa78hC46lAYy5D+HmOuqex9anMcCDrEv7kSGn91ye6/7zwvsmCONkHx97ub2O5vAEZv21/Ka4lloG6tQb20vMkbEANG+/3nO9kjkgIlj6jxaeesYrDX6O/SWt4pnNWJcj4JY5s+DB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=Jv6dA1Q/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="Jv6dA1Q/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso1012705e9.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428737; x=1769033537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEwZJiV03fJ628aCuxgNtJ0Js2UxACV5+XtPBkCCvVM=;
        b=Jv6dA1Q/hdZge3jWWBPueAxiXQ57z4IkxAOcHwLHAax7UImoRVPKoDw4PdF7or/BEL
         tej1t2vHhKUjuBEBiU5D6Hm46nD8B7ybeyVavhyNiboR+m36UQ+Dra2LN7P28rOXyryx
         LcR1yAz7I+T+wliVw1Lh53Cu9bMGd0fjtOY1ZIjQROoAnHW7HwHQpyfHLQOwaPyCEnNR
         KIVxR0sS040IasR11+3jBsCk9p7Qwm8+fQivNsssLU4U5pNRIfGba2XAhmInrLebNxK0
         732MN3yXf81aRMtdoFY/1WcCKvw6iNiAd1g0WkjyeD3m4oWmD1tg3goLI6yun8QyOSi7
         zmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428737; x=1769033537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEwZJiV03fJ628aCuxgNtJ0Js2UxACV5+XtPBkCCvVM=;
        b=A1vP5rXFIKARH62JtIfGnddUjenxa0AACZ47eX2rzQqBo9yyOWAuRwxVzqeKdnQGyS
         iZkGDavRePXYcTmihgbFENnmlmAsopERvhk3uAeGYChaMq2fXuZMFbj6OTF+JxdNeHKO
         i1L/rBnVUZYI2wh2IkpHqG8yMRfo9tz2sg7MwLP4V3WjTnnrvPVFaChQhXtCxmM0tuLx
         tUEdjTJEX1V1cQPQwK7UXJWJCQLRIfIllYXCw12fONpIcSnbNCc0Ah96lsgUknsU5z0U
         TMve3odGkQCPxZ1CiybmxLGEGWKeWtF+VDbgY7BEzAwTK+1jPZCd2E1+cf0TqUZkvktq
         RWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgKXTA8G3MohKc0r0VxhDEm2jmYniYREej1GcnFEWntPmG7WAwDvdPQrDy5MU331t1DzdRDPawRmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyoiOWBXDey+C1YNVX3Qzvgd3vJBoM8bwSRAlYs2ZmwxHObjtY
	dSw6x5Nk+3tjKDwfP/1/qypsJxpJzPJ0uJ/o5fm94ci5JnFajr8N9+2i0KOF7mLYj1Rhl1u8n6V
	9p64=
X-Gm-Gg: AY/fxX6zRysPz7p5RRYVIBgvhD86M7YAl3h3ScN8jW6/22N8x5zvGv9m6RltpglDNnv
	aTUI/lmFwnevOxpSd1hSDAkqXNngFHq3iJbppuXwjo3vKq/5Uwict7IzfR9Ep2pHyzrskpK2kyr
	XregA7Bs02zz7XoQmmEGTul4e7qg43PLuCwR1zRBF6QUtAEBMLhezJLUwYNA6T/DDzh7WLmzmg7
	fKcx/Kl0OtjAOfmqtyZCn7SmOUL6BMrUa9VhrUiGSpoSOwIn/t++Y5yWR22uiQrvognLUgWxb1X
	SSO0Be8zrq09u9R4NBqdh1C0JcWqzwZrA3QpcAnSSJUY4/F/e3Re+PpuzauFrrKcs5BLMcQuFDm
	jWhmuL+gsCHtJmvuqenIpBf3k5YE7KBG/krprcgD39Hzqh73hiFeokisKvJ3PXyDpXrCYzQLRAT
	YuuF5nNfdyvXM/o8NhAGkUT+gvuxIZG+6jvdiQW0oXDr0nlZHU7Bp6cG8dMh9lNMKL9LwafcrHe
	LtORu5xaCYa472Rgw==
X-Received: by 2002:a05:600c:1f92:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-47ee332fa41mr38400435e9.2.1768428736813;
        Wed, 14 Jan 2026 14:12:16 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:16 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 3/5] hwmon: it87: expose additional temperature limits
Date: Wed, 14 Jan 2026 23:12:08 +0100
Message-ID: <20260114221210.98071-4-yahoo@perenite.com>
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

Expose extra temp min/max/offset/type/alarm attributes when a chip
reports more than three temperature resources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 2d4264d05bc2..368ae68ace15 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1334,8 +1334,26 @@ static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
 static SENSOR_DEVICE_ATTR_2(temp3_offset, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, 2, 3);
 static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
+static SENSOR_DEVICE_ATTR_2(temp4_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    3, 1);
+static SENSOR_DEVICE_ATTR_2(temp4_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    3, 2);
+static SENSOR_DEVICE_ATTR_2(temp4_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 3, 3);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
+static SENSOR_DEVICE_ATTR_2(temp5_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    4, 1);
+static SENSOR_DEVICE_ATTR_2(temp5_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    4, 2);
+static SENSOR_DEVICE_ATTR_2(temp5_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 4, 3);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
+static SENSOR_DEVICE_ATTR_2(temp6_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    5, 1);
+static SENSOR_DEVICE_ATTR_2(temp6_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
+			    5, 2);
+static SENSOR_DEVICE_ATTR_2(temp6_offset, S_IRUGO | S_IWUSR, show_temp,
+			    set_temp, 5, 3);
 
 static int get_temp_type(struct it87_data *data, int index)
 {
@@ -1461,6 +1479,12 @@ static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 1);
 static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 2);
+static SENSOR_DEVICE_ATTR(temp4_type, S_IRUGO | S_IWUSR, show_temp_type,
+			  set_temp_type, 3);
+static SENSOR_DEVICE_ATTR(temp5_type, S_IRUGO | S_IWUSR, show_temp_type,
+			  set_temp_type, 4);
+static SENSOR_DEVICE_ATTR(temp6_type, S_IRUGO | S_IWUSR, show_temp_type,
+			  set_temp_type, 5);
 
 /* 6 Fans */
 
@@ -2290,6 +2314,9 @@ static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 16);
 static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 17);
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp4_alarm, S_IRUGO, show_alarm, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp5_alarm, S_IRUGO, show_alarm, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp6_alarm, S_IRUGO, show_alarm, NULL, 21);
 static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR,
 			  show_alarm, clear_intrusion, 4);
 
@@ -2350,6 +2377,9 @@ static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
 			  show_beep, set_beep, 2);
 static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO, show_beep, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp5_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp6_beep, S_IRUGO, show_beep, NULL, 2);
 
 static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -2512,14 +2542,12 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 	int i = index / 7;	/* temperature index */
 	int a = index % 7;	/* attribute index */
 
-	if (index >= 21) {
-		i = index - 21 + 3;
-		a = 0;
-	}
-
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if (a && i >= data->num_temp_limit)
+		return 0;
+
 	if (a == 3) {
 		if (get_temp_type(data, i) == 0)
 			return 0;
@@ -2561,8 +2589,28 @@ static struct attribute *it87_attributes_temp[] = {
 	&sensor_dev_attr_temp3_beep.dev_attr.attr,
 
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 21 */
+	&sensor_dev_attr_temp4_max.dev_attr.attr,
+	&sensor_dev_attr_temp4_min.dev_attr.attr,
+	&sensor_dev_attr_temp4_type.dev_attr.attr,
+	&sensor_dev_attr_temp4_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp4_offset.dev_attr.attr,
+	&sensor_dev_attr_temp4_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_max.dev_attr.attr,
+	&sensor_dev_attr_temp5_min.dev_attr.attr,
+	&sensor_dev_attr_temp5_type.dev_attr.attr,
+	&sensor_dev_attr_temp5_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_offset.dev_attr.attr,
+	&sensor_dev_attr_temp5_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_max.dev_attr.attr,
+	&sensor_dev_attr_temp6_min.dev_attr.attr,
+	&sensor_dev_attr_temp6_type.dev_attr.attr,
+	&sensor_dev_attr_temp6_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_offset.dev_attr.attr,
+	&sensor_dev_attr_temp6_beep.dev_attr.attr,
 	NULL
 };
 
-- 
2.50.1 (Apple Git-155)

