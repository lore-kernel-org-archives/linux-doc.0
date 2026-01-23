Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5827EFEE
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 18:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192544; cv=none; b=scHN1LfqCBZJc4QTDVRHnq9mofScbJ/Rw7q6H0Wsl5f71oWRMNcE3GyMmRHY+fQ/7a6x96h0EVojNQRGSCWD2AUrx8yA7dqrC22Pw1sZbOSTzQtPCD629BgwJ+VONQMxg5Zf6kYaH7xBB/MynTYCQCFFTszIAT24dJ8hChGijlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192544; c=relaxed/simple;
	bh=pjFIKTAcgTOMhK443dH8yu6xajqx4n3WaCh4sL4FWoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlrFiLvYrfpWS+ZI+SdiLLA99QXdqGtz9JctyjA7oKT167r8SNRYry9xzo3MbbS2pWWtAvBeHGx//o0sPtUMYWLMrQLXg7DUv2gGZGvI1pEeA6V4svZVv1WSESI5veTsad3Am2yCocZ3eUsMEe/KRct0f6mKrvl12Q0QyK6nrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up1OdfDR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up1OdfDR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a07fac8aa1so20105195ad.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 10:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192542; x=1769797342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkJ+o7BV1rRzeunFqGJvREeRYIZ540q5bogHmtrFmU0=;
        b=Up1OdfDRtohvyuQcuiOAdUbFqFjcsjm87NrZxt3eiKlPB4Ub9imIALghoZ0m/d/Mj2
         CScoz34F5UfUW/Lg0i+q27avIJpkFq2SNMgizAsNKM3QX6vux83O0EUam9oeA8U//W/b
         qx1oR3nbbJr+bj5bW39sotrqUK5pnWJVq2hbS9nIEsgwa2zWdrSh7ip4dgrkB6KadHbM
         kyZ84eZ7rdyAzSfOx5y9bQLzcr2GCI82DE1yXzeGIm4yGS4LBNlpm9PRUHnAVtf3G4fz
         dPsNU6RdQrpYFULO471Gw5gnJJQhM93djan0srDG+hazXaE79RKFHuG3Z0RmKDokHmrt
         AlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192542; x=1769797342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkJ+o7BV1rRzeunFqGJvREeRYIZ540q5bogHmtrFmU0=;
        b=Imcd5frSc8VasaGgBEZP23Dv6Tfe1y5QRfZpbpDdG40EHrJqjcLefoYmSs7i6bspfe
         xZfs/F9mgyelCXZm2lQ7NMuXrzZW1UWHCD62FinCIZRaJyqIJZVLKgOXleTbqHFEPBG6
         fT7N1nozwW3ZTaefGB3V61nUZoB8XcSGCV9fv+c7/9lGHCQ7AUgk4StQGR+tE8j9OEH+
         3ZWYOJTX60pXx8nlhK6sULEE1zG7/aKzZml1KvbGe8PPDT5aCNrX9uybIy9JVVV5JwsT
         Pg2NCJU2no/YbxIdBxb2x9hm2JhV9SSiz88BExNGdaEr0pe7TONYAW7dcCfYn7POu29a
         y6dg==
X-Gm-Message-State: AOJu0Ywk6RTNhpah86C+bi1chQcKDE3v3C0LMuumS1qNzjKKNGnp0MTF
	fpl/qoENlthrgUkX0Wu9+HnTSA+jmDmz3/oGq3KZ6rpv6o2u2FTJBUSJ
X-Gm-Gg: AZuq6aKLGVD0neoVZF5rOwZz89+82UzOIbdd7iADrEpVbewV1hzEZWogg3EZYgGepO8
	+6kjap3tdRnqvFEpqE0DEXgHeND1sNDrn2QZolBHLaMVkev5uBpkRCjhgS/E/2P8DhFbvbYWHe1
	CYc3QicoXnibC1vC1mDb8Bob5PbHvT8Vnr8f5P/G0E2z4NZNYnIj0JotJ2Mc4udUkdZ85EOh9U5
	MeZN3q1L/ftwRsteIyumZAPTqOE4Zn+cd8jnaNKNTM5Qx3bSVp8iQVD5y91nSi9ZrkxhS6+wbL/
	VO8fz/eif4bKx+DPTkd3HlUqklYYk38RgLeieq90VHsOdhnJvHoBmCgUBf9nzOyI3XpZzhVJZlL
	oAfU2WNssiTnGYoGrUel08bUKrbp/nT9go0VOpPsVXzihhndeVuciq5iylZHKIPdU8H53TCEzHF
	L9NWeng/TtCfRb8uyYGCawboDo
X-Received: by 2002:a17:903:2443:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a7fe625081mr32543535ad.32.1769192541799;
        Fri, 23 Jan 2026 10:22:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb03dfsm25604715ad.75.2026.01.23.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 4/5] hwmon: Implement hwmon_update_groups()
Date: Fri, 23 Jan 2026 10:22:07 -0800
Message-ID: <20260123182208.2229670-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123182208.2229670-1-linux@roeck-us.net>
References: <20260123182208.2229670-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some situations the visibility of hwmon sysfs attributes may change.
Support this by providing a new API function hwmon_update_groups()
to update both visible attributes and thermal zones.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst |  8 ++++++++
 drivers/hwmon/hwmon.c                    | 24 ++++++++++++++++++++++++
 include/linux/hwmon.h                    |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index 1d7f1397a827..a41b1038fbf0 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -42,6 +42,8 @@ register/unregister functions::
 
   char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 
+  int hwmon_update_groups(struct device *dev);
+
   void hwmon_lock(struct device *dev);
   void hwmon_unlock(struct device *dev);
 
@@ -89,6 +91,12 @@ for other functions such as interrupt handlers or for attributes which are
 fully implemented in the driver, hwmon_lock() and hwmon_unlock() can be used
 to ensure that calls to those functions are serialized.
 
+If the visibility of sysfs attributes changes during runtime, the driver
+needs to call hwmon_update_groups() with the hwmon device as parameter
+to update attribute visibility. If the driver registered thermal zones
+using hwmon_device_register_with_info() and the visibility of thermal
+sensors changes, this call will also update thermal zones as needed.
+
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
 
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index cb89218a0b6a..9163b8290dbe 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -330,6 +330,11 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 	return hwmon_thermal_handle_sensors(dev, false);
 }
 
+static int hwmon_thermal_update_sensors(struct device *dev)
+{
+	return hwmon_thermal_handle_sensors(dev, true);
+}
+
 static void hwmon_thermal_notify(struct device *dev, int index)
 {
 	struct hwmon_thermal_data *tzdata = hwmon_thermal_find_tz(dev, index);
@@ -799,6 +804,25 @@ static const int __templates_size[] = {
 	[hwmon_intrusion] = ARRAY_SIZE(hwmon_intrusion_attr_templates),
 };
 
+int hwmon_update_groups(struct device *dev)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+	const struct hwmon_chip_info *chip = hwdev->chip;
+	const struct hwmon_channel_info * const *info;
+	int ret;
+
+	ret = sysfs_update_groups(&dev->kobj, dev->groups);
+	if (ret || !chip)
+		return ret;
+
+	info = chip->info;
+	if (info[0]->type != hwmon_chip || !(info[0]->config[0] & HWMON_C_REGISTER_TZ))
+		return 0;
+
+	return hwmon_thermal_update_sensors(dev);
+}
+EXPORT_SYMBOL_GPL(hwmon_update_groups);
+
 int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel)
 {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 301a83afbd66..8cadba24ed4b 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -492,6 +492,8 @@ int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 char *hwmon_sanitize_name(const char *name);
 char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 
+int hwmon_update_groups(struct device *dev);
+
 void hwmon_lock(struct device *dev);
 void hwmon_unlock(struct device *dev);
 
-- 
2.45.2

