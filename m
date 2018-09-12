Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 80C8E7DD4F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbeILMzd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46125 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbeILMza (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id a108-v6so901274wrc.13
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ONRPGmkEebVAn+Em0u14ctkjE+SPNF1nDYJohXjda1s=;
        b=qvItpAFIA/3X/EtDfp67HU5NjxuE3cAbpL8MLCh3D1XFACpaWiO1829tMp2pNzJmTi
         gynBFUzsPa6tNEMNyCxq8m/lG1vgNXTeZNlDCQvC+Ek2J300vFgaG5BQW9WDKIVUwZzY
         OmZyU8G3Q2R8MxPf+zWfqSLd/2UFdLcaYqzIoikfs930btSMvHEk4PElRhchvNYiIdpt
         4xW0ag4N2aygeqzyPOJQdD2HbgPY9YKDIpyjMhLKE4tJ7+eG3633UYXXHI11zct0t6a2
         uXIaJhlQoCuBIPS/XdEX5bmpEJ4PyBuyFIcjo4ZKJBc1eYfyloIw/CxSmGTJJ3AkwR50
         gwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ONRPGmkEebVAn+Em0u14ctkjE+SPNF1nDYJohXjda1s=;
        b=WIJ86UD7ADbQASwwF5CSCcQ9t3jknofbM79LaxYltj/HjrhGtKFPqr94lzA74iY/gu
         vrqsDMoXhdsiC9L+c36pxgPBAd8o3I3aBKWgOzgnHRf+qVuL6c42ocCjIddr7pU3Ae+x
         IU/rkf4y1Pw+1T+sDLaS024IBFOpn3KRdlNHb/NkJR69v0yONZ9MzB5szybvMnUF2Vy6
         g42Y8tHWxwhSiouvBtzuvNChrM7khI84o7AMPgt56qUiWxc6i+HMPakOudwpCDk23UNe
         +Esif4MHXA6k4Cr79AgXT0XDgDJk45IaYa40H+dg8KwKCfmpCQbUmi94SSuf3ybZubNR
         eU7g==
X-Gm-Message-State: APzg51BEPKPhpZcVUHleld/Cv9W2Ew9X4U67BqpxDg09Wyd8+oYLkcqc
        iHNY0Xc5FF1KfJW24uWPD7EWHQ==
X-Google-Smtp-Source: ANB0VdYlUVak9AjqeNrN4vunVrijFUrZrwOoN65g0hO7EDu48V0vPrOaPGErYEz13zRmx41BEBoL/A==
X-Received: by 2002:adf:e8c1:: with SMTP id k1-v6mr499767wrn.43.1536738729835;
        Wed, 12 Sep 2018 00:52:09 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.52.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:52:09 -0700 (PDT)
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
Subject: [PATCH v3 16/21] nvmem: add a notifier chain
Date:   Wed, 12 Sep 2018 09:51:24 +0200
Message-Id: <20180912075129.25185-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a blocking notifier chain with four events (add and remove for
both devices and cells) so that users can get notified about the
addition of nvmem resources they're waiting for.

We'll use this instead of the at24 setup callback in the mityomapl138
board file.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 36 ++++++++++++++++++++++++++++++++++
 include/linux/nvmem-consumer.h | 21 ++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 9cc86d131e1e..af6f7163cb67 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -65,6 +65,8 @@ static LIST_HEAD(nvmem_cell_tables);
 static DEFINE_MUTEX(nvmem_lookup_mutex);
 static LIST_HEAD(nvmem_lookup_list);
 
+static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 static struct lock_class_key eeprom_lock_key;
 #endif
@@ -300,6 +302,7 @@ static struct nvmem_device *nvmem_find(const char *name)
 
 static void nvmem_cell_drop(struct nvmem_cell *cell)
 {
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
 	mutex_lock(&nvmem_mutex);
 	list_del(&cell->node);
 	mutex_unlock(&nvmem_mutex);
@@ -319,6 +322,7 @@ static void nvmem_cell_add(struct nvmem_cell *cell)
 	mutex_lock(&nvmem_mutex);
 	list_add_tail(&cell->node, &cell->nvmem->cells);
 	mutex_unlock(&nvmem_mutex);
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
 }
 
 static int nvmem_cell_info_to_nvmem_cell(struct nvmem_device *nvmem,
@@ -434,6 +438,32 @@ static int nvmem_setup_compat(struct nvmem_device *nvmem,
 	return 0;
 }
 
+/**
+ * nvmem_register_notifier() - Register a notifier block for nvmem events.
+ *
+ * @nb: notifier block to be called on nvmem events.
+ *
+ * Return: 0 on success, negative error number on failure.
+ */
+int nvmem_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&nvmem_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(nvmem_register_notifier);
+
+/**
+ * nvmem_unregister_notifier() - Unregister a notifier block for nvmem events.
+ *
+ * @nb: notifier block to be unregistered.
+ *
+ * Return: 0 on success, negative error number on failure.
+ */
+int nvmem_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&nvmem_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(nvmem_unregister_notifier);
+
 static int nvmem_add_cells_from_table(struct nvmem_device *nvmem)
 {
 	const struct nvmem_cell_info *info;
@@ -647,6 +677,10 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (rval)
 		goto err_remove_cells;
 
+	rval = blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
+	if (rval)
+		goto err_remove_cells;
+
 	return nvmem;
 
 err_remove_cells:
@@ -675,6 +709,8 @@ static void nvmem_device_release(struct kref *kref)
 	nvmem_device_remove_all_cells(nvmem);
 	device_del(&nvmem->dev);
 	put_device(&nvmem->dev);
+
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 }
 
 /**
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 27eee3945405..0326b52e906b 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -14,6 +14,7 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/notifier.h>
 
 struct device;
 struct device_node;
@@ -47,6 +48,13 @@ struct nvmem_cell_lookup {
 	struct list_head	node;
 };
 
+enum {
+	NVMEM_ADD = 1,
+	NVMEM_REMOVE,
+	NVMEM_CELL_ADD,
+	NVMEM_CELL_REMOVE,
+};
+
 #if IS_ENABLED(CONFIG_NVMEM)
 
 /* Cell based interface */
@@ -80,6 +88,9 @@ void nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries,
 void nvmem_del_cell_lookups(struct nvmem_cell_lookup *entries,
 			    size_t nentries);
 
+int nvmem_register_notifier(struct notifier_block *nb);
+int nvmem_unregister_notifier(struct notifier_block *nb);
+
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -179,6 +190,16 @@ nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries, size_t nentries) {}
 static inline void
 nvmem_del_cell_lookups(struct nvmem_cell_lookup *entries, size_t nentries) {}
 
+static inline int nvmem_register_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
+static inline int nvmem_unregister_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0

