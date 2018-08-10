Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 166AF7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbeHJKft (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:35:49 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35598 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbeHJKfG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:35:06 -0400
Received: by mail-wm0-f67.google.com with SMTP id o18-v6so954272wmc.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+IZEKVYmKeDxsrYMT6IImwtkDFAn5lkIQ+xlbddXw+s=;
        b=WGuGo0xb5j0hcr3045clvo0egQZTJcQ1zPsTs1L7DK+iDqpEvZD5y5dM7hpaMrgSYT
         nQifoecUNQNdPH8vP5Q+a0o+SxAWK6j0wtRzKJLUkCgUDw+z99LvN+nfilIL0Y73cbW4
         Yw95c8IIHAMejR6WEJz5kl8AGpeQTaPFddp8+WSNNSHmd8+7iiV7vu8kHzweWnBdK0pa
         npIW7/6z8YPPgpDOk7P+SwCUNbMpFyKrOBtU8KTU8S9kqPS+2/ffc6pvGJPvezusmGcN
         xs+ykCtoP9UzWRxNNQzH1rX9ejMRs/ZAac+BZ7PjEWL7+6/7M4XPnBiJOsccxp5zNu9V
         krtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+IZEKVYmKeDxsrYMT6IImwtkDFAn5lkIQ+xlbddXw+s=;
        b=E6WeuKM6R04rseYMCPBBHlL3Lo6/ZA+fFy+TOKOwx9shIcvQGJ3bRfNG6vPDTlfCj+
         fRnpr8a8bMcqfdSJcrCSi8IGyI+9jBbWU3eC093LXZrAVV+fOvkWNBpAaWFIWAuxdJts
         CHGk33R8PHMgjmAYGYiRbwolgxcLLugKtTn0FjR4eK7EA7mi73MjA9liicUgZ+zUB8CO
         oHWuOHBwfTaaM6ZnnKqveZ5hkrPmcKNzhjr8RF/mEdHOuBTXuuqhx+XOBftMp8EfDxIb
         4ghg1z0wK01IrKHhe170ewYvbB+GLshMAKBPS3SOx+WNej5CSpVGx6atFtfpV8iU7q5w
         1bLw==
X-Gm-Message-State: AOUpUlGb1y8TVbXgpvPb20ABR1kSHaF40bds/xyAXPTVpemjwCQub4I/
        xU93jQNs7RUliCie1cQENfOryQ==
X-Google-Smtp-Source: AA+uWPzatBpR01HvOEq7A9iq/907Kck6yZBBHnMHyW48A/RXNxv2c1WFJolqckPgk75RwolNJg3KPw==
X-Received: by 2002:a1c:9e89:: with SMTP id h131-v6mr752656wme.13.1533888380637;
        Fri, 10 Aug 2018 01:06:20 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.06.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:06:20 -0700 (PDT)
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
Subject: [PATCH v2 25/29] ARM: davinci: sffsdr: use device properties for at24 eeprom
Date:   Fri, 10 Aug 2018 10:05:22 +0200
Message-Id: <20180810080526.27207-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 arch/arm/mach-davinci/board-sffsdr.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-davinci/board-sffsdr.c b/arch/arm/mach-davinci/board-sffsdr.c
index f6a4d094cbc3..4f3bc78e8154 100644
--- a/arch/arm/mach-davinci/board-sffsdr.c
+++ b/arch/arm/mach-davinci/board-sffsdr.c
@@ -26,7 +26,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
-#include <linux/platform_data/at24.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
@@ -92,16 +92,15 @@ static struct platform_device davinci_sffsdr_nandflash_device = {
 	.resource	= davinci_sffsdr_nandflash_resource,
 };
 
-static struct at24_platform_data eeprom_info = {
-	.byte_len	= (64*1024) / 8,
-	.page_size	= 32,
-	.flags		= AT24_FLAG_ADDR16,
+static const struct property_entry eeprom_properties[] = {
+	PROPERTY_ENTRY_U32("pagesize", 32),
+	{ }
 };
 
 static struct i2c_board_info __initdata i2c_info[] =  {
 	{
 		I2C_BOARD_INFO("24c64", 0x50),
-		.platform_data	= &eeprom_info,
+		.properties = eeprom_properties,
 	},
 	/* Other I2C devices:
 	 * MSP430,  addr 0x23 (not used)
-- 
2.18.0

