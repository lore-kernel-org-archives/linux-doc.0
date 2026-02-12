Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0D27380A
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 05:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770872807; cv=none; b=p7V9WHdltZlDUuGkaWxInX1dgeujEzll4pyONl6+ZbcVOGpDmBKCWlMLeXUF6g/6LBsO2jyJvqUOWVNYELTevNRCTVHefCle3cwBvQGt6lM5CxBesZK0J3GMZEynH1B2hmA7gEEQztVL2B0H8PpDkyk9qgViivy6/7e+bq5m+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770872807; c=relaxed/simple;
	bh=+kOtATe/aqM4mDZSdzfuvGH+xa+UlI40H+G8rauVTI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALTuF9Ay6/8H4q2Y41YQpPRB8vz0zXSHpTgof+Qza55zCYqN5btoNH3x4Hsdykt9LVQucNNLyVmM49ToxRHpEyYWP0Bq2nGuWwlh7TgoAVOsA3Y07uR70FKevW1+WgDWz9PdtLYdX1Kl6nH6LB7m49aU+706Oku1p4OEaMrik6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlLluTZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlLluTZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74A1C4CEF7;
	Thu, 12 Feb 2026 05:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770872807;
	bh=+kOtATe/aqM4mDZSdzfuvGH+xa+UlI40H+G8rauVTI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlLluTZCs/CQ09lb7/b5SDgGTYY/h+I6Y5oYD4QygvmQATT/8rQ+En1xlUsTDuGa8
	 7xEmmEo2qx1gR1fmUBtSl5oaaEbE5JPqnfumoA6pgD2qXgGqedvF53TVCbbRhPwHPX
	 AC48f5uQyFd/kqTQtxUd6PTrMuV0s0TBy6WzajYNbl5o7itcy2A824jwOMKhZrm2Mo
	 fKI2ExSv9OtDVjy8jQIUo8HwfGkx6e5wHFtJXcDdWchqSNP35JzAcor8EXTQ30a7cB
	 om5op0hpozvu0UARWuCfYnfmxA33Cyhibp4abcE++flLuEp7hoSf9+GhwLJ/dKStD2
	 DBNdGZ3Fw3myw==
Date: Thu, 12 Feb 2026 10:36:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <aY1f48Db7KeYRR87@vaman>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211154839.lbh4uovxr5b5s4nv@skbuf>

On 11-02-26, 17:48, Vladimir Oltean wrote:
> On Thu, Feb 05, 2026 at 02:56:15PM +0000, Russell King (Oracle) wrote:
> > Update the generic PHY documentation as a result of the discussion for
> > the s32g submission.
> > 
> > Link: https://lore.kernel.org/r/aXtvDn_-pCuKPrnf@vaman
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > I didn't get any replies to my follow-up question to Vinod:

Sorry to have missed that...

> >   Please also indicate in the documentation whether changing the submode
> >   of the serdes (particularly for ethernet) is permitted without doing a
> >   phy_power_down()..phy_power_up() dance around the phy_set_mode_ext()
> >   call.
> 
> There's certainly nothing *not* permitting that call sequence.

I agree on that. The documentation can be update to reflect that. Common
logic would say that we should set things up before powering up, that
should be the guidance here as well.
> 
> > I also didn't get any response to:
> > 
> >   For drivers such as stmmac, it will be important that details such as
> >   whether phy_est_mode*() can be called with the PHY powered on are
> >   riveted down and not left up to the generic PHY driver author - without
> >   that, generic PHYs basically aren't usable from SoC/platform
> >   independent code, and stmmac has bazillions of platform specific glue
> >   already because of (a) bad code structuring and (b) lack of
> >   generalisation through standardised interfaces that abstract platform
> >   differences.
> > 
> >   I want to be able for core stmmac code, or even phylink code (which
> >   is even more platform generic) to be able to make use of generic PHY
> >   stuff, but if the calls that can be made into generic PHY are platform
> >   dependent, that is a blocking issue against that, and makes me question
> >   why we have the generic PHY subsystem... it's not very generic if it
> >   exposes the differences of each implementation to users of its
> >   interfaces.
> 
> It may well be that the "one consumer, multiple PHY providers, requiring
> unified behaviour" situation you bring up is sufficiently unique here,
> with stmmac/phylink, that local conventions are not sufficient.
> 
> I'm not sure that precise answers exist for your questions. Rather,
> it's best if you could lay out common sense requirements, and generic
> PHY reviewers will make sure they are followed.
> 
> As far as the framework is concerned, power and mode are fundamentally
> decoupled, so I think the documentation is actually muddying the waters,
> more than anything, by talking about a preferred calling order.
> If there's any connection between power and mode, it should be handled
> internally by the PHY provider driver.

Agree, setting mode and powering up are not coupled anywhere in the API.
framework does not care about it. There might be provider limitations
which should be handled internally.

> 
> >  Documentation/driver-api/phy/phy.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
> > index 719a2b3fd2ab..cf73e4fb0951 100644
> > --- a/Documentation/driver-api/phy/phy.rst
> > +++ b/Documentation/driver-api/phy/phy.rst
> > @@ -142,6 +142,7 @@ Order of API calls
> >  
> >      [devm_][of_]phy_get()
> >      phy_init()
> > +    [phy_set_mode[_ext]()]
> >      phy_power_on()
> >      [phy_set_mode[_ext]()]
> >      ...
> > @@ -154,7 +155,7 @@ but controllers should always call these functions to be compatible with other
> >  PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
> >  others may use a default mode (typically configured via devicetree or other
> >  firmware). For compatibility, you should always call this function if you know
> > -what mode you will be using. Generally, this function should be called after
> > +what mode you will be using. Generally, this function should be called before
> >  :c:func:`phy_power_on`, although some PHY drivers may allow it at any time.
> 
> My 2 cents: I would actually remove any reference to any sort of preferred
> call order. There's nothing in the framework to back up such a concept.
> Just say that it is recommended for PHY provider drivers to not rely on
> a particular calling order, such that PHY consumers have the freedom to
> choose depending on what suits them best.

Yes but I would say rather than order, a guidance would help users and
providers. Set things up and power up would be a good logic to follow.

If the provider supports setting/switching mode up when running, we
should not limit that. I dont see a reason for limiting that from an
framework.

-- 
~Vinod
