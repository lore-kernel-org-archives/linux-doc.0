Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4842352F92
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838212; cv=none; b=YjYCb11CAM6F4YyphyflV8YSH5bSVnHEQlx9F49UJEKO5ipirMaEsLHBFT0RnbVeg0ZMR9f6P3OLnJud9yhFgoA28SRDx/ECsQq5Y8+nFSrxgjcJPbUwggU2+xRctQhlPmJiHogGqTEG8bHUvsfRV0DSDzfayyfi4o3dZIl70cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838212; c=relaxed/simple;
	bh=tJk7zUl+V8ZL1bEXylqXDs3c1y60CDIEXdX8BwHLRwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdI1Xug9TEOaB0GNCA+H7yNU2z+0BJ/5KO0r1IsqXHioV2mnmr6NLSoxTRJtts57GuPOBuTjJ/AlTQ5uLM62kANHJiwGidg/OtUdHZcKwen1efbvDfvSGizO9ooRTD0yTNtBro5r+JvvcWXpipMlPb3d1eIQhVSk0GrdTO+R7YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/ZW2qtL; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/ZW2qtL"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4830f029407so10248035e9.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 11:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770838209; x=1771443009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhwCRNFlRYh87Mc83Zq8JMicvS9mTTgPjf8zviSQBYM=;
        b=k/ZW2qtLrrrtelz51NNWloqDeQWKeem1E26i+fHuMt24RWfMg2O2YG40oGNEaREu5+
         SOEB005rnb58wTYPMPIcbpA4jjpJZBlACRZVaYvweCgtUuZk05s8avNd2PBf4RuAaWPO
         DYkCjJmhOZjAQeBJYfEVnMd0S7yTno5B43ElGpEL79MOYXYW3AUGylrvp5/c2h7xpt/q
         Du65F+g1xMv2tjvMZqqIfawTBp6z30Pq2K0CxCuw9OWbXHOA/mtG4D7RJGtDDapl4lRK
         SfvwVVkjSUWAOlR6nugWE0NfMgg35hk7o0kXQIMGykyZC23Nhkzgm+HPHnwOh/a62Tjt
         kYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770838209; x=1771443009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhwCRNFlRYh87Mc83Zq8JMicvS9mTTgPjf8zviSQBYM=;
        b=XdPhWKmS0e7XshzLpTwb+HHyekfDcTxygWm6IDgN235+ZkWmmGpd+7zRERAHmDc4Zb
         QTWlHxFr41OSRwprlkKxjYclejg2ELPZH2gCPFXJfdfRJrtItClVZt/piOE7a54mT+DE
         xh7wBpxkyzDDvLWUF3bAl5LOKHBGpHLC7iBIPA0NsQ6C8uO8Ld4bbpBTteQ32AUr1mSM
         +DaQeFlDfBy7Id9Al0iaantZaICohrydSBzPIvHmrKdN25PiKMt7G0MRciTHeDAfoFb+
         s13UrjuGyoSL4VU4SdqMxvXVpWzyEC/RKvkHmLo09iC5Md1xTWN4aa1LkaiWpXHSLYpY
         BVLw==
X-Forwarded-Encrypted: i=1; AJvYcCXSEvhlsj3HmGRUU57h6CGWpAwXP2dhXOUI0vh1yLhVAJSFaQBCb7LzmM1M6LDn4NfbsahVGv8Sf58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWiEhjH0kZi7mgq5FNvZ32icT/4e8MZuKitBI70DR1OCdy4coh
	bcpeuj5BDP/1KyAcOXS593La73bRxkPXRMBwyj1BBFghPRSvizzttggD
X-Gm-Gg: AZuq6aJlUSAAirsgNBEvtA/D602ONSTbnPkO1i+twNlE5BCFkNZROngNf2HE8p2N0LE
	u3xfTfiEdhAa6qC/LBK2lKwP3hp4nWLNsoAGseE6YwZV1x8fvaLssdYUDfEbSpR6Y95lpCy3UFX
	5wgahdLMYafOlOPUDrz0OW+MBD6H0ulbooh+UwbUge07A6r1GkfpJUqfrvFP2a55lTbPZpzygKT
	5hu877LzdFSdzXiIGB1m4txh2g7jhkTe1XbdXgp3NDr+XaMaKnYEJW9IueMCZE3B1AjTmcnH0g6
	gPVMwYQUMzrml7RsESjnynzWahqzyBn2zYz3aDM+RKC3/tY96kQ3L16SLb6hjTb0ZbM3KotZwHP
	ZIB4fDIyXeqzLdHUGT/hM/1vedA7209Nu96paZUqad8tRU1TRyR+OkRZh5E2WK7NMaCS+SegP0j
	Z230xLLTJD39GfeXQ=
X-Received: by 2002:a05:600c:a09:b0:477:9fa8:bc99 with SMTP id 5b1f17b1804b1-4836570e260mr2336315e9.4.1770838208998;
        Wed, 11 Feb 2026 11:30:08 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d46f9csm6295445f8f.10.2026.02.11.11.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:30:08 -0800 (PST)
Date: Wed, 11 Feb 2026 21:30:06 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <20260211193006.ad2piivyoqhvg22r@skbuf>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
 <20260211154839.lbh4uovxr5b5s4nv@skbuf>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>
 <aYzHL1qwew5p-xoq@shell.armlinux.org.uk>

On Wed, Feb 11, 2026 at 06:15:11PM +0000, Russell King (Oracle) wrote:
> On Wed, Feb 11, 2026 at 05:48:39PM +0200, Vladimir Oltean wrote:
> > My 2 cents: I would actually remove any reference to any sort of preferred
> > call order. There's nothing in the framework to back up such a concept.
> > Just say that it is recommended for PHY provider drivers to not rely on
> > a particular calling order, such that PHY consumers have the freedom to
> > choose depending on what suits them best.
> 
> Sending out this patch was a last ditch attempt to get a response to
> improve the "generic" PHY subsystem, However, as the issue is now
> almost two weeks old, and the current patch series causes a regression
> according to Mohd's testing, I've rewritten the series to be a finer
> set of smaller incremental changes.
> 
> This has meant dropping the idea of using the "generic" PHY subsystem
> in generic code, because as "generic" PHY drivers are currently
> written, that's just impossible given the current state of "generic"
> PHY.
> 
> There are "generic" PHY drivers that require to be powered up for
> any of the phy_set_*() functions to not error out. There are also
> "generic" PHY drivers that require the PHY to be powered down
> before calling phy_set_*() before the new setting taking effect
> at PHY power up time. In this group there are drivers that error
> out if phy_set_*() is called while the PHY is powered, and there
> are drivers that silently accept the call, returning success, but
> do not change the PHY mode.

Are we talking about PHY_MODE_ETHERNET generic PHYs here, or in general?

> This makes it pretty much impossible for platform independent code to
> know the correct order to call the functions, and what to do if an
> error or success is returned from any particular API call.
> 
> In other words, it's a trainwreck as currently implemented, and this
> was my attempt to try and get some consistency.

Do you have a list of such PHYs relevant to phylink? We can still
document the expectation, and modify them.
