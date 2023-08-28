Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2A7C83F19
	for <linux-doc@archiver.kernel.org>; Mon, 28 Aug 2023 08:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjH1IUg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Aug 2023 04:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjH1IUY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 04:20:24 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8832518F
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 01:19:55 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68c3b9f85b7so1011359b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693210794; x=1693815594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UibU+Wd31ET9DKxhDYToQOnKhMNxhV0MyhlXlmFI9GI=;
        b=CmXZbxJntHGG1b9kzja0m/uFqEjI2HE8xuGaQeBIWCNOqAUJiCZFqfvkzhEEj0bgvl
         1l+2QBjh6QYngBMf+zNERYA+zp4dFsHKO3lXQSKh7qtUjdDy7Vrd7rtonXiK4T+4ly78
         kXulRC1tkxiDJ4YqgXIPYmNPrPfSiM930ezGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693210794; x=1693815594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UibU+Wd31ET9DKxhDYToQOnKhMNxhV0MyhlXlmFI9GI=;
        b=PPs4Tm+mDncDdP7GuQXo+6ouZy9ejhGQyxoQPHhyvkkCkqeJ6vrljMMiwGyEhJ1R6y
         W6DtMEMErYqV2+uDAw0PLlJSE7v10lRH1nC34Z+y4L9uNmINI2dxLai4J+Ji7JpW0R7H
         1DabIseu4JY3jMQpBkRrMJLqSIDBmsV5XjpuBHPyhd9Pyr9dkKmhTjbklW1q02xZPgSe
         kV9vEpTFnAsbM800Cx07MBG1x2naiHHlWTHPwxul/MoPI6wFFEVskhl/K4TUbtgz11Xr
         i/CEknoJ3oSEasdOolsVdc/8BYxJbz7TgDYDUtpZrEEvnVFYlnNxcN5H5dFDkmge6aqD
         5dLQ==
X-Gm-Message-State: AOJu0YxbSkbJRo0HxPMxUUfVYEyWTlA7CXUJQpnolLV5o75JgNdoeMMY
        tHem/++NTdTAyNvCXX0fbtpFgA==
X-Google-Smtp-Source: AGHT+IGxC+HI4UmHG2mgTdcGmGBTuRWMSNFozW9cT/n/yeNI38VxgMvbgpSJrZMwuczrhDKiiNAlmA==
X-Received: by 2002:a05:6a20:1447:b0:148:40cf:b832 with SMTP id a7-20020a056a20144700b0014840cfb832mr24465409pzi.18.1693210794536;
        Mon, 28 Aug 2023 01:19:54 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b001bf6ea340b3sm6616779plz.116.2023.08.28.01.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 01:19:54 -0700 (PDT)
From:   Brandon Pollack <brpol@chromium.org>
To:     marius.vlad@collabora.com, mairacanal@riseup.net,
        jshargo@chromium.org
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, melissa.srw@gmail.com,
        mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mduggan@chromium.org,
        hirono@chromium.org, Brandon Pollack <brpol@chromium.org>
Subject: [PATCH v5 6/7] drm/vkms: Add a module param to enable/disable the default device
Date:   Mon, 28 Aug 2023 08:17:08 +0000
Message-ID: <20230828081929.3574228-7-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230828081929.3574228-1-brpol@chromium.org>
References: <20230828081929.3574228-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jim Shargo <jshargo@chromium.org>

In many testing circumstances, we will want to just create a new device
and test against that. If we create a default device, it can be annoying
to have to manually select the new device instead of choosing the only
one that exists.

The param, enable_default, is defaulted to true to maintain backwards
compatibility.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 45 ++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6e7f20681890..293bebf8e8ce 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -42,17 +42,26 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+static bool enable_default_device = true;
+module_param_named(enable_default_device, enable_default_device, bool, 0444);
+MODULE_PARM_DESC(enable_default_device,
+		 "Enable/Disable creating the default device");
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
-MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
+MODULE_PARM_DESC(enable_cursor,
+		 "Enable/Disable cursor support for the default device");
 
 static bool enable_writeback = true;
 module_param_named(enable_writeback, enable_writeback, bool, 0444);
-MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
+MODULE_PARM_DESC(
+	enable_writeback,
+	"Enable/Disable writeback connector support for the default device");
 
 static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
-MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
+MODULE_PARM_DESC(enable_overlay,
+		 "Enable/Disable overlay support for the default device");
 
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
@@ -99,6 +108,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
+	seq_printf(m, "default_device=%d\n", enable_default_device);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config.writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config.cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config.overlay);
@@ -297,10 +307,7 @@ void vkms_remove_device(struct vkms_device *vkms_device)
 static int __init vkms_init(void)
 {
 	int ret;
-	struct platform_device *pdev;
-	struct vkms_device_setup vkms_device_setup = {
-		.configfs = NULL,
-	};
+	struct platform_device *default_pdev = NULL;
 
 	ret = platform_driver_register(&vkms_platform_driver);
 	if (ret) {
@@ -308,19 +315,27 @@ static int __init vkms_init(void)
 		return ret;
 	}
 
-	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
-					     &vkms_device_setup,
-					     sizeof(vkms_device_setup));
-	if (IS_ERR(pdev)) {
-		DRM_ERROR("Unable to register default vkms device\n");
-		platform_driver_unregister(&vkms_platform_driver);
-		return PTR_ERR(pdev);
+	if (enable_default_device) {
+		struct vkms_device_setup vkms_device_setup = {
+			.configfs = NULL,
+		};
+
+		default_pdev = platform_device_register_data(
+			NULL, DRIVER_NAME, 0, &vkms_device_setup,
+			sizeof(vkms_device_setup));
+		if (IS_ERR(default_pdev)) {
+			DRM_ERROR("Unable to register default vkms device\n");
+			platform_driver_unregister(&vkms_platform_driver);
+			return PTR_ERR(default_pdev);
+		}
 	}
 
 	ret = vkms_init_configfs();
 	if (ret) {
 		DRM_ERROR("Unable to initialize configfs\n");
-		platform_device_unregister(pdev);
+		if (default_pdev)
+			platform_device_unregister(default_pdev);
+
 		platform_driver_unregister(&vkms_platform_driver);
 	}
 
-- 
2.42.0.rc1.204.g551eb34607-goog

