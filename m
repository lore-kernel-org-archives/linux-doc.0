Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68967C46467
	for <linux-doc@archiver.kernel.org>; Sat,  7 Jan 2023 17:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjAGRiE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 7 Jan 2023 12:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjAGRiC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 7 Jan 2023 12:38:02 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C81C101CE;
        Sat,  7 Jan 2023 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=tGAtb7lLTOzzx1a9MgzHq0QMFVUZM3XHWVDSZH7D/fQ=; b=pCyx/VSTfqd8vlx/GO1BiYvFh1
        r2sRKxUd9BQBInMhClhBwFNpSzidgP/Kvlonz7OsSfIbtKcyC3o9A4v4GspEAj2rL36qehW7b0dQ+
        SaydYO6c30uScqBK91/9XaZ2kM57aTNbsbGz93YsISr1DpcdZzdSQkzGQB/SL6oyi6tY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pED8i-001R6c-98; Sat, 07 Jan 2023 18:37:52 +0100
Date:   Sat, 7 Jan 2023 18:37:52 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
        mailhol.vincent@wanadoo.fr, sudheer.mogilappagari@intel.com,
        sbhatta@marvell.com, linux-doc@vger.kernel.org,
        wangjie125@huawei.com, corbet@lwn.net, lkp@intel.com,
        gal@nvidia.com, gustavoars@kernel.org
Subject: Re: [PATCH v2 net-next 3/5] drivers/net/phy: add connection between
 ethtool and phylib for PLCA
Message-ID: <Y7mt8IUUbMv6bt5v@lunn.ch>
References: <cover.1673030528.git.piergiorgio.beruto@gmail.com>
 <9a25328bcf2c0d963e34d33ff0968f83755905f4.1673030528.git.piergiorgio.beruto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a25328bcf2c0d963e34d33ff0968f83755905f4.1673030528.git.piergiorgio.beruto@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +	// if not enabling PLCA, skip a few sanity checks
> +	if (plca_cfg->enabled <= 0)
> +		goto apply_cfg;
> +
> +	if (!linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT,
> +			       phydev->advertising)) {
> +		ret = -EOPNOTSUPP;
> +		NL_SET_ERR_MSG(extack,
> +			       "Point to Multi-Point mode is not enabled");
> +	}
> +
> +	// allow setting node_id concurrently with enabled
> +	if (plca_cfg->node_id >= 0)
> +		curr_plca_cfg->node_id = plca_cfg->node_id;
> +
> +	if (curr_plca_cfg->node_id >= 255) {
> +		NL_SET_ERR_MSG(extack, "PLCA node ID is not set");
> +		ret = -EINVAL;
> +		goto out_drv;
> +	}
> +
> +apply_cfg:
> +	ret = phydev->drv->set_plca_cfg(phydev, plca_cfg);

Goto which don't jump to the end of the function is generally frowned
upon. I suggest you put these sanity checks into a little helper, so
you can avoid the goto.

With that change make, feel free to add my reviewed-by.

     Andrew
