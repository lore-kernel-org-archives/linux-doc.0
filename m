Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38CDE7E3E6
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbeHHRys (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33771 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730281AbeHHRyf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id g6-v6so2428254wrp.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5BmTvmpqVPdPXiWZLqUzgpWunx/nLJo3Onxdpacg0zI=;
        b=Kis6cTi+w4SEAI/fwvgBrnj472bwYN+eyv3mo4kGmNQZDXxuLvKb94AGGLiHNSluxG
         2U8ySAl8kvhqXbe2XhqUaf010LnH6lGXajML/GnE2zBMR1XM77EY31pxw/b1GdGnCZx5
         gJOe0IfIUYJkGio9jj5W+yBVZYIlJGQVF54kEeEoMADSIZoHwsXHaBmI9vj7cwYVPs/D
         i3KLzjafr7kQx93rS+kuCWvz8fPGBU81PxZEPcgXnNzwETjXU43zkWGjIpBDTRBMFyiK
         DLgcYgpWKxPBpCaCZvyhg/gFXQiVf4u2d0Xs1jOd81NQQj0YaU7PeELSb+8PWjY8TE92
         DySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5BmTvmpqVPdPXiWZLqUzgpWunx/nLJo3Onxdpacg0zI=;
        b=RVXU0BSg+jiexy/SN0Ak+D3EnLmGlzUrwdP78KkvgqnYyXtQ5C0LjN7DXBOhboktyX
         Feq8b9LJuPXWwl27lcPGU5ZqzXfWS9trxdIH/rYMYN0eubOJugdaSMzisAr6dDOlo6Oq
         D9ya1jxrTb67Dccfy10cwV/txKH0HkrFV8xOXm+05pyMciMB5O/baf9rR8XewM8ft8pf
         OTLXKJHvDN7e//t1+ARQFpi4nwIocAsUhOYHqY/L1APMAG49Jy+0nfdTY6xenx9Gsl0f
         epcJfEhwgM3FD3TVoFmgRUUJEI3gU76mAFcJBTHCJ+uM4IohqUpi5La7jnN01mXSDEAq
         lBjg==
X-Gm-Message-State: AOUpUlH84xT0rRge3hbNmPShTlJL+guIZ+YUe7CPPkW3IvwiR0N14I7Q
        rEqRpqu67U18U9aS34ARVwh+BA==
X-Google-Smtp-Source: AA+uWPyV6VlTlRaeC+r3kKWHdhHVBLwAS1LLrrv0m4zb7VzKaj+yFJ5m6ik4UauW9bSl3bGOalwxjQ==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13-v6mr2149850wru.80.1533742463447;
        Wed, 08 Aug 2018 08:34:23 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.34.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:34:22 -0700 (PDT)
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
Subject: [PATCH 27/28] ARM: davinci: mityomapl138: use device properties for at24 eeprom
Date:   Wed,  8 Aug 2018 17:31:49 +0200
Message-Id: <20180808153150.23444-28-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-mityomapl138.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index 17b67e26bc0e..be0fb7d17e25 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -14,11 +14,11 @@
 #include <linux/init.h>
 #include <linux/console.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/mtd/partitions.h>
 #include <linux/notifier.h>
 #include <linux/regulator/machine.h>
 #include <linux/i2c.h>
-#include <linux/platform_data/at24.h>
 #include <linux/etherdevice.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
@@ -185,10 +185,9 @@ static struct nvmem_cell_lookup mityomapl138_nvmem_cells[] = {
 	}
 };
 
-static struct at24_platform_data mityomapl138_fd_chip = {
-	.byte_len	= 256,
-	.page_size	= 8,
-	.flags		= AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
+static const struct property_entry mityomapl138_fd_chip_properties[] = {
+	PROPERTY_ENTRY_U32("pagesize", 8),
+	PROPERTY_ENTRY_BOOL("read-only"),
 };
 
 static struct davinci_i2c_platform_data mityomap_i2c_0_pdata = {
@@ -317,7 +316,7 @@ static struct i2c_board_info __initdata mityomap_tps65023_info[] = {
 	},
 	{
 		I2C_BOARD_INFO("24c02", 0x50),
-		.platform_data = &mityomapl138_fd_chip,
+		.properties = mityomapl138_fd_chip_properties,
 	},
 };
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
