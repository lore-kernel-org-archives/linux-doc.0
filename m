Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC338AC65
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951868; cv=none; b=FhI/XyPxJ0nsojcgwEsYpSmqXoMwItfslVUMAVE/2o090/15DVinwlPioJeXBizLMOPPch6ThoD5qIDhk02O7xxXXO557gzPC6bXlBXvqSA+zbzuaMPXTY+xNhf9edF30IRZKbLsxaFF38Q0p0RJdgSKq1GnCETwbtyd7C8JGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951868; c=relaxed/simple;
	bh=RgrBSzRAxPq1hTiEITmRzTE416WdMM+7VkSjXwkwPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0zdweDpPosGcBLU9CRkVh8y//KJELZcN+sQPSUFlhPMXMLq8AvRCPkF23cYVsiKsmO6DmGcwqoC62ut+xALvZVpsj0jW862Ff4DVVd2w4wqer4X8nmmRVvK8/MIQ4XkaUsgiIMOml2OGzX0SEV3S3n+a2gvcg0H2djcICqkmLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZe/h+O/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZe/h+O/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso502195a12.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780951867; x=1781556667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqANBGSP00mnERvECbdyBZ/QnoUicIMj2Z9x9A+M1D8=;
        b=eZe/h+O/8Oa/XTt7FeXjKP9js+XVO8RqJQUg68yRxQTmgI50v+Q+NGutCCzPtthJL8
         RqKn3xUkoNpsQtW8Tb1nqfEOWLd4dFgts1suLFyvf+baW7TKAlV3kiZBrj1OjcMe8TVm
         jqe2KHIm0dA60iVTjn10RS439nJYTL0Cf91F4+1QJUilaaxZQSf7RxDHySgniJI7aHAz
         s/xZV5L2ItrQyLc3RHU5+HL2RwdfzkscC2cP4HTC77zdEFMA+V/9OjsitA8OZtIesjo6
         3o6MeQ9iNETHAHIYxu0qMgShoZGKtyQ+11xUo9fGe/nyA2ZMKqBzMMX3KL4oasN9H5GW
         RMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951867; x=1781556667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqANBGSP00mnERvECbdyBZ/QnoUicIMj2Z9x9A+M1D8=;
        b=G7flhiCYRU3lGa2SJLPjxDihENcKXOVIobJl9Dtg8cU+8piYWQoqZ543ml/WIo9Ajw
         8DIRCgq05D9a3u1E+667/xUzH3tXQn3bi5bkjSicU33I3/dXmsuMULQYYk5dxSkC3g/y
         xjngtajzYkDAlUrvu874F5nbxJ1/ULoU4i3L7vuKaOlaCa96TPhMDDxxOwF6hkii0ioK
         AHNUxY3/TathoMi7dmGQVic6BM00pv0YjrAOZNbNBRIf6tk34MIkMBlixhFc9PQ7Mx0g
         80Yccev4gNIxz84u/sPsjmmPqC494nxtUiK/NvLzSehVrWnG7nSiKEf7phd8XxNJedK6
         PfTA==
X-Forwarded-Encrypted: i=1; AFNElJ9nDUwyiJ9aeKzT2mQtB0KiAZ6VyIUAK0C1yzLDfb1qo7RhZ8SbjwqXhTEKmjaga4m2IFymt4+ZTIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcAVdH8KynTs2IdS1JHpPVJQDO4tBnriZvOzT83C/ihaamKs9
	HfV7oa9gqw9UFJNqtfrY87C9+X12yF+XDDzp1FEG7KVLedIGQQYNWNBxFEVQ0E26lA==
X-Gm-Gg: Acq92OF9cOp7/TyJ1XiGOgVLM5lXvUaubhbBgIm0Lc7SPHe/hiNUoTneYQOZruPalIL
	ChzOUV+wSNPWqv81n1C8fsKJEN3/OgMhSZcmwFqHEsZ2wODIkh3+R+TTLr3xOhjuMeIVxjf/xCC
	tkqQnlJnCwn8yKq8R3tnF2RL72WEePZRUlZ4YWbePblBzWF1E0rWuSysvHlcQQlD/vvkXjOWll9
	5wJAPGJLWJ8XL4KUK5VQeJT9NTMtBBRLaxGq7CLpxGVNGQGPwtU+ghYy1MaSSXcT22Ql9GnORny
	baGLmuNiL0V1ojYsWtKbSninAHxxMafnGtQ4+dXuGX1BdxEA7g/MRJuGXgKV5Fl+UkXqLCXvodO
	caTS0tsEYuIHZ1S8XOfuoUiOF48AacXKXeo3I4/UMHlBAMhGUP4uddTJUdfeiX6YLcLRmMsWzNN
	tDSJV35xQmmzIvZoMR4UvzmqHIEo+BirowaeLHNHwbIOYxpdqcZvYCS57gcgWTGlmdyfd6x+7P
X-Received: by 2002:a05:6a21:a38b:b0:3b4:904f:c9cd with SMTP id adf61e73a8af0-3b4cccffc4fmr20088541637.6.1780951866181;
        Mon, 08 Jun 2026 13:51:06 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm15840734a12.26.2026.06.08.13.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:51:04 -0700 (PDT)
Date: Mon, 8 Jun 2026 20:51:00 +0000
From: David Matlack <dmatlack@google.com>
To: Pranjal Shrivastava <praan@google.com>
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
Message-ID: <aicrNNVrMBtJD2iZ@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <aiJhoq_Yj6-1Hl5r@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiJhoq_Yj6-1Hl5r@google.com>

On 2026-06-05 05:41 AM, Pranjal Shrivastava wrote:
> On Fri, May 22, 2026 at 08:23:59PM +0000, David Matlack wrote:
> > Set up a File-Lifecycle-Bound (FLB) handler for the PCI core to enable
> > it to participate in the preservation of PCI devices across Live Update.
> > Essentially, this commit enables the PCI core to allocate a struct
> > (struct pci_ser) and preserve it across a Live Update whenever at least
> > one device is preserved.
> > 
> > Preserving PCI devices across Live Update is built on top of the Live
> > Update Orchestrator's (LUO) support for file preservation. Drivers are
> > expected to expose a file to userspace to represent a single PCI device
> > and support preservation of that file. This is intended primarily to
> > support preservation of PCI devices bound to VFIO drivers.
> > 
> > This commit enables drivers to register their liveupdate_file_handler
> > with the PCI core so that the PCI core can do its own tracking and
> > enforcement of which devices are preserved.
> > 
> >   pci_liveupdate_register_flb(driver_file_handler);
> >   pci_liveupdate_unregister_flb(driver_file_handler);
> > 
> > When the first file (with a handler registered with the PCI core) is
> > preserved, the PCI core will be notified to allocate its tracking struct
> > (pci_ser). When the last file is unpreserved (i.e. preservation
> > cancelled) the PCI core will be notified to free struct pci_ser.
> > 
> > This struct is preserved across a Live Update using KHO and can be
> > fetched by the PCI core during early boot (e.g. during device
> > enumeration) so that it knows which devices were preserved.
> > 
> > Note: This commit only allocates struct pci_ser and preserves it across
> > Live Update. A subsequent commit will add an API for drivers to tell the
> > PCI core exactly which devices are being preserved.
> > 
> > Note: There is no reason to check for kho_is_enabled() since it can be
> > assumed to return true. If KHO was not enabled then Live Update would
> > not be enabled and these routines would never run.
> > 
> 
> [...]
> 
> > +/**
> > + * struct pci_dev_ser - Serialized state about a single PCI device.
> > + *
> > + * @domain: The device's PCI domain number (segment).
> > + * @bdf: The device's PCI bus, device, and function number.
> > + * @padding: Padding to naturally align struct pci_dev_ser.
> > + */
> > +struct pci_dev_ser {
> > +	u32 domain;
> > +	u16 bdf;
> > +	u16 padding;
> > +} __packed;
> > +
> > +/**
> > + * struct pci_ser - PCI Subsystem Live Update State
> > + *
> > + * This struct tracks state about all devices that are being preserved across
> > + * a Live Update for the next kernel.
> > + *
> > + * @max_nr_devices: The length of the devices[] flexible array.
> > + * @nr_devices: The number of devices that were preserved.
> > + * @devices: Flexible array of pci_dev_ser structs for each device.
> > + */
> > +struct pci_ser {
> > +	u32 max_nr_devices;
> > +	u32 nr_devices;
> > +	struct pci_dev_ser devices[];
> > +} __packed;
> > +
> > +/* Ensure all elements of devices[] are naturally aligned. */
> > +static_assert(offsetof(struct pci_ser, devices) % sizeof(unsigned long) == 0);
> > +static_assert(sizeof(struct pci_dev_ser) % sizeof(unsigned long) == 0);
> 
> Minor Nit: Shall we consider using specific bitwidth types here?
> I'm wondering if down the line another u32 field is added to 
> struct pci_dev_ser.. in that case on a 32-bit machine 12 % 4 == 0 but on
> a 64-bit machine 12 % 8 != 0..

I think natural alignment is what matters for efficient access of the
array elements. So failing the assert only on 64-bit architectures seems
like the correct behavior.

> 
> [...]
> 
> With the nit:
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 
> Thanks,
> Praan
