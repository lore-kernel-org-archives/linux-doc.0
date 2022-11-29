Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029A2C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 29 Nov 2022 18:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbiK2S4C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Nov 2022 13:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbiK2Szg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Nov 2022 13:55:36 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D5261BA2;
        Tue, 29 Nov 2022 10:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=HdhNqyL9b6+i/7sE7vyZwnk+0Mb0bUvJtlVA06WsRNk=; b=gYf2PQJ4GAf7YOwlGpsxjpgiSC
        UWWqZkWv26a8We/lOIdE9aemGPJsUEPH7x3lD5LIqQIYjMKDeMYdMdihYP67e0L/DIQaV98V1uIA7
        GWB8esLSw37GG0foLzfCihsZRNI4VIa5qsxeCUuWidjSyaRT+s2yZiPzD9FumnpgsDRI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1p05l0-003u8O-Mk; Tue, 29 Nov 2022 19:55:02 +0100
Date:   Tue, 29 Nov 2022 19:55:02 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     netdev@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] net: dpaa2-switch replace direct MAC
 access with dpaa2_switch_port_has_mac()
Message-ID: <Y4ZVhhonnUm39qay@lunn.ch>
References: <20221129141221.872653-1-vladimir.oltean@nxp.com>
 <20221129141221.872653-9-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129141221.872653-9-vladimir.oltean@nxp.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 29, 2022 at 04:12:17PM +0200, Vladimir Oltean wrote:
> The helper function will gain a lockdep annotation in a future patch.
> Make sure to benefit from it.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

 Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
