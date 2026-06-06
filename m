Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A39317174
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744243; cv=none; b=HXImpxnsrtPf3qoDTLTBuNQsIaRH5KDO4/sgk6bjzk+jG5tqg8d0vGaeEvXpVpeX6Qs0sMX3LTbTNOz6oNu4r7Z+ytb/x/RPPy35n6eXxoRQ2Zknv0CTO8dI3q3k7LOBa9hCEnH/fkbj0bJLctCtJMD65khZVCxm0Shh2wRmNGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744243; c=relaxed/simple;
	bh=8rGT5m9JBzmFPEylx70cZknpUvaFHjWy4EYaVq8UyiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7OO47URwfQ+cwYA0jbJN4mAVWJzNz2rylDnbbfrPUYxDg4chDraFNQlwNu7bOd5hDFTSzc7u+dNb35J/okOCQvh014grNNW4ggmjhFCzfQVlqVAA16UD7iXg1PvwX/7GGcFYCu/oStjbjZtiVdWSXStxtfDLXIYdJP20GYSkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XkblMaQE; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XkblMaQE"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-133362c30cfso19658c88.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780744239; x=1781349039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1UvGUn3KRDrygvBE4DSDRKEnm/sK5Y67p5+Nbu/YEQ=;
        b=XkblMaQEmTxwt4sd2VW4eBWR30yK9bgRaaR+sSjlgNCqLN96DXeAgro8yGjyUB6YgA
         2VIC+intydL1m6gMixL38HNA+oIVlLICgrdCJlx8urbzlPzekkN38mN0Jujhjvtl0r9/
         9c4pQ6Zf8MrX5XCHMdHAbgYrhRSINFTJc0ZvLjsnlyZeTI+WDMmVH/RsZ83CswEe17N3
         RXrxaiE5MbhT2JJKss4+IDlFDGn6VOilog2UX930sd2mL77ZQGNaHKveVtoiOH/0LdRM
         zgqKf6b3KjqkRPTu0BWgqaTP/AiYAjdkFFBs02PEVtxtzxQZtjnM7dqIInQrIBYXLC+p
         4asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744239; x=1781349039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1UvGUn3KRDrygvBE4DSDRKEnm/sK5Y67p5+Nbu/YEQ=;
        b=iKfFKPfltzuzk+PzMyKMRUTCvXVJhLAmlBQqHHTa93CJlu5//8KbscieAKYiRF02+a
         Jb4GrJZdtCmqe8u25THCBXl/IG22cK0jtACveKCMw/lW5GrJBaKG4aZx/utpawhNTxJJ
         SoCjnUf3HfIWK2YpPR30WUSScjoZJPUlFeI6lDDqTOkHHZTkm0do5DJVrUYpxem+Jsgm
         0nIRJhCgMw6h5IRgHC4yFVGnEQfZQsvnqI+HWOSfhS7Hz0QWiiplhVhzT0h/jUjSNJqQ
         dBYzGyhlIV3i9n/obNVBbbJiRMFvNgPMeNIzcPCPUHNUHkMQ03uu5gaTnHKv1o/vCvCZ
         BCuA==
X-Forwarded-Encrypted: i=1; AFNElJ8ELaD1Ltr177//8is3JgRrkaUkISuWEJyKvu4pkNwRwzOp7VSL3Y2ml1Sg2hDiFNrSArBeTd4Tx5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFvqT4kTMJpWCVzHE2nykn8ooWWVuVeLpb0+sobnGTtlONB2p
	mCUFZlXRoo7fzQ0ZAkPnaxlEgo6PzLfQ/smFkJNaCK+1rh7b3A+Pyra/9fI+kKYXeA==
X-Gm-Gg: Acq92OFabu/zOvtlhA7N5y+vxkCpVryelk3equdmjqf87mE0KBjMlkFkj9yoBspZRMx
	kbrtOh11N9Y1jSFroS0+QdxlWHa39RITI6KL6qHXhIKAm+gk+8KjAyRUhvWJmEmLkkWfNJkLNk8
	tYiHFgVpkb9EBBjXvdd6Y4du0g6CuiFGJzQzQ376nBzRL9vM5die6bjASMgzc+HALxAg/+ikP/B
	QKREX4Jmn8bqXRA8hR6YCJBFJZix1joJHvlc6irQc2PbxotoihQAPFnuwhmD/N/oH66uKzrfRu/
	yLyX84REuIjBiFHTaKcaYwzZKz5WUl3fNpB9K57dMSdARd6zB26A1yEJE9Ydw0bjwMWk3SE+HV4
	KFiNxM5ElVJS+2JIM6KhI38A04FTfflvdjkhWwAX1fYbt0Vwk265oNYUsIxduj2ouRS/l8erlAp
	NostpDxORt9D4dN/kxpHYZliDeiS0OQuEGXaJkswKqn3JxTz8Kz0E6QRUPiYVDowv0ZSCaDSTvM
	L/FHxc09w==
X-Received: by 2002:a05:7022:38f:b0:133:12e0:aab7 with SMTP id a92af1059eb24-13807c6a877mr251422c88.11.1780744238685;
        Sat, 06 Jun 2026 04:10:38 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13803eb106esm4391089c88.5.2026.06.06.04.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:10:38 -0700 (PDT)
Date: Sat, 6 Jun 2026 11:10:29 +0000
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
Subject: Re: [PATCH v6 05/12] PCI: liveupdate: Keep bus numbers constant
 during Live Update
Message-ID: <aiQAJRINEKiwCmVm@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-6-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-6-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:03PM +0000, David Matlack wrote:
> During a Live Update, preserved devices must be allowed to continue
> performing memory transactions so the kernel cannot change the fabric
> topology, including bus numbers, since that would require disabling
> and flushing any memory transactions first.
> 
> To keep bus numbers constant, always inherit the secondary and
> subordinate bus numbers assigned to bridges during scanning, instead of
> assigning new ones, if any PCI devices are being preserved. Note that
> the kernel inherits bus numbers even on bridges without any downstream
> endpoints that were preserved. This avoids accidentally assigning a
> bridge a new window that overlaps with a preserved device that is
> downstream of a different bridge.
> 
> If a bridge is scanned with a broken topology or has no bus numbers
> set during a Live Update, refuse to assign it new bus numbers and refuse
> to enumerate devices below it until the Live Update is finished. This is
> a safety measure to prevent topology conflicts.
> 
> Require that CONFIG_CARDBUS is not enabled to enable
> CONFIG_PCI_LIVEUPDATE since inheriting bus numbers on PCI-to-CardBus
> bridges requires additional work but is not a priority at the moment.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +-
>  drivers/pci/Kconfig                           |  2 +-
>  drivers/pci/liveupdate.c                      | 83 ++++++++++++++++++-
>  drivers/pci/liveupdate.h                      | 14 ++++
>  drivers/pci/probe.c                           | 17 +++-
>  include/linux/pci_liveupdate.h                |  4 +
>  6 files changed, 119 insertions(+), 7 deletions(-)
> 

[...]

> +		incoming = pci_liveupdate_flb_get_incoming();
> +		if (!incoming) {
> +			dev->liveupdate.inherit_buses = false;
> +			goto out;
> +		}
> +
> +		/*
> +		 * It is safe to sample incoming->ser->nr_devices and then
> +		 * drop the rwsem since nr_devices will only decrease. Thus the
> +		 * only "race" is that the current scan will be overly
> +		 * conservative and force bus inheritance.
> +		 */
> +		dev->liveupdate.inherit_buses = incoming->ser->nr_devices;

Nit: inherit_buses is a bool, while compiler will handle it correctly,
maybe we could:

dev->liveupdate.inherit_buses = !!incoming->ser->nr_devices 

OR

dev->liveupdate.inherit_buses = (incoming->ser->nr_devices > 0)

for readability?

> +		pci_liveupdate_flb_put_incoming();
> +	}
> +
> +out:
> +	return dev->liveupdate.inherit_buses;
> +}
> +
 
[...]

>  		/*
> @@ -1497,8 +1501,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  		 * do in the second pass.
>  		 */
>  		if (!pass) {
> -			if (pcibios_assign_all_busses() || broken)
> -
> +			if (assign_new_buses || broken)
>  				/*
>  				 * Temporarily disable forwarding of the
>  				 * configuration cycles on all bridges in
> @@ -1512,6 +1515,11 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  			goto out;
>  		}
>  
> +		if (liveupdate) {
> +			pci_err(dev, "Cannot reconfigure bridge during Live Update, skipping\n");
> +			goto out;
> +		}

Quite helpful! Thanks :)

> +
>  		/* Clear errors */
>  		pci_write_config_word(dev, PCI_STATUS, 0xffff);
>  
> @@ -1572,6 +1580,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
>  	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bctl);
>  
>  	pm_runtime_put(&dev->dev);
> +	pci_liveupdate_scan_bridge_end(dev, pass);
>  
>  	return max;
>  }

With the minor nit above,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
