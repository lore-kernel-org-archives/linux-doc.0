Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F126CE1D
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372666; cv=none; b=WEfTx6B/WDmK3ahxVkDwVXj1SZDPehQja1f6OOpL6RZvQzFS3GbNJXa0JhaekWSRtgGZ6phKzUT3RhQZ3rMkPpeWP/fZ2lqYLmMqjz1B4N5ziNnoxoCObY1Ft/QwGb4OmwhaIACuNhRjP3KCd7cHGBlvDmoXXRz42H4nDEn8NHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372666; c=relaxed/simple;
	bh=n8ZZkcIMTZ4oqwXL8cuzmbKEBEW4c7SvXxR443L664I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLOJSkEIEzL/8fIfvnmXvLC+sD4dNe/OnNcQui0LWKoVy/170fGsI6oGh1oOdnzLWbV3957cf1KMZ3GUPdegkJiIlN72LuDwfGdo8eLfZpZRDyKQNvNeUfPHVYHpvNV60v/k+i96AsirQSOdjmqMJSCMk8TKNqhLzv8VdjKJpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S3MMrcT5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S3MMrcT5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235e389599fso205145ad.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751372663; x=1751977463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7vYU5IpUGkedTKGsOw7fqDjAvdD4uWcycZwbigztzQ=;
        b=S3MMrcT5ZWO9uq4/Bajo9gsztQdWuZcpeR+2K87z4qLctuYNjN6NGdoWUJyLolBUdr
         7+WA5f/R1/UHwjdqr073f1fGge50hVU2PKZB88lfHu3iSgTre/FcFxjj7i5pKA/Wklc5
         ZL0km8NpTkRaI0ugS7ih3veW4sxzVvLuo7mXPRRtyD6dZeD5GivODa0Y6z+5Rlem9bjn
         uUxz8HltjWSy4PB8avVqsa9bw3K8z1DnjbBFn9dXOjmt246oeb+jh0qFdbfwRGUzC7Bb
         K+/SIUFWqg0UhLfWvxX3JJSRPFMnsx7SV9gM+4oKyem5X2g8y4lrCu9+8eJ2dqWU2nIu
         I3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372663; x=1751977463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7vYU5IpUGkedTKGsOw7fqDjAvdD4uWcycZwbigztzQ=;
        b=ti8uf+mFiitK+pz08dSAtRTcUWRgueG+AkwDkHduuC5gnIfNdWYUoh2RakeOEXQs8r
         IrFOqwgszkUyxA+uXoBiEO2Gbn93ErOEHZIGT29ldr++HBJbzj3bTn6nP4m82Y8A21BK
         UbI4A+GaXg93v5bgNRqOsvWsgX5rHa+cLrQiFb1XY9zOP53KUlwMFI4eFAGVVmLToZEj
         IpFewbbn7sPAPk1QpjM1SEoSHITCAx0suybZV4BuGyaax+b+svMmfZ1XUJx2YCycawab
         Qn6ANhAZtTHIKuWsCCqZyJj+zu66EH83sXMNl0d5eRMyiVLMC40GOAxI3GC7F5LGTeCw
         EGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKAr87GSh47cU92ovjA9HN/zLTdmfyO0Sb/ncLvD+9yY49MqIC08FkyVkUfNbFYs45yxz23YwUaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzxRb6dMWZnAawasnakC0txN9YuOSWy72TkDARfLRlJjI2iye+
	tKWYjeatuO7nYo3UvXV5ATDg79nKhLLsmYmw6jChzPyXK80hDHA/zahShc2IkX9bNg==
X-Gm-Gg: ASbGncszVNpBaeq4ThmkzZZSuWo6efaw95SfzsFeN8/o7yUa4LonoBc0az/i3Tk1JAe
	gc8EHB+Wn7LFLt53qtwd5fQx7va6+xgJA8+c42hQr1bMav3vPIrt8DbdIHCwnU32ItwVUT55PGX
	5T4Y03BbNuYU2dlLHrrNITVWzqnqF1jB9JJFSWuTmyQfJe8pIcgEUXQyp7Zt00QHe/mgWedsnsh
	s2+tUIiLM+Qdi4ymstORgk/YQW+mdGVuC9pDRYJUUVaqkatQD0XHdjEi44Ragw1w4qq/TbOgY12
	dAmnWynznVNmoTyhVUY9umzafaCWlTJmwyVt4eYu2ja0WI8Xm/9oFj5EQqSpMc1RnxX3nOApNeT
	qNwhXVB4E4Aai16S/ugh8
X-Google-Smtp-Source: AGHT+IH4JQ2MdaL4TQHuSEKzEVU+2Jy2z1P1pCYvzTGLNdSVTsldrYDv/hBtBO4QCMRhsGfAvLyPYg==
X-Received: by 2002:a17:902:e54e:b0:235:e1e4:efc4 with SMTP id d9443c01a7336-23c60105131mr2451315ad.14.1751372662789;
        Tue, 01 Jul 2025 05:24:22 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5437b40sm15776317a91.37.2025.07.01.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:24:21 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:24:07 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 23/28] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aGPTZ3uHRIIRMF4c@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <205f234c05d6b09de52124a72a6978b74d832cfb.1750966133.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <205f234c05d6b09de52124a72a6978b74d832cfb.1750966133.git.nicolinc@nvidia.com>

On Thu, Jun 26, 2025 at 12:34:54PM -0700, Nicolin Chen wrote:
> This will be used by Tegra241 CMDQV implementation to report a non-default
> HW info data.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 7 +++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 07589350b2a1..836d5556008e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -721,6 +721,13 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	/*
> +	 * An implementation should define its own type other than the default
> +	 * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> +	 * to return its own structure.
> +	 */
> +	void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length,
> +			 enum iommu_hw_info_type *type);

Thanks for adding the comment, this looks good.

>  	const size_t vsmmu_size;
>  	const enum iommu_viommu_type vsmmu_type;
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 2ab1c6cf4aac..1cf9646e776f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -11,13 +11,17 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
>  		       enum iommu_hw_info_type *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	const struct arm_smmu_impl_ops *impl_ops = master->smmu->impl_ops;
>  	struct iommu_hw_info_arm_smmuv3 *info;
>  	u32 __iomem *base_idr;
>  	unsigned int i;
>  
>  	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
> -	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
> +		if (!impl_ops || !impl_ops->hw_info)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		return impl_ops->hw_info(master->smmu, length, type);
> +	}
>  
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info)

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
