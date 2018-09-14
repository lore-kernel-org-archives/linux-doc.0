Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 82E637DD50
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbeINTzR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56305 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbeINTzP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id f21-v6so2186620wmc.5
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ckie7x+arONEAftwpr6LcpA8Mb8Zyx+Fo4gw/6J/zcY=;
        b=aGJL8NeD2q1SDLkZHMzMrDLGer2z2Lr8CMsQJi10ftvcG5/HOr3eZcI4rSqptvSCiw
         uzRwbwcQJYG5O2XEEBHex09AVL2AN2jHVHOuIHf58k6BHr1YrrPkv5N2X3KIzuOhRSZh
         ZK/LjY7NTuzFUSc8FHjoodh5kQx8PdKz/jICQVEzN+8TChULEMmBnt+x3138twCgGgJm
         LYliBoBwU348C7tPOfjClxmxP9l05pjlD/1T0Vijh2BspkqWpdkckR7n2FKgMisczPtI
         +XJHwD4Bwa4ZGqIhtXpltpP7rhALqbTTZ68ZjgQuEJ6BapQtjxQS58kGjMaV7aS5PtnX
         TxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ckie7x+arONEAftwpr6LcpA8Mb8Zyx+Fo4gw/6J/zcY=;
        b=pPMIHUHbWYWqbyvY2WE3L+zcVDcnODixDyB8K3281CH8gF/FXs4TiP5rmKNEk6sbtI
         WnYOqlyrZKQAC+dzlA26tt+NfsF8ez8E+Fx9/EuA/qjvhdsFH5sdf9AgVmd3tiTmYOjo
         eNguwLt2ohRtJJB+99yaQRCLKYverIOb+c0Z04nycuIj/0vd3PL67INmg2VCrGBgB+OB
         NlMPXu27R7b68L8wmSevPQrFEgzKtd4YCtgbKNO1HcSx8J5A/DnweN4SNHSqjRzaR65Q
         XK4kIosIJpMNG/xCQJx5rFel3lwxZbl9foZTDUNRPaaa1/7x4FBzEHGGU4UKNBY0h8Eq
         hQJA==
X-Gm-Message-State: APzg51AAkAwrWp5LE6JoVI2++/9jD+a+/+eZYdgVc9yx0I2wFJPFl7q4
        rLOn+roux60Pe+KRR/QUCt+z1Q==
X-Google-Smtp-Source: ANB0VdbHGUseOA6R8VB+dFCItVbCnE4pC/0+VeRKBWTr8GHBsjQa4VpVqD3eY5w62OUaS/KnM5jLTg==
X-Received: by 2002:a1c:1ec5:: with SMTP id e188-v6mr2623098wme.1.1536936025117;
        Fri, 14 Sep 2018 07:40:25 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:24 -0700 (PDT)
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
Subject: [PATCH v4 01/22] nvmem: provide nvmem_dev_name()
Date:   Fri, 14 Sep 2018 16:39:50 +0200
Message-Id: <20180914144011.27614-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Kernel users don't have any means of checking the names of nvmem
devices. Add a routine that returns the name of the nvmem provider.

This will be useful for future nvmem notifier subscribers - otherwise
they can't check what device is being added/removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 13 +++++++++++++
 include/linux/nvmem-consumer.h |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index aa1657831b70..d96348ae0f37 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1343,6 +1343,19 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
 
+/**
+ * nvmem_dev_name() - Get the name of a given nvmem device.
+ *
+ * @nvmem: nvmem device.
+ *
+ * Return: name of the nvmem device.
+ */
+const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return dev_name(&nvmem->dev);
+}
+EXPORT_SYMBOL_GPL(nvmem_dev_name);
+
 static int __init nvmem_init(void)
 {
 	return bus_register(&nvmem_bus_type);
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 4e85447f7860..0389fe00b177 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -55,6 +55,8 @@ ssize_t nvmem_device_cell_read(struct nvmem_device *nvmem,
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf);
 
+const char *nvmem_dev_name(struct nvmem_device *nvmem);
+
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -143,6 +145,12 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
 {
 	return -ENOSYS;
 }
+
+static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0

