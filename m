Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2510A2DAFA8
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890742; cv=none; b=N9G7BmNmBfoenK8DrjzNTIF8ewPZJpmZn+Y+eRFd2QrlLMezTFP4H706TJwXl010qEFGfDyLQccyaYqoDLd6CX4n1/ySNEaubT/SzbGxAjlx2HobUlrxkmfsFfOpp2zkYRwUODkbpa/7uCNGte72S5o5xrNyBgOITzpB+v2R9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890742; c=relaxed/simple;
	bh=2ZESek0F7JmK9uZ004GfMTv49kI/SFXtzWjcGEo+9Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXxnYcKOlJQJ5zQ7GIQ3kJJirbBwjcx0QDE8eDsMn1/LAGb2BKhpZuNyPIbrgiISHVRqtstVRco2exKjOunLGTS6lwNuG93HMEQx8njiMTH14ewEXb3XFzqAhWXm1uQbdFYjhUIH5CIDRHUvnvgG44PbqMJKU7aI0YNv0LSc+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HyhOvWsT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HyhOvWsT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=avMG8SoJujkdEZaQJCR7zVj6TeIgcCLDNF+ZZQfHE2s=; b=HyhOvWsT9MqMOm9yM35LpPlh8Z
	MfDuyINGgezrTFzQszVrgKXw8JkJYFRR9gQz0njDnZcuL/V3dHw3/XDZvGrauVgP9KaigzsCxjV4y
	xVz5fdhSKxDo4W/gKSO/m3HZ4QT1+ue1CQ21BnYS7nCk9cuJ8XqmJmDWMDkDAfFgOuJXx4a2o3pRz
	h8mKAtd0wO4jOa0EJ79enxP9nn31o2XtC73m0AyNGNQZvcs1JXmIuEsIYeqU6ixkqGSmF/9zVxnN0
	4sVPuDKr9Y3+3mwZWqz1KtHRVJXnkJ9/2q///ndk3+CG+nfCqzvHzVEnADMRTF1XMvZTB3O6gkTNg
	ZWebTCqA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58696)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vqTZq-000000004P2-0qls;
	Thu, 12 Feb 2026 10:05:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vqTZo-000000004gY-18aD;
	Thu, 12 Feb 2026 10:05:36 +0000
Date: Thu, 12 Feb 2026 10:05:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <aY2l8LgKyrohB2rP@shell.armlinux.org.uk>
References: <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <20260211193006.ad2piivyoqhvg22r@skbuf>
 <aYznE1FIbs_0OcPR@shell.armlinux.org.uk>
 <aY1hs4XKZSpvKd3B@vaman>
 <20260212091332.qcpi3qyynmdp4acv@skbuf>
 <aY2lFTIALH7qEJmM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY2lFTIALH7qEJmM@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Feb 12, 2026 at 10:01:57AM +0000, Russell King (Oracle) wrote:
> On Thu, Feb 12, 2026 at 11:13:32AM +0200, Vladimir Oltean wrote:
> > Also thinking out loud, we could do something else - introduce something
> > similar in spirit to CONFIG_DEBUG_TEST_DRIVER_REMOVE, which would be a
> > debug option that sees what power state the PHY is in during the
> > phy_set_mode_ext() call, flips it before calling ->set_mode() (calling
> > either ->power_on() or ->power_off()), and restores it after the call.
> > 
> > Having this option should also give PHY provider developers a quick way
> > of testing both calling orders without modifying the consumers.
> 
> I don't think anyone would enable that option, beause clearly what
> happens is they develop their generic PHY driver, and also develop
> the consumer of that generic PHY driver. Once it works, they say
> "job done" and submit it.
> 
> I was thinking that maybe some automated testing is needed, but
> that runs into other problems:
> 
> 1. any test code doesn't have any way to determine what a PHY
>    driver supports, because phy_validate() is optional. So it has
>    no way to know whether e.g. PHY_MODE_ETHERNET is supported or
>    not. Calling phy_set_mode() isn't sufficient, if ->set_mode()
>    isn't implemented, this is effectively a no-op.
> 
> 2. drivers that just return success for ->set_mode() irrespective
>    of the PHY power state but don't program the hardware would be
>    undetectable.
> 
> I'm also going to point out that phy-core allows ->set_mode() to be
> unimplemented, yet the phy_mode is stored. It looks to me like this is
> intentional part of the API, which means that phy_set_mode*() is not
> expected to always result in the hardware being programmed. That
> brings up the obvious question: if phy_set_mode() is not expected to
> always reprogram the hardware, then what phy API call should follow
> this to ensure the hardware is reprogrammed.
> 
> On the other hand, if the API intention was that ->set_mode() must be
> implemented if phy_set_mode*() is to be accepted, then surely
> phy_set_mode_ext() should be checking that phy->ops->set_mode exists,
> and returning -EOPNOTSUPP if it doesn't.

I'll also point out that other parts of the API don't even give the
driver the opportunity to program hardware. E.g.:

static inline void phy_set_bus_width(struct phy *phy, int bus_width)
{
        phy->attrs.bus_width = bus_width;
}

So, in order for this hardware configuration to take effect, some other
PHY API call is necessary after calling this function.

(While not relevant for ethernet, I think this needs to be considered
in this discussion, since it's all related to how the generic PHY API
should be used.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
