Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 456977D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbeIGOtU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 10:49:20 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:39796 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbeIGOst (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Sep 2018 10:48:49 -0400
Received: by mail-wr1-f42.google.com with SMTP id s14-v6so5400031wrw.6
        for <linux-doc@vger.kernel.org>; Fri, 07 Sep 2018 03:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WJJykhItDGy0gN6YBeA8zfc/w+bKn7To1re4h0kJVQI=;
        b=MhrXBWXgs1CaGc5cB96OOnrxs03265maIPjtvlvoJEsWrwblwm6mWcu0miwjXp+5v0
         PNqj7aky/3Ff9q9Ig4V4o3aSgkCVhOtGXuwXBaQhg+xHY3xFDcgyanPyULEPWKasU35q
         dOKMzqzaTCV1xuUvxqvHqUpxAq2ZHwUWgjVFlPm0z3t7NWSEULkUL7IZLWADMjbxsZFF
         7sZh0tzX3Ml62ffZ+Uw2SsyJXJslJ15V7zrCAJn+6TFDuwCqERPgislq3hYE0mpdyEPL
         XcqHsXevWqyoHjoxT7DCkXgUKFZS75GSMvEgPERldlA+N3zXgUNhax4E9/ANUGy7kmcT
         867w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WJJykhItDGy0gN6YBeA8zfc/w+bKn7To1re4h0kJVQI=;
        b=ECTTa2COV0O5cLO+DH/hGwYaEC/zbs1xT/7yL/8bXioVTk4ZbO11DMZXk485esqLtz
         C6lbcyJM9lMqIxhTer5lpfTJCyvYcf5HhoZsanbpI081lslke8XBeZHwLUsnEAV3FDXL
         rRshwKTbYjaJaZC+U0ocpGqM+Dr05y/oHE299cr+WacBNYuMAg0/G8y1TVRjg/lCVe+w
         Zks+u/aNBHYzscGECzkFCvijU0AkOZf/KEWRm7WmZhFvoQcRkk5Mfed5e2JMPMdLe8oM
         P/KqlsCOxSI0Rhxa0Lj8p1VtrJmef+TEDd8gsMdbtODYXrpTGKcPahLP7FP19SsN9x6C
         AQ+w==
X-Gm-Message-State: APzg51ANADL09yh3Nmhk7Nk5cSbFgYtAQEbIpJk0ptfNBGNrbN4p/3B6
        1lEeCqk6AvQj2dWjGLNCz9Z44Q==
X-Google-Smtp-Source: ANB0VdZ0G7621X7Yx3EiJJQzwsm9t1y5FWeMMkEEZ6HbLLq8PvTLYkuXn1h+I06gOJZQ1+rylcQQ8Q==
X-Received: by 2002:a5d:68c9:: with SMTP id p9-v6mr5468611wrw.108.1536314914198;
        Fri, 07 Sep 2018 03:08:34 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
        by smtp.gmail.com with ESMTPSA id 72-v6sm6631619wrb.48.2018.09.07.03.08.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Sep 2018 03:08:33 -0700 (PDT)
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
Subject: [PATCH v2 12/16] nvmem: resolve cells from DT at registration time
Date:   Fri,  7 Sep 2018 12:07:46 +0200
Message-Id: <20180907100750.14564-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180907100750.14564-1-brgl@bgdev.pl>
References: <20180907100750.14564-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently we're creating a new cell structure everytime a DT users
calls nvmem_cell_get().

Change this behavior by resolving the cells during nvmem provider
registration and adding all cells to the provider's list. Make
of_nvmem_cell_get() just parse the phandle and look the cell up
in the relevant provider's list.

Don't drop the cell in nvmem_cell_put().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 122 ++++++++++++++++++++++++++-----------------
 1 file changed, 74 insertions(+), 48 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 854baa0559a1..da7a9d5beb33 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -405,6 +405,73 @@ static int nvmem_add_cells_from_list(struct nvmem_device *nvmem)
 	return rval;
 }
 
+static struct nvmem_cell *
+nvmem_find_cell_by_index(struct nvmem_device *nvmem, int index)
+{
+	struct nvmem_cell *cell = NULL;
+	int i = 0;
+
+	mutex_lock(&nvmem_mutex);
+	list_for_each_entry(cell, &nvmem->cells, node) {
+		if (index == i++)
+			break;
+	}
+	mutex_unlock(&nvmem_mutex);
+
+	return cell;
+}
+
+static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
+{
+	struct device_node *parent, *child;
+	struct device *dev = &nvmem->dev;
+	struct nvmem_cell *cell;
+	const __be32 *addr;
+	int len;
+
+	parent = dev->of_node;
+
+	for_each_child_of_node(parent, child) {
+		addr = of_get_property(child, "reg", &len);
+		if (!addr || (len < 2 * sizeof(u32))) {
+			dev_err(dev, "nvmem: invalid reg on %pOF\n", child);
+			return -EINVAL;
+		}
+
+		cell = kzalloc(sizeof(*cell), GFP_KERNEL);
+		if (!cell)
+			return -ENOMEM;
+
+		cell->nvmem = nvmem;
+		cell->offset = be32_to_cpup(addr++);
+		cell->bytes = be32_to_cpup(addr);
+		cell->name = child->name;
+
+		addr = of_get_property(child, "bits", &len);
+		if (addr && len == (2 * sizeof(u32))) {
+			cell->bit_offset = be32_to_cpup(addr++);
+			cell->nbits = be32_to_cpup(addr);
+		}
+
+		if (cell->nbits)
+			cell->bytes = DIV_ROUND_UP(
+					cell->nbits + cell->bit_offset,
+					BITS_PER_BYTE);
+
+		if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
+			dev_err(dev, "cell %s unaligned to nvmem stride %d\n",
+				cell->name, nvmem->stride);
+			/* Cells already added will be freed later. */
+			kfree(cell);
+			return -EINVAL;
+		}
+
+		nvmem_cell_add(cell);
+	}
+
+	return 0;
+}
+
 /**
  * nvmem_register_notifier() - Register a notifier block for nvmem events.
  *
@@ -514,6 +581,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	rval = nvmem_add_cells_from_list(nvmem);
 	if (rval)
 		goto err_teardown_compat;
+	rval = nvmem_add_cells_from_of(nvmem);
+	if (rval)
+		goto err_remove_cells;
 
 	rval = blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 	if (rval)
@@ -811,10 +881,8 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
 					    const char *name)
 {
 	struct device_node *cell_np, *nvmem_np;
-	struct nvmem_cell *cell;
 	struct nvmem_device *nvmem;
-	const __be32 *addr;
-	int rval, len;
+	struct nvmem_cell *cell;
 	int index = 0;
 
 	/* if cell name exists, find index to the name */
@@ -834,54 +902,13 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
 	if (IS_ERR(nvmem))
 		return ERR_CAST(nvmem);
 
-	addr = of_get_property(cell_np, "reg", &len);
-	if (!addr || (len < 2 * sizeof(u32))) {
-		dev_err(&nvmem->dev, "nvmem: invalid reg on %pOF\n",
-			cell_np);
-		rval  = -EINVAL;
-		goto err_mem;
-	}
-
-	cell = kzalloc(sizeof(*cell), GFP_KERNEL);
+	cell = nvmem_find_cell_by_index(nvmem, index);
 	if (!cell) {
-		rval = -ENOMEM;
-		goto err_mem;
-	}
-
-	cell->nvmem = nvmem;
-	cell->offset = be32_to_cpup(addr++);
-	cell->bytes = be32_to_cpup(addr);
-	cell->name = cell_np->name;
-
-	addr = of_get_property(cell_np, "bits", &len);
-	if (addr && len == (2 * sizeof(u32))) {
-		cell->bit_offset = be32_to_cpup(addr++);
-		cell->nbits = be32_to_cpup(addr);
-	}
-
-	if (cell->nbits)
-		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
-					   BITS_PER_BYTE);
-
-	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
-			dev_err(&nvmem->dev,
-				"cell %s unaligned to nvmem stride %d\n",
-				cell->name, nvmem->stride);
-		rval  = -EINVAL;
-		goto err_sanity;
+		__nvmem_device_put(nvmem);
+		return ERR_PTR(-ENOENT);
 	}
 
-	nvmem_cell_add(cell);
-
 	return cell;
-
-err_sanity:
-	kfree(cell);
-
-err_mem:
-	__nvmem_device_put(nvmem);
-
-	return ERR_PTR(rval);
 }
 EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
 #endif
@@ -978,7 +1005,6 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 	struct nvmem_device *nvmem = cell->nvmem;
 
 	__nvmem_device_put(nvmem);
-	nvmem_cell_drop(cell);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
 
-- 
2.18.0

