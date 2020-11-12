Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556BCC56201
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 06:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E494921534
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 06:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard-ru.20150623.gappssmtp.com header.i=@wirenboard-ru.20150623.gappssmtp.com header.b="jb3akMkq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgKLGuA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 01:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgKLGt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 01:49:59 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4186FC0613D1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 22:49:57 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id a9so5734197lfh.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2020 22:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-ru.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gyzxJA1yyS9iLnFVio9VG2RO1yn5H0xdCoOTgWMMJRo=;
        b=jb3akMkqX4M5xWnMMgPo5IPri+zua2YfriiKuiPBV9wsyySECqbQC4jzXBEEpQvlCQ
         873KzG1JSeSgLmcZxzu6Z3DLyeLJg9I4D2F29m/S5kLum+4pzjxD3Xld0Jl0a59+qjiS
         LQINrfnd9Z037hJIg3xuvBCFFUHMkOEBSXA2ysWMljFBzmPcLbjpEdMD4F3zXpbmItuD
         13EotDEIu1k89huuWqWIJ3UkiG2sMhUKnxCv3yI5me/MDiHnCm0I8w/CxRHcSSQW+MbK
         dv9bv3KUujbhFugA3qSqsmN+ZEzWlnIXW22f5owKzDj4OwyYICF1fF7wUg8DC+NwwrLy
         KaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gyzxJA1yyS9iLnFVio9VG2RO1yn5H0xdCoOTgWMMJRo=;
        b=B0lEX/ZwkVPRDme1GHEr/8AzrU0LrZZdGBfS75FdWXJGYmLkizKvIvy1QhFIwiTapp
         dVm53DosDenMhFLnz1geFh+HIp+XZV0lJExlCXXGwbvJzZP73CS2B+FtUta76LNwXnqL
         mS/s03FeVMjSnrKVtQGL2xuBv5tP7AN45RQV3HaRmvJBighr+rMk+4NE4FiQd7IcO/fR
         TzYf47wA3YHsGNuv7cyBvCzu7R35SHw9R2u2DK0G0zK4iw9ZSSPI21/5cdPc6IFQ48NX
         NJ1+ZlTTM56TZAoyj9OvSosVHlQ4ihMvU2hViWo2vxh0cq+ftn0Goz812qWTOcYFFH2x
         r0qA==
X-Gm-Message-State: AOAM532qDH6dNud4PgscNK3ZPOEeeXrrTj9jd5rNbgSCb9h+gNIbtbBI
        F4j+kAovXyiOArPlBdRKaFziGg==
X-Google-Smtp-Source: ABdhPJzOJ4c9EeKKoxYQEwuQQ+GzI7zEANOt0/tS4OSBDtwAdO3aU9gWNeODw8UeRWChY6Fc+zu7bA==
X-Received: by 2002:a19:a415:: with SMTP id q21mr3980856lfc.508.1605163795738;
        Wed, 11 Nov 2020 22:49:55 -0800 (PST)
Received: from localhost.localdomain ([2.92.120.24])
        by smtp.googlemail.com with ESMTPSA id f2sm450996ljc.118.2020.11.11.22.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 22:49:55 -0800 (PST)
From:   Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Akira Shimahara <akira215corp@gmail.com>,
        Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>,
        Evgeny Boger <boger@wirenboard.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] w1: w1_therm: Rename conflicting sysfs attribute 'eeprom' to 'eeprom_cmd'
Date:   Thu, 12 Nov 2020 09:49:31 +0300
Message-Id: <20201112064931.8471-1-ivan.zaentsev@wirenboard.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Duplicate attribute 'eeprom' is defined in:
1) Documentation/ABI/testing/sysfs-driver-w1_therm
2) Documentation/ABI/stable/sysfs-driver-w1_ds28e04

Both drivers define an attribute: /sys/bus/w1/devices/.../eeprom
with conflicting behavior.

Fix by renaming the newer one in w1_therm.c to 'eeprom_cmd'.

Reported-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/lkml/20201029152845.6bbb39ce@coco.lan/
Signed-off-by: Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>
---
 Documentation/ABI/testing/sysfs-driver-w1_therm |  2 +-
 Documentation/w1/slaves/w1_therm.rst            |  2 +-
 drivers/w1/slaves/w1_therm.c                    | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-w1_therm b/Documentation/ABI/testing/sysfs-driver-w1_therm
index 6a37dc33ffdb..74642c73d29c 100644
--- a/Documentation/ABI/testing/sysfs-driver-w1_therm
+++ b/Documentation/ABI/testing/sysfs-driver-w1_therm
@@ -14,7 +14,7 @@ Users:		any user space application which wants to communicate with
 		w1_term device
 
 
-What:		/sys/bus/w1/devices/.../eeprom
+What:		/sys/bus/w1/devices/.../eeprom_cmd
 Date:		May 2020
 Contact:	Akira Shimahara <akira215corp@gmail.com>
 Description:
diff --git a/Documentation/w1/slaves/w1_therm.rst b/Documentation/w1/slaves/w1_therm.rst
index e39202e2b000..c3c9ed7a356c 100644
--- a/Documentation/w1/slaves/w1_therm.rst
+++ b/Documentation/w1/slaves/w1_therm.rst
@@ -82,7 +82,7 @@ resolution is read back from the chip and verified.
 
 Note: Changing the resolution reverts the conversion time to default.
 
-The write-only sysfs entry ``eeprom`` is an alternative for EEPROM operations.
+The write-only sysfs entry ``eeprom_cmd`` is an alternative for EEPROM operations.
 Write ``save`` to save device RAM to EEPROM. Write ``restore`` to restore EEPROM
 data in device RAM.
 
diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index cddf60b7309c..3712b1e6dc71 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -315,7 +315,7 @@ static ssize_t resolution_show(struct device *device,
 static ssize_t resolution_store(struct device *device,
 	struct device_attribute *attr, const char *buf, size_t size);
 
-static ssize_t eeprom_store(struct device *device,
+static ssize_t eeprom_cmd_store(struct device *device,
 	struct device_attribute *attr, const char *buf, size_t size);
 
 static ssize_t alarms_store(struct device *device,
@@ -350,7 +350,7 @@ static DEVICE_ATTR_RO(w1_seq);
 static DEVICE_ATTR_RO(temperature);
 static DEVICE_ATTR_RO(ext_power);
 static DEVICE_ATTR_RW(resolution);
-static DEVICE_ATTR_WO(eeprom);
+static DEVICE_ATTR_WO(eeprom_cmd);
 static DEVICE_ATTR_RW(alarms);
 static DEVICE_ATTR_RW(conv_time);
 static DEVICE_ATTR_RW(features);
@@ -386,7 +386,7 @@ static struct attribute *w1_therm_attrs[] = {
 	&dev_attr_temperature.attr,
 	&dev_attr_ext_power.attr,
 	&dev_attr_resolution.attr,
-	&dev_attr_eeprom.attr,
+	&dev_attr_eeprom_cmd.attr,
 	&dev_attr_alarms.attr,
 	&dev_attr_conv_time.attr,
 	&dev_attr_features.attr,
@@ -397,7 +397,7 @@ static struct attribute *w1_ds18s20_attrs[] = {
 	&dev_attr_w1_slave.attr,
 	&dev_attr_temperature.attr,
 	&dev_attr_ext_power.attr,
-	&dev_attr_eeprom.attr,
+	&dev_attr_eeprom_cmd.attr,
 	&dev_attr_alarms.attr,
 	&dev_attr_conv_time.attr,
 	&dev_attr_features.attr,
@@ -410,7 +410,7 @@ static struct attribute *w1_ds28ea00_attrs[] = {
 	&dev_attr_temperature.attr,
 	&dev_attr_ext_power.attr,
 	&dev_attr_resolution.attr,
-	&dev_attr_eeprom.attr,
+	&dev_attr_eeprom_cmd.attr,
 	&dev_attr_alarms.attr,
 	&dev_attr_conv_time.attr,
 	&dev_attr_features.attr,
@@ -1740,7 +1740,7 @@ static ssize_t resolution_store(struct device *device,
 	return size;
 }
 
-static ssize_t eeprom_store(struct device *device,
+static ssize_t eeprom_cmd_store(struct device *device,
 	struct device_attribute *attr, const char *buf, size_t size)
 {
 	struct w1_slave *sl = dev_to_w1_slave(device);
-- 
2.25.1

