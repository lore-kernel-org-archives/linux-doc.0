Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7724CC0015E
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 11:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbjHKLKk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234867AbjHKLKj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 07:10:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6857CED
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 04:10:38 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so29761321fa.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1691752236; x=1692357036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/9oPiHmjQ4FsK5HpEZ0bkWyRg1lCyJ+ZeEBx0bVH60=;
        b=CcjjxBIkpi4QeXqsvQL0KtQXy+0epRLpYKeH4xDRsAd6ZES3tJ4a45AsjPk+qmxM1i
         QCBvyG6d7KqfxTFUlQDWCpbhbuynJGJgLzk1J/LLk8JX2UjwCWw+jTfZSSXPWNKDUVO7
         gJUrerX3NLVS2imxi1ZFjgVT3ttkIVCe1um5BqBh5aQZT/Hckq6opTg25yaCdxSC4E+U
         ggMxdgq58hb59q2Y+iZzlYL+XpWm4O1EVBECVbKQlr1CxfE5up5rDVA1pd49MiN2Tw3j
         g2R61bCffGNIGaD5kzie6kCrYbe3GdVZqxT7doo9+hPgobgbSAokceEgrtkc2m/T1wBl
         pbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691752236; x=1692357036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/9oPiHmjQ4FsK5HpEZ0bkWyRg1lCyJ+ZeEBx0bVH60=;
        b=EK1DhYfKNOalCFX4Ubp6nRuwBiSnS2ANf7pHkWewttHgusJSIo2zZrNt8bOxu3LZjh
         MDMLNlhbZzMcrXmExV7hoqQYoMZJaw6hSMJxYnVa9pETjT7cwodW+scRXpec3hrLbOdk
         UiKAYL78r3Hcsp89W3Y/zyO2DTwTSBU1LdjtHStkeTTwfcx0NfmtUJ9e7ETMUOC4H6Tn
         9mFZ8wB5dbZMTmrgESXryUedXI7VqrwtWQgn3QjlyAonGtBNQSsAtqY6y/dmeXH+qOP+
         XDLj7dAaW9NY3nU+ZHfgMPBasMvGl222QGUONaqrNflsmmLqbKYmxHdulu6WhYyHMXfL
         kPXQ==
X-Gm-Message-State: AOJu0YyukIDB0+9VisGpbV3d6mWybV8gsHrB5XKsligHcFf3T9yekm6A
        2GxeW06wNOCUGIFaWud9+3LUHQ==
X-Google-Smtp-Source: AGHT+IE4RTLZlWj77VaCTRAJIovMln8vspGFCA32Vm3OUR2cyGxa3dLsY+sfB76+vIiSIe7lRrr8oA==
X-Received: by 2002:a2e:9e01:0:b0:2b6:d63d:cc1e with SMTP id e1-20020a2e9e01000000b002b6d63dcc1emr1379061ljk.51.1691752236557;
        Fri, 11 Aug 2023 04:10:36 -0700 (PDT)
Received: from fedora.. ([188.252.220.253])
        by smtp.googlemail.com with ESMTPSA id gg15-20020a170906e28f00b00982b204678fsm2103206ejb.207.2023.08.11.04.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 04:10:35 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        corbet@lwn.net, netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Gabor Juhos <j4g8y7@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 2/2] net: phy: Introduce PSGMII PHY interface mode
Date:   Fri, 11 Aug 2023 13:10:07 +0200
Message-ID: <20230811111032.231308-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811111032.231308-1-robert.marko@sartura.hr>
References: <20230811111032.231308-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gabor Juhos <j4g8y7@gmail.com>

The PSGMII interface is similar to QSGMII. The main difference
is that the PSGMII interface combines five SGMII lines into a
single link while in QSGMII only four lines are combined.

Similarly to the QSGMII, this interface mode might also needs
special handling within the MAC driver.

It is commonly used by Qualcomm with their QCA807x PHY series and
modern WiSoC-s.

Add definitions for the PHY layer to allow to express this type
of connection between the MAC and PHY.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Document the PSGMII PHY mode in phy.rst and phy_interface_t kerneldoc
---
 Documentation/networking/phy.rst | 4 ++++
 drivers/net/phy/phy-core.c       | 2 ++
 drivers/net/phy/phylink.c        | 3 +++
 include/linux/phy.h              | 4 ++++
 4 files changed, 13 insertions(+)

diff --git a/Documentation/networking/phy.rst b/Documentation/networking/phy.rst
index b7ac4c64cf67..1283240d7620 100644
--- a/Documentation/networking/phy.rst
+++ b/Documentation/networking/phy.rst
@@ -323,6 +323,10 @@ Some of the interface modes are described below:
     contrast with the 1000BASE-X phy mode used for Clause 38 and 39 PMDs, this
     interface mode has different autonegotiation and only supports full duplex.
 
+``PHY_INTERFACE_MODE_PSGMII``
+    This is the Penta SGMII mode, it is similar to QSGMII but it combines 5
+    SGMII lines into a single link compared to 4 on QSGMII.
+
 Pause frames / flow control
 ===========================
 
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index a64186dc53f8..966c93cbe616 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -142,6 +142,8 @@ int phy_interface_num_ports(phy_interface_t interface)
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
 		return 4;
+	case PHY_INTERFACE_MODE_PSGMII:
+		return 5;
 	case PHY_INTERFACE_MODE_MAX:
 		WARN_ONCE(1, "PHY_INTERFACE_MODE_MAX isn't a valid interface mode");
 		return 0;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4f1c8bb199e9..160bce608c34 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -210,6 +210,7 @@ static int phylink_interface_max_speed(phy_interface_t interface)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_PSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
 	case PHY_INTERFACE_MODE_SGMII:
@@ -475,6 +476,7 @@ unsigned long phylink_get_capabilities(phy_interface_t interface,
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_PSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
 	case PHY_INTERFACE_MODE_SGMII:
@@ -868,6 +870,7 @@ static int phylink_parse_mode(struct phylink *pl,
 
 		switch (pl->link_config.interface) {
 		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_PSGMII:
 		case PHY_INTERFACE_MODE_QSGMII:
 		case PHY_INTERFACE_MODE_QUSGMII:
 		case PHY_INTERFACE_MODE_RGMII:
diff --git a/include/linux/phy.h b/include/linux/phy.h
index ba08b0e60279..d7407f9a56a7 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -110,6 +110,7 @@ extern const int phy_10gbit_features_array[1];
  * @PHY_INTERFACE_MODE_XGMII: 10 gigabit media-independent interface
  * @PHY_INTERFACE_MODE_XLGMII:40 gigabit media-independent interface
  * @PHY_INTERFACE_MODE_MOCA: Multimedia over Coax
+ * @PHY_INTERFACE_MODE_PSGMII: Penta SGMII
  * @PHY_INTERFACE_MODE_QSGMII: Quad SGMII
  * @PHY_INTERFACE_MODE_TRGMII: Turbo RGMII
  * @PHY_INTERFACE_MODE_100BASEX: 100 BaseX
@@ -147,6 +148,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_XGMII,
 	PHY_INTERFACE_MODE_XLGMII,
 	PHY_INTERFACE_MODE_MOCA,
+	PHY_INTERFACE_MODE_PSGMII,
 	PHY_INTERFACE_MODE_QSGMII,
 	PHY_INTERFACE_MODE_TRGMII,
 	PHY_INTERFACE_MODE_100BASEX,
@@ -254,6 +256,8 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "xlgmii";
 	case PHY_INTERFACE_MODE_MOCA:
 		return "moca";
+	case PHY_INTERFACE_MODE_PSGMII:
+		return "psgmii";
 	case PHY_INTERFACE_MODE_QSGMII:
 		return "qsgmii";
 	case PHY_INTERFACE_MODE_TRGMII:
-- 
2.41.0

