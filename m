Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE233AEB2D
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001950; cv=none; b=gmlznqc6FA24cZX4wKJ77qFY50clzyjBxPHGyVPo3vl1YL2T5uhzCOetOuMJxx4pxxPTG7PtsU7XkyUcZ49Ui7+3vSjG98R/EdrbgN25dA/Ziqzr1Et/aX4Q4swaNgYikN4G0M1NSxTUSUYXYUmcqmKUmksPnJaEkrp0CtWiPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001950; c=relaxed/simple;
	bh=inxauirSdSBtUq285TjdHRaUOR7xwNsC6MkSXARnYKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGLeqcU7CcpVS2bNBT3AVYvG+ynO9yZxOpr4qFdH5oW6xEMhdfY+uAyPJn3Hc0ULfHy9ruADOxBTuPHP8LeDC2TDhEfSt9G2Hio/ySRj+Fde2ZP0o0Ozrk54tiY4NTabsL1qVGXIg0tEaceHhanjTi1TVMQgjg7Vbuf5xP/DvzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VVrRvQZ4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VVrRvQZ4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf2911f93cso418565ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781001949; x=1781606749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=No+49IMmQGsjPk0qMclq8vTdt88psTr6uq6iD4QVA2E=;
        b=VVrRvQZ441Tn5SAsCO0q5dhRuqPc8o3fxKL+T4oL79bkTHDFpwDskSSH7mWAdfXM3c
         yQk8diufRbgYN3IoX5Ol/aRRXB6X5rG38N8sDb1GH4Eg00iwuM/bEkMdmSvK8Yrn/Cli
         WvtoO4gt5kAej7avzE4ebJBK7E0/JXKntOmnvj3fERsziSCzV3M95H5rafE7yVCpWFv/
         nbqV0QXgKGzLAecEa5U0VgnR/j0L6oGNQJDrjRyH1Hny8ZOXXA15JQTPDvZaOSNZU6Du
         FQyGCkIZ5wrVnEE7dNsPvUxoQ+i8WO0RY0cz+9rvSkK2YfnWLGBwh1v9nFNC+Ms0gGj7
         2djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001949; x=1781606749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No+49IMmQGsjPk0qMclq8vTdt88psTr6uq6iD4QVA2E=;
        b=Ru32RIn5qTma4I9AQz7bn879pwsWC2RQyGUKOTBeeP0FwbzyBjrNAAdXh4xSFoFwBO
         hV5rZqkVmO3YyfYF7mcNAbhaIXdLHDxkYWtQcJKJTI2cgxdg8AoRK+j/6aCHJ51R6Ez+
         otrTA/Hux1XD5dM+A1NU7mfshBgGpkGxX+r02o2AHFKM5gx+GghuK9TEsX6Ra4+8t1hb
         aq6mzyWW9ISIRP0OxW+mc4EdRu6sQFKUa+1F068Y0Uct8x7KrQDnbGrjAldIOW19xVye
         J+UE1mpT8h9R4K/RMKCWGvc+bnMuv2efBRqF08ie5YRnUCKP/9h+vu/510UFzN5wTevG
         Hvtg==
X-Forwarded-Encrypted: i=1; AFNElJ8py8/HIdnJsCZTHQS/c2YKlM4lqDkpLdv+r6QE7BLsj5/fG+j6OVMd4HfBmmdY+aKz3oqtDhFriFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBXocCrnUKSa9jwUkyKre7L36cUaHkR+awLHxOEyvBE+zrnIA
	MEvSUwL0z5UCwmfNmRx8ICZ0qgs+V+NuaRocqT2XbPCmp1c86ZRJRcJ8vKoPWzk9qw==
X-Gm-Gg: Acq92OHv89yEjLfoJAvtRvvMMH+7VaLQzzu2cbFWo3bTwmba0EYOPOt3vRsSD58uLFP
	gef45yPKDguGnUNs4c0xeZd44ik73G7+o0Cu0eRRQffn0Y8uzV8J7B9rjRaaABoudLDImtJ2aNF
	naKw0sg1Do0PRjEHH3RCV5dROTylnJDUMZOUYJ6zNH1gKo2Q8/D0WRH85tSuqAxpz9hnRR4gqt4
	LqRbZ7i1uWhozIUiUOtM2WgpMfZc9OCXvtEkUmi3sCi73YLqvpE2C9ujYg6ZQjWHOIV5TwDg1QQ
	X0RmVVO1EJIwy5DSvC5kz3SOSONwK82wMD4BSn/E9WTzWNe0WJx/AHzYqbDKOMfUg6gw9nnc1AI
	uDXhadXrjoVnPdAElCayyYnzQu8KrKJyLxpkC1qfWZtn++ShF+qCDTyzFPQXnIVgRXMS5QCp6Zi
	EoqCoRpIrJHk4a6wC1u89SDx8kpdewIYqoCiLBdjg+zefUplGqhk1v71/L7SmANicde/Ix4Bg=
X-Received: by 2002:a17:903:fa5:b0:2c1:ee6e:4e4c with SMTP id d9443c01a7336-2c1ee6e51e8mr7663135ad.29.1781001948407;
        Tue, 09 Jun 2026 03:45:48 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e228asm22864909b3a.47.2026.06.09.03.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:45:47 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:45:39 +0000
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
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <aifu0wys8IENAK1C@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <aiJhoq_Yj6-1Hl5r@google.com>
 <aicrNNVrMBtJD2iZ@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aicrNNVrMBtJD2iZ@google.com>

On Mon, Jun 08, 2026 at 08:51:00PM +0000, David Matlack wrote:
> On 2026-06-05 05:41 AM, Pranjal Shrivastava wrote:
> > On Fri, May 22, 2026 at 08:23:59PM +0000, David Matlack wrote:
> > > Set up a File-Lifecycle-Bound (FLB) handler for the PCI core to enable
> > > it to participate in the preservation of PCI devices across Live Update.
> > > Essentially, this commit enables the PCI core to allocate a struct
> > > (struct pci_ser) and preserve it across a Live Update whenever at least
> > > one device is preserved.
> > > 
> > > Preserving PCI devices across Live Update is built on top of the Live
> > > Update Orchestrator's (LUO) support for file preservation. Drivers are
> > > expected to expose a file to userspace to represent a single PCI device
> > > and support preservation of that file. This is intended primarily to
> > > support preservation of PCI devices bound to VFIO drivers.
> > > 

[...]

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
> > Minor Nit: Shall we consider using specific bitwidth types here?
> > I'm wondering if down the line another u32 field is added to 
> > struct pci_dev_ser.. in that case on a 32-bit machine 12 % 4 == 0 but on
> > a 64-bit machine 12 % 8 != 0..
> 
> I think natural alignment is what matters for efficient access of the
> array elements. So failing the assert only on 64-bit architectures seems
> like the correct behavior.
> 

Ack. I guess what I was trying to say was we'd anyway need to keep both
architectures in mind, i.e. adding members should be 64-bit aligned
(which implicitly also handles 32-bit) as with the current assert
any new addition would have to be both 32 & 64-bit aligned. I guess we
can keep this as is.

Thanks,
Praan
