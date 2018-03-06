Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33EC57E653
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 12:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753654AbeCFMyj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 07:54:39 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:48596 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753595AbeCFMyi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Mar 2018 07:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch; s=20171124;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=4XjN1FqWqFQw+W5dMaTG1VEhOhpMTdjmEPTtCVq2FAQ=;
        b=MQjnCwZ4IRflTzdUtnhzFmJyuVqtF72eVeUUSGGatzWD/N0dbRrnf+wHPjI1Dyz8YtxWT4DIVP6+eJSqmbMwtEctrjZj/98WG5praK7bgOAsDcyrPEVitpiM/OwgDT/04aLoqDn3G2k2zR4MDYNAhT49rYmlHc7UrVgpZsjo5Aw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
        (envelope-from <andrew@lunn.ch>)
        id 1etC6i-00072w-UR; Tue, 06 Mar 2018 13:54:16 +0100
Date:   Tue, 6 Mar 2018 13:54:16 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au,
        andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
        jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180306125416.GD26143@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180306124002.GA13950@amd>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 06, 2018 at 01:40:02PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > ---
> >  .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > new file mode 100644
> > index 000000000000..8a86f346d550
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > @@ -0,0 +1,73 @@
> > +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
> 
> Are these SoCs x86-based?

ARM, as far as i can tell. If i get the architecture correct, these
are BMC, Board Management Controllers, looking after the main x86 CPU,
stopping it overheating, controlling the power supplies, remote
management, etc.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
