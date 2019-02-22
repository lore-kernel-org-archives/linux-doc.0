Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 045E37D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 11:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfBVLUk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 06:20:40 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34744 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfBVLUk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 06:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OEYhjLYqeN81HIAIF2pxZpanK25aUeuX9c9qJW2IZM4=; b=P7Ait2f3DyNuRkac6vgm4Y+LY
        TT17tFpFqIFl02a4jVDNZam+r3ZxfwSYHxTyKHQ6qa5OLZyjjPM8dqY90WSSBmOFaRV2wKVtXgUhU
        pSWjIxFlIA49a9speihzJRw35IvKOFRwj7WsFQFX2O42hvjSzYuO0NkZB64YNeIU4pRYBuG7JFXxJ
        qFuBNqJn3XWwn+pyIuIEivORtVTqXGUT8MVUJJrrvqpoOv7I7zelg69as5rk8Pct/KV7NLEG87zg7
        EW6LvbidIackhDYWxNi/K4m1Ud7ZAPF/APgm7TX/FeNZFqIDjIF2hcUZXQjm+rOATvID7ut4OEK7c
        OvTcG45JQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51332)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1gx8se-0001Qa-GO; Fri, 22 Feb 2019 11:20:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1gx8sb-00029d-PA; Fri, 22 Feb 2019 11:20:33 +0000
Date:   Fri, 22 Feb 2019 11:20:33 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/2] doc: add phylink documentation to the networking book
Message-ID: <20190222112033.odgwdzq3h6k6r5mn@shell.armlinux.org.uk>
References: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
 <f002402d-fb27-f697-f07d-de3cdff41f40@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f002402d-fb27-f697-f07d-de3cdff41f40@infradead.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

Sorry for the delay.

On Wed, Feb 13, 2019 at 08:00:29PM -0800, Randy Dunlap wrote:
> On 2/5/19 7:58 AM, Russell King wrote:
> > +uses in-band mode, where results from the PHYs negotiation are passed
> 
>                                              PHY's
...
> > +   Manipulation of the PHY's supported/advertised happens within phylink
> 
>                           PHYs

Either one way or the other.  "negotiation of the PHY", "supported/
advertised (link modes) of the PHY".  Both are posessive, so the first
is a mistake but I don't agree with removing the posessive apostrophy
in the second case.

> > +For information describing the SFP cage in DT, please see the binding
> > +documentation in the kernel source tree
> > +``Documentation/devicetree/bindings/net/sff,sfp.txt``
> oh, so SFP means "Small Form-factor Pluggable".
> 
> I see that this source file:
> ./drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:1902:
> 
> seems to imply that SFP means "single function per port (SFP) mode":
> 
> 	dev_err(&pf->pdev->dev,
> 		"VF %d requested polling mode: this feature is supported only when the device is running in single function per port (SFP) mode\n",
> 		 vf->vf_id);

Software engineers endlessly like to create TLAs, so it could mean
both, but in this case it's the official definition from the SFF/
SNIA documents, e.g.:

                          INF-8074i Specification for

                 SFP (Small Formfactor Pluggable) Transceiver

note, no hyphen!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
