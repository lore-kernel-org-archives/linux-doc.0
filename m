Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B39317D099
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Feb 2019 15:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfBEP62 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Feb 2019 10:58:28 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40238 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbfBEP62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Feb 2019 10:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3zwPS6g5qWyeLeHjGEMnolueetDQsO/qZk7EqEPXF9k=; b=S9EYsQERvAgFLgCQjuSvTgTTTc
        55OV6BXzcJcCXAWL2NMiodQQxBBiIjqH3jn041q+EY3Mqr/t8spGu2RLZDmAlAG6bMgi/lWe5loCk
        UYDZvOKoF0tKs5lIYTgGRDAuen3+8g1xgboCKQwTgGDcytqAsAYMmqf2S6rUzaOXKFDY=;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35836 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1gr377-00037F-Di; Tue, 05 Feb 2019 15:58:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1gr376-0007ea-NV; Tue, 05 Feb 2019 15:58:20 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] doc: add phylink documentation to the networking book
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
Date:   Tue, 05 Feb 2019 15:58:20 +0000
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add some phylink documentation to the networking book detailing how
to convert network drivers from phylib to phylink.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
Version 2 adds the "Modes of operation" section, as it appears mvpp2 is
non-conformant (which is, unfortunately, causing problems in certain
circumstances.)

 Documentation/networking/index.rst       |   1 +
 Documentation/networking/sfp-phylink.rst | 268 +++++++++++++++++++++++++++++++
 2 files changed, 269 insertions(+)
 create mode 100644 Documentation/networking/sfp-phylink.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index bd89dae8d578..ea81fc403b68 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -31,6 +31,7 @@ Linux Networking Documentation
    net_failover
    alias
    bridge
+   sfp-phylink
 
 .. only::  subproject
 
diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
new file mode 100644
index 000000000000..78a577c9d8a3
--- /dev/null
+++ b/Documentation/networking/sfp-phylink.rst
@@ -0,0 +1,268 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+phylink
+=======
+
+Overview
+========
+
+phylink is a mechanism to support hot-pluggable networking modules
+without needing to re-initialise the adapter on hot-plug events.
+
+phylink supports conventional phylib-based setups, fixed link setups
+and SFP modules at present.
+
+Modes of operation
+==================
+
+phylink has several modes of operation, which depend on the firmware
+settings.
+
+1. PHY mode
+
+   In PHY mode, we use phylib to read the current link settings from
+   the PHY, and pass them to the MAC driver.  We expect the MAC driver
+   to configure exactly the modes that are specified without any
+   negotiation being enabled on the link.
+
+2. Fixed mode
+
+   Fixed mode is the same as PHY mode as far as the MAC driver is
+   concerned.
+
+3. In-band mode
+
+   In-band mode is used with 802.3z, SGMII and similar interface modes
+   are used, and we are expecting to use the and honor the in-band
+   negotiation or control word sent across the serdes channel.
+
+By example, what this means is that:
+
+.. code-block:: none
+
+  &eth {
+    phy = <&phy>;
+    phy-mode = "sgmii";
+  };
+
+does not use in-band SGMII signalling.  The PHY is expected to follow
+exactly the settings given to it in its :c:func:`mac_config` function.
+The link should be forced up or down appropriately in the
+:c:func:`mac_link_up` and :c:func:`mac_link_down` functions.
+
+.. code-block:: none
+
+  &eth {
+    managed = "in-band-status";
+    phy = <&phy>;
+    phy-mode = "sgmii";
+  };
+
+uses in-band mode, where results from the PHYs negotiation are passed
+to the MAC through the SGMII control word, and the MAC is expected to
+acknowledge the control word.  The :c:func:`mac_link_up` and
+:c:func:`mac_link_down` functions must not force the MAC side link
+up and down.
+
+Rough guide to converting a network driver to sfp/phylink
+=========================================================
+
+This guide briefly describes how to convert a network driver from
+phylib to the sfp/phylink support.  Please send patches to improve
+this documentation.
+
+1. Optionally split the network driver's phylib update function into
+   three parts dealing with link-down, link-up and reconfiguring the
+   MAC settings. This can be done as a separate preparation commit.
+
+   An example of this preparation can be found in git commit fc548b991fb0.
+
+2. Replace::
+
+	select FIXED_PHY
+	select PHYLIB
+
+   with::
+
+	select PHYLINK
+
+   in the driver's Kconfig stanza.
+
+3. Add::
+
+	#include <linux/phylink.h>
+
+   to the driver's list of header files.
+
+4. Add::
+
+	struct phylink *phylink;
+
+   to the driver's private data structure.  We shall refer to the
+   driver's private data pointer as ``priv`` below, and the driver's
+   private data structure as ``struct foo_priv``.
+
+5. Replace the following functions:
+
+   .. flat-table::
+    :header-rows: 1
+    :widths: 1 1
+    :stub-columns: 0
+
+    * - Original function
+      - Replacement function
+    * - phy_start(phydev)
+      - phylink_start(priv->phylink)
+    * - phy_stop(phydev)
+      - phylink_stop(priv->phylink)
+    * - phy_mii_ioctl(phydev, ifr, cmd)
+      - phylink_mii_ioctl(priv->phylink, ifr, cmd)
+    * - phy_ethtool_get_wol(phydev, wol)
+      - phylink_ethtool_get_wol(priv->phylink, wol)
+    * - phy_ethtool_set_wol(phydev, wol)
+      - phylink_ethtool_set_wol(priv->phylink, wol)
+    * - phy_disconnect(phydev)
+      - phylink_disconnect_phy(priv->phylink)
+
+   Please note that some of these functions must be called under the
+   rtnl lock, and will warn if not. This will normally be the case,
+   except if these are called from the driver suspend/resume paths.
+
+6. Add/replace ksettings get/set methods with:
+
+   .. code-block:: c
+
+    static int foo_ethtool_set_link_ksettings(struct net_device *dev,
+					     const struct ethtool_link_ksettings *cmd)
+    {
+	struct foo_priv *priv = netdev_priv(dev);
+
+	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
+    }
+
+    static int foo_ethtool_get_link_ksettings(struct net_device *dev,
+					     struct ethtool_link_ksettings *cmd)
+    {
+	struct foo_priv *priv = netdev_priv(dev);
+
+	return phylink_ethtool_ksettings_get(priv->phylink, cmd);
+    }
+
+7. Replace the call to:
+
+	phy_dev = of_phy_connect(dev, node, link_func, flags, phy_interface)
+
+   and associated code with a call to:
+
+	err = phylink_of_phy_connect(priv->phylink, node, flags)
+
+   For the most part, ``flags`` can be zero, these flags are passed to
+   the of_phy_attach() inside this function call if a PHY is specified
+   in the DT node ``node``.
+
+   ``node`` should be the DT node which contains the network phy property,
+   fixed link properties, and will also contain the sfp property.
+
+   The setup of fixed links should also be removed; these are handled
+   natively by phylink.
+
+   of_phy_connect() was also passed a function pointer for link updates.
+   This function is replaced by a different form of MAC updates
+   described below in (8).
+
+   Manipulation of the PHY's supported/advertised happens within phylink
+   based on the validate callback, see below in (8).
+
+   Note that the driver no longer needs to store the ``phy_interface``,
+   and also note that ``phy_interface`` becomes a dynamic property,
+   just like the speed, duplex etc settings.
+
+   Finally, note that the MAC driver has no direct access to the PHY
+   anymore; that is because in the phylink model, the PHY can be
+   dynamic.
+
+8. Add a :c:type:`struct phylink_mac_ops <phylink_mac_ops>` instance to
+   the driver, which is a table of function pointers, and implement
+   these functions. The old link update function for
+   :c:func:`of_phy_connect` becomes three methods: :c:func:`mac_link_up`,
+   :c:func:`mac_link_down`, and :c:func:`mac_config`. If step 1 was
+   performed, then the functionality will have been split there.
+
+   It is important that if in-band negotiation is used,
+   :c:func:`mac_link_up` and :c:func:`mac_link_down` do not prevent the
+   in-band negotiation from completing, since these functions are called
+   when the in-band link state changes - otherwise the link will never
+   come up.
+
+   The :c:func:`validate` method should mask the supplied supported mask,
+   and ``state->advertising`` with the supported ethtool link modes.
+   These are the new ethtool link modes, so bitmask operations must be
+   used. For an example, see drivers/net/ethernet/marvell/mvneta.c.
+
+   The :c:func:`mac_link_state` method is used to read the link state
+   from the MAC, and report back the settings that the MAC is currently
+   using. This is particularly important for in-band negotiation
+   methods such as 1000base-X and SGMII.
+
+   The :c:func:`mac_config` method is used to update the MAC with the
+   requested state, and must avoid unnecessarily taking the link down
+   when making changes to the MAC configuration.  This means the
+   function should modify the state and only take the link down when
+   absolutely necessary to change the MAC configuration.  An example
+   of how to do this can be found in :c:func:`mvneta_mac_config` in
+   drivers/net/ethernet/marvell/mvneta.c.
+
+   For further information on these methods, please see the inline
+   documentation in :c:type:`struct phylink_mac_ops <phylink_mac_ops>`.
+
+9. Remove calls to of_parse_phandle() for the PHY,
+   of_phy_register_fixed_link() for fixed links etc from the probe
+   function, and replace with:
+
+   .. code-block:: c
+
+	struct phylink *phylink;
+
+	phylink = phylink_create(dev, node, phy_mode, &phylink_ops);
+	if (IS_ERR(phylink)) {
+		err = PTR_ERR(phylink);
+		fail probe;
+	}
+
+	priv->phylink = phylink;
+
+   and arrange to destroy the phylink in the probe failure path as
+   appropriate and the removal path too by calling:
+
+   .. code-block:: c
+
+	phylink_destroy(priv->phylink);
+
+10. Arrange for MAC link state interrupts to be forwarded into
+    phylink, via:
+
+    .. code-block:: c
+
+	phylink_mac_change(priv->phylink, link_is_up);
+
+    where ``link_is_up`` is true if the link is currently up or false
+    otherwise.
+
+11. Verify that the driver does not call::
+
+	netif_carrier_on()
+	netif_carrier_off()
+
+   as these will interfere with phylink's tracking of the link state,
+   and cause phylink to omit calls via the :c:func:`mac_link_up` and
+   :c:func:`mac_link_down` methods.
+
+Network drivers should call phylink_stop() and phylink_start() via their
+suspend/resume paths, which ensures that the appropriate
+:c:type:`struct phylink_mac_ops <phylink_mac_ops>` methods are called
+as necessary.
+
+For information describing the SFP cage in DT, please see the binding
+documentation in the kernel source tree
+``Documentation/devicetree/bindings/net/sff,sfp.txt``
-- 
2.7.4

