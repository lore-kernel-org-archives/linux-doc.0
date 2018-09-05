Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1C177DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbeIEO1j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:27:39 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35866 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727870AbeIEO1j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:39 -0400
Received: by mail-wm0-f66.google.com with SMTP id j192-v6so7098320wmj.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WCHgNT8Fd0mUae6agHgPqqiEiOmmncrWpb0z/BNArGo=;
        b=bZXBhHChURlSf+fd3NQpsORtX+CEZ3+VV04Uab7NFP1UB4vZUGQe2AaGkDW4AWjgKW
         R17AeGV3uPdhhZmv7ChFPhBh6BT1KFgSLOUF5hl5543TYWMWpcmsAyDG3shOWQF/TOw8
         cZ4/awoWGD8wtimPvqfbm3nH6IAuiLn9TMfPpNlklxGSIh9SNmpQLr0lcTA8k9d8R9HM
         gsFsi3fNmN0nm8aolEMFrhkfH8FrRmxn7+4bDkGDcfcmQfIubqZpJwk1fYOAvvsA4xtf
         oe/FOHghsO/QVSwHzFtSzBainckL5dfO1diHSYvj+i4MfrwR660Mff58vVxGMnno3yUc
         3G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WCHgNT8Fd0mUae6agHgPqqiEiOmmncrWpb0z/BNArGo=;
        b=kGK6HqEWLgs6BXh4uAs+A29zIpM5turGs3dlOG3SX6WgyQ3cEBxQ6xNKxVb4PuzwV7
         Tn0/NQEh6PPwNsev2P4yE792V6uVHNk+EJ48jnZFle17GCDOpnHJakiT/XfV4anq/V1t
         DR6nejyayGSV6/9NLaWRXoIIbKSBEtQnmbnTrrb+yevDGButdR6JYt0bL3TzD72Fkp/n
         rLi51per040Hd1Ots+0ydhEqNM2U+0PRBZgKZHDk2NFa6psFRKM60G4JQGna3cJs2Tw6
         i1+DB7QR6TigZp0AL4ouRph0aTk6uw38ZpSE3h9EkL1+SonV87syoO/MDyWzQcuBHNNU
         nr5w==
X-Gm-Message-State: APzg51A89i9/0XBtyKr8b2+Uh2M/oE/2OeGZTaIUtw9dSgEYKyN2hl+h
        itZO/mVPdIQtKaxz45oS5HyPew==
X-Google-Smtp-Source: ANB0VdY7421KgtxpixTZvSFDktQDeu5pSQ31P0D3e3f8WIFtB77F8JuCaOnaIlo6cwyYMllg/FKkHg==
X-Received: by 2002:a1c:578a:: with SMTP id l132-v6mr5296664wmb.16.1536141490469;
        Wed, 05 Sep 2018 02:58:10 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joachim Eastwood <manabian@gmail.com>,
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
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 05/13] nvmem: change the signature of nvmem_unregister()
Date:   Wed,  5 Sep 2018 11:57:30 +0200
Message-Id: <20180905095738.26406-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function can no longer fail and there are no more users that check
it return value. Change it to return void.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 8 ++------
 include/linux/nvmem-provider.h | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 2335b72d4b3e..89b91f73d08a 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -450,20 +450,16 @@ static void nvmem_device_release(struct kref *kref)
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
index cc8556e3c825..07ab1ea73520 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -67,7 +67,7 @@ struct nvmem_config {
 #if IS_ENABLED(CONFIG_NVMEM)
 
 struct nvmem_device *nvmem_register(const struct nvmem_config *cfg);
-int nvmem_unregister(struct nvmem_device *nvmem);
+void nvmem_unregister(struct nvmem_device *nvmem);
 
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *cfg);
@@ -81,7 +81,7 @@ static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline int nvmem_unregister(struct nvmem_device *nvmem)
+static inline void nvmem_unregister(struct nvmem_device *nvmem)
 {
 	return -ENOSYS;
 }
-- 
2.18.0

