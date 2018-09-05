Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 92CF97D581
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbeIEO2u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:28:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44057 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbeIEO1h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id v16-v6so6925684wro.11
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QNr1Tad048IXHrlgjJJINGlU6RT88CBalusVA7tzIww=;
        b=aAb9ZMjPXwNsXi4wamX4XdPDOIusj3ue91kpAs/Yvl7vMFMc/DpREsi9h+SJMrsd3V
         YfmvOo3WTIjwBFYBFCcfJ6U+8NgWBm2cvk3e+YsUlwzmqUk9JgpjhUpXOo2oXh5ouWZj
         TDyjJg0+TDLknPFxGWSMQwYc5wASRqXn3CetBI7W3pFwjqMeMc5D6pSXlcvpNj0+yJjY
         2b8dGZP4c7XON/87F1DrpPtUCrCVR0p0uXbCgoPd7Lcutj3Q5dFJ+zq4QKsEAOhlXOyW
         WBVsYi6YHpMvxWFeoogoqjQwi7vJAxrHZyWpbEur/l7PqXc4HySpetwdA6VPUyDG/Va3
         dhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QNr1Tad048IXHrlgjJJINGlU6RT88CBalusVA7tzIww=;
        b=VJjpSfjrB3UKSidMKlwzhFBnvDsk2xPLwMMt7MCxsZEmH4Kqj2JZUkddQlmfBx7f/J
         Ah9OmYBhtvaiTorwnM3TrF0y4FAmEPlls7tbzrGZT8x2NRlEmJBFaBDJYAN9d5kJBkDU
         t/4cWRWziBGpypGieE6lThX0OIts+K9CGPi7WC0AGrQcevbiep5X0BoMGgXIbpoDomoU
         UewBLr0XEafmyoLwYB0qX/DAIc35vFTlUuSWCl/k118AtoFZjX0Z20JQ+172KMfEowJI
         tF80PdACqpCJlFD5w6RXM8wobRxSEBgtKq4q3lX90ir4cgnLdJH25sTkTszGLivhRdMO
         2CHQ==
X-Gm-Message-State: APzg51BDWWQoiFYoDb8S04fcCtR1SBSJh1pF6xHKqTPjPcTYCXVcyE/O
        S8ZKSkKnKV462o9HHGY/sA3S8Q==
X-Google-Smtp-Source: ANB0VdYj8KZSD2JMbnZgyg4vsJTpQ8e3knSB6hKrbQztH4l3cGOfNBjPxf2gEoEq/200g5aUOnmY2A==
X-Received: by 2002:a5d:404a:: with SMTP id w10-v6mr25212549wrp.147.1536141487773;
        Wed, 05 Sep 2018 02:58:07 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:07 -0700 (PDT)
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
Subject: [PATCH 03/13] nvmem: use kref
Date:   Wed,  5 Sep 2018 11:57:28 +0200
Message-Id: <20180905095738.26406-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use kref for reference counting. Use an approach similar to the one
seen in the common clock subsystem: don't actually destroy the nvmem
device until the last user puts it. This way we can get rid of the
users check from nvmem_unregister().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 45 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 86af62e2df47..2335b72d4b3e 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -32,7 +32,7 @@ struct nvmem_device {
 	int			stride;
 	int			word_size;
 	int			id;
-	int			users;
+	struct kref		refcnt;
 	size_t			size;
 	bool			read_only;
 	int			flags;
@@ -368,6 +368,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		return ERR_PTR(rval);
 	}
 
+	kref_init(&nvmem->refcnt);
+
 	nvmem->id = rval;
 	nvmem->owner = config->owner;
 	if (!nvmem->owner && config->dev->driver)
@@ -430,6 +432,20 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 }
 EXPORT_SYMBOL_GPL(nvmem_register);
 
+static void nvmem_device_release(struct kref *kref)
+{
+	struct nvmem_device *nvmem;
+
+	nvmem = container_of(kref, struct nvmem_device, refcnt);
+
+	if (nvmem->flags & FLAG_COMPAT)
+		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
+
+	nvmem_device_remove_all_cells(nvmem);
+	device_del(&nvmem->dev);
+	put_device(&nvmem->dev);
+}
+
 /**
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
@@ -439,19 +455,7 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 int nvmem_unregister(struct nvmem_device *nvmem)
 {
-	mutex_lock(&nvmem_mutex);
-	if (nvmem->users) {
-		mutex_unlock(&nvmem_mutex);
-		return -EBUSY;
-	}
-	mutex_unlock(&nvmem_mutex);
-
-	if (nvmem->flags & FLAG_COMPAT)
-		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
-
-	nvmem_device_remove_all_cells(nvmem);
-	device_del(&nvmem->dev);
-	put_device(&nvmem->dev);
+	kref_put(&nvmem->refcnt, nvmem_device_release);
 
 	return 0;
 }
@@ -517,7 +521,6 @@ int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL(devm_nvmem_unregister);
 
-
 static struct nvmem_device *__nvmem_device_get(struct device_node *np)
 {
 	struct nvmem_device *nvmem = NULL;
@@ -533,30 +536,24 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	nvmem->users++;
 	mutex_unlock(&nvmem_mutex);
 
 	if (!try_module_get(nvmem->owner)) {
 		dev_err(&nvmem->dev,
 			"could not increase module refcount for cell %s\n",
 			nvmem->name);
-
-		mutex_lock(&nvmem_mutex);
-		nvmem->users--;
-		mutex_unlock(&nvmem_mutex);
-
 		return ERR_PTR(-EINVAL);
 	}
 
+	kref_get(&nvmem->refcnt);
+
 	return nvmem;
 }
 
 static void __nvmem_device_put(struct nvmem_device *nvmem)
 {
 	module_put(nvmem->owner);
-	mutex_lock(&nvmem_mutex);
-	nvmem->users--;
-	mutex_unlock(&nvmem_mutex);
+	kref_put(&nvmem->refcnt, nvmem_device_release);
 }
 
 static struct nvmem_device *nvmem_find(const char *name)
-- 
2.18.0

