Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A522171D
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326566; cv=none; b=HGWVYWQeSPXYQHJKNwQmErLGBqJnmkzCP4+MNLhpHwLC5wRdW+M2EiNSupWm3ksuegDYJlwjzJLpCRrjutD7+f9+AXp1lBFhGg+FmkjtHSzJQw/gsknEpKjOt0ruiwH5/y4Q8baeR/UHzq7MRfvUpeItkKx19R2NDRZkD0febfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326566; c=relaxed/simple;
	bh=3LkyeQl0t9LM+cj52xpO+Ax9lI0k6dCYkCdTOXS+hWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuADwsaMJpr5s/yu38QHx1A+I0mAx/GMI1BVt5iRJYS2qZ07E4cV8wxrMHKCWr4qYBt7r2HIbQfki09zz+WHeG/xw8O0RwilMfn+1TVtiInU9iKWRCGnkgOFdM49PrR00R+TKC1IC0gJotdkmgCdZSWmvBMLMsjsxjZtZXSWnmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQuxVCDT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQuxVCDT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2348ac8e0b4so111175ad.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750326562; x=1750931362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=;
        b=PQuxVCDTgWhORmrR+ZAqjQ151mrOTPmBYrhmS4vovM/Nv9PEbDz5t34HHCFxijI9mm
         AoMwwDmkKo7sRjAXRm+uY3T2oYCPYKgFcSinlh8ag8XezsLHtXaU4ROr172WILE2I2nh
         ojyGe5tOmRmNybjbv4b4fgAPKZmUyHZ+fdvxRxA3nV/IFiiChxuqEtta02niY+Yb5SFD
         gRXS7ufjGxEeqozweC/UNHMlOneORaNGmao7JGAXogXkL98bHE5d6d4UN1590tWvtyKy
         aK6+/3lGwzf5Rg3tqr3pSxypnkcKFixHGe6YdvqF0jl1c/IS71kwp+TGLb/j3tZoqcNV
         YQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326562; x=1750931362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=;
        b=cvnZU7tNakNfSvvIiIrVR1HInzkT/ahhiqxn/+h4scIzeYGAxEzRya4Qd0Dxvkk8eJ
         JDldj0tKHMSZnGLfXcwRUX1Yg71Ip8Cwaj+53Za6LLPZEj3xI3IS4h15gCAD0P71zKxr
         50BSodrgsap3o90cbhriS8B4BSRmgL+kZ7XWvUjHBJbfRqZp/PMXC3zef9JS3YgQNElP
         6vSpxKPHcFkVBVBlbyVcebn6LBjmrXu2dKuy+g2rijkGMfZWoUdxoFTNvoRdmwVwZx3V
         9oGtmC89+2fdDdXoy5JiwEnqSmcOoXUbialFQgSC1iSP3NgAyf4f4tP5Hwi6LmDiOgQK
         16Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXm9b4ef0nW5egYU5BlNW4h6jowqITkoGAUFuFIqnCx0foRBvkaXfmMZYBBMBq6/N+aLfVvCFJHq94=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrD9gb3pflJtNUZkgR/voyXeTJRk+PYGY71nabCaAj6FLrHt+D
	U68oWp6oALmC84bdy2PDpW3hX2dblEXw9OcBVRTicFn+N7fAy079b2iQoQZT42Z+hA==
X-Gm-Gg: ASbGncvsPLFFHJQFHRlWQPQL0I4Tith6u8s1FVdLpaMQBUzhxUzFnrYyS39ph/8OK2j
	jXkuAnKCAh8bpLvsLJmoJQmaRLTkD9wWomkbkri45x3xRUgjmaMNStnvqhdcDKIqKpB3uuyBO9o
	7xvohTUV15OQwGSaLAbYlnzos/CpG4yh4FOoqn9VcTOOFgNxb4ua1dsrrzmI9Vp471kBfa6gxg1
	DFJ0VNHAjPIlfKXm9KTjgQ3Eoi7VT7kaxXUWXvk7z/EgwYHFD5onJwltaHiBpjY7uQlj7S3sbkt
	YJMxmVqhP5wpsPpdu7zXzbfoKn46rJJvFp+DLyWjCd8wgxGiHEYuDjVS75zx0vQmlPS4At6hMQ4
	RERGYm/pmOMeh/IN6xxPg
X-Google-Smtp-Source: AGHT+IEuCYASVN8j1eZMJIcAvoBEAqstpKSSgGIYZ2iYQuSQhTyrI+a8+/330LWZVAAW9AYW4syqlA==
X-Received: by 2002:a17:902:fc46:b0:234:bcd0:3d6f with SMTP id d9443c01a7336-237cdfe9619mr1746815ad.1.1750326562236;
        Thu, 19 Jun 2025 02:49:22 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb04a6sm116435595ad.178.2025.06.19.02.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:49:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:49:10 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
Message-ID: <aFPdFnKvus57cGOU@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
 <20250616133719.GC1174925@nvidia.com>
 <aFDSNYOTToFSbFA2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDSNYOTToFSbFA2@nvidia.com>

On Mon, Jun 16, 2025 at 07:25:57PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:37:19AM -0300, Jason Gunthorpe wrote:
> > On Sat, Jun 14, 2025 at 12:14:32AM -0700, Nicolin Chen wrote:
> > > Now, access->ops can be NULL, to support an internal use case for the new
> > > HW queue object. Since an access object in this case will be allocated by
> > > an inernal iommufd object, the refcount on the ictx should be skipped, so
> > > as not to deadlock the release of the ictx as it would otherwise wait for
> > > the release of the access first during the release of the internal object
> > > that could wait for the release of ictx:
> > >     ictx --releases--> hw_queue --releases--> access
> > >       ^                                         |
> > >       |_________________releases________________v
> > > 
> > > Add a set of lightweight internal APIs to unlink access and ictx:
> > >     ictx --releases--> hw_queue --releases--> access
> > > 
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > >  drivers/iommu/iommufd/iommufd_private.h |  8 ++++
> > >  drivers/iommu/iommufd/device.c          | 59 +++++++++++++++++++++----
> > >  2 files changed, 58 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> > > index 4a375a8c9216..468717d5e5bc 100644
> > > --- a/drivers/iommu/iommufd/iommufd_private.h
> > > +++ b/drivers/iommu/iommufd/iommufd_private.h
> > > @@ -484,6 +484,14 @@ void iopt_remove_access(struct io_pagetable *iopt,
> > >  			struct iommufd_access *access, u32 iopt_access_list_id);
> > >  void iommufd_access_destroy_object(struct iommufd_object *obj);
> > >  
> > > +/* iommufd_access for internal use */
> > > +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx);
> > > +#define iommufd_access_destroy_internal(ictx, access) \
> > > +	iommufd_object_destroy_user(ictx, &(access)->obj)
> > 
> > Use a static inline please
> > 
> > > +int iommufd_access_attach_internal(struct iommufd_access *access,
> > > +				   struct iommufd_ioas *ioas);
> > > +#define iommufd_access_detach_internal(access) iommufd_access_detach(access)
> > 
> > 
> > >  struct iommufd_eventq {
> > >  	struct iommufd_object obj;
> > >  	struct iommufd_ctx *ictx;
> > > diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> > > index 9293722b9cff..ad33f1e41a24 100644
> > > --- a/drivers/iommu/iommufd/device.c
> > > +++ b/drivers/iommu/iommufd/device.c
> > > @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
> > >  	if (access->ioas)
> > >  		WARN_ON(iommufd_access_change_ioas(access, NULL));
> > >  	mutex_unlock(&access->ioas_lock);
> > > -	iommufd_ctx_put(access->ictx);
> > > +	if (access->ops)
> > > +		iommufd_ctx_put(access->ictx);
> > 
> > I was hoping we could null the ictx to signal internal? That didn't
> > work out?
> 
> access->ictx should be NULL for internal. It should have been:
> +	if (access->ictx)
> +		iommufd_ctx_put(access->ictx);
> 

Ohh sorry, just saw this. +1, I too believe this is better than relying
on access->ops being NULL.

> > I would at least add a comment here this is filtering internal that
> > doesn't have ictx. Maybe a little inline 'iommufd_access_is_internal'
> > is appropriate. We'll be sad down the road if we need ops for
> > internal.
> 
> Yea, an inline will be cleaner. Will add that.
> 

Ack.

Thanks,
Praan
