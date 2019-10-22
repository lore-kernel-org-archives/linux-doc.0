Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 416937D923
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 08:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388526AbfJVIna (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 04:43:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36860 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388531AbfJVIn3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 04:43:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id c22so6179152wmd.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t38qTDyvCIN9F9VCdUnEGu/RLffByFTv/wX9PAJP8Dc=;
        b=oHGNj3EJ0Ty7HQmiQAZbNf3l0P/707ITFCQlTvwdXl3FFPMFhHW9BShbgCf39oVQ3c
         lzRXbdE1ppQABfMJ95Uf3/HCE/YcNaSSNmYUbaofRGyagi9I/4B8/DWAShdzRHmmkI+N
         XuC3xeTgugOUTS8bycmLpo8uvdXnHggii8OuAlG9ary5wyIpAsb/4sy3xwSEfxi+tapH
         ZSMCBy6uP3MohrRn3zJeFAlq+N5W3DZwGCyuGnkaAocoX8BD8mgJZPq+YusTKtNGDVEK
         WdqyWyYOq4aLKeU063ssygetioghbxbBtfu7i78GWLsFbrQzSzZ7XZVWOPRn764lWrme
         ZHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t38qTDyvCIN9F9VCdUnEGu/RLffByFTv/wX9PAJP8Dc=;
        b=EmpWa2VTEZPJmDVWayjsOaY3N6x+UzncqROnYao5edTbNiDN4Nqr1VAoapvm9hHx1O
         vh/QDypbyuGVR5tL+FzcnJTK0QOz3LCk6aoTUY9IAVzBc0PrltuJWKxLFOIdytMrARfZ
         1gd+aUwuQKyBziehAj0/SZdrGEpVQBTsoRL1OI2BE2VPuo8mZHIcUfsQ5vNEAulCoZ1+
         0JbFqnox/58BRw8D9d4pZrBNV8bSOPYL6tOJMD5rpE2wJfMJLG6dM2rTdy3JUwTZwTc+
         ptKeNfE/OlCKlc25I8W5sxo+oRYeRyY9mffcYAGwK2MXPG++Ddz95nPus2SIJTLz0vKj
         Q+lQ==
X-Gm-Message-State: APjAAAW+36qJNW3lyxA84NNT1aNmXeND0LFcIP8fsYDAaTiapThjwhwi
        AOjvhdWlHluzSIl5y36s2H2K7w==
X-Google-Smtp-Source: APXvYqziGeOfTJY/tjRJaq6DIbQhhMJ2O+ETxOZtnm9hsV8gFqOYspSodZCQI2yyNEqrFx4UOjkFBA==
X-Received: by 2002:a1c:80c7:: with SMTP id b190mr1952384wmd.3.1571733807272;
        Tue, 22 Oct 2019 01:43:27 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 4/8] drivers: platform: provide devm_platform_ioremap_resource_wc()
Date:   Tue, 22 Oct 2019 10:43:14 +0200
Message-Id: <20191022084318.22256-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide a write-combined variant of devm_platform_ioremap_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/base/platform.c                       | 19 ++++++++++++++++++-
 include/linux/platform_device.h               |  3 +++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index e605bb9df6e1..480b78ca3871 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -318,6 +318,7 @@ IOMAP
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
   devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
+  devm_platform_ioremap_resource_wc()
   devm_iounmap()
   pcim_iomap()
   pcim_iomap_regions()	: do request_region() and iomap() on multiple BARs
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b230beb6ccb4..177010c27516 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -60,6 +60,7 @@ struct resource *platform_get_resource(struct platform_device *dev,
 }
 EXPORT_SYMBOL_GPL(platform_get_resource);
 
+#ifdef CONFIG_HAS_IOMEM
 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
  *				    device
@@ -68,7 +69,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource management
  * @index: resource index
  */
-#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 					     unsigned int index)
 {
@@ -78,6 +78,23 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, res);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
+
+/**
+ * devm_platform_ioremap_resource_wc - write-combined variant of
+ *                                     devm_platform_ioremap_resource()
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @index: resource index
+ */
+void __iomem *devm_platform_ioremap_resource_wc(struct platform_device *pdev,
+						unsigned int index)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	return devm_ioremap_resource_wc(&pdev->dev, res);
+}
 #endif /* CONFIG_HAS_IOMEM */
 
 static int __platform_get_irq(struct platform_device *dev, unsigned int num)
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index f2688404d1cd..74cecb919e5c 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -57,6 +57,9 @@ platform_find_device_by_driver(struct device *start,
 extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
+extern void __iomem *
+devm_platform_ioremap_resource_wc(struct platform_device *pdev,
+				  unsigned int index);
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_get_irq_optional(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);
-- 
2.23.0

