Received: from mail-pj2-f21.google.com (mail-pj2-f21.google.com [74.125.227.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09EA4A8FFF
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 23:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688665; cv=none; b=Nv3ckbi1LSxSCdQLk3eOSm3xY+6tyg1LfqCUbX0rdMuOQTJKcPhxf0pXGN6VwzC3YPf5v/hoXuKPJVib5Yj93yKt4JBj8+O3w8EwZ1tsF4wGfOz0vjj46IkPv9bADF1YP8A84+j+szKjCNK5XPoU4ldmVGKgP71EVIhd1PmGcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688665; c=relaxed/simple;
	bh=0qb5BN4Fj2nv+sgYAPZ46br5D4GO5PoKovsuRwRkY1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZz4aDVh4KppJkp7c2Cl42p7To5bMS4DZTY575IzxgY4bLg+CyUc2xPWJYIm1yod4gXrf7ePTwZQckw3XTAEt//bEnY6oNXRqn0KMKxGI2Hg3mVthQZtmU4aEzUD6pv1RnXQMAHKDoFInZBaq3BOr8R6qLOSfhie+UT0oxg/uOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fIHOCuxa; arc=none smtp.client-ip=74.125.227.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fIHOCuxa"
Received: by mail-pj2-f21.google.com with SMTP id d9443c01a7336-2d747f0b25dso1675885ad.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789688663; x=1790293463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0O1lZsSl6FgDJ9eTYr2jlFm3jSIkWmZkODdW+Q8s2I=;
        b=fIHOCuxar3V6N3nRyYwyOBcMx25y+NyZcqs0AY84mFT+xwFfPqJKwOGb1ksccBidBR
         d19yafntAo/US2zxt0jccsO1B9hLnulcO6//5cM+YtRTWok9yTdBcYc6Q9WTeJyxW7ON
         eI3t6eOD4nof6MnVagWJkU0eMMhvHyvq0uXy61hruFYTmmIRDzo1MQ7GMnj4hS670t08
         AfuE+GvbslBfgsg5/3Ox1ym/OaKTZ9Ni8/RVv2pVbG+FCGRONjilASp/y5djgrZJdAXT
         b2nLbmdDomUtH3chp9Kv/8DkXeW1P01VAyEgZlFwQog+TIqwsnMzIWibWRhVlBMcFroX
         v3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688663; x=1790293463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0O1lZsSl6FgDJ9eTYr2jlFm3jSIkWmZkODdW+Q8s2I=;
        b=KDhSGcTDeEte5moVSV7IFtxyHGRjeKb3Xr9k1gEC58vg5gFyozYsW9JCu9e0KyTv5r
         IokX8BXneSfNE9ugDeRvQDkvnDcmbNpJEfUO4Bqre307Igy5l3J2GuLs2gNZkk/7q79u
         o/UrW8JrlpsLLShElw4ILKsSXdu9Qiulufc//6jT7l4V6dBk7iMFuXJaFWMs9Fo23bye
         cEtaxyH3qnHy+Lud80nsOWUoX8m+JHOE8klRl/XtULN6MvTTa8DYHowH7TPi9KhCWfjl
         Qf4Tc87ez9QcjrXW8CSEgpRlFQJeFtg9MC+DUSENkzeYfphd35bVOTYXfolXVN9RIkBL
         IFqQ==
X-Forwarded-Encrypted: i=1; AKwUvByJxjMeCCbU7uNRQ7rf0ImJCoYwNLDea2RvpdmDpOIHp+8swZGsuoNSts9Xc55ydjhW8FDBGNTj00o=@vger.kernel.org
X-Gm-Message-State: AFuF++nimbiniolZtVM1xkPL1WfkynlFL2MlVOL0jdkcnQaX5T0ymKle
	McoWKcSskDo5z5euIY3n0qdMIJUqrVir6F7bsG5T/ufvs/a68avbbWxJDGH6iKpWbQ==
X-Gm-Gg: AYBFou0HoubtEqg++QYFMsUfSP9pE2v/i62EEV2eiE0O4tChJLNdE7kuPab1YnWVeSY
	FrvR/vDpUqgYaYUvm9hSM3o297AKCvf1shq9UEr7urcRqQk//xHVjrM9Bovy3CaSe9+sCuZygGs
	zdE7GJu6Gw3zdZo0/tHG0cpc4HUlXC4ioim4BXTpFMpGMM79z0bcOxpsLK3exKQTqVSfvvME77d
	o75PoWrpy2NsJdE+nFPhazk4ESQTMHoj0S/Vkmn8Y454ox0PP7dT1bnLivK2SZe9NHWMQyB+Zsj
	ybOD/xwKW+J3J00TUPmA8Y/66hlvwnQpLewm2ihYOApYyh4tWZY3rqQKM/u8hOwAfEOEX1O693R
	bl7IwSYl9/sWtAYfglwpOS6uxREeqNXmnLOttXjOO/yAoNb+w7fHjge4bRcdI/ZFDAB3jO0akE+
	yvlywIbHqEzipOF14m2PN/3s8cl9oFLbRVN/3QEVQykjiPkBjv/UnR2QXCjgdad3NRlrVsMe63a
	GXUZs56gq8NOWh7epoJ3ZjEr72IVfXd4S1K6luYsBmvmRG4q6w=
X-Received: by 2002:a17:90b:2ecb:b0:39e:4c81:6c9a with SMTP id 98e67ed59e1d1-39e54fafb06mr1575707a91.32.1789688662542;
        Thu, 17 Sep 2026 16:44:22 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e535f0421sm443246a91.1.2026.09.17.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:44:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:44:17 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <aqx7USJxZrk9GIWm@google.com>
References: <20260728221007.2098560-7-dmatlack@google.com>
 <20260917000723.GA992337@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917000723.GA992337@bhelgaas>

On 2026-09-16 07:07 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:10:00PM +0000, David Matlack wrote:
> > When a PCI device is preserved across a Live Update, all of its upstream
> > bridges up to the root port must also be preserved. This enables the PCI
> > core and any drivers bound to the bridges to manage bridges correctly
> > across a Live Update.
> > 
> > Notably, this will be used in subsequent commits to ensure that
> > preserved devices can continue performing memory transactions without a
> > disruption or change in routing.
> > 
> > To preserve bridges, the PCI core tracks the number of downstream
> > devices preserved under each bridge using a reference count in struct
> > pci_dev_ser. This allows a bridge to remain preserved until all its
> > downstream preserved devices are unpreserved or finish their
> > participation in the Live Update.
> > ...
> 
> > +static int pci_liveupdate_unpreserve_device(struct pci_flb_outgoing *outgoing,
> > +					    struct pci_dev *dev)
> >  {
> >  	struct pci_dev_ser *dev_ser = dev->liveupdate.outgoing;
> >  
> >  	if (!dev_ser) {
> >  		pci_warn(dev, "Cannot unpreserve device that is not preserved\n");
> > -		return;
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!dev_ser->refcount) {
> > +		pci_WARN(dev, 1, "Preserved device has a 0 refcount!\n");
> > +		return -EINVAL;
> >  	}
> >  
> > +	if (--dev_ser->refcount)
> > +		return 0;
> 
> I guess this is a nit: I was looking for a dev_ser->refcount++ in this
> patch to correspond with this decrement.  I *guess* the
> "dev_ser->refcount = 1" in pci_liveupdate_preserve_device() starts
> that, and the "dev->liveupdate.outgoing->refcount++" there is an
> increment of the same refcount?  The connections there don't seem
> quite obvious to me.
> 
> But I guess "dev_ser->refcount = 1" was added by a different patch, so
> probably *not* the same?

As mentioned in the other reply I can combine refcount=1 and refcount++
into a single refcount++ to make this simpler.

The refcount=1 is for when a device is first preserved. refcount++ is
for when a device is preserved a subsequent time. Bridges are the only
devices that can have a refcount > 1 so that's why this patch introduces
the refcount++.

> 
> >  	pci_info(dev, "Device will no longer be preserved across next Live Update\n");
> >  	outgoing->ser->nr_devices--;
> >  	memset(dev_ser, 0, sizeof(*dev_ser));
> >  	dev->liveupdate.outgoing = NULL;
> > +	return 0;
> > +}
> 
> > @@ -385,13 +418,23 @@ static int pci_liveupdate_preserve_device(struct pci_flb_outgoing *outgoing,
> >  	}
> >  
> >  	if (dev->liveupdate.outgoing) {
> > -		pci_warn(dev, "Device is already preserved\n");
> > -		return -EBUSY;
> > -	}
> > +		if (!dev->liveupdate.outgoing->refcount) {
> > +			pci_WARN(dev, 1, "Preserved device with 0 refcount!\n");
> > +			return -EINVAL;
> > +		}
> >  
> > -	if (!pci_is_root_bus(dev->bus)) {
> > -		pci_warn(dev, "Cannot preserve devices behind bridges\n");
> > -		return -EINVAL;
> > +		/*
> > +		 * Endpoint devices should not be preserved more than once.
> > +		 * Bridges are preserved once for every downstream device that
> > +		 * is preserved.
> > +		 */
> > +		if (!dev->subordinate) {
> > +			pci_warn(dev, "Device is already preserved\n");
> > +			return -EBUSY;
> > +		}
> > +
> > +		dev->liveupdate.outgoing->refcount++;
> > +		return 0;
> >  	}
> >  
> >  	dev_ser = pci_flb_alloc_dev_ser(outgoing);
