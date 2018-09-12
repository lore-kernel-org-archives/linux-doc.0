Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 113D87D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbeILMzR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:17 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:39209 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbeILMzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:16 -0400
Received: by mail-wm0-f68.google.com with SMTP id q8-v6so1234758wmq.4
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=874CbkmyKCyBfTs9WgjHeXXK4p9vYZrCF79UGreNijg=;
        b=0fcmkAdGGjX6PqCjtegwJhJeQhl48mWkz1eQv+8PZwAHo/5hd+j3atP4b/u0VjmmlA
         MTal8Ku460qYWGwIeAL659rffFpPc7eez67ISXar9sEWrQzGRQ+54ICt+evGI/fpuxoj
         2sHyzLW7feYy70LMaFSyjx3ca3A342/hAhIY4I8/ADzPFgPWouwsIon49aYIIAosIqTm
         F1IbwFbcxmxIs+kphF3MDOu+2hk6YTTd1r5DaE/imjpQLs+XlZHrpHp5qJ8F4s0xRPLt
         S4/PfwV7O1O0wwfNLqJ118AWdg9Ntyp6UIeZXn1w9+48I+FjfZ7lmpaxn52ylqhWjDKH
         c7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=874CbkmyKCyBfTs9WgjHeXXK4p9vYZrCF79UGreNijg=;
        b=bUnQgcm8Z4ioOjsaVjkXePOtpXW5r9W6BTilI/ifF1FsuhwYxCONFc7vJ3oFOLypTn
         Y47TNWnWqBCirFs7yypmzHP7fMEd1ej6yKJ63e0Iwgeg+y26rufz7fLoAaucmzMy+rVg
         gpAUMbyg07as+ajuq0ow4iVDFSm+G3SKwClSIPOu8zd5cQ39O1jJM27U3b3ByMinSGvY
         4CA9TQQMGQQab0bQMPFTBch1iDtGDpG2itGeu7Rsuy7Zw6DnPX1Jgc5NKx/C2upLGdTB
         L0QpaF0FRYks/Z0+a5HdQ0+ofwf4btesGWWj+2cU5g8NIrca55KylJFaDni7Xc57ioIK
         jGAA==
X-Gm-Message-State: APzg51DIqcjX6l2+9w00IQ5R1Sjw3X0BGTn/M1XYS51dOPxhmYyY0QbV
        CZ0iuhuvRrA0l+xNrGBlmkzJpMGseio=
X-Google-Smtp-Source: ANB0VdbYu2ZmSnEPzAYWqzN/NKyhQxTv34ot517c7yXNzw9NIn7TMv4uhlcVQQW2vZSLwxUgs7tkKg==
X-Received: by 2002:a1c:9c56:: with SMTP id f83-v6mr662825wme.135.1536738716982;
        Wed, 12 Sep 2018 00:51:56 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.51.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:51:56 -0700 (PDT)
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
Subject: [PATCH v3 08/21] nvmem: sunxi_sid: use devm_nvmem_register()
Date:   Wed, 12 Sep 2018 09:51:16 +0200
Message-Id: <20180912075129.25185-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the resource managed variant of nvmem_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/sunxi_sid.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index d020f89248fd..0296c23db322 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -181,15 +181,13 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	else
 		econfig.reg_read = sunxi_sid_read;
 	econfig.priv = sid;
-	nvmem = nvmem_register(&econfig);
+	nvmem = devm_nvmem_register(dev, &econfig);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
 	randomness = kzalloc(size, GFP_KERNEL);
-	if (!randomness) {
-		ret = -EINVAL;
-		goto err_unreg_nvmem;
-	}
+	if (!randomness)
+		return PTR_ERR(-EINVAL);
 
 	for (i = 0; i < size; i++)
 		econfig.reg_read(sid, i, &randomness[i], 1);
@@ -200,17 +198,6 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nvmem);
 
 	return 0;
-
-err_unreg_nvmem:
-	nvmem_unregister(nvmem);
-	return ret;
-}
-
-static int sunxi_sid_remove(struct platform_device *pdev)
-{
-	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
-
-	return nvmem_unregister(nvmem);
 }
 
 static const struct sunxi_sid_cfg sun4i_a10_cfg = {
@@ -243,7 +230,6 @@ MODULE_DEVICE_TABLE(of, sunxi_sid_of_match);
 
 static struct platform_driver sunxi_sid_driver = {
 	.probe = sunxi_sid_probe,
-	.remove = sunxi_sid_remove,
 	.driver = {
 		.name = "eeprom-sunxi-sid",
 		.of_match_table = sunxi_sid_of_match,
-- 
2.18.0

