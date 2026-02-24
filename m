Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907D2EC09B
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959953; cv=none; b=BYU0MrpePxOP9T4fI/x98QuPaTz5ig6VawkMqrMkgxvvFcbcoNemK3hF1LEASP17X/Rt03vVXFbj9QNJ+qO5293/rntKXAZ6hnGCqqZkYB8MdsiBpBEIWlEzKv9WsIOp77B8tP0ighx0ZbO3nLtlHwvFYAvTF98W614KsGi3Cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959953; c=relaxed/simple;
	bh=zLqgOJeQ8HcmcMPj/D6Uk1/9jsKVA5Yl6xqHM2G/ipc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oigzd+oUc17DpjGQzaS7iFBOSGxcNSlKu9wNceX1lr/MxKZsLcGCAxNz3ywtRmgoK6NoVKz/a5IR643BNrw9CkBMBxHfu2Y/IFDZudPCVuO57R4U0xrUvb65BaD4cxZ1XFka5z2IQf4yrVjJsq8UemTCBrjk3LcWNuqmneQ7GVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XjJ57PV6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XjJ57PV6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ada9e4ea32so8545ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 11:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771959952; x=1772564752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+nxktJgrzlaK8SQflM75E9Ffs6HGnnvzkBNJC6O+O8=;
        b=XjJ57PV6eCuG03bEGDsZ1mTTjXgW7DqNA+G3Le3UkilUzXAv/s2ILGXnncw7uhLBON
         6H4jE55Vnvcs8sMeNPgYXGftRYR1zsLUreXAjpXUvr94HRn8C4cJB7h0tUiQ4kyFRtp2
         C59fePh3kba907GAjgNdxlBxVtaxXJ+H6mySqd4tp6OWS9K/TUMoqL0hCiOLW48HmDIn
         WN72WF1QNt3QnJyHC7/kNKUgdjY5uJRsFkbIH2brkdsogt/KTVWXN5vExTvt7jHCBoro
         aD6c0fZdh6rpnWV4vqLZTCa5um8CwPMjpuLzBdpWhc8kI0VbcXzKDr5vWjnNkusM1txX
         jVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959952; x=1772564752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+nxktJgrzlaK8SQflM75E9Ffs6HGnnvzkBNJC6O+O8=;
        b=GjO70TJuQfE/I0AmpVa6JtapjEjLLgmcu+Liy4a7OBdZ23hZ3ynT72Xz2j8S76fziI
         J0o6I/pvcWMZuUyFp7XBF2m6xz80unhIlPun26syUsjjH9/ZgQk2mc4daXlQ5AGuyrVS
         biyPTvAAZ4euIi/StHV/WdOIY/Hd0jUl34n2gCImps9O4P8ebTG2mXQkezYCv42YnrHH
         fgsQUHUAQEi+7dXYErBEweTK3sr201GSpbQOQXKc65WbhUeknGP4NwpvtJoFAiyCcM1P
         f9ibhgAyhapJzY6gduaW+DT2omIEY1DxV7po/eULcMrwiJRYg4jLE5xLhAg31unp6FPY
         TfIw==
X-Forwarded-Encrypted: i=1; AJvYcCWy6X/uEHk6JWEBueGJbRiyaviLeNfWNpA1ZEjGaIcnYRChB8Phq3boNu5BGKjUa0fUN0DLKc7xyg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJHpJKItZOAzvvR1fOfCg/f5uISPD1vF57ZlYuSlVIFDC/4r1
	+yjq/KFJY8f74GdTPgFPjXHHEJXgIJGcCe4cD8TX6nXzBw8rsMP80tRASb0wpKhvJg==
X-Gm-Gg: ATEYQzzI2qV6gbQbmahKJL5IgLcLCFjaelf58lOZwkPut3DGz+npk2n0Te9eQG2y9vH
	emAq4fdOu+q1nIS0KIS/ypz5ajoTqIfv3B4DTp/kRSIa66YdXlQ8JvahULPBEFsyY64lbDfZrSx
	wNbcDorhxVpwUuNq3Fs4c+QyXCkXhS4xdm7hpHIJ/pX+vs580JsM2gBa/GwZ4xUfTYcmlOAfE8s
	qR+sFul2llzcSabfD9SE+kuyh++6SzoBI2kSJyT1RFInCNihy74/0eYjfiPewFKqGEcYqeMmgPh
	j06EhGPowaW7cf2u1ktib5idv+etW47RDKRM/95PrrgWrTl2dmLIHytHGvtAQOH6zk6mk4TCcEU
	3OjRzhlfsk9Kj7GHBzZhvQllYS1J0W3H7/cLh5W4CtlXOpDklJcasTuwz45VMp3SbEHbXiDeAs+
	wu64+YcSnHGEwx/UUTXs21hMATejs5mqE3k37asBDyhs/AawP3Iek77xHORhrb
X-Received: by 2002:a17:903:3d0c:b0:297:f2a0:e564 with SMTP id d9443c01a7336-2adca83b652mr139205ad.11.1771959951330;
        Tue, 24 Feb 2026 11:05:51 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590241e8a2sm595715a91.12.2026.02.24.11.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:05:50 -0800 (PST)
Date: Tue, 24 Feb 2026 19:05:41 +0000
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
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
Message-ID: <aZ32hf3dHibfb4B5@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-3-dmatlack@google.com>
 <aZ1svGur9IxQ7Td2@google.com>
 <CALzav=fSpd6H5pQNtJoFHdNtWVO11vffhWQFsMFkM+osGuE0wQ@mail.gmail.com>
 <aZ314HSRnYtGinTU@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ314HSRnYtGinTU@google.com>

On Tue, Feb 24, 2026 at 07:02:56PM +0000, Pranjal Shrivastava wrote:
> On Tue, Feb 24, 2026 at 09:33:28AM -0800, David Matlack wrote:
> > On Tue, Feb 24, 2026 at 1:18 AM Pranjal Shrivastava <praan@google.com> wrote:
> > > On Thu, Jan 29, 2026 at 09:24:49PM +0000, David Matlack wrote:
> > > > + * Copyright (c) 2025, Google LLC.
> > >
> > > Nit: Should these be 2026 now?
> > 
> > Yes! Thanks for catching that.
> > 
> > > > +int pci_liveupdate_outgoing_preserve(struct pci_dev *dev)
> > > > +{
> > > > +     struct pci_dev_ser new = INIT_PCI_DEV_SER(dev);
> > > > +     struct pci_ser *ser;
> > > > +     int i, ret;
> > > > +
> > > > +     /* Preserving VFs is not supported yet. */
> > > > +     if (dev->is_virtfn)
> > > > +             return -EINVAL;
> > > > +
> > > > +     guard(mutex)(&pci_flb_outgoing_lock);
> > > > +
> > > > +     if (dev->liveupdate_outgoing)
> > > > +             return -EBUSY;
> > > > +
> > > > +     ret = liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **)&ser);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     if (ser->nr_devices == ser->max_nr_devices)
> > > > +             return -E2BIG;
> > >
> > > I'm wondering how (or if) this handles hot-plugged devices?
> > > max_nr_devices is calculated based on for_each_pci_dev at the time of
> > > the first preservation.. what happens if a device is hotplugged after
> > > the first device is preserved but before the second one is, does
> > > max_nr_devices become stale? Since ser->max_nr_devices will not reflect
> > > the actual possible device count, potentially leading to an unnecessary
> > > -E2BIG failure?
> > 
> > Yes, it's possible to run out space to preserve devices if devices are
> > hot-plugged and then preserved. But I think it's better to defer
> > handling such a use-case exists (unless you see an obvious simple
> > solution). So far I am not seeing preserving hot-plugged devices
> > across Live Update as a high priority use-case to support.
> > 
> 
> Ack. If we aren't supporting preservation for hot-plug at this point.
> Let's mention that somewhere? Maybe just a little comment or the kdoc?
> 
> > > > +u32 pci_liveupdate_incoming_nr_devices(void)
> > > > +{
> > > > +     struct pci_ser *ser;
> > > > +     int ret;
> > > > +
> > > > +     ret = liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **)&ser);
> > > > +     if (ret)
> > > > +             return 0;
> > >
> > > Masking this error looks troubled, in the following patch, I see that
> > > the retval 0 is treated as a fresh boot, but the IOMMU mappings for that
> > > BDF might still be preserved? Which could lead to DMA aliasing issues,
> > > without a hint of what happened since we don't even log anything.
> > 
> > All fo the non-0 errors indicate there are 0 incoming devices at the
> > time of the call, so I think returning 0 is appropriate.
> > 
> >  - EOPNOTSUPP: Live Update is not enabled.
> >  - ENODATA: Live Update is finished (all incoming devices have been restored).
> >  - ENOTENT: No PCI data was preserved across the Live Update.
> > 

The flb_retrive_one seems to call:

 err = flb->ops->retrieve(&args);

which could be anything honestly.. since the luo_core doesn't scream
about it, maybe the caller should?

Thanks,
Praan

> > None of these cover the case where an IOMMU mapping for BDF X is
> > preserved, but device X is not preserved. This is a case we should
> > handle in some way... but here is not that place.
> > 
> > >
> > > Maybe we could have something like the following:
> > >
> > > int pci_liveupdate_incoming_nr_devices(void)
> > > {
> > >         struct pci_ser *ser;
> > >         int ret;
> > >
> > >         ret = liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **)&ser);
> > >         if (ret) {
> > >                 if (ret != -ENOENT)
> > >                         pr_warn("PCI: Failed to retrieve preservation list: %d\n", ret);
> > 
> > This would cause this warning to get printed if Live Update was
> > disabled, or if no PCI devices were preserved. But both of those are
> > not error scenarios.
> > 
> 
> I agree, the snippet was just an example. What I'm trying to say here
> is, what if the retval is -ENOMEM / -ENODATA, the existing code will
> treat it as a fresh boot because it believes there are no incoming 
> devices. However, since this was an incoming device which failed to be
> retrieved, there's a chance that it's IOMMU mapping was preserved too.
> By returning 0, the PCI core will feel free to rebalance bus numbers or
> reassign BARs. For instance, if the IOMMU already inherited mappings for
> BDF 02:00.0, but the PCI core (due to this masked error) reassigns a 
> different device to that BDF, we face DMA aliasing or IOMMU faults.
> Am I missing some context here?
> 
> > > > +void pci_liveupdate_setup_device(struct pci_dev *dev)
> > > > +{
> > > > +     struct pci_ser *ser;
> > > > +     int ret;
> > > > +
> > > > +     ret = liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **)&ser);
> > > > +     if (ret)
> > > > +             return;
> > >
> > > We should log something here either at info / debug level since the
> > > error isn't bubbled up and the luo_core doesn't scream about it either.
> > 
> > Any error from liveupdate_flb_get_incoming() simply means there are no
> > incoming devices. So I don't think there's any error to report in
> > dmesg.
> > 
> > > > +     dev->liveupdate_incoming = !!pci_ser_find(ser, dev);
> > >
> > > This feels a little hacky, shall we go for something like:
> > >
> > > dev->liveupdate_incoming = (pci_ser_find(ser, dev) != NULL); ?
> > 
> > In my experience in the kernel (mostly from KVM), explicity comparison
> > to NULL is less preferred to treating a pointer as a boolean. But I'm
> > ok with following whatever is the locally preferred style for this
> > kind of check.
> > 
> 
> No strong feelings there, I see both being used in drivers/pci.
> 
> > > > @@ -582,6 +583,10 @@ struct pci_dev {
> > > >       u8              tph_mode;       /* TPH mode */
> > > >       u8              tph_req_type;   /* TPH requester type */
> > > >  #endif
> > > > +#ifdef CONFIG_LIVEUPDATE
> > > > +     unsigned int    liveupdate_incoming:1;  /* Preserved by previous kernel */
> > > > +     unsigned int    liveupdate_outgoing:1;  /* Preserved for next kernel */
> > > > +#endif
> > > >  };
> > >
> > > This would start another anon bitfield container, should we move this
> > > above within the existing bitfield? If we've run pahole and found this
> > > to be better, then this should be fine.
> > 
> > Yeah I simply appended these new fields to the very end of the struct.
> > If we care about optimizing the packing of struct pci_dev I can find a
> > better place to put it.
> 
> If you have pahole handy, it would be great to see if these can slide 
> into an existing hole. If not, no big deal for v3.. we can keep it as is
> 
> Thanks,
> Praan
