Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A6CC61DA3
	for <linux-doc@archiver.kernel.org>; Sat,  4 Mar 2023 00:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCDAyY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 19:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjCDAyX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 19:54:23 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F48A65057
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 16:54:04 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id m9-20020a170902db0900b0019ea0e227e4so730048plx.6
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 16:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677891244;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+axuFcxAf29Ailu8n0Kx3xozD+Ba9C9GcmWlTun9X2U=;
        b=gN4/x6QXgyBQ8FP+VQLIwxIChCEBeKy/+ISBsxXLMHzbxL0V7tcc9sXnkf5xkn9GVM
         ygeGPLYXrNvN+4cU73z4cLNm+Ia38RYioD+v8enjBq+WQI2938pQBJebI69AW490Q/N6
         qwb5PZIwJDwFWTT0kt8aes3Xy6S+DO9jWbQeigk7ITKIT1rL1wDLM6qLhrNmojgzAKTs
         /qSJIhMLenIGFDojvHRYn37QoJeb+q41mUUFIE3FxWBEfTbwH5p88cZ7Q1FN6tnZXliU
         XkuqRjOUn0bVAp8HdqAC+Rcp5EFiP6Hbs7sVe3vLDSVyaCVpUBnjegaiD89O+Q7F54Xf
         Y9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677891244;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+axuFcxAf29Ailu8n0Kx3xozD+Ba9C9GcmWlTun9X2U=;
        b=f2Fm/qPwQcxAp6J+QeA1UfXi4n4VDoWQXidsHLlrVP5HVaTbfkwj2ocDUU8tolPSGT
         je3x3+8Pz9ZGgBH2dYJ8AOX1813Rjezpkd8ckWiflg9lfRL+L4eTP4CkV+m+xnaBvKFb
         /P+vY11nMDfRBVyeCIB79TfYZBFEQDgEyB2JV5+EGrAFUgbk1i0zf+Qrer7k9BN15UKD
         +CGzQwvq2GDcGT2N2HJNVqocX5KoprvqVe8UuUk+Jlx+Ez6wQlGAalN7ikCUWp2ZDqNQ
         Z4zensSR0ZH2crglYg9d8QddZ7mu44XCAX7qRkQgY59jCFAah203Bsnbb/2gm5osDwmm
         ZlZg==
X-Gm-Message-State: AO0yUKUz6Xlsm/2FkYvGqAnYYSyEHH92p6Y/m8ns/4M0Vq8bX9cwqnUc
        g5tEwRSEUqElLtTH/YK9HIZQhVBdp3MJRC8=
X-Google-Smtp-Source: AK7set+d/S2wOEPQE0NtY/v4crsIIe3/Iz162mWj/zhCIaiIDYzqoE9SdW631JpZPhCp+bQDMhF/dYIjtkUTiVw=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ef0c:d8be:ebb3:b639])
 (user=saravanak job=sendgmr) by 2002:a17:90a:7bc6:b0:237:3d0c:8d58 with SMTP
 id d6-20020a17090a7bc600b002373d0c8d58mr1315425pjl.5.1677891243771; Fri, 03
 Mar 2023 16:54:03 -0800 (PST)
Date:   Fri,  3 Mar 2023 16:53:54 -0800
In-Reply-To: <20230304005355.746421-1-saravanak@google.com>
Message-Id: <20230304005355.746421-3-saravanak@google.com>
Mime-Version: 1.0
References: <20230304005355.746421-1-saravanak@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Subject: [PATCH v2 2/2] driver core: Make state_synced device attribute writeable
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the file is written to and sync_state() hasn't been called for the
device yet, then call sync_state() for the device independent of the
state of its consumers.

This is useful for supplier devices that have one or more consumers that
don't have a driver but the consumers are in a state that don't use the
resources supplied by the supplier device.

This gives finer grained control than using the
fw_devlink.sync_state=timeout kernel commandline parameter.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../ABI/testing/sysfs-devices-state_synced    |  5 ++++
 drivers/base/base.h                           |  8 +++++++
 drivers/base/core.c                           |  5 +---
 drivers/base/dd.c                             | 23 ++++++++++++++++++-
 4 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-state_synced b/Documentation/ABI/testing/sysfs-devices-state_synced
index 0c922d7d02fc..c64636ddac41 100644
--- a/Documentation/ABI/testing/sysfs-devices-state_synced
+++ b/Documentation/ABI/testing/sysfs-devices-state_synced
@@ -21,4 +21,9 @@ Description:
 		at the time the kernel starts are not affected or limited in
 		any way by sync_state() callbacks.
 
+		Writing "1" to this file will force a call to the device's
+		sync_state() function if it hasn't been called already. The
+		sync_state() call happens independent of the state of the
+		consumer devices.
+
 
diff --git a/drivers/base/base.h b/drivers/base/base.h
index 6fcd71803d35..b055eba1ec30 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -164,6 +164,14 @@ static inline int driver_match_device(struct device_driver *drv,
 	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
+static inline void dev_sync_state(struct device *dev)
+{
+	if (dev->bus->sync_state)
+		dev->bus->sync_state(dev);
+	else if (dev->driver && dev->driver->sync_state)
+		dev->driver->sync_state(dev);
+}
+
 extern int driver_add_groups(struct device_driver *drv,
 			     const struct attribute_group **groups);
 extern void driver_remove_groups(struct device_driver *drv,
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c7e1550bb02..c74e6a40f0de 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1173,10 +1173,7 @@ static void device_links_flush_sync_list(struct list_head *list,
 		if (dev != dont_lock_dev)
 			device_lock(dev);
 
-		if (dev->bus->sync_state)
-			dev->bus->sync_state(dev);
-		else if (dev->driver && dev->driver->sync_state)
-			dev->driver->sync_state(dev);
+		dev_sync_state(dev);
 
 		if (dev != dont_lock_dev)
 			device_unlock(dev);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 84f07e0050dd..7b9ab2050b84 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -510,6 +510,27 @@ EXPORT_SYMBOL_GPL(device_bind_driver);
 static atomic_t probe_count = ATOMIC_INIT(0);
 static DECLARE_WAIT_QUEUE_HEAD(probe_waitqueue);
 
+static ssize_t state_synced_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	int ret = 0;
+
+	if (strcmp("1", buf))
+		return -EINVAL;
+
+	device_lock(dev);
+	if (!dev->state_synced) {
+		dev->state_synced = true;
+		dev_sync_state(dev);
+	} else {
+		ret = -EINVAL;
+	}
+	device_unlock(dev);
+
+	return ret ? ret : count;
+}
+
 static ssize_t state_synced_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
@@ -521,7 +542,7 @@ static ssize_t state_synced_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", val);
 }
-static DEVICE_ATTR_RO(state_synced);
+static DEVICE_ATTR_RW(state_synced);
 
 static void device_unbind_cleanup(struct device *dev)
 {
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

