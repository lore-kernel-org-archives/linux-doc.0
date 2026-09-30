Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334BF4718ED
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758768; cv=none; b=kvKoUVlmMfsl3XUuUXErKyHizHg9bHxl0LJ9IqKd8sOz3MBL7cqtxhsULyjk+3XDtaJ82VU2Afl3tH1UElSCaLfSQfxbG4vOnKAs9Y+wEjDe5yB77OKTADFqyJejXNQkZ4eFfDlbGToXfYsmwgB5+aAkjvB2XKjD6lZ5YX5CMj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758768; c=relaxed/simple;
	bh=mpQhRYCu0dg3KElr3JPFwpohTwn3Jjao9cHLc/MGV8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnFBUkmxwQtzihFiWhfNWjKHn+uVE61F9vX5vtwSmU29aKi/GZJLaMYlNfAK10Jkb+24agzZ5Vfumy6LLUZ0h+pskMXxJcyzFkMrjYraN/rEBt3STbkuReFDh3mYxFel8QqGTGAyq48RFVnNTk63haCzqIJkr8CDSRvcxvO0y3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z40h7m98; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z40h7m98"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3375555a91.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758763; x=1791363563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwqDJJxq+i6yiMKe3H7XeoLAk9BxxMBDZsuZ7Sfnq6I=;
        b=Z40h7m98z323VKNhgYINYG1pSkBNiWTyHRUIrbeNRgNEezEmN1tslyZKU4yMmcmzSb
         TfT8da0Mj9usF1wNbnfw8Lrdk5QWSTuVXeQQICZt2KxiTyujissCbjnouwhfrT/3hoXK
         P3ohdcjmi5t9XqxMR0Ja/o2cs+BM1Cun++ZJcfFDsnPgA7vGz5ocgLfzjUMsXA5q+Owv
         N7bWF8Fk/Kfhznc9d8U7ShS1iK+lecr+BaAKVJbj3JlSfb2OKiaUj+bJb5fi0QkByw6W
         T11mF5fZCyq+aAEmwPnpcXmSx6tkoFqYb2Wn28pDifwsubH1lbwjxdXWDqRXkdz6BtLV
         yGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758763; x=1791363563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwqDJJxq+i6yiMKe3H7XeoLAk9BxxMBDZsuZ7Sfnq6I=;
        b=wVcYU/ifunuo6bnu4ma/jrDfh4+aAsxXJbzXUvVXaOQLliA8kMUfhle2A8FajiGVyA
         0EWnb/Tnz8yZyp43EOGk4wXvQ6cDERU8ga5PW864ipwSkW/sQQyGF8XocUojaj1N+cY1
         RdrXE8G7rKv66ZEa0LLC+h+W1UrC9P/NG6Os4mVos2krKtEaSpYkIrcWxte0+bSHsia8
         B1yzrqZuHtJzS74s06o4oV7yO8vI1FQXAZQu5RdIsPAKHk2sqts5uIPgONLpIT3LMkc0
         f5pGxp5U/CIaN2o9dxZa1EcP/tvQOB+RAEOdOnosNAJW2E+6AkmxeeKFH1TjKFECZ1sy
         IjMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3s5zF5ctJ3NBfqsOXszm9ZIje4K8n6zt2Rghpvc+4AF+sIp9nxwI4pVX/07fkSYZ23Bom/YRzdIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiZYY8BkHII1ekI4/nfp8SUtzuFa/rG8gJkdMUzDP8/3oJjMxn
	h2bA5bCkdqNsO/Ohnb7JJWVg1sC1svk1cs24PdiAr9GxJlvgwLWjcn6B
X-Gm-Gg: AYBFou0fXMNf3TxW2uPq2ykZtKrr84SN4N4NEGbmJ9fODYfC+Or6NQxUDeyrNUWd2Te
	VhzzxsVnK5NgppP5QX9nAHUXI2FqQSGMeo+vjbLpPet5IleU9GmiRZYuSvcdWsYcXHv6PieRc+y
	82VmjQt94w0PonRdcorRmnCcFZtu/zIPo59429F1hwm8l1jVzi2aaNObNOKvA5pQ34Tqv0HvYsz
	13mYDgCwOq3sD1K7febCR8VfIH8HsT6gGI4bF4Ym9jyUya0zGGaWF8eYXAwWzq+euFAfv6s440f
	LKKBws49uRa2mSJGV9EIqXEU0kFgK+vFp11LPdFXS1TyJsesp/gaS8AV78dsqnzD0+YwQL7qta7
	DY0CyTIiVUtSK43/HRovdsf02moaoN9pekgk7th/yNKzSTV4QJfg/z8Cs6s37El1J5S7evi5Q9Q
	G+UI9M6attbtncGGXLXICN+BzIZg8XwIEUnNITg+vvohv2yGT6aCtj+MxMYMxIxOW6QVJiKw==
X-Received: by 2002:a17:90b:1d0d:b0:3a0:e476:576b with SMTP id 98e67ed59e1d1-3a4d179ece8mr721296a91.37.1790758763142;
        Wed, 30 Sep 2026 01:59:23 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16ac10sm2149770a91.8.2026.09.30.01.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:59:22 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:59:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <arzLeuO0qbRxofFv@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
 <arzGyL8gGrxeZoN7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzGyL8gGrxeZoN7@ashevche-desk.local>

On Wed, Sep 30, 2026 at 11:22:32AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 04:52:33PM +0800, Inochi Amaoto wrote:
> > Add several helper functions that allow drivers to get several phy
> > consumers in one operation. If any of the phy cannot be acquired then
> > any phys that were got will be put before returning to the caller.
> > 
> > This can relieve the driver owners' life who needs to handle many phys,
> > as well as each phy error reporting.
> 
> ...
> 
> > +/**
> > + * of_phy_get_count() - Get the number of phys of a device node
> > + * @np: device_node for which to get the phy
> > + *
> > + * Return: the phy count if successful, %0 if no phy handle is found,
> > + * negative error value if error occurs.
> > + */
> > +static int of_phy_get_count(const struct device_node *np)
> > +{
> > +	int count;
> > +
> > +	count = of_count_phandle_with_args(np, "phys", "#phy-cells");
> 
> > +
> 
> I would drop this blank line.
> 
> > +	if (count == -ENOENT)
> > +		return 0;
> 
> I'm not sure about usefulness of this kind of trick in the _count API.
> 
> > +	return count;
> > +}
> 
> ...
> 
> > +static void phy_bulk_put(struct device *dev, unsigned int num_phys,
> > +			 struct phy_bulk_data *phys)
> > +{
> > +	while (num_phys--) {
> 
> > +		if (!IS_ERR_OR_NULL(phys[num_phys].phy))
> 
> This should be part of phy_put(). In general many kernel resource release APIs
> are NULL and/or error pointer aware. This is a slow path and it makes user's life
> easier
> 

Something reasonable, As of_phy_put does have a check, but phy_put
does not and it use phy->dev directly. I think this is acceptable
QoL change.

> > +			phy_put(dev, phys[num_phys].phy);
> > +		phys[num_phys].phy = NULL;
> > +	}
> > +}
> 
> ...
> 
> > +static void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	while (num_phys--) {
> > +		of_phy_put(phys[num_phys].phy);
> 
> > +		phys[num_phys].phy = NULL;
> 
> Is NULLification mandatory?
> 

I think it may not be as the phy is managed internally.
But I think it could be keeped to avoid misuse.

> > +	}
> > +}
> 
> ...
> 
> > +static int of_phy_bulk_get_by_index(struct device_node *np,
> > +				    unsigned int num_phys,
> > +				    struct phy_bulk_data *phys)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		phys[i].id = NULL;
> > +		phys[i].phy = NULL;
> > +	}
> 
> But why? The below does the assognments.
> 

I refered of_clk_bulk_get(). And at least I think the init for
phy field should be kept for an initial state. For id, I think
it is possible to be removed.

> > +	for (i = 0; i < num_phys; i++) {
> > +		of_property_read_string_index(np, "phy-names", i, &phys[i].id);
> 
> > +		phys[i].phy = of_phy_get_by_index(np, i);
> > +
> > +		ret = PTR_ERR_OR_ZERO(phys[i].phy);
> > +		if (ret) {
> > +			phys[i].phy = NULL;
> 
> Same Q: do we need a NULLification in this case? Perhaps the respective APIs
> should be error pointer aware?
> 

I think this should be removed to keep the error info. This is the
thing I have missed. Thanks.

> > +			goto err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	of_phy_bulk_put(i, phys);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +/**
> > + * phy_bulk_exit() - exit multiple PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data to exit
> > + *
> > + * Exits the PHYs in reverse array order. All PHYs are processed even if an
> > + * error occurs.
> > + *
> > + * Return: %0 if successful, the first negative error code otherwise
> > + */
> > +int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	int ret = 0;
> > +	int err;
> > +
> > +	while (num_phys--) {
> > +		err = phy_exit(phys[num_phys].phy);
> > +		if (err && !ret)
> > +			ret = err;
> > +	}
> > +
> > +	return ret;
> 
> So, we return an arbitrary error and inconsistent state of the phys[] array.
> What can caller do about all this? Any type of recovery? TL;DR:
> I put in doubt the function prototype and the implementation (error handling).
> 

This is something I have done wrongly. It should return when the first
error occurs. So the caller can continue to exit the left phys.

As the phy_exit() does not check whether the init_count is 0, I think 
an additional check is needed fpr phy_exit() to avoid a negative 
init_count.

> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

