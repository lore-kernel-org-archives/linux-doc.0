Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE2FE7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbeILMzO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37964 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbeILMzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:14 -0400
Received: by mail-wr1-f68.google.com with SMTP id w11-v6so920107wrc.5
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ItU0oQ7oWgVAhdtVOsH1jZ2YSN2mvMhQOChLXBHLTVc=;
        b=QKerVmLgEa9MhPpA5DrugeHfPPXHbPbl3lysNUipRnwfLAvdZCXFaKOpP1fHWrSbxA
         1t0WY5c7PxqYiiBvmyAjjm4V7zZDLaAWEkCOobFzZJAzRsruKhWFO3cKVt70PhYlP2kc
         JYFjWfdjuDTHqjwoodzmsrr1DmxF+5hk3OY3GGi7ZVsHY2aJvYHU54Slsm7VZBsL95F6
         xvcIl0fXUDy2CPRz7ZXn+QHKs4VZxF44r8nliNieuLpmeQH0q9zvD7S22UqSkie8Y3Of
         QHUNsWKAbbr6cxRSLYIVHQrCWk8tf46Gq3AE5XOA3bVYPSYY6qN3nVQWZCBn576/WW2f
         4PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ItU0oQ7oWgVAhdtVOsH1jZ2YSN2mvMhQOChLXBHLTVc=;
        b=EqKyV/cN82KXcQcgudQi94o+4f0HDhkmuVdlWnA6dwRaZrQuYYcjBXxdx6reXHIC40
         PrFJAIdWN97HrUTBP3rRpinlUldCSTWd6C0NWspj5la0nXpUp6oEJfs1Dx4+Fv5nwCCA
         hP+BZ5dEUapo17qPVEkVKomcCPTQ2m2DTSgW8yl5Hm9T4FPU5ud5Pds0MwtuR+3E7YLB
         ct78dn746Vmi/TlzrF7hZ1hpXLNQraTein8iosppcLqaJb30tIeYLGe7Vl3d8IGgFR1G
         TX6fpl8OgUdDoxDCf4IiFzxZaLxFpuOkWzP/W11JDhk0VJkBYGY4ITvj08zUxyfX5SYs
         SrDQ==
X-Gm-Message-State: APzg51CdMMWa8v4U3b7Wv1Box8cuqdFtY40uMoKjmHuPXLkhL3/gynXd
        YYTyKWfqyhIwfnMhZ1gq7tAUJA==
X-Google-Smtp-Source: ANB0VdY3f4r+JIaMf98kujtiUQkmCan31/qtBuY/3w1ab+18PE5Y+YRrYfsMDJ+uoGbT+WJMhij57Q==
X-Received: by 2002:adf:a644:: with SMTP id k62-v6mr521369wrc.78.1536738714185;
        Wed, 12 Sep 2018 00:51:54 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.51.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:51:53 -0700 (PDT)
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
Subject: [PATCH v3 06/21] nvmem: use kref
Date:   Wed, 12 Sep 2018 09:51:14 +0200
Message-Id: <20180912075129.25185-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use kref for reference counting. Use an approach similar to the one
seen in the common clock subsystem: don't actually destroy the nvmem
device until the last user puts it. This way we can get rid of the
users check from nvmem_unregister().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ffed8fa16936..552ffedce38e 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -19,6 +19,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/init.h>
+#include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
@@ -31,7 +32,7 @@ struct nvmem_device {
 	int			stride;
 	int			word_size;
 	int			id;
-	int			users;
+	struct kref		refcnt;
 	size_t			size;
 	bool			read_only;
 	int			flags;
@@ -463,6 +464,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		return ERR_PTR(rval);
 	}
 
+	kref_init(&nvmem->refcnt);
+
 	nvmem->id = rval;
 	nvmem->owner = config->owner;
 	if (!nvmem->owner && config->dev->driver)
@@ -532,6 +535,20 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 }
 EXPORT_SYMBOL_GPL(nvmem_register);
 
+static void nvmem_device_release(struct kref *kref)
+{
+	struct nvmem_device *nvmem;
+
+	nvmem = container_of(kref, struct nvmem_device, refcnt);
+
+	if (nvmem->flags & FLAG_COMPAT)
+		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
+
+	nvmem_device_remove_all_cells(nvmem);
+	device_del(&nvmem->dev);
+	put_device(&nvmem->dev);
+}
+
 /**
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
@@ -541,19 +558,7 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 int nvmem_unregister(struct nvmem_device *nvmem)
 {
-	mutex_lock(&nvmem_mutex);
-	if (nvmem->users) {
-		mutex_unlock(&nvmem_mutex);
-		return -EBUSY;
-	}
-	mutex_unlock(&nvmem_mutex);
-
-	if (nvmem->flags & FLAG_COMPAT)
-		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
-
-	nvmem_device_remove_all_cells(nvmem);
-	device_del(&nvmem->dev);
-	put_device(&nvmem->dev);
+	kref_put(&nvmem->refcnt, nvmem_device_release);
 
 	return 0;
 }
@@ -647,7 +652,6 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 		}
 	}
 
-	nvmem->users++;
 	mutex_unlock(&nvmem_mutex);
 
 	if (!try_module_get(nvmem->owner)) {
@@ -655,22 +659,18 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 			"could not increase module refcount for cell %s\n",
 			nvmem_dev_name(nvmem));
 
-		mutex_lock(&nvmem_mutex);
-		nvmem->users--;
-		mutex_unlock(&nvmem_mutex);
-
 		return ERR_PTR(-EINVAL);
 	}
 
+	kref_get(&nvmem->refcnt);
+
 	return nvmem;
 }
 
 static void __nvmem_device_put(struct nvmem_device *nvmem)
 {
 	module_put(nvmem->owner);
-	mutex_lock(&nvmem_mutex);
-	nvmem->users--;
-	mutex_unlock(&nvmem_mutex);
+	kref_put(&nvmem->refcnt, nvmem_device_release);
 }
 
 static struct nvmem_device *nvmem_find(const char *name)
-- 
2.18.0

