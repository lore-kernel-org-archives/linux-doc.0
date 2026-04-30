Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C343D8908
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574908; cv=none; b=WAN+8Nbp+bpMF31K3P+DRJ0UqCyxHEVzfC4MYyhyBnFg2Mqz1GH7DQW8U3CUQIkEHY/HBJxf2PHP4kCnKtDmZycTU/CnJTxDB1OeezW6PoxTQUCz6FbOo8ZEsNDJLBYxPbYvhb5UlrVq4bDBtX8oLnoEnMSp9Kc21itmTeP8EbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574908; c=relaxed/simple;
	bh=oOCA6r5C2BmuUW8Nh03N3Y23igUJA/x154m57C9Gmrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6Fel2WKIDCPOTRRj8ZwF+p/eJhcM3f4Pabi3TbeCYA/qepzDs3xW/GGQq/HJN9v+6ep610Sh6Gmh7trm4Qs5lKESCctrYm9miy4PXzyFMIadOC9FDDBeB4rrDXT6INGm9fIUfTtfqU2ZEuiAjddASUqpvKeGq00bmU18zItjzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FXG6muwT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FXG6muwT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b243198058so24635ad.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777574907; x=1778179707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9xAzQZcfn4hf28SgvSsobLbrv7DrZRSNcDWvXS0OfYE=;
        b=FXG6muwT8CW2xQ5uyU6zFGmU3s4eGPuMZADtION1e+h++0ks6a0kAFdLE7skILJ2Bq
         eGo+4lSboHx64gSLBk+xIz5eVkBteWoz993tpGo/ZunCoiLZpFELkl/9z58tkXVGyOPL
         Bg8V5EOS8+CIrCQ0POr7jp4GBPzceF5KrBypalvCMyglGgS3IxQRC9DwO09J2hMy+uqO
         nsk6dAXnmrNF53axhVXgz1G05FkHcMJ6lh8mAus/k4UBqoVb1hwnnjC9QAcC8o0v6giT
         Kwq8bcBuJxdVT8vXcqp203o7DP6FC7YMVSaJX5hWAYiyHwM3tObDn+QH6G/VdkWpSMLL
         AogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777574907; x=1778179707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xAzQZcfn4hf28SgvSsobLbrv7DrZRSNcDWvXS0OfYE=;
        b=mtB7CbJbtoBH+TG3JUbnnF7H7A9FVV68YTZ022nVD12gXkrk+75D3EcmCY3UykL4M3
         t084IVahkkxN7KDQ3Y8gdV/u0bW2yw0qqmAIskehtheywNE3XsdMwt1YgHjvqqDL4Fwx
         c4Mt+yuvCUL9Ik6WDR8ykdrnkm+hqNcqmIOLXRAKviW4ud/bM35W7epB4m2/XugnKapi
         QGO1WyhfwdLaWflBsI+2LFMFyooo9QgHYT8tO7QuAbiI9w+WueDUBJITqDhu8XWAp5QV
         SZyqjpYW8D/xf8reiTJxCE8Uq6pMub3iLdpVZOplOWZTSxGefx6l+E1TFeudT5AlEGck
         +ruA==
X-Forwarded-Encrypted: i=1; AFNElJ9afMX3GCJ/01gvDJmFalrQtN0qLU1sawxgWVYZ2I00EkEktNsZ0OJvSlEqgelzxMV5uJtUGx9dC18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tBxcM3a/aBs3Slip4WeE6UBrxI0VSTEMv3ursQet/MX+vCs6
	87ko8hasABFTRcU60ev2Ija/kWXMchwIaxGHQAJS1AjWZsiaTmhHzj9C0O4wndzCJg==
X-Gm-Gg: AeBDiet3hiyvmNk18eJt6CGj7NMY4fPorATUxirRZzcVV4TPOeekHssFVaV5nFQC7Hg
	gzu3PQmLXAroHYQZ+EWGHCZ5Z5DkZyZmW34BIkSALGXm+USIYBhsL5hgoQfMn2uvqcYKXNOLh9n
	vXBP/gx2p4NOyYqBN2yEtMyi46hQaa0fG0cpXMLn1cHROXlR1PVF2heJb7xeBNEC+CDU3SkBG5z
	rLRsVcNn+g72EpZI+wdkHEPnfePzS4XQ0MQlAJsBnnyAi/rJ6by0U8ru31bneWz+TgjDVzuQLAf
	xhDj/QtvloKPl4/Zr3EOJupqLNQGqgFURAaisiv4Kxm2oWEz3M+14lhC5beYikK6Z997IU+fkoL
	BY0UTuX2XL2adnwCUh86mE1QgiSyFIrHLZB7lqF8Z+PgJwybzANY5GAs8d0XQ0hWNL3Jb/nLNXR
	NfBF4dWJxD3mI/EVoeLq/Y/7314fh9jR1Qol4H3/EjyOmTvBAYNtqryyp/aOBRy8zfsvQfkVYkN
	/UCdhJlKQ==
X-Received: by 2002:a17:903:4b4f:b0:2b0:5c88:51e1 with SMTP id d9443c01a7336-2b9cd98bb43mr418175ad.14.1777574906266;
        Thu, 30 Apr 2026 11:48:26 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e47asm3289405ad.15.2026.04.30.11.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:48:25 -0700 (PDT)
Date: Thu, 30 Apr 2026 11:48:21 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>, 
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 01/11] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <20260430182532.GB13902.vipinsh@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-2-dmatlack@google.com>
 <20260428185242.GB3825533.vipinsh@google.com>
 <afFICT9mSL1XG0v_@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afFICT9mSL1XG0v_@google.com>

On Tue, Apr 28, 2026 at 11:51:37PM +0000, David Matlack wrote:
> On 2026-04-28 12:45 PM, Vipin Sharma wrote:
> > On Thu, Apr 23, 2026 at 09:23:05PM +0000, David Matlack wrote:
> > > +	pr_debug("Preserving struct pci_ser with room for %u devices\n",
> > > +		 max_nr_devices);
> > > +
> > > +	ser = kho_alloc_preserve(size);
> > > +	if (IS_ERR(ser))
> > > +		return PTR_ERR(ser);
> > 
> > Should there be a similar pr_debug() in case of failure to denote that above
> > "Preserving ..." message didn't finish, or, maybe just print one
> > pr_debug() after the error check above?
> 
> Hm... I guess there could always be more pr_debug()s but I don't want to
> instrument every error path. I could move it to the success path but I
> don't see how that makes it any better.
> 

In current way, it is printing that it is preserving pci_ser, but there
is no indication did it succeed or not in logs. If we are printing the
logs then may be complete picture will be to know what is the action and its
result.

I think moving to success path or printing again based on the failure
provides assurance of what happened. If this gets printed in happy
path, then we will know it succeeded in preserving that struct on
kho.  Absence means it didn't. 

We can also remove pr_debug(), if this is of no value.

> > 
> > > +/**
> > > + * struct pci_dev_ser - Serialized state about a single PCI device.
> > > + *
> > > + * @domain: The device's PCI domain number (segment).
> > > + * @bdf: The device's PCI bus, device, and function number.
> > > + * @reserved: Reserved (to naturally align struct pci_dev_ser).
> > > + */
> > > +struct pci_dev_ser {
> > > +	u32 domain;
> > > +	u16 bdf;
> > > +	u16 reserved;
> > 
> > Should this be renamed to 'u8 __padding[2];' instead? This will allow to
> > just change the array length based on the need (0, 1, 2, 3).
> 
> Sorry I'm not following what you mean here. What is the reason to rename
> this field and change it to an array?
> 

Having a padding explicitly tells there is a requirement of being
aligned. Reserved sounds more like don't use this u16.

If someone add more field down the line say u8, then to make struct size
aligned they will need to add another u8, u16, u32, and name those
fields padding or reserved. IMO, having a u8 array named padding makes
it easier to just change array length as per the need.

> > > +} __packed;
> > > +
> > > +/**
> > > + * struct pci_ser - PCI Subsystem Live Update State
> > > + *
> > > + * This struct tracks state about all devices that are being preserved across
> > > + * a Live Update for the next kernel.
> > > + *
> > > + * @max_nr_devices: The length of the devices[] flexible array.
> > > + * @nr_devices: The number of devices that were preserved.
> > > + * @devices: Flexible array of pci_dev_ser structs for each device.
> > > + */
> > > +struct pci_ser {
> > > +	u32 max_nr_devices;
> > > +	u32 nr_devices;
> > > +	struct pci_dev_ser devices[];
> > > +} __packed;
> > > +
> > > +/* Ensure all elements of devices[] are naturally aligned. */
> > > +static_assert(offsetof(struct pci_ser, devices) % sizeof(unsigned long) == 0);
> > > +static_assert(sizeof(struct pci_dev_ser) % sizeof(unsigned long) == 0);
> > 
> > Nit: Maybe move this assert to be near to the definition of this struct,
> > easier to find it when editing the struct vs finding it later during
> > build.
> 
> The combination of these 2 asserts is what guarantees that every element
> of the devices[] array are naturally aligned, that's why I put them
> together here.
> 
> I can move it up though if you think it's better.

Okay, SGTM.
