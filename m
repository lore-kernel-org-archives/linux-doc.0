Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882A0C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 16:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiDHQPz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbiDHQPv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 12:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DF1375C32
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 09:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649434424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TJpTIeTAW53bGCMvTatNT6vUmRrWyDElzFlDd/19otY=;
        b=Zg1CPQMsKNWCT04j4ak9hgIePvQYJJjd9SbygvvFHHjOkLCvhFitHbZ+TpV9QrdSqWTWtU
        0GrkjEMDuBiviZgDmuy6+0zE2ncG/0N8VzdzyYK8BtfBG9LFc5ZO545PqXuQXC/oiNx7KG
        W9qnt9ox+hk+9y+QZAAxfBY/qwNDfd0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-i3R_7AxjMQ2fge-leuRZng-1; Fri, 08 Apr 2022 12:13:43 -0400
X-MC-Unique: i3R_7AxjMQ2fge-leuRZng-1
Received: by mail-wr1-f70.google.com with SMTP id z16-20020adff1d0000000b001ef7dc78b23so2349698wro.12
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 09:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJpTIeTAW53bGCMvTatNT6vUmRrWyDElzFlDd/19otY=;
        b=ZAlaOOYjO9JWoLDNHXGfpo08/XpEdLhHkItYz20FaRvzg0lRmTgkUVKU9wPiaBSnDd
         1HhOooAhHIJJ+uz26d1o8zg3hMPDrjK5n7Qz7CgA3y7Q7w3BtuVfW/LaQDjP+XYTraUn
         6EN7dBFKcU+9DQ14+2y4weG+9TaecDPh9K5Ope4EV9bIg2qqDMgyjjDO7eShEQnpvD6/
         JorL6DQ5hSXQxHwQ1x/yTtx4dhn6UIDh9ACFm/BovEsgi3Oyj60d/FRgyphyFdU7BUVI
         LuiqR3SRiBsapskMdTIaGGAxG8jEYPOHSZOEnevliKoeMvxo/x9cBpk3GEUr5RTnfCx5
         IG3Q==
X-Gm-Message-State: AOAM532no6LHOXNhty+qw5nKSjyfxyxk4G4ueHi66JIXkKqwSEfd1W9K
        ncaskHHCzjuBRmjJuzfcn2kedCfAt8+M3YYZvJkiMDLRemGxiVQr7fh+mL23hvdeDoy131idML1
        CIKFohjtqLOzOVFqGRvBd
X-Received: by 2002:a05:600c:3ba5:b0:38c:b19e:253c with SMTP id n37-20020a05600c3ba500b0038cb19e253cmr17515130wms.35.1649434422188;
        Fri, 08 Apr 2022 09:13:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb1bR0lxJrypE9QzahDsl2bHOBw/ximpksO0RRlntgb9gNAXEXCpGe5WPVpBzMKq9R/nVknw==
X-Received: by 2002:a05:600c:3ba5:b0:38c:b19e:253c with SMTP id n37-20020a05600c3ba500b0038cb19e253cmr17515110wms.35.1649434421957;
        Fri, 08 Apr 2022 09:13:41 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t15-20020adfeb8f000000b002060d26c211sm14377455wrn.114.2022.04.08.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:13:41 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Borislav Petkov <bp@suse.de>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 2/5] firmware: sysfb: Add helpers to unregister a pdev and disable registration
Date:   Fri,  8 Apr 2022 18:13:19 +0200
Message-Id: <20220408161322.270176-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408161322.270176-1-javierm@redhat.com>
References: <20220408161322.270176-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These can be used by subsystems to unregister a platform device registered
by sysfb and also to disable future platform device registration in sysfb.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

Changes in v2:
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 73 +++++++++++++++++--
 include/linux/sysfb.h                         | 19 +++++
 3 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index b81794e0cfbb..06ac89adaafb 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -13,6 +13,12 @@ EDD Interfaces
 .. kernel-doc:: drivers/firmware/edd.c
    :internal:
 
+Generic System Framebuffers Interface
+-------------------------------------
+
+.. kernel-doc:: drivers/firmware/sysfb.c
+   :export:
+
 Intel Stratix10 SoC Service Layer
 ---------------------------------
 Some features of the Intel Stratix10 SoC require a level of privilege
diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index b032f40a92de..a50d2858ce4d 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -34,21 +34,78 @@
 #include <linux/screen_info.h>
 #include <linux/sysfb.h>
 
+static struct platform_device *pd;
+static DEFINE_MUTEX(load_lock);
+static bool disabled;
+
+/**
+ * sysfb_disable() - disable the Generic System Framebuffers support
+ *
+ * This disables the registration of system framebuffer devices that match the
+ * generic drivers that make use of the system framebuffer set up by firmware.
+ *
+ * Context: The function can sleep. A @load_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a system framebuffer device and
+ *          sysfb_try_unregister(), that tries to unregister framebuffer devices.
+ */
+void sysfb_disable(void)
+{
+	mutex_lock(&load_lock);
+	disabled = true;
+	mutex_unlock(&load_lock);
+}
+EXPORT_SYMBOL_GPL(sysfb_disable);
+
+/**
+ * sysfb_try_unregister() - attempt to unregister a system framebuffer device
+ * @dev: device to unregister
+ *
+ * This tries to unregister a system framebuffer device if this was registered
+ * by the Generic System Framebuffers. The device will only be unregistered if
+ * it was registered by sysfb_init(), otherwise it will not be unregistered.
+ *
+ * Context: The function can sleep. a @load_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a simple framebuffer device and
+ *          sysfb_disable(), that disables the Generic System Framebuffers support.
+ *
+ * Return:
+ * * true          - the device was unregistered successfully
+ * * false         - the device was not unregistered
+ */
+bool sysfb_try_unregister(struct device *dev)
+{
+	bool ret = true;
+
+	mutex_lock(&load_lock);
+	if (!pd || pd != to_platform_device(dev))
+		return false;
+
+	platform_device_unregister(to_platform_device(dev));
+	pd = NULL;
+	mutex_unlock(&load_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sysfb_try_unregister);
+
 static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
 	struct simplefb_platform_data mode;
-	struct platform_device *pd;
 	const char *name;
 	bool compatible;
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&load_lock);
+	if (disabled)
+		goto unlock_mutex;
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
 		pd = sysfb_create_simplefb(si, &mode);
 		if (!IS_ERR(pd))
-			return 0;
+			goto unlock_mutex;
 	}
 
 	/* if the FB is incompatible, create a legacy framebuffer device */
@@ -60,8 +117,10 @@ static __init int sysfb_init(void)
 		name = "platform-framebuffer";
 
 	pd = platform_device_alloc(name, 0);
-	if (!pd)
-		return -ENOMEM;
+	if (!pd) {
+		ret = -ENOMEM;
+		goto unlock_mutex;
+	}
 
 	sysfb_apply_efi_quirks(pd);
 
@@ -73,9 +132,11 @@ static __init int sysfb_init(void)
 	if (ret)
 		goto err;
 
-	return 0;
+	goto unlock_mutex;
 err:
 	platform_device_put(pd);
+unlock_mutex:
+	mutex_unlock(&load_lock);
 	return ret;
 }
 
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 708152e9037b..e8c0313fac8f 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -55,6 +55,25 @@ struct efifb_dmi_info {
 	int flags;
 };
 
+#ifdef CONFIG_SYSFB
+
+void sysfb_disable(void);
+bool sysfb_try_unregister(struct device *dev);
+
+#else /* CONFIG_SYSFB */
+
+static inline void sysfb_disable(void)
+{
+
+}
+
+static inline bool sysfb_try_unregister(struct device *dev)
+{
+	return false;
+}
+
+#endif /* CONFIG_SYSFB */
+
 #ifdef CONFIG_EFI
 
 extern struct efifb_dmi_info efifb_dmi_list[];
-- 
2.35.1

