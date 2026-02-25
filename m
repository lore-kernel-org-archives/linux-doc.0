Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186721A453
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772008695; cv=none; b=QDzqPQ9NC1cenMj6Sn+9ViE4ol6l5mexPcI8lstaL+ODrMRkVka/M9WSmOgZsfJ/R+XDxD9UI0ZDZj2XSPRZgMGEr5aMx4neT1bjv7nDW4sEXJvhoU3/mGvsrwOMhKSwpC+Y1yhqnH0OYv8z2WKVA4avYgrmdDV3Xldb5gBRObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772008695; c=relaxed/simple;
	bh=uun3Vk7JQyHZ6aF3HcHlMyo2Xah/fKCgQ3PDPCYVA6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4NRvyMy76s1xVR+nuapdTsGAzM8SGYlNrYKUHMDwbf+EIl7DJvN/zV+PGnXiVuQBgrbPwr5qpF1EgRYK0REKUwymc8l/a+hEZSVRQch2ufpHrIUrBI+aNL3TKrt/OgMpCYacHSo7Mfm7pCQP+9dF9hRS7hwOIZr86mGO44hdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0d5FCoRU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0d5FCoRU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a964077671so74215ad.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 00:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772008694; x=1772613494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=euz76pxATmJYev+UEaMjSj8YYGXQ5aYbA3uegrgN/Es=;
        b=0d5FCoRUjPdyGC+3ksFgWishHadW5IYorl8tK66VBPAKn65KnWAsC3NPOrquJQkA81
         AmYi7hY9aounpoXHRaBlwCPDfCmKfSaSVVsvYPqD2UDk9Q+f2FOEHEXhw/y3C7NgDpZT
         ehjNGj2mO+fmCkRyjd2uwFq5vMDmzU5taYk/yEsG6Rm6insqmfMw/LdXhnjnPNzSipRh
         8iATFyj2niKIRoRNz3lBjsw9KddROojWASSL8+sqsolFSBw4Y/Z/eEZya8Jv38nrKDLD
         sOTnLmK/Mn5mIH1XKu40CWQDRiNqtV983z8rMk1QkMKeeTMamQCIW7hOlr+QqWYsz0Qz
         zp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772008694; x=1772613494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euz76pxATmJYev+UEaMjSj8YYGXQ5aYbA3uegrgN/Es=;
        b=Ljq4lf+KG8AyBLEBlCfKSMrMa7V6Mj9GkFms9zSHpwoEgN85U0wLtNLhcCWHrYz2qe
         O280mZBgVX/ZLAnAOuTY1gfbIErcmRmD7cjwQLUdjELoynuQHTJX/DQLdNdS/VvuylAx
         KHGxOYdZ6kpjayIpaqDULBVVr+7YRUCinqS5nMAQ/fvME53L9sQm0LaLYJQB7HHRIIYb
         G7QF5QCNZnHr7sizImcBRnxyOtN349rGlttznmfM/xohRmA/HUhsJTEnRBwW3aZcRrtH
         vPGQdpyAxkg1x1Eij/6dNhOo3ne/jgp8+rxEyIL7wIKvAGG1aecAVay3BawhRe96ZVV+
         Bm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXngT7k8QqVSI5HO3y4Snx8aXcovEkXM8SAJezE2/MrmqzRTxlCPGNZ+zBF5YhJkoBc56P3/gQZWTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbb/uvbxVayDN7WoW2fJ9mG+mgJUDesiNFT4zP6fmpPJBz8s3K
	pwkHNn0JGl7I4ZY1pIyrKa464gMA+ef/HWU8VW81zhq9wHvwImfAnonp9mXnl+11Qg==
X-Gm-Gg: ATEYQzxIVEGd2VlZUcDec/X+r+3qsMWZg5Infk6eMri6IN2mVq/drMqU+5o3qf5nM3k
	khlF4h44sMlI+j7rbPzU4K7fYww8l41pUbXWyQsha2H0oTT4VoAkQMM/AuuNdA2X0mfQ6bzW7TA
	ZTN2B4nHySnLOcBxNCzhjP70yPj3wOJnHHQ2AvPcQRpRcvztgqYsvWU1EtgEkYsHwCjaivf8fH/
	L3c8X3OUPtIrT5ZzYx+ek25+HVqIwyVKGw2JwMKKmDCy2gNi7yUvkXyvv9VlkOQ4TeOFK79gNtH
	klf3s8huS6VsY7dJr24KHmvTYO40kJD2xcW8zd0MffwLjXB+fhEmDO8J5e+lwjdpINXYpL5Ttpa
	OMkft6ApQm2xPZKDPT4khzkK2MczWLiMG5WeMUeIo1nvNdeqgP7GcqyY5D5Da64ZhKsOx/OFMQ8
	1GTdnWxyrFaUW3NehasOJBhTmyizzKZAaRglmPmQ97cLWUh7MLV7klvMitF662
X-Received: by 2002:a17:902:ea02:b0:291:6858:ee60 with SMTP id d9443c01a7336-2adca6c8a9fmr1402215ad.4.1772008693092;
        Wed, 25 Feb 2026 00:38:13 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd6c30dfsm13034861b3a.27.2026.02.25.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:38:12 -0800 (PST)
Date: Wed, 25 Feb 2026 08:38:02 +0000
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
Subject: Re: [PATCH v2 09/22] vfio/pci: Store incoming Live Update state in
 struct vfio_pci_core_device
Message-ID: <aZ606sDJxtfNF6qW@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-10-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-10-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:56PM +0000, David Matlack wrote:
> Stash a pointer to a device's incoming Live Updated state in struct
> vfio_pci_core_device. This will enable subsequent commits to use the
> preserved state when initializing the device.
> 
> To enable VFIO to safely access this pointer during device enablement,
> require that the device is fully enabled before returning true from
> can_finish(). This is synchronized by vfio_pci_core.c setting
> vdev->liveupdate_incoming_state to NULL under dev_set lock once it's
> done using it.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c       |  2 +-
>  drivers/vfio/pci/vfio_pci_liveupdate.c | 17 ++++++++++++++++-
>  include/linux/vfio_pci_core.h          |  1 +
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 3a11e6f450f7..b01b94d81e28 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -569,7 +569,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
>  	if (!vfio_vga_disabled() && vfio_pci_is_vga(pdev))
>  		vdev->has_vga = true;
>  
> -
> +	vdev->liveupdate_incoming_state = NULL;
>  	return 0;
>  
>  out_free_zdev:
> diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> index ad915352303f..1ad7379c70c4 100644
> --- a/drivers/vfio/pci/vfio_pci_liveupdate.c
> +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> @@ -131,6 +131,7 @@ static int match_device(struct device *dev, const void *arg)
>  static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
>  {
>  	struct vfio_pci_core_device_ser *ser;
> +	struct vfio_pci_core_device *vdev;
>  	struct vfio_device *device;
>  	struct file *file;
>  	int ret;
> @@ -160,6 +161,9 @@ static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
>  		goto out;
>  	}
>  
> +	vdev = container_of(device, struct vfio_pci_core_device, vdev);
> +	vdev->liveupdate_incoming_state = ser;
> +
>  	args->file = file;
>  
>  out:
> @@ -171,7 +175,18 @@ static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *args)
>  
>  static bool vfio_pci_liveupdate_can_finish(struct liveupdate_file_op_args *args)
>  {
> -	return args->retrieved;
> +	struct vfio_pci_core_device *vdev;
> +	struct vfio_device *device;
> +
> +	if (!args->retrieved)
> +		return false;
> +
> +	device = vfio_device_from_file(args->file);
> +	vdev = container_of(device, struct vfio_pci_core_device, vdev);
> +
> +	/* Check that vdev->liveupdate_incoming_state is no longer in use. */
> +	guard(mutex)(&device->dev_set->lock);
> +	return !vdev->liveupdate_incoming_state;

Since we set this to NULL in the success path of vfio_pci_core_enable()
I'm wondering if a failure in vfio_pci_core_enable could cause a
resource leak? Because vfio_pci_liveupdate_can_finish() returns false
as long as that pointer is valid, a single device failure will 
perpetually block the LIVEUPDATE_SESSION_FINISH IOCTL for the entire 
session preventing the LUO from reclaiming KHO memory.

Shall we also set vdev->liveupdate_incoming_state = NULL on the error
paths of vfio_pci_core_enable() ?

Thanks,
Praan
