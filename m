Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5927E7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbeHJKex (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41085 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbeHJKew (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id j5-v6so7455973wrr.8
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EjOQubnQTroWVxsDBUM1JXSo0fAS57WaAUjmLBb4Sws=;
        b=slxAavyRYIQAKAyGAcvJcsdh4bzGKFYXvueiQKixAAkrgMWIfSf1b7VJfMW8yml9CP
         OlkK3rH0fn7Cp+JOjH+OwKI3DlTgq14HaQgshBSfsWcCVIxRtuP1Tb8j4e1sh3PgBane
         I5druFmkEsk+6QWmtgkkzuNEX3y6ct8hPvQl+trAkKGjltR0bN4am01ohGLiYfWiIVHf
         mP1hXPsUie4ZzSKNpP0Ba5pHkzO08Gz7ktUz2eV5J29se9aqmHvVO7Z3qIYUxrUcfOlz
         BmrOC1ajt2D1hEHzj3h5Omy4PBimrql7pMsm5V3KdV2T1VuHIvws9axLTyMd2zvu0LW2
         Lhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EjOQubnQTroWVxsDBUM1JXSo0fAS57WaAUjmLBb4Sws=;
        b=pTFiOLRKEIDNhUJ3y7JLPkwGXagVlxgxWHr4cMwYGki6PiFAr1pn3K4pq15dLGYrUc
         CAe4xYWLhj37j7EivbV/G1aWyEMBH5wmjSLrKIc2fceLu/U18XV/KLqN+frE+cP6Uxbp
         zT6fpGZhSDIRJr9mpC7Ncb9pXPqHUBE1EMCo6LTW/QZI8MchHsbdVGzt5ma8OqZ/4DLl
         xTeVVKFtZYXwJiZEGds/l4vrvq7VaFy/5ZYiJpqkCwcmODNFz8KV/Po19PWgOZ+AdO47
         desWfzEy1Z8DAnunyDNmdfNA4u+OMnYQ5ztebjilwtPmnLvbrF4WB6+ElNx2VtvMxIye
         70aQ==
X-Gm-Message-State: AOUpUlG8K8kgewlqczuBCSXtw8jvCW1exr78bi/gVkifcM1HShDIPJaj
        pT0iEwXidplvLE0CvFV6AjmJ1Q==
X-Google-Smtp-Source: AA+uWPy4GNYeh2WzvM+2T0Bc7L9+oHxywgRRtH1zE1aqpVG7uIW5FR9RKpaa87lEDy5+MnJSrszRTQ==
X-Received: by 2002:adf:8385:: with SMTP id 5-v6mr3547900wre.13.1533888361189;
        Fri, 10 Aug 2018 01:06:01 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:06:00 -0700 (PDT)
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
Subject: [PATCH v2 15/29] net: split eth_platform_get_mac_address() into subroutines
Date:   Fri, 10 Aug 2018 10:05:12 +0200
Message-Id: <20180810080526.27207-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
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
 net/ethernet/eth.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index 7f08105402c8..d01dd55de037 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -525,22 +525,50 @@ unsigned char * __weak arch_get_platform_mac_address(void)
 	return NULL;
 }
 
-int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
+static int mac_address_from_of(struct device *dev, u8 *mac_addr)
 {
 	const unsigned char *addr;
-	struct device_node *dp;
+	struct device_node *np;
 
-	dp = dev->of_node;
-	addr = NULL;
-	if (dp)
-		addr = of_get_mac_address(dp);
-	if (!addr)
-		addr = arch_get_platform_mac_address();
+	np = dev->of_node;
+	if (!np)
+		return -ENODEV;
 
+	addr = of_get_mac_address(np);
 	if (!addr)
 		return -ENODEV;
 
+	if (!addr || !is_valid_ether_addr(addr))
+		return -ENODEV;
+
 	ether_addr_copy(mac_addr, addr);
 	return 0;
 }
+
+static int mac_address_from_arch(u8 *mac_addr)
+{
+	const unsigned char *addr;
+
+	addr = arch_get_platform_mac_address();
+	if (!addr || !is_valid_ether_addr(addr))
+		return -ENODEV;
+
+	ether_addr_copy(mac_addr, addr);
+	return 0;
+}
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

