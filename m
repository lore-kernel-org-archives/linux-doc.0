Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C887C54EBC
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 12:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjALMv5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 07:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjALMv4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 07:51:56 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49131131;
        Thu, 12 Jan 2023 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=Ka0B6ZRYHP+Z/pIWCv9PAnb+5byUzLYOug/EwehsPSU=; b=a0M6V+AkuXSXH8M3porhaxRO5u
        JTD2y44bQVmythEQF8tkoYLs0rSzNzlPatKKr+2Ln1kFfWnkI+12Yp02hGU+EFJkaXkNx0mSExkYg
        IUsKZW+qmEBsIgjiiJdkt6KhVp6Zscm+ICEjIWjV5BGPp1IIbauiNNZ9LEuzlnRJfi6A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pFx3P-001rbu-HM; Thu, 12 Jan 2023 13:51:35 +0100
Date:   Thu, 12 Jan 2023 13:51:35 +0100
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
        gal@nvidia.com, gustavoars@kernel.org, bagasdotme@gmail.com
Subject: Re: [PATCH net-next 1/1] plca.c: fix obvious mistake in checking
 retval
Message-ID: <Y8ACVykpY11Sq/Pg@lunn.ch>
References: <f6b7050dcfb07714fb3abdb89829a3820e6a555c.1673458121.git.piergiorgio.beruto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b7050dcfb07714fb3abdb89829a3820e6a555c.1673458121.git.piergiorgio.beruto@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 06:30:48PM +0100, Piergiorgio Beruto wrote:
> This patch addresses a wrong fix that was done during the review
> process. The intention was to substitute "if(ret < 0)" with
> "if(ret)". Unfortunately, in this specific file the intended fix did not
> meet the code.
> 
> Signed-off-by: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
