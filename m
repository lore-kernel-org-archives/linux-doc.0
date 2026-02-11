Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5574A1E0DCB
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770833721; cv=none; b=ZViMFba/al6AHjpogCDmSaoLbDXiA/TR43JQ8xuDlIZfavV95QBnawNGrNdjFpaRhT1//gzYZdam1o5TWEKQ+IJjQY6fqDzU4sWEbDCKobzfD80GhYrGoeEBmZfamJ2skNBlCOAbqY5cwA6cQEuwZ9VTOobmU+2X098nYANyyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770833721; c=relaxed/simple;
	bh=oYbuBPvKTBuIg7/UdNT3jk8bVDpuZgxN8MJT00linvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmCk5K8UuzewZMJD6qJoVcHJAoxFJcG1vbU6lMg5cUJepmd6iqAAHXf8oM/xW3IFVynqm5PEcLr0eku2+TvsRh/4jfmbdCNcPfhUqTg4BeY/7HFEhiW/0IACFlWvBiu0eQHaYPCO2a/sgWPmqaB3vuKTF50VMLhLOgGf/qzgNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=TYOrP/uG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TYOrP/uG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q0b/9mHXAHkCPQF6gj490znq+sb7w5XclW4QCSC8pSw=; b=TYOrP/uGrV77kDLeFcNNMBGk2o
	T8Tjirthzd16f1R0GZMmVz4YKJfkqcHn2r0ard0/GK+XlrcN+VSAXk7Pu4p2vg7eokxQyPuYy3gIu
	wf0Szeqy7s3Rh8UhFuawsNFdK0TV0bzjqSTZFMCHyMJOx7d7NhT6/evzn/BBjFUyRbXOzH7Vz3eZv
	mZoyr7TrHvMBQ/IK66uV9nhwjU+hTOSblcPA6AUp3ewog1/xAcYcHOvGILQkY5ue5GFG6k4q+ZbCs
	Xaa4g6sIGjFonS7g6kL/3EcSAI0jy5o1RtX1ac3xEXFODtjDZVYmMlzY0QB/Q8vs5ShB+BxGY7pOE
	aLYTtBgw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32944)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vqEk6-000000003cF-2Avd;
	Wed, 11 Feb 2026 18:15:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vqEk3-000000003yM-1PDT;
	Wed, 11 Feb 2026 18:15:11 +0000
Date: Wed, 11 Feb 2026 18:15:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
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
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Feb 11, 2026 at 05:48:39PM +0200, Vladimir Oltean wrote:
> My 2 cents: I would actually remove any reference to any sort of preferred
> call order. There's nothing in the framework to back up such a concept.
> Just say that it is recommended for PHY provider drivers to not rely on
> a particular calling order, such that PHY consumers have the freedom to
> choose depending on what suits them best.

Sending out this patch was a last ditch attempt to get a response to
improve the "generic" PHY subsystem, However, as the issue is now
almost two weeks old, and the current patch series causes a regression
according to Mohd's testing, I've rewritten the series to be a finer
set of smaller incremental changes.

This has meant dropping the idea of using the "generic" PHY subsystem
in generic code, because as "generic" PHY drivers are currently
written, that's just impossible given the current state of "generic"
PHY.

There are "generic" PHY drivers that require to be powered up for
any of the phy_set_*() functions to not error out. There are also
"generic" PHY drivers that require the PHY to be powered down
before calling phy_set_*() before the new setting taking effect
at PHY power up time. In this group there are drivers that error
out if phy_set_*() is called while the PHY is powered, and there
are drivers that silently accept the call, returning success, but
do not change the PHY mode.

This makes it pretty much impossible for platform independent code to
know the correct order to call the functions, and what to do if an
error or success is returned from any particular API call.

In other words, it's a trainwreck as currently implemented, and this
was my attempt to try and get some consistency.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
