Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C88CD7E3E6
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbeHHRyF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40463 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbeHHRyE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id h15-v6so2399082wrs.7
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vbd/0hAQ6eCPDyxiTiuvrAkBoIff8s2ba/U1T9sJXTg=;
        b=PR+7YOqiZOzBTyjKf7M66m3klRA/U9weUzmP9+aCiWzkdO6ze1RDxPr1P76HiHU8ZL
         ttgPjdwmRvyHiyB21jsC+Zno32y3TWwxLRC5PXA/48g9E1tQqE3m+l/Gm4fei1FYrcia
         rwv6tI0ol6Z9lxrG22K89NNJiWUErGlR/roY7vDNmq1Iolz6D7Gz9tT4qLkKnVA8SNd8
         9UdR+1wrSH3nYQolNcqRxmYQN5JhOUnhwnymWxXy0OHwMyBBWRU13Pgyc75YP4shcQsy
         HGucNRnRwzuodzwGzXmBnYV3HeDKuOIhS/aeF3JXm5r+VkRSYxTGKzQMtktI87wL/9/n
         +uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vbd/0hAQ6eCPDyxiTiuvrAkBoIff8s2ba/U1T9sJXTg=;
        b=FvNR8iNP7TXiRrCsJ+UpE7Ikvbjbh75hg9viEZ9pxzud10PJ9HbgGcsOpWTm2eORiw
         k/+MpHyikaeLqkDTDOjw4ZWDLTUOLS3b5I0OnRclqNWN+4S0U9onmOks1s4tWL30ghQm
         +hH64s5cDIb0GdTzv5rSpjWQOTJAxxVcFo3ZIUyMR3Ajk5X5qEnd55A3Atb0tH7lkQ/y
         Wu4AH3E0+ox4yc7NQ6nWxh8OckH91xTCuNt9Tllb0DKiDYnadSvL78fTkLZhaZL6TH5I
         Nj0yZgHkcUypwyNCUDpki6xPQqOgibXbLtpAotffbg5ufdE1A64DRD1GAI/8cMx9R7tO
         N7+g==
X-Gm-Message-State: AOUpUlHIy86mBSU86Tnv6mATC8nBjK/ZsQW/u2/dTpF1mXWHrM0ee792
        hthIbnnLOFM9C8aHrGaSiTLcGw==
X-Google-Smtp-Source: AA+uWPxNagFpRt5CCQmRfILD0QzSb04bio2p6FouUI1jwHT1NysHnR44GeKKDUdI2d0f5xqDIab+lg==
X-Received: by 2002:a5d:4147:: with SMTP id c7-v6mr2335638wrq.61.1533742432406;
        Wed, 08 Aug 2018 08:33:52 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:51 -0700 (PDT)
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
Subject: [PATCH 13/28] ARM: davinci: da850-evm: remove unnecessary include
Date:   Wed,  8 Aug 2018 17:31:35 +0200
Message-Id: <20180808153150.23444-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The include file for at24_platform_data is not needed in this file.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 5a634a04ec69..521a26b5c20d 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/i2c.h>
-#include <linux/platform_data/at24.h>
 #include <linux/platform_data/pca953x.h>
 #include <linux/input.h>
 #include <linux/input/tps6507x-ts.h>
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
