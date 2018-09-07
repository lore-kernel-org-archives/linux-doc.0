Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D2827D923
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbeIGOsh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 10:48:37 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:55855 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbeIGOsh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Sep 2018 10:48:37 -0400
Received: by mail-wm0-f67.google.com with SMTP id f21-v6so14161883wmc.5
        for <linux-doc@vger.kernel.org>; Fri, 07 Sep 2018 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QNr1Tad048IXHrlgjJJINGlU6RT88CBalusVA7tzIww=;
        b=q3di/OyP3e0iEgHzrcPelNzofxqAHF64UVZUOTbHtf66zcgxeHt6qPKw4TvZgpHKaX
         B9FmyOPR9YAYzWENUgVX7InfVV/gf2FIjlfT/Z/M5knDhjCNkpv5yDcQLTVJ5VwyUc4Y
         SFxyKi5Yvfisw/v0eAvMbNM5tuMinzWKON8sFYENlC6M8U+4LM8nJ6oLfllVZ1Ea0mVX
         u5X4wg6rwGpXFKOT+f76+GNeFePJKB6tKzOJ8vPOPlzFkNAO4Ncq8AskHwuhlQ4DlAPW
         DGIaIUP+TOhBdRzSe0aKCRrNggqdQPT9H73vw/LeenBiQ0SpP9ajsoCwpcoa2I0BEsX1
         Moqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QNr1Tad048IXHrlgjJJINGlU6RT88CBalusVA7tzIww=;
        b=f1GTlkJf5891EWD9NmCj6yo5WmU1dYKTtHNBYv53btLxvOJHOVZnKem6jG1+5Tt31h
         QkUnj00+TgMYPfSiiNPZJs6y9yt8LoQhgB+GFnYZSBQfsdXHHVDd87W6MPw70DhmKgir
         VUFYvHa0l5rZU10cj1+wL8xmhviCIZi21C+KIcmGw+OWr5XGMdz3ELPe5q+C0niQr5s+
         Pq34jcrbhvHMYfiJ6LFhaKhHfCYCq4FepPDdWNblAXj62RI+GHcb4qElzGSMs4RUHvYc
         0urWOWxMgvhc+MmEEkfMfb17xXLmmNCAJ/hJ6ultGPoRtE4Mm9Cv5RBTMF3TWpkumNxD
         5FNQ==
X-Gm-Message-State: APzg51CCYVXpHviG5PYTSBNhrOiRrdVjAm4QwAHE+gokVQtdlpsIa63j
        TwSCrdKlSazVPpq0HjS1KXt19WxvG2c=
X-Google-Smtp-Source: ANB0VdZkH3hMOA7kBU2bjC2b3M9Qib0lp/rGnc6F/8ncnyYlpvcm6uWC+lplZc0PmhJaxayuitEy9g==
X-Received: by 2002:a1c:9f41:: with SMTP id i62-v6mr4368466wme.87.1536314902557;
        Fri, 07 Sep 2018 03:08:22 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
        by smtp.gmail.com with ESMTPSA id 72-v6sm6631619wrb.48.2018.09.07.03.08.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Sep 2018 03:08:21 -0700 (PDT)
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
Subject: [PATCH v2 03/16] nvmem: use kref
Date:   Fri,  7 Sep 2018 12:07:37 +0200
Message-Id: <20180907100750.14564-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180907100750.14564-1-brgl@bgdev.pl>
References: <20180907100750.14564-1-brgl@bgdev.pl>
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

