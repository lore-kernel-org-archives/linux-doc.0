Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9822E7DE59
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbeINTzS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45274 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbeINTzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id 20-v6so10830772wrb.12
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=To/SQLBCgeq0lnY/26X7cnEpcdLcDIuj/UXMlG3uaxI=;
        b=tdVj5GlFefhU/37/xmsD4OR3sD01gWfqXfUwQmv5zNZwJSFt2uqRm5yb6o7rW76NCZ
         1qg/VipmX9svIqIc8Z7IqPIL8gHhaME9b7uYY0Pvh42UBIAP8Sc3qRnK5Hbg1qPyLZeL
         WAwAWvs5lRICPJh9D2VSTKMTI2zs6T472BRFt/FkEIyNR61BNlubIZsUPFdCSb0KO+sD
         tfwGqz7ZM3CX+sIRvBhzVLPEwAIjTyVTSGwMMRIGOLFbmO1KTPCuNPNphdi36RxZwwxK
         ghXiQF8gH7UEbjkP3kFFVNwoWBt0flBCjlq+bkvY+ZJ3AuOnvVrryfHmQjjjg4r+gV57
         gNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=To/SQLBCgeq0lnY/26X7cnEpcdLcDIuj/UXMlG3uaxI=;
        b=Ve3Oj/PfZlwE+mc0prAQGfhjPnD2GYGxKtqaVCJs9oIUiyTTT26V22eSTx7BhRsr2m
         x1r/+njTOcTpNBqBO1/A2MqDzsYwTsMhCDZerZsGPb/IERc/w6Md9EqV9+1mqx7Wa1Pf
         vQRAQxLtiLouLzrIF9ngRBdilCZrSmLrrWaewKEz6etjDFLygutZTqkt+LwVAJHKlo+U
         2kbeDKOh6Cl7+ojdwktcMCPjtIjWeDZNbqyuNWXJElSe/n1KeqZdMXKWKLEYHCi03FB5
         vj4w0TVyBN+vycYy735jzw5rGypT0ojH1mDuOQtihqPz6Yv4rlABXghp+mWysKl9BafX
         6I5w==
X-Gm-Message-State: APzg51CEg9EG0gc7ot8fs+9U8gmb/8rF23YDe+3SWeaAORT2ASmuS8ZT
        ywhVeNJqud9SfH9V831/g/6wKg==
X-Google-Smtp-Source: ANB0VdbD5bR5nBTiU0E1EUKOniCAUGLi2ZPGC0OFUhyuP64ZlGD5Gitk+ZwXUBvxo+rNE7I2oEW5OQ==
X-Received: by 2002:adf:c684:: with SMTP id j4-v6mr9968773wrg.243.1536936026440;
        Fri, 14 Sep 2018 07:40:26 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:25 -0700 (PDT)
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
Subject: [PATCH v4 02/22] nvmem: remove the name field from struct nvmem_device
Date:   Fri, 14 Sep 2018 16:39:51 +0200
Message-Id: <20180914144011.27614-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This field is never set and is only used in a single error message.
Remove the field and use nvmem_dev_name() instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d96348ae0f37..8987da0f7456 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -26,7 +26,6 @@
 #include <linux/slab.h>
 
 struct nvmem_device {
-	const char		*name;
 	struct module		*owner;
 	struct device		dev;
 	int			stride;
@@ -652,7 +651,7 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 	if (!try_module_get(nvmem->owner)) {
 		dev_err(&nvmem->dev,
 			"could not increase module refcount for cell %s\n",
-			nvmem->name);
+			nvmem_dev_name(nvmem));
 
 		mutex_lock(&nvmem_mutex);
 		nvmem->users--;
-- 
2.18.0

