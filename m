Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C964E7E425
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbeHHR5B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:57:01 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34568 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbeHHRx6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:58 -0400
Received: by mail-wm0-f68.google.com with SMTP id l2-v6so958137wme.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UaMCnpUR2BVBntYfvCxdZ/Bq79Ac4uMXuz598bqXs7A=;
        b=sX3LdCS9jckTwsFoDRZe2ahO/owvgdq6cCChJEa3aJ/Et9TzlvzCyrDD7WxkyMlRZ0
         QlmREy2BfoqdyqUZeHX1IIi6UXlScQkArZuw+rSqneDpZTM+uXC/9EMA4XdNsOrEH63/
         DEjqcfmns62vUHPQGv9DpafvUOgLrUIi5CkNVwgafZCRFEf6D2zT+L6fwHuCSvVP8w+z
         Xyaia7fBe/EKYz+IMDXA3ALQ77NU56rAD+ydVE6EJaQHy3boTJgDNrjbL8f46DozzXZl
         Q8BB0z7JQY9DwwAodb65jGQ0c2/htq8XqjQMofOnm+dUSg6yk7e1akmeQi+Z/eb8A9WN
         uNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UaMCnpUR2BVBntYfvCxdZ/Bq79Ac4uMXuz598bqXs7A=;
        b=M8rYNT8lsvSnUqLZ5b3EGlFwdEmTTF9fQiGpVQhhCGY3nNSCepuP/fi6PvCi2rrP3D
         qP1Q0EnGpaxDk2T4xQ02yx3avz0DuAqvJyEdVS8hXNfPm7o6JP3h5386ynHlY6eRSItb
         dfXffUpDMfCBfGKrqcEffGwqQo4sCl2Bt6gv3NaC8toNrYTSyPq5OJ7YaYLXF+nh/72C
         49EojrLKfPnhSxJtmYwzftjBYovssSYiINIAkLZIDAewzlVlxAvbur2te0Fk+d3ePxj4
         8VkU7RR6qoxvSdZcycIIGQO8S+tyDOOkOnflrVCTzPmlwutRQ91EbwXZZaV+8nW0QJrh
         OY+A==
X-Gm-Message-State: AOUpUlHOib0XD4TEVUjbfMcw6eLyU9Kw6zrqctvuD7n/W04Zhf6Ea6k8
        WAOWSCiMqx1AQUQlsduCkKGVpw==
X-Google-Smtp-Source: AA+uWPzQ9VeXMiG4JZ0oeQCVGPA/T8xSjsOuZm7kvb61zqx6AKdW4uGEdhiMynnKhDRO7KHKjTwLKg==
X-Received: by 2002:a1c:c241:: with SMTP id s62-v6mr2326164wmf.146.1533742426569;
        Wed, 08 Aug 2018 08:33:46 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:45 -0700 (PDT)
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
Subject: [PATCH 10/28] ARM: davinci: da830-evm: use nvmem lookup for mac address
Date:   Wed,  8 Aug 2018 17:31:32 +0200
Message-Id: <20180808153150.23444-11-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-da830-evm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 14a6fc061744..4a2fe8142a2f 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -29,6 +29,7 @@
 #include <linux/platform_data/spi-davinci.h>
 #include <linux/platform_data/usb-davinci.h>
 #include <linux/regulator/machine.h>
+#include <linux/nvmem-provider.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -409,6 +410,15 @@ static inline void da830_evm_init_lcdc(int mux_mode)
 static inline void da830_evm_init_lcdc(int mux_mode) { }
 #endif
 
+static struct nvmem_cell_lookup da830_evm_mac_address_cell = {
+	.info = {
+		.name = "mac-address",
+		.offset = 0x7f00,
+		.bytes = ETH_ALEN,
+	},
+	.nvmem_name = "1-00500",
+};
+
 static struct at24_platform_data da830_evm_i2c_eeprom_info = {
 	.byte_len	= SZ_256K / 8,
 	.page_size	= 64,
@@ -618,6 +628,8 @@ static __init void da830_evm_init(void)
 		pr_warn("%s: spi 0 registration failed: %d\n", __func__, ret);
 
 	regulator_has_full_constraints();
+
+	nvmem_add_lookup_table(&da830_evm_mac_address_cell, 1);
 }
 
 #ifdef CONFIG_SERIAL_8250_CONSOLE
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
