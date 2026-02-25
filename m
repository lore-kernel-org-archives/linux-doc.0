Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC1B319601
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772062871; cv=none; b=CsvBSm7tpBMtV/DX9UDBdvUPEVjEynLW9Tkwn9G64yObLMvoFm7Gr/NH/MythyUR1lMH+Rbekhq0V/9SMOZYUyM8X6L4jiZ1Zo7xH0CdO2mewYrluhnN3C90x5CZ3TDEGDr6/vqDb75+Uwpy3HNvnStKvBIjTiqMj5L3um1Vv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772062871; c=relaxed/simple;
	bh=bKI2pGpfY+ZCgdQUPM1XvD0dVj7imv1jMLjUvrJ34gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn/owKxLCjSV1R5SDXL0aF/N+Rwpj0MhvRYrkHlw8zNjX6cGFOFjWIC5RheSeeBqEolxbwnZ4BLuPTZZRtBnqPKDI4qHfmxqf6RApLjFgQ1w7tYpI6cjssB8lz28UU4HFjgaQgLOxyZsMIffwsdFYA+5EygCKPIHWEN1CxlJU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ic4P6Fkf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ic4P6Fkf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf9191da3so1202205ad.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 15:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772062870; x=1772667670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CK8Xw2Z8/jwhJKdKy0esOogFCKRH5zkiTBeIKoVGlM=;
        b=Ic4P6Fkf/OXgNQ7BDlUnM2oIkuJMigxtpE353Q9PHMHUy8KOdfb/1AhXq8PqsRxaSa
         m6syzRvsuaI1TgkDNs2grnAoEIj7bWPlrj4VWShTXl7iDrARPiMPoSqkpGqHNQED7SJq
         sjDbCi10DOaC+SHAoHd9Q4nCSS8RWBjp9qw6oz5NoO6dSD4QNeh2TJHWLpYw0ODvYnTn
         v+8wV7PBBRjogrV24GXaeu7V/xKAw+w/ubVwn7sNdvaxR1vkIGn3FaUkv9a/jCqto8SF
         Gpe4rhG8F06u8QkjdUIFYrSI6mk1aDROt2IVSF511yCdy54NqgTXDMOVGZ7X+hVAhKvE
         Tf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772062870; x=1772667670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CK8Xw2Z8/jwhJKdKy0esOogFCKRH5zkiTBeIKoVGlM=;
        b=pKfWotSkDW9k66XHZmCEX81e77r8ba601z/hRb74UwsVk7Ldg75O7dQhlmx/r0f8s8
         GjWZxesdkL7AK5Vzh065TeFhL93QV+TtHXab01zkCaeRgT0C+koiCvi1p7bKlHM0O73v
         1dd/mGizuMuUlGgp9gQ9jHjZyHpOUxhs5ibBE5Z0XE3InVZ6RhrfUZEYgxWTG93wpmhi
         Nha5VbDS88G/yiwhjyWIoiTd1fgFIfGLlXA852qan6AZJzdkREZjzcSzEFrbZ2PuZuZ8
         KNqr4VwVVqSZpZlg6uxbRO1uIOkKUYv7cACXwfrz8DF775MBWIF27Bp/C2GcoiXItLIJ
         v2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW8Z28YT1D9BiLXd6dFEwsR9N4+6gvOLRanhyNPwUuh0t4o7f/ifs6ZwIoZmwe2EiH21jm3twEDNVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzagfeS1wlowHUkhyQPpdYe5Vkw22dqanwDl1GQFriUf7Q6S8cs
	MgbZswUbcyzag3ZfK5Xh0WowiDPzUEhATDTkxo4cBzyVXoF+cZYh0whuRLKGGO6r7Q==
X-Gm-Gg: ATEYQzw23W1InbLPEAGsseivhnrLMHhjfCCkTDzL8I1yAtTVgmF0KYozB5vjAzvq1Vd
	dE1My/HWNb208Z2i1lCwzI6UFNgyO+0O5Phl0cLrworj5iV0nUCCbY9/0B3HUQMHGZzUN3iLSRP
	yo2Hry4nyes4awPER5auW3Pe3cPFOcxPD5OMinn4zziJBIbFC+jJFPtMj25mbbWoTjT7JyHTa/n
	wurLXOazdQIdEYn6UZSToOaosUWZghLDSwOdoY9jSO3JGbOzQ4TEiWRMk7ZjccM+WgN2T/eMtS1
	p0wkhIRXDxjXmofvpPceg3LEw02dmwsDjrGjf8Uhj8UO/cTsPqDBSdbEN8UwDFSQoG6OgWWIj8/
	QoJzyVDWw4wPTIAByi+6i04sUaoarYW+bflf6NCrdc2K2LGet3yJD1VEegr1TefdVxdpiFnc41V
	1nm4gKwoAojx+yrbmxGrcdnbaDgPgTc5hXqs6/BF6ZVuYRYhtrQmVOZSrGIAqlZA==
X-Received: by 2002:a17:902:cccf:b0:2a1:e19:ff0 with SMTP id d9443c01a7336-2ae035d235dmr1928845ad.39.1772062869584;
        Wed, 25 Feb 2026 15:41:09 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b5813sm3778175ad.63.2026.02.25.15.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:41:08 -0800 (PST)
Date: Wed, 25 Feb 2026 23:41:04 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>,
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
	Pranjal Shrivastava <praan@google.com>,
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
Subject: Re: [PATCH v2 05/22] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <aZ-IkNFOLJUff1hC@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-6-dmatlack@google.com>
 <20260225154124.78e18fa4@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225154124.78e18fa4@shazbot.org>

On 2026-02-25 03:41 PM, Alex Williamson wrote:
> On Thu, 29 Jan 2026 21:24:52 +0000 David Matlack <dmatlack@google.com> wrote:

> >  static bool vfio_pci_liveupdate_can_preserve(struct liveupdate_file_handler *handler,
> >  					     struct file *file)
> >  {
> > -	return false;
> > +	struct vfio_device_file *df = to_vfio_device_file(file);
> > +
> > +	if (!df)
> > +		return false;
> > +
> > +	/* Live Update support is limited to cdev files. */
> > +	if (df->group)
> > +		return false;
> > +
> > +	return df->device->ops == &vfio_pci_ops;
> >  }
> 
> Why can't we use vfio_device_cdev_opened() here and avoid all the new
> exposure in public headers?

I thought I explored using vfio_device_cdev_opened() but I can't
remember now why I went with df->group. Maybe there wasn't a good
reason. I'll switch to vfio_device_cdev_opened() in the next version.

> >  
> >  static int vfio_pci_liveupdate_preserve(struct liveupdate_file_op_args *args)
> >  {
> > -	return -EOPNOTSUPP;
> > +	struct vfio_device *device = vfio_device_from_file(args->file);
> > +	struct vfio_pci_core_device_ser *ser;
> > +	struct vfio_pci_core_device *vdev;
> > +	struct pci_dev *pdev;
> > +
> > +	vdev = container_of(device, struct vfio_pci_core_device, vdev);
> > +	pdev = vdev->pdev;
> > +
> > +	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
> > +		return -EINVAL;
> > +
> > +	if (vfio_pci_is_intel_display(pdev))
> > +		return -EINVAL;
> 
> Some comments describing what's missing, if these are TODO or DONTCARE
> would be useful.

Will do.

> > +static int vfio_pci_liveupdate_freeze(struct liveupdate_file_op_args *args)
> > +{
> > +	struct vfio_device *device = vfio_device_from_file(args->file);
> > +	struct vfio_pci_core_device *vdev;
> > +	struct pci_dev *pdev;
> > +	int ret;
> > +
> > +	vdev = container_of(device, struct vfio_pci_core_device, vdev);
> > +	pdev = vdev->pdev;
> > +
> > +	guard(mutex)(&device->dev_set->lock);
> > +
> > +	/*
> > +	 * Userspace must disable interrupts on the device prior to freeze so
> > +	 * that the device does not send any interrupts until new interrupt
> > +	 * handlers have been established by the next kernel.
> > +	 */
> > +	if (vdev->irq_type != VFIO_PCI_NUM_IRQS) {
> > +		pci_err(pdev, "Freeze failed! Interrupts are still enabled.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	pci_dev_lock(pdev);
> 
> device_lock() is a dangerous source of deadlocks, for instance how can
> we know the freeze isn't occurring with an outstanding driver unbind?

I can change this to a try-lock and return an error if taking the lock
fails. The freeze() callbacks are triggered by liveupdate_reboot() which
is called from kernel_kexec(). So returning an error to userspace is
possible.

My only concern is whether using try-lock would make kexec flaky, or if
it would only fail if userspace is misbehavior (e.g. unbinding drivers
while kexecing).

> > -static struct vfio_device *vfio_device_from_file(struct file *file)
> > -{
> > -	struct vfio_device_file *df = file->private_data;
> > -
> > -	if (file->f_op != &vfio_device_fops)
> > -		return NULL;
> > -	return df->device;
> > -}
> > +EXPORT_SYMBOL_GPL(vfio_device_fops);
> 
> Seems we just need to export vfio_device_from_file().  Thanks,

Will do.
