Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671237189A
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919913; cv=none; b=gZHf6M+IPqgGHnpwryrsCeBbJdriDyee5efoTrj83cZIlElsLn9U0dRPgXHmUc4LN/N68Wwk3WBt8mRE1+R7orQ9mgPTUaNWQBeIPK1ta0ERJizmtIIfwPMHC8DWepyJpgtTUgq4dTd6+bGLul99IMvK8MonwgZnKZLQ9t8rbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919913; c=relaxed/simple;
	bh=lRADBLgkLa3yPDCBWXAV1K5xrYWvA85f/dwiJB5B0jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdx8EIiyZNAA9AzdTEPLjRIXHrsdto5CP0g8L+8YcnngeO1XJsVGYmOt0XAgql5IBY3jvinWauE8fqTWAVu8KmxpZb4S0XGD7/LBgO1RZ856zd8RZUnnHgfsSfPCmZY3+b4Lj6OZbIjlJfybajKSHWsuznNJVPd7dYHMxUxip3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bSxhHpFZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bSxhHpFZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf2911f93cso298165ad.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 04:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780919910; x=1781524710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CB2k4eqEZ/J9Iam1QvalqCdyib5VuBIoGU6FvxH5X0=;
        b=bSxhHpFZsVgn9x8ibm2PwJlVAoyYbkqJl073AizUP+8WcOD4/OMYfrnSyMNm3oZrx6
         F7ueLeJX02jewkcw8yGBRjWBChNfDTutokXjnPYsgVpQr0IT/yFgZyLUNMabegc4gBKU
         8M8ajpSewCYI1BuRNlGM3TJ+FQhbbOISAaUwl0zY8KzJ9NyGeoY5WsXRKU+6II76E/Iz
         5W2dEHqdmm+d72lzWs2pVqXu7MxHYosWp4Tw7kLzOARSlgWXMHsIMYraMoOQRF5KvcV7
         JJfa4ZZj0cmZjKtzfuOytS0yA+k/o1+2kacpLGzVQQu3BXxz+8fdqZ29hOfAzP8gRNdu
         oxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919910; x=1781524710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CB2k4eqEZ/J9Iam1QvalqCdyib5VuBIoGU6FvxH5X0=;
        b=TMZGfyU54W9ya5kQGOQmJtdFLrjNDtFkg2eEdx8QVxDqLMgHlbsTwm6Qv/wzJFQbcf
         Xt5iWCsVuORo5K9fIXoiQbisd9Sa+QG2idd3fk6n4nrcToX7d9bNMdmcPLf/vgRZ/4NA
         ZT6p24RkjhlzUGk2/ncdf1Wn7KF9WMqH7SkwhJXRbvD7SZXSJ6yV+T1vlP+7jpzZGLN7
         OXSJk7y9WqEuWLEdOIjQyrKPfmic9gRm+1Kej5mbUiAh0v6x9fkzxfJBVPXbHMko2eZH
         CVAnA5uUpAe974gI8/dfqGPWMmax/d69/QXIVMA5j1F/FY2YZnOSrck3EcFhc7/JFL99
         m/kA==
X-Forwarded-Encrypted: i=1; AFNElJ92EDnZ1JtKYh14cETJbS2JdnYaEo9ZhsZGKtU3LHD03/jwaEpv7/gUHoniCVM3W97i8pGEvpTCPdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzweuUYxzpdfcqQxttQao8GnVTpiEsloI1J2E2Z6vM7Nixb0hfp
	XR/ly3DY2Z1hxvmix1GhK0sxMw6U6dAHPkK0qjF7a3ThBR1rRocmC9pg7Fy47ERkhQ==
X-Gm-Gg: Acq92OHgouWW7X8Qh3ed7N2qJ2CLjdBKGD+cy2yl84RdSmtVtzjbw1cz5KyG/S80cX2
	yD5lAInjx5zU/8sijt00MVA5dthCbzszPaGlRv5NAL70+Bu3KAL12sooRHn1DboQ/P+/urM+iyE
	8N9jndO48n789HbOQPnSgJh/cDu/xcSbVdzdghdpxz1xpd2n44Qw7KRJDixn/seZUziK5Yt0WIw
	F4Pq7uUuDQrO9UrXWJcoBzNsoMuIJNgr6cJoBw3Q7G6BLu5uWro5wTzW4rwkDo9JfgBJvptA8hX
	XMBoNFoMq0mbD79LjP+O2jSSH8qLQx/LGVo68elqY2O2Hc/pixWJm8obwG6HCPEq6/AX+QBHnxY
	cQGcSTvRN+4AsM34ToC78naBt2jBW2n9gLKx+lC7lsY3xUQDaexGEWjqHvX2O2If5KBs3aBLquS
	i47FoD3ODZ5HmJ9xF/3QZNQtXEEMXms9RXvNgmESsFoYIRkN7oxNL0dGd+j0kuQL9CSMfoiKg=
X-Received: by 2002:a17:902:f787:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2c1eafbd48cmr5222305ad.8.1780919910000;
        Mon, 08 Jun 2026 04:58:30 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b56c5sm15740485a12.27.2026.06.08.04.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:58:29 -0700 (PDT)
Date: Mon, 8 Jun 2026 11:58:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 11/12] PCI: liveupdate: Do not disable bus mastering
 on preserved devices during kexec
Message-ID: <aiauXATym3w2QX9N@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-12-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-12-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:09PM +0000, David Matlack wrote:
> Do not disable bus mastering on outgoing preserved devices during
> pci_device_shutdown() for kexec.
> 
> Preserved devices must be allowed to perform memory transactions during
> a Live Update to ensure continuous operation.  Clearing the bus
> mastering bit would prevent these devices from issuing any memory
> requests while the new kernel boots.
> 
> Because bridges upstream of preserved endpoint devices are also
> automatically preserved, this change also avoids clearing bus mastering
> on them. This is critical because clearing bus mastering on an upstream
> bridge prevents the bridge from forwarding memory requests upstream (i.e.
> it would prevent the endpoint device from accessing system RAM and doing
> peer-to-peer transactions with devices not downstream of the bridge).
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/liveupdate.c | 11 +++++++++++
>  drivers/pci/liveupdate.h |  6 ++++++
>  drivers/pci/pci-driver.c |  7 +++++--
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> index d404e64a4e55..a6f2790bc1bf 100644
> --- a/drivers/pci/liveupdate.c
> +++ b/drivers/pci/liveupdate.c
> @@ -132,6 +132,10 @@
>   *  * The PCI core inherits ARI Forwarding Enable on all bridges with downstream
>   *    preserved devices to ensure that all preserved devices on the bridge's
>   *    secondary bus are addressable after the Live Update.
> + *
> + *  * The PCI core does not disable bus mastering on outgoing preserved devices
> + *    during kexec. This allows preserved devices to issue memory transactions
> + *    throughout the Live Update.
>   */
>  
>  #define pr_fmt(fmt) "PCI: liveupdate: " fmt
> @@ -790,6 +794,13 @@ int pci_liveupdate_configure_ari(struct pci_dev *dev)
>  	return 0;
>  }
>  
> +bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
> +{
> +	guard(rwsem_read)(&pci_liveupdate.rwsem);
> +	pci_WARN_ONCE(dev, !dev->liveupdate.frozen, "Preservation status is unstable!\n");
> +	return dev->liveupdate.outgoing;
> +}
> +

[...]

> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index f7a5e65a7c75..0b1f8d01d7a5 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -546,11 +546,14 @@ static void pci_device_shutdown(struct device *dev)
>  	/*
>  	 * If this is a kexec reboot, turn off Bus Master bit on the
>  	 * device to tell it to not continue to do DMA. Don't touch
> -	 * devices in D3cold or unknown states.
> +	 * devices being preserved for Live Update or in D3cold or
> +	 * unknown states.
> +	 *
>  	 * If it is not a kexec reboot, firmware will hit the PCI
>  	 * devices with big hammer and stop their DMA any way.
>  	 */
> -	if (kexec_in_progress && (pci_dev->current_state <= PCI_D3hot))
> +	if (kexec_in_progress && !pci_liveupdate_is_outgoing(pci_dev) &&
> +	    pci_dev->current_state <= PCI_D3hot)
>  		pci_clear_master(pci_dev);
>  }

Looks good. 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
