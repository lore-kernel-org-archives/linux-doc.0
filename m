Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C96A7E425
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389586AbeIUNTC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:19:02 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37136 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389287AbeIUNRF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:05 -0400
Received: by mail-wm1-f65.google.com with SMTP id n11-v6so2050379wmc.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Wwb26KwBGg36MP0eft6G8PNCPf95gO7oxvKFski7A98=;
        b=wxWexZB4kP7cU/JrD9UskQY2t8x3GcolcAbUbg0shuaFsZHeMyFbN7TXvWA6jTYWpx
         ba+7rgiU0hZzcSCCQ2twL8oTQBYsKAFg/Mw2XK9tVveLyL+XBvaY5puODkHm+HMgQZc/
         KAtt6f4LnZd+bIk5/ObMfo361yzlAT7c+g6iN1/od8G0dgMXyGTQi2/7ZNL4LwZo2Ibw
         h1j33gKEcUr3ZqP/jX9IThNPttUaT60cRbzT9baZU/IY33VUxi2HZgkYMKdZY+NdVdRn
         q5jKKP22m+p6SU2w0VDeV6Pjfe8lzs5DpzZM1lvnllaOqu/Aosg83kAJStLNq2WhmUOs
         SziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Wwb26KwBGg36MP0eft6G8PNCPf95gO7oxvKFski7A98=;
        b=DDp08kla16Hud67gHpoKyIauz7jOp6cEAWXKYM6YNetbMOtpyikj3j6R313S/U1aLQ
         laKF0zRNo/jygmZF4d/RvzpMcvYMDJwtGiJeJHqUuq9y6QsIeUypBwB6j4t3beOY67Hi
         mPH8BCAw76dLw2dhBRJseBaHfx9yU0BdoucFQlf7rvBgNw7EuP+J5z24zIM1RozQljl8
         fhUlLMQ2f+aojKjqfLLiSWIS5rshUkonQRM3W12LNKk12agYpCBcj9nDvomF8R4zBWVU
         9TEEhatfSy+SoJCHRQEVGhM1QKoJBJOE3Tgy+bnkUTUP5FPbX5Zgy+I8kk58VLOe6vSm
         D6kg==
X-Gm-Message-State: ABuFfogit9UhQqCgoVD78B5wVuvOZ0+i0ittXuXWc3vDLoDo07cZOpuX
        +7ZCtne9aRg2vgRwa2nVdekBIA==
X-Google-Smtp-Source: ANB0Vdb1HpPW7YHS+cmTRJbTymNZy7pbV/qtYf1Mtb/NyXjdCTv9Ty9/+J9iaLUfpWF7rilZXIzwPw==
X-Received: by 2002:a1c:114:: with SMTP id 20-v6mr5723392wmb.4.1537514969243;
        Fri, 21 Sep 2018 00:29:29 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:28 -0700 (PDT)
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
Subject: [PATCH v5 02/22] nvmem: remove the name field from struct nvmem_device
Date:   Fri, 21 Sep 2018 09:29:01 +0200
Message-Id: <20180921072921.19387-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
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
index 11afa3b6d551..72313a1d215f 100644
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

