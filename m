Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77B4AB3B4
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688543; cv=none; b=CSh7at+bBUszYie7u5fOEr8ru3E6KMyNs7xw6sf3AvfMw+IW+ciuBmB+dZnbHsBJcMRy4FO4YFxt1UZW3mIrY6PATY0mTqoIueXIjxZX904seDxCXgegbVFj/CzVtCJ703sIhWzN7oNvIi+1nHVszo5YeCDRJHqHwJVqwR+Ajso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688543; c=relaxed/simple;
	bh=+u73D0xV+rct8Mvvq6F/NAMtFBFdr9LBEP1+NpB+svk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnxSHUna3v/nBonFvQPGtBZOtSNoITK+7+Wsvs/NSvQCN/tv4mA3cA1FU3vfq0CpSAaKR40xEQ9Cf1ifhDW4FwqGRCbCw8i3odEFHzmRiiiP0FBF/A/VCA4rzIyoxPpCmxK8DI1xH85OTXWzWlHymlVoWMXo3ohtfLB3XYQb20M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JHqCV5gH; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JHqCV5gH"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so226444b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 16:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789688541; x=1790293341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrwLbYHW+qBSkERcNwvno713R7/9AiFADa/N4qgCkwM=;
        b=JHqCV5gHEGvuPP8uuqeKuJdTBiojwfWNM03ljK3DmVrNYbPsEqnbIO7U8uH+ShiFFs
         aCLJGQ+VSDW+hPMjEpWIZ53lJNAoP+CBKHnQDquRBV1fweyg/z7zEWWrJCRF2zsYjZWj
         tzgI+ZFWxK8zR4hYvnU9mcyZIgdUx6jPBgvoHDRsrgaKP5CxUWBohp3mZ/zf3jclmqxB
         Mq/GxDrf4btbAcz2Q5FnotMEC7C1YP3m0qk/yTH94AJ7cy+cT1JpKx5bxbTJ8gfRyfph
         BNoYVHuESrOzDfp8soOxTFcumziY8l4tO1UqDch31Dxff5GmQQlDchMDQpAFfFXUkit9
         uhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688541; x=1790293341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrwLbYHW+qBSkERcNwvno713R7/9AiFADa/N4qgCkwM=;
        b=flGp5BAZwu0WVTDT5jFamOnSPp+hKJbw4dZnAdLIht5tn0mMMkN74K2LzPpv+0bug7
         r7LgNof5KSxa6RI2bIc1Xlh/mNvYYfMxPe7x+FNYVihNrpPwNNz8mzEV4OOuphXPR11W
         Rh4K+PkFpZ9WRrrxC/7tTidNxJg5flwBnACgtYSYp9O5yc/Ueckp088aHyCEvXV/lRjM
         i9QQKyMfeQt5tO9k8usGKMPh9Ec4QDk8dfjxdhNx6GUCIA4Ww3w9zKEP6Vng+QWWVfF5
         /wzCyQZ0uWEA1qby5gujweM0bvbBrygTj+BDBDoVc5snhMg18h+Fx/nde1boygLvU+vd
         y6lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzprAOnUGL4ooEvLEEa8aj1x7ZZcoOXOYnXkBMrq7MIvHpaiGngLtR9RimvuRGO7dGuOMT6tQFXAaw=@vger.kernel.org
X-Gm-Message-State: AFuF++kmShrcwLNf2GujeutMm0ZFO8h6+kH6owDQz35p3ggRKCqhqrQp
	b+spGUX4caS6Z6D2XgHLxvDp5yITtDor4r+He5WAnHrY6f8F++HeWiToj6RBTAm/Xw==
X-Gm-Gg: AYBFou2JyLSz/BkMuulHwp2JatrDQXIPNZoWhSR4ckyIKkGtfMx/mIgztcSp+tVAmDw
	ZWFcp0qFPcJ2RuZAqQjheWL5mqvzXNYi6gpCk29Fo5sBmT5WYkhlliIc9ed0Us6s/gtOwfwbOxf
	+q41cVqiaeQXLXy74eWsgGFW8HRgE+gUYooi/T1+9bgvpfVqqE2rXmc+QF5zvpIpEeWewgHGWOe
	a0rEJDRdBPm0aTVwJ7WnqTSpkyprrzpKhJV8V8jweXdeFs+Dy6iBLaRhH129IX+LnnB+DS0kt6Z
	atrvA6so0o3tNPAcvPeUJBtZkbDy0mpPVCCnC+B9Of3aCAtOJ4FUL/sp1qcJoDmRhF9bKb+4ckO
	royjR6pdgcmH0XTA71LMZ3vHaFKGqIvm3OfEHzsEj+D0OMcmnbv8g1pjmoBBYobvHXQ1Ih9vQKS
	iNbeVSbvTJFs51708kYiFqkohi3gJ/6C1LS6jNaWFcKMSQwRQm1PB4Hwh2hBeeKjPojPhSoNC3O
	Tlux6LY/m4m15kTg9+7EZ9jiUgrr5N0Ume30YhF
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-874dddfe1ffmr1080071b3a.25.1789688540476;
        Thu, 17 Sep 2026 16:42:20 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e5acfsm3586862b3a.57.2026.09.17.16.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:42:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:42:16 +0000
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
Message-ID: <aqx62Czdkh9unP86@google.com>
References: <aqQzmvgILmU8F4TR@google.com>
 <20260917001847.GA993118@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917001847.GA993118@bhelgaas>

On 2026-09-16 07:18 PM, Bjorn Helgaas wrote:
> On Fri, Sep 11, 2026 at 05:00:10PM +0000, David Matlack wrote:
> > On 2026-09-10 06:51 PM, Bjorn Helgaas wrote:
> > > On Tue, Jul 28, 2026 at 10:10:00PM +0000, David Matlack wrote:
> > > > When a PCI device is preserved across a Live Update, all of its upstream
> > > > bridges up to the root port must also be preserved. This enables the PCI
> > > > core and any drivers bound to the bridges to manage bridges correctly
> > > > across a Live Update.
> > > > 
> > > > Notably, this will be used in subsequent commits to ensure that
> > > > preserved devices can continue performing memory transactions without a
> > > > disruption or change in routing.
> > > > 
> > > > To preserve bridges, the PCI core tracks the number of downstream
> > > > devices preserved under each bridge using a reference count in struct
> > > > pci_dev_ser. This allows a bridge to remain preserved until all its
> > > > downstream preserved devices are unpreserved or finish their
> > > > participation in the Live Update.
> > > 
> > > This seems to hint that we're going to allow bridge reconfiguration in
> > > some cases, e.g., for hot-adds.  The simplest case is "leave config of
> > > all bridges the same", and I thought that was what the previous patch
> > > commit log said.
> > > 
> > > What's the benefit added by this patch?
> > 
> > It is used in the following patches:
> > 
> >  PCI: liveupdate: Adopt ACS controls in incoming preserved devices
> >  PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
> >  PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec
> > 
> > to preserve certain configuration on bridges that have downstream
> > endpoints that are being preserved. To support P2PDMA we will also have
> > to preserve bridge memory windows (future series).
> > 
> > If we are ok with applying those policies to all bridges on the system
> > whenever one or more endpoints anywhere on the system are being
> > preserved, then I agree we don't need this patch. But I thought it would
> > be cleaner to track things per-device.
> 
> Yes, I agree tracking it per-device is good.  I was looking for a
> traversal upstream to increment refcounts on bridges, and I guess that
> happens via for_each_pci_dev_in_path() in pci_liveupdate_preserve().
> 
> The actual refcount still confuses me a bit (see
> https://lore.kernel.org/all/20260917000723.GA992337@bhelgaas).  Maybe
> it would help if pci_liveupdate_preserve_device() alloc the dev_ser
> *first* (right after all the bail-out checks)?  I wonder if the
> refcount increment could then happen in exactly one place, separated
> from the one-time dev_ser housekeeping?  E.g., something like:
> 
>   if (!dev->liveupdate.outgoing) {
>     dev_ser = pci_flb_alloc_dev_ser(outgoing);
>     ...
>     dev->liveupdate.outgoing = dev_ser;
>   }
> 
>   dev->liveupdate.outgoing->refcount++;

Ack, will fix
