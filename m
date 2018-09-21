Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B367C7D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389527AbeIUNRS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35764 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389496AbeIUNRR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id j26-v6so11802769wre.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z6J0lcIe6xsRLogfR590wyd3HYBi8XsWqZR0RfEWiDM=;
        b=Akx5S0Z82xq1MbncYzTFkwHgy5iwYVtLczSIMjJbOzn8qoos+tGCX4uj52tFfjbB0f
         GbS0TX1d/VROuNnrJnmprt3qpU8JmbT7d/UyhtDP6l3YU2fQ/cPLDrG7Msekvy62yjxm
         5EfJxIq4NFZdcOU+DrEeV9PylCbJpcUE0jUi4/hPYFGmJKY2VvicKvNivUl1yORaFI5s
         Ucq38QsllX1rcSrKMWghsdVvFUOYgQJXa6QX8uSe+jxeOYi+1nGcUGo2RddhuFsNIXeX
         kGtcgKmlLRmPT1aOff1nHRk2hLph2MqbKDtOBe2+0U0zKPsH6rfT/DrLWi1b+qcvhUSZ
         I2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z6J0lcIe6xsRLogfR590wyd3HYBi8XsWqZR0RfEWiDM=;
        b=H8YKbY5Cz8V+ZnGSll/ftUfCI5kZg94S5OPJNspV8Aj6Od+EBJfLAeihXqRCxlKFm1
         SeyiM7LIctMPt1KlEgpbYuaEc22hfbcA1MxmvHWNd5s7l7NcDohtjtCA55iVOZkbKyB2
         Y0p8xrC1JAdNiKqvSuxcT/aDT9cUyqqEis9RhVCewSI22izJMzED4+qqeh98HePqioLy
         EKG9bMSbqi+3VO6P7vrm0wWm+jz/T6qeVJozJMJ1BA8qFluh1ONzXy1s2CRQynynwfVA
         ERXceEHLIn9ItfmKBuBMQRIJ27qQWs1YNpnlzcQPJQ1DPlIDqEH54RuAvdeuPPoMTDGK
         vnSQ==
X-Gm-Message-State: APzg51DZcF1u89D8Awny63lwvHqF/Gw23gGhXGljFlUGaRx0adBkCvW+
        5C2kKmCi+CV12UkdeU0pkzil6A==
X-Google-Smtp-Source: ANB0Vdaq55vrhHmz5f5pWEZkhj14bLhOZoM4CqivPiNClz4+9ymd7vlGk9z6b5ddRtOBnAHIez2TEg==
X-Received: by 2002:a5d:438d:: with SMTP id i13-v6mr37187271wrq.156.1537514981276;
        Fri, 21 Sep 2018 00:29:41 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:40 -0700 (PDT)
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
Subject: [PATCH v5 11/22] nvmem: change the signature of nvmem_unregister()
Date:   Fri, 21 Sep 2018 09:29:10 +0200
Message-Id: <20180921072921.19387-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We switched the nvmem framework to using kref instead of manually
checking the current number of users in nvmem_unregister() so this
function can no longer fail. We also converted all remaining users
that still checked the return value of nvmem_unregister() to using
devm_nvmem_register(). Make the routine return void.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 8 ++------
 include/linux/nvmem-provider.h | 9 +++------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 920b56e500cc..bd14d04782cd 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -553,20 +553,16 @@ static void nvmem_device_release(struct kref *kref)
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
- *
- * Return: Will be an negative on error or a zero on success.
  */
-int nvmem_unregister(struct nvmem_device *nvmem)
+void nvmem_unregister(struct nvmem_device *nvmem)
 {
 	kref_put(&nvmem->refcnt, nvmem_device_release);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
 static void devm_nvmem_release(struct device *dev, void *res)
 {
-	WARN_ON(nvmem_unregister(*(struct nvmem_device **)res));
+	nvmem_unregister(*(struct nvmem_device **)res);
 }
 
 /**
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 24def6ad09bb..0f357d0c1e75 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -70,7 +70,7 @@ struct nvmem_config {
 #if IS_ENABLED(CONFIG_NVMEM)
 
 struct nvmem_device *nvmem_register(const struct nvmem_config *cfg);
-int nvmem_unregister(struct nvmem_device *nvmem);
+void nvmem_unregister(struct nvmem_device *nvmem);
 
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *cfg);
@@ -87,10 +87,7 @@ static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline int nvmem_unregister(struct nvmem_device *nvmem)
-{
-	return -ENOSYS;
-}
+static inline void nvmem_unregister(struct nvmem_device *nvmem) {}
 
 static inline struct nvmem_device *
 devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
@@ -101,7 +98,7 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
 static inline int
 devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
 {
-	return nvmem_unregister(nvmem);
+	return -ENOSYS;
 
 }
 
-- 
2.18.0

