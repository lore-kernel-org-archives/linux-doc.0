Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6ED177D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbeIGOsm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 10:48:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44429 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbeIGOsm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Sep 2018 10:48:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id v16-v6so14343060wro.11
        for <linux-doc@vger.kernel.org>; Fri, 07 Sep 2018 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KfLprIfJuLGiikb3NQ4jaXuB3vUOmbbQ5NtX8GENxrY=;
        b=dO4KNvUqz2aIxCjLfjhvE77hHxkUffpT/Vay5uCjP+ZFbvi/dvLUPdKTf9UWESwTfZ
         4/jbKTykpco+qBPXvr/0uGIwk4404XTFWhM5Y//VXplxG2QGA661QC8spnd/EhEFXu8E
         m7PbrqktMofdmCw7G2N7HSRpWoI9w37HUimtR5Cvxcml6TNmhL2H9rsSG6qhcA6Om+ra
         +lnHuhqohMvYegZS4UuZMFSF9BhxFwr0o3qWgNVZ+rS9jO4CktTxULJ03Wgb8NytupTI
         Xz8V/IrDju3TRKZ11YYikItkH/JnwGMcQ494vA7zeL5GrHOVno/HSuS1mUV6/hTsPG3d
         cw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KfLprIfJuLGiikb3NQ4jaXuB3vUOmbbQ5NtX8GENxrY=;
        b=oBFskFSjlCdDKY4LOoMbLgjk9A2yu9K+kWpnDVCZMNjhazJ5/WLYmcejcZ3CKIo7xm
         jFJRAYnmxA0Ezlty+Xucv+ON2Pl7/5G+2p56FFJOO+8e/J2sQAbcI90UWIJAw5HWC0qZ
         It6gyqw0fXlXG2kvVK/Wf1L5LHWDKsmq+LHzXaGeCwcAimYchBlqo+3ROvDZ10nL/m84
         40goerjY47sfAVaIu+mbQHCRkOGe18v6Ck16/HAI3kZvn7lnaNw+h3mS1lcXA3ZDqZsC
         6NySPNfhVazqYydz2GXU5vb3CM6Ljzuj6OodLtyJUCUejXcKp0yhmrZGE71fdvTDW/VQ
         gsGg==
X-Gm-Message-State: APzg51BVYodlQrhyXQ50EO+52u3OQE1WD7AtlFStE/GK16LNDgSq0XC4
        Tp7hq07OttVOWRTPj6fey2DGLA==
X-Google-Smtp-Source: ANB0VdafhIuGK3oNDNnpMZYcVQAMSylAY/tTUn7PGNQnolzR5ctIKa4tIqeUtaLOTPHujjcOX8+qbw==
X-Received: by 2002:adf:c751:: with SMTP id b17-v6mr5739892wrh.134.1536314907593;
        Fri, 07 Sep 2018 03:08:27 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
        by smtp.gmail.com with ESMTPSA id 72-v6sm6631619wrb.48.2018.09.07.03.08.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Sep 2018 03:08:27 -0700 (PDT)
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
Subject: [PATCH v2 07/16] nvmem: change the signature of nvmem_unregister()
Date:   Fri,  7 Sep 2018 12:07:41 +0200
Message-Id: <20180907100750.14564-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180907100750.14564-1-brgl@bgdev.pl>
References: <20180907100750.14564-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function can no longer fail and there are no more users that check
it return value. Change it to return void.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 8 ++------
 include/linux/nvmem-provider.h | 9 +++------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 2335b72d4b3e..89b91f73d08a 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -450,20 +450,16 @@ static void nvmem_device_release(struct kref *kref)
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
index cc8556e3c825..d14a577a002d 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -67,7 +67,7 @@ struct nvmem_config {
 #if IS_ENABLED(CONFIG_NVMEM)
 
 struct nvmem_device *nvmem_register(const struct nvmem_config *cfg);
-int nvmem_unregister(struct nvmem_device *nvmem);
+void nvmem_unregister(struct nvmem_device *nvmem);
 
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *cfg);
@@ -81,10 +81,7 @@ static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline int nvmem_unregister(struct nvmem_device *nvmem)
-{
-	return -ENOSYS;
-}
+static inline void nvmem_unregister(struct nvmem_device *nvmem) {}
 
 static inline struct nvmem_device *
 devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
@@ -95,7 +92,7 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
 static inline int
 devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
 {
-	return nvmem_unregister(nvmem);
+	return ERR_PTR(-ENOSYS);
 
 }
 
-- 
2.18.0

