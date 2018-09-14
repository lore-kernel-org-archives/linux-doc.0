Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E33397D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbeINT41 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:56:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38577 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbeINTzg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id w11-v6so10881427wrc.5
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xUWytVeU60Ge4e6flnnEzHifvO92bv3CXt84Mfa/t9w=;
        b=rFtkcoouPEiGykuZjqSBcnRdSc5Uj1i1Hvm/jxhYa7EiTDErrMnV0bknzVe08c/u9x
         PfdAQK3cpWPqmaAQhKUOsYx9t0CrL8KfngEwNp5WqrgsBtZtSIE5B/RjSDFXsYbqRCfS
         /CUsA/YWCw41r6o6qPctTthDJih0yrI9jh++kLn3+tcdbDo9wpbEfIVHFl2E9tHUD/op
         xDhTEFC6dNxebzXHXwBMYsZbGiV4lXGzXLFcLU9wcxu3KxE6p+b2ryDDvIOfxc8Insv9
         aPczgP6kfgN9Eo0xr1/ayCqEedDpzyI8eytgVEgXP1Z9Mu+pxa3m75AUGRxXftD/uOiF
         A2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xUWytVeU60Ge4e6flnnEzHifvO92bv3CXt84Mfa/t9w=;
        b=B2dnXHLWB8GJIzZumSfhTMLB/YgAIFbsdG2paCqwrMzZkrdCfiPuL150XxQlGW1BIx
         a3habo5lxLvwx+SYd1uvM2a71mugdU/ds2NJ2pEyTDARgyE8Y31Gn8c41Cio02uNc28Z
         7N+WrPy6xYdQqoYq4qY7mhmIRZJzwnh+K0HFTsLQiFvBQyyQiNkvXteJsPq0TKXm1s7h
         /edGi1E+olmMLR1wCtcVA8QUlJ3qUgpOiKl8y92U3MUSspmBxT6GX/xJ+IqGWmWOZpyT
         0FOtCds9E0glAajN7F6CHhklwSUQSoxk1Mwk3q4T6P7goWJ4DwUf1E5eG3/Y4YMbvrrE
         FKmw==
X-Gm-Message-State: APzg51AgeJLm+Qbl7Mo+ASd1K7XMUqBOdGZ3fokqAal6X71/knHrp2LX
        lF9Lt+i64zHN7Hs61LfTw4QjaA==
X-Google-Smtp-Source: ANB0VdahqfCi6dDykvBf1NSmUEfDvA15ATslS+f8n5FCEYmJcFfHCyZ8tVeVxH6rDZqwPib36gq45w==
X-Received: by 2002:adf:eaca:: with SMTP id o10-v6mr9244818wrn.98.1536936046386;
        Fri, 14 Sep 2018 07:40:46 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:45 -0700 (PDT)
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
Subject: [PATCH v4 17/22] nvmem: add a notifier chain
Date:   Fri, 14 Sep 2018 16:40:06 +0200
Message-Id: <20180914144011.27614-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
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
index 9cc86d131e1e..da441019b609 100644
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
@@ -669,6 +703,8 @@ static void nvmem_device_release(struct kref *kref)
 
 	nvmem = container_of(kref, struct nvmem_device, refcnt);
 
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+
 	if (nvmem->flags & FLAG_COMPAT)
 		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 
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

