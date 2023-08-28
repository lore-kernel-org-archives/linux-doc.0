Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4638CC83F1E
	for <linux-doc@archiver.kernel.org>; Mon, 28 Aug 2023 08:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjH1IQo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Aug 2023 04:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjH1IQl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 04:16:41 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2673AA
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 01:16:38 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c0c6d4d650so22981465ad.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693210598; x=1693815398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UibU+Wd31ET9DKxhDYToQOnKhMNxhV0MyhlXlmFI9GI=;
        b=OjBUvIwCxYRlevkhbkEmo5J3ZX2RFnY7yev+4D+QSCkev4/veBjbC/9g2rAlcs3IVP
         wSkh9N0EvL2l1bxhlhUIAlszMF+xzue8Q6qkU9SUKBWbfjRvUm97RMKSGedF9NVEfLrD
         5AOwkWYfchOgWXSimFHMjLZxepfpv3jRtBIOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693210598; x=1693815398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UibU+Wd31ET9DKxhDYToQOnKhMNxhV0MyhlXlmFI9GI=;
        b=VY1yPrLA7I5v/Y8Nnx8uxlYIJUXgu+B4m/eiNWngkAgKnlrfrtNl0deHQ+Whbz4slk
         KUY1MYmrcIc7qahwAVAMaFjHBE71ag3G+JUYlztHzhwqodqo6DJlU+ejIfASnyzhP/gE
         GIVH3Q9p8F/9StbI86aKuFX2oNiEBmVWHapn9EOACIPjFUAdJvcz6xMpPmsYCzEtWzl9
         /xhKnVOHqo0X6dkLzk/vh/kkYzr4svCz2+MmjZ9tgvf123VTLNqcjch7Tg8C+E6RacY/
         KcpLnNh4qt26nS4b61q0L93Z232gRAAW6o6/B8pxSjaEg+90TP+E3zJP0Z+LEZF3oLf6
         dvFw==
X-Gm-Message-State: AOJu0YxD1oHEXXwHUkFncdMJyNALWtspa1vozExZVZkwbo3c3JXx7Gdk
        h8Ikooa7zZo/p3wRe8TJAkcgaA==
X-Google-Smtp-Source: AGHT+IHiq84GfUejCTjhAUBPp+NkFpXH2+pxO/06GKBqh7JN8Eok3LixkizpcbpRU1F11hxTDGWeNA==
X-Received: by 2002:a17:902:efc1:b0:1bc:66a3:9a4b with SMTP id ja1-20020a170902efc100b001bc66a39a4bmr21862695plb.5.1693210598321;
        Mon, 28 Aug 2023 01:16:38 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id jh12-20020a170903328c00b001bf5c12e9fesm6676568plb.125.2023.08.28.01.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 01:16:38 -0700 (PDT)
From:   Brandon Pollack <brpol@chromium.org>
To:     marius.vlad@collabora.com, jshargo@chromium.org
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mairacanal@riseup.net,
        melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de,
        airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mduggan@chromium.org,
        hirono@chromium.org, Brandon Pollack <brpol@chromium.org>
Subject: [PATCH v5 6/7] drm/vkms: Add a module param to enable/disable the default device
Date:   Mon, 28 Aug 2023 08:14:48 +0000
Message-ID: <20230828081609.3572937-7-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230828081609.3572937-1-brpol@chromium.org>
References: <20230828081609.3572937-1-brpol@chromium.org>
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

