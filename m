Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8176D7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbeILMzQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:16 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:51733 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbeILMzP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:15 -0400
Received: by mail-wm0-f65.google.com with SMTP id y2-v6so1259450wma.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=Dd7gl4SiLS2CTwbYqt8gDFxF41lxBpmvFFXyYZ3P2C/mGY9+tVdlm3eqOobDQK9OJ4
         DpE4xBE3Ho0ccDT7IN4cCTwSieU/HJw6mTK7QFJ+60up39tV7S0b9tGzB+8zCgOVkEJ+
         6l1RTUokGr2sbJ3seQKkmmytvIA0CQc+SNyRkIXmodsd/u2s1qs14Xzim/BOolIHwsaY
         APrcYC5zVsgf38egRn041cZG5zBMfCjOjOhwiKMaOlM+xdHs/IztV9GmzjNzqD5z/VyK
         ywgR4ckPEO0ET3zASULpqtFLZtV3shVG0pvUyofAYWLVkqsTWBP7RsngAZxDR8rCraUf
         7GfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=gBD66jIiBhk/vK42ftiOMsSwwISjUrsF+KY1yiZSzHZkFgqUK+9Ak87r1nmvFcJNyQ
         i8HO5kgzINMdU2vuJSEvRLwrH+ZWfMQU3QOybDQ5zoaXzVH787UDMtTqr60e+l8FUHqB
         xt1aEqY9L83BYrM0bu7Ah+4K66oraNMTRHVPSTib9bJyIdKQpvPHGyKRw0iPklrj3+5D
         CIERPiVX4GyqvotTn2ri9Q/Xwnsyr4DVlqS1oHUEqPyGvrzOglG72yvmsO2mVnjtwYiz
         iyynHJDQKgq5oM26AV8/ywwFLfCnZ6UFBJX6QpVRdlIQn0B04VgXrSzwB+EIb12iObpb
         tX3w==
X-Gm-Message-State: APzg51ALbPvZYYdDj/KLmoe37z6vkvXz8utxHz3jHmBEG51bCGRWzNSE
        V+Rzz8bwQSRAW1+4O4FYB2iMtw==
X-Google-Smtp-Source: ANB0Vda8oRA8IzsbDf0mP70ZuFj+ZhEMQ0NduvjVP9Z2klDOrntiWoEoEu62nPm5/7OviM7JUI2Oww==
X-Received: by 2002:a1c:ca17:: with SMTP id a23-v6mr721806wmg.122.1536738715613;
        Wed, 12 Sep 2018 00:51:55 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.51.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:51:54 -0700 (PDT)
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
Subject: [PATCH v3 07/21] nvmem: lpc18xx_eeprom: use devm_nvmem_register()
Date:   Wed, 12 Sep 2018 09:51:15 +0200
Message-Id: <20180912075129.25185-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
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

