Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10078C64ED8
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 07:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBXHFT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 02:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjBXHFR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 02:05:17 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DDB5709C
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 23:05:13 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536c6ce8d74so164358187b3.9
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 23:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+l/gP+iysqsRB43duh9kZBtRtq2LAAnIWFg2+WPan3g=;
        b=tKcK63JCvyHP6aNIn2Nj1rJm0q9cxOHq4V6Iler+RDxxKJLit2PtpGCgFjpyQWp+7Y
         lrC/n+V5jBAPtWnGtRVJrXagNs2VEw/yYnlBjo96u7Lyi59lMiWxRzjXRCu0uoYMYjnj
         R9CLDF7NDek6Aa2iHh6zQ3RwHoj3Ir73i+3rP9pkwrXNm0q5qO55mS3yr0CfZSEUO4//
         mpQeMUQPS0ish9GA5I7D36Kk6vvFUuJ9bcOXCV3snvoaCE1rxnRqk5TNLFcS7DQQqLU+
         A91SY4AspGe8Q3oNXJNALZiz1wy1EeyxeNjIb8dmLQwmvg+TCa772SuFnZSMKdu144ff
         qJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+l/gP+iysqsRB43duh9kZBtRtq2LAAnIWFg2+WPan3g=;
        b=KSueKiEZaQ2RDNCAFpCajVekQ3D7z5eIif/MptYlFMs3hUHbf6W17FYsud4ikxGddI
         ERKAzR2TKVM5A+5IQFjoR3OxJ26arX0FEd+BlOZ7VF991bX/kDxc/PQcY3yw1ZXYfQRq
         QpbmTuJgs+Lu757p08CLh5q4VIeCFocrMlHR8H/kmoL55e4pqRj/nDhgdngoSraWc0gX
         CBokBqQle5y5UDBtUfYpQyfH9NDEzQ5+8o8v6qIpS6kSFBNkKwPxFucDyYttOGvZJNqJ
         jjW5Nhrfct+TShHeePeqDDMfxD3cWCJfMvzM/Egh0ENtPK/bxcv/ANhPcCFdYEqTwama
         m0Gg==
X-Gm-Message-State: AO0yUKVsYLPR95Ee+xOV2N9oHrRtjcOu3eL1xlNvRAtXoV7mEv0HA6lu
        6sYJMb0I/sL0awoJn5enunIEq9NhJv4LgPk=
X-Google-Smtp-Source: AK7set/AEl/qdaXCnJyTf3ldjNvJ9jpRjl9vHLc1DehB3WZkwKF3/cc/isZ5YdYM/GaHCvRWJXk4SNXA5+jx+1U=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:8a2e:9303:e359:c4d6])
 (user=saravanak job=sendgmr) by 2002:a05:6902:1449:b0:a06:538f:265f with SMTP
 id a9-20020a056902144900b00a06538f265fmr4528972ybv.4.1677222312599; Thu, 23
 Feb 2023 23:05:12 -0800 (PST)
Date:   Thu, 23 Feb 2023 23:05:03 -0800
In-Reply-To: <20230224070506.4157738-1-saravanak@google.com>
Message-Id: <20230224070506.4157738-2-saravanak@google.com>
Mime-Version: 1.0
References: <20230224070506.4157738-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Subject: [PATCH v1 1/2] driver core: Add fw_devlink.sync_state command line param
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

When all devices that could probe have finished probing, this parameter
controls what to do with devices that haven't yet received their
sync_state() calls.

fw_devlink.sync_state=strict is the default and the driver core will
continue waiting on consumers to probe successfully in the future. This
is the default behavior since calling sync_state() when all the
consumers haven't probed could make some systems unusable/unstable.

fw_devlink.sync_state=timeout will cause the driver core to give up
waiting on consumers and call sync_state() on any devices that haven't
yet received their sync_state() calls. This option is provided for
systems that won't become unusable/unstable as they might be able to
save power (depends on state of hardware before kernel starts) if all
devices get their sync_state().

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 12 ++++
 drivers/base/base.h                           |  1 +
 drivers/base/core.c                           | 58 +++++++++++++++++++
 drivers/base/dd.c                             |  6 ++
 4 files changed, 77 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6cfa6e3996cf..f0bf2f40af64 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1594,6 +1594,18 @@
 			dependencies. This only applies for fw_devlink=on|rpm.
 			Format: <bool>
 
+	fw_devlink.sync_state =
+			[KNL] When all devices that could probe have finished
+			probing, this parameter controls what to do with
+			devices that haven't yet received their sync_state()
+			calls.
+			Format: { strict | timeout }
+			strict -- Default. Continue waiting on consumers to
+				probe successfully.
+			timeout -- Give up waiting on consumers and call
+				sync_state() on any devices that haven't yet
+				received their sync_state() calls.
+
 	gamecon.map[2|3]=
 			[HW,JOY] Multisystem joystick and NES/SNES/PSX pad
 			support via parallel port (up to 5 devices per port)
diff --git a/drivers/base/base.h b/drivers/base/base.h
index 726a12a244c0..6fcd71803d35 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -209,6 +209,7 @@ extern void device_links_no_driver(struct device *dev);
 extern bool device_links_busy(struct device *dev);
 extern void device_links_unbind_consumers(struct device *dev);
 extern void fw_devlink_drivers_done(void);
+extern void fw_devlink_probing_done(void);
 
 /* device pm support */
 void device_pm_move_to_tail(struct device *dev);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index f9297c68214a..929ec218f180 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1727,6 +1727,26 @@ static int __init fw_devlink_strict_setup(char *arg)
 }
 early_param("fw_devlink.strict", fw_devlink_strict_setup);
 
+#define FW_DEVLINK_SYNC_STATE_STRICT	0
+#define FW_DEVLINK_SYNC_STATE_TIMEOUT	1
+
+static int fw_devlink_sync_state;
+static int __init fw_devlink_sync_state_setup(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strcmp(arg, "strict") == 0) {
+		fw_devlink_sync_state = FW_DEVLINK_SYNC_STATE_STRICT;
+		return 0;
+	} else if (strcmp(arg, "timeout") == 0) {
+		fw_devlink_sync_state = FW_DEVLINK_SYNC_STATE_TIMEOUT;
+		return 0;
+	}
+	return -EINVAL;
+}
+early_param("fw_devlink.sync_state", fw_devlink_sync_state_setup);
+
 static inline u32 fw_devlink_get_flags(u8 fwlink_flags)
 {
 	if (fwlink_flags & FWLINK_FLAG_CYCLE)
@@ -1797,6 +1817,44 @@ void fw_devlink_drivers_done(void)
 	device_links_write_unlock();
 }
 
+static int fw_devlink_dev_sync_state(struct device *dev, void *data)
+{
+	struct device_link *link = to_devlink(dev);
+	struct device *sup = link->supplier;
+
+	if (!(link->flags & DL_FLAG_MANAGED) ||
+	    link->status == DL_STATE_ACTIVE || sup->state_synced ||
+	    !dev_has_sync_state(sup))
+		return 0;
+
+	if (fw_devlink_sync_state == FW_DEVLINK_SYNC_STATE_STRICT) {
+		dev_warn(sup, "sync_state() pending due to %s\n",
+			 dev_name(link->consumer));
+		return 0;
+	}
+
+	if (!list_empty(&sup->links.defer_sync))
+		return 0;
+
+	dev_warn(sup, "Timed out. Calling sync_state()\n");
+	sup->state_synced = true;
+	get_device(sup);
+	list_add_tail(&sup->links.defer_sync, data);
+
+	return 0;
+}
+
+void fw_devlink_probing_done(void)
+{
+	LIST_HEAD(sync_list);
+
+	device_links_write_lock();
+	class_for_each_device(&devlink_class, NULL, &sync_list,
+			      fw_devlink_dev_sync_state);
+	device_links_write_unlock();
+	device_links_flush_sync_list(&sync_list, NULL);
+}
+
 /**
  * wait_for_init_devices_probe - Try to probe any device needed for init
  *
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 8def2ba08a82..84f07e0050dd 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -315,6 +315,8 @@ static void deferred_probe_timeout_work_func(struct work_struct *work)
 	list_for_each_entry(p, &deferred_probe_pending_list, deferred_probe)
 		dev_info(p->device, "deferred probe pending\n");
 	mutex_unlock(&deferred_probe_mutex);
+
+	fw_devlink_probing_done();
 }
 static DECLARE_DELAYED_WORK(deferred_probe_timeout_work, deferred_probe_timeout_work_func);
 
@@ -364,6 +366,10 @@ static int deferred_probe_initcall(void)
 		schedule_delayed_work(&deferred_probe_timeout_work,
 			driver_deferred_probe_timeout * HZ);
 	}
+
+	if (!IS_ENABLED(CONFIG_MODULES))
+		fw_devlink_probing_done();
+
 	return 0;
 }
 late_initcall(deferred_probe_initcall);
-- 
2.39.2.637.g21b0678d19-goog

