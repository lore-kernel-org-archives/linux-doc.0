Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247610;
	b=bWVdcM1+5oF7ccdVsBonmjk3obLAUkd3dPlhiJqvAYoDEPu+9THWDz9bpL3+D0xw+GcS
	 By5LVl+ttR5H2gMau1+TqVE4dCAhs+tRIK/1xGPpadLMrPWXv9nXWlnarAtVN/I+5CQlO
	 FW/L6GsWap5J+Sz68pRya9aL2L7uBwsQTtAip0aOWkLeAanPN1mqWTFfqSnYRaf4LuS98
	 sAskqJg9wBMexA9aHNDw+GYsVUlSUYVfzj/1JjCxFz0JCxhCoCDi/SOCTg+uSEXNq0Et0
	 fpRZtJ9R/VLFyNg0btuT2A1QUQTxH4OpyWWCQnexEx4XAgEERSFAhomZXGCSueFkN+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OFCgfXZyqNz90HWdYpeyXbVhNfixwYHLdj2jezmIKJE=;
	b=lLPTbXgoMdELnvJSTb8WpdakjDcW8JXXg1fAh/N54updvg8UJ0n0fV9564YeUaQxrb+0
	 ihMRRka/om5fhc0z9kyGoabxduWGuF63Uu5g+ux41xreLcTQHNVe1kXKhxV73GD4SXBuy
	 8V295l58OlMgyHnBOuzWtB3DAIhAd9mZ6QVaYs/Rpe6bAsAAoZjOFb144GYivfXupy8u7
	 dXTxIkLMRuhHF0P8uJ/f/yJccb47BxI80Z85tmTIk0EJaUOu64z+nBycrSAOv33O3YB1l
	 BbBD4I1/qu8KJfx3U0yDrFLHtXareeW7mguteagWgCs9SASQhkQdABeW3gR2G9deZxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsjrLeJh;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BAA606A325
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BAA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsjrLeJh
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so801030a91.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795247610; x=1795852410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFCgfXZyqNz90HWdYpeyXbVhNfixwYHLdj2jezmIKJE=;
        b=ZsjrLeJhExZmq+zhRqrSR8+6MNEcnHuDRH6Ybj/2v+ODRA4bwXNFgNZ/m7quFkQvCa
         i6PFUV7KuCUYljPvm2NmE2URutm49zPCkh0DNhAEm4vI86J3h6zGPscN0KhuDQBNVRcj
         FhMXhW144241qz+UOG4qO7LU94hPNVtu6gYts+nVywrOiW2drXqPeYFQceitFnzvGQt3
         0tM6Ft0P2qQpIzhh62cYblRAS4g4KZ9F9WwpkwVf9jZO19FGWVFQ3paacLWh6WOYTy3d
         poJYAB99LJnASeX5ZmOyeHpe5qtzvsuw8HUnPNdQjIfALVbGApPRd1iULLXkoJHx+54C
         UA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795247610; x=1795852410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFCgfXZyqNz90HWdYpeyXbVhNfixwYHLdj2jezmIKJE=;
        b=NqFpJmXHTKHMwzFlXm7GraOZPux6vMdysRo27TJB2RwSOW8OGPEGrYaFlSGDn2kxMr
         7H7azPLcbVkpcYZFVZuDiLsvMbiVQJiwr5ar7/1b5GFlmTvelnrzI24/ByALjVs55axp
         Bv/WBFOdRZSmsEea3yXQ3YDEZkDvu/yxURjwwuI4aAO6ouCkKGrbaHAwE7kqf6jsJtVR
         P9u8YzpWI8dTbT4zpUOuZBABPmz5NoQKpBSKjWZAc6m056IBkvLoLEvWf0kPuOUCAL/c
         KVN5WxJYrX/hjsJxThHfwY1HqM0XrSWh7TP24sly3t4FL62FgjQp6AR+GXMFodBGG6eG
         I2Iw==
X-Forwarded-Encrypted: i=1; AL+hErF3B/CME4OETN9eJbKLeSLbBBLH8QEqeTr+dp2P76K/viMYKuL1rMZL/p6ICuEdjEJ1nUzMDF+A090=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oFQdjX4zyAWAFwvO0upLouRiqp3GsNf6VL+YMAqsrTVPgBji+
	rwwBvTe42INh39KqxjUODd+EzsDwBfa9paCaYCUd4OgBHUshPGCpsypV
X-Gm-Gg: AZFdTZc7BTc4DUC49z3S3X0QZJdaFcGYVbdvfgrc0mYKUy8SsAntI87tmsrUgmE+z+i
	ESRgQee7N3dLMsPLWOcvTdXIp4IQ+BS4mx5Is4B0lQjK9JDh2Fte3HCV+eawSh+ah5dtdrmCRUd
	P88S6mITGjRALUFvdp46hzRKcwm+K68ggnLhG5FJ8a3hJ60/AQyciGkOZuVcN5O0t5CkEQfx0Ts
	ikZxf86e8ao9fCl1QgdPMTLBm3GZhzYF9VLy6qB95L/LvxsbnBjtfc3rpqgclRHJ6nVtHCt85Im
	MNu7QeKpkdt9IRhd7UL76U6KQtBAwkByb5c6Jm1X8HHIa9RpkDEQXu5tpVI0AtxxMgLSZb3mtVO
	qOLZ5V3ldZZ4fCkhYQ1wmy1A1sMsKExj8NrYPZnRZMH6iobyZoWz/aPzdnTWdiW9toS1O2VfP5W
	GZstMpR00nzRyIKET+3E5qbEAJ0fZnavHBUsvtj6IWt9wsjwHx4/RfFsmnewpLzQ86sjaypRxA7
	uKABMIpQxpbZOBaTKrVQyw/24kL8nZWb1e+R9zuY+jtyS9uKNZNwhatcVB3ztGnIY/Dz9+iaKBo
	Libt/qwsrsdq1AZ4w6EywaH4/iY=
X-Received: by 2002:a17:90b:3ec8:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b41cafdb7dmr4480174a91.47.1795247609783;
        Fri, 20 Nov 2026 23:53:29 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm10382959a91.7.2026.11.20.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:53:28 -0800 (PST)
Date: Sat, 21 Nov 2026 15:52:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Vladimir Oltean <olteanv@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rhys Tumelty <rhys@tumelty.co.uk>, Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <awFL17YyVU7yRKZz@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929085235.469515-4-inochiama@gmail.com>

On Tue, Sep 29, 2026 at 04:52:33PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/phy/phy-core.c  | 253 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h |  55 +++++++++
>  2 files changed, 308 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 8fbaea003b90..5b76c006575b 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -1004,6 +1004,259 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);

[...]

> +/**
> + * phy_bulk_init() - initialize multiple PHYs
> + * @num_phys: number of entries in the phys array
> + * @phys: array of struct phy_bulk_data to initialize
> + *
> + * Initializes the PHYs in array order. If an initialization fails, all PHYs
> + * initialized by this call are exited in reverse order.
> + *
> + * Return: %0 if successful, a negative error code otherwise
> + */
> +int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_phys; i++) {
> +		ret = phy_init(phys[i].phy);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (i--)
> +		phy_exit(phys[i].phy);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_bulk_init);
> +
> +/**
> + * phy_bulk_exit() - exit multiple PHYs
> + * @num_phys: number of entries in the phys array
> + * @phys: array of struct phy_bulk_data to exit
> + *
> + * Exits the PHYs in reverse array order. All PHYs are processed even if an
> + * error occurs.
> + *
> + * Return: %0 if successful, the first negative error code otherwise
> + */
> +int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys)
> +{
> +	int ret = 0;
> +	int err;
> +
> +	while (num_phys--) {
> +		err = phy_exit(phys[num_phys].phy);
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_bulk_exit);
> +


Hi Vinod, Vladimir and Manivannan,

Before sending the next patch (I guess I can update it in the next
week), I have a question for the error handle.

As the phy_exit()/phy_power_off()/phy_power_on() can return an
error code, should the corresponding bulk api need to call the
corresponding  phy_init()/phy_power_on()/phy_power_off() when
there is an error occurs. Or just leave the state as it is.
I saw the reset subsystem does this rollback.

Regards,
Inochi
