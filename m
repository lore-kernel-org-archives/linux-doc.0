Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBCD57E416
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbeHHRxp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:53:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46466 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbeHHRxn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id h14-v6so2376517wrw.13
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0/AcFQWG5GWA8z8qElGqK0mK/sub6hcCVMsKNMHf7yU=;
        b=e77HNEXQK7pu4RBRZeCmNPrKeduXRuP9S9cTxoYQ3X+TxcPsLBof2AMUE0NxymJprz
         aSLozu5Jg/24ZnLaT7WNNLjUfTHXGAedexjwjMe1wVI4m9+SEruVZc0IY4c+44KPWLMw
         N7LsTQ/H39KweZ99N/07jtuj3+IlYRuGMjFuDMHDmu115wheS5SrCmYOFrCVbLhBIvrS
         jNM/6Mj281twAPkZvxS8Fb+Tzq815NdY+ScQKrRVooXrSmWto1y4CbrvU2t+rGzouMF9
         nScHpKlfurLk468ZkktF3JWjS8MjJGTzcJ/A5CfGeTTOVauyWnKRr1nksHOZ3swBB1bQ
         G/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0/AcFQWG5GWA8z8qElGqK0mK/sub6hcCVMsKNMHf7yU=;
        b=BY9xlUh/7dP2UQ1zQ2f8USMsHGfhll3Y+yx1MNjF9BemzbLkiggapC0VT2NWwYTcwf
         8W9bagAvpPsk0tjYXvYPz+T9jfh+44G4W1faitFIAeYjEKptsVFvpdpQAWsVZPDd7ts0
         peeMIuRow3330KNDmJ7vCxHh7uqpvxUko+ZdFIITElM1fwoNAkGuRq/QTgZOZ09hRNAJ
         qsnPtmDJkROYrgcq2aUuQuHack3b6u7fhpZYuWxqKj0vMaY3gPJ5PrHwBagstldyyEA8
         EhtgGWsg1fU6wJv1rIOtrbE3UYy+VJppY0FrPDiCARqoSvp/yElRBUShDAqLXCiZ1haV
         ZZ+w==
X-Gm-Message-State: AOUpUlHjNLAy0MqXX4hpnyCwZ82ABA4/aSnJcxhXqZffR1hygd+r/OEw
        hNskA6i3wOKOac0y+JWzlorbXg==
X-Google-Smtp-Source: AA+uWPxR5HmEXh9KfDK+gx6BHy1jALE7ffWZSAb4PHIBslPHrDIi5/8Bk3oEBQxwnC4JQKq67Hijdw==
X-Received: by 2002:adf:d842:: with SMTP id k2-v6mr2256361wrl.26.1533742411481;
        Wed, 08 Aug 2018 08:33:31 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:30 -0700 (PDT)
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
Subject: [PATCH 03/28] nvmem: add a notifier chain
Date:   Wed,  8 Aug 2018 17:31:25 +0200
Message-Id: <20180808153150.23444-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a blocking notifier chain with two events (add and remove) so that
users can get notified about the addition of nvmem devices they're
waiting for.

We'll use this instead of the at24 setup callback in the mityomapl138
board file.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 20 ++++++++++++++++++++
 include/linux/nvmem-consumer.h | 18 ++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 329ea5b8f809..128c8e51bff2 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -65,6 +65,8 @@ static DEFINE_MUTEX(nvmem_cells_mutex);
 static LIST_HEAD(nvmem_cell_lookups);
 static DEFINE_MUTEX(nvmem_lookup_mutex);
 
+static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 static struct lock_class_key eeprom_lock_key;
 #endif
@@ -479,6 +481,18 @@ static int nvmem_setup_compat(struct nvmem_device *nvmem,
 	return 0;
 }
 
+int nvmem_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&nvmem_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(nvmem_register_notifier);
+
+int nvmem_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&nvmem_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(nvmem_unregister_notifier);
+
 /**
  * nvmem_register() - Register a nvmem device for given nvmem_config.
  * Also creates an binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
@@ -559,6 +573,10 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (config->cells)
 		nvmem_add_cells(nvmem, config->cells, config->ncells);
 
+	rval = blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
+	if (rval)
+		goto err_device_del;
+
 	return nvmem;
 
 err_device_del:
@@ -586,6 +604,8 @@ int nvmem_unregister(struct nvmem_device *nvmem)
 	}
 	mutex_unlock(&nvmem_mutex);
 
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+
 	if (nvmem->flags & FLAG_COMPAT)
 		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index f4b5d3186e94..ae4d30347602 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -14,6 +14,7 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/notifier.h>
 
 struct device;
 struct device_node;
@@ -35,6 +36,11 @@ struct nvmem_cell_lookup {
 	const char		*nvmem_name;
 };
 
+enum {
+	NVMEM_ADD = 1,
+	NVMEM_REMOVE,
+};
+
 #if IS_ENABLED(CONFIG_NVMEM)
 
 /* Cell based interface */
@@ -61,6 +67,8 @@ ssize_t nvmem_device_cell_read(struct nvmem_device *nvmem,
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf);
 
+int nvmem_register_notifier(struct notifier_block *nb);
+int nvmem_unregister_notifier(struct notifier_block *nb);
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -149,6 +157,16 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
 {
 	return -ENOSYS;
 }
+
+static inline int nvmem_register_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
+static inline int int nvmem_unregister_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
