Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EBF2BD036
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192546; cv=none; b=qFnXPlhpo+tdba4zXrKqCneRh2eCD3keGsQQVob5rUruHYPTDkqYDsn6ueTYvP31DHNcOHZOw85H3Z1LQyK3VaFBGr1HqlhyK9F5gIBYXZd8XThtfQ0eItMb1bzNH7K6L39T9ukpHTaQt4E6NXBjNS/RNMQgSRlEjOWxShEd3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192546; c=relaxed/simple;
	bh=SPXPIbBetVfrtSr87AGPJKY7Q8T4ACNl5x7JB3uNAOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VI9yumzAvGc/7vDPBW6p5G73PB3Pq0NGHTuUc69D0ZAp4RipJic+1tpHwl5g/NFszCkz3L/7fAhMgCtu5enU5vIIhf0isSvLGbBXzoSc6cZH7BGk9N3sAwoK0DOF/aOfcB3i3nD5UBw//hWzj/tF5fx5n8UeUSCo1LXD6zTmfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AozLaqGX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AozLaqGX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a75a4a140eso13167635ad.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192544; x=1769797344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zXV0Ml05DG2GM6i3iG21b9r1Ulg08rCjKLZ42eCdfw=;
        b=AozLaqGXFgUIo93vSYugJPxx2oCm/pnMkWWKOm+msOqL55Qfwc50yiON7ZDf8hhOBL
         b/NMMCN2l4aBVfq0GiCYN2W8xS47MKRhfcPYtaklDYj0/3s7tPcax/neS/RoOvks6vzi
         Zz//JmqINkhgRlY3kbsuLbMocH5FJJNkuWQtuT5P0hsA8byeU+97SS5kbc0p0jHAzmbZ
         Ry4YEIAUuntxwN7c67UgKfePQK1ZqqNxSiyVT2TRySxOJcjAOqz8MjYmb78c2rQSNAm5
         OUjQhS2vwd3jZZ1GPzDOgWQkrgPNkrdwizsWUDi/0qKCwVi/ia/grUS4eMtqPatsC6W4
         bkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192544; x=1769797344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zXV0Ml05DG2GM6i3iG21b9r1Ulg08rCjKLZ42eCdfw=;
        b=GaYA3wDnnUSXS6C01gJrZ4sb6s7e9mNas4U/rdNzvzNGur5HcmzbXFc7VXuTGbbE0i
         r34LU/f6BSTQSyYdzq2XUeI8g0+2ZWG0qrQcRr8CkGsa4If603uhQmJpV/R7cuQeRHSP
         XE7UhxZj3jabyxfVHc1TRUYmDRQgfzCmjBP5F2JFvDurcVuQe2Kr6h7MRy5vEax3cTnY
         S7sKv6Ofq6xwz+rebZwdmiCrYSt1bq/0HNGEruiErv0i8gFCsMcnnAeTfUVsBMpSeg0T
         0DdX2TSqyJwndDwy8Pfvc8VOgxMdbiIOzEUUDYU0wn2E9pklP16NrEktf9AvP08S4ueZ
         HEhw==
X-Gm-Message-State: AOJu0YwG8RE5ds8+yb1AOrr48xs9Pw0GCFyWX1ebEeFw82U0Cp50gY95
	/U4u9pOYUjYHz5J45jfv88TB/Vhxc/XMqUIdmMvYR0M93+e2Sa5QtyPU
X-Gm-Gg: AZuq6aIfQyHbq8LgiiePLQKgt4L/4ohCuSUyHQBw5pxfIL7nqFicSZizEtCXkTQofoC
	X06CgnVYySkhLukJFSQQXKoD30iKS1OGKwrE6Cyu2bD7Pd/WoeOQeQX9iysfa2VW7MeMWhmC9o6
	9Fc4lkR1/ynoBo87HVi4cwjw9bPyHAb1xE8FpiTxAHVHlkgu54F+EXNiU0FduPPG1OcyqI5xvL7
	EV9UsQixhyCX2vB++c8UXeNHblFiChz6O2K6r1GW370WWdg/5W6vnWzkbaeWFH+b/SotIN5ndbk
	VKHRA3lV7ULrCw7wpBcGZVId3NJHm4UJGh6b3Q/Jotmr1Xq2OaBxR04zKNW5V33bSqixyMX+yHr
	XlfLGH7zTLOC6VUKjGOoMBJzcOScNIXPudi15/5mh0bf3PzlDTDFsA1P4DalqQ/B74XH+d4hKi5
	vIcZSpbEm3TUac2jU3RgdUxvH/
X-Received: by 2002:a17:903:189:b0:2a5:8d30:58f7 with SMTP id d9443c01a7336-2a7fe56f709mr42504345ad.17.1769192543622;
        Fri, 23 Jan 2026 10:22:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa85esm25452095ad.1.2026.01.23.10.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 5/5] hwmon: (acpi_power_meter) Use hwmon_update_groups() to update sensor visibility
Date: Fri, 23 Jan 2026 10:22:08 -0800
Message-ID: <20260123182208.2229670-6-linux@roeck-us.net>
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

If the driver is notified about hardware a configuration change, the driver
unregisters the hardware monitoring device and registers it again. This is
conceptually wrong and can have unintended side effects, especially if a
userspace application is in the process of reading attributes during that
time.

If the hardware configuration changed, call hwmon_update_groups() instead
to update attribute visibility. Update driver locking to use the hardware
monitoring lock for all locking operations and drop the driver internal
lock.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/acpi_power_meter.c | 37 +++++++++++---------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 29ccdc2fb7ff..59b56217e856 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -75,7 +75,6 @@ struct acpi_power_meter_capabilities {
 struct acpi_power_meter_resource {
 	struct acpi_device	*acpi_dev;
 	acpi_bus_id		name;
-	struct mutex		lock;
 	struct device		*hwmon_dev;
 	struct acpi_power_meter_capabilities	caps;
 	acpi_string		model_number;
@@ -445,8 +444,6 @@ static int power_meter_read(struct device *dev, enum hwmon_sensor_types type,
 	if (type != hwmon_power)
 		return -EINVAL;
 
-	guard(mutex)(&res->lock);
-
 	switch (attr) {
 	case hwmon_power_average:
 		ret = update_meter(res);
@@ -501,7 +498,6 @@ static int power_meter_write(struct device *dev, enum hwmon_sensor_types type,
 	if (type != hwmon_power)
 		return -EINVAL;
 
-	guard(mutex)(&res->lock);
 	switch (attr) {
 	case hwmon_power_cap:
 		ret = set_cap(res, val);
@@ -547,9 +543,9 @@ static ssize_t power1_average_max_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&res->lock);
+	hwmon_lock(res->hwmon_dev);
 	ret = set_trip(res, POWER_METER_TRIP_AVERAGE_MAX_IDX, trip);
-	mutex_unlock(&res->lock);
+	hwmon_unlock(res->hwmon_dev);
 
 	return ret == 0 ? count : ret;
 }
@@ -566,9 +562,9 @@ static ssize_t power1_average_min_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&res->lock);
+	hwmon_lock(res->hwmon_dev);
 	ret = set_trip(res, POWER_METER_TRIP_AVERAGE_MIN_IDX, trip);
-	mutex_unlock(&res->lock);
+	hwmon_unlock(res->hwmon_dev);
 
 	return ret == 0 ? count : ret;
 }
@@ -825,44 +821,38 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
 
 	switch (event) {
 	case METER_NOTIFY_CONFIG:
-		mutex_lock(&resource->lock);
+		hwmon_lock(resource->hwmon_dev);
 		free_capabilities(resource);
 		remove_domain_devices(resource);
-		hwmon_device_unregister(resource->hwmon_dev);
 		res = read_capabilities(resource);
 		if (res)
 			dev_err_once(&device->dev, "read capabilities failed.\n");
 		res = read_domain_devices(resource);
 		if (res && res != -ENODEV)
 			dev_err_once(&device->dev, "read domain devices failed.\n");
-		resource->hwmon_dev =
-			hwmon_device_register_with_info(&device->dev,
-							ACPI_POWER_METER_NAME,
-							resource,
-							&power_meter_chip_info,
-							power_extra_groups);
-		if (IS_ERR(resource->hwmon_dev))
-			dev_err_once(&device->dev, "register hwmon device failed.\n");
-		mutex_unlock(&resource->lock);
+		res = hwmon_update_groups(resource->hwmon_dev);
+		if (res)
+			dev_err_once(&device->dev, "Failed to update hardware monitoring data\n");
+		hwmon_unlock(resource->hwmon_dev);
 		break;
 	case METER_NOTIFY_TRIP:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
 		break;
 	case METER_NOTIFY_CAP:
-		mutex_lock(&resource->lock);
+		hwmon_lock(resource->hwmon_dev);
 		res = update_cap(resource);
 		if (res)
 			dev_err_once(&device->dev, "update cap failed when capping value is changed.\n");
-		mutex_unlock(&resource->lock);
+		hwmon_unlock(resource->hwmon_dev);
 		sysfs_notify(&device->dev.kobj, NULL, POWER_CAP_NAME);
 		break;
 	case METER_NOTIFY_INTERVAL:
 		sysfs_notify(&device->dev.kobj, NULL, POWER_AVG_INTERVAL_NAME);
 		break;
 	case METER_NOTIFY_CAPPING:
-		mutex_lock(&resource->lock);
+		hwmon_lock(resource->hwmon_dev);
 		resource->power_alarm = true;
-		mutex_unlock(&resource->lock);
+		hwmon_unlock(resource->hwmon_dev);
 		sysfs_notify(&device->dev.kobj, NULL, POWER_ALARM_NAME);
 		dev_info(&device->dev, "Capping in progress.\n");
 		break;
@@ -889,7 +879,6 @@ static int acpi_power_meter_add(struct acpi_device *device)
 
 	resource->sensors_valid = 0;
 	resource->acpi_dev = device;
-	mutex_init(&resource->lock);
 	strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
 	strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
 	device->driver_data = resource;
-- 
2.45.2

