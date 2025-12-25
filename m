Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51CC27707;
	Thu, 25 Dec 2025 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766653948; cv=none; b=rz0dgnFs1i3vfqxfFR9WV36LufiN+z8hNuA9W6PGILDyHodIgFLdklcG6DygnildbVWgg01o0cnjEJa9blKALQn27lfzSRRX7XiK1FnGGBM9c9wjGz094pa0K6qMZoR3qH5j/uqG7GOsSWvmc7mNGXRxf3l6/41PpfyKA26x1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766653948; c=relaxed/simple;
	bh=SEQCeeP0cpyhofiDVSZjIFDJcEgZ0uLCgntShMSc7h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAXCATk6tm9yNqaVT5gkT0LG+oIVGhfSy/mzB3UunMAWko16rVaAMf7MvLHI8/D4/1fJZk3KzlRNzjyXwcLtmxmNrVC1woqHhRb5cu747N+rw+qNA4D26vDah1hpMF6Hwmbd7olf3a5X3hkPaJMnutuLdrnoay9+uJQUfUHqc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPONcwIA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPONcwIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA21C4CEF1;
	Thu, 25 Dec 2025 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653948;
	bh=SEQCeeP0cpyhofiDVSZjIFDJcEgZ0uLCgntShMSc7h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UPONcwIAAX5DIiKDnx2xaHE1tv86977WxFaZrBXShqnNlOTNclXbIxPRxv+IZEyj4
	 jDHVFu0t9yYvro2bqqLFCGf472FTKqI16bjChFRVQ6hOdWoOMmkDuBvvc/jL8ek9NZ
	 8GZNFha6WCaAg+F8KzoS1d1TaGjopUx8p0lSKF6Y+sdvHxv1xCJQOLGTBJF0r2rIY1
	 RVWReCgrdVSrMTEO2lnKwEF9N89PKRnjtKkTvpXJvlWa3WYlNIOGn02KH8fjqHMVdh
	 s1lbJKmo3+diV2yJq/iR94d96LFz5816/CNlXctpkJy30mxDNIoDxwrXpny8RgAACV
	 JvTXQSB8K8a/A==
Date: Thu, 25 Dec 2025 10:12:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 4/5] virt: add Bao I/O dispatcher driver
Message-ID: <20251225-friendly-raptor-of-lightning-fbafc4@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-5-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224135217.25350-5-joaopeixoto@osyx.tech>

On Wed, Dec 24, 2025 at 01:52:16PM +0000, joaopeixoto@osyx.tech wrote:
> +static const struct of_device_id bao_io_dispatcher_driver_dt_ids[] = {
> +	{ .compatible = "bao,io-dispatcher" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, bao_io_dispatcher_driver_dt_ids);
> +
> +static struct platform_driver bao_io_dispatcher_driver = {
> +	.probe = bao_io_dispatcher_driver_register,
> +	.remove = bao_io_dispatcher_driver_unregister,
> +	.driver = {
> +		   .name = "bao-io-dispatcher",
> +		   .of_match_table =
> +		   of_match_ptr(bao_io_dispatcher_driver_dt_ids),

You have warnings here. Do extensive building of your code before
sending.

> +		   .owner = THIS_MODULE,

NAK

Don't send us 12-year-old vendor code. Tools already report this,
so you just did not run them...

Nothing here is evn formatted correctly...

Best regards,
Krzysztof

