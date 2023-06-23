Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56118C001B1
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 22:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjFWWZx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 18:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbjFWWZs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 18:25:48 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8D82728
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:25:43 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fa0253b9e7so11055565e9.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687559142; x=1690151142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVDfyQp1D2UHXpL1ZVItWp64PNlbA4FYgRcewIHu8Ww=;
        b=PRuOCVqjhaiUIaUxHpcOBEuD6ZfRhG69YI9VhpRhJBg/QRW8qHokII2mDUDfTkEvKb
         j5XmH5Dnv+539X4Yu3HnU2WPe9mnfR6Lm4OVBFbS3IvhFBzZ6KHFOqoGVuXxWBd+BoMw
         LNLpD2UixobZWhUHVRCICdr09zBrDVUX/tFNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687559142; x=1690151142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVDfyQp1D2UHXpL1ZVItWp64PNlbA4FYgRcewIHu8Ww=;
        b=SAWW2ja2huOUu9QZaF7x4tyvaiL1a7YBi8T/mPlS69QBWhNCGoZ9CPnxkRz+snI42a
         czbCBgFw6uIv2QHDq2k9B/rPPdcnyHdtw4QWXkF7KAMadVznykdr4CBafZ9S1GD/qN8l
         SkfEZNwdUwAHJB3x/qUaqpvtEoGLTPrvLUAuDyYXRMZN2n6erJtwC3nIL4mh2L/6bm+o
         XsDcVZgIlLn2CkisRLOe/zkMTtS4sxuZbCa69wZR1vxMqRjUpQKHNAHFf0f+4fBEK82M
         hHGRrpaVmOiTaGnufy9Cgs1rSL+g4J1ieKGIqsbJGttnRKkpk06TpfExo4zUPLz5Kpuz
         IKdQ==
X-Gm-Message-State: AC+VfDxPyEnCYW1Al96b28FnqXZyVVE3p6tSGqY08CD/d6ypSfPUizmp
        LHD479WIxkzqKlcyMqs7If6ozg==
X-Google-Smtp-Source: ACHHUZ7pe50hzgM5iLC2579qWnSeqdzLoUZ3+Orq7sbVqA9W1K1hggz4Fbs/PlyG3wmdZULYjOJhjA==
X-Received: by 2002:a05:600c:138c:b0:3fa:7bf0:7a81 with SMTP id u12-20020a05600c138c00b003fa7bf07a81mr2995293wmf.0.1687559141956;
        Fri, 23 Jun 2023 15:25:41 -0700 (PDT)
Received: from big-boopo.mynetworksettings.com (pool-108-46-233-209.nycmny.fios.verizon.net. [108.46.233.209])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4106000000b0030c2e3c7fb3sm453223wrp.101.2023.06.23.15.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 15:25:41 -0700 (PDT)
From:   Jim Shargo <jshargo@chromium.org>
To:     mairacanal@riseup.net, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jim Shargo <jshargo@chromium.org>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/vkms: Add a module param to enable/disable the default device
Date:   Fri, 23 Jun 2023 18:23:48 -0400
Message-ID: <20230623222353.97283-7-jshargo@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In many testing circumstances, we will want to just create a new device
and test against that. If we create a default device, it can be annoying
to have to manually select the new device instead of choosing the only
one that exists.

The param, enable_default, is defaulted to true to maintain backwards
compatibility.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 44 ++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 314a04659c5f..1cb56c090a65 100644
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
 
@@ -278,10 +287,7 @@ void vkms_remove_device(struct vkms_device *vkms_device)
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
@@ -289,19 +295,27 @@ static int __init vkms_init(void)
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
2.41.0.162.gfafddb0af9-goog

