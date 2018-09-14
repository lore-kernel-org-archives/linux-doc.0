Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C02A17DE59
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbeINT5F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:57:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40586 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbeINTz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207-v6so2182327wme.5
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sH6sHViOL69spwJvTSXNgwwBEle/YysBPMHNYaVwPC4=;
        b=Koy/9eEzBccfFG9qSCX+EOZhuxMPA7hy2QzVpOung//tiU7iCFZE18fJYvadLjX0kA
         /qoGTEDfuoqQXsoDCRQoHYQBFZY52GGkoNEFHD6GQq1Yb6cXXlexKon4T1Qn2O094bql
         pkEGDJFEyXZYW640qfwuWpmTcRY1rfT4n7pFTIPq1Ulxnn+0P5DAmzqillC91rWLZP/T
         MPyMz6ujatZmEyFm9s6NSCk0V8NZ+U8de7XDUffgaD07C4K8My4oONF6vg/QBqeBol7k
         50YL2nI0k3SzjhZElLFjuWJEz2CeYTjtBDqNq7T6K5G2mG7l7OnMov9kFjr8MgD33Tc3
         jx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sH6sHViOL69spwJvTSXNgwwBEle/YysBPMHNYaVwPC4=;
        b=gI46HGI3uQby8wFktJh9wStTKlcjgpcDeWcbnjvD72zaBa/q7FsRCFIYVJ2AQiVlSX
         JMN6i4khs5xLEgqWI2tz49wXOfY6tOI9l7j7EDzx2viXvqm4GQGflhVMkDmDyJ6J9Rf6
         fUE+gQrEu7LzZDnimL6+UkzkVp8037u9SMPTawPDVP+nq2wDhkiw4F2UlNxKhWXyHUHy
         16WUWP/44XByrb5TIRs9B6Bsb8ZlDDMnQX2otOGIponFkIG+zF6q9AZ7Qn++HoJwtQOn
         dppSeelPgP275JSloscATufZ3Wr1oCBJ+RzY7kklps2SxAV9nYvIuzJ+K3ZRSmtKmTI3
         MA0g==
X-Gm-Message-State: APzg51DNd3IeDWQN+f6A6B2k3Oq3SxmP5KxKtdTuJgoJ6AUDoJGLmZJW
        sBWWWzHfWhHNiWfpFB+pijVGIw==
X-Google-Smtp-Source: ANB0VdaTRxeowG48swESmynF2i+4+p8//1nxusFMaHH5bMDpBv61xoPI4fKsn4qSlT1FiOSi5idSDw==
X-Received: by 2002:a1c:b213:: with SMTP id b19-v6mr2523529wmf.141.1536936038037;
        Fri, 14 Sep 2018 07:40:38 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 11/22] nvmem: change the signature of nvmem_unregister()
Date:   Fri, 14 Sep 2018 16:40:00 +0200
Message-Id: <20180914144011.27614-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We switched the nvmem framework to using kref instead of manually
checking the current number of users in nvmem_unregister() so this
function can no longer fail. We also converted all remaining users
that still checked the return value of nvmem_unregister() to using
devm_nvmem_register(). Make the routine return void.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 8 ++------
 include/linux/nvmem-provider.h | 9 +++------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 552ffedce38e..c950d54bb69d 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -553,20 +553,16 @@ static void nvmem_device_release(struct kref *kref)
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
- *
- * Return: Will be an negative on error or a zero on success.
  */
-int nvmem_unregister(struct nvmem_device *nvmem)
+void nvmem_unregister(struct nvmem_device *nvmem)
 {
 	kref_put(&nvmem->refcnt, nvmem_device_release);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
 static void devm_nvmem_release(struct device *dev, void *res)
 {
-	WARN_ON(nvmem_unregister(*(struct nvmem_device **)res));
+	nvmem_unregister(*(struct nvmem_device **)res);
 }
 
 /**
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 24def6ad09bb..0f357d0c1e75 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -70,7 +70,7 @@ struct nvmem_config {
 #if IS_ENABLED(CONFIG_NVMEM)
 
 struct nvmem_device *nvmem_register(const struct nvmem_config *cfg);
-int nvmem_unregister(struct nvmem_device *nvmem);
+void nvmem_unregister(struct nvmem_device *nvmem);
 
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *cfg);
@@ -87,10 +87,7 @@ static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline int nvmem_unregister(struct nvmem_device *nvmem)
-{
-	return -ENOSYS;
-}
+static inline void nvmem_unregister(struct nvmem_device *nvmem) {}
 
 static inline struct nvmem_device *
 devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
@@ -101,7 +98,7 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
 static inline int
 devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
 {
-	return nvmem_unregister(nvmem);
+	return -ENOSYS;
 
 }
 
-- 
2.18.0

