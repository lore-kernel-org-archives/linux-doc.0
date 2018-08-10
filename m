Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F07B7D923
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbeHJKep (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:45 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:33262 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728208AbeHJKep (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:45 -0400
Received: by mail-wr1-f51.google.com with SMTP id g6-v6so7494705wrp.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HVcV+D9oE5OwLHTLo/qKvbgd6WX5oO3G+bmGYBBY+LM=;
        b=bhFAgZ5hHjjTrwrl1iOBbafXfBDZiTPhqPFI3NNgnioBKDQ9cc/2d9WiTpA060hA31
         dvp9PdgR/uW2GaC/OfRLieKDN2frM/haHRGaGTfW61Gb9dqlssGutnim8Wr0rUiK2KWH
         xHoM/SWqCl0FxIazn4IPWAC1uvLuPN/QbBUwVgXVuI6CbZvMWJRcAqYn2UJMZ+Jrg41p
         ZIuLV4F6xKtofc6znzidBFHaUZ458NXJnukAgkkbkI82sWb5xlYEMW2o0b58czd1clnl
         j+Drc3J+KuvjnViTb2VpM2V0LP2JjL+1wK7CiLodtIYRrBzFwebqEbHStVGZF/kmONeF
         POlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HVcV+D9oE5OwLHTLo/qKvbgd6WX5oO3G+bmGYBBY+LM=;
        b=qLxF8Z4aB1M6AzFhMkHJnDKO40oiZWTSDmPGk3gWMOCJdkSWhxgzpWpFwXFSmf0P59
         r2iYTN2udZAux7ZV7eGeA6qlmruARWmrIGjZvwIUmXl3vX3n+nbyoKiv+sQ8LrAtNuJ3
         t8+88fX2xY4fAh8b1T74ESxWHB/bXh71+rH/tP4sERG+irXvsf7JOHmRosvX1+QFKTT2
         iub3yY2/Ij64TgtTJ5sBbcq/EHhWUEft6u1B2hTy88dsmJ8HetnmBUsip9HGo2lLB9xC
         GiOXuaZrcZ1bRzQ9LxNi5JV8EWS9gXpp5LirejGdjrikqSj71rXk2Xl9vrovEVDYFQSx
         FeOw==
X-Gm-Message-State: AOUpUlE8EXkF91YWkpBfM50NJjvmiZOER+m36IdIzaAk/Djo2FXBbrRf
        tY3+X0Q7oniwW24EBoucsdu6UA==
X-Google-Smtp-Source: AA+uWPyBdjVAqNR/3A8sojlKFsQmP5DkUM6AEbLZ9dYbBKm/fehxDFZKubc2KMb2IL1kO7W4wKMBJA==
X-Received: by 2002:a5d:458b:: with SMTP id p11-v6mr3508671wrq.122.1533888359309;
        Fri, 10 Aug 2018 01:05:59 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:58 -0700 (PDT)
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
Subject: [PATCH v2 14/29] net: simplify eth_platform_get_mac_address()
Date:   Fri, 10 Aug 2018 10:05:11 +0200
Message-Id: <20180810080526.27207-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need to use pci_device_to_OF_node() - we can retrieve
dev->of_node directly even for pci devices.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/ethernet/eth.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index ee28440f57c5..7f08105402c8 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -530,11 +530,7 @@ int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
 	const unsigned char *addr;
 	struct device_node *dp;
 
-	if (dev_is_pci(dev))
-		dp = pci_device_to_OF_node(to_pci_dev(dev));
-	else
-		dp = dev->of_node;
-
+	dp = dev->of_node;
 	addr = NULL;
 	if (dp)
 		addr = of_get_mac_address(dp);
-- 
2.18.0

