Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699E2749E6
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 05:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770873271; cv=none; b=upcI+ZHMa8as2Hxw1XR3nnFbZjE1RnR6KpYPhpa4aw3rzbeHX7my+ReW3Bpv8J9oiF0A+ubP/+XKcJFogRWD4Mg6N1GWu1EJXbia6LpMp+fflFVyig1JsS8iOPpuTMkfGBGHNc57gp3UuB4VMCxdQM+4QR9Nt+mO4+0sJagZCzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770873271; c=relaxed/simple;
	bh=x7flGFEELAHhX82XD/y4om4vmEx2CjaiY+ntpPc7VJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ9T36CqhC6GxiRSxwpBrgwBFmw2ONRXKLNckVDAKwizI6YPCzkD7l46UJoccXIdjCimLvyHXQF/I9erUEMthvCDBs22egx3QN1r1Ya8mOZ8NUInmjXbcF5/88MZgAcGWpejkaaH9kBmKy6RNTsfDbLAFxfmspBzfPYSJEUefiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF8rCJ3u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF8rCJ3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC41C4CEF7;
	Thu, 12 Feb 2026 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770873270;
	bh=x7flGFEELAHhX82XD/y4om4vmEx2CjaiY+ntpPc7VJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nF8rCJ3uhb7GFcSoU2LLFUxrnwOhYlYlLS0NCBxDNWPK7YNvWT++NyvYmoLd8rQUT
	 McchWqyj3qiNVmjqL7QtxZsPkm+h0NjZCsKF50YxQ4rm8jhhuM7R2g/37EmQEmMJEb
	 z0XNOYWVgxqbhH+3S85gdhSUjwvzEIL8NEiDGZt7avjRd8dE8pRjzFaYpFYFpKkgs3
	 Xv/cvyFk9SWbPVU0sCKCgnzWJyQQUTAGSg5Ysl2TkbvCZnQENAMvUq0gOfvflJMpX6
	 RdvVFxegykQ19JtXQUpl9+kyEkBPaHq+j/SiTKEEKNTgNi0yqzT9wPyrel2ZFN0gcx
	 Y1vgmRwCl3Xnw==
Date: Thu, 12 Feb 2026 10:44:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <aY1hs4XKZSpvKd3B@vaman>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <20260211193006.ad2piivyoqhvg22r@skbuf>
 <aYznE1FIbs_0OcPR@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYznE1FIbs_0OcPR@shell.armlinux.org.uk>

On 11-02-26, 20:31, Russell King (Oracle) wrote:
> On Wed, Feb 11, 2026 at 09:30:06PM +0200, Vladimir Oltean wrote:
> > On Wed, Feb 11, 2026 at 06:15:11PM +0000, Russell King (Oracle) wrote:
> > > On Wed, Feb 11, 2026 at 05:48:39PM +0200, Vladimir Oltean wrote:
> > > > My 2 cents: I would actually remove any reference to any sort of preferred
> > > > call order. There's nothing in the framework to back up such a concept.
> > > > Just say that it is recommended for PHY provider drivers to not rely on
> > > > a particular calling order, such that PHY consumers have the freedom to
> > > > choose depending on what suits them best.
> > > 
> > > Sending out this patch was a last ditch attempt to get a response to
> > > improve the "generic" PHY subsystem, However, as the issue is now
> > > almost two weeks old, and the current patch series causes a regression
> > > according to Mohd's testing, I've rewritten the series to be a finer
> > > set of smaller incremental changes.
> > > 
> > > This has meant dropping the idea of using the "generic" PHY subsystem
> > > in generic code, because as "generic" PHY drivers are currently
> > > written, that's just impossible given the current state of "generic"
> > > PHY.
> > > 
> > > There are "generic" PHY drivers that require to be powered up for
> > > any of the phy_set_*() functions to not error out. There are also
> > > "generic" PHY drivers that require the PHY to be powered down
> > > before calling phy_set_*() before the new setting taking effect
> > > at PHY power up time. In this group there are drivers that error
> > > out if phy_set_*() is called while the PHY is powered, and there
> > > are drivers that silently accept the call, returning success, but
> > > do not change the PHY mode.
> > 
> > Are we talking about PHY_MODE_ETHERNET generic PHYs here, or in general?
> 
> PHY_MODE_ETHERNET PHYs.
> 
> > > This makes it pretty much impossible for platform independent code to
> > > know the correct order to call the functions, and what to do if an
> > > error or success is returned from any particular API call.
> > > 
> > > In other words, it's a trainwreck as currently implemented, and this
> > > was my attempt to try and get some consistency.
> > 
> > Do you have a list of such PHYs relevant to phylink? We can still
> > document the expectation, and modify them.
> 
> These are the generic PHYs used for ethernet, so they are potential
> cases for phylink to drive. They were found via:
> 
> grep ETHERNET drivers/phy -rl | xargs grep -l power_on
> 
> 
> 
> r8a779f0-ether-serdes: r8a779f0_eth_serdes_set_mode() records the
> state, returning success, with no hardware programming. All hardware
> programming for the desired mode is done via phy_power_on() call.
> 
> This driver requires the PHY to be powered down before phy_set_mode*()
> otherwise it will accept the new mode but not reconfigure the hardware.
> 
> 
> phy-mvebu-cp110-comphy: mvebu_comphy_set_mode() records the state in
> struct members and does nothing more, returning success. This
> requires the PHY to be powered down before phy_set_mode().
> 
> This driver requires the PHY to be powered down before phy_set_mode*()
> otherwise it will accept the new mode but not reconfigure the hardware.
> 
> 
> phy-mvebu-a3700-comphy: mvebu_a3700_comphy_set_mode() errors out if
> mode is changed with PHY powered up:
> 
>         /* Mode cannot be changed while the PHY is powered on */
>         if (phy->power_count &&
>             (lane->mode != mode || lane->submode != submode))
>                 return -EBUSY;
> 
> This driver requires the PHY to be powered down before phy_set_mode*()
> otherwise it will error out.
> 
> 
> phy-fsl-lynx-28g: lynx_28g_set_mode() powers down the PHY if necessary,
> sets the mode, before powering it back up.
> 
> This is the only driver that will tolerate phy_power_*() vs
> phy_set_mode*() in any order.
> 
> 
> phy-qcom-sgmii-eth: doesn't implement phy_set_mode*() but instead
> implements phy_set_speed() and phy_calibrate(). phy_set_speed()
> sets the mode and immediately calibrates, which presumably requires
> the clocks enabled by qcom_dwmac_sgmii_phy_power_on(). No check
> for PHY being powered, so my guess is that calling phy_set_speed()
> with the PHY powered down will cause the status polling in
> qcom_dwmac_sgmii_phy_calibrate() to time out.
> 
> This driver requires phy_power_on() before phy_set_speed().
> 
> 
> sparx5_serdes: phy_power_*() controls power down mode, no check
> in sparx5_serdes_set_mode() whether powered up, but config function
> checks for e.g. PLL lock, which probably won't be locked if powered
> down. Failures aren't propagated to the API caller.
> 
> This driver requires phy_power_on() before phy_set_mode*().
> 
> 
> phy-mtk-xfi-tphy: while phy_power_*() controls clocks, it isn't
> obvious whether these are required before mtk_xfi_tphy_setup() is
> invoked. There are calls to usleep() implying a need to wait for
> things to happen before the next register write, which presumably
> require the clock to be running.
> 
> My guess is, this driver requires phy_power_on() before phy_set_mode*().
> 
> 
> Categorisation of drivers:
> drivers requiring powered down PHY before phy_set_mode*(), but are
> silent if not: 2
> 
> drivers requiring powered down PHY before phy_set_mode*(), but error
> out if not: 1
> 
> drivers that allow any power state before phy_set_mode*(): 1
> 
> drivers that do not implement .power_*() methods, allowing any
> power state, but presumably require the phy_set_mode*() call to
> setup the hardware: 5
> 
> drivers requiring powered up PHY before phy_set_mode*(): 3
> 
> So, the summary is... only _one_ driver allows the calls in any order.
> The other 11 drivers are... stick a pin in the donkey and depending
> on where the pin ends up determines the appropriate order that the
> generic PHY APIs must be called for the driver to work correctly.
> 
> I think you'll agree that this is a very sorry state of affairs.

Yes. It is lazy state from provider implementation. If hardware requires
you to power down and set mode, it could have been handled internally in
the driver. I think we should fix these providers.

> This is exactly why I think there needs to be better documentation.
> I'm not sure that some kind of test code to validate the API would
> work, because you'd need some way to test whether the PHY were in a
> functional state, and that's difficult without the help of the
> ethernet MAC.

Lets document that call order is immaterial and driver is expected to
work both ways? As I said earlier logically people would set things up
and power up, and on the fly mode changes can be handled internally in
the driver by doing off-set-on dance.

Thinking out loud, we can also move this into framework and ensure when
modes are set, we do off-set-on dance so that onus on providers is
removed. Moving into fwk might expose some bugs in drivers though...

One thing I agree is that we should have consistency. How we drive that
can be agreed upon.

Thanks
-- 
~Vinod
