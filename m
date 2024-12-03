Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388831DF75E
	for <linux-doc@vger.kernel.org>; Tue,  3 Dec 2024 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212608; cv=none; b=EnpsuBTtMh7kdrUole+rQNH0D6x29ozzqaWCl04v+AV3olQUmP7tdtSrjH2GaEb6lflri+7YPkVmyUupbApl0L6BLCLkpC4YEkI2NqcT+hH2cQgrf/r9uR53i+eQTTsSAcYTnYvok0s4NxZb5kGj2tIajw4NOhoMPRjAshpnOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212608; c=relaxed/simple;
	bh=hVd5tnauehki0EC7uyVUjToNlUh6nLbMFADO/U21EQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTP71pGAM/Uh36lFPYpLEiw86hfH6vf6mytERRi6hRIAtJAxwijPj6Oi9PwZRtTWG+cCnTzIscO7KS03DVCLb0ON3lQjKVwaUIKoqxuB31b47Qx3E3bdXweK7SEibQHpciVo1SRZTpyX/g2iE+vUm607WBek+85d9tEt0P+x2no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tINlj-000396-Kk; Tue, 03 Dec 2024 08:56:27 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tINle-001R8z-0k;
	Tue, 03 Dec 2024 08:56:23 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tINle-00AHwI-2z;
	Tue, 03 Dec 2024 08:56:22 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v1 4/7] phy: introduce optional polling interface for PHY statistics
Date: Tue,  3 Dec 2024 08:56:18 +0100
Message-Id: <20241203075622.2452169-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241203075622.2452169-1-o.rempel@pengutronix.de>
References: <20241203075622.2452169-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Add an optional polling interface for PHY statistics to simplify driver
implementation. Drivers can request the PHYlib to handle the polling task by
explicitly setting the `PHY_POLL_STATS` flag in their driver configuration.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/phy.c | 15 +++++++++++++++
 include/linux/phy.h   |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 0d20b534122b..b10ee9223fc9 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1346,6 +1346,18 @@ static int phy_enable_interrupts(struct phy_device *phydev)
 	return phy_config_interrupt(phydev, PHY_INTERRUPT_ENABLED);
 }
 
+/**
+ * phy_update_stats - update the PHY statistics
+ * @phydev: target phy_device struct
+ */
+static int phy_update_stats(struct phy_device *phydev)
+{
+	if (!phydev->drv->update_stats)
+		return 0;
+
+	return phydev->drv->update_stats(phydev);
+}
+
 /**
  * phy_request_interrupt - request and enable interrupt for a PHY device
  * @phydev: target phy_device struct
@@ -1415,6 +1427,9 @@ static enum phy_state_work _phy_state_machine(struct phy_device *phydev)
 	case PHY_RUNNING:
 		err = phy_check_link_status(phydev);
 		func = &phy_check_link_status;
+
+		if (!err)
+			err = phy_update_stats(phydev);
 		break;
 	case PHY_CABLETEST:
 		err = phydev->drv->cable_test_get_status(phydev, &finished);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a6c47b0675af..21cd44d177d2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -90,6 +90,7 @@ extern const int phy_10gbit_features_array[1];
 #define PHY_RST_AFTER_CLK_EN	BIT(1)
 #define PHY_POLL_CABLE_TEST	BIT(2)
 #define PHY_ALWAYS_CALL_SUSPEND	BIT(3)
+#define PHY_POLL_STATS		BIT(4)
 #define MDIO_DEVICE_IS_PHY	BIT(31)
 
 /**
@@ -1101,6 +1102,8 @@ struct phy_driver {
 			      struct ethtool_phy_stats *stats);
 	void (*get_link_stats)(struct phy_device *dev,
 			       struct ethtool_link_ext_stats *link_stats);
+	int (*update_stats)(struct phy_device *dev);
+
 	/** @get_sset_count: Number of statistic counters */
 	int (*get_sset_count)(struct phy_device *dev);
 	/** @get_strings: Names of the statistic counters */
@@ -1591,6 +1594,9 @@ static inline bool phy_polling_mode(struct phy_device *phydev)
 		if (phydev->drv->flags & PHY_POLL_CABLE_TEST)
 			return true;
 
+	if (phydev->drv->update_stats && phydev->drv->flags & PHY_POLL_STATS)
+		return true;
+
 	return phydev->irq == PHY_POLL;
 }
 
-- 
2.39.5

