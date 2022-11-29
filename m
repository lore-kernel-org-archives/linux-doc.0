Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5155C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Nov 2022 18:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbiK2StI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Nov 2022 13:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236132AbiK2StH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Nov 2022 13:49:07 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AB830556;
        Tue, 29 Nov 2022 10:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=MjfE13HsyIxqUU7DpN5W7YqFqj4N5ZRJ5znpcpplD5k=; b=5a9Kb49H7bRTLUApwPUlalHdWV
        JWSYzedCP7wOFB7XSOaoEY2ar3E8AYA2E4LmcqfKWZjUW12RQZOeLraTaKgD6sYyxyTvg1IhUDk47
        JIxllfQYErJZNO4lP4z6b5dZ9GyV9i1QGkwo/ZsVhyi+jR7mxhv5zkxrtvKuGfpn2H+A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1p05f8-003u4Z-8Q; Tue, 29 Nov 2022 19:48:58 +0100
Date:   Tue, 29 Nov 2022 19:48:58 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     netdev@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 01/12] net: dpaa2-eth: don't use -ENOTSUPP error
 code
Message-ID: <Y4ZUGl6nN0cImLBW@lunn.ch>
References: <20221129141221.872653-1-vladimir.oltean@nxp.com>
 <20221129141221.872653-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129141221.872653-2-vladimir.oltean@nxp.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 29, 2022 at 04:12:10PM +0200, Vladimir Oltean wrote:
> dpaa2_eth_setup_dpni() is called from the probe path and
> dpaa2_eth_set_link_ksettings() is propagated to user space.
> 
> include/linux/errno.h says that ENOTSUPP is "Defined for the NFSv3
> protocol". Conventional wisdom has it to not use it in networking
> drivers. Replace it with -EOPNOTSUPP.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
