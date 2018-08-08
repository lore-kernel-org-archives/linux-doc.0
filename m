Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D3BD7E422
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbeHHRx5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:53:57 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38236 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbeHHRx4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:56 -0400
Received: by mail-wm0-f67.google.com with SMTP id t25-v6so3199934wmi.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fI+k8Vv3yG+m9/MHc2+cp7aa8pgPxuuoC1DpPepTxjM=;
        b=wrfabtZwU/d/lWONYUx0VOtQu0zRo8SDOMXGZaxGqjyRN8QWvxmyd6SbS3aq7lswg/
         S9hPghko6V8V3f8jt6p4L6xkFi8AoJxRmBJHLLzrQXQrxjDTw1+Ysm+1wzTx4ELwjlNY
         t48/wtltq44OJVKx9fmN3gMtDLRvE5ElvSNAQDwAj2qnsvezlONIf1sZJQRSQh55hRj6
         37cUooOzfaTwRD835fPQAugWzVe5139PKPLxSXfqbNmUweCECgZqFePK8OKH6uihv3L1
         SIBBPnWxdwQNOoAVph2Ir7hv628hKFY6pj7rXguqwP0/yTZ0/CSTFZJVDKlLtsxSOtsj
         gvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fI+k8Vv3yG+m9/MHc2+cp7aa8pgPxuuoC1DpPepTxjM=;
        b=KQb79xd/GC/fg2Q9XOmLkiTEnYwT1CHTr/LaAuNy0q3eO6uwSfWG5uYAk9XqmQfIpj
         IDpxPDavWHvlVmiZHo7EtaP4Fg2lrll3r9Nr6QmnAQ2YbIq7MZWYSEXO/j6Mn9hy+/RG
         rzE+hdsBPoVuoNp4GGhS3hAQ+WLw0EB6kHXT7i4f2yXOCZjrCzLizggdigJmK3BYPcDl
         iHxRzuWXp7uh7kJ28KWMVaYTQBKmCc08TU6WqOzNOYJMHCEPZAQoLB/VVgTkVJuIZb16
         AFuDf2OlTT0uNr1ohvU4GAmVVBD3FPvObZ5wFnjnLgVw6vto8zFiZf1MGbqhByYfrlzr
         913A==
X-Gm-Message-State: AOUpUlELrSt8D7oywHiH3hcIn9LPj2LudPhbwiqyrYi0LSRVHofextoq
        hp94d4PNWhpqKcZCIGeI+sGmZg==
X-Google-Smtp-Source: AA+uWPwazS5HeG9UE/Vvb9p8w/R3WbqH+H5qN34D7bAmSZJ2/5xRLNYNJdPw+q4bssU/6gkiZ1Kb2Q==
X-Received: by 2002:a1c:55c2:: with SMTP id j185-v6mr2240121wmb.104.1533742424512;
        Wed, 08 Aug 2018 08:33:44 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:43 -0700 (PDT)
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
Subject: [PATCH 09/28] ARM: davinci: dm646x-evm: use nvmem lookup for mac address
Date:   Wed,  8 Aug 2018 17:31:31 +0200
Message-Id: <20180808153150.23444-10-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-dm646x-evm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 584064fdabf5..5a9de47bc8a2 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -37,6 +37,7 @@
 #include <linux/platform_data/i2c-davinci.h>
 #include <linux/platform_data/mtd-davinci.h>
 #include <linux/platform_data/mtd-davinci-aemif.h>
+#include <linux/nvmem-provider.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
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

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
