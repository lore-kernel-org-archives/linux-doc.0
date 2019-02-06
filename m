Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4E007D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Feb 2019 01:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfBFB7z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Feb 2019 20:59:55 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:40390 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbfBFB7z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Feb 2019 20:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=KF6rTnsf2NCDnCg+jGqz9bRQXT+qBdQzyUz0sQszcfo=; b=gZkoV3LGjzgEAkPdVswAUpzk/o
        eDQQzGiPw8BrvZ0UBKymGnZyIdB1fn79QcYLw6wLn70TUXFxikf6gH6Wv6nLB1stzAzjHJLteq1sq
        vd8jov+vkqldqin9l+byBHE01SHG0j3LP4Y/7Oz35GpHs6ymAxRkBMeCeOX6bVuQoEWo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1grCVE-0007pF-GK; Wed, 06 Feb 2019 02:59:52 +0100
Date:   Wed, 6 Feb 2019 02:59:52 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/2] doc: add phylink documentation to the networking book
Message-ID: <20190206015952.GA20672@lunn.ch>
References: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 05, 2019 at 03:58:20PM +0000, Russell King wrote:
> Add some phylink documentation to the networking book detailing how
> to convert network drivers from phylib to phylink.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
