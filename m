Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 662827E420
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbeHJKfJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:35:09 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52717 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbeHJKfI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:35:08 -0400
Received: by mail-wm0-f68.google.com with SMTP id o11-v6so925710wmh.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M7UsCvqnFt3W2bHK6DWe4k8iaOUKf7rLaco+g4nZ2Ys=;
        b=dwU/32Ufpl4mI0eldG2u4mTgGZt8r/cXN9DbRV3fdxLrv01DOyB9DSOc0vmcXB+b48
         RtFFfzOZqFYmTKufvvFhsUgiAc87bbuyKu/HweqtyreLYqkje26H/RnRpbWUr1HmTmnk
         NpvrCxHiQgAlM7xiWGXdQ4SYk4vZDJaCT0ut7zB1bfAv/8NFxjjisGls4QQbJ++U0Qva
         /E6FQWvZlQ+CeztxxSNRcQqoyi0qkRDPQpLmdfH7XQzMRwSjisvPuX4QwK0JDInQOZAH
         CGbv6rE8HtQJU08Uk9HFqdABv1aMRE9w5SKamor7TabNw7LoYjhBVoWZKaaXyFXC6XX1
         AcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M7UsCvqnFt3W2bHK6DWe4k8iaOUKf7rLaco+g4nZ2Ys=;
        b=DwzeECuoK5Q6VdrSzp/Lfri3Jd8vzat8Rtd0ArwnZJm4QQNyOIfoKhRr/evQZbzr9v
         icy4rNm5WgcelXv9HjxD0zTg7S9yy5bFGa/OAugxm8fNkNQoY/Fjlp43k8Zufa6gs76h
         7AD+/IUMTCJz+Jr1dUJYtlyRX0P9+zBDToQpn4khG+q4wo2XZB8diQWP8VBstyYx9mHE
         dRQqKSc7IxO/azHVj9XaK4a8HIZSYuzRcGBcJMCAcwQB86jCbYYI5uXT86mrc3IPFCj9
         gLXQ0C/5eUpysvckF08DpYuHDc++gN0u/Si65xlHWJPZJ5gvqUvXpanBZ+FoAgX2+sjC
         aeHQ==
X-Gm-Message-State: AOUpUlHQABNwGcjjDQ55s0xBV8nQtI1b2ahMX5+jgVfGt2CNVqrva7Kc
        cMnQq2zvu8MwBymlyqubY6ndjA==
X-Google-Smtp-Source: AA+uWPw99qS5MdN9yNmmkuybd86vvR6EUgqzbrJPYSG5arNt+kN3G2SU5NsM4vPUB1a6lzY7BthJrw==
X-Received: by 2002:a1c:87c9:: with SMTP id j192-v6mr723093wmd.71.1533888382779;
        Fri, 10 Aug 2018 01:06:22 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.06.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:06:22 -0700 (PDT)
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
Subject: [PATCH v2 26/29] ARM: davinci: remove dead code related to MAC address reading
Date:   Fri, 10 Aug 2018 10:05:23 +0200
Message-Id: <20180810080526.27207-27-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are no more users of davinci_get_mac_addr(). Remove it. Also
remove the mac_addr field from the emac platform data struct.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/common.c | 15 ---------------
 include/linux/davinci_emac.h   |  2 --
 2 files changed, 17 deletions(-)

diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/common.c
index bcb6a7ba84e9..0c6cc354a4aa 100644
--- a/arch/arm/mach-davinci/common.c
+++ b/arch/arm/mach-davinci/common.c
@@ -28,21 +28,6 @@ EXPORT_SYMBOL(davinci_soc_info);
 void __iomem *davinci_intc_base;
 int davinci_intc_type;
 
-void davinci_get_mac_addr(struct nvmem_device *nvmem, void *context)
-{
-	char *mac_addr = davinci_soc_info.emac_pdata->mac_addr;
-	off_t offset = (off_t)context;
-
-	if (!IS_BUILTIN(CONFIG_NVMEM)) {
-		pr_warn("Cannot read MAC addr from EEPROM without CONFIG_NVMEM\n");
-		return;
-	}
-
-	/* Read MAC addr from EEPROM */
-	if (nvmem_device_read(nvmem, offset, ETH_ALEN, mac_addr) == ETH_ALEN)
-		pr_info("Read MAC addr from EEPROM: %pM\n", mac_addr);
-}
-
 static int __init davinci_init_id(struct davinci_soc_info *soc_info)
 {
 	int			i;
diff --git a/include/linux/davinci_emac.h b/include/linux/davinci_emac.h
index 05b97144d342..19888b27706d 100644
--- a/include/linux/davinci_emac.h
+++ b/include/linux/davinci_emac.h
@@ -19,7 +19,6 @@ struct mdio_platform_data {
 };
 
 struct emac_platform_data {
-	char mac_addr[ETH_ALEN];
 	u32 ctrl_reg_offset;
 	u32 ctrl_mod_reg_offset;
 	u32 ctrl_ram_offset;
@@ -46,5 +45,4 @@ enum {
 	EMAC_VERSION_2,	/* DM646x */
 };
 
-void davinci_get_mac_addr(struct nvmem_device *nvmem, void *context);
 #endif
-- 
2.18.0

