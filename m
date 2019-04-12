Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07C427D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Apr 2019 11:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfDLLzf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 07:55:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41349 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfDLLzf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Apr 2019 07:55:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id r4so11539708wrq.8;
        Fri, 12 Apr 2019 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/QTR4X/QGzw6Z57GIbC1wpU/cYhVvf0uAQuaqahv+90=;
        b=bDTfQ/iOLRcdvqG2wH62kRq9ZqOHO1rUSXj+bNFQI3leHKe8pRpc24c8tguOzj1MfQ
         eQI073ENuYXIRbcQZVkJJy3GdTaOA2J3mz4TF/Ch07qQrwbV8hwtIjPAdwn5vVqAjMOZ
         AFtILdb7AKERRkwij4/PBLKp3LNb8JGNrpU4ohTuYyK29fe+STajz0EZKdsMGzaEaUD5
         lNGRF/yeqWNx01b1bcPgGSOemcKAQt/bKadysPLh49VGY7gHB6edQny4WQxDo+fOGzKa
         JtjrVO0w7UgCH1nyr7cjMQDykawxh3AuLUTSwTSsJmlnpAzDabHv4a+HVc1DTKAVzutZ
         7hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/QTR4X/QGzw6Z57GIbC1wpU/cYhVvf0uAQuaqahv+90=;
        b=evy5+eOiaUKz+CJQ8wt0NzcYUHNaRIGLAyt4OWs76Q6NpoUfUg9ZeNGH36xWxBMbaO
         isM4/sDAbdMMc76bP/Cgv3vsKC7FodswgEuVjflu8k9KlnXZVez+RNxWxsZuhJQjNdcU
         uPG+qjgiSorCKNoalKtsHItDHTgvyiykpwYhXGssf4ROqbg6R2FSHVQ+IIbrB3A7kTAq
         TSAktvTo4eKFuSp5HEPqkyOY7j1rFtyaoLlAqJUXJBUVV0gI/RHyNpUslls2/m2dQnDm
         PBJlDHOZh9caPVv2O6j6IsLQ9uLytUmt/Qiwec+RoMj8HFAYSpTfuX2hjJF6UfMunJ2M
         rxYQ==
X-Gm-Message-State: APjAAAU/U/1wrQiGaFGxuQ80z07jloTytmLk+PjkTO74h615e00K76TB
        OxOQi5P2dxjLbZmY7eZeGiw=
X-Google-Smtp-Source: APXvYqwLAIkWmaoJ0CcNbhlVcB1L6Q+qlzizIR3rA2L8s/lDL7vgAkuuEr1qTlP+x1JekY25+g2v1w==
X-Received: by 2002:adf:f110:: with SMTP id r16mr34175077wro.153.1555070131364;
        Fri, 12 Apr 2019 04:55:31 -0700 (PDT)
Received: from yoga-910.localhost (5-12-225-227.residential.rdsnet.ro. [5.12.225.227])
        by smtp.gmail.com with ESMTPSA id c6sm9380062wmb.21.2019.04.12.04.55.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 04:55:30 -0700 (PDT)
From:   Ioana Ciornei <ciorneiioana@gmail.com>
To:     davem@davemloft.net
Cc:     f.fainelli@gmail.com, andrew@lunn.ch, corbet@lwn.net,
        hauke@hauke-m.de, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, Ioana Ciornei <ciorneiioana@gmail.com>
Subject: [PATCH net-next] Documentation: net: dsa: transition to the rst format
Date:   Fri, 12 Apr 2019 14:55:18 +0300
Message-Id: <20190412115518.13288-1-ciorneiioana@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch also performs some minor adjustments such as numbering for
the receive path sequence, conversion of keywords to inline literals and
adding an index page so it looks better in the output of 'make htmldocs'.

Signed-off-by: Ioana Ciornei <ciorneiioana@gmail.com>
---
 .../dsa/{bcm_sf2.txt => bcm_sf2.rst}          |  27 +-
 .../networking/dsa/{dsa.txt => dsa.rst}       | 279 +++++++++---------
 Documentation/networking/dsa/index.rst        |  10 +
 .../dsa/{lan9303.txt => lan9303.rst}          |   6 +-
 Documentation/networking/index.rst            |   1 +
 5 files changed, 169 insertions(+), 154 deletions(-)
 rename Documentation/networking/dsa/{bcm_sf2.txt => bcm_sf2.rst} (83%)
 rename Documentation/networking/dsa/{dsa.txt => dsa.rst} (67%)
 create mode 100644 Documentation/networking/dsa/index.rst
 rename Documentation/networking/dsa/{lan9303.txt => lan9303.rst} (85%)

diff --git a/Documentation/networking/dsa/bcm_sf2.txt b/Documentation/networking/dsa/bcm_sf2.rst
similarity index 83%
rename from Documentation/networking/dsa/bcm_sf2.txt
rename to Documentation/networking/dsa/bcm_sf2.rst
index eba3a2431e91..dee234039e1e 100644
--- a/Documentation/networking/dsa/bcm_sf2.txt
+++ b/Documentation/networking/dsa/bcm_sf2.rst
@@ -1,3 +1,4 @@
+=============================================
 Broadcom Starfighter 2 Ethernet switch driver
 =============================================
 
@@ -25,27 +26,27 @@ are connected at a lower speed.
 The switch hardware block is typically interfaced using MMIO accesses and
 contains a bunch of sub-blocks/registers:
 
-* SWITCH_CORE: common switch registers
-* SWITCH_REG: external interfaces switch register
-* SWITCH_MDIO: external MDIO bus controller (there is another one in SWITCH_CORE,
+- ``SWITCH_CORE``: common switch registers
+- ``SWITCH_REG``: external interfaces switch register
+- ``SWITCH_MDIO``: external MDIO bus controller (there is another one in SWITCH_CORE,
   which is used for indirect PHY accesses)
-* SWITCH_INDIR_RW: 64-bits wide register helper block
-* SWITCH_INTRL2_0/1: Level-2 interrupt controllers
-* SWITCH_ACB: Admission control block
-* SWITCH_FCB: Fail-over control block
+- ``SWITCH_INDIR_RW``: 64-bits wide register helper block
+- ``SWITCH_INTRL2_0/1``: Level-2 interrupt controllers
+- ``SWITCH_ACB``: Admission control block
+- ``SWITCH_FCB``: Fail-over control block
 
 Implementation details
 ======================
 
-The driver is located in drivers/net/dsa/bcm_sf2.c and is implemented as a DSA
-driver; see Documentation/networking/dsa/dsa.txt for details on the subsystem
+The driver is located in ``drivers/net/dsa/bcm_sf2.c`` and is implemented as a DSA
+driver; see ``Documentation/networking/dsa/dsa.rst`` for details on the subsystem
 and what it provides.
 
 The SF2 switch is configured to enable a Broadcom specific 4-bytes switch tag
 which gets inserted by the switch for every packet forwarded to the CPU
 interface, conversely, the CPU network interface should insert a similar tag for
 packets entering the CPU port. The tag format is described in
-net/dsa/tag_brcm.c.
+``net/dsa/tag_brcm.c``.
 
 Overall, the SF2 driver is a fairly regular DSA driver; there are a few
 specifics covered below.
@@ -54,7 +55,7 @@ Device Tree probing
 -------------------
 
 The DSA platform device driver is probed using a specific compatible string
-provided in net/dsa/dsa.c. The reason for that is because the DSA subsystem gets
+provided in ``net/dsa/dsa.c``. The reason for that is because the DSA subsystem gets
 registered as a platform device driver currently. DSA will provide the needed
 device_node pointers which are then accessible by the switch driver setup
 function to setup resources such as register ranges and interrupts. This
@@ -70,7 +71,7 @@ Broadcom switches connected to a SF2 require the use of the DSA slave MDIO bus
 in order to properly configure them. By default, the SF2 pseudo-PHY address, and
 an external switch pseudo-PHY address will both be snooping for incoming MDIO
 transactions, since they are at the same address (30), resulting in some kind of
-"double" programming. Using DSA, and setting ds->phys_mii_mask accordingly, we
+"double" programming. Using DSA, and setting ``ds->phys_mii_mask`` accordingly, we
 selectively divert reads and writes towards external Broadcom switches
 pseudo-PHY addresses. Newer revisions of the SF2 hardware have introduced a
 configurable pseudo-PHY address which circumvents the initial design limitation.
@@ -86,7 +87,7 @@ firmware gets reloaded. The SF2 driver relies on such events to properly set its
 MoCA interface carrier state and properly report this to the networking stack.
 
 The MoCA interfaces are supported using the PHY library's fixed PHY/emulated PHY
-device and the switch driver registers a fixed_link_update callback for such
+device and the switch driver registers a ``fixed_link_update`` callback for such
 PHYs which reflects the link state obtained from the interrupt handler.
 
 
diff --git a/Documentation/networking/dsa/dsa.txt b/Documentation/networking/dsa/dsa.rst
similarity index 67%
rename from Documentation/networking/dsa/dsa.txt
rename to Documentation/networking/dsa/dsa.rst
index 43ef767bc440..ca87068b9ab9 100644
--- a/Documentation/networking/dsa/dsa.txt
+++ b/Documentation/networking/dsa/dsa.rst
@@ -1,10 +1,8 @@
-Distributed Switch Architecture
-===============================
-
-Introduction
+============
+Architecture
 ============
 
-This document describes the Distributed Switch Architecture (DSA) subsystem
+This document describes the **Distributed Switch Architecture (DSA)** subsystem
 design principles, limitations, interactions with other subsystems, and how to
 develop drivers for this subsystem as well as a TODO for developers interested
 in joining the effort.
@@ -70,11 +68,11 @@ Switch tagging protocols
 DSA currently supports 5 different tagging protocols, and a tag-less mode as
 well. The different protocols are implemented in:
 
-net/dsa/tag_trailer.c: Marvell's 4 trailer tag mode (legacy)
-net/dsa/tag_dsa.c: Marvell's original DSA tag
-net/dsa/tag_edsa.c: Marvell's enhanced DSA tag
-net/dsa/tag_brcm.c: Broadcom's 4 bytes tag
-net/dsa/tag_qca.c: Qualcomm's 2 bytes tag
+- ``net/dsa/tag_trailer.c``: Marvell's 4 trailer tag mode (legacy)
+- ``net/dsa/tag_dsa.c``: Marvell's original DSA tag
+- ``net/dsa/tag_edsa.c``: Marvell's enhanced DSA tag
+- ``net/dsa/tag_brcm.c``: Broadcom's 4 bytes tag
+- ``net/dsa/tag_qca.c``: Qualcomm's 2 bytes tag
 
 The exact format of the tag protocol is vendor specific, but in general, they
 all contain something which:
@@ -89,7 +87,7 @@ Master network devices are regular, unmodified Linux network device drivers for
 the CPU/management Ethernet interface. Such a driver might occasionally need to
 know whether DSA is enabled (e.g.: to enable/disable specific offload features),
 but the DSA subsystem has been proven to work with industry standard drivers:
-e1000e, mv643xx_eth etc. without having to introduce modifications to these
+``e1000e,`` ``mv643xx_eth`` etc. without having to introduce modifications to these
 drivers. Such network devices are also often referred to as conduit network
 devices since they act as a pipe between the host processor and the hardware
 Ethernet switch.
@@ -100,40 +98,42 @@ Networking stack hooks
 When a master netdev is used with DSA, a small hook is placed in in the
 networking stack is in order to have the DSA subsystem process the Ethernet
 switch specific tagging protocol. DSA accomplishes this by registering a
-specific (and fake) Ethernet type (later becoming skb->protocol) with the
-networking stack, this is also known as a ptype or packet_type. A typical
+specific (and fake) Ethernet type (later becoming ``skb->protocol``) with the
+networking stack, this is also known as a ``ptype`` or ``packet_type``. A typical
 Ethernet Frame receive sequence looks like this:
 
 Master network device (e.g.: e1000e):
 
-Receive interrupt fires:
-- receive function is invoked
-- basic packet processing is done: getting length, status etc.
-- packet is prepared to be processed by the Ethernet layer by calling
-  eth_type_trans
+1. Receive interrupt fires:
+
+        - receive function is invoked
+        - basic packet processing is done: getting length, status etc.
+        - packet is prepared to be processed by the Ethernet layer by calling
+          ``eth_type_trans``
+
+2. net/ethernet/eth.c::
+
+          eth_type_trans(skb, dev)
+                  if (dev->dsa_ptr != NULL)
+                          -> skb->protocol = ETH_P_XDSA
 
-net/ethernet/eth.c:
+3. drivers/net/ethernet/\*::
 
-eth_type_trans(skb, dev)
-	if (dev->dsa_ptr != NULL)
-		-> skb->protocol = ETH_P_XDSA
+          netif_receive_skb(skb)
+                  -> iterate over registered packet_type
+                          -> invoke handler for ETH_P_XDSA, calls dsa_switch_rcv()
 
-drivers/net/ethernet/*:
+4. net/dsa/dsa.c::
 
-netif_receive_skb(skb)
-	-> iterate over registered packet_type
-		-> invoke handler for ETH_P_XDSA, calls dsa_switch_rcv()
+          -> dsa_switch_rcv()
+                  -> invoke switch tag specific protocol handler in 'net/dsa/tag_*.c'
 
-net/dsa/dsa.c:
-	-> dsa_switch_rcv()
-		-> invoke switch tag specific protocol handler in
-		   net/dsa/tag_*.c
+5. net/dsa/tag_*.c:
 
-net/dsa/tag_*.c:
-	-> inspect and strip switch tag protocol to determine originating port
-	-> locate per-port network device
-	-> invoke eth_type_trans() with the DSA slave network device
-	-> invoked netif_receive_skb()
+        - inspect and strip switch tag protocol to determine originating port
+        - locate per-port network device
+        - invoke ``eth_type_trans()`` with the DSA slave network device
+        - invoked ``netif_receive_skb()``
 
 Past this point, the DSA slave network devices get delivered regular Ethernet
 frames that can be processed by the networking stack.
@@ -162,7 +162,7 @@ invoke a specific transmit routine which takes care of adding the relevant
 switch tag in the Ethernet frames.
 
 These frames are then queued for transmission using the master network device
-ndo_start_xmit() function, since they contain the appropriate switch tag, the
+``ndo_start_xmit()`` function, since they contain the appropriate switch tag, the
 Ethernet switch will be able to process these incoming frames from the
 management interface and delivers these frames to the physical switch port.
 
@@ -170,23 +170,25 @@ Graphical representation
 ------------------------
 
 Summarized, this is basically how DSA looks like from a network device
-perspective:
-
-
-			|---------------------------
-			| CPU network device (eth0)|
-			----------------------------
-			| <tag added by switch     |
-			|                          |
-			|                          |
-			|        tag added by CPU> |
-		|--------------------------------------------|
-		| Switch driver				     |
-		|--------------------------------------------|
-                    ||        ||         ||
-		|-------|  |-------|  |-------|
-		| sw0p0 |  | sw0p1 |  | sw0p2 |
-		|-------|  |-------|  |-------|
+perspective::
+
+
+                |---------------------------
+                | CPU network device (eth0)|
+                ----------------------------
+                | <tag added by switch     |
+                |                          |
+                |                          |
+                |        tag added by CPU> |
+        |--------------------------------------------|
+        |            Switch driver                   |
+        |--------------------------------------------|
+                  ||        ||         ||
+              |-------|  |-------|  |-------|
+              | sw0p0 |  | sw0p1 |  | sw0p2 |
+              |-------|  |-------|  |-------|
+
+
 
 Slave MDIO bus
 --------------
@@ -207,31 +209,32 @@ PHYs, external PHYs, or even external switches.
 Data structures
 ---------------
 
-DSA data structures are defined in include/net/dsa.h as well as
-net/dsa/dsa_priv.h.
+DSA data structures are defined in ``include/net/dsa.h`` as well as
+``net/dsa/dsa_priv.h``:
 
-dsa_chip_data: platform data configuration for a given switch device, this
-structure describes a switch device's parent device, its address, as well as
-various properties of its ports: names/labels, and finally a routing table
-indication (when cascading switches)
+- ``dsa_chip_data``: platform data configuration for a given switch device,
+  this structure describes a switch device's parent device, its address, as
+  well as various properties of its ports: names/labels, and finally a routing
+  table indication (when cascading switches)
 
-dsa_platform_data: platform device configuration data which can reference a
-collection of dsa_chip_data structure if multiples switches are cascaded, the
-master network device this switch tree is attached to needs to be referenced
+- ``dsa_platform_data``: platform device configuration data which can reference
+  a collection of dsa_chip_data structure if multiples switches are cascaded,
+  the master network device this switch tree is attached to needs to be
+  referenced
 
-dsa_switch_tree: structure assigned to the master network device under
-"dsa_ptr", this structure references a dsa_platform_data structure as well as
-the tagging protocol supported by the switch tree, and which receive/transmit
-function hooks should be invoked, information about the directly attached switch
-is also provided: CPU port. Finally, a collection of dsa_switch are referenced
-to address individual switches in the tree.
+- ``dsa_switch_tree``: structure assigned to the master network device under
+  ``dsa_ptr``, this structure references a dsa_platform_data structure as well as
+  the tagging protocol supported by the switch tree, and which receive/transmit
+  function hooks should be invoked, information about the directly attached
+  switch is also provided: CPU port. Finally, a collection of dsa_switch are
+  referenced to address individual switches in the tree.
 
-dsa_switch: structure describing a switch device in the tree, referencing a
-dsa_switch_tree as a backpointer, slave network devices, master network device,
-and a reference to the backing dsa_switch_ops
+- ``dsa_switch``: structure describing a switch device in the tree, referencing
+  a ``dsa_switch_tree`` as a backpointer, slave network devices, master network
+  device, and a reference to the backing``dsa_switch_ops``
 
-dsa_switch_ops: structure referencing function pointers, see below for a full
-description.
+- ``dsa_switch_ops``: structure referencing function pointers, see below for a
+  full description.
 
 Design limitations
 ==================
@@ -240,7 +243,7 @@ Limits on the number of devices and ports
 -----------------------------------------
 
 DSA currently limits the number of maximum switches within a tree to 4
-(DSA_MAX_SWITCHES), and the number of ports per switch to 12 (DSA_MAX_PORTS).
+(``DSA_MAX_SWITCHES``), and the number of ports per switch to 12 (``DSA_MAX_PORTS``).
 These limits could be extended to support larger configurations would this need
 arise.
 
@@ -279,15 +282,15 @@ Interactions with other subsystems
 
 DSA currently leverages the following subsystems:
 
-- MDIO/PHY library: drivers/net/phy/phy.c, mdio_bus.c
-- Switchdev: net/switchdev/*
+- MDIO/PHY library: ``drivers/net/phy/phy.c``, ``mdio_bus.c``
+- Switchdev:``net/switchdev/*``
 - Device Tree for various of_* functions
 
 MDIO/PHY library
 ----------------
 
 Slave network devices exposed by DSA may or may not be interfacing with PHY
-devices (struct phy_device as defined in include/linux/phy.h), but the DSA
+devices (``struct phy_device`` as defined in ``include/linux/phy.h)``, but the DSA
 subsystem deals with all possible combinations:
 
 - internal PHY devices, built into the Ethernet switch hardware
@@ -296,16 +299,16 @@ subsystem deals with all possible combinations:
 - special, non-autonegotiated or non MDIO-managed PHY devices: SFPs, MoCA; a.k.a
   fixed PHYs
 
-The PHY configuration is done by the dsa_slave_phy_setup() function and the
+The PHY configuration is done by the ``dsa_slave_phy_setup()`` function and the
 logic basically looks like this:
 
 - if Device Tree is used, the PHY device is looked up using the standard
   "phy-handle" property, if found, this PHY device is created and registered
-  using of_phy_connect()
+  using ``of_phy_connect()``
 
 - if Device Tree is used, and the PHY device is "fixed", that is, conforms to
   the definition of a non-MDIO managed PHY as defined in
-  Documentation/devicetree/bindings/net/fixed-link.txt, the PHY is registered
+  ``Documentation/devicetree/bindings/net/fixed-link.txt``, the PHY is registered
   and connected transparently using the special fixed MDIO bus driver
 
 - finally, if the PHY is built into the switch, as is very common with
@@ -331,8 +334,8 @@ Device Tree
 -----------
 
 DSA features a standardized binding which is documented in
-Documentation/devicetree/bindings/net/dsa/dsa.txt. PHY/MDIO library helper
-functions such as of_get_phy_mode(), of_phy_connect() are also used to query
+``Documentation/devicetree/bindings/net/dsa/dsa.txt``. PHY/MDIO library helper
+functions such as ``of_get_phy_mode()``, ``of_phy_connect()`` are also used to query
 per-port PHY specific details: interface connection, MDIO bus location etc..
 
 Driver development
@@ -341,8 +344,8 @@ Driver development
 DSA switch drivers need to implement a dsa_switch_ops structure which will
 contain the various members described below.
 
-register_switch_driver() registers this dsa_switch_ops in its internal list
-of drivers to probe for. unregister_switch_driver() does the exact opposite.
+``register_switch_driver()`` registers this dsa_switch_ops in its internal list
+of drivers to probe for. ``unregister_switch_driver()`` does the exact opposite.
 
 Unless requested differently by setting the priv_size member accordingly, DSA
 does not allocate any driver private context space.
@@ -350,17 +353,17 @@ does not allocate any driver private context space.
 Switch configuration
 --------------------
 
-- tag_protocol: this is to indicate what kind of tagging protocol is supported,
-  should be a valid value from the dsa_tag_protocol enum
+- ``tag_protocol``: this is to indicate what kind of tagging protocol is supported,
+  should be a valid value from the ``dsa_tag_protocol`` enum
 
-- probe: probe routine which will be invoked by the DSA platform device upon
+- ``probe``: probe routine which will be invoked by the DSA platform device upon
   registration to test for the presence/absence of a switch device. For MDIO
   devices, it is recommended to issue a read towards internal registers using
   the switch pseudo-PHY and return whether this is a supported device. For other
   buses, return a non-NULL string
 
-- setup: setup function for the switch, this function is responsible for setting
-  up the dsa_switch_ops private structure with all it needs: register maps,
+- ``setup``: setup function for the switch, this function is responsible for setting
+  up the ``dsa_switch_ops`` private structure with all it needs: register maps,
   interrupts, mutexes, locks etc.. This function is also expected to properly
   configure the switch to separate all network interfaces from each other, that
   is, they should be isolated by the switch hardware itself, typically by creating
@@ -375,27 +378,27 @@ Switch configuration
 PHY devices and link management
 -------------------------------
 
-- get_phy_flags: Some switches are interfaced to various kinds of Ethernet PHYs,
+- ``get_phy_flags``: Some switches are interfaced to various kinds of Ethernet PHYs,
   if the PHY library PHY driver needs to know about information it cannot obtain
   on its own (e.g.: coming from switch memory mapped registers), this function
   should return a 32-bits bitmask of "flags", that is private between the switch
-  driver and the Ethernet PHY driver in drivers/net/phy/*.
+  driver and the Ethernet PHY driver in ``drivers/net/phy/\*``.
 
-- phy_read: Function invoked by the DSA slave MDIO bus when attempting to read
+- ``phy_read``: Function invoked by the DSA slave MDIO bus when attempting to read
   the switch port MDIO registers. If unavailable, return 0xffff for each read.
   For builtin switch Ethernet PHYs, this function should allow reading the link
   status, auto-negotiation results, link partner pages etc..
 
-- phy_write: Function invoked by the DSA slave MDIO bus when attempting to write
+- ``phy_write``: Function invoked by the DSA slave MDIO bus when attempting to write
   to the switch port MDIO registers. If unavailable return a negative error
   code.
 
-- adjust_link: Function invoked by the PHY library when a slave network device
+- ``adjust_link``: Function invoked by the PHY library when a slave network device
   is attached to a PHY device. This function is responsible for appropriately
   configuring the switch port link parameters: speed, duplex, pause based on
-  what the phy_device is providing.
+  what the ``phy_device`` is providing.
 
-- fixed_link_update: Function invoked by the PHY library, and specifically by
+- ``fixed_link_update``: Function invoked by the PHY library, and specifically by
   the fixed PHY driver asking the switch driver for link parameters that could
   not be auto-negotiated, or obtained by reading the PHY registers through MDIO.
   This is particularly useful for specific kinds of hardware such as QSGMII,
@@ -405,87 +408,87 @@ PHY devices and link management
 Ethtool operations
 ------------------
 
-- get_strings: ethtool function used to query the driver's strings, will
+- ``get_strings``: ethtool function used to query the driver's strings, will
   typically return statistics strings, private flags strings etc.
 
-- get_ethtool_stats: ethtool function used to query per-port statistics and
+- ``get_ethtool_stats``: ethtool function used to query per-port statistics and
   return their values. DSA overlays slave network devices general statistics:
   RX/TX counters from the network device, with switch driver specific statistics
   per port
 
-- get_sset_count: ethtool function used to query the number of statistics items
+- ``get_sset_count``: ethtool function used to query the number of statistics items
 
-- get_wol: ethtool function used to obtain Wake-on-LAN settings per-port, this
+- ``get_wol``: ethtool function used to obtain Wake-on-LAN settings per-port, this
   function may, for certain implementations also query the master network device
   Wake-on-LAN settings if this interface needs to participate in Wake-on-LAN
 
-- set_wol: ethtool function used to configure Wake-on-LAN settings per-port,
+- ``set_wol``: ethtool function used to configure Wake-on-LAN settings per-port,
   direct counterpart to set_wol with similar restrictions
 
-- set_eee: ethtool function which is used to configure a switch port EEE (Green
+- ``set_eee``: ethtool function which is used to configure a switch port EEE (Green
   Ethernet) settings, can optionally invoke the PHY library to enable EEE at the
   PHY level if relevant. This function should enable EEE at the switch port MAC
   controller and data-processing logic
 
-- get_eee: ethtool function which is used to query a switch port EEE settings,
+- ``get_eee``: ethtool function which is used to query a switch port EEE settings,
   this function should return the EEE state of the switch port MAC controller
   and data-processing logic as well as query the PHY for its currently configured
   EEE settings
 
-- get_eeprom_len: ethtool function returning for a given switch the EEPROM
+- ``get_eeprom_len``: ethtool function returning for a given switch the EEPROM
   length/size in bytes
 
-- get_eeprom: ethtool function returning for a given switch the EEPROM contents
+- ``get_eeprom``: ethtool function returning for a given switch the EEPROM contents
 
-- set_eeprom: ethtool function writing specified data to a given switch EEPROM
+- ``set_eeprom``: ethtool function writing specified data to a given switch EEPROM
 
-- get_regs_len: ethtool function returning the register length for a given
+- ``get_regs_len``: ethtool function returning the register length for a given
   switch
 
-- get_regs: ethtool function returning the Ethernet switch internal register
+- ``get_regs``: ethtool function returning the Ethernet switch internal register
   contents. This function might require user-land code in ethtool to
   pretty-print register values and registers
 
 Power management
 ----------------
 
-- suspend: function invoked by the DSA platform device when the system goes to
+- ``suspend``: function invoked by the DSA platform device when the system goes to
   suspend, should quiesce all Ethernet switch activities, but keep ports
   participating in Wake-on-LAN active as well as additional wake-up logic if
   supported
 
-- resume: function invoked by the DSA platform device when the system resumes,
+- ``resume``: function invoked by the DSA platform device when the system resumes,
   should resume all Ethernet switch activities and re-configure the switch to be
   in a fully active state
 
-- port_enable: function invoked by the DSA slave network device ndo_open
+- ``port_enable``: function invoked by the DSA slave network device ndo_open
   function when a port is administratively brought up, this function should be
   fully enabling a given switch port. DSA takes care of marking the port with
-  BR_STATE_BLOCKING if the port is a bridge member, or BR_STATE_FORWARDING if it
+  ``BR_STATE_BLOCKING`` if the port is a bridge member, or ``BR_STATE_FORWARDING`` if it
   was not, and propagating these changes down to the hardware
 
-- port_disable: function invoked by the DSA slave network device ndo_close
+- ``port_disable``: function invoked by the DSA slave network device ndo_close
   function when a port is administratively brought down, this function should be
   fully disabling a given switch port. DSA takes care of marking the port with
-  BR_STATE_DISABLED and propagating changes to the hardware if this port is
+  ``BR_STATE_DISABLED`` and propagating changes to the hardware if this port is
   disabled while being a bridge member
 
 Bridge layer
 ------------
 
-- port_bridge_join: bridge layer function invoked when a given switch port is
+- ``port_bridge_join``: bridge layer function invoked when a given switch port is
   added to a bridge, this function should be doing the necessary at the switch
   level to permit the joining port from being added to the relevant logical
   domain for it to ingress/egress traffic with other members of the bridge.
 
-- port_bridge_leave: bridge layer function invoked when a given switch port is
+- ``port_bridge_leave``: bridge layer function invoked when a given switch port is
   removed from a bridge, this function should be doing the necessary at the
   switch level to deny the leaving port from ingress/egress traffic from the
   remaining bridge members. When the port leaves the bridge, it should be aged
   out at the switch hardware for the switch to (re) learn MAC addresses behind
   this port.
 
-- port_stp_state_set: bridge layer function invoked when a given switch port STP
+- ``port_stp_state_set``: bridge layer function invoked when a given switch port STP
   state is computed by the bridge layer and should be propagated to switch
   hardware to forward/block/learn traffic. The switch driver is responsible for
   computing a STP state change based on current and asked parameters and perform
@@ -494,7 +497,7 @@ Bridge layer
 Bridge VLAN filtering
 ---------------------
 
-- port_vlan_filtering: bridge layer function invoked when the bridge gets
+- ``port_vlan_filtering``: bridge layer function invoked when the bridge gets
   configured for turning on or off VLAN filtering. If nothing specific needs to
   be done at the hardware level, this callback does not need to be implemented.
   When VLAN filtering is turned on, the hardware must be programmed with
@@ -504,61 +507,61 @@ Bridge VLAN filtering
   accept any 802.1Q frames irrespective of their VLAN ID, and untagged frames are
   allowed.
 
-- port_vlan_prepare: bridge layer function invoked when the bridge prepares the
+- ``port_vlan_prepare``: bridge layer function invoked when the bridge prepares the
   configuration of a VLAN on the given port. If the operation is not supported
-  by the hardware, this function should return -EOPNOTSUPP to inform the bridge
+  by the hardware, this function should return ``-EOPNOTSUPP`` to inform the bridge
   code to fallback to a software implementation. No hardware setup must be done
   in this function. See port_vlan_add for this and details.
 
-- port_vlan_add: bridge layer function invoked when a VLAN is configured
+- ``port_vlan_add``: bridge layer function invoked when a VLAN is configured
   (tagged or untagged) for the given switch port
 
-- port_vlan_del: bridge layer function invoked when a VLAN is removed from the
+- ``port_vlan_del``: bridge layer function invoked when a VLAN is removed from the
   given switch port
 
-- port_vlan_dump: bridge layer function invoked with a switchdev callback
+- ``port_vlan_dump``: bridge layer function invoked with a switchdev callback
   function that the driver has to call for each VLAN the given port is a member
   of. A switchdev object is used to carry the VID and bridge flags.
 
-- port_fdb_add: bridge layer function invoked when the bridge wants to install a
+- ``port_fdb_add``: bridge layer function invoked when the bridge wants to install a
   Forwarding Database entry, the switch hardware should be programmed with the
   specified address in the specified VLAN Id in the forwarding database
   associated with this VLAN ID. If the operation is not supported, this
-  function should return -EOPNOTSUPP to inform the bridge code to fallback to
+  function should return ``-EOPNOTSUPP`` to inform the bridge code to fallback to
   a software implementation.
 
-Note: VLAN ID 0 corresponds to the port private database, which, in the context
-of DSA, would be the its port-based VLAN, used by the associated bridge device.
+.. note:: VLAN ID 0 corresponds to the port private database, which, in the context
+        of DSA, would be the its port-based VLAN, used by the associated bridge device.
 
-- port_fdb_del: bridge layer function invoked when the bridge wants to remove a
+- ``port_fdb_del``: bridge layer function invoked when the bridge wants to remove a
   Forwarding Database entry, the switch hardware should be programmed to delete
   the specified MAC address from the specified VLAN ID if it was mapped into
   this port forwarding database
 
-- port_fdb_dump: bridge layer function invoked with a switchdev callback
+- ``port_fdb_dump``: bridge layer function invoked with a switchdev callback
   function that the driver has to call for each MAC address known to be behind
   the given port. A switchdev object is used to carry the VID and FDB info.
 
-- port_mdb_prepare: bridge layer function invoked when the bridge prepares the
+- ``port_mdb_prepare``: bridge layer function invoked when the bridge prepares the
   installation of a multicast database entry. If the operation is not supported,
-  this function should return -EOPNOTSUPP to inform the bridge code to fallback
+  this function should return ``-EOPNOTSUPP`` to inform the bridge code to fallback
   to a software implementation. No hardware setup must be done in this function.
-  See port_fdb_add for this and details.
+  See ``port_fdb_add`` for this and details.
 
-- port_mdb_add: bridge layer function invoked when the bridge wants to install
+- ``port_mdb_add``: bridge layer function invoked when the bridge wants to install
   a multicast database entry, the switch hardware should be programmed with the
   specified address in the specified VLAN ID in the forwarding database
   associated with this VLAN ID.
 
-Note: VLAN ID 0 corresponds to the port private database, which, in the context
-of DSA, would be the its port-based VLAN, used by the associated bridge device.
+.. note:: VLAN ID 0 corresponds to the port private database, which, in the context
+        of DSA, would be the its port-based VLAN, used by the associated bridge device.
 
-- port_mdb_del: bridge layer function invoked when the bridge wants to remove a
+- ``port_mdb_del``: bridge layer function invoked when the bridge wants to remove a
   multicast database entry, the switch hardware should be programmed to delete
   the specified MAC address from the specified VLAN ID if it was mapped into
   this port forwarding database.
 
-- port_mdb_dump: bridge layer function invoked with a switchdev callback
+- ``port_mdb_dump``: bridge layer function invoked with a switchdev callback
   function that the driver has to call for each MAC address known to be behind
   the given port. A switchdev object is used to carry the VID and MDB info.
 
@@ -577,7 +580,7 @@ two subsystems and get the best of both worlds.
 Other hanging fruits
 --------------------
 
-- making the number of ports fully dynamic and not dependent on DSA_MAX_PORTS
+- making the number of ports fully dynamic and not dependent on ``DSA_MAX_PORTS``
 - allowing more than one CPU/management interface:
   http://comments.gmane.org/gmane.linux.network/365657
 - porting more drivers from other vendors:
diff --git a/Documentation/networking/dsa/index.rst b/Documentation/networking/dsa/index.rst
new file mode 100644
index 000000000000..5c488d345a1e
--- /dev/null
+++ b/Documentation/networking/dsa/index.rst
@@ -0,0 +1,10 @@
+===============================
+Distributed Switch Architecture
+===============================
+
+.. toctree::
+   :maxdepth: 1
+
+   dsa
+   bcm_sf2
+   lan9303
diff --git a/Documentation/networking/dsa/lan9303.txt b/Documentation/networking/dsa/lan9303.rst
similarity index 85%
rename from Documentation/networking/dsa/lan9303.txt
rename to Documentation/networking/dsa/lan9303.rst
index 144b02b95207..e3c820db28ad 100644
--- a/Documentation/networking/dsa/lan9303.txt
+++ b/Documentation/networking/dsa/lan9303.rst
@@ -1,3 +1,4 @@
+==============================
 LAN9303 Ethernet switch driver
 ==============================
 
@@ -9,10 +10,9 @@ host master network interface (e.g. fixed link).
 Driver details
 ==============
 
-The driver is implemented as a DSA driver, see
-Documentation/networking/dsa/dsa.txt.
+The driver is implemented as a DSA driver, see ``Documentation/networking/dsa/dsa.rst``.
 
-See Documentation/devicetree/bindings/net/dsa/lan9303.txt for device tree
+See ``Documentation/devicetree/bindings/net/dsa/lan9303.txt`` for device tree
 binding.
 
 The LAN9303 can be managed both via MDIO and I2C, both supported by this driver.
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 984e68f9e026..269d6f2661d5 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -25,6 +25,7 @@ Contents:
    device_drivers/intel/i40e
    device_drivers/intel/iavf
    device_drivers/intel/ice
+   dsa/index
    devlink-info-versions
    ieee802154
    kapi
-- 
2.21.0

