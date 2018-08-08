Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DEA7A7E3E6
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbeHHRyC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:02 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37699 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728845AbeHHRyC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:02 -0400
Received: by mail-wm0-f67.google.com with SMTP id n11-v6so3209123wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sGOzUdYoefHsqeEVpETOZKTrsiIrdDWkhYzQ4MVNoLM=;
        b=cggQzO/93LG4Ij5L8Kjw5OtZD4R+Xn3/ud7uGfm7stR4t8PLMuetQby1uNWl5BKucN
         QMOLDiJ4WpC+U2Oc3FdrskC6mzJf1HtRqbVHEj5/5PVTWEXYXj3Yvk7NNnePH2DEtMuE
         +2wpkQL3LNoeXXs4tJD7yhDN2tow7d8UMWQpexy4kW4It+dSr7gKyHDkdNOcRhGoLw4W
         IDdkLta2tMmDtN3uV+mB8/W7LTT8kaQxqvPlD7p3WIQQFOTAs3pbF+mbSOmF/wXmexrL
         ZdTgaH9cgz182EEdjbpP+Pg95mtV1DZ6B0SXyt1fTm9cTCgR6o4Ezihybw0cR9NSkEf/
         143w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sGOzUdYoefHsqeEVpETOZKTrsiIrdDWkhYzQ4MVNoLM=;
        b=Y/FPxnm49uhp+7aAHrqgzI/NhBgaYwKCuhwfcc4UB3yTpSg5GJ+eTeuNJ/TfibrB5l
         Gsav5FHsOGI7/HnyyVA2cNI8kjGMLjWMVrk37eR5AVQVrmnFzp0h7pcZBpsUjGTd1Ric
         opSSaO8hUCgbfok7zRotiK8t6IDQOin2hrbEdT0IQoyB3hlKMd1v4l4f5HV9bGvrPUBf
         KXnKyufZP1a1saD7Kkh0/tjQ1QdqNiLzQfYknGEDJliT09U9oT7g+/NS7l9ylI4u6y+/
         gG9aNkWtzGkfaP5RNoPLymHfbxVpEZKggcVlvbikpgzvVGq/Blhyi6Iw/3vlL7xnFg92
         /g3w==
X-Gm-Message-State: AOUpUlHDFcSY/bwzGQDevkLZ1znLy2FVrAhGD7LPa22XwemkX0K0c0f5
        Ln39WpuqAQSCrBPe9K7TluY0vw==
X-Google-Smtp-Source: AA+uWPyc0yqSUqvSbIZ9GQ0fQtkypRMmK/5NeEG1AMKT0dqCxEcMcDEiygbjIbPm14RgK076rWQoNg==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26-v6mr2298030wmh.61.1533742430519;
        Wed, 08 Aug 2018 08:33:50 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:49 -0700 (PDT)
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
Subject: [PATCH 12/28] ARM: davinci: da850-evm: use nvmem lookup for mac address
Date:   Wed,  8 Aug 2018 17:31:34 +0200
Message-Id: <20180808153150.23444-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now support nvmem lookups for machine code. Add a lookup for
mac-address.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 6d5beb11bd96..5a634a04ec69 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -29,6 +29,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
+#include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/gpio-davinci.h>
 #include <linux/platform_data/mtd-davinci.h>
@@ -99,6 +100,19 @@ static struct mtd_partition da850evm_spiflash_part[] = {
 	},
 };
 
+static struct nvmem_cell_lookup da850evm_mac_address_cell = {
+	.info = {
+		.name = "mac-address",
+		.offset = 0x0,
+		.bytes = ETH_ALEN,
+	},
+	/*
+	 * The nvmem name differs from the partition name because of the
+	 * internal works of the nvmem framework.
+	 */
+	.nvmem_name = "MAC-Address0",
+};
+
 static struct flash_platform_data da850evm_spiflash_data = {
 	.name		= "m25p80",
 	.parts		= da850evm_spiflash_part,
@@ -1447,6 +1461,8 @@ static __init void da850_evm_init(void)
 		pr_warn("%s: spi info registration failed: %d\n", __func__,
 			ret);
 
+	nvmem_add_lookup_table(&da850evm_mac_address_cell, 1);
+
 	ret = da8xx_register_spi_bus(1, ARRAY_SIZE(da850evm_spi_info));
 	if (ret)
 		pr_warn("%s: SPI 1 registration failed: %d\n", __func__, ret);
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
