Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1A3A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Feb 2019 04:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfBNEAc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 23:00:32 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51872 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfBNEAc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Feb 2019 23:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=a7S5UlOc650PCcrL3/2cJCD5hy2HWDNTcIvvo8PILAY=; b=qKNDl4ms+ZouPomeXS5dZRbCM
        eqVPfOFO34uh2TvW1QTqcQ4xNxO4H/iW9nLjIraKLzZWFBaVGGxEKQLTjluMcIJe89aE5FMYD/0BN
        s0oGB++/tB36jaUbU39uqXcQt4+i26FkFP9jINooIqV0YzPZLCl+lxRfCnkInbKRXifnDgFwVgdOn
        qJnNZMNqNH0Ty9oLgd8f0bEVnUtX/Cs4SWB9vvOp8f0pY0Wczj3lr1KNp9dwOoKTFheV5yozV9zEh
        NSo9WvBXemC5ErcRMcki9QEnfpyjtJLednvN+E7KdoV42ieGWYHr+2p+8Zpt9FaVYnQwmC4zU6BFw
        65DNTIUXQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gu8CL-0007sx-G6; Thu, 14 Feb 2019 04:00:30 +0000
Subject: Re: [PATCH 2/2] doc: add phylink documentation to the networking book
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
References: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f002402d-fb27-f697-f07d-de3cdff41f40@infradead.org>
Date:   Wed, 13 Feb 2019 20:00:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/5/19 7:58 AM, Russell King wrote:
> Add some phylink documentation to the networking book detailing how
> to convert network drivers from phylib to phylink.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
> Version 2 adds the "Modes of operation" section, as it appears mvpp2 is
> non-conformant (which is, unfortunately, causing problems in certain
> circumstances.)
> 
>  Documentation/networking/index.rst       |   1 +
>  Documentation/networking/sfp-phylink.rst | 268 +++++++++++++++++++++++++++++++
>  2 files changed, 269 insertions(+)
>  create mode 100644 Documentation/networking/sfp-phylink.rst
> 

> diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
> new file mode 100644
> index 000000000000..78a577c9d8a3
> --- /dev/null
> +++ b/Documentation/networking/sfp-phylink.rst
> @@ -0,0 +1,268 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=======
> +phylink
> +=======
> +
> +Overview
> +========
> +
> +phylink is a mechanism to support hot-pluggable networking modules
> +without needing to re-initialise the adapter on hot-plug events.
> +
> +phylink supports conventional phylib-based setups, fixed link setups
> +and SFP modules at present.

Please tell what SFP means.
It would also be nice if net/phy/Kconfig told what SFP means.

> +
> +Modes of operation
> +==================
> +
> +phylink has several modes of operation, which depend on the firmware
> +settings.
> +
> +1. PHY mode
> +
> +   In PHY mode, we use phylib to read the current link settings from
> +   the PHY, and pass them to the MAC driver.  We expect the MAC driver
> +   to configure exactly the modes that are specified without any
> +   negotiation being enabled on the link.
> +
> +2. Fixed mode
> +
> +   Fixed mode is the same as PHY mode as far as the MAC driver is
> +   concerned.
> +
> +3. In-band mode
> +
> +   In-band mode is used with 802.3z, SGMII and similar interface modes

should "with" be "when"?

> +   are used, and we are expecting to use the and honor the in-band

eh?                                  ^^^^^^^^^^^^^^^^^^^^

> +   negotiation or control word sent across the serdes channel.
> +
> +By example, what this means is that:
> +
> +.. code-block:: none
> +
> +  &eth {
> +    phy = <&phy>;
> +    phy-mode = "sgmii";
> +  };
> +
> +does not use in-band SGMII signalling.  The PHY is expected to follow
> +exactly the settings given to it in its :c:func:`mac_config` function.
> +The link should be forced up or down appropriately in the
> +:c:func:`mac_link_up` and :c:func:`mac_link_down` functions.
> +
> +.. code-block:: none
> +
> +  &eth {
> +    managed = "in-band-status";
> +    phy = <&phy>;
> +    phy-mode = "sgmii";
> +  };
> +
> +uses in-band mode, where results from the PHYs negotiation are passed

                                             PHY's

> +to the MAC through the SGMII control word, and the MAC is expected to
> +acknowledge the control word.  The :c:func:`mac_link_up` and
> +:c:func:`mac_link_down` functions must not force the MAC side link
> +up and down.
> +
> +Rough guide to converting a network driver to sfp/phylink
> +=========================================================
> +
> +This guide briefly describes how to convert a network driver from
> +phylib to the sfp/phylink support.  Please send patches to improve
> +this documentation.
> +
> +1. Optionally split the network driver's phylib update function into
> +   three parts dealing with link-down, link-up and reconfiguring the
> +   MAC settings. This can be done as a separate preparation commit.
> +
> +   An example of this preparation can be found in git commit fc548b991fb0.
> +
> +2. Replace::
> +
> +	select FIXED_PHY
> +	select PHYLIB
> +
> +   with::
> +
> +	select PHYLINK
> +
> +   in the driver's Kconfig stanza.
> +
> +3. Add::
> +
> +	#include <linux/phylink.h>
> +
> +   to the driver's list of header files.
> +
> +4. Add::
> +
> +	struct phylink *phylink;
> +
> +   to the driver's private data structure.  We shall refer to the
> +   driver's private data pointer as ``priv`` below, and the driver's
> +   private data structure as ``struct foo_priv``.
> +
> +5. Replace the following functions:
> +
> +   .. flat-table::
> +    :header-rows: 1
> +    :widths: 1 1
> +    :stub-columns: 0
> +
> +    * - Original function
> +      - Replacement function
> +    * - phy_start(phydev)
> +      - phylink_start(priv->phylink)
> +    * - phy_stop(phydev)
> +      - phylink_stop(priv->phylink)
> +    * - phy_mii_ioctl(phydev, ifr, cmd)
> +      - phylink_mii_ioctl(priv->phylink, ifr, cmd)
> +    * - phy_ethtool_get_wol(phydev, wol)
> +      - phylink_ethtool_get_wol(priv->phylink, wol)
> +    * - phy_ethtool_set_wol(phydev, wol)
> +      - phylink_ethtool_set_wol(priv->phylink, wol)
> +    * - phy_disconnect(phydev)
> +      - phylink_disconnect_phy(priv->phylink)
> +
> +   Please note that some of these functions must be called under the
> +   rtnl lock, and will warn if not. This will normally be the case,
> +   except if these are called from the driver suspend/resume paths.
> +
> +6. Add/replace ksettings get/set methods with:
> +
> +   .. code-block:: c
> +
> +    static int foo_ethtool_set_link_ksettings(struct net_device *dev,
> +					     const struct ethtool_link_ksettings *cmd)
> +    {
> +	struct foo_priv *priv = netdev_priv(dev);
> +
> +	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
> +    }
> +
> +    static int foo_ethtool_get_link_ksettings(struct net_device *dev,
> +					     struct ethtool_link_ksettings *cmd)
> +    {
> +	struct foo_priv *priv = netdev_priv(dev);
> +
> +	return phylink_ethtool_ksettings_get(priv->phylink, cmd);
> +    }
> +
> +7. Replace the call to:
> +
> +	phy_dev = of_phy_connect(dev, node, link_func, flags, phy_interface)

add ending ';' above.

> +
> +   and associated code with a call to:
> +
> +	err = phylink_of_phy_connect(priv->phylink, node, flags)

ditto.

> +
> +   For the most part, ``flags`` can be zero, these flags are passed to

                                          zero;

> +   the of_phy_attach() inside this function call if a PHY is specified
> +   in the DT node ``node``.
> +
> +   ``node`` should be the DT node which contains the network phy property,
> +   fixed link properties, and will also contain the sfp property.
> +
> +   The setup of fixed links should also be removed; these are handled
> +   natively by phylink.

      internally?

> +
> +   of_phy_connect() was also passed a function pointer for link updates.
> +   This function is replaced by a different form of MAC updates
> +   described below in (8).
> +
> +   Manipulation of the PHY's supported/advertised happens within phylink

                          PHYs

> +   based on the validate callback, see below in (8).
> +
> +   Note that the driver no longer needs to store the ``phy_interface``,
> +   and also note that ``phy_interface`` becomes a dynamic property,
> +   just like the speed, duplex etc settings.

                                  etc.

> +
> +   Finally, note that the MAC driver has no direct access to the PHY
> +   anymore; that is because in the phylink model, the PHY can be
> +   dynamic.
> +
> +8. Add a :c:type:`struct phylink_mac_ops <phylink_mac_ops>` instance to
> +   the driver, which is a table of function pointers, and implement
> +   these functions. The old link update function for
> +   :c:func:`of_phy_connect` becomes three methods: :c:func:`mac_link_up`,
> +   :c:func:`mac_link_down`, and :c:func:`mac_config`. If step 1 was
> +   performed, then the functionality will have been split there.
> +
> +   It is important that if in-band negotiation is used,
> +   :c:func:`mac_link_up` and :c:func:`mac_link_down` do not prevent the
> +   in-band negotiation from completing, since these functions are called
> +   when the in-band link state changes - otherwise the link will never
> +   come up.
> +
> +   The :c:func:`validate` method should mask the supplied supported mask,
> +   and ``state->advertising`` with the supported ethtool link modes.
> +   These are the new ethtool link modes, so bitmask operations must be
> +   used. For an example, see drivers/net/ethernet/marvell/mvneta.c.
> +
> +   The :c:func:`mac_link_state` method is used to read the link state
> +   from the MAC, and report back the settings that the MAC is currently
> +   using. This is particularly important for in-band negotiation
> +   methods such as 1000base-X and SGMII.
> +
> +   The :c:func:`mac_config` method is used to update the MAC with the
> +   requested state, and must avoid unnecessarily taking the link down
> +   when making changes to the MAC configuration.  This means the
> +   function should modify the state and only take the link down when
> +   absolutely necessary to change the MAC configuration.  An example
> +   of how to do this can be found in :c:func:`mvneta_mac_config` in
> +   drivers/net/ethernet/marvell/mvneta.c.
> +
> +   For further information on these methods, please see the inline
> +   documentation in :c:type:`struct phylink_mac_ops <phylink_mac_ops>`.
> +
> +9. Remove calls to of_parse_phandle() for the PHY,
> +   of_phy_register_fixed_link() for fixed links etc from the probe

                                                   etc.

> +   function, and replace with:
> +
> +   .. code-block:: c
> +
> +	struct phylink *phylink;
> +
> +	phylink = phylink_create(dev, node, phy_mode, &phylink_ops);
> +	if (IS_ERR(phylink)) {
> +		err = PTR_ERR(phylink);
> +		fail probe;
> +	}
> +
> +	priv->phylink = phylink;
> +
> +   and arrange to destroy the phylink in the probe failure path as
> +   appropriate and the removal path too by calling:
> +
> +   .. code-block:: c
> +
> +	phylink_destroy(priv->phylink);
> +
> +10. Arrange for MAC link state interrupts to be forwarded into
> +    phylink, via:
> +
> +    .. code-block:: c
> +
> +	phylink_mac_change(priv->phylink, link_is_up);
> +
> +    where ``link_is_up`` is true if the link is currently up or false
> +    otherwise.
> +
> +11. Verify that the driver does not call::
> +
> +	netif_carrier_on()
> +	netif_carrier_off()
> +
> +   as these will interfere with phylink's tracking of the link state,
> +   and cause phylink to omit calls via the :c:func:`mac_link_up` and
> +   :c:func:`mac_link_down` methods.
> +
> +Network drivers should call phylink_stop() and phylink_start() via their
> +suspend/resume paths, which ensures that the appropriate
> +:c:type:`struct phylink_mac_ops <phylink_mac_ops>` methods are called
> +as necessary.
> +
> +For information describing the SFP cage in DT, please see the binding
> +documentation in the kernel source tree
> +``Documentation/devicetree/bindings/net/sff,sfp.txt``
oh, so SFP means "Small Form-factor Pluggable".

I see that this source file:
./drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:1902:

seems to imply that SFP means "single function per port (SFP) mode":

	dev_err(&pf->pdev->dev,
		"VF %d requested polling mode: this feature is supported only when the device is running in single function per port (SFP) mode\n",
		 vf->vf_id);


Good job overall.  Thanks.

-- 
~Randy
