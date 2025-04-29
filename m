Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415A215040
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962582; cv=none; b=CTVcy4Jgapjf0vjZQvGY/dHug0c6s4yEVICueun9za9gzIBiy6Crj8zTHLp5xQQdXO9zLJOFZc42/lHkkE5oeZA/bdlmRum4lbwGXTCjJYj2CWMTc5htfkuLDn+eyuCORrV22Ykb1xN92uct+FppCx6+ssCZ8J5BEYKLJZm0+ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962582; c=relaxed/simple;
	bh=pjG0WRYPmuFXgp5l4sOIxBPQ0JCTtzB9fn/bSzP4aws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phXdd4iT58CNkCGW3DcrM+3psP6Pk7KYcKE+YhRYlxbP6ZlA5iveLmJgSQxJXwOGrjhaO/tIRyFJAGCpdY7QvIiR1w2WKa1XmNb+yDuQbE+hOKenuaL21FSIZ86xCOOizHGlGNV0kjNR1Fk5+Yq6vQCJEqhoD/DEReo8BSWFzQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h3WWJR3K; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h3WWJR3K"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2263428c8baso80825ad.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962580; x=1746567380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=;
        b=h3WWJR3KHXoQt4F4HvEAoj3cZePfCxVWD/1YrVTrrUx/6XLQ9Mj7T3CWXVaterMCIj
         o+f91xIgBixGEZC0C2r87PY8UA+jmJlZQW3xeRXM4TO5H96RLlP53C4ymC5tcnVJx/AK
         Z0YLKoHsCSfPw9vVkrM4v6TAQJSZDfAFSVOdTCNJiHJh8DJhbsmVYktXfPSzQ8FJKXeq
         tKglu6tzlyfieyouUrDXeUN5vwvw9kMuDkkesc4LD236DRTL2VF6s//yFAI5aWU69dj5
         cV6eg5KvtCKcF2F0k0dsiYHjKNMCS94HgphR5j7jqp7SYEBtP34vX5T0QrO13H9lZ4Ja
         6scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962580; x=1746567380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=;
        b=KnRni7SP3YKqpr0CuuQbDUR/kwKWGJsT0Dw8vtGc79MCnewomYXtFYVvWhDh7/oXzn
         VBSQM280ITqqUuk78HCdxu54CcUe/VDHpuVXdqE6+b999fMJKhBV8ogXwGeD2hh8NmeC
         lYDeEckz8HZBn9rpV3MSJxz51B1i/MjMq9cKPFxXTO/agJfpNxgC57KBi0puBU4HbVQb
         nn3LqRIlWb2NZAlsTYh4fIf7+TbbocQNSrUEN2Aozwp9+1AQE2CSkK7bTg8jYyc4qxal
         LstctT6yegCc7/R/TO10kbsz05CfMTDeC09yt/JJDZPpeCdaOcjW8wEZ/AGAp2syxddG
         7LZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXcaHr8u8CQSvrvZ46XfsVVtltPntdOwMVCzz0Y2ZXYlrWILYsvCosJkFGDDKOaPQVCtkJ4g72P4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIMXnTH5Do1txMnvifuPEu06TZgHahk7xjU5TbuGouadKiJ+N
	WxFaIT3fj5QJ0wmWwsXauqjzRNUzH1BYhv+F7niWKg7wBMpQwl3ZrPvUQQX73Q==
X-Gm-Gg: ASbGncubObicUn2uDIgAOOwmD6rqvIfkjMNd/7Yua4rSE7iuIaYXEqM5e1yROi9K1v5
	wuhiyWsNJHClG/yVkvRYgtB9OdtaxLlrz4l9noinjmHsTtljijTNnu+9HFhaGWRXRdwlM1MiU51
	6i07JyUuUiZbSGcl/IvE3GIr2EiE8DWo/ZWH8/NJxnS6LA0OmXUIxGxJgJRplAGbkWWY8nKGtj/
	fK1H9DNDKEh7mtw8xUPA/89puldW2Qhw5nl9FJutwIGVkm/JBcDvUo9k+lfW33EKUH8bMhILnIX
	oZH4lGkW9hSmTt+3uJtmX3rCzDpWfwWDPzoPpuK3JbDI9nxE20js15SIaDdv7O/YJ7JuroMd
X-Google-Smtp-Source: AGHT+IHMqNgjircjCmAkmKl5VbBskPIbU47nTYxADS2hK6tD9L6Ge4YAR4USLtbPpDWqfiuVVAQ0lQ==
X-Received: by 2002:a17:903:144f:b0:21f:3f5c:d24c with SMTP id d9443c01a7336-22df3dda537mr1044155ad.0.1745962580224;
        Tue, 29 Apr 2025 14:36:20 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76d34sm108297185ad.39.2025.04.29.14.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:36:19 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:36:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 16/22] iommu/arm-smmu-v3-iommufd: Add vsmmu_alloc impl
 op
Message-ID: <aBFGSRGcIsCDU1Zj@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <73b1fc34b07f2ac42d542dd996c7119ae5f8939c.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73b1fc34b07f2ac42d542dd996c7119ae5f8939c.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:11PM -0700, Nicolin Chen wrote:
> An impl driver might support its own vIOMMU object, as tegra241-cmdqv will
> add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.
> 
> Add a vsmmu_alloc op to give impl a try, upon failure fallback to standard
> vsmmu allocation for IOMMU_VIOMMU_TYPE_ARM_SMMUV3.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewd-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     |  6 ++++++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 17 +++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 6b8f0d20dac3..a5835af72417 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -16,6 +16,7 @@
>  #include <linux/sizes.h>
>  
>  struct arm_smmu_device;
> +struct arm_smmu_domain;
>  
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
> @@ -720,6 +721,11 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	struct arm_vsmmu *(*vsmmu_alloc)(
> +		struct arm_smmu_device *smmu,
> +		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
> +		unsigned int viommu_type,
> +		const struct iommu_user_data *user_data);
>  };
>  
>  /* An SMMUv3 instance */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 66855cae775e..a8a78131702d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -392,10 +392,7 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent);
> -	struct arm_vsmmu *vsmmu;
> -
> -	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	struct arm_vsmmu *vsmmu = ERR_PTR(-EOPNOTSUPP);
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
>  		return ERR_PTR(-EOPNOTSUPP);
> @@ -423,8 +420,16 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> -	vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> -				     &arm_vsmmu_ops);
> +	if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
> +		vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> +			master->smmu, s2_parent, ictx, viommu_type, user_data);
> +	if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
> +		if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		/* Fallback to standard SMMUv3 type if viommu_type matches */
> +		vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> +					     &arm_vsmmu_ops);
> +	}
>  	if (IS_ERR(vsmmu))
>  		return ERR_CAST(vsmmu);
>  
> -- 
> 2.43.0
> 
