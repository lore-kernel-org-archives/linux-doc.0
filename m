Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D06777E417
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbeHHRyc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36257 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbeHHRyb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id h9-v6so2422822wro.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FSHdY6zctlDkYyxEvPBDzCoV80UVARiCoyzJIuK3YLA=;
        b=gAHlXd963WQRDMseqLKzq+CSBwUuAdYlGVYWDDqcgkLvPzZ3mjKXTxscWrDgMJAmWw
         Wvp1LRY0O3YiSP1OyZO+QaPTdvyFcvOc/RAynOtGMzMW0PpIhZEF6KgK4CL5zWWqPY5P
         PmmEVNzDs+WmoI+9X3zxmXtjAvTiCKI5N2bl5i93TNntKd7yoGuae56rPGG7Pgb9d1Wt
         t1x+UghQ8ebVKYvLrTEojYZ+A0cJhPxLTvdM5HJ7W3RDN/r0uJk2STc7Qu6MPyapwKRO
         TJOsU8Z+71nAQZlomaSN0ogD+f+2mDU43YpW/2H0fMM68C6TUVd6OZpHtWGpeY00WUB2
         tomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FSHdY6zctlDkYyxEvPBDzCoV80UVARiCoyzJIuK3YLA=;
        b=Shc43d9nmtzlfYZ5RHSl0N+kIlXZuX2tdc68iSQUPn6FxWn3QcW7XYRUukCFrfO8p2
         749lIVbXME1ery07l6by6ctK6S9xajIU9kTxmKh2agLmXwWwGXuuFPaqPUU5iD9MMVKK
         Ez5e1a3eWDcEgUQn8yE2SyNG4qCsYgqlkiup3qe43YaeF5ocgwNLFUjLlE06jHPJL9/X
         ag1TBFeS7tSyOYHA/ycKU3NjfGUJATmfEgpOzP6l/ATvNvOzulXw8ti22t7aWxu93u4n
         hugN1tn6BHFH4EDGNuREM8SDBwSOWKSVlXPF4Lzia1UJMU5i1TMA6/3WJSTctuQMeKgO
         SfVg==
X-Gm-Message-State: AOUpUlGqelV/LxzYb1RViNOTip5qwxKe5dc3drvDUtFCPR/Xk+xgO7n/
        vZxa7KzJBsvPe24OOosZmoC3wA==
X-Google-Smtp-Source: AA+uWPyUK+ZAquD4IIWwhTosIbWrpsz89OnHAL4DrHBb/QfLzilJnt0DZ6qPws2spLmz0eVqRpf0JA==
X-Received: by 2002:adf:f790:: with SMTP id q16-v6mr2236663wrp.86.1533742460112;
        Wed, 08 Aug 2018 08:34:20 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.34.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:34:19 -0700 (PDT)
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
Subject: [PATCH 26/28] ARM: davinci: mityomapl138: use nvmem notifiers
Date:   Wed,  8 Aug 2018 17:31:48 +0200
Message-Id: <20180808153150.23444-27-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Stop using the at24_platform_data setup callback in favor of nvmem
notifiers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-mityomapl138.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index 5c0a0557a361..17b67e26bc0e 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -15,12 +15,14 @@
 #include <linux/console.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
+#include <linux/notifier.h>
 #include <linux/regulator/machine.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/at24.h>
 #include <linux/etherdevice.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 
 #include <asm/io.h>
@@ -116,10 +118,15 @@ static void mityomapl138_cpufreq_init(const char *partnum)
 static void mityomapl138_cpufreq_init(const char *partnum) { }
 #endif
 
-static void read_factory_config(struct nvmem_device *nvmem, void *context)
+static int read_factory_config(struct notifier_block *nb,
+			       unsigned long event, void *data)
 {
 	int ret;
 	const char *partnum = NULL;
+	struct nvmem_device *nvmem = data;
+
+	if (strcmp(nvmem_device_name(nvmem), "1-00500") != 0)
+		return NOTIFY_DONE;
 
 	if (!IS_BUILTIN(CONFIG_NVMEM)) {
 		pr_warn("Factory Config not available without CONFIG_NVMEM\n");
@@ -151,8 +158,14 @@ static void read_factory_config(struct nvmem_device *nvmem, void *context)
 bad_config:
 	/* default maximum speed is valid for all platforms */
 	mityomapl138_cpufreq_init(partnum);
+
+	return NOTIFY_STOP;
 }
 
+static struct notifier_block mityomapl138_nvmem_notifier = {
+	.notifier_call = read_factory_config,
+};
+
 static struct nvmem_cell_lookup mityomapl138_nvmem_cells[] = {
 	{
 		.info = {
@@ -176,8 +189,6 @@ static struct at24_platform_data mityomapl138_fd_chip = {
 	.byte_len	= 256,
 	.page_size	= 8,
 	.flags		= AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
-	.setup		= read_factory_config,
-	.context	= NULL,
 };
 
 static struct davinci_i2c_platform_data mityomap_i2c_0_pdata = {
@@ -546,6 +557,7 @@ static void __init mityomapl138_init(void)
 	if (ret)
 		pr_warn("spi 1 registration failed: %d\n", ret);
 
+	nvmem_register_notifier(&mityomapl138_nvmem_notifier);
 	nvmem_add_lookup_table(mityomapl138_nvmem_cells,
 			       ARRAY_SIZE(mityomapl138_nvmem_cells));
 	mityomapl138_config_emac();
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
