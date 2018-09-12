Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 94FF77E3E6
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbeILMz5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32967 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbeILMzd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id v90-v6so940533wrc.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qf5F4zQiRY1sa80CZGwpbNfNFuNr+OQm/6a5BbgsJ/E=;
        b=m3RXtFE3lF34IyYI/WJEStDcvX/dGKlbvFUtWyIa606CcNGS08LOhyItTD7Velw9ci
         p7R9L3OrQT21PmmSmGqEp6PmX9R3JHTFxVHrkBNvQ4gIE0+ai3/TlyOD83+i7jKYlodt
         0n6a954VKbOlAS91dA4LgSpo7UJmJkIK+K8RbkccFoqLkasn0HEmg9Fi9Ad4rFZ6Gl4v
         bMVDaEb+Z138xZJD4qyiM0h0+jnOsRU89hjICaVe9/8wOOhPZcNHIm99AfSk/OcIWfRd
         3Efp8ckcsqsapK5pdo/zety0tUOFLZ35Q6vtUNU51vNMY+f/ZpJCoaOYF/C+HfJY0Efa
         v/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qf5F4zQiRY1sa80CZGwpbNfNFuNr+OQm/6a5BbgsJ/E=;
        b=TGjX0Qm45wQ8LZhANYN79EpEuwcd9tlF3NYCPHc0TvTTaSKGoeZzIaF5EZhwA+m/+7
         rLSNrNYowqgsO/0eQjZ+/rXG2ropBUrQpkDia54rX4YFmZ2C7Vw0wCqfmD0r5GOmFYKH
         1JcNY2CD6VKFYz3ugT+rPx+pYgPmEEw9uiEGEtIPy9lyfCaXnCBVo1tFNqEl5PVbcmuU
         rukEnNFz3X7AmnAtJtca1/+aArDmSrwoEY94bwddt8d49QACnpJHar/6gcwEW1bFsL6j
         222yf46qGBVh3GSfY/JYkDusLlLiW0417h+CBOqpIIRWVj4zSZjVsQFMgYVqtIhJi+XT
         9uSQ==
X-Gm-Message-State: APzg51BvtRD6G51HsZ6Qa51FNMpsTZ6m6Hh/ahh3/VMDoPJtFHvTjVqD
        tvkCuEAdE9Kb77sirgvq1t5ENQ==
X-Google-Smtp-Source: ANB0VdZK1F/vtpw3CGekT+2tST3Z2ZYI2eZ6x/UkitKhkssbHd+ZVEq/bj4WDm03ZoCqVWJWv6P0Sw==
X-Received: by 2002:adf:bd10:: with SMTP id j16-v6mr482270wrh.267.1536738733524;
        Wed, 12 Sep 2018 00:52:13 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.52.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:52:12 -0700 (PDT)
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
Subject: [PATCH v3 18/21] nvmem: make the naming of arguments in nvmem_cell_get() consistent
Date:   Wed, 12 Sep 2018 09:51:26 +0200
Message-Id: <20180912075129.25185-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The argument representing the cell name in the nvmem_cell_get() family
of functions is not consistend between function prototypes and
definitions. Name it 'id' in all those routines. This is in line with
other frameworks and can represent both the DT cell name from the
nvmem-cell-names property as well as the con_id field from cell
lookup entries.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 27 ++++++++++++++-------------
 include/linux/nvmem-consumer.h | 12 ++++++------
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 6cdf4f2678f6..f4930f605d4f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -977,16 +977,15 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
  * @np: Device tree node that uses the nvmem cell.
- * @name: nvmem cell name from nvmem-cell-names property, or NULL
- *	  for the cell at index 0 (the lone cell with no accompanying
- *	  nvmem-cell-names property).
+ * @id: nvmem cell name from nvmem-cell-names property, or NULL
+ *      for the cell at index 0 (the lone cell with no accompanying
+ *      nvmem-cell-names property).
  *
  * Return: Will be an ERR_PTR() on error or a valid pointer
  * to a struct nvmem_cell.  The nvmem_cell will be freed by the
  * nvmem_cell_put().
  */
-struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
-					    const char *name)
+struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 {
 	struct device_node *cell_np, *nvmem_np;
 	struct nvmem_device *nvmem;
@@ -994,8 +993,8 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
 	int index = 0;
 
 	/* if cell name exists, find index to the name */
-	if (name)
-		index = of_property_match_string(np, "nvmem-cell-names", name);
+	if (id)
+		index = of_property_match_string(np, "nvmem-cell-names", id);
 
 	cell_np = of_parse_phandle(np, "nvmem-cells", index);
 	if (!cell_np)
@@ -1025,27 +1024,29 @@ EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
  * nvmem_cell_get() - Get nvmem cell of device form a given cell name
  *
  * @dev: Device that requests the nvmem cell.
- * @cell_id: nvmem cell name to get.
+ * @id: nvmem cell name to get (this corresponds with the name from the
+ *      nvmem-cell-names property for DT systems and with the con_id from
+ *      the lookup entry for non-DT systems).
  *
  * Return: Will be an ERR_PTR() on error or a valid pointer
  * to a struct nvmem_cell.  The nvmem_cell will be freed by the
  * nvmem_cell_put().
  */
-struct nvmem_cell *nvmem_cell_get(struct device *dev, const char *cell_id)
+struct nvmem_cell *nvmem_cell_get(struct device *dev, const char *id)
 {
 	struct nvmem_cell *cell;
 
 	if (dev->of_node) { /* try dt first */
-		cell = of_nvmem_cell_get(dev->of_node, cell_id);
+		cell = of_nvmem_cell_get(dev->of_node, id);
 		if (!IS_ERR(cell) || PTR_ERR(cell) == -EPROBE_DEFER)
 			return cell;
 	}
 
-	/* NULL cell_id only allowed for device tree; invalid otherwise */
-	if (!cell_id)
+	/* NULL cell id only allowed for device tree; invalid otherwise */
+	if (!id)
 		return ERR_PTR(-EINVAL);
 
-	return nvmem_cell_get_from_lookup(dev, cell_id);
+	return nvmem_cell_get_from_lookup(dev, id);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_get);
 
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index d18caae2f7ac..e17617fa034f 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -55,8 +55,8 @@ enum {
 #if IS_ENABLED(CONFIG_NVMEM)
 
 /* Cell based interface */
-struct nvmem_cell *nvmem_cell_get(struct device *dev, const char *name);
-struct nvmem_cell *devm_nvmem_cell_get(struct device *dev, const char *name);
+struct nvmem_cell *nvmem_cell_get(struct device *dev, const char *id);
+struct nvmem_cell *devm_nvmem_cell_get(struct device *dev, const char *id);
 void nvmem_cell_put(struct nvmem_cell *cell);
 void devm_nvmem_cell_put(struct device *dev, struct nvmem_cell *cell);
 void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len);
@@ -91,13 +91,13 @@ int nvmem_unregister_notifier(struct notifier_block *nb);
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
-						const char *name)
+						const char *id)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
 static inline struct nvmem_cell *devm_nvmem_cell_get(struct device *dev,
-				       const char *name)
+						     const char *id)
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -201,12 +201,12 @@ static inline int nvmem_unregister_notifier(struct notifier_block *nb)
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
 struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
-				     const char *name);
+				     const char *id);
 struct nvmem_device *of_nvmem_device_get(struct device_node *np,
 					 const char *name);
 #else
 static inline struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
-				     const char *name)
+						   const char *id)
 {
 	return ERR_PTR(-ENOSYS);
 }
-- 
2.18.0

