Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D8388361
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782563607; cv=none; b=W65CE3zzxnS3loQFAvlv/703p15fIsynI/edLD2x/fvVWwhnjLhop5sLi0qSodbfCnJGlnZzRjdB7s5Nc8klh6FzcFQV+gq/pRJzVhwypAp8Mi7aemKswZBZrPkig5WQH+KkyBsFrO6OdVLd5wAeg04I33MS80ESWw9JIpGM3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782563607; c=relaxed/simple;
	bh=xbxEDsydXJAiVLZ5Cf6Ao9KnDZgjCNf+AXTfOmlvxNE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPgFm7Ryc4lmEIpPzfTz2ZKXi+6g8gwiPrMCNhcK2FcsAAu5Dg0OnFEl8x+kFFlpr9Wl4iBynNMKtkWFgmdklAhlB6kqaJ+bb5M++VEbc5NfSosPSXdZHcSXjwAqcBRZsm0mbggsKtvJGwgAtdtvgJmAqQD3Kl7wLJBQ0Wr5Kik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgyuloEC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgyuloEC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49249707788so14837635e9.2
        for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782563603; x=1783168403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=;
        b=AgyuloECDvljj+zNbL0P+qIrINEor1sZ9+0/a9u0sgF7Dleosnhz7g+jY7RDhcH6ti
         gExi1fpzghcXdeNihRErkiGHyr/xSKc5pI7t03RIKm7Xf+Gyn46IPGP9q3+SW4fokK+B
         Ufvz9/f6O2WzYnOwdpFOOiDtcuPRNJiXef3uJUbxwoY6XMRidJNuM+Pv+t/lcffz80DX
         cr4PFnkzY0Nf0RbvzwP58Lrj05sXlXdzNyfLLFCPmtXQ+q+N/3skOSBiAdDlbGJQgCwt
         awiTfNImWQ8DU6Q446B+CtywAf2tTl4w/F5cu/2CQoBZG/5W+Mshbv0BBMPdW0WdJrN4
         D86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782563603; x=1783168403;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=;
        b=F1/xYWpjk56CHnY8B8g7RRyXec1glOFa/Ng6tMhgXWXyf3LwSx8objQh/Xj4ZVLRpO
         hD48f2S3hyqXt8s3QOnL++AgjxfqQSEYJ4L6vDC4cZ/QIsQNvQP0JYjwz8jvPQLrMzbS
         vyKVLPgJMSb6kPCHtyBwjV4jSupIqHi3XAJcbqa0wrSbNOqXZxvAWdxes4difqEGa5RW
         WWxLP13uHnzQONBCSPZaAKIwNAWi4lgdao2d7FaiFi6P3kQnKTgt2MQYZuiV8h3W8SPZ
         haVOEM82RVZUEDyHRFcYp/KLkbPd/3l2H9NHnRPsjdqq+5/CHAWB1xURALAzckqhELzk
         DF0w==
X-Forwarded-Encrypted: i=1; AFNElJ89SDhABP8bkkarSvViRakLB7zUSClmp7dGUj/zDWwW/+FCNCnLVWGLschyU8DFjP98GMwR0cvfAg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjT3cGodAedwBgGuVjmLqeh7aHzIK3aFBiZJPkRErc3T1U2kZ
	+3SVj9C/Bk1yvlaeqD+yn8r1mmVGla5glcpA4WLB4AuI9EenE/efEZuQ
X-Gm-Gg: AfdE7cm/nv0e3MWnDzY6L7HNGZ4GwdjzktI6f7WOJTrt6gI4Q+ffRNLOy64sFcWnIK6
	qR8/tjItsPrlzSh17GbE+QVRhzw9Dbh7p2UWjNgAYC9NFFR/Or59zKRXjhVVU3lzRVkq5qPxzSh
	SehhAzHI1ZKnslGHjn5nzEdBP6neOL4Ym/Rex36TQKR474zgMFdbQKtatMY5pIVnq24KYgDbH6k
	n0rBgemPB4OaezEUC87FRo4DBLE3yWYAkQrl1CQP+AnQUX0t6+KkG7xstWtzEOTZ/gpeZ3Sb09s
	j+Yt3yN7yFtGfznz17956EFssChSq7KUil2t4xIedZCAqZ9irf+inIf16xXKLq1qY5kVGhi+/cC
	RuPasBlWJl4y66ViEPvmTi1vtGj/GHmI7fbuj/u7ikjXPEpH2+K/HqBcjSQpXF0/WhCxMZ88OxN
	GSoJErzyiGf5ESlX4qtT11VsAFFK45Llv66/1Mnql2kVCM
X-Received: by 2002:a05:600c:81c5:b0:492:4ff5:fb9e with SMTP id 5b1f17b1804b1-4926fcade65mr62722535e9.37.1782563603146;
        Sat, 27 Jun 2026 05:33:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm271536875e9.15.2026.06.27.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:33:22 -0700 (PDT)
Message-ID: <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
X-Google-Original-Message-ID: <aj_DD_djHkw7CLZ4@Ansuel-XPS.>
Date: Sat, 27 Jun 2026 14:33:19 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
 <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>

On Thu, Jun 25, 2026 at 04:13:14PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/18/26 14:57, Christian Marangi wrote:
> > Add phylink_release_pcs() to externally release a PCS from a phylink
> > instance. This can be used to handle case when a single PCS needs to be
> > removed and the phylink instance needs to be refreshed.
> > 
> > On calling phylink_release_pcs(), the PCS will be removed from the
> > phylink internal PCS list and the phylink supported_interfaces value is
> > reparsed with the remaining PCS interfaces.
> > 
> > Also a phylink resolve is triggered to handle the PCS removal.
> > 
> > The flag force_major_config is set to make phylink resolve reconfigure
> > the interface (even if it didn't change).
> > This is needed to handle the special case when the current PCS used
> > by phylink is removed and a major_config is needed to propagae the
> > configuration change. With this option enabled we also force mac_config
> > even if the PHY link is not up for the in-band case.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/phylink.h   |  2 ++
> >  2 files changed, 58 insertions(+)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index c38bcd43b8c8..064d6f5a06da 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
> >  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
> >  
> >  static void phylink_run_resolve(struct phylink *pl);
> > +static void phylink_link_down(struct phylink *pl);
> > +static void phylink_pcs_disable(struct phylink_pcs *pcs);
> >  
> >  /**
> >   * phylink_set_port_modes() - set the port type modes in the ethtool mask
> > @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
> >  	}
> >  }
> >  
> > +/**
> > + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
> > + * @pcs: a pointer to the phylink_pcs struct to be released
> > + *
> > + * This function release a PCS from the phylink PCS available list if
> > + * actually in use. It also refreshes the supported interfaces of the
> > + * phylink instance by copying the supported interfaces from the phylink
> > + * conf and merging the supported interfaces of the remaining available PCS
> > + * in the list and trigger a resolve.
> > + */
> > +void phylink_release_pcs(struct phylink_pcs *pcs)
> > +{
> > +	struct phylink *pl;
> > +
> > +	ASSERT_RTNL();
> > +
> > +	pl = pcs->phylink;
> > +	if (!pl)
> > +		return;
> > +
> > +	mutex_lock(&pl->state_mutex);
> > +
> > +	list_del(&pcs->list);
> > +	pcs->phylink = NULL;
> > +
> > +	/*
> > +	 * Check if we are removing the PCS currently
> > +	 * in use by phylink. If this is the case, tear down
> > +	 * the link, force phylink resolve to reconfigure the
> > +	 * interface mode, disable the current PCS and set the
> > +	 * phylink PCS to NULL.
> > +	 */
> > +	if (pl->pcs == pcs) {
> > +		phylink_link_down(pl);
> > +		phylink_pcs_disable(pl->pcs);
> > +
> > +		pl->force_major_config = true;
> > +		pl->pcs = NULL;
> > +	}
> > +
> > +	mutex_unlock(&pl->state_mutex);
> > +
> > +	/* Refresh supported interfaces */
> > +	phy_interface_copy(pl->supported_interfaces,
> > +			   pl->config->supported_interfaces);
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		phy_interface_or(pl->supported_interfaces,
> > +				 pl->supported_interfaces,
> > +				 pcs->supported_interfaces);
> 
> I've given more thought to that 'supported_interfaces' thing. This
> patchset redefines the meaning of
> 
>   pl->config->supported_interfaces
> 
> Currently, it's filled by the MAC driver and means "Every interface
> we can support, including the ones provided by PCSs that we can use
> with this MAC".
> 
> It now becomes "Every interface we support without needing a PCS", at
> least the way I understand that.
>

Wait but with the current code using the OR logic, it still follows
"Every interface we can support...". The modes that needs a PCS are
specificed with the pcs_interfaces mask in phylink_config.

The late add and release operates on the phylink supported_interfaces ONLY
when the MAC didn't specify support for it (by removing it as only the PCS
will declare support for it)

The confusion is present because everything is validated later on
major_config so those supported_interfaces are just an HINT that are later
verified with get_caps and with the pcs_validate OPs.

Adding the supported_interfaces to phylink is really to keep an original
reference of the value. This is to address a pattern I have notice where
the MAC driver always OR the interfaces with the one supported by the PCS.
(I remember it was pointed out by Russell)

But I'm more than open to discussion as this is something marginal to the
whole implementation, I'm also questioning if this OR is actually useful to
anything on the nth tought on this.

One thing that I notice is that parsing this early with AND might be
problematic at phylink_create, but I still have to evaluate that.

My take is that would be good to have some review also on the other logic
as I think I reached a point where Sashiko starts to comments on more or
less unreal problem.

> It's not an error in your code, but I think this is worth documenting
> somewhere as this changes one the things that's already fairly
> error-prone in new drivers.
> 
> I don't know to what extent people use that, be we have a porting guide
> that explains how to use phylink in a MAC driver, maybe an update in there
> would be nice as well :
> 
> https://docs.kernel.org/networking/sfp-phylink.html#rough-guide-to-converting-a-network-driver-to-sfp-phylink
> 
> Maxime
> 
> 

-- 
	Ansuel
