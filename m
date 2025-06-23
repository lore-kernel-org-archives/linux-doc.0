Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69728313B
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691647; cv=none; b=GRsZETRJ0ot/3VZRSW4XQevmTOZqfHGnhINV7KMRhmm1qrJv4PNB+t0pC0ZmQxbin99544bj7jvflIJ4incIJ4+Vu32aOpX0hLlEkIOYLe1qmaGBwUGmLWaDoj3NbGpwf+ejE1yqC4ZmK7v1wYfoA10lLPLZA8YPlcBU+81+IdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691647; c=relaxed/simple;
	bh=T97FIRu7KTdXAKAuE2uiR/N85Qp0pQvg5x4paRRjBE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd/I6XI7MpSnlSmruRxVlWWPkgmMUN9tZLXWj31YCecq4xm3bjaxwCAIzRHaNXn+3PgM/+fyXna4zI7HsKBeqFmy49/agjxnyb2/MBJZAeCDYZRZcR4eq8sfyLnLLEfSkYg9Kf6fMqPfj+4uiAv685Jo64S230MZPxs2ymaTQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKkhY7Ta; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKkhY7Ta"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235e389599fso345305ad.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750691644; x=1751296444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=VKkhY7Ta928BptYCHJVYvcLh5d5S42bzKA+iRJ+oEn0vaAOt9h0TsdKx0TVjsG5sH4
         Z4q93H89iMYgYf0aYTsAgCNfxEn9VdxmzIGv5nStyrSyPIKbxJo9juXqmMMNq7ECHFDx
         B8JomsblSvNpl/fEvJo6R4/YPa9gv3aZKDa1EMjVHvRE+O9+BIZhlH/xK/wIzNWS/YSZ
         u5O5ucng1O3F0A9odAfGrmPgdSFcRgmoE3vaSf9skQt3uezUoJ5cU1m8WFQM9WRytk3B
         +hYacxGBwtbMioE5B0mmYlJdkMqV/80MQguGEMxtequZg9ItcVJDvF+AGxR7FFvPz+ij
         jIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691644; x=1751296444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=NMzXGmKPI7WXu0aWcHjFgV/EJOQc2LxwnrVlIJHLRC3+A+TXp4u82WokeRZOEzDj4r
         DXxkKXrkxfXIizRhSBBMGPspe+qi14518qFgo5XQN3RFkStsraIJVO5jmfidlaxs7Bwp
         G7oICaiR/+Ds66EAp9JKYY9dpOfKmbnvoOhhinp6HpU+MAIJ7JIeidftOo73vpiyU3FK
         My6HaTbzp7qqTNCkCKfFJeesFzvhiS3NM3pnko6m0oj+WeEodLdFkUvxz+Zk9iL2LinZ
         NQC2kQ3CLED9iV97utVbTqLRUnJ2OGLIqLounBGBktonmNmx1Regd5NYrV1wmRow9mAH
         eH5g==
X-Forwarded-Encrypted: i=1; AJvYcCVDqRtYFKrBhtZbb5n8v7B75CmKlRxIGR2X/R32gE7MqPH2HNCKFkz8TXjI4ZPI4c+SrimWgC8pa5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKy+sbur1mATC9tUlZZzO8SRhl1fLZc1+Uma2gUImHImYUuQI
	OfDqw4dJPCKc9Ns2fEzuWQUIYtqF0HcfYpY04PjrPpdKga+hbqouGTm5242cu0b0rw==
X-Gm-Gg: ASbGncssIlrBr7+2a+hro7PXl1kTMMFYGuJVD67ghE4qVfVZ9U1nmAsOZs8srg+bOfY
	IndBhWBkQxYYhSm+NKCtqTPq3ks8GUUle4UuYOt8EIH1z5gXSnxrTdZ6hnaQoRcefxk8JdQCxrd
	IBo52GhaBJidmTP4dntCnfKGW+Vt/Dd59TPHJfxV3x7LDMsoRTA7QPM59FKZnjqoQguZIJpthjg
	acmWuNa9nhnyD+lZBdokqOlVW8VQRp2azn1EVgVRQ1XcX1A49wNaKhJwmKzFLASAlW6ReW+ymaW
	4eVXvr4Jo7iHQ13hS13beFfyB46rpf5O9ho/3cTCwKyQ8d5JUFDyOhtzvGrCbe3MZDM1BMVeu8J
	qjwIH6teT1yp4UyOD/fUcq9dxd/lh7Qg=
X-Google-Smtp-Source: AGHT+IFjZuHSmjWz3mlyiiORGjulfaekm2TrngIFHZiE0ZqJkNGQDEFi3n1LBmgMIlW05C9z3Da4aQ==
X-Received: by 2002:a17:902:e951:b0:224:6c8:8d84 with SMTP id d9443c01a7336-237e478a96fmr4808555ad.4.1750691643222;
        Mon, 23 Jun 2025 08:14:03 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6fbsm11004566a91.14.2025.06.23.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:13:51 +0000
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
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFlvLw0SHgYiA614@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
 <aFTWQ4v6aZABpzeV@google.com>
 <aFZE+MhTOCvbkKbH@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFZE+MhTOCvbkKbH@nvidia.com>

On Fri, Jun 20, 2025 at 10:36:56PM -0700, Nicolin Chen wrote:
> On Fri, Jun 20, 2025 at 03:32:19AM +0000, Pranjal Shrivastava wrote:
> > My point is that in-case someone passed INTEL_VTD type, we would end up
> > calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
> > the type to return -EOPNOTSUPP. Either we should clearly mention that
> > each impl_op implementing hw_info *must* add another type and check for
> > it
> 
> Let's add this:
> 
> @@ -721,6 +721,11 @@ struct arm_smmu_impl_ops {
>         int (*init_structures)(struct arm_smmu_device *smmu);
>         struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>                 struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +       /*
> +        * An implementation should define its own type other than the default
> +        * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> +        * to return its own structure.
> +        */
>         void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
>         const size_t vsmmu_size;
>         const enum iommu_viommu_type vsmmu_type;
> 
> And I found that we could have another patch changing "u32 *type"
> to "enum iommufd_hw_info_flags *type" to avoid some duplications
> in the kdocs.
> 

Yea, that sounds good. Thanks!

> Thanks
> Nicolin
