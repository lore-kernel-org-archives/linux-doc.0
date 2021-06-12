Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27F8C48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 18:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A533B6120E
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 18:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhFLSJD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 14:09:03 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:60978 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFLSJA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 12 Jun 2021 14:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=sPcIUeSLAQNc1fKrl5u39AP4kTyWDFRqJpP6Tv9J0MQ=; b=Wf0Jf9VJh9KYc07vbMnHHiIhOY
        npPBbfsZr00cMvLiDLpSlkjBkxv2nGwevt5Xiuc7W1kb+OU48ARA/X1CxBzWY88MTBfYCyFDXZe6d
        HIYE7I21O6amcYNJHOuebOfJkVVOnro77n5jyzREiyS9wis5Vry9Bkv1KXswxs8Ez4XA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ls821-0091Iq-Lv; Sat, 12 Jun 2021 20:06:53 +0200
Date:   Sat, 12 Jun 2021 20:06:53 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Steen Hegelund <steen.hegelund@microchip.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Bjarni Jonasson <bjarni.jonasson@microchip.com>
Subject: Re: [PATCH net-next 2/4] net: phy: Add 25G BASE-R interface mode
Message-ID: <YMT3vTpAugt6RiVN@lunn.ch>
References: <20210611125453.313308-1-steen.hegelund@microchip.com>
 <20210611125453.313308-3-steen.hegelund@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611125453.313308-3-steen.hegelund@microchip.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 02:54:51PM +0200, Steen Hegelund wrote:
> Add 25gbase-r phy interface mode
> 
> Signed-off-by: Steen Hegelund <steen.hegelund@microchip.com>
> Signed-off-by: Bjarni Jonasson <bjarni.jonasson@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
