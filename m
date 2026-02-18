Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B6D1F8AC5
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771420551; cv=none; b=AeDYp48RWINs8iQojwKFZ5KAt1BcaWwbw7jeGuAWesCgSk/VtI8F4t2g8cw7wUCXJfQ4g8lv143m1Tqq8uqKlgx8rOwXFnkbBRG6jJHGIO7Rk8S6F34Qkk+justHpMdLriqL0JQ3Jh+vPLdXtm2amZGs3miy3RUXjBgy4hHCs/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771420551; c=relaxed/simple;
	bh=k67gxbryHtu+qb9whgSjlhg//TJM138owoOgpco5tDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ZN5Tn6J4vKfWihP/YTXbb4/3qHnq5kI3FWgUOcYMmEvaLAfmjKMRVdiVowc1cACdf6a5OwfG39TX1qsfSSf4hIlPnnNcqp2r4owAdLy8PXvKSzW2JP6JikXm3nGzXZrDp4JktEU9rkbJCennLvZVC15+w7jlH5dtEIBPJ8ULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=tw8dXyxk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="tw8dXyxk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cnm5gy5oWjvAO6IhGzhslh5673gaCJdxuAvhTcQYFf4=; b=tw8dXyxkxi7zpkQGd4mT6ao0EH
	EMkTh4y/f4F8/aGdR9LWYirEhlozZMOwtzubg/1bYLp/qfocXT+aAXj/clpDws0X4wYDU/pwl0Mhl
	9wPPSfTJ2bYDGavPWn3u5H+jtYkSQ8oLsQteaJIrc2YUaGO25KX8pV2A5mbK1MZnF6J9bC3xf81KA
	E/GT61Ax6jNXfnmBPlOxW5kDFH0THdMPZOPIHFq/32FOKDNX6GRhn/nEgXW1sokDnrgOjrO7KPSCF
	m0uUwzhsfL4DN9Fx6sjr5tegeSGnPCgKRYjddhy/hRNbtMFUDqqUhJx6JKGUBG8YRgBvVqtRuP7Gk
	diPnvnRA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55270)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vshP7-00000000055-0Yr4;
	Wed, 18 Feb 2026 13:15:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vshP5-000000002H4-1CW9;
	Wed, 18 Feb 2026 13:15:43 +0000
Date: Wed, 18 Feb 2026 13:15:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vinod Koul <vkoul@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <aZW7fz6F-u5vJv64@shell.armlinux.org.uk>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aY1f48Db7KeYRR87@vaman>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY1f48Db7KeYRR87@vaman>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Feb 12, 2026 at 10:36:43AM +0530, Vinod Koul wrote:
> On 11-02-26, 17:48, Vladimir Oltean wrote:
> > On Thu, Feb 05, 2026 at 02:56:15PM +0000, Russell King (Oracle) wrote:
> > > Update the generic PHY documentation as a result of the discussion for
> > > the s32g submission.
> > > 
> > > Link: https://lore.kernel.org/r/aXtvDn_-pCuKPrnf@vaman
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > > I didn't get any replies to my follow-up question to Vinod:
> 
> Sorry to have missed that...
> 
> > >   Please also indicate in the documentation whether changing the submode
> > >   of the serdes (particularly for ethernet) is permitted without doing a
> > >   phy_power_down()..phy_power_up() dance around the phy_set_mode_ext()
> > >   call.
> > 
> > There's certainly nothing *not* permitting that call sequence.
> 
> I agree on that. The documentation can be update to reflect that. Common
> logic would say that we should set things up before powering up, that
> should be the guidance here as well.

This is what my documentation patch does. It adds the possibility of
calling phy_set_mode*() before phy_power_on(), and recommends calling
phy_set_mode*() at that point, rather than the current situation where
the recommendation is after phy_power_on(). It leaves the possibility
of calling phy_set_mode*() afterwards in place.

It isn't clear to me what is required here - it seems that there is
disagreement between Vladimir and yourself, so I'm not planning to
submit an updated patch. Someone who knows what they're doing with
the generic phy stuff needs to propose a patch, and that ain't me.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
