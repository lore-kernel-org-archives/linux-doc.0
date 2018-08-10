Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 29C067E3E4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbeHJKg1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:36:27 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:36655 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbeHJKey (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:54 -0400
Received: by mail-wr1-f50.google.com with SMTP id h9-v6so7488150wro.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7hGAs3eonwoCQnALsYwyOyrZG60JWD61CbSNH1Ct6wM=;
        b=TW52wLxb6U1S+RUIaPLZ6sLVh1ll5ayu4Tyxowh2V1yuOjo6qbPK8H0aTaBmRKlnFv
         SrS0jHot3Dwd6t0U6JIwAFAPBdoVjIW3SPmji9a8Z+EJSOIkCSrFS8F/K8Ezh9vI/ctZ
         +mxkzFJR65rNeIiq7Jt3JG7QLORDmLsbuCCSQsUycS+22h5v7szEm1I+E/GOE+mX7MV1
         p7o5JN8tFkOE7r7rfpNe4BR73GiWTKa9GRuBICd8/bOwByErKcAD7r31paEBNHbtkySl
         DrGTWalChwpg2xfIzRYexE470R+mlhJWo+GinWS31pX0rx5vZMqe4s06IE73hLzu+CQw
         ii1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7hGAs3eonwoCQnALsYwyOyrZG60JWD61CbSNH1Ct6wM=;
        b=HZayLCzq+c1IPw/CaxVPn3Ixmol0aeotxNjgavfP9gihbnJ38VGgjBIqnJM22ybWPQ
         KRpD5rVtElhnNHSzZSy5RzkPqs00ohhbw/dgyVf8dGveDxZkaACi5nm2/F/CAJm+vpJj
         ICULTHWcbanJWEvdCuaIe1eKQkemoMNDX55ewpgbpYWstf1Z8Cj8tFOYlxLYpPDZ/HpU
         maM9Vi/KKr33sGP1HBT1t+M9lsK93ibE7fiEkXcosdVfkwsUqT8+TcU0iURigiYOQoYt
         lQEU4t9RxhTXjRihzcPyoqTTglSIG61INNr2z0bOgiu7+0XD497rWTgOLQMgPcwHFSF7
         xz/A==
X-Gm-Message-State: AOUpUlG+gSz4cxXTpa/86qPX5CDR3XRJzicAC2XUNAkDj5awtuy5OCDz
        lW29wXrvtpKkFeCZgyP01nlX8A==
X-Google-Smtp-Source: AA+uWPzG5KCSYEWGj/jUKsuWmN+eyaYzGxbxySiyML7PJw6E/g88i9QHvKbm+0DWADIM/WiOi2mQOQ==
X-Received: by 2002:a5d:41c1:: with SMTP id e1-v6mr3517699wrq.25.1533888368546;
        Fri, 10 Aug 2018 01:06:08 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.06.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:06:07 -0700 (PDT)
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
Subject: [PATCH v2 19/29] ARM: davinci: mityomapl138: don't read the MAC address from machine code
Date:   Fri, 10 Aug 2018 10:05:16 +0200
Message-Id: <20180810080526.27207-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is now done by the emac driver using a registered nvmem cell.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-mityomapl138.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index 48a9bae76e4a..35b2b6068a7a 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -120,7 +120,6 @@ static void read_factory_config(struct nvmem_device *nvmem, void *context)
 {
 	int ret;
 	const char *partnum = NULL;
-	struct davinci_soc_info *soc_info = &davinci_soc_info;
 
 	if (!IS_BUILTIN(CONFIG_NVMEM)) {
 		pr_warn("Factory Config not available without CONFIG_NVMEM\n");
@@ -146,13 +145,6 @@ static void read_factory_config(struct nvmem_device *nvmem, void *context)
 		goto bad_config;
 	}
 
-	pr_info("Found MAC = %pM\n", factory_config.mac);
-	if (is_valid_ether_addr(factory_config.mac))
-		memcpy(soc_info->emac_pdata->mac_addr,
-			factory_config.mac, ETH_ALEN);
-	else
-		pr_warn("Invalid MAC found in factory config block\n");
-
 	partnum = factory_config.partnum;
 	pr_info("Part Number = %s\n", partnum);
 
-- 
2.18.0

