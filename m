Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184401C5F37
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 03:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390354; cv=none; b=fXRj04I7fBPVUzWnkr/lQhLmZn1G7aO8fJGziYB4PjpjY9M2seZJ4CuzOf+RF1D7d7HJzHrydEkqRj0hdfoshqeiWIINs6DGURVg1JO1LsH0vttGtAjg1O8KcSm9f3ractIPpQR14niC9W1IgkCpls4VE5sOal5i0H/Cl0X4QQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390354; c=relaxed/simple;
	bh=9Hg5pobEE7M3tPGS8XdU/oGbneOqIPiRWFR/3Cld4kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRObwhVv+Yjcf4PVpWcWtXzqNsp0LU02nZe4IMVze9/gYXanNJR2VwIfmTU1BU3jYSItiripEqkHcVTQpiEcJd9z3fIsIcvu0IsxiwuEnrihuF9s/XPJJ79KOSki2Mh0cNysv+ZSIPojR0F1qWEMa4FmZA5s1q4mLd8yQIVmH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AoGnXy/A; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AoGnXy/A"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2348ac8e0b4so228765ad.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 20:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750390352; x=1750995152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qa/VDd/mSdDHpuvSCZ3/ODd1JXeFiiam1MgWlPeSiGs=;
        b=AoGnXy/AZbTUnAiISuR6WY4TdSv0KCdP51xnuZwgl0WKBl6MsF3POltmch5BtyqMwO
         FwlVPQJz+ibakQaIKbNccY5TrGBl3L+vePiIWy8XJb/Pfs9N8JSIwi+7q7LeBAbiKm2N
         9edG8wsPF5uOalZI7FPS2HPwjGOuQE17a14pxzQA5tMWNmJjm5N+oTUGRW2cqzkh5yky
         yioB7FAaIZWH8SunlNbK2Nmv2X1NEK/BRNffTu+vRnS3OvCjNG5r5no4ZVm6L7G01Kl4
         SC7pKoxN/abeH/BFqZy8KsNjgNGRqpoKxTQR1K5soXhxQilNZttiYWcqvKekWfUx/nyq
         hnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750390352; x=1750995152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/VDd/mSdDHpuvSCZ3/ODd1JXeFiiam1MgWlPeSiGs=;
        b=WwdBzAlo5EbJhoqrNmVqXJw2piDov3RkHwroD7/ve+AYvTmTWH5fJ3eXuxvdmKuibZ
         qvk5LeHGsn84ZqzRpz5IjTI6cmK41lUX3DoUvHifjN6AyFwnO8FVz/RTMwMaM3BhYSkE
         WpfmVtEn/l99BbLIzwQwg7kQJ3FpQGd1h4KVPbKUPuJhU68RwCO3jA/nxE5F/OlBbSR+
         UPmvYbW59+LUc2nTQzpXEMXyHlp9YPE+BavUtm7olCfbZvR53/5pEMgJmP5lkJT2SRsw
         g6GujjSz0LiSRtqnfSguiYEYy+e5GjS0RC0rusVGq8g5L/oHEkKWHmCjItSduB0se+Pq
         WO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgdsixSK1o47dw8lLcN+VJZN4lTyZpoWnfi8RIadp5WU+irEQNosEY4isgBeN0z5kCIj9Otid4/r8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXM7MiJw4GOhhJtyB2G2GdmZbLPW0ssivV6Y4lb1p/Q4z2kUwW
	VwryAWi/QETQcuKhsp9QQhykivdz/hdfvLkAAFUXqxNjTEEPiu8IWUA6P+X7KN8aZw==
X-Gm-Gg: ASbGncthkYsCzTUCGCCH2/Pomsqp2uHwdKfiBjVpGHL+ucODKpiTrYK5QXgkOqV9LAD
	ixLKtXPFFPGUDOOjUAkEHP4ESe9qTf2qwMRXL3Q6O1YhE1NEW4uZJ6TQxX60d3dbaCNQUcC3jRt
	fd/MuXVkUTwazqSU/yQHcoWlOGgXUbQBcGQs0+HaG9vLPhVTUl3fDjV8IknU2tK9pLN2Waoduel
	9wwmnxPp70fJEZOf7Lhw7aYqvqjtvzx9ufYEH2hKUJyOHN3OFAuqHOKFHNmMXJoO7s/HU+ji1pk
	j/Bqo1tpkNt9QqMUUK7x0d8HxtaioSh5+phln/XLh2vohzeZtA4085QjIrBLSTfiUYx9kW9IHk1
	fWEHRBhYeJFrBHIH6hJhSAQgC7XqQMFc=
X-Google-Smtp-Source: AGHT+IERsl+HTUr1rqxITuYHKylDMvSd/CxPtRuNjbrAMl+KyO4xPzytclG3wi1xtC95QCov1vt9OA==
X-Received: by 2002:a17:903:1667:b0:215:f0c6:4dbf with SMTP id d9443c01a7336-237cc9fd3d7mr4672645ad.14.1750390351828;
        Thu, 19 Jun 2025 20:32:31 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ce860sm6966175ad.65.2025.06.19.20.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:32:31 -0700 (PDT)
Date: Fri, 20 Jun 2025 03:32:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFTWQ4v6aZABpzeV@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619185325.GB17127@nvidia.com>

On Thu, Jun 19, 2025 at 03:53:25PM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 19, 2025 at 11:47:24AM +0000, Pranjal Shrivastava wrote:
> > I'm not sure if I get this right.. if the user (while porting a VMM or
> > something) mistakenly passes *type == IOMMU_HW_INFO_TYPE_INTEL_VTD here,
> > they'll get impl-specific info?
> 
> It should call the impl hw_info which should fail?
> 
> +static void *tegra241_cmdqv_hw_info(struct arm_smmu_device *smmu, u32 *length,
> +				    u32 *type)
> +{
> +	if (*type != IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV)
> +		return ERR_PTR(-EOPNOTSUPP);
> 
> If impl ops is null/etc then it fails:
> 
> +             if (!impl_ops || !impl_ops->hw_info)
> +                     return ERR_PTR(-EOPNOTSUPP);
> 
> Where does IOMMU_HW_INFO_TYPE_INTEL_VTD return something?
> 

I mean, the check in the driver (for e.g. arm-smmu-v3) is:

 if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
     *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3)

     // call impl_ops

My point is that in-case someone passed INTEL_VTD type, we would end up
calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
the type to return -EOPNOTSUPP. Either we should clearly mention that
each impl_op implementing hw_info *must* add another type and check for
it OR we could have sub-types for implementations extending a main type
somehow?


> > I agree in that case the impl-specific
> > driver needs to check the type, but shouldn't we simply return from here
> > itself if the type isn't arm-smmu-v3?
> 
> Then how do you return IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV?
> 

The current version is just fine with a doc string mentioning type
checks within impl_ops->hw_info OR we could have sub-types for
implementations extending some architectural IOMMU. 

I'm just trying to avoid weird bug reports in the future because some
impl didn't check for their type.

> Jason

Thanks
Praan
