Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A1777DE71
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbeHJKeZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39071 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbeHJKeZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id h10-v6so7461252wre.6
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=04JNfrthZ6A0LWJO3UnX3P3Vfn7v6Y2LHI6sap4PGyA=;
        b=hqq3555X+Bd7yqGI0t1QoDEZs08LvoBmD/5MVNG93EeMHXjvwplzU76Hkm8zXr+Ygd
         /Z0uCU5a/NRcu38Oe0Br2ridMa/KeyRic0KP5+js2bURES6O/kqdLzr6+C9xwUG4sFNL
         r8NAzGAiPiAuqdHPZPMfZ9hYl2bVy9mpOwWHMBhPcOaV2dpMR0w8+JkFpnFArD3CG/mU
         aW2eqWWuOTeOY8HZT8NGeTiV9S12TzO44JBtDXx94txANI9ABWQGJzhb52vxtaYgzLjK
         ZpYxBp8HZ3VmHMSINHEBI/EgEptjSrh3XvyZKc9eNCKYm5H66xWoZYc6CJLyTJoXqrnL
         EvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=04JNfrthZ6A0LWJO3UnX3P3Vfn7v6Y2LHI6sap4PGyA=;
        b=gpMoeKG0dPvSux4oX3af6ZNkrBLytz4850ZPGQexwwLYPnKim2GaVqVzM786xEok4o
         e/wd/O4A9BAj5CHVwbTI/F915V6nfPxxUpI/HUE79NwV5ZpGgS5BMvFxlDI3PUiBrjAz
         mYsH2aROXvUuWfxCeW3I9vIc5R5LIb2Bx1bA5CM2lG3JyFekQdPvjXFcDX7NxYZB7XOn
         loMHL5NBdUfi5Ufhq7LdvEPthRXuwN/K6KrlWcetYhOGMKA85XvdiZNK40WFUqMnK4v3
         lQ6ZQKpm+OM2YryXtMGV/q/LeHF3gAnGb+sYEHXLjLBv+f5YCvWFClPOeS2haGI4R/+n
         F/wA==
X-Gm-Message-State: AOUpUlELADFEhdGqqXbVeGxGV1oP7w/I0XQbC/Yr1qWfMr9Zyo3onZN9
        DbFHliro4ykP0AOK4h61kW7L+g==
X-Google-Smtp-Source: AA+uWPxF5jkAahrpIjYHdzrfx94kx5P6segDsXSK9s9KQJNzxfl4nV8lbGVNt5k9/K+MlFbn7NX+dA==
X-Received: by 2002:adf:8466:: with SMTP id 93-v6mr3389641wrf.274.1533888339531;
        Fri, 10 Aug 2018 01:05:39 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:38 -0700 (PDT)
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
Subject: [PATCH v2 04/29] nvmem: provide nvmem_dev_name()
Date:   Fri, 10 Aug 2018 10:05:01 +0200
Message-Id: <20180810080526.27207-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
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
index 128c8e51bff2..31df2e6d6f72 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1440,6 +1440,12 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
 
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
index ae4d30347602..14bb86a7a78d 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -69,6 +69,8 @@ int nvmem_device_cell_write(struct nvmem_device *nvmem,
 
 int nvmem_register_notifier(struct notifier_block *nb);
 int nvmem_unregister_notifier(struct notifier_block *nb);
+
+const char *nvmem_dev_name(struct nvmem_device *nvmem);
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -167,6 +169,11 @@ static inline int int nvmem_unregister_notifier(struct notifier_block *nb)
 {
 	return -ENOSYS;
 }
+
+static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return NULL;
+}
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0

