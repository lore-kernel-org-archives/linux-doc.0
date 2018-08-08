Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 796B47E3E6
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbeHHRyO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:14 -0400
Received: from mail-wm0-f42.google.com ([74.125.82.42]:56317 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729655AbeHHRyM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:12 -0400
Received: by mail-wm0-f42.google.com with SMTP id f21-v6so3173508wmc.5
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r2kUHt8xOX/X/PnpUK/Av4k3yjo3y+RVMVX0DZ8RBXo=;
        b=ty1U12OIvJhucNMEEeu9RaGvSZYf2d++pZdLnz+E54lJZfZRkI2ckP5SFmcK9F6ilz
         o2plWvwtgtEuNQuoar/L1oF7v8fOHBhwL9dj00S6Pi5SgZ7bDTYDJCrwfGy17JSqzUVe
         jQP01x3EYvua4MYEa2McyyKS61z91Ziw9sXMt0EIcuC+h12NUy3Ybsa+HnoH9xAxFH90
         2cki2+r1ZfQeg+9jNBG8yRdnqhaf4GxNs+HnxvNdzJgOFDijrG71b86nEdo2+BtTyPwT
         XIIAvNq0+e74emyAxBh28Pq6TMQddvYsSdtSMzNPK/KqAyCd7cCzIo3xB/mS4lyO1YB8
         WdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r2kUHt8xOX/X/PnpUK/Av4k3yjo3y+RVMVX0DZ8RBXo=;
        b=lX4R7GPF7LjFHTbil3rufpbO9hToKN15HEL+XIuD8Pjxu34pnUYp8up6EwZ2DFJltF
         CXUyLUUOv2s+tF8RgN0+rc76sMVTGF2GDcmguPYMyAD/8Gq9wDOBbJa7HjmmuR3+sxiV
         1CsUsJVFyoOSUhVVDRjYsb30aveIlPpZHs2R9zK7eSmyz1KJHiOR2yLdf3UMxSihlm+V
         +W2KBniPq7JFhlBdZ+3KRbhxCnC5dr5w+haDi6P4OB8nGwY+o1McXB8gkKVaI2Zx3VsB
         Awv++Si0/tXZbUAvGmYHm2R4/tNFTJA4nVyakrP8sdgCMwSPuQBt8ngfJ7zgbiii/z9p
         Gpmw==
X-Gm-Message-State: AOUpUlEweTv8ZW7DPCooOewCMEtFneB4zK1/kLPQaToxDPmYjhbyME92
        K84wD7uQ437KatGHgFdbnNgK5w==
X-Google-Smtp-Source: AA+uWPxSdaaYW8LFrDsW/DIwfEwdJOZ2Xwx/7wLr35WIIXQvILnlMCijOISdhyvS8RJ/8dWFqFn8Tw==
X-Received: by 2002:a1c:5c93:: with SMTP id q141-v6mr2225441wmb.133.1533742440530;
        Wed, 08 Aug 2018 08:34:00 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 17/28] ARM: davinci: da850-evm: remove dead MTD code
Date:   Wed,  8 Aug 2018 17:31:39 +0200
Message-Id: <20180808153150.23444-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We no longer need to register the MTD notifier to read the MAC address
as it's now being done in the emac driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 28 -------------------------
 1 file changed, 28 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 521a26b5c20d..1df796b67b82 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -137,32 +137,6 @@ static struct spi_board_info da850evm_spi_info[] = {
 	},
 };
 
-#ifdef CONFIG_MTD
-static void da850_evm_m25p80_notify_add(struct mtd_info *mtd)
-{
-	char *mac_addr = davinci_soc_info.emac_pdata->mac_addr;
-	size_t retlen;
-
-	if (!strcmp(mtd->name, "MAC-Address")) {
-		mtd_read(mtd, 0, ETH_ALEN, &retlen, mac_addr);
-		if (retlen == ETH_ALEN)
-			pr_info("Read MAC addr from SPI Flash: %pM\n",
-				mac_addr);
-	}
-}
-
-static struct mtd_notifier da850evm_spi_notifier = {
-	.add	= da850_evm_m25p80_notify_add,
-};
-
-static void da850_evm_setup_mac_addr(void)
-{
-	register_mtd_user(&da850evm_spi_notifier);
-}
-#else
-static void da850_evm_setup_mac_addr(void) { }
-#endif
-
 static struct mtd_partition da850_evm_norflash_partition[] = {
 	{
 		.name           = "bootloaders + env",
@@ -1470,8 +1444,6 @@ static __init void da850_evm_init(void)
 	if (ret)
 		pr_warn("%s: SATA registration failed: %d\n", __func__, ret);
 
-	da850_evm_setup_mac_addr();
-
 	ret = da8xx_register_rproc();
 	if (ret)
 		pr_warn("%s: dsp/rproc registration failed: %d\n",
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
