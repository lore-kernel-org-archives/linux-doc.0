Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF2A27DE59
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbeHJKev (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41081 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbeHJKeu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id j5-v6so7455897wrr.8
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8UdSyH1lOqINYeO+r/ZsFoxAxuXuxmjPqoo8dlrZx/U=;
        b=mt/KXDC4nfdwHLn2XlDBPM4y81ESlrV3OFQmRIJZkcXOGIiUGUng/VBMv8ne3TnYv/
         AvKnsmK7kSXDKQpprVm4gAMTFMkx/qqFRaME6gp/TWgjRkeX6F57yIdIkvtnI16GWvyW
         qo2U5hnq5J1zzVsY8RFdkrOUyndUEOpQ4osdUWOZAO/uu9t2gNgoatiIyHyyH1k8bc+0
         vr6GHJJkNiqTgZCHTDC14/Wx6wiNwKD5BMJV0W0m5E9sExbUqWganevGnP9mSmw2N/TO
         tHJm2ssDpmKuKzflbSb1q1g8LcF5w9GyRfGnjNs93IaD/bDN6iJuZ7zU068+hpt4Mc++
         noEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8UdSyH1lOqINYeO+r/ZsFoxAxuXuxmjPqoo8dlrZx/U=;
        b=m/fw3TVowNU0oFjRl9c8nSBKm4QuYx4DU9jHRTwA79wBxL/5Ro0ZIK0foJZJfntUCJ
         Ihl0wZdG14tPqjurZ0JCvXS3meKsZt2Dkf/GRBeFBmZt6KlLhC+kCsQj8H1+1X2gKEvI
         0EE/na0h8CRmy0LaCFU0xRrxTSKMfC2aWfcJYVUqtX7Cj3xF98fIxfgn1eF4WPhT4VCP
         R/jTpKLCFatyk+37Y3uOKWH46hBiEZYcYrrvUe4f8UyeL1Thl8xr/3PtZXlroV/nnW9j
         sbIs8g9q4yxWi7qy6lsapLQhFm4ofJtMLGRs0H/HYoF2sgLKZA+sUVQPHdfLfgkaHrau
         CbJg==
X-Gm-Message-State: AOUpUlGfCRJtCee9plppANTI+guCG6jKefvJlwYyLQ4HsZIi6bCLMfKJ
        VWEFSVnmlEvq/3SVTAqvFKQ7Ng==
X-Google-Smtp-Source: AA+uWPwXvALBFOFWa75Ks0v22iEu5lNMBTlP+OzTuPP/ZK9R0ES25xlWVEHr5kXFii1o2Do3GQC7Tw==
X-Received: by 2002:adf:fe8f:: with SMTP id l15-v6mr3583225wrr.165.1533888364864;
        Fri, 10 Aug 2018 01:06:04 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.06.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:06:04 -0700 (PDT)
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
Subject: [PATCH v2 17/29] net: davinci_emac: use eth_platform_get_mac_address()
Date:   Fri, 10 Aug 2018 10:05:14 +0200
Message-Id: <20180810080526.27207-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
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

