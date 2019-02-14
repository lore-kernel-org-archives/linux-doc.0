Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6EA97D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Feb 2019 04:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbfBNEcZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 23:32:25 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:51161 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727974AbfBNEcY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Feb 2019 23:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=DknRAlWv90Snj/HJjOlvSoOIuJuSi3mOgJGdVVd/xc0=; b=fauXIo0BjQxKggDnmRhZqa6sYb
        vx04XcO5c0Tj/hN8avUFMBVWGGhhg4Qn0mfK5u0sM3N6RNodiTeH/yYUGBebcU2JriQlvZ1df+L4g
        WmggllUZkCDWQZ+3SMWwEi91XiKtbcf9eK04HgasBl41qE+7N4VbbNlX23o4lNUZz2WQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1gu8h7-0005tN-QE; Thu, 14 Feb 2019 05:32:17 +0100
Date:   Thu, 14 Feb 2019 05:32:17 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/2] doc: add phylink documentation to the networking book
Message-ID: <20190214043217.GB20024@lunn.ch>
References: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
 <f002402d-fb27-f697-f07d-de3cdff41f40@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f002402d-fb27-f697-f07d-de3cdff41f40@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > +For information describing the SFP cage in DT, please see the binding
> > +documentation in the kernel source tree
> > +``Documentation/devicetree/bindings/net/sff,sfp.txt``
> oh, so SFP means "Small Form-factor Pluggable".
> 
> I see that this source file:
> ./drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:1902:
> 
> seems to imply that SFP means "single function per port (SFP) mode":

Hi Randy

rfc5513 might be relevant.

	Andrew
