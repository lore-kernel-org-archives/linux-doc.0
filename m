Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB336C5A3
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925776; cv=none; b=Gnx5Yx4JT6cs9FNdsLQXrA3Dshf1s8MpLduyketQKlXOALilQyqBqcx8UiAZW4t1T90fkQ+KvV4ZWPk0lxYVziZKM0zCirvJIpEb2RWTfiZI9uU52rhcNDrb2SB0bQedFFChjqqVgJErwdInBrYQ8yXVtGRZ+d0BOwkHYAzxEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925776; c=relaxed/simple;
	bh=+R3GnLFPJHPtRP+BOZs4qESabAsxap6QdyfJp9LLyPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOy4ruGpbdFB80zCapZK8tW7HqYzA9WkEAUmvnb7WabsYxB3dakr2Xa9oD4bJXvW3A6B4kS0bplGeUEYPAJgUWWzDir1Rd/5KYUFFLES/5fInkYCIPOW/ojJha3G6PV80NYtmFsoImXdj52FcNdQRRdmsr0ne1+DLj6I3EetiQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V7bmlFVg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V7bmlFVg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ada9e4ea32so39605ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925774; x=1772530574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24cju2hDHQ+kbJrPkzmdwVRuKgiC4K6oV6u1w7p/OMI=;
        b=V7bmlFVgfPICsNoYRoEVqinb/2Fn+EuQQN3U0VnKDnfuK48STwZadt+2LtCZrdnr4U
         NspRl/viZ4yeddu9kk+rC1QpN2zTNprU8cUb4dPk4U7BBhy1c4JWihj4y32qrM44wD/N
         NayazJvZzaCKcxyQCy4Nf2R5EI4IUsKYpoWbOXG+kQmoEOTZBFNwsNDhCSyaBSQDBBvf
         IZFqX2TEv7sGZTbe97Zjw1yGiYN7agJjotlHRgTiI8NcOnIiT0eiYeGY7xCTBFIJ5uYU
         keWvkTFFpiPbU9l19BAtIqriobTwF9n7MTm4HkZy+s61492jTLmNn7uKNqg95DwR2Rcf
         UYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925774; x=1772530574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24cju2hDHQ+kbJrPkzmdwVRuKgiC4K6oV6u1w7p/OMI=;
        b=liEXi0OLF1btHJOSydw8klVG4BUyRGJkMZKJnONqBDJNYkTVb7W5eWDvHBFPIMKZ8h
         xoVRwz0PtTtw8xxrntSoOfiaQ+U52I8ZuOktwSBgveTQq0rtL8Ele/F1kl7VFjDU0axu
         +CJjxqGcGewvQIq343V1LwQjJImIIATDKCawu9Rq5xj2qmbBx4m8BoE0mKeIcxZ4NZO7
         r8nBPT69NemQ7arwsWiqGoVUVFkqHePeHAVSLRjHjRoC6SmiRrEa9+lYzA2sZ3u+qOA1
         H2pGUNp65Ap2EGqhgA/Avi2sjn9jGVrEKT0z8Gp6NseV2e9EVqvDJbPEzkgc7y2Q8Jpm
         /30w==
X-Forwarded-Encrypted: i=1; AJvYcCWxFrF2Cg1Avnll1Wx0qhw/LD6yqaDFDKt5htxi15T61t/dQNikT9qZtAn0YEeOcXDdrTeuWYmdJkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb43f7KxKWJAstChxiB91sX4jDfNqqxXXiQyiMYQZNzQWuYjaK
	HVPuPPrZ9y0t3Dm50YZSbqM2tP8IA3j8W1sBBG6yHR11ljjJSp2hGRIh1ZOArsn6fA==
X-Gm-Gg: ATEYQzx4lUQHEAp7wreNu/hw/fCIV/6IyV9WaDp/U1JXxibXE/rli9EVjNiidEN/UQA
	OhnqraOE4reGO7ecLBp7VB3ziY2cM7Nx3JJ5MsX9bq+njER0vHsJijFF6oJEcYRvkPoxAJJ8ufn
	LeJKeKOVfo+7VNBro+BAZN6bEST2F8/zIq2vvTm97Iykt0hfX6/4pWwajBkgeeJJRY8o0PWFFeb
	HL8yn6G/wPE3SLi+v/uNkJrk8ypkMNTou3rrfSmfD2f/tMgzwAPK/osMY8YysemuYGKtYIJCCIg
	1xVlzQynDDvcmt5I8GcpkmT3UGpHyCmbOYkh3tFOn2bMtVRb//p9hStZoLonpcYSyFZMt11f71s
	M6ccAdLOc+wVTTYLhtC1D8wgFAnrqCjyxny0TYrjJdkYSi4L16EXKa1RtkHI7Y3tEBzZvxnw68a
	j7mSnWdcesUt2AK1rRWCAsbyGv+kFttf09BDeenXpY0GDBjMr0AOZppOnT8trp
X-Received: by 2002:a17:902:e78f:b0:2a7:7f07:340e with SMTP id d9443c01a7336-2ad993a510cmr1492795ad.4.1771925773665;
        Tue, 24 Feb 2026 01:36:13 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a7351sm10754939a12.8.2026.02.24.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:36:13 -0800 (PST)
Date: Tue, 24 Feb 2026 09:36:03 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
Message-ID: <aZ1xAyN0vgLWIi5y@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-4-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-4-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:50PM +0000, David Matlack wrote:
> Inherit bus numbers from the previous kernel during a Live Update when
> one or more PCI devices are being preserved. This is necessary so that
> preserved devices can DMA through the IOMMU during a Live Update
> (changing bus numbers would break IOMMU translation).
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/probe.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index af6356c5a156..ca6e5f79debb 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1351,6 +1351,20 @@ static bool pci_ea_fixed_busnrs(struct pci_dev *dev, u8 *sec, u8 *sub)
>  	return true;
>  }
>  
> +static bool pci_assign_all_busses(void)
> +{
> +	/*
> +	 * During a Live Update where devices are preserved by the previous
> +	 * kernel, inherit all bus numbers assigned by the previous kernel. Bus
> +	 * numbers must remain stable for preserved devices so that they can
> +	 * perform DMA during the Live Update uninterrupted.
> +	 */
> +	if (pci_liveupdate_incoming_nr_devices())
> +		return false;

Following the comment on Patch 2 regarding propagating errors, the check
if (pci_liveupdate_incoming_nr_devices()) should be made explicit to 
distinguish between "Preservation Active" and "Retrieval Failed".

> +
> +	return pcibios_assign_all_busses();
> +}
> +
>  /*
>   * pci_scan_bridge_extend() - Scan buses behind a bridge
>   * @bus: Parent bus the bridge is on
> @@ -1378,6 +1392,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  				  int max, unsigned int available_buses,
>  				  int pass)
>  {
> +	bool assign_all_busses = pci_assign_all_busses();
>  	struct pci_bus *child;
>  	int is_cardbus = (dev->hdr_type == PCI_HEADER_TYPE_CARDBUS);
>  	u32 buses, i, j = 0;
> @@ -1424,7 +1439,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  	pci_write_config_word(dev, PCI_BRIDGE_CONTROL,
>  			      bctl & ~PCI_BRIDGE_CTL_MASTER_ABORT);
>  
> -	if ((secondary || subordinate) && !pcibios_assign_all_busses() &&
> +	if ((secondary || subordinate) && !assign_all_busses &&
>  	    !is_cardbus && !broken) {
>  		unsigned int cmax, buses;
>  
> @@ -1467,7 +1482,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  		 * do in the second pass.
>  		 */
>  		if (!pass) {
> -			if (pcibios_assign_all_busses() || broken || is_cardbus)
> +			if (assign_all_busses || broken || is_cardbus)
>  
>  				/*
>  				 * Temporarily disable forwarding of the
> @@ -1542,7 +1557,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  							max+i+1))
>  					break;
>  				while (parent->parent) {
> -					if ((!pcibios_assign_all_busses()) &&
> +					if (!assign_all_busses &&
>  					    (parent->busn_res.end > max) &&
>  					    (parent->busn_res.end <= max+i)) {
>  						j = 1;

Looks like we over-ride the pci=assign-busses boot param here. 
We should document how this change affects the pci=assign-busses kernel
command line. If both are present, the inheritance required by LUO would
likely take precedence to prevent DMA corruption, but a doc update & a 
warning to the user would be nice.

Thanks,
Praan
