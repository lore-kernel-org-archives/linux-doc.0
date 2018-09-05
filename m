Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 796357D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbeIEO1j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:27:39 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35282 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbeIEO1i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:38 -0400
Received: by mail-wm0-f68.google.com with SMTP id o18-v6so7090997wmc.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=uH2+9M1vAtnwku1Qa7KM2VgdAGrG0XLyYybPUYTA4fKQnCzh8i4nEBS3myuoDA12pY
         lTCDRzkJIJvR0J9tNluzzXpp6xZtYIDeO+U1j8lacab7QYrOpiJrbvFRP7gVZf0eUOQs
         v9nxKCAel0Nfn3nWryYtHcAICshAw0QLosvjAFMfdqKGaXdQS3SomqRoAR9ncyRkq/4I
         kRjfapP/qsKxvX9izTIgyzQxZMZjTDdykvnLDW6wwTwBM/ZhM3tq41sUQYNRFgVUG7ID
         oGUKD+WEl7ilca410ajmA78D+FkDQQOHmGtBsrC3iWoRqMaKK7sxE7FVWFPDG11nWFIu
         YWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=RmQFADPN6vy9d4raSGcBV8fMSi8BduLlmSmJMVN681lrkGvy2f0WxA/FCV9d5vabo9
         2Bm2leNn2KSlM1ZLmRGal02uVzyLrcQkMLsrnwX/A3FgjlOYRtCOX5SAojtAu5YuyTmO
         3T9SOgIBBJQkxWtgWE6sm0n3mkRvwyHuyBgJAvnViThloS0NI0deGoNpCiHxg6itvtfu
         DM4BnSKZ4lsmbVD0Ga3t4Ws3oGv4RDCwU+1wsQw53Qk3N/e347VZjtXkQx4HWx9hGiIm
         Z7P5kaI3TRDbNFaKtLkCAidAeJInlcrm2B/9pl/gFz0ciPIajAiuXRV+O5OEcXcuDkQo
         4xNA==
X-Gm-Message-State: APzg51DHCELVTgoH4115/VkmiHJqvNULYzscAi60A9aR8PzPgPSoWjkL
        +ZB/ceK/HgtLvxH6j2yZ6Hc87g==
X-Google-Smtp-Source: ANB0Vdbjycgs8VTG9HTFl1NgudxNUJQopymPyAJg8rzJUbjsM6UngJ4KzkdaBwotgzJ4H2Gn40hPvg==
X-Received: by 2002:a1c:5e08:: with SMTP id s8-v6mr4925548wmb.88.1536141489278;
        Wed, 05 Sep 2018 02:58:09 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:08 -0700 (PDT)
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
Subject: [PATCH 04/13] nvmem: lpc18xx_eeprom: use devm_nvmem_register()
Date:   Wed,  5 Sep 2018 11:57:29 +0200
Message-Id: <20180905095738.26406-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed version of nvmem_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/lpc18xx_eeprom.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/nvmem/lpc18xx_eeprom.c b/drivers/nvmem/lpc18xx_eeprom.c
index a9534a6e8636..b42dbaddb419 100644
--- a/drivers/nvmem/lpc18xx_eeprom.c
+++ b/drivers/nvmem/lpc18xx_eeprom.c
@@ -236,7 +236,7 @@ static int lpc18xx_eeprom_probe(struct platform_device *pdev)
 	lpc18xx_nvmem_config.dev = dev;
 	lpc18xx_nvmem_config.priv = eeprom;
 
-	eeprom->nvmem = nvmem_register(&lpc18xx_nvmem_config);
+	eeprom->nvmem = devm_nvmem_register(dev, &lpc18xx_nvmem_config);
 	if (IS_ERR(eeprom->nvmem)) {
 		ret = PTR_ERR(eeprom->nvmem);
 		goto err_clk;
@@ -257,10 +257,6 @@ static int lpc18xx_eeprom_remove(struct platform_device *pdev)
 	struct lpc18xx_eeprom_dev *eeprom = platform_get_drvdata(pdev);
 	int ret;
 
-	ret = nvmem_unregister(eeprom->nvmem);
-	if (ret < 0)
-		return ret;
-
 	clk_disable_unprepare(eeprom->clk);
 
 	return 0;
-- 
2.18.0

