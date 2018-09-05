Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CEBF97D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbeIEO1l (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:27:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38571 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbeIEO1k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:40 -0400
Received: by mail-wr1-f66.google.com with SMTP id w11-v6so6969210wrc.5
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KZATZdgnPAoTpW/g3YD69XZQ2uG+BR5UrHmRyj2MT+4=;
        b=olnzXgTH3/Ltt1LMC3672ncThv0/yug+JO4S7trU/KYDABVP0vhUpxYXDuvwP3sNBZ
         ktplZBMkUoTbvNxwqhOv9/YX55QrlLFETdnfMNDwRXJaJgiD3AESGC1Up/3h7LUUrcSD
         wZLt9eyQvvQbFuiPMKxmgvMQNFWjpeYNBpAOc5fEyOqA4EZKMNZZtuSUA/mm8edr7udK
         GO5cpeM41Wh4Z7MA94GYwNMPA0Hyll7e+8k6KWHUb0pEwAJ+9Zps0D8FrD/CTt/9zpyN
         Kfk+NvNuJsPaDHDyFdmdN1hNoIn03XcU6/N9acno505xC/GFi4CJOmtJq0y0WxCZpbqL
         BfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KZATZdgnPAoTpW/g3YD69XZQ2uG+BR5UrHmRyj2MT+4=;
        b=HC+WtVI/mHXgQshbvxfiH7RQ1oiXmADo1Phcio8ONA5bCym3SP/UtPddat9/XedCYh
         QAi8xM0wBkQumJ0FJ4pqORLe7LPxZ1lCGS9F/sZyJmcNG7l2EGSllRWA8wbqLY7MoN3o
         M/pBSDeytUHcw7JyvrdRKaE7Q6Shq+0Fr4PhpQhK4fDfQsZkwV58otW01fDGXW+GltlT
         IPaz8di5CN632kx3MX3hMTzIq4yUG9nmrJWgjQBuXoK+eI56tYx/29/zM5UQi3d+OjH7
         qP/lJZFVMxcL51FK+5IgMBGDDaH/3P2kLQSKES2xSuXeat+IQ+xlxQ1Sj6eatuSpa6J8
         35lA==
X-Gm-Message-State: APzg51CYSKT1HGSqz1fKuhcaWQMvMLuftFYzCmVHPCm5HRVyS/We65Mu
        Z+vFeiUl36c8reVwzkiVu6vmrA==
X-Google-Smtp-Source: ANB0VdbMqkumKIpFHkyrlSMCbul69kVAIAiElW2PbvYQS6364VTCWpjIuorbqflVipqGPIfvmjBtpA==
X-Received: by 2002:adf:f687:: with SMTP id v7-v6mr26018446wrp.201.1536141491703;
        Wed, 05 Sep 2018 02:58:11 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:11 -0700 (PDT)
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
Subject: [PATCH 06/13] nvmem: provide nvmem_dev_name()
Date:   Wed,  5 Sep 2018 11:57:31 +0200
Message-Id: <20180905095738.26406-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Kernel users don't have any means of checking the names of nvmem
devices. Add a routine that returns the name of the nvmem provider.

This will be useful for nvmem notifier subscribers - otherwise they
can't check what device is being added/removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 13 +++++++++++++
 include/linux/nvmem-consumer.h |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 89b91f73d08a..364ee16e7d6a 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1144,6 +1144,19 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
 
+/**
+ * nvmem_dev_name() - Get the name of a given nvmem device.
+ *
+ * @nvmem: nvmem device.
+ *
+ * Return: name of the nvmem device.
+ */
+const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return dev_name(&nvmem->dev);
+}
+EXPORT_SYMBOL_GPL(nvmem_dev_name);
+
 static int __init nvmem_init(void)
 {
 	return bus_register(&nvmem_bus_type);
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 7e9fb5a19d91..1313da6731ff 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -43,6 +43,8 @@ int nvmem_device_read(struct nvmem_device *nvmem, unsigned int offset,
 int nvmem_device_write(struct nvmem_device *nvmem, unsigned int offset,
 		       size_t bytes, void *buf);
 
+const char *nvmem_dev_name(struct nvmem_device *nvmem);
+
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -117,6 +119,12 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
 {
 	return -ENOSYS;
 }
+
+static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_NVMEM */
 
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
-- 
2.18.0

