Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E5CAB7E417
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730113AbeHHRyZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:25 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51953 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729938AbeHHRyY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:24 -0400
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so3205526wma.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OvKwhd2mCBVUwPnMRE5AwwMx496gmP74HrCO7MDmB+U=;
        b=S74xJ2V4qE2OWDv56e8ZgVKuC6BowTpGgNREJayNLwLD1IUpDA4vUU3xQC3TkvWvf0
         QeWQIFp++qv7MWqofZr7LFgFDNZ7RFZvQl0PSWJKjzDVa3PnPRoea7XEvMfKV2FiEqIz
         wna4Yofjol0X/TnS153inNlMQ6b4gjzoPB7kZoYVCnR6FLEnBBSil2FrNSbGV4fG0RJX
         bYaNfB3U6b78SjkujVor02ZwG6i64fZFzYnrGsGM833bwqoiAbLXMY10cNq5iX04pLdL
         bKvClCNnyasWxLK3k+RzurJZRCdBFnP4aRS664aInm2cqah5gT6w6Ac/+CzU50phiAw4
         ZgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OvKwhd2mCBVUwPnMRE5AwwMx496gmP74HrCO7MDmB+U=;
        b=LbzlYRewn6PvAxMLOoNG5ap9wtGa0RSLbbTYIDrc3iM6BdTpeg+UvriOLfRdOtPge6
         qPNo/DfHYIcLZE9PlWL4i2ONkT4VvDwyjST2lVjP+o7NJOJywtEmeb1AmdOPq+v1pCcV
         iYnfFHo8R84vnRI5FJLTRfV+OXLEndo4as0/A2R9YrS/VThwvCGeyIBn0xJ8DbpzG/f1
         tpGyZ6Pqh8LxCIZBnVVbNUU21ogvw1gl+hV9xO49lXGu7tq4X8fOh+i2bS6mQth+lN+D
         FVgUPPIvIruk3omKZFwhybBYOt10PocQygqv8HYL6hKFpAgjFksU/tJzd8luezSIGuKY
         K0xg==
X-Gm-Message-State: AOUpUlFRZbOavxkAN1P2+27PnGW/T7JcTE384toDt/zW7Fg60+quilxj
        lorgrpZlbQFEx7YXbYyz+xyGnA==
X-Google-Smtp-Source: AA+uWPy5SKjo4TRcy8mU4g7AFlHYuqb9Vkvn6ZOQngBdjUuqkdRLeueIoyhUxuVpisqFKwBZDpKvGw==
X-Received: by 2002:a1c:9f12:: with SMTP id i18-v6mr2156022wme.124.1533742452573;
        Wed, 08 Aug 2018 08:34:12 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.34.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:34:11 -0700 (PDT)
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
Subject: [PATCH 22/28] ARM: davinci: dm646x-evm: use device properties for at24 eeprom
Date:   Wed,  8 Aug 2018 17:31:44 +0200
Message-Id: <20180808153150.23444-23-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-dm646x-evm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 5a9de47bc8a2..5049f0c6cd1a 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -22,7 +22,7 @@
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
-#include <linux/platform_data/at24.h>
+#include <linux/property.h>
 #include <linux/platform_data/pcf857x.h>
 
 #include <media/i2c/tvp514x.h>
@@ -320,12 +320,9 @@ static struct nvmem_cell_lookup dm646x_evm_mac_address_cell = {
 	.nvmem_name = "1-00500",
 };
 
-static struct at24_platform_data eeprom_info = {
-	.byte_len       = (256*1024) / 8,
-	.page_size      = 64,
-	.flags          = AT24_FLAG_ADDR16,
-	.setup          = davinci_get_mac_addr,
-	.context	= (void *)0x7f00,
+static const struct property_entry eeprom_properties[] = {
+	PROPERTY_ENTRY_U32("pagesize", 64),
+	{ }
 };
 #endif
 
@@ -396,7 +393,7 @@ static void evm_init_cpld(void)
 static struct i2c_board_info __initdata i2c_info[] =  {
 	{
 		I2C_BOARD_INFO("24c256", 0x50),
-		.platform_data  = &eeprom_info,
+		.properties  = eeprom_properties,
 	},
 	{
 		I2C_BOARD_INFO("pcf8574a", 0x38),
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
