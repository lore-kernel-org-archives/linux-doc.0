Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D532A7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389561AbeIUNSL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:18:11 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43656 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389559AbeIUNRV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:21 -0400
Received: by mail-wr1-f53.google.com with SMTP id k5-v6so11777128wre.10
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Be+bUwosJuE1ERPG9AJV32lzBv2PqNG4G/ac7NezZwE=;
        b=V/JOSc6f3QprrAiVwkVbGvMRnOUE+aTmfHSaKRUNuaXTo6/Ah3sCbAIK21+cAiC+zb
         Mr6ISnUKQoWR6US4BP+pEzOWymXXV4/OPHv6CQJZJ8MgDzPCLTNN9aY8vFsRWypajL/q
         805M1Z2qy6jK3qx+pTU/zMpZNJOPCDoPZhosgy/E9FLN0M4HSWbFF8WHrPCB9S1u5UcD
         qGAcnjtWGEpRXjbY6e4yrzaXdMRkUCq67QoASjzUbcNjwuYe4Pt50qKXthavLa28/Z5k
         strLfKHyG2iMBfB6wN3w1WBmeQDZFOgiV5yvvPtj0gnmRm/FZlikcv4nvwIfKkAwaMSH
         y0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Be+bUwosJuE1ERPG9AJV32lzBv2PqNG4G/ac7NezZwE=;
        b=UCuwvWR4yXKl3j1vBpyA0N33djlUvt5XxPtIsc4o+A1pYSo1OD4Yv/58QdjzkKjixz
         eMqIq7ljh8sU23FLr2NYAJivT6Qi+kB+RSOkQWWpTVgep7Odz6vfbNFZt6bCWu1KZdN7
         NEZAN7Xbr7rJIab0JFewlX+2qSree5Ri28IhxnjwPkVlEUCunCwzrgMizIjhGbDjsXfV
         fkPK8GaQjwuWV96vPf3ip2MYNbdSO9kgey5rjcFALdklC3HURAkvhsqJ+wHkgCk36bYT
         /WQ0a7j8BQG9X48KLGnZMFjNr03W7Qd5XlFdbt3wJaztohgn7WUhjgB6yVm9faBxLlJN
         3MZQ==
X-Gm-Message-State: APzg51CRGdO3Ts/kBs9vZRAqICeWtxpCIbUInvW0UH51brFG9KsNBkGA
        +Ux1n7bgFEtQYoOYsqAQS0Vabw==
X-Google-Smtp-Source: ANB0VdZlbtXNBEXP3plkysRoacCfIZHCWlGTB0FXAgTCywQptvzi6fUmkpMf0ZyQONIhx6nN69tbEQ==
X-Received: by 2002:a5d:4e4c:: with SMTP id r12-v6mr36201403wrt.27.1537514985447;
        Fri, 21 Sep 2018 00:29:45 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:44 -0700 (PDT)
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
Subject: [PATCH v5 14/22] nvmem: resolve cells from DT at registration time
Date:   Fri, 21 Sep 2018 09:29:13 +0200
Message-Id: <20180921072921.19387-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently we're creating a new cell structure everytime a DT user
calls nvmem_cell_get().

Change this behavior by resolving the cells during nvmem provider
registration and adding all cells to the provider's list. Make
of_nvmem_cell_get() just parse the phandle and look the cell up
in the relevant provider's list.

Don't drop the cell in nvmem_cell_put().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 123 ++++++++++++++++++++++++++-----------------
 1 file changed, 75 insertions(+), 48 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 8e0108806e65..74b6b97680d5 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -456,6 +456,73 @@ static int nvmem_add_cells_from_table(struct nvmem_device *nvmem)
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
  * nvmem_register() - Register a nvmem device for given nvmem_config.
  * Also creates an binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
@@ -546,6 +613,10 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (rval)
 		goto err_remove_cells;
 
+	rval = nvmem_add_cells_from_of(nvmem);
+	if (rval)
+		goto err_remove_cells;
+
 	return nvmem;
 
 err_remove_cells:
@@ -848,10 +919,8 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
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
@@ -871,54 +940,13 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
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
@@ -1024,7 +1052,6 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 	struct nvmem_device *nvmem = cell->nvmem;
 
 	__nvmem_device_put(nvmem);
-	nvmem_cell_drop(cell);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
 
-- 
2.18.0

