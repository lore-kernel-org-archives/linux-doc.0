Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B3B17D917
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 14:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfH2Oik (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 10:38:40 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41940 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfH2OiL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id j16so3676679wrr.8
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EJfPP5atfV3eSCTszpyCebUCVFcxH3I0X3/v6tzHHPs=;
        b=j3iL5AxS+QuxlgiwfzFmqxtAw+l/kQVAB7MwNil4brsvAXADxL7z5aJnpDcN94+t4s
         s2o3tlk9Z1I1/NNZTiNbVwSnOeBqf0SjJCdHNE6SMHT+5SLGSve2aypUMjograedaUnB
         vBFpjGwrYU3P+HPS2LKSxAHIFXNjSF3dfSrnNdbNHvhLy9q6dPdoApjonGwYtGg1tLJN
         tgN0LAy69Xqh1FYkumNu9ZkbHIAzuv55QV7HUH4V93vEx8CqIMV3Venxtm89gN7/glZr
         RXY49S0kinnUKz1FRF1AlH/lEAD0AV54LwTcB2pXINIpgp3rIGU+sdkSbA4YqgA54sNA
         CtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EJfPP5atfV3eSCTszpyCebUCVFcxH3I0X3/v6tzHHPs=;
        b=ZRobWBUWMXh2zKm77xkwTdZDlbsFveTOfEk8GocFnbIGzp72GrdjgTr4tow5ZvfzvO
         O1onAorPSHQ/9AhmVnVhBfd39ik13IRE/sZitba4sQ126T+xB6i2TBAPwzmhfPBDuRsx
         QqCOpGieV2yW4RH+0JhyCB27ErDQKly3ueERkwyyFJIEDKEoIS//JbC10yQQWMzFiB2A
         EXpB+BMxVVTZLltMfSXIoJKPl0hAyfSe4Gx8RuDeS+RRcI4o7MSiQka7ybsdzF70LiFx
         b9G2SLnEuAlq/1F7CvxeLjePJJVsGD3h27fH5Y9KvMvox+lBhTxByuPiG7gV3N/fGxae
         L0Aw==
X-Gm-Message-State: APjAAAXi2Bjm9QBS841UPc7uxPyX7O1sQAJ3v2tKOJ6cczo3f37DlWZ2
        0qBcrHvARzm/RUCmEC1xYGuzhA==
X-Google-Smtp-Source: APXvYqw4L8vlTt1pO01RoDKqoT98oWK/sBx0v1htwPizOMNtq/RhGrNoXKy2m8Tm2p6sqYoZMXFduQ==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3892995wrw.18.1567089488082;
        Thu, 29 Aug 2019 07:38:08 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/9] drivers: provide new variants of devm_platform_ioremap_resource()
Date:   Thu, 29 Aug 2019 16:37:37 +0200
Message-Id: <20190829143742.24726-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide two new variants of devm_platform_ioremap_resource() - one for
nocache and one for write-combined ioremap.

Move the core functionality into a separate static function -
__devm_platform_ioremap_resource() - that takes an additional type
argument.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../driver-api/driver-model/devres.rst        |  2 +
 drivers/base/platform.c                       | 70 +++++++++++++++++--
 include/linux/platform_device.h               |  6 ++
 3 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 20c4be0389ab..37d10e5cc44c 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -319,6 +319,8 @@ IOMAP
   devm_ioremap_resource_nocache()
   devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
+  devm_platform_ioremap_resource_nocache()
+  devm_platform_ioremap_resource_wc()
   devm_iounmap()
   pcim_iomap()
   pcim_iomap_regions()	: do request_region() and iomap() on multiple BARs
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index ec974ba9c0c4..4191e776ebae 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -79,6 +79,37 @@ struct resource *platform_get_resource(struct platform_device *dev,
 }
 EXPORT_SYMBOL_GPL(platform_get_resource);
 
+#ifdef CONFIG_HAS_IOMEM
+enum {
+	IOREMAP_TYPE_NONE,
+	IOREMAP_TYPE_NOCACHE,
+	IOREMAP_TYPE_WC,
+};
+
+static void __iomem *
+__devm_platform_ioremap_resource(struct platform_device *pdev,
+				 unsigned int index, int type)
+{
+	struct resource *res = platform_get_resource(pdev,
+						     IORESOURCE_MEM, index);
+	struct device *dev = &pdev->dev;
+	void __iomem *addr = NULL;
+
+	switch (type) {
+	case IOREMAP_TYPE_NONE:
+		addr = devm_ioremap_resource(dev, res);
+		break;
+	case IOREMAP_TYPE_NOCACHE:
+		addr = devm_ioremap_resource_nocache(dev, res);
+		break;
+	case IOREMAP_TYPE_WC:
+		addr = devm_ioremap_resource_wc(dev, res);
+		break;
+	}
+
+	return addr;
+}
+
 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
  *				    device
@@ -87,16 +118,45 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource management
  * @index: resource index
  */
-#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 					     unsigned int index)
 {
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	return devm_ioremap_resource(&pdev->dev, res);
+	return __devm_platform_ioremap_resource(pdev, index, IOREMAP_TYPE_NONE);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
+
+/**
+ * devm_platform_ioremap_resource_nocache - nocache variant of
+ *                                          devm_platform_ioremap_resource()
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @index: resource index
+ */
+void __iomem *
+devm_platform_ioremap_resource_nocache(struct platform_device *pdev,
+				       unsigned int index)
+{
+	return __devm_platform_ioremap_resource(pdev, index,
+						IOREMAP_TYPE_NOCACHE);
+}
+EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_nocache);
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
+	return __devm_platform_ioremap_resource(pdev, index, IOREMAP_TYPE_WC);
+}
+EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_wc);
+
 #endif /* CONFIG_HAS_IOMEM */
 
 /**
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 9bc36b589827..00ae0679396e 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -54,6 +54,12 @@ extern struct resource *platform_get_resource(struct platform_device *,
 extern void __iomem *
 devm_platform_ioremap_resource(struct platform_device *pdev,
 			       unsigned int index);
+extern void __iomem *
+devm_platform_ioremap_resource_nocache(struct platform_device *pdev,
+				       unsigned int index);
+extern void __iomem *
+devm_platform_ioremap_resource_wc(struct platform_device *pdev,
+				  unsigned int index);
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);
 extern struct resource *platform_get_resource_byname(struct platform_device *,
-- 
2.21.0

