Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E2AE7E416
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbeHHRyX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:23 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35789 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729958AbeHHRyW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:22 -0400
Received: by mail-wm0-f68.google.com with SMTP id o18-v6so3251056wmc.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a/BOUiTdvWAmDk1aQD6bOGL0a+rPVeL/eLOK+TRSYBw=;
        b=XWVIG9DAg21hfeGcQ001YukvUzI3hLmFhFbJL9E9LKfvMDBDtdj6O/WL+KF1zX98c+
         6lrWefYHk3PPIT9ix5DmwQe/RenzPWO73DW5zXaLPGKS0n/76eNwJ6x8dRUFP4AvIYpX
         w4wJmiXoH41F2X8U9nU6XA4Wf6hvlcXcFrRSuqZOdC42a784zl5qqS27ymeZh/1kM4Wl
         LTEl+wCatoeybcGry3jjKw84JgJwCUKPh3iE03TFLoA+e8L6U4MubHtJZX020Z6TVVhI
         oO/VjYnDzT8ipDY+uJgIs9K/biY5I/7AHR1dbsTIzWmad+yXM2+gpMUZqy8I2uiaVEY9
         VP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a/BOUiTdvWAmDk1aQD6bOGL0a+rPVeL/eLOK+TRSYBw=;
        b=QRXAAAw1EqcTtM88ndYSlXiJStPF855prt4XfvD8RECltaiQDIiih4axuTi3+rLP3l
         6ItgQWnmj1fZ6Jo1xT/4dkxLUSIQ5SaLikCTJLjvHT7n8p9r8WjrSQYi1OvW73/lDl5x
         Lln5P1fls8hRYqCE615LBfZcTMyhiu3tH2z3ObTWm3dUOGt/XsRheoFm9fZb/f0q7zw/
         cFBvfeqoOZSbNea8kzjMMFYcPFhYMkiqMF7/d4//zQ61GUfyGZTE7CuVP5P2n+3VXQN0
         LLpkRFKh9U9zC28Wi5BrZrtqTGCdJBQf2g4n0qglrPzIIQGAV810GG0rI4Cv5FJ4odzo
         z0pQ==
X-Gm-Message-State: AOUpUlEBEE0Z5Wkr7gNoT93G6vG2qSRES4JNO1e3jYR3qMZBbOGS3bDY
        PTfovbF1CuxwN38/VlkMBtDXbw==
X-Google-Smtp-Source: AA+uWPzyExx7j3C2AK1GuIIoR03Rq84RTVVyrNda+80Xn0gntUo0tViWEpucOr8nY5YDlRZCtl+I0Q==
X-Received: by 2002:a1c:f46:: with SMTP id 67-v6mr2072530wmp.122.1533742450496;
        Wed, 08 Aug 2018 08:34:10 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.34.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:34:09 -0700 (PDT)
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
Subject: [PATCH 21/28] ARM: davinci: dm644x-evm: use device properties for at24 eeprom
Date:   Wed,  8 Aug 2018 17:31:43 +0200
Message-Id: <20180808153150.23444-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want to work towards phasing out the at24_platform_data structure.
There are few users and its contents can be represented using generic
device properties. Using device properties only will allow us to
significantly simplify the at24 configuration code.

Remove the at24_platform_data structure and replace it with an array
of property entries. Drop the byte_len/size property, as the model name
already implies the EEPROM's size.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-dm644x-evm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index 6d35c6e1b0bd..abfcf42da6fb 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -16,8 +16,8 @@
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/pcf857x.h>
-#include <linux/platform_data/at24.h>
 #include <linux/platform_data/gpio-davinci.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
@@ -486,12 +486,8 @@ static struct nvmem_cell_lookup dm6446evm_mac_address_cell = {
 	.nvmem_name = "1-00500",
 };
 
-static struct at24_platform_data eeprom_info = {
-	.byte_len	= (256*1024) / 8,
-	.page_size	= 64,
-	.flags		= AT24_FLAG_ADDR16,
-	.setup          = davinci_get_mac_addr,
-	.context	= (void *)0x7f00,
+static const struct property_entry eeprom_properties[] = {
+	PROPERTY_ENTRY_U32("pagesize", 64),
 };
 
 /*
@@ -601,7 +597,7 @@ static struct i2c_board_info __initdata i2c_info[] =  {
 	},
 	{
 		I2C_BOARD_INFO("24c256", 0x50),
-		.platform_data	= &eeprom_info,
+		.properties = eeprom_properties,
 	},
 	{
 		I2C_BOARD_INFO("tlv320aic33", 0x1b),
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
