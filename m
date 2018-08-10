Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D11247DE71
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbeHJKei (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34177 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbeHJKef (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id c13-v6so7495895wrt.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G5kqWCsWMSj90Glln9/pjzOQBVCAn+wjThQrCeWbXjY=;
        b=cewKufJyOi4MN2nTblfsSAfiPvACoBYNyZNPM0atkEBznxXQ7sKq2JxrQ+2+0p7uCD
         UcvlDLlFkVk4vaLezAj2y+8ZjTfTmxr9m/5dBXgfQEHjkayryaj4az+2pqklz9VoDXID
         j9bf/d2uzJuEVQhXUGctMjnx7wwzizCAJNhdaa4AY1bVqOA4FxF6cl+yt/kYhX5mOugf
         14PEh6zu9CkV124cseOCkFXoJsmmB8EXie833W/f3fal/VOZqCPkk8PD1naIfQfxq9/B
         JYZp+mzenjkYBHHlzGJeBUeY7CnZS8wpywIsrpu0FZJ8HoPIUYQcpSEMpNKk5zNdCkgA
         CufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G5kqWCsWMSj90Glln9/pjzOQBVCAn+wjThQrCeWbXjY=;
        b=WM6YPRWIyf66k+4x2uorqcq6nHvEa2stqRMDSuoptuKbutvESkwckseVh5Agg6af2e
         l1UUv30hSjIktly9FaPjWSa+Ip71sYhfq8QcsDwTl9Wnhg/onlfPfInlCmym7vblmaai
         D/Mn1H3STsvl85nxo1PcMW9w0XuAaAXb9QMOZQO05OoooJw7qedNePX6LCeOcJ9kT7Qq
         rElaNrEBwq4zRAvW6dr6nzYFWlZ/0oCODfVfd41tXEciGZo92X6ZscLh8ffDaW8fYpkx
         pcahWoyFNK8TucKgxb3G2qOxTFN5DqBn89KjskLDyNDIOKehl3eXYQ2+OvqaW4Zr/Joi
         +lbw==
X-Gm-Message-State: AOUpUlGSX5osZrdQqWUBEWBON4x4lTa+2auTxgbte0qvXkYLLH57/aRw
        IyCpJkeD8iV/CM8w82GNXcQV1w==
X-Google-Smtp-Source: AA+uWPw/Gnx/xGfligkHKZKWSjU14CMK5H9IcmHK5JkFMKmXaVTFEdlAXhlemGX+z1tERW+yOh6u5w==
X-Received: by 2002:adf:8466:: with SMTP id 93-v6mr3390066wrf.274.1533888349942;
        Fri, 10 Aug 2018 01:05:49 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:49 -0700 (PDT)
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
Subject: [PATCH v2 09/29] ARM: davinci: dm646x-evm: use nvmem lookup for mac address
Date:   Fri, 10 Aug 2018 10:05:06 +0200
Message-Id: <20180810080526.27207-10-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-dm646x-evm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 584064fdabf5..943ab0ca6db8 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -31,6 +31,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/nvmem-provider.h>
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/platform_data/gpio-davinci.h>
@@ -310,6 +311,15 @@ static struct pcf857x_platform_data pcf_data = {
  *  - ... newer boards may have more
  */
 
+static struct nvmem_cell_lookup dm646x_evm_mac_address_cell = {
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
@@ -802,6 +812,8 @@ static __init void evm_init(void)
 		davinci_init_ide();
 
 	soc_info->emac_pdata->phy_id = DM646X_EVM_PHY_ID;
+
+	nvmem_add_lookup_table(&dm646x_evm_mac_address_cell, 1);
 }
 
 MACHINE_START(DAVINCI_DM6467_EVM, "DaVinci DM646x EVM")
-- 
2.18.0

