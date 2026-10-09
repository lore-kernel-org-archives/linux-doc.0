Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA334E9C1D
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560365; cv=none; b=VA1xVLECdmt4LGSBL8U8KB3NBu3QzpLYtPfF/zzClwf9LznnkkVtNNkU8MzffC6a8SI4H9bhV8bPLDdGfEvP6HArdR+JKwrA8ckLcYm3h6z6mTVWgthVElejmuDK1WPCvzzNsZXBNnrSqX9RjLSOWvgOgOEVvfG3t+5rbyU8Ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560365; c=relaxed/simple;
	bh=7KQOT4/YmaGTqbBEFf/jux4/hF/llbFyRPtq++sAfS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTgmGpqGMzJzURS1iyXBgvsMxUSUZSi0lGyPw0zc/A2QkIF5KJmdX+MLKs7WczPXWz5c9AqzUs8pPPL3Kz+os8JcJBxAhhRNjY356I998AuzK1iuJEmbqQYUC3mwyuzLp2xeYgtCwqAfUePDLL1JcURmIGUJu9or024rN0YvYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfRm3k1G; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfRm3k1G"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so321478a12.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560362; x=1792165162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCWuqJzkl7WxbzU0hxEOW4t98SL56glPEqj/2QQfXyk=;
        b=MfRm3k1Gurq5irLB6I1YCyEttfZSKz2kGuhEAWHa+hiJpeBCrkVwoHLenFn0WWqJfy
         i4kryNpyG6CIPw24s11vdNDm3LbwogVKQ0yj2w0+OvACB0jZIjF3EqKiDqpgq1YiWbnt
         QH4Jx7RxcRGzeGICrbB4JTeQlZYF2iWdv0tPsieMmV6HkT1WPWDwhtRgJCvt6nBTC+3G
         gLQFQ2fgZmqismVRiZLfzSdDHj+Je+bQKLjNz550VbLh0rrl6+oaPj3IEQGfnkgy0s1B
         6K1t+pZUg7ceYG7mxBSOWK7hsQ4yVDNzeD4YE2kzAtfYxIKMfgi2+k/Z30ITnndRd/03
         XlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560362; x=1792165162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCWuqJzkl7WxbzU0hxEOW4t98SL56glPEqj/2QQfXyk=;
        b=cLlnIYsAp2riSsVAK/nLfhITpNY/pmxpERaNT7TRmLZPdZdLPkRQNdFu6yoFJXS+9e
         EruPpcGcrgUX/FANatrQEsIfPmRdiSPqHwmSEKuO5rdJ/rwRehN8DDBhTFzeglzWozKI
         KLUhUUAI0rhApdSoZTV0QVlyim0L6wVyVCPtVHKO7Iz4v/QjBUi27Z4dMFQ7GqoTjY70
         TZwcO6JUisGz8efu5JmT63era7kHaTSV2cSVQHgzV2PSoE2SwlELnJqsUsw8ztXvzMZb
         Pm4BHVg69kyZ5Kn+IUgQBG7oM3SlGz4gXCBIOxPrghEN1q306sl/McnyrRDVC7PNn0bl
         56YA==
X-Forwarded-Encrypted: i=1; AKwUvBwGBVzG85c+4yHSkgmTsBUWmY3ghxDvXrRIeXWsrsXkKUpikTZWuviSLE0UwqE/yGUbP6JQOLT4BGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFWaNCNr4wNCH77cxjyNjdA2AHymCdW9/Tdr/zIlBVqKhPwp7t
	4KvbRg8qX/8DE1dpPpPgcdBjzY//kPtxAMihu+h/VHNen4uEZMi1orF1
X-Gm-Gg: AYBFou3xb6JB7G7Xyh9jcqyavDtL+xDyg93pIR8vb0zMcc4q6nwz163VyCW5Otkkv4p
	qUjRPncSTI6JnJRVNOI1//JBR6Wk2+n1sp1uQDxUd4XU2gckdmecplcw2MFGsv6ePCkWrWg3KmJ
	GV4TVdW1PbCDrSAkzPIWdVtPhhnhBbNxGEDuwXTvNXutsbUJQc7gqhPnSJX8Mp9Bk7H/lc74AEV
	zsPmAGJfD9AaKlfS3P9Ews6tX9UiPdg6LCR0HpapdTeLup/aAt6ZCiIF6o9DWYQCo08PHOigaOI
	ackaN3J3V8ZTEfh143fsdAovqGJmGUW7gdlkJX8NQCGc12PZzd+r+KHFzKOIGTokmLx6o3v/1se
	JR2AagqK8kKO0QxQLk6OybNrkWGintDkRdcAYlxxJg/781lZU3fBE/bC5D6ziBm6h7OvPasgf8l
	+RnMVJl2nc7S2uu9BIFOyDehAUEEKmHyt/p7kjfOop3v4StaWXChYPSE+lJp9gb06YVQyq
X-Received: by 2002:a17:903:2a8b:b0:2e8:3d48:4d82 with SMTP id d9443c01a7336-2e842dfd143mr19132405ad.60.1791560361898;
        Fri, 09 Oct 2026 08:39:21 -0700 (PDT)
Received: from mincom1 ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421ae999sm11847705ad.31.2026.10.09.08.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:39:20 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] hwmon: Expose attribute validation and string helpers
Date: Sat, 10 Oct 2026 00:38:41 +0900
Message-ID: <c0e04710f5a3a555e9d7b42b8f9ee369311cca4c.1791559095.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791531025.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the core's string classification and sysfs template validation
through the kernel hwmon API. Let drivers query these properties without
maintaining separate attribute tables.

Reuse the helpers when creating attributes.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/hwmon/hwmon.c | 30 +++++++++++++++++++++++++-----
 include/linux/hwmon.h |  3 +++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 10d2df3efdfa..bed16cfd4f1c 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -502,7 +502,14 @@ static ssize_t hwmon_attr_store(struct device *dev,
 	return count;
 }
 
-static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
+/**
+ * hwmon_is_string_attr - test whether an attribute returns a string
+ * @type: sensor type
+ * @attr: attribute identifier
+ *
+ * Return: true for string attributes, false otherwise.
+ */
+bool hwmon_is_string_attr(enum hwmon_sensor_types type, u32 attr)
 {
 	return (type == hwmon_temp && attr == hwmon_temp_label) ||
 	       (type == hwmon_in && attr == hwmon_in_label) ||
@@ -513,6 +520,7 @@ static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
 	       (type == hwmon_humidity && attr == hwmon_humidity_label) ||
 	       (type == hwmon_fan && attr == hwmon_fan_label);
 }
+EXPORT_SYMBOL_GPL(hwmon_is_string_attr);
 
 static const struct attribute *hwmon_genattr(const void *drvdata,
 					     enum hwmon_sensor_types type,
@@ -526,7 +534,7 @@ static const struct attribute *hwmon_genattr(const void *drvdata,
 	struct attribute *a;
 	umode_t mode;
 	const char *name;
-	bool is_string = is_string_attr(type, attr);
+	bool is_string = hwmon_is_string_attr(type, attr);
 
 	mode = hwmon_is_visible(ops, drvdata, type, attr, index);
 	if (!mode)
@@ -776,6 +784,20 @@ static const int __templates_size[] = {
 	[hwmon_intrusion] = ARRAY_SIZE(hwmon_intrusion_attr_templates),
 };
 
+/**
+ * hwmon_is_valid_attr - test whether an attribute has a sysfs template
+ * @type: sensor type
+ * @attr: attribute identifier
+ *
+ * Return: true for supported sysfs attributes, false otherwise.
+ */
+bool hwmon_is_valid_attr(enum hwmon_sensor_types type, u32 attr)
+{
+	return (unsigned int)type < ARRAY_SIZE(__templates) &&
+	       attr < __templates_size[type] && __templates[type][attr];
+}
+EXPORT_SYMBOL_GPL(hwmon_is_valid_attr);
+
 int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel)
 {
@@ -843,14 +865,12 @@ static int hwmon_genattrs(const void *drvdata,
 			  const struct hwmon_channel_info *info)
 {
 	const char * const *templates;
-	int template_size;
 	int i, aindex = 0;
 
 	if (info->type >= ARRAY_SIZE(__templates))
 		return -EINVAL;
 
 	templates = __templates[info->type];
-	template_size = __templates_size[info->type];
 
 	for (i = 0; info->config[i]; i++) {
 		u32 attr_mask = info->config[i];
@@ -861,7 +881,7 @@ static int hwmon_genattrs(const void *drvdata,
 
 			attr = __ffs(attr_mask);
 			attr_mask &= ~BIT(attr);
-			if (attr >= template_size || !templates[attr])
+			if (!hwmon_is_valid_attr(info->type, attr))
 				continue;	/* attribute is invisible */
 			a = hwmon_genattr(drvdata, info->type, attr, i,
 					  templates[attr], ops);
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index d48e0aa82bc5..b026aa317630 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -138,6 +138,9 @@ devm_hwmon_device_register_with_info(struct device *dev,
 
 void hwmon_device_unregister(struct device *dev);
 
+bool hwmon_is_valid_attr(enum hwmon_sensor_types type, u32 attr);
+bool hwmon_is_string_attr(enum hwmon_sensor_types type, u32 attr);
+
 int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel);
 
