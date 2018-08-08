Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B3C97E422
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbeHHRyL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40471 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729655AbeHHRyK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id h15-v6so2399395wrs.7
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8UdSyH1lOqINYeO+r/ZsFoxAxuXuxmjPqoo8dlrZx/U=;
        b=C2WWfRY4OGQFixB3NWDziO1RloZdC5VKqUI28ihiyz/MSJfGy4l7a6UducfkAOKq67
         UsOMLJx1OlZBcl3LuNHmZS3D0ixwzGNI59pu+2Klhl/y/dRAwLh/lmEAsW6F/n8VU+zx
         dRb8PIoIT4Y+7jzPPLPUyK/FRX/aGyLrZ9PqhHJDzmbUWiIXrHzHw9O5OwDSzhtMlg7T
         VX330EfpGsSD+uQMIeb8DGKeW7hMsl+YnAkX8djOaYxJeLiFmCmO1LsJRS92JokpUIks
         24mA6u1gyxXTFxGGCrJHSxVSK5yx2bmHxL6WAgy6wNn+zJ5YeyVL9omuAKd6J4O/XV1y
         vc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8UdSyH1lOqINYeO+r/ZsFoxAxuXuxmjPqoo8dlrZx/U=;
        b=iSsz83OkzlWEYYhd7enKbyAFzmmL9SsE2yENevpubP+hU0eJE0t8oN/AJIMLtAb+fF
         FCb/XNt85uB5DD2zC9c3TmkUcisSWQAXqAxVDqpHryYqL1D7egKvRWWupz0qSL/Pbars
         pbxKrXDJc6JWLi13Iw6xSJSmeDGJ25dgGPb/QmyN997985tNBUtI4Yj/5rnIr3etlZ2u
         Cp5ikCIf6zFhf4C6S6s5yJrsBJJGA1fd6O3fYTo5ZJzpTjKhXL88+bUbLpmH7l0AJz6C
         9h/H2zvVahKBI8ypsoIox+7LqTdXhQccpBl/V8boTPmZYh3blf94fESXUNwqyLHLnSC3
         FxCg==
X-Gm-Message-State: AOUpUlHAWQF+39gz3dMsXvZEaMA1W5nawDXEAVv9illzSfAZwtcpvdjY
        /8mt62jFXX6uFw6whCi5v1efGA==
X-Google-Smtp-Source: AA+uWPzK9N3srWQOKZizp+e36Bb1tujnskBeB665f8ip+bKvJb9nbUnCV0l1aVqnV0EM3B2GUzqrng==
X-Received: by 2002:adf:8362:: with SMTP id 89-v6mr2320257wrd.147.1533742438492;
        Wed, 08 Aug 2018 08:33:58 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:57 -0700 (PDT)
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
Subject: [PATCH 16/28] net: davinci_emac: use eth_platform_get_mac_address()
Date:   Wed,  8 Aug 2018 17:31:38 +0200
Message-Id: <20180808153150.23444-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now support nvmem in eth_platform_get_mac_address() and all boards
have the mac-address cells defined. Stop getting the MAC from pdata
and use the dedicated helper.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/ti/davinci_emac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index f270beebb428..5d01bad4baa5 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -1700,7 +1700,6 @@ davinci_emac_of_get_pdata(struct platform_device *pdev, struct emac_priv *priv)
 	const struct of_device_id *match;
 	const struct emac_platform_data *auxdata;
 	struct emac_platform_data *pdata = NULL;
-	const u8 *mac_addr;
 
 	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
 		return dev_get_platdata(&pdev->dev);
@@ -1712,12 +1711,6 @@ davinci_emac_of_get_pdata(struct platform_device *pdev, struct emac_priv *priv)
 	np = pdev->dev.of_node;
 	pdata->version = EMAC_VERSION_2;
 
-	if (!is_valid_ether_addr(pdata->mac_addr)) {
-		mac_addr = of_get_mac_address(np);
-		if (mac_addr)
-			ether_addr_copy(pdata->mac_addr, mac_addr);
-	}
-
 	of_property_read_u32(np, "ti,davinci-ctrl-reg-offset",
 			     &pdata->ctrl_reg_offset);
 
@@ -1819,8 +1812,11 @@ static int davinci_emac_probe(struct platform_device *pdev)
 		goto err_free_netdev;
 	}
 
+	rc = eth_platform_get_mac_address(&pdev->dev, priv->mac_addr);
+	if (rc == -EPROBE_DEFER)
+		return -EPROBE_DEFER; /* We'll get the MAC address later. */
+
 	/* MAC addr and PHY mask , RMII enable info from platform_data */
-	memcpy(priv->mac_addr, pdata->mac_addr, ETH_ALEN);
 	priv->phy_id = pdata->phy_id;
 	priv->rmii_en = pdata->rmii_en;
 	priv->version = pdata->version;
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
