Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940632720C
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864678; cv=none; b=g71XSpB6OJBaO4lVY6EZIut8Dqd1VoDN2sR8yBS8SlkYse5DSjDD11dEcBJSGtkTZ2NpAE8Mu34+8zUnvnnaXVLg8XHMFUqIxu1rQCqDbLgIsCpHYKaAlllLrtfUkjElsDewFRKJoI6WS0X8J5/P/lECh7YfrdVGRyZHH6DnuIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864678; c=relaxed/simple;
	bh=Kz0XEIVs2B4+UTHQmu6Y86Ku+I6D2eYakWtDHsOXm9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axS3IAMa1cCCOZ6tJBY7419PkvZedBUJz20GITt/Yd9ycyShsnkYVaR1PglKMlgxUuBMNlfwr80lEz+DtZiXJyuYxPNXsunksHtnDWm5AzPCW/r4ot7aUXq+cWwv8ZmYxmv4IYXTFTHIHecKQ76XhwyUQ3BnRC6WJ2rZVGZgNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QlN/6d76; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QlN/6d76"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1336742714fso24457c88.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 13:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780864677; x=1781469477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oir9rCALH4eHYpJVikC6mAKB9V6wqMG19r6g7e/slSE=;
        b=QlN/6d76TcjLhL7wCB8tFMgesQip4JCKw5rAGi6wty1JQDp3mNWqydW44dB5pcbPuS
         z4Ei5UMM3NFQRxOWFtetVQt1tIl7elloCR6o1IPb4w692YFPZVOujgRPzkaN2W7JWVlb
         De+EtJej8lhRP91y4pygaIVffkJ4XEfpFxz+8BydRlNukFR9nPQrWKU1KQFj58pR7PYj
         +HZ+MhlXfWX8HTVyW+yG/jrrDm/HeY0zvoLh/ttUvglOV2eDYkCHFjttXWLOxknoz4PC
         ZWbFNjB1QiAeA2MJ7/g6nmb1pk4I3uQTt4AtEkuRS3Qlc4J7cThckX86nxbq03leX4lp
         T0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864677; x=1781469477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oir9rCALH4eHYpJVikC6mAKB9V6wqMG19r6g7e/slSE=;
        b=S2ZKQI25EJHpW50d5iQn0e24H06eaahf4pqc+rAEcw3TF8yVae1G+b0pR44u/lbnpW
         i1aC5Joe8Rxc+NgOPje54JrwthbIADcLQx9dVRZqxa48fF4C2t3ZJh8cXipb8X997efA
         EXl9aqFjB9U2YO9T4L3E8E1e/mfk3FEvoORgsEsALKlvyZBM/Foped1YYUIpPWY+WmmT
         K5L6WhcpJYAODFBAc9sTQz3xWa/VmnjjqnxwJ5uakhkQjv997btaFwclLlARyd/xXGpR
         Ve+W6UE6lG/Fp5j6DMceLPmwSrEmYJgjQU40PwV/4GHpzAchos2XVP4BcDHUkgT6zlJR
         poxA==
X-Forwarded-Encrypted: i=1; AFNElJ/+AzaYN5KdeV6N9LcJwQ/CBhz3SywNQX+3ckXL04a9iBRIggNPg5d963c18Ae4xyGGm4bIyzbFHxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+zPPkPBp7vf8Rm3hb3TB2hNEiPMOrFLrtHPlF5Bg8P4y3nQi
	cgBBH0mMoRdAHKlYQIS5MHko0TVx4WSObD2nnM3I9pP6wEATagOZOcjmvKcOYxw4Fw==
X-Gm-Gg: Acq92OE1S89WcEd3Gv9vVmAUPobuDNdeNcXkuuI4UDlbtu7CPY168+a5amuOts5xE5j
	V0RYXKLqvImvVkdl2CI0Ss5x0sC4eOaD+ef0/QRHzdFHyliP+DonGePffr+dP5RjJLo5oy0vyrS
	MNIcVVWfYu3VU2uoN+iqlhg09RjWY5dYkfM69SFETR0flCaif//i8yfG01qZNpoCUkusvxf1PEL
	JCilRaK3OE5uW5SRA1jcpUkamanEi57TksJ9m160IVuSpZLsErUsZGxU36lfiSSGZCyXY3aXIOL
	stFnuPv+7NJh9qV5y5xDG6evyh0gbHuMWf2UAZ9RHqvY8PgviijkTfatOM9keQ56eb9hpH94T00
	kXGe0zX7YTJlepOX4kB8WrdE3DPs26mlDYfY8hE20SbPXhheJ1AyyPKT1FXbZ+c9GuyMmliLmEp
	s3hiuQ5xCGJhCccxDbvYy+G5ScBDKbjj+rpN9sTl8OZlXs3yfkBtBuuvPW38319JiV/qjPffw=
X-Received: by 2002:a05:7022:504:b0:134:fc89:410b with SMTP id a92af1059eb24-13807c7c2e5mr279135c88.15.1780864674937;
        Sun, 07 Jun 2026 13:37:54 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1381495bb00sm4230734c88.3.2026.06.07.13.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:37:54 -0700 (PDT)
Date: Sun, 7 Jun 2026 20:37:45 +0000
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
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <aiXWmR-ettxin4LC@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-9-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:06PM +0000, David Matlack wrote:
> Inherit Access Control Services (ACS) flags on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
> 
> Inheriting ACS flags avoids changing routing rules while memory
> transactions are in flight from preserved devices. This is also strictly
> necessary to ensure that IOMMU group assignments do not change across
> a Live Update for preserved devices, as changing ACS configurations can
> split or merge IOMMU groups.
> 
> Cache the inherited ACS controls established by the previous kernel in
> struct pci_dev so that ACS controls do not change after a reset
> (pci_restore_state() calls pci_enable_acs()).
> 
> To simplify ACS inheritance, reject preserving any devices that require
> quirks to enable ACS as those quirks would also have to take Live Update
> into account.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/liveupdate.c       | 68 ++++++++++++++++++++++++++++++++++
>  drivers/pci/liveupdate.h       | 11 ++++++
>  drivers/pci/pci.c              |  5 +++
>  drivers/pci/pci.h              |  5 +++
>  drivers/pci/quirks.c           |  7 ++++
>  include/linux/pci_liveupdate.h |  6 +++
>  6 files changed, 102 insertions(+)
> 

[...]

>  
> +void pci_liveupdate_init_acs(struct pci_dev *dev)
> +{
> +	guard(rwsem_read)(&pci_liveupdate.rwsem);
> +
> +	if (!dev->acs_cap || !dev->liveupdate.incoming)
> +		return;
> +
> +	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &dev->liveupdate.acs_ctrl);

I might be thinking out loud here, but as an attacker, this motivates me
to somehow hack the EP FW to mis-report the PCI_ACS_CTRL register across
a liveupdate to fool the incoming kernel. If the FW feeds a 0, it silently
strips ACS protections.

Should we also serialize ACS state in ser somehow to ensure we aren't 
fooled by something like this?

> +}
> +
> +int pci_liveupdate_enable_acs(struct pci_dev *dev)
> +{
> +	u16 acs_ctrl = dev->liveupdate.acs_ctrl;
> +	u16 acs_cap = dev->acs_cap;
> +
> +	/*
> +	 * Use liveupdate.was_preserved instead of liveupdate.incoming since the
> +	 * device's ACS controls should not change even after the device is
> +	 * finished participating in the Live Update.
> +	 */
> +	if (!dev->liveupdate.was_preserved)
> +		return -EINVAL;
> +
> +	/*
> +	 * The previous kernel should not have preserved any devices that
> +	 * require device-specific quirks to enable ACS, but if such a device is
> +	 * detected, log a big warning and fall back to the normal enable ACS
> +	 * path.
> +	 */

Nit: It might be worth adding a note here that this can also happen if a
new device-specific ACS quirk is introduced in the incoming kernel for a
device that was preserved by the old kernel (which didn't have the quirk).
In such cases, the two kernels are essentially non-LUO-compatible..

> +	if (pci_need_dev_specific_enable_acs(dev)) {
> +		pci_warn(dev, "Device-specific quirk required to enable ACS!\n");
> +		WARN_ON_ONCE(true);
> +		return -EINVAL;
> +	}
> +
> +	if (acs_cap)
> +		pci_write_config_word(dev, acs_cap + PCI_ACS_CTRL, acs_ctrl);
> +
> +	return 0;
> +}
> +
>  /**
>   * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
>   * @dev: The PCI device to check

[...]

Thanks,
Praan
