Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF337224F3
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770839148; cv=none; b=Tk8qMhoMIuIJWNJjOg0JlmY2b2vjKvd3EcOm81yUMZuYzlBJDJO6wHiV3yBAWtD2nt2mSTZIuTpvP8K+UtHi55dyTGROQ2poUwTQgWaOZLtjr99vyaVtBKVDjon4oZbtNxAL4aVO834Dt6z2fIDYAKpjGTg6XdMXPSJfyILwsIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770839148; c=relaxed/simple;
	bh=mE2WC4ojzzTYCLYfUzuFmWfKm2Y2l+egrG57YnM41T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmKBV4aV3lAjxODH9lABiM4FYxVKJ+1PavrDPlFd85ew6rbkPlSyKEHYyDakQz5bP9SeSPSpirGiAnB5WXzYozwC5PQUHYp73LVnpuoLbeVH/12U12o6cgbWgL4VnlqsxIhJecYktHDIFGSc864TzjGHQREY6thqONnxPrAWbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WR8V8k/a; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WR8V8k/a"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee9463ca3so6135995e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 11:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770839145; x=1771443945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sATJTWP6VGxlaE427y6MSJ+Bn4pIXNhYj+8pUC44xQ4=;
        b=WR8V8k/aTmoGoXwIoJPo33j7B6bv62eBlPTswhGa4CQoFXm8ehU3Dyb0kVnvLVrFCl
         7BgfoK2WUFsuhGlBAGlUE7sDJ1WS8qUgbSvrSrgt+nj6XfCktptupA69UazrYsJuetOW
         wsnTLZR+Jeynt8A7CaN9yIHdkyesEg4CeJ3A3qOSF4Ci8B6RfPAtNRx6yXW1c1qGLNDB
         8lcTCSh3mS9S2GZcRwlgWWZ1XcexXbchkxMi3Y729AU5DadYO8BxS6UyGuX2VU/mtSUF
         rPMdKpVFjGvpC1SPfboFxBxd+IVOpZz2KTOkNyBcrl6wNZpgN+cZ5HwyO34viQIxOB4A
         kMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770839145; x=1771443945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sATJTWP6VGxlaE427y6MSJ+Bn4pIXNhYj+8pUC44xQ4=;
        b=wydA/kRPWvWM13WUdPRWJ2374xO9UZw8fJclnmfUVehXs4OH5Pz/xo7saXH/1aSC4h
         tVAksHQxfxnBVDTJ+fibNoqkCcUhxozlGORQC2m4MxxaxGrj9gJA5loIuq0TTsCBckPl
         HWbUtbCLv01tr526YWNLqRGJ+K+qfL3ltqL3v4qbGkyAuC0nP7J/LfzGgPQ/WN4zzoAX
         tM5ZgK2mmq1jgfkfvruDhIHNtNgLMKYL6IPpvpyz4mMY+e5mJAcUO0zzW5aSry7KUs6U
         sH9v+A3rirywZQQFSnaI/F8yyl/naEN5hL6MteJrMA0HHKpj46HgU3+XZjkq6Sh1YWz/
         nhQg==
X-Forwarded-Encrypted: i=1; AJvYcCWeIzp6iE8V4Wpy6nrbv21ZCpxmzPFN8ewswhhfepqkUX3PvBQkvdwSD5CGiIcFbhi4kw3Lc8PN46I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1IMVfz+8hE9+Fcxqsv6YhzYbL+JwpSx8r0Gv4QNxafRRgr4a
	2/tDc7JrK9gaj9G/JM6en/WUok5vYJVIIjJgB07xewntOTKJnVtvTAq2
X-Gm-Gg: AZuq6aLefcMOXZBakaxHNnL8F3ko1MLzLHM/QHYciDRv2pAs2Bn2s7O+IN2NSYYd+2s
	P/1LufPbviSXbsMmyIv01N5MwG0SSMW7uvTg5pbEnPaqx3cPZps74z9uiv7pAnZ5sZCrwvh+JBX
	QHCDl/94ZqzAvK0shYCITUini/l5v97ocT6bX/7+mwueVtlKJY4emT35BBK41ybx13oJ98O/r4e
	mNiGoLqBZwyrofTnUArj17iVw+wLw4AWeH5f6IvXzO/dtmXTFU2MAgHvkxCkTTIGrof0ZOGUr/T
	Q+PQMsoxfHx3Pu/7dFgUa+EoJ5zLpaCnoritdr+FNhNiazNOJCwTwl498D1Oh94BFu9c2q9MDaH
	tHJ9DkFBBJSEOtC44OszgZraWE59CuL8ZAelwlpP4BZF63+iZ9cqltV4ARhtnCSHrE3HDihnp6Q
	6k+mHeooG0auKB6s4=
X-Received: by 2002:a05:600c:1d9a:b0:480:6612:253 with SMTP id 5b1f17b1804b1-4836570d35cmr2840895e9.3.1770839144977;
        Wed, 11 Feb 2026 11:45:44 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm208008415e9.1.2026.02.11.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:45:44 -0800 (PST)
Date: Wed, 11 Feb 2026 21:45:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <20260211194541.cdmibrpfn6ej6e74@skbuf>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <20260211193006.ad2piivyoqhvg22r@skbuf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211193006.ad2piivyoqhvg22r@skbuf>

On Wed, Feb 11, 2026 at 09:30:06PM +0200, Vladimir Oltean wrote:
> On Wed, Feb 11, 2026 at 06:15:11PM +0000, Russell King (Oracle) wrote:
> > On Wed, Feb 11, 2026 at 05:48:39PM +0200, Vladimir Oltean wrote:
> > > My 2 cents: I would actually remove any reference to any sort of preferred
> > > call order. There's nothing in the framework to back up such a concept.
> > > Just say that it is recommended for PHY provider drivers to not rely on
> > > a particular calling order, such that PHY consumers have the freedom to
> > > choose depending on what suits them best.
> > 
> > Sending out this patch was a last ditch attempt to get a response to
> > improve the "generic" PHY subsystem, However, as the issue is now
> > almost two weeks old, and the current patch series causes a regression
> > according to Mohd's testing, I've rewritten the series to be a finer
> > set of smaller incremental changes.
> > 
> > This has meant dropping the idea of using the "generic" PHY subsystem
> > in generic code, because as "generic" PHY drivers are currently
> > written, that's just impossible given the current state of "generic"
> > PHY.
> > 
> > There are "generic" PHY drivers that require to be powered up for
> > any of the phy_set_*() functions to not error out. There are also
> > "generic" PHY drivers that require the PHY to be powered down
> > before calling phy_set_*() before the new setting taking effect
> > at PHY power up time. In this group there are drivers that error
> > out if phy_set_*() is called while the PHY is powered, and there
> > are drivers that silently accept the call, returning success, but
> > do not change the PHY mode.
> 
> Are we talking about PHY_MODE_ETHERNET generic PHYs here, or in general?
> 
> > This makes it pretty much impossible for platform independent code to
> > know the correct order to call the functions, and what to do if an
> > error or success is returned from any particular API call.
> > 
> > In other words, it's a trainwreck as currently implemented, and this
> > was my attempt to try and get some consistency.
> 
> Do you have a list of such PHYs relevant to phylink? We can still
> document the expectation, and modify them.

To (partially) answer my own question, here is what I found so far:

commit 5cb630925b49dd13bf3aa43f299b11615c8fe9cd
Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Wed Feb 1 22:14:53 2023 +0900

    net: renesas: rswitch: Add phy_power_{on,off}() calling

    Some Ethernet PHYs (like marvell10g) will decide the host interface
    mode by the media-side speed. So, the rswitch driver needs to
    initialize one of the Ethernet SERDES (r8a779f0-eth-serdes) ports
    after linked the Ethernet PHY up. The r8a779f0-eth-serdes driver has
    .init() for initializing all ports and .power_on() for initializing
    each port. So, add phy_power_{on,off} calling for it.

    Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

This needs to be changed, for sure.

I'll take a closer look tomorrow at the rest and see how bad the
situation is overall.
