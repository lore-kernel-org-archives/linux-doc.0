Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4CE2B7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbeIEO1g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:27:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41998 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbeIEO1f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id v17-v6so6936592wrr.9
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OkoqiLjbJSODXJoiTP2mWCeOVuHWiRrCaV2oGASjKkw=;
        b=oO+MooOIqNoUEuBIrePFnK6OJR5c/sBLGef0RbivSEySPKXncBhcnCLBmvXcUy2Ly3
         9TJNH20HeBHKqT/x3ZXHhjebTFajBeHZfXVcz9tG4IySKG+BcadumSTEgvqJhMOUEGCj
         6ULz9kX+pKK0osh+aDk4IyoJtgDuustMTkCW4SO2sEwd4ebY6LADDahvMAQ6qHLir0KU
         6Wza8XluLjqangrGgsTfoxoOYDAQu3z7PQzXTnDYla6kgJAuwE7gpgg7Xr/q7BGWQhz5
         /XtYedxnaGQ+F232vQRJ4iFooi4ihBo3PXb9zGQ18fNnfzHKR0zpeQkLQHe2m95WhF3S
         Cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OkoqiLjbJSODXJoiTP2mWCeOVuHWiRrCaV2oGASjKkw=;
        b=Qbzt5RwNUhGE6SbkHuB5IOr9OGwB2hwjLAxTQBGREEt9fluh8kyRuW2AH2KjC6GgR3
         TVG+56JzUsElk2156kbL26I75dQEk6HqVcFYA5WZ2p2q/dklgWZMm1hFKQE2XrCJSM8G
         Y+J8VeEeongUZvRem3vzpAqG2QDoTcYBj/ry4FMbmJS00V6buQp0wD3vfRacugnnaWCk
         2lCnWscrR7SiVLSklVbr6e5tSX9C0i1rwyzV4zeNcXlpj8rRZYITWBKvBDf9mmWJg69K
         u9s/+E0GOofgMVAI+0aQxOiGc8dgWVTiw7J3Y1/0aVSbe5C9ORC2rlHLEVC/jcR1FaoN
         bWLg==
X-Gm-Message-State: APzg51DCZWEyqv0XairEIRpX30dF5JlHgSLwKAwFVbS9Ij/fPIMP7TYb
        hC6fJYroYPCyts0z8F3Sh069OQ==
X-Google-Smtp-Source: ANB0VdYIhDfKPfOzmKKnB/xKQxcFzeSlAamYSL3GZHXJtNdlwU4Qx5ti/3g9l8tFf0Sop3n05rv0kA==
X-Received: by 2002:adf:e792:: with SMTP id n18-v6mr14381020wrm.136.1536141486499;
        Wed, 05 Sep 2018 02:58:06 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:05 -0700 (PDT)
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
Subject: [PATCH 02/13] nvmem: remove the global cell list
Date:   Wed,  5 Sep 2018 11:57:27 +0200
Message-Id: <20180905095738.26406-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Make each nvmem device the owner of its nvmem cells.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index bb475c2688f9..86af62e2df47 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -38,6 +38,7 @@ struct nvmem_device {
 	int			flags;
 	struct bin_attribute	eeprom;
 	struct device		*base_dev;
+	struct list_head	cells;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
 	void *priv;
@@ -58,9 +59,6 @@ struct nvmem_cell {
 static DEFINE_MUTEX(nvmem_mutex);
 static DEFINE_IDA(nvmem_ida);
 
-static LIST_HEAD(nvmem_cells);
-static DEFINE_MUTEX(nvmem_cells_mutex);
-
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 static struct lock_class_key eeprom_lock_key;
 #endif
@@ -284,29 +282,25 @@ static struct nvmem_device *of_nvmem_find(struct device_node *nvmem_np)
 
 static void nvmem_cell_drop(struct nvmem_cell *cell)
 {
-	mutex_lock(&nvmem_cells_mutex);
+	mutex_lock(&nvmem_mutex);
 	list_del(&cell->node);
-	mutex_unlock(&nvmem_cells_mutex);
+	mutex_unlock(&nvmem_mutex);
 	kfree(cell);
 }
 
-static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
+static void nvmem_device_remove_all_cells(struct nvmem_device *nvmem)
 {
-	struct nvmem_cell *cell;
-	struct list_head *p, *n;
+	struct nvmem_cell *cell, *p;
 
-	list_for_each_safe(p, n, &nvmem_cells) {
-		cell = list_entry(p, struct nvmem_cell, node);
-		if (cell->nvmem == nvmem)
-			nvmem_cell_drop(cell);
-	}
+	list_for_each_entry_safe(cell, p, &nvmem->cells, node)
+		nvmem_cell_drop(cell);
 }
 
 static void nvmem_cell_add(struct nvmem_cell *cell)
 {
-	mutex_lock(&nvmem_cells_mutex);
-	list_add_tail(&cell->node, &nvmem_cells);
-	mutex_unlock(&nvmem_cells_mutex);
+	mutex_lock(&nvmem_mutex);
+	list_add_tail(&cell->node, &cell->nvmem->cells);
+	mutex_unlock(&nvmem_mutex);
 }
 
 /*
@@ -423,6 +417,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 			goto err_device_del;
 	}
 
+	INIT_LIST_HEAD(&nvmem->cells);
+
 	return nvmem;
 
 err_device_del:
-- 
2.18.0

