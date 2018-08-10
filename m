Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D95737D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbeHJKeb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46695 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbeHJKea (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id h14-v6so7447963wrw.13
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FwyNGSHiOJtGONRaDr8ThVu1ERv+Zjqtryg9AOfSNOg=;
        b=hpbHyybqOz4E2uVHyVT+2GgLMXrKdt6w6C6XcRDtPYAW54YvGdyDToBmubnIZk9suH
         tOtjJw2FS2UqReoSnuvU4XivlJJUN8WiMeC1xwnpNq3rtBWrtWFtQ5VB8MYaLkCKoQ1Y
         eHgQ050yRpH7mCSqzyvgWT5NuflUn53IZqT1prc0qDrrWjkhQUzMFX36a7SHyaebOT/n
         TB4vJDBG+DPwD+V8QZzRCqLRHwuLEptjkuOC1MLRUTTzwE4k45rGO33kiJ5YgFsxL7wI
         LO6eHX6+Rf3F5UvAxT1TfsShXgNG71xGwSvRZ3gOVdhREWBCiAWtllK8F4zVEPtH4heU
         ImcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FwyNGSHiOJtGONRaDr8ThVu1ERv+Zjqtryg9AOfSNOg=;
        b=SGxSx+Uxe3hdtVMCWTV59ItFkLEf2C5wcEVGXmEAveg5+ZukrQxJ+mPCrguYQynDZD
         UYO4Dr2BIsLFbR0CNNqgScZKzRQL7zQldMZT8nYuviSlkKR11weMNB1Jjy3q+dO+5XY7
         uE7D3Q9G2itS4028NuJ/eJU3y8sN37QuIBV/9LxFrbXatE0vIz+nCF/8U2wYDqNwXtu5
         n4m3RCiad8gOoxmLm/cswcW+n15/RIFcUcLRWZzb4VEX1LGs7f5EoKnZnXMQ547VtpLD
         jG47pP/uukliW8r4V/ZSeAxbCrCMLFCNzYeL3UtPuONeeG3ddotAjG23IHLL2Z53S1pW
         y1lQ==
X-Gm-Message-State: AOUpUlEQqVR4ccp9d88tRy9JlOVfZI8I0bBroBeSJrw5xRQhABREjwrd
        eFXjslxhU4JYQpzv+PgPsAQd3A==
X-Google-Smtp-Source: AA+uWPwbRZ4qbxJYpAg+IYZPFTqoclehtJo2xzwKjACWoVjj9ER+07jUmdmdQUzbJBGsORJ7A2umQQ==
X-Received: by 2002:a5d:5349:: with SMTP id t9-v6mr3377951wrv.186.1533888345376;
        Fri, 10 Aug 2018 01:05:45 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:44 -0700 (PDT)
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
Subject: [PATCH v2 07/29] ARM: davinci: dm365-evm: use nvmem lookup for mac address
Date:   Fri, 10 Aug 2018 10:05:04 +0200
Message-Id: <20180810080526.27207-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
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
index 435f7ec7d9af..cf3f2e611228 100644
--- a/arch/arm/mach-davinci/board-dm365-evm.c
+++ b/arch/arm/mach-davinci/board-dm365-evm.c
@@ -22,6 +22,7 @@
 #include <linux/leds.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/nvmem-provider.h>
 #include <linux/slab.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/input.h>
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

