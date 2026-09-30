Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7E4766AB
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760238; cv=none; b=PYnrKfypEr8I6gL3vcn3VkSiBz9SG/zdVMSeDL0Yio53JrOqmY2A/Q8Bk/ShV0s5AlAHhX+q0I9jXZrOp1gS1vHHrwAAQKjttr3R3v1bZY4Ew2IYan/AInHfC0CJtQk/juXukxULM7fAu3Egldyfeejtp9+aNCnFSbmeCg+4G6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760238; c=relaxed/simple;
	bh=JRHA927Cm03tbqjIo2Ike/wuxqNO3aopZs4h5USPtNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyMaCxu3UMBWJ3vDLFcDSmkIMEaDzEB4V395Z5cX0TFB5ZKGpxlUO3KsPMlHXjLSN6BID2GG0Eg6/+J4n5LTAx/OJUOAN6LnaFvAQGi/aFMp59DFezo8WjZ4UxSviV9hH+UVVTBh2NQEwfnK/koou14RYgHGfHTF2/UBCJmRUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eily2dx0; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eily2dx0"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4b4770191so664619a91.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760236; x=1791365036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/L4XHSUdBohZKJ1UYQ2m/Jl2xTbitdNZU3UCx3w2VvM=;
        b=Eily2dx0q34Ho8unkOJaFE59ip5ODy1a6T78gv4EDBq7zKVey6yLDwh0hDMrX9+6RC
         ZBsms85FxN38ndJS4w7QCxOYyf1kOrnMessV8wDbLo3kxrepV42JpTIooGRr02DOpXbD
         nAOeePkQCh4SdLurJ4n5X0AM95S8eKHHORZ7LPtXD6LTgjK37E1agpmM5lG1nZk0itQ9
         i+5Vq6tSU9V+X8NeGhOwQMbK3K80EWjYyi7na52hO5FEXJxk1pFQzYHry2j47b6Yha6+
         m6nuFGX+b6N0MCLXA7jEj5/WosUCITalFoPdWrff3Paev26yKRog32ZWmSPmLwt9QH5q
         t5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760236; x=1791365036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L4XHSUdBohZKJ1UYQ2m/Jl2xTbitdNZU3UCx3w2VvM=;
        b=1ASDRcdaIQ3i7mhgIB9bsQhL1GngX00wgv8nuGFiYbeXC8Qm7JxJfJ1zRdnVOhHSmD
         98YoHyrYLxcIpch1e0pCiwqj/eFZmx2YXw+d/zf/6ieHEcH2VxMCsQjRNkKtNRrOb6Pg
         N1cvcAXk6P3lLGyebW95czcdwQsRoBNRoFlPFZzbLDlCsZrendkyh00IJ1fmGhaZxVaS
         8TgHm4So0eooPqqOSd8XsEHxipSV+zLUjTmzW4kgp6DC4POT5y38PHhTdV0P4ais8fOr
         N1j5os96IyVcyZmchKFhniGullEJHdzvm6sA2nGoOY84llNY+kA7mE5LpVgzN9Qd4Csy
         c2BA==
X-Forwarded-Encrypted: i=1; AKwUvBx+kn1fqXRWwnBRTy8PmIrlVRa8voD/XFTJ6fGJyVlnTjhbCAxITma3JeqksIsxOXpElaeffnplx5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzZw6gqpV27j5cenfu/QQQpF/C0wWAVbZUpPoFk+LgaCrAMOfB
	FNbExP56RiZLCK3AbsrU7JDtTcK3JQNd5JOf+S1ThYbm89czqk1tvoG6
X-Gm-Gg: AYBFou00MHCa6ZnB6jUz8gZxS4iBAcXFl/PrdwrlwRQ66UwKxRjVABrYJrn/JwPdP4t
	uDnnDNsZ3EyB4imeEyGjcExXWVnFNErKBp6oYDnxkLb2MktSYWXLRf0b9EQs2ZnQDS4ZAXeRAZw
	NdMs4xoQj2WWLJYpEG1uQZdD4irBb1keq3M8beWxJ52E+xi/RpJqc0v2VUbc20IOPKg6yk0Th9J
	CtOejJXGMdBJeGjaD3l5ELDExHP9xafjXhG7QuJaioDIYpPyeCQQ0CFjWzSSLoz+HVRo7sr0t0N
	Arc+Hs5Bfk2SniLUGpOj1rmFfU99davtT8T234sz+7uDR/VrLjiGiO/EDtAUVyjxWRv1UaQa5xL
	95eheH6059yUErGdF2RgeYZANH3cfxkSzSwIsiybAmyh8F06HbT1TOz90LdtgBIQ9CLX9AzkIZG
	g5GeSWnNDLvLrLIKMAeD7lZTDe5LeLnAGYByIJaOfN3lfO/UDZI+B5hppwy/WIV6z/16gx
X-Received: by 2002:a17:90b:4d09:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a4d18c0f59mr733608a91.49.1790760235777;
        Wed, 30 Sep 2026 02:23:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce40a6d5sm2319062a91.15.2026.09.30.02.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:23:55 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:23:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 4/5] phy: core: Add managed phy bulk data helper
 functions
Message-ID: <arzU-dIIxrHt-wW7@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-5-inochiama@gmail.com>
 <arzITUCmgUp3uiRn@ashevche-desk.local>
 <arzSkE1kY_u4jJWT@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzSkE1kY_u4jJWT@inochi.infowork>

On Wed, Sep 30, 2026 at 05:21:08PM +0800, Inochi Amaoto wrote:
> On Wed, Sep 30, 2026 at 11:29:01AM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 29, 2026 at 04:52:34PM +0800, Inochi Amaoto wrote:
> > > Add device managed variants of the phy bulk helper functions. So
> > > the driver can benefit from automatically managed phy handles.
> > 
> > ...
> > 
> > > +int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> > > +			     struct phy_bulk_data **phys)
> > > +{
> > > +	struct phy_bulk_devres *devres;
> > > +	int ret;
> > 
> > > +	*phys = NULL;
> > 
> > Why?! In case of error we modify the output, this is usually not the best
> > approach as in most of the cases the expectation is that whatever user
> > provide (including a garbage) should be left untouched in case of an error.
> > 
> 
> This is something I think this is wrong and I need to removed.
> 
> > > +	if (!np)
> > > +		return 0;
> > 
> > Same here. On top why do we even care about np like this? Interestingly that
> > some other APIs consider this as np == dev_of_node(dev) case, and automatically
> > propagate that.
> > 
> 
> After a deep recheck. I think you are true. We do not need to care
> about that, just let the internal api decide whether it should be
> an error is better. I misunderstand that it should check it at early
> stage to avoid some bad use in the following logic. Now I found it
> is meaningless.
> 
> > > +	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
> > > +			      GFP_KERNEL);
> > > +	if (!devres)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = of_phy_bulk_get_all(np, &devres->phys);
> > > +	if (ret > 0) {
> > > +		for (int i = 0; i < ret; i++)
> > > +			phy_add_device_link(dev, devres->phys[i].phy);
> > > +		*phys = devres->phys;
> > > +		devres->num_phys = ret;
> > > +		devres_add(dev, devres);
> > > +	} else {
> > > +		devres_free(devres);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > 
> > ...
> > 
> > > +static inline int devm_of_phy_bulk_get_all(struct device *dev,
> > > +					   struct device_node *np,
> > > +					   struct phy_bulk_data **phys)
> > > +{
> > > +	if (phys)
> > > +		*phys = NULL;
> > 
> > Same as per above.
> > 
> > > +	return 0;
> > 
> > Why not an error? I do not see the _optional word in the function name.
> > 
> 
> IIRC get_all it a special optional meaning: treat not existing device as
> 0, this follows the same meaning like clk. Vladimir has a good explaination
> on this in the previous version:
> https://lore.kernel.org/linux-phy/20260907124318.6q4rr2huxyehm3zs@skbuf/
> 

s/device/property/.

> > > +}
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
