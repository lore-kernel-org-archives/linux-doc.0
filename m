Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACAFC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 14 Apr 2022 14:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244938AbiDNOHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Apr 2022 10:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346945AbiDNN6I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 09:58:08 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035B5B53D1;
        Thu, 14 Apr 2022 06:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=6bA3SZP3kvtP2Wpll9NtCPewFoIjvo4Ea/TB78oMn0U=; b=i78/sHtrdJmWRvO8019zlGvMhV
        u5pdEpfdiKymh5T3N2vpel1z1b63cXmc+5CPp2SKhZKKFPbxWOrfEVYG4gvqDu09r5L1wPWg/Dsyf
        AjBx/gtkTbn0iEXn5cBLkdxD7uTfnwO/E6Dd2pVPFlTQ8YSF90RJY7xZujTQbaBaG69c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nezpT-00Fpkh-Un; Thu, 14 Apr 2022 15:48:11 +0200
Date:   Thu, 14 Apr 2022 15:48:11 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
Cc:     Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "tobias@waldekranz.com" <tobias@waldekranz.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next] net: dsa: realtek: add compatible strings for
 RTL8367RB-VB
Message-ID: <YlgmG3mLlRKef+sy@lunn.ch>
References: <20220411210406.21404-1-luizluca@gmail.com>
 <20220412105018.gjrswtwrgjyndev4@bang-olufsen.dk>
 <CAJq09z53MZ6g=+tfwRU-N5BV5GcPSB5n0=+zj-cXOegMrq6g=A@mail.gmail.com>
 <20220414014527.gex5tlufyj4hm5di@bang-olufsen.dk>
 <CAJq09z6KSQS+oGFw5ZXRcSH5nQ3zongn4Owu0hCjO=RZZmHf+w@mail.gmail.com>
 <20220414113718.ofhgzhsmvyuxd2l2@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414113718.ofhgzhsmvyuxd2l2@bang-olufsen.dk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > Is it too late to get rid of all those compatible strings from
> > dt-bindings? And rtl8367s from the driver?
> > We must add all supported devices to the doc as well, similar to mv88e6085.
> 
> You can always try! I'm OK with those things in principle, but others might
> object due to ABI reasons.

Anything which is in a released Linus kernel is ABI and cannot be
removed. Anything in net-next, or an -rcX kernel can still be changed.

	 Andrew
