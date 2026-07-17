Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D43D45DD
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271337; cv=none; b=tFSfEACI6QN5fpczrPIXUms8R8qEE2Daf3p4EmvXuiIrzuhocXR4swcXkbWnQ456iHEk873o38kO8zpEJV+d1KG4AQ/rBC2PoALa342M7hQEGs4KBTIzrbCZUB6pip6jXpfdhAiEN0qNPJRd3gqj5/nDzJQ7f4X3HMAA9PdccNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271337; c=relaxed/simple;
	bh=estAKhqirjQJ3LOHqdSyTwoG7cg+vImngwcf+to0P7Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahupGVE+LDlOxgk3/hSkX9591LstEToq5svIHYk2VolXY4E/QnkC466DPZbZg4yX3v2dEkTFSHPWykSbB/4NKVHVGQc2sHbmFyoKsZ5EZJmAgTtTobMnj46WMEtcfoy4eHw5/BFit7fvaIZbIncSELcGYhVRITHrUhfBrR291Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpAybwIb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpAybwIb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954afac04bso1737495e9.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 23:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271332; x=1784876132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VlkbpCy44dlroW2RCEp/LbnBuuBRf54m5s1Dlirl8co=;
        b=UpAybwIbUlOtBZO5rYmD8Fg42kRW+FgHNZii4/Tcr268/zk/+wAUC1AlQH8zD7AG9K
         8hBVNABDcckZ4KwpgqnmzSuOR7djMV2mFc+Pp4EnMDeMiMNAcvb0iR6oR64kRlSshgmH
         tp7cJGGA9ZNeWIgxagarPvenmbgBEXXtMnOnrNHW6bhXE1DT1ifkAdl57rctrQr3/7if
         Lm+QigGuwI0Qo1KGPJ/egav7G4Bb3KNGJpfYYvOIstTk8h4/KjjLRVOlQVnIo9n6hz2S
         hZuCrJLsyTL4IKGoDsOYoq/sQttAEnKgGGOj6oxOqHyKOC17ZPEMxx1llonwJCFeO8Si
         hISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271332; x=1784876132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VlkbpCy44dlroW2RCEp/LbnBuuBRf54m5s1Dlirl8co=;
        b=ATD8s2teziaaIiZe7DXz93wiHWAF867mghheIyCv3Rc98DjAmCwgsEZKn0LNlAWqB9
         G8pDBvZoxRFaL+bFjmeH+TdEBIciUFqzIJXxO51UMKi4s8EcodogW9dIrq3ghGYQc1yR
         inzMzIPKWNPZ7WZIfO+yBjf1kQkA8fYp2d7dLZECwPEr5lu4zvx+Lh6RNnXXGrb6rJCE
         y56ysXljt9FonRkkutMqJOy+bmP4XNWJYxStc/WZhiaCHiEs5SSSNLMgdKxlr8MrE8ay
         Z+ZHH7CT+15a5jTF/sQKHtFOYvr0CpTUuQ7GAZM8V+AQdFtWkdOcG5tPge/PGnnOT42C
         ea8w==
X-Forwarded-Encrypted: i=1; AHgh+RoG708zzyFZk2A3M2qVEa4e3zRcqexKhVXIUT1mjtOaD6hF/0hwO8e6oSRhF9MAuVJukMnm9ia3fu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxbf665dmypKNJAFvwVjFo8ZjY0L5eEErgwR/2/t1UVhTUxkzq
	VKgEOt4jGsKwkRCiWqRYLQOOf+1gCj9So/m5wnMhxD9u3Top6oUrqVzZ
X-Gm-Gg: AfdE7clQu8Q/fTIvKvwJK8iL+/zJwu4TEjgqeJnUNB2rjEF+vqEVAgtW4PB+6wBhQY0
	+DtEBku8KVYcLKruSNnT861kcR5KbR0uAqVyhwgNUba0Clq7VC6W0zA5XNJnnQsosFMXOrSxDf7
	oj6C19Mc8HFpJe6NFxrSrpn/YzKgj5dyNc+X+DQ0k7YVLVo7Ov9UrMak+5S0vm1VYmpJs7MspQJ
	lLOj5HtBREmHTt0Bt1/Jk8595d8BYIljZax3Vc11P2RtWgTAEMmA+4wNgWdyAaZ/UfKzR1MlNG6
	iZNZP31b91dqbxH9Jmg1QxKyN8mdCDaq7RbHRBMw6UVLrkT/Be/ToFijFKwaR+DXSHTi/Tev9hP
	UhC6VD07YSSknjXWloF2+dqR1vAccPMEJM1wy/9/xoOR+dIU827FR5lkwRrqjrgtrzNtwYnGWWR
	f1pooSR7LttGm4YtrSKQB2eGrIIc97RCLTR5Jy9wpf9gVSkwe3MsVgpCXTuZrbT8Oi2NJa1Q==
X-Received: by 2002:a7b:c055:0:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-4954a516ae6mr8142375e9.37.1784271331576;
        Thu, 16 Jul 2026 23:55:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 12/12] net: airoha: add phylink support
Date: Fri, 17 Jul 2026 08:54:12 +0200
Message-ID: <20260717065448.1498335-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Update and provide a .get/set_link_ksettings function that use phylink
for ethtool OPs now that we fully support phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   1 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 194 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   7 +-
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index 1f6640a15fc9..789906516bf8 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,7 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..ed1ac032f337 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -8,6 +8,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -1837,7 +1838,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	struct airoha_gdm_port *port = dev->port;
 	int i;
 
-	spin_lock(&port->stats_lock);
+	spin_lock(&port->lock);
 
 	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
 		if (port->devs[i])
@@ -1848,7 +1849,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
 		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
 
-	spin_unlock(&port->stats_lock);
+	spin_unlock(&port->lock);
 }
 
 static void airoha_dev_set_xmit_frame_size(struct net_device *netdev)
@@ -1870,6 +1871,14 @@ static int airoha_dev_open(struct net_device *netdev)
 	u32 pse_port = FE_PSE_PORT_PPE1;
 	int err;
 
+	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
+	if (err) {
+		netdev_err(netdev, "could not attach PHY: %d\n", err);
+		return err;
+	}
+
+	phylink_start(dev->phylink);
+
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
@@ -1909,6 +1918,10 @@ static int airoha_dev_stop(struct net_device *netdev)
 		airoha_set_gdm_port_fwd_cfg(qdma->eth,
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
+
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -2389,6 +2402,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
+static int
+airoha_ethtool_get_link_ksettings(struct net_device *netdev,
+				  struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
+}
+
+static int
+airoha_ethtool_set_link_ksettings(struct net_device *netdev,
+				  const struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
+}
+
 static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
@@ -3120,7 +3151,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
-	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
+	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
@@ -3176,6 +3208,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
 	return false;
 }
 
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
+						  phylink_config);
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
+	u32 frag_size_tx, frag_size_rx;
+	u32 mask, val;
+
+	/* TX/RX frag is configured only for GDM4 */
+	if (port->id != AIROHA_GDM4_IDX)
+		return;
+
+	switch (speed) {
+	case SPEED_10000:
+	case SPEED_5000:
+		frag_size_tx = 8;
+		frag_size_rx = 8;
+		break;
+	case SPEED_2500:
+		frag_size_tx = 2;
+		frag_size_rx = 1;
+		break;
+	default:
+		frag_size_tx = 1;
+		frag_size_rx = 0;
+	}
+
+	spin_lock(&port->lock);
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		mask = GDM4_SGMII1_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}  else {
+		mask = GDM4_SGMII0_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}
+	airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG, mask, val);
+
+	if (dev->nbq == 1) {
+		mask = GDM4_SGMII1_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+				 frag_size_rx);
+	} else {
+		mask = GDM4_SGMII0_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_rx);
+	}
+	airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG, mask, val);
+
+	spin_unlock(&port->lock);
+}
+
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_fill_available_pcs(struct phylink_config *config,
+				     struct phylink_pcs **available_pcs,
+				     unsigned int num_possible_pcs)
+{
+	struct device *dev = config->dev;
+
+	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+					num_possible_pcs);
+}
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct device_node *np = netdev->dev.of_node;
+	struct airoha_gdm_port *port = dev->port;
+	struct phylink_config *config;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&netdev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	config = &dev->phylink_config;
+	config->dev = &netdev->dev;
+	config->type = PHYLINK_NETDEV;
+
+	/*
+	 * GDM1 only supports internal for Embedded Switch
+	 * and doesn't require a PCS.
+	 */
+	if (port->id == AIROHA_GDM1_IDX) {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10000FD;
+
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+	} else {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10 | MAC_100 | MAC_1000 |
+					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
+
+		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
+		config->fill_available_pcs = airoha_fill_available_pcs;
+
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_10GBASER,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_USXGMII,
+			  config->supported_interfaces);
+
+		phy_interface_copy(config->pcs_interfaces,
+				   config->supported_interfaces);
+	}
+
+	phylink = phylink_create(config, of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	dev->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 				   struct airoha_gdm_port *port,
 				   int nbq, struct device_node *np)
@@ -3239,7 +3420,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3274,7 +3455,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 		return -ENOMEM;
 
 	port->id = id;
-	spin_lock_init(&port->stats_lock);
+	spin_lock_init(&port->lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
@@ -3471,6 +3652,8 @@ static int airoha_probe(struct platform_device *pdev)
 			netdev = netdev_from_priv(dev);
 			if (netdev->reg_state == NETREG_REGISTERED)
 				unregister_netdev(netdev);
+			if (dev->phylink)
+				phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -3509,6 +3692,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 			netdev = netdev_from_priv(dev);
 			unregister_netdev(netdev);
+			phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6d01a8e8da1..b49fc5304b3a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -561,6 +561,9 @@ struct airoha_gdm_dev {
 	int nbq;
 
 	struct airoha_hw_stats stats;
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
@@ -568,8 +571,8 @@ struct airoha_gdm_port {
 	int id;
 	int users;
 
-	/* protect concurrent hw_stats accesses */
-	spinlock_t stats_lock;
+	/* protect concurrent hw_stats and frag register accesses */
+	spinlock_t lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 6fed63d013b4..8df02f51211c 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -357,6 +357,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_FE_GDM4_TMBI_FRAG		0x2028
+#define GDM4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_FE_GDM4_RMBI_FRAG		0x202c
+#define GDM4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.53.0

