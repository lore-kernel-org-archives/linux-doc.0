Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21963C1F46
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717491; cv=none; b=q7lHzFzUTt2J7SA2wY9PuMCuRMQOvWM9mGBZKO9OtzpzWitiM//eaclSO447T+KZRbN+lf3p2A3YIhbTE7gyjOPe8+yErF4GsIlrdmt8z1XOLSAn8+ROMJy8vrPh1kXNIe5BPYHCjgm1kiO2eMJl3DSLc7SPdRqMv6nUKdhpWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717491; c=relaxed/simple;
	bh=blN7kUYjZ29Lu9JrwtLJvpjU1Wy8lfqujnHxweqK+8c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzT+bWm43ezL8G2T0qGlR+LlkW+3zKxmBNpxEKBg65T/HwkFsQrVc2OFKFxZKsrYLUMMuucMchPe83BfUKYWChA1GBRRhf3JxqiVdb7VTSi9Ax0B1rgy/1/5FyNHbE7nXwdHZKkTMn9LWyoOCH1yeag/ngfo4UB0mv8cTrlrYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoKebr6L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoKebr6L"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47488efcf30so106396f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 00:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717487; x=1783322287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BovyFstc80MYHmYyIZVG50kULX+1YfHlAuIHPTiI6jk=;
        b=UoKebr6L7g61S2ib1/fbHXwppvTCC1ASPVOG2gTWyXjTEcnJTr1ZZ1tFbyCkBNX28I
         ay9ZQqGMkmaKqeiUNL1Bpy+ituRDCsTu/jrTTful/YsQ2V4upAJBk1RlUzHnFE9F7iSy
         Js1x1pW7T8syZXAMpb57x+17cn2zG3kTfBddZIGdcHwvZHOrz7jgTy3bLZSPOWXhcwaN
         8zc6BJLiedrnyhgzyP+TwCMskBECBxC/d3Dw7oYdqOCuPPd1d84yvCVWdq6Lx6En/Rgt
         knW2V5g7iTNkQhlBWIoSQbBRyuezOLGGLv/URcDeJtqZD8CfouiGkrVZPu4z0tPrf6Ys
         VK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717487; x=1783322287;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BovyFstc80MYHmYyIZVG50kULX+1YfHlAuIHPTiI6jk=;
        b=gljqCES3V0BKk4PlYSGStv+jwNuBtCc9Z2rDt3zIkRywNymKAmkEcaeWlprKO3EJes
         D9Zg1flBW1H814VqDp55O5TfM6rRTaIsBqelqzQ+APbHF6/EHQNFiz3O2bnR0GgoEhLX
         qhKXjKgo2DuBZ/zUwSm2SJ/809kD8bZmPJ5mYQ43XU9s0dQWfRePBuwH4hswxqPNBW13
         XfNX9DcfGSaozwrQPN8kFYL0eFIDJlh8pd6WfKctfksnhdOtPloXiy2tv1LW78/h+/OU
         w74TSY5NQnJi9h2hohuwDCawiqdxG7C7Tz6NpOUM4vqdvkxR3vI0Go9VmqtK3jHvYK8x
         5ymw==
X-Forwarded-Encrypted: i=1; AHgh+RoGlwpMXB7NmzS9TZFjUwTwW0V2DaHZMQNa26q/yQLGJd+a73pa+HPBbQgfweMAOgjL5ke9uNXC08Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyImO9r/hZjlJYASMm4BX31HQG2MgMfqJh03nYUuNOHAzws4vGE
	AZVNGiT61KgegVUKsc5ieoC9xZj+f7j+pWlBeC1KScFzMyYJtsZbIpXG
X-Gm-Gg: AfdE7clQVNVZNVpdd3TEvt50WhfmpOp54SQZD0yyzmko42C2guAx8V3O+wCFxemEWqz
	/049rEdEp/E+GjljVak1FfRF45RYQkiQgh9AdkLEqa49GCp6UI87Z0pFtjAMVaGgjaoisg2Frr8
	qREbAYM45hYb74nJOi01mA91zWSAaogJGoJwsaGlFzcZjEnaiW+OSn7XqMmRY6pmlT0ixei9l+b
	odjRcZObYRMSCS9Q60mfrEbya1ZlN9Si5Fw4pHXf+BkaVGwubOS1ZNQbv2ekppclt8vvVQrXTni
	mcjwZNRqOTdlv2o5UIFwCyc1yqxGTwMBN/b2Po5eDhp7sibu7cdqNOG07y38LcjbJ7H3PHbz/Jm
	Le5YzO0+EtNvfsD/bQgH0dbnUov+sDCsgGmtYRQtoD/C0rvTTY1Td9e34KmFEqT8ta526FxeYOb
	fBz+kYI68wt9ZPgAVuIzPZH5CcA3PGHVQpoqFsHMhV0xvwOq6IKVgDXnNxBLqcAIM+CU8=
X-Received: by 2002:a5d:6a48:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46fb8d93892mr12284633f8f.36.1782717486707;
        Mon, 29 Jun 2026 00:18:06 -0700 (PDT)
Received: from Ansuel-XPS. (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47290ed4377sm13297042f8f.37.2026.06.29.00.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:18:05 -0700 (PDT)
Message-ID: <6a421c2d.1e0bfc4f.b2eb6.06fb@mx.google.com>
X-Google-Original-Message-ID: <akIcKbA8zsoalq-G@Ansuel-XPS.>
Date: Mon, 29 Jun 2026 09:18:01 +0200
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
 <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
 <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>

On Mon, Jun 29, 2026 at 09:04:49AM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 6/27/26 14:33, Christian Marangi wrote:
> > On Thu, Jun 25, 2026 at 04:13:14PM +0200, Maxime Chevallier wrote:
> >> Hello Christian,
> >>
> >> On 6/18/26 14:57, Christian Marangi wrote:
> >>> Add phylink_release_pcs() to externally release a PCS from a phylink
> >>> instance. This can be used to handle case when a single PCS needs to be
> >>> removed and the phylink instance needs to be refreshed.
> >>>
> >>> On calling phylink_release_pcs(), the PCS will be removed from the
> >>> phylink internal PCS list and the phylink supported_interfaces value is
> >>> reparsed with the remaining PCS interfaces.
> >>>
> >>> Also a phylink resolve is triggered to handle the PCS removal.
> >>>
> >>> The flag force_major_config is set to make phylink resolve reconfigure
> >>> the interface (even if it didn't change).
> >>> This is needed to handle the special case when the current PCS used
> >>> by phylink is removed and a major_config is needed to propagae the
> >>> configuration change. With this option enabled we also force mac_config
> >>> even if the PHY link is not up for the in-band case.
> >>>
> >>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> >>> ---
> >>>  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
> >>>  include/linux/phylink.h   |  2 ++
> >>>  2 files changed, 58 insertions(+)
> >>>
> >>> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> >>> index c38bcd43b8c8..064d6f5a06da 100644
> >>> --- a/drivers/net/phy/phylink.c
> >>> +++ b/drivers/net/phy/phylink.c
> >>> @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
> >>>  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
> >>>  
> >>>  static void phylink_run_resolve(struct phylink *pl);
> >>> +static void phylink_link_down(struct phylink *pl);
> >>> +static void phylink_pcs_disable(struct phylink_pcs *pcs);
> >>>  
> >>>  /**
> >>>   * phylink_set_port_modes() - set the port type modes in the ethtool mask
> >>> @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
> >>>  	}
> >>>  }
> >>>  
> >>> +/**
> >>> + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
> >>> + * @pcs: a pointer to the phylink_pcs struct to be released
> >>> + *
> >>> + * This function release a PCS from the phylink PCS available list if
> >>> + * actually in use. It also refreshes the supported interfaces of the
> >>> + * phylink instance by copying the supported interfaces from the phylink
> >>> + * conf and merging the supported interfaces of the remaining available PCS
> >>> + * in the list and trigger a resolve.
> >>> + */
> >>> +void phylink_release_pcs(struct phylink_pcs *pcs)
> >>> +{
> >>> +	struct phylink *pl;
> >>> +
> >>> +	ASSERT_RTNL();
> >>> +
> >>> +	pl = pcs->phylink;
> >>> +	if (!pl)
> >>> +		return;
> >>> +
> >>> +	mutex_lock(&pl->state_mutex);
> >>> +
> >>> +	list_del(&pcs->list);
> >>> +	pcs->phylink = NULL;
> >>> +
> >>> +	/*
> >>> +	 * Check if we are removing the PCS currently
> >>> +	 * in use by phylink. If this is the case, tear down
> >>> +	 * the link, force phylink resolve to reconfigure the
> >>> +	 * interface mode, disable the current PCS and set the
> >>> +	 * phylink PCS to NULL.
> >>> +	 */
> >>> +	if (pl->pcs == pcs) {
> >>> +		phylink_link_down(pl);
> >>> +		phylink_pcs_disable(pl->pcs);
> >>> +
> >>> +		pl->force_major_config = true;
> >>> +		pl->pcs = NULL;
> >>> +	}
> >>> +
> >>> +	mutex_unlock(&pl->state_mutex);
> >>> +
> >>> +	/* Refresh supported interfaces */
> >>> +	phy_interface_copy(pl->supported_interfaces,
> >>> +			   pl->config->supported_interfaces);
> >>> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> >>> +		phy_interface_or(pl->supported_interfaces,
> >>> +				 pl->supported_interfaces,
> >>> +				 pcs->supported_interfaces);
> >>
> >> I've given more thought to that 'supported_interfaces' thing. This
> >> patchset redefines the meaning of
> >>
> >>   pl->config->supported_interfaces
> >>
> >> Currently, it's filled by the MAC driver and means "Every interface
> >> we can support, including the ones provided by PCSs that we can use
> >> with this MAC".
> >>
> >> It now becomes "Every interface we support without needing a PCS", at
> >> least the way I understand that.
> >>
> > 
> > Wait but with the current code using the OR logic, it still follows
> > "Every interface we can support...". The modes that needs a PCS are
> > specificed with the pcs_interfaces mask in phylink_config.
> 
> you current code is correct, I was mostly concerned about the doc
> that goes along with it :)

Oh yep thanks, I will update also that entry. Also maybe check the .rst
introduced and tell me if something is confusing or badly described.

> 
> So in the end, we'd have something like (simplified):
> 
> pl->config.supported_interfaces = RGMII_xx | SGMII | 1000BaseX
> pl->config.pcs_interfaces = SGMII | 1000BaseX
> 
> pcs->supported_interface = SGMII| 1000BaseX
> 
> correct ?
> 

Correct. phylink_config describing that for SGMII and 1000BaseX a PCS is
required and the related PCS declaring support for those modes.

Code will skip searching for a PCS for RGMII.

> > 
> > The late add and release operates on the phylink supported_interfaces ONLY
> > when the MAC didn't specify support for it (by removing it as only the PCS
> > will declare support for it)
> > 
> > The confusion is present because everything is validated later on
> > major_config so those supported_interfaces are just an HINT that are later
> > verified with get_caps and with the pcs_validate OPs.
> > 
> > Adding the supported_interfaces to phylink is really to keep an original
> > reference of the value. This is to address a pattern I have notice where
> > the MAC driver always OR the interfaces with the one supported by the PCS.
> > (I remember it was pointed out by Russell)
> > 
> > But I'm more than open to discussion as this is something marginal to the
> > whole implementation, I'm also questioning if this OR is actually useful to
> > anything on the nth tought on this.
> > 
> > One thing that I notice is that parsing this early with AND might be
> > problematic at phylink_create, but I still have to evaluate that.
> > 
> > My take is that would be good to have some review also on the other logic
> > as I think I reached a point where Sashiko starts to comments on more or
> > less unreal problem.
> 
> True, TBH all the fwnode part is something I'm a bit less familiar with though
> so maybe someone else can browse through that.
> 
> FWIW, I've tested that whole series on a board that has "legacy" PCS board
> that has mvpp2 and 2 possible PCSs, and it seems to work fine so no regressions
> there :)
> 
> A side note with the "legacy" naming, I'd rather have it called "built-in" or
> something like that, I don't see a clear path to porting the existing code to
> fwnode without breaking DT compat, as it's likely we'll have to remove the PCS
> register ranges out of the MAC's range. 

I think also built-in might be confusing as a SoC might have a PCS built-in
but just as a separate device on a different register map.

A better description might be "externally-managed" but that is very long...

Also the use of fwnode and DT is just to reference them and use the normal
helper but the implementation is liberal on custom implementation for the
current code.

Everything is around the pcs_interface mask, num_possible_pcs and the
fill_available_pcs.

Nobody stops from implementing custom parser in fill_available_pcs and
return a PCS pointer created directly by the MAC. (In such case late and
release won't be needed as everything is present when phylink_create is
called)

On OpenWrt we migrated every SoC that used ""exotic"" pcs reference (Qcom,
Realtek, MTK, Airoha) but I don't have a board that used something like the
'pcs' property.

> 
> Thanks for this work anyway, this is great !
> 
> Maxime

-- 
	Ansuel
