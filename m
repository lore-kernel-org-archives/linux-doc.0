Return-Path: <SRS0=nASp=AD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F77C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Jun 2020 10:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADACF206F1
	for <linux-doc@archiver.kernel.org>; Mon, 22 Jun 2020 10:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="hPCSBYPi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgFVKCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Jun 2020 06:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgFVKBS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 06:01:18 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CB4C061797
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a6so4145919wmm.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SA+ksrlspcBtk66ickfbWi5/X69plQETLqM+T7sqDOM=;
        b=hPCSBYPijk+oW7o3W3ojF3NAaYsD4JrRPsGlfOOBzQ4ThECSIaaifu8iSYPR7zbUAx
         giQ4sowH3znExtSO3S964zh5IyteuZGXmP9B2ZvExrbuG0lv3RnqMa0dbDx7oKT3Cruf
         ntFtCt/KtwVdleh2QZcz+vD9bEurGJjeVbuXPkyeyA87kxRvFoIssYR99lkRq25sp0Dy
         8ME3z0/l/PLLTultbtzKIRLt1ie8TS/eRQs7WOUniJkv9YG+Ya35j/vswWIOOkBzSz+Z
         KPipplT5rhQD8Nb/E1vu5Mffd1y2DmSUKnz0Ux1Df2rzIAqZgpQCiOI37E2WBb24Fa9I
         KUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SA+ksrlspcBtk66ickfbWi5/X69plQETLqM+T7sqDOM=;
        b=MlS8ibwOy6crGw21QKkuWdXhqjPHDLTT3vbXpWtwQ8zPbVt6HpOWiz3hCO4+1N+y39
         ebm8GLdfffFSwaNaa3RlCzwLrdFl2x7A2SExWWmAW8BNb/BJtlcIpvloRtdvMjww+nFo
         0hfRqOZOUFTZYAomG6nQrnq54aJtFXhAz54qDaMokaJVep3HUEXTZ7DSQQKIJhaqugqV
         8IkmpLS5dJrbN3qeKkYM4M3W4+NeZ6GgwGWMzsb6i3tgu/fi4DF4aR7zCIJabWplMFKH
         HoJpEKQUY2kJlBOWDTH2vx4zc7FTu9eAXgtkLUt1S4yKczRaer6e5Fc6M/XxKOcUGGBv
         +NCA==
X-Gm-Message-State: AOAM5336ARfShf+QZvCnXYdX7DYlFfRVie58vYwp2VsTQ71yPSf/xz0P
        Tgrb2GmIhGAwFl5AUqGw62lLYg==
X-Google-Smtp-Source: ABdhPJwWuhZqPJe1EH2uJKbIx2fxGg7cPQA+kFKd21eTb++TacoGNccIXkK+VSOvahqdHB0+R/2MHw==
X-Received: by 2002:a1c:bc55:: with SMTP id m82mr10040949wmf.92.1592820075474;
        Mon, 22 Jun 2020 03:01:15 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x205sm16822187wmx.21.2020.06.22.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:01:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Realtek linux nic maintainers <nic_swsd@realtek.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 06/11] phy: un-inline devm_mdiobus_register()
Date:   Mon, 22 Jun 2020 12:00:51 +0200
Message-Id: <20200622100056.10151-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200622100056.10151-1-brgl@bgdev.pl>
References: <20200622100056.10151-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Functions should only be static inline if they're very short. This
devres helper is already over 10 lines and it will grow soon as we'll
be improving upon its approach. Pull it into mdio_devres.c.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/phy/Makefile      |  2 +-
 drivers/net/phy/mdio_devres.c | 18 ++++++++++++++++++
 include/linux/phy.h           | 15 ++-------------
 3 files changed, 21 insertions(+), 14 deletions(-)
 create mode 100644 drivers/net/phy/mdio_devres.c

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index dc9e53b511d6..896afdcac437 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -3,7 +3,7 @@
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o
-mdio-bus-y			+= mdio_bus.o mdio_device.o
+mdio-bus-y			+= mdio_bus.o mdio_device.o mdio_devres.o
 
 ifdef CONFIG_MDIO_DEVICE
 obj-y				+= mdio-boardinfo.o
diff --git a/drivers/net/phy/mdio_devres.c b/drivers/net/phy/mdio_devres.c
new file mode 100644
index 000000000000..f0b4b6cfe5e3
--- /dev/null
+++ b/drivers/net/phy/mdio_devres.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/phy.h>
+
+int __devm_mdiobus_register(struct mii_bus *bus, struct module *owner)
+{
+	int ret;
+
+	if (!bus->is_managed)
+		return -EPERM;
+
+	ret = __mdiobus_register(bus, owner);
+	if (!ret)
+		bus->is_managed_registered = 1;
+
+	return ret;
+}
+EXPORT_SYMBOL(__devm_mdiobus_register);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 8c05d0fb5c00..62149945c5b3 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -313,20 +313,9 @@ static inline struct mii_bus *mdiobus_alloc(void)
 }
 
 int __mdiobus_register(struct mii_bus *bus, struct module *owner);
+int __devm_mdiobus_register(struct mii_bus *bus, struct module *owner);
 #define mdiobus_register(bus) __mdiobus_register(bus, THIS_MODULE)
-static inline int devm_mdiobus_register(struct mii_bus *bus)
-{
-	int ret;
-
-	if (!bus->is_managed)
-		return -EPERM;
-
-	ret = mdiobus_register(bus);
-	if (!ret)
-		bus->is_managed_registered = 1;
-
-	return ret;
-}
+#define devm_mdiobus_register(bus) __devm_mdiobus_register(bus, THIS_MODULE)
 
 void mdiobus_unregister(struct mii_bus *bus);
 void mdiobus_free(struct mii_bus *bus);
-- 
2.26.1

