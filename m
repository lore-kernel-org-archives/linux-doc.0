Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 13E8A7E41F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbeHHRxq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:53:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33849 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbeHHRxp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id c13-v6so2425097wrt.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C1ENfkoTLjW8E17DVw+md+9F6tiK3Z1VCNCm2wV2Sh0=;
        b=jPZR1hu5zBkXG9rS/CQnTD+BZj8gpnkEM9pKhPLQz0sLHXzfppDAMqcLQFOncyiayL
         rcgsB1mru/+1XB8kdyDRoOaZWdkJ9787WgUisZ3SwQu6vxr0DWYU+8s7bZfb3tPHnOfx
         MN7FvU1aDT9UWADNBnCICEQRJeIjS9RXJ/vH0wJGuXyu3aG+C325BwmowNd64S6gSX3c
         2KBqPJN/aZ4+c8BfDyWBd9RflXfeVcQcUEpO1Xk34IIirtmqfodmt/Q8onTCMOw43QZY
         DSmzGCckG9dDMZ4Ao9YVf9JvLyk4SdAkJwe7Ey3AjTpN9PSjaLtO/jqq+QkIdAybK02N
         Vq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C1ENfkoTLjW8E17DVw+md+9F6tiK3Z1VCNCm2wV2Sh0=;
        b=f4EnuxiYoP5qvs0B/qO6zphRr8vUd3IIKeyVJYap5qz0FUWYUOXCjzP7EEp0e7gjKm
         daYc3KWy6fe4DjkLvgnOcxDtJK16xOHYBVqfuKYwC/+LPCSOz6UeS47itG6BShBsHIKg
         4iFxHZ8R9EfnuCoOW5gGkG1oHwFy7h6k/w9hoBAq+zFR2BKZYrGY1lDcSDGwzzwnKrvv
         c1peYQKmXDHU+JJ0YwzkEuS18eDtrjZr+CFkOREJTgAlohomMFy2OyHgvOQGMyOcgp+t
         eBaSQXkUdkH9dBXM7zAiuW8dZFIOQiEVy/652igaxrpkAixnv8T2jzNRXVCXwh0QGKjs
         Y2CQ==
X-Gm-Message-State: AOUpUlFdzUsbNut2AADyDSeHOrjDLIHBzJSWJy4Yoa3jDf6tVK8F0rg2
        VPMPYrIhb/FnvIZzhBTuoaFnsg==
X-Google-Smtp-Source: AA+uWPyeKUZkZ5lzpR7fQUL35EZxOiMcdK+l1BV3+kpdv59GQTqxqPRSG5Tzp1r0MeLy0jLVvWQO+A==
X-Received: by 2002:adf:f091:: with SMTP id n17-v6mr2355042wro.49.1533742413825;
        Wed, 08 Aug 2018 08:33:33 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 04/28] nvmem: provide nvmem_device_name()
Date:   Wed,  8 Aug 2018 17:31:26 +0200
Message-Id: <20180808153150.23444-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Kernel users don't have any means of checking the names of nvmem
devices. Add a routine that returns the name of the nvmem provider.

This will be useful for nvmem notifier subscribers - otherwise they
can't check what device is being added/removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 6 ++++++
 include/linux/nvmem-consumer.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 128c8e51bff2..b040370292a7 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1440,6 +1440,12 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
 
+const char *nvmem_device_name(struct nvmem_device *nvmem)
+{
+	return dev_name(&nvmem->dev);
+}
+EXPORT_SYMBOL_GPL(nvmem_device_name);
+
 static int __init nvmem_init(void)
 {
 	return bus_register(&nvmem_bus_type);
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index ae4d30347602..c4000a218f67 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -69,6 +69,8 @@ int nvmem_device_cell_write(struct nvmem_device *nvmem,
 
 int nvmem_register_notifier(struct notifier_block *nb);
 int nvmem_unregister_notifier(struct notifier_block *nb);
+
+const char *nvmem_device_name(struct nvmem_device *nvmem);
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -167,6 +169,11 @@ static inline int int nvmem_unregister_notifier(struct notifier_block *nb)
 {
 	return -ENOSYS;
 }
+
+static inline const char *nvmem_device_name(struct nvmem_device *nvmem)
+{
+	return ERR_PTR(-ENOSYS);
+}
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
