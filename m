Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F39947E420
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbeHHRxx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:53:53 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43609 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbeHHRxv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id b15-v6so2388821wrv.10
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3db+EwdA0BE/nKODKMaepKnhT1t81s2qEJflbfjuR1A=;
        b=fO4u90gRjcwJ1PkoMrvfUoqbmGq/lYuIUldc48QmVBYbNkJFkz2gyQukVu4JTNrBCu
         4UsEvaLrpuXhZlqYiH84ZBdMbEFONdoKwjKVbhJHQ26B7ebLQTjJH9pUDWMZ0KVwKRlE
         pdvJmEfg6MMindvOSEtSu/pqYSQQsbsT/jLgSOMC698QYXGPLMgB8Ca2LTqeTfJWYokE
         GNrAil+tILe7xAbtMnNqOkNbqC0PM6Z//6DnRbbR8PPJRFjGIt+ZgOTKi6tC1LYidaOq
         M3Jl95Rbiblq+r9g0Y/3ciiOog9D2AZXZTAJ8S/czLde/bQe1HlWLqDGI+ZSEQcW/AEN
         tmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3db+EwdA0BE/nKODKMaepKnhT1t81s2qEJflbfjuR1A=;
        b=fJLqKy2XTAdcFL38WcVCmJAQpSiGh6vvtda8Swmnbpr4I5iow0/nIfZgBO/rvXQEwt
         Na5tH8dogSaUZTB83EHLR1Ly2DN1hj7vg6eE1crOZRSZWwMVz2+6/xZq9i7tHaC9yDVa
         1TqDEgeIAFpHwYVmatYNf3WQO446Gp19RCb/H7JFzqoqn4O0iitT3eCLdu0KTabXRutZ
         gA8csuTrvHNGIvSWEOVHl985ExJtHsSK8l+fJHPGBQOGQbIHmflgf4go7v/XJ62hCupI
         I0NodzHj0MqAxz0h+6d73Tir4R/gUijJVyLiSIohVcO746lbh+z8TQBWiVzBWCwYVUUv
         NV7w==
X-Gm-Message-State: AOUpUlHex0uCkrqgYMVG4XvrwttcZVCZvmEW9PvPPlnQ5MfF5Ra24e4I
        0iQtZN6X3Xr/Xtm5SmlsaaWknA==
X-Google-Smtp-Source: AA+uWPzi/DfnxkWlzRJWkuCz9Vk5iiOrkjRdGpqxGNn1tqWZ1Bwdhofy38dZ4+bn8pt48LHVGuy/XQ==
X-Received: by 2002:adf:9e84:: with SMTP id a4-v6mr2234951wrf.70.1533742419840;
        Wed, 08 Aug 2018 08:33:39 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:39 -0700 (PDT)
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
Subject: [PATCH 07/28] ARM: davinci: dm365-evm: use nvmem lookup for mac address
Date:   Wed,  8 Aug 2018 17:31:29 +0200
Message-Id: <20180808153150.23444-8-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-dm365-evm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-davinci/board-dm365-evm.c b/arch/arm/mach-davinci/board-dm365-evm.c
index 435f7ec7d9af..cb0ac92a278e 100644
--- a/arch/arm/mach-davinci/board-dm365-evm.c
+++ b/arch/arm/mach-davinci/board-dm365-evm.c
@@ -28,6 +28,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/eeprom.h>
 #include <linux/v4l2-dv-timings.h>
+#include <linux/nvmem-provider.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -169,6 +170,15 @@ static struct platform_device davinci_nand_device = {
 	},
 };
 
+static struct nvmem_cell_lookup dm365evm_mac_address_cell = {
+	.info = {
+		.name = "mac-address",
+		.offset = 0x7f00,
+		.bytes = ETH_ALEN,
+	},
+	.nvmem_name = "1-00500",
+};
+
 static struct at24_platform_data eeprom_info = {
 	.byte_len       = (256*1024) / 8,
 	.page_size      = 64,
@@ -769,6 +779,8 @@ static __init void dm365_evm_init(void)
 
 	dm365_init_spi0(BIT(0), dm365_evm_spi_info,
 			ARRAY_SIZE(dm365_evm_spi_info));
+
+	nvmem_add_lookup_table(&dm365evm_mac_address_cell, 1);
 }
 
 MACHINE_START(DAVINCI_DM365_EVM, "DaVinci DM365 EVM")
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
