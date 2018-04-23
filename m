Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 832997DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 17:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932273AbeDWRx5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 13:53:57 -0400
Received: from mail-ua0-f202.google.com ([209.85.217.202]:41545 "EHLO
        mail-ua0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932125AbeDWRxv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 13:53:51 -0400
Received: by mail-ua0-f202.google.com with SMTP id y14so13477326uai.8
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:message-id:subject:from:to;
        bh=OdBxvYRSoR5MRYSh8pDaiGb2mVNOtyTy5nGUdgMxIzY=;
        b=rIrShMuhIaDm40UQ25qnIxFJsKkNbPZCR1pHXq7vPPxUcJrPVjthGbXhlSRWRK9s+h
         oCbMU/ijBFJBPLe2l8ubIEWXS8GGyZdq/mpaoYGs7ofbfOxUEnmTYxgjffJbqCcEQ21A
         KqJqFXmZHbbh2jvGU5d5pFm1Gm9s1/i/qP8zX1RsWDOQYva7ztls7/n7Sj8NXU62x6aH
         1dkpCH5/XIET1/qLzK/D0AdVvFgT3KvCXwqw2/TCRYOH5Vn8wPYd4j35NnuVAuqxcx+H
         47Sbxhh3w1wwNLHigdNuM3mW37MaM3pgppXclDxb84SQhTE7RiiM3FUwIuYKF2CipLKk
         c+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=OdBxvYRSoR5MRYSh8pDaiGb2mVNOtyTy5nGUdgMxIzY=;
        b=BJtS2+Ur+9w88TgkfuoSyHysdDtb/2SSGCBiBJllBzDEDjFOj0fSla98sJacl8GCkG
         pulYxcb0sMceZoE7IZezfX9lqLRW/2XC1df9uATgrlXxCjaDu1Qh9yfjPHTNUuzihCQe
         PeZWS9JIDeaxCUIot85r92l8fxUABG41qBkfQNbrM6DxzP/64SLVrdYZVdPo3VsquPB9
         80ceV/6OWUZUsWskZB3KnykwCUai/k1SmwK81Q/nnX+Ph4jyxXXhhp4/x/S2TJFk3vvy
         TpnD0FdQWfn9jPK7gt/WbVU0bt6DQvZwj4FjuSmbP/UO31bHun/TJKIkH3WrTjBQczX5
         8FTA==
X-Gm-Message-State: ALQs6tDma1q8cFu93f3Q+RUrahFz4ZdR9z+vwkT+BoSCHFbIxYvJ7lsB
        IwTREI56/YXHmnwao04AjXVx6x1Acp7kLqagHA==
X-Google-Smtp-Source: AIpwx49y7gcnqNW3hUb0GLmIbaQpwkfd98qOrYUmALCco7U9ce1lAr+hPQlEJhDdfz9w381o0fVbOcNbJX+anSg1AA==
MIME-Version: 1.0
X-Received: by 10.176.71.238 with SMTP id w46mr8259530uac.16.1524506030225;
 Mon, 23 Apr 2018 10:53:50 -0700 (PDT)
Date:   Mon, 23 Apr 2018 10:53:40 -0700
Message-Id: <20180423175340.32598-1-kevindubois@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
Subject: [PATCH] thermal: core: fix emulation of subzero temps
From:   Kevin DuBois <kevindubois@google.com>
To:     linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, rui.zhang@intel.com, edubezval@gmail.com,
        kevindubois@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current implementation casted away its sign.
It was also using '0' to disable emulation, but 0C is a valid
thermal reading. A large negative value (below absolute zero) now
disables the emulation.

Test: Build kernel with CONFIG_THERMAL_EMULATION=y, then write negative
values to the emul_temp sysfs entry. Check the temp entry, and see the
negative value. Write -INT_MAX to emul_temp, and see the proper sensor
reading appear.
Bug: 77599739
Signed-off-by: Kevin DuBois <kevindubois@google.com>

Change-Id: Iee1a4f0aacf7b4299b67c7f8f4effedf2d7a8425
---
 Documentation/thermal/sysfs-api.txt |  2 +-
 drivers/thermal/thermal_core.c      | 13 ++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/thermal/sysfs-api.txt b/Documentation/thermal/sysfs-api.txt
index 10f062ea6bc2..e240d9e165a0 100644
--- a/Documentation/thermal/sysfs-api.txt
+++ b/Documentation/thermal/sysfs-api.txt
@@ -312,7 +312,7 @@ emul_temp
 	this temperature to platform emulation function if registered or
 	cache it locally. This is useful in debugging different temperature
 	threshold and its associated cooling action. This is write only node
-	and writing 0 on this node should disable emulation.
+	and writing -INT_MAX on this node should disable emulation.
 	Unit: millidegree Celsius
 	WO, Optional
 
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 768783ab3dac..650a6b124fc7 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -636,8 +636,8 @@ int get_tz_trend(struct thermal_zone_device *tz, int trip)
 {
 	enum thermal_trend trend;
 
-	if (tz->emul_temperature || !tz->ops->get_trend ||
-	    tz->ops->get_trend(tz, trip, &trend)) {
+	if ((tz->emul_temperature > THERMAL_TEMP_INVALID) ||
+		!tz->ops->get_trend || tz->ops->get_trend(tz, trip, &trend)) {
 		if (tz->temperature > tz->last_temperature)
 			trend = THERMAL_TREND_RAISING;
 		else if (tz->temperature < tz->last_temperature)
@@ -904,7 +904,8 @@ int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	ret = tz->ops->get_temp(tz, temp);
 
-	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) && tz->emul_temperature) {
+	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) &&
+		(tz->emul_temperature > THERMAL_TEMP_INVALID)) {
 		for (count = 0; count < tz->trips; count++) {
 			ret = tz->ops->get_trip_type(tz, count, &type);
 			if (!ret && type == THERMAL_TRIP_CRITICAL) {
@@ -961,6 +962,7 @@ static void thermal_zone_device_reset(struct thermal_zone_device *tz)
 	struct thermal_instance *pos;
 
 	tz->temperature = THERMAL_TEMP_INVALID;
+	tz->emul_temperature = THERMAL_TEMP_INVALID;
 	tz->passive = 0;
 	list_for_each_entry(pos, &tz->thermal_instances, tz_node)
 		pos->initialized = false;
@@ -1351,9 +1353,9 @@ emul_temp_store(struct device *dev, struct device_attribute *attr,
 {
 	struct thermal_zone_device *tz = to_thermal_zone(dev);
 	int ret = 0;
-	unsigned long temperature;
+	int temperature;
 
-	if (kstrtoul(buf, 10, &temperature))
+	if (kstrtoint(buf, 10, &temperature))
 		return -EINVAL;
 
 	if (!tz->ops->set_emul_temp) {
@@ -2296,6 +2298,7 @@ struct thermal_zone_device *thermal_zone_device_register(const char *type,
 	tz->trips = trips;
 	tz->passive_delay = passive_delay;
 	tz->polling_delay = polling_delay;
+	tz->emul_temperature = THERMAL_TEMP_INVALID;
 	/* A new thermal zone needs to be updated anyway. */
 	atomic_set(&tz->need_update, 1);
 
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
