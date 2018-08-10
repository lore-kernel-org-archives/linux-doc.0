Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DACF77E41D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbeHJKh3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:37:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33172 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbeHJKek (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id g6-v6so7494450wrp.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bxzAHxBZXjRxHAL9jtG/FK0HAvx9UzeP0h5va0TWUB0=;
        b=L1fUj1hxtvDEdmNJU7oSl9Zu87psQ9mN+BYuQMmV9OdAN1nOBQ+AEFM9fFW5ry0wTQ
         QZHF7LAtJ8oBD7VzPOPwcOkALe5JGmaB94B5fBCyNAFd6J/D0/+brCg1r98mH1ty5zPH
         wr4DdkYYDJGOIM7oIGesWQDssRhswq6aeudoxfAN8OJTcgMpLNTRPZt1fm8gRAOFdH1P
         mogJFjE9ERXOPDa7N+QSQvQqROs0B9xCPyOAikWsYsD3zYGoZi9n9zhhvSlZfWrXBToh
         8+CBFf6IUu+Jap6RecJw+TnTmAoRqAV/unfwokpnk85Cd2U+OKVesvbOfoqh02sOP8+M
         xEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bxzAHxBZXjRxHAL9jtG/FK0HAvx9UzeP0h5va0TWUB0=;
        b=ciTkOVSqfEWD+SFacgfgO2oRX36/msCDuC5SBNoWoj6mnC+ac7nu9INdaDaT2KuAba
         uYTeFL1USA1sawuzhcSfC7mU4t1vn1RjQKrh2Ozd/q8V5n1bzQhBi13BEMY5MTlY8LmG
         JkB8/tmAKVftlCZGngCd1xDtQ7XrjxUDDqiz8Mzd4dKD9vYXJkh28uZE1lCDLY09beGu
         OsOGLobd0mBF3cwFCUh2MyejxJnRbYBh/P4CX68YphE8bRiYAZjT+VSUw4l8Mv6z1UW2
         WKE5LmyGO0KZktMJuZZg61+3RPFyyLb2dTs/cutrq1Z78JtWh2vW8QIaKEfYrgL5WIdV
         0vDg==
X-Gm-Message-State: AOUpUlHc+oVf/3+6HokDGPwin817dmeNPvm54AnsctqA732tp9BxpFrg
        PdRQi0wD24kf/WQABqmv4V4v9w==
X-Google-Smtp-Source: AA+uWPwf+1APZ1HtxQTawxEl+j6zYLbTuPRDiWpH5+JVRRKXzlzHEriNln/XMJiahiFWrLevZ538Uw==
X-Received: by 2002:adf:9304:: with SMTP id 4-v6mr442888wro.48.1533888353574;
        Fri, 10 Aug 2018 01:05:53 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:52 -0700 (PDT)
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
Subject: [PATCH v2 11/29] ARM: davinci: mityomapl138: add nvmem cells lookup entries
Date:   Fri, 10 Aug 2018 10:05:08 +0200
Message-Id: <20180810080526.27207-12-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/board-mityomapl138.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index 37b3e48a21d1..48a9bae76e4a 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -15,6 +15,7 @@
 #include <linux/console.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
+#include <linux/nvmem-provider.h>
 #include <linux/regulator/machine.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/at24.h>
@@ -160,6 +161,25 @@ static void read_factory_config(struct nvmem_device *nvmem, void *context)
 	mityomapl138_cpufreq_init(partnum);
 }
 
+static struct nvmem_cell_lookup mityomapl138_nvmem_cells[] = {
+	{
+		.info = {
+			.name = "factory-config",
+			.offset = 0x0,
+			.bytes = sizeof(struct factory_config),
+		},
+		.nvmem_name = "1-00500",
+	},
+	{
+		.info = {
+			.name = "mac-address",
+			.offset = 0x64,
+			.bytes = ETH_ALEN,
+		},
+		.nvmem_name = "1-00500",
+	}
+};
+
 static struct at24_platform_data mityomapl138_fd_chip = {
 	.byte_len	= 256,
 	.page_size	= 8,
@@ -534,6 +554,8 @@ static void __init mityomapl138_init(void)
 	if (ret)
 		pr_warn("spi 1 registration failed: %d\n", ret);
 
+	nvmem_add_lookup_table(mityomapl138_nvmem_cells,
+			       ARRAY_SIZE(mityomapl138_nvmem_cells));
 	mityomapl138_config_emac();
 
 	ret = da8xx_register_rtc();
-- 
2.18.0

