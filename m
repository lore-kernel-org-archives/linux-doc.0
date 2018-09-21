Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A59C57D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389179AbeIUNRE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:04 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36530 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389289AbeIUNRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id j192-v6so2069872wmj.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6JdxSWkz3pHnb2fNllglZS2DOqO298ZYcJuckKV8dz4=;
        b=CBDVl5qOB9JQYOEHqBjET5xhNurapJvIkATKWAAMwmg9gt9a+5eQDMqcyrKfeHO7fq
         Jfc+cjC8ORm7vSZ8DsSTsFuci+2eZCT3x+4iEy9FDLOAsNYLfLLHQzK1IJgtLxM/9mfu
         /eTZKTnEANm7C4nKN4X09xMfH8N4/V/o0OcLeqCGX05/vvo4PhW1jGBUapUqhRIY42wA
         ZQFyfX/Fsy7J6oNkfBXivtHg6BoSP2n8hHuUvD+i8nYJskpk3Ud6/JScS3DlMx8DzRci
         P+K421WjXPi76mOXc5D8iVCcfBUOqm57yKKoeBzj5si/S4/urnCxIOiS6voFh9nHjgKD
         Bnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6JdxSWkz3pHnb2fNllglZS2DOqO298ZYcJuckKV8dz4=;
        b=jw01JnD5xd9gMn/YfSxGeCqh5xTPKVxnrDI77bVdl6qGlJGeFIJ11dznLT/7G2Iknn
         3p1QHt44WC11qKtJkPJcYRgWsAjnMXKok6CHDbghsQWE6JJsU9E3GxfzocaSIPc86Jfs
         +oK9A7TB97Zl4UlFUPhVvOdkeQDW/MGRpVAjkZNFMSa7VTjJ18MFz6+5aaRraIOyB+RJ
         3v0uZkfD5jJEvGq4wuyLQBtLx0PftYaxAZ5PDW0cgIeeAOSe92mWvfUXCB56QEb8AfzL
         wqnFZ+QJZ5Un7BdP6qRTi6UyngwN2wS3w05Q/sjhMA6WHWj/fG7g6/+6D++kROC+x7i9
         Qwng==
X-Gm-Message-State: APzg51DYimD8ZUU3hQ32wj2XeyPr39RS0RkJwkDmtFnhM2hfQjI0dRjv
        Ow27KN+HjA0SQx/JBocf+q/bnw==
X-Google-Smtp-Source: ANB0VdZfKA924IcvzbN2d1seyZe/z6U1lhE9+XVw3x5/HGA4kOtqS5bSGQ4IP0wEA1pTUHoVfdD+SA==
X-Received: by 2002:a1c:2351:: with SMTP id j78-v6mr5813004wmj.68.1537514967931;
        Fri, 21 Sep 2018 00:29:27 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:27 -0700 (PDT)
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
Subject: [PATCH v5 01/22] nvmem: provide nvmem_dev_name()
Date:   Fri, 21 Sep 2018 09:29:00 +0200
Message-Id: <20180921072921.19387-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Kernel users don't have any means of checking the names of nvmem
devices. Add a routine that returns the name of the nvmem provider.

This will be useful for future nvmem notifier subscribers - otherwise
they can't check what device is being added/removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 13 +++++++++++++
 include/linux/nvmem-consumer.h |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 6f064002f439..11afa3b6d551 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1343,6 +1343,19 @@ int nvmem_device_write(struct nvmem_device *nvmem,
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
index 4e85447f7860..0389fe00b177 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -55,6 +55,8 @@ ssize_t nvmem_device_cell_read(struct nvmem_device *nvmem,
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf);
 
+const char *nvmem_dev_name(struct nvmem_device *nvmem);
+
 #else
 
 static inline struct nvmem_cell *nvmem_cell_get(struct device *dev,
@@ -143,6 +145,12 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
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

