Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8A7387DD50
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbeINT5X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:57:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37386 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbeINTzX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so10858769wrr.4
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M9taBHuR1Z2o6Tp/6FUEDxrf8r9YUt6RGonYwMvTT5A=;
        b=ZV8OEDNLDzAqKYFT/h1fmNr0LGgc6hSRMKH8jwYkb7++Fs28jhjP94E6Z/qM2Zy+xf
         ZY+PbDG+gl4pECeSwdZ4u0IqwX6ZPTCn8RveRw5f5LyNV/wIk5EzJj3GODsSGFvESZrd
         T6YmQ1F2Yerk5/mPuhTtILw9vZSUSDLt+qBJh6zKFzxKjWcF4BHgoPiSgi1PpixweveU
         QayhwBH3VH6Elvm8sQkWhsB26OCqbTwO0HquS2DBwnWre6NJn3VPbbtEm3FqJKF12I3s
         KnhRtKqIr62H8VU/H/a2jPmMywAMRuTkF5JC0g2fcLdcGOQnam6td3eVHnm3YHFmd0my
         hQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M9taBHuR1Z2o6Tp/6FUEDxrf8r9YUt6RGonYwMvTT5A=;
        b=ggPVHAPYVHlnkWjP0Ns70Mj417x/EDjjoTIY7PwEX6ZsF1PBmnHYyRcuBmzs0eHkKf
         niDwVP06KJ+PdWkuiE00Tb6T0h8qYNQjoxku3fCshAwSml3E59lgSPsz5scU8OLrLoy6
         l6SjstEXXI8gWDUuavOpKOfLb8aKXoI4iB78LiECY+1QVfi2u22fC4uNNoE/bgX1ALpF
         XRRM6hhERGOhCojw/zBy6A336npZpY7lfpBYRypTxhW6sZudF3BeVBr6t8ijqYROSb6a
         7faoZ6zbs286bO8zlMGZQFbuhnX8x0+y6YzdZYNine4t9MoBXCuENfT6ZHgL4qo0m2XI
         lSEg==
X-Gm-Message-State: APzg51Ds41DnKSQSPAfgdjaiFoaxcABuRSN4/s7KgX45Df/07tsyVdd5
        HFRFhcLWOrJlXHlr0rrObEBEsQ==
X-Google-Smtp-Source: ANB0VdYInIfM4MafDSF34HNDSpOlPYMYbsOmD+6s3esuwAMxaa9I90iHesl+qaV43/rVItBKNcBDMQ==
X-Received: by 2002:a5d:4648:: with SMTP id j8-v6mr9722923wrs.52.1536936034233;
        Fri, 14 Sep 2018 07:40:34 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:33 -0700 (PDT)
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
Subject: [PATCH v4 08/22] nvmem: sunxi_sid: use devm_nvmem_register()
Date:   Fri, 14 Sep 2018 16:39:57 +0200
Message-Id: <20180914144011.27614-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
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
index 4d0b7e72aa2e..1310f8af37f8 100644
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
-		ret = -ENOMEM;
-		goto err_unreg_nvmem;
-	}
+	if (!randomness)
+		return -ENOMEM;
 
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

