Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42EF67E416
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbeHHRyH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42786 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbeHHRyG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id e7-v6so2390141wrs.9
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GhxBsIfK86giZ9cjSjQgHpsWxFiMvzhSUErcIymDujg=;
        b=ZqPg9nBeYD7Jj4LbD/qxHP8mdIaP9ehKNQ4AiXOn4oOR+a5ZAukUE+JSxk5Awm7see
         4zC84eGwAAGMLSh2/XuOWxIK/te5rwrHxpT/bW0eu4kwE+HgrDCmjcnYhBbK1Qg0g0iK
         olWgZ0mraa0LMdGszgAYyHjeeetJwyAyZbU1zQSSiUKih9toBsrwLiDr1y6F05nH50pt
         xTGMmDnYdUzQv6qqFh2GzahD1ZQ82M0164l1drphkhkbh33+AxbLUcfoQCOitNqO3oOr
         Us8whYMDibcOLJ0MkFa3pnVGRkdt1rdTb+bEsP68ccMWss+wLl39D21hrtsygCAddcBi
         HsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GhxBsIfK86giZ9cjSjQgHpsWxFiMvzhSUErcIymDujg=;
        b=i+uChlTrNfXbgNOSHXXZXjPTTbzh8eZIicjr9eXTiWtXTJrK/VwaLkhrqJm78HR6WI
         NpaG12qxLrhZUQt34XJbGHytM7U/Be9v01l4YQkNrHJ61nrAVyaS5geqLnBXx2cdWo62
         gjLEjNTXlo8gTGCuRRYJ0W6mnh4S7/mIGa5D8/AKCQncPZnT+ABByvI1Nl7pkiECk5kw
         bCKbQ4SEKUGPCno9Exhctp8BgPUAfjI336NQrUbATmbp4O1ISlwTZlueevfzFV45Wkfl
         vm9gYyD59NwCOxgttG1QAC1oSQvVD6g2tkLsU2zpZkXtEe6HW+wp4pc20EKG0NZA76MU
         KVgg==
X-Gm-Message-State: AOUpUlF2/yn71PM7x1ipWwY8Ab1PnR73QSs+SQM7+/efaCT/rcB/sXXD
        pNb5uEBggKGVal7mJZPdlb2gwg==
X-Google-Smtp-Source: AA+uWPytVmDjddx7tRYYs/vrCyUbG7+F7GSlQDH5jICevieM/gzTCUd/yRKlDppGuaWlecpoKEfSTg==
X-Received: by 2002:adf:fcc3:: with SMTP id f3-v6mr2213453wrs.216.1533742434493;
        Wed, 08 Aug 2018 08:33:54 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:53 -0700 (PDT)
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
Subject: [PATCH 14/28] net: split eth_platform_get_mac_address() into subroutines
Date:   Wed,  8 Aug 2018 17:31:36 +0200
Message-Id: <20180808153150.23444-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want do add more sources from which to read the MAC address. In
order to avoid bloating this function too much, start by splitting it
into subroutines, each of which takes care of reading the MAC from
one source.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/ethernet/eth.c | 48 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index ee28440f57c5..cf54cdf042b7 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -525,26 +525,52 @@ unsigned char * __weak arch_get_platform_mac_address(void)
 	return NULL;
 }
 
-int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
+static int mac_address_from_of(struct device *dev, u8 *mac_addr)
 {
 	const unsigned char *addr;
-	struct device_node *dp;
+	struct device_node *np;
 
-	if (dev_is_pci(dev))
-		dp = pci_device_to_OF_node(to_pci_dev(dev));
-	else
-		dp = dev->of_node;
+	np = dev_is_pci(dev) ? pci_device_to_OF_node(to_pci_dev(dev))
+			     : dev->of_node;
 
-	addr = NULL;
-	if (dp)
-		addr = of_get_mac_address(dp);
-	if (!addr)
-		addr = arch_get_platform_mac_address();
+	if (!np)
+		return -ENODEV;
 
+	addr = of_get_mac_address(np);
 	if (!addr)
 		return -ENODEV;
 
+	if (!addr || !is_valid_ether_addr(addr))
+		return -ENODEV;
+
+	ether_addr_copy(mac_addr, addr);
+	return 0;
+}
+
+static int mac_address_from_arch(u8 *mac_addr)
+{
+	const unsigned char *addr;
+
+	addr = arch_get_platform_mac_address();
+	if (!addr || !is_valid_ether_addr(addr))
+		return -ENODEV;
+
 	ether_addr_copy(mac_addr, addr);
 	return 0;
 }
+
+int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
+{
+	int rv;
+
+	rv = mac_address_from_of(dev, mac_addr);
+	if (!rv)
+		return 0;
+
+	rv = mac_address_from_arch(mac_addr);
+	if (!rv)
+		return 0;
+
+	return -ENODEV;
+}
 EXPORT_SYMBOL(eth_platform_get_mac_address);
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
