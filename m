Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3C245022
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373055; cv=none; b=eKORSbWHPqLagnr1s6OnTidDJIFcsanOTVZ9Tik4qwc1pJrzzlIkvzWsVzAlmqcrGF61mMZI9tSJ4RZgz7+dkYahOHGlVQ+pvGwo3a/kQHzNYYqxFPZoho02Wn9CfVz/FeGmMaRFPJ8luAE1TwaYBoPsvTe3rbfjpoNG4neg6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373055; c=relaxed/simple;
	bh=oNWtBTfARcQCwaHYGLs5aIj0PBvFVGGFyKJg1UjJTYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkpQos/j2UrX1NucFysQsINeQvRB6+lkNZOyAM+8O5YuO7AkCJ5aaQbjdSZHfchMzXYPFUeulpEe063pj4dQUWXSCRQEG22wdxTbENQsXHvkWUL7VKCM1+MEChSYapqUGxg4b3bTRzsxF2iPjp+HRyn2anVgkAFGi5Y/ybBy0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WKbn0Nnm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WKbn0Nnm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237f270513bso137285ad.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751373052; x=1751977852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=;
        b=WKbn0NnmgkzxUsdcaqhQqraPMyrURXHKnri5ElSn1Vkd6BoqcdJ+BpbWZHRjOlYZzm
         NbP4xOICMR07Egga4/fajji1H5YeNz8LkRGRQVi97jr8gxwK03VAeI/v76ao5vcEth2/
         I7qCPu1lO+z90lkSnZD9P1Bq2LYvwRcu+Jt8/iNmhfKNQf4oQTo7RZ3Ppc0QvlX3n31u
         zd5zLWVizh5Ixst6JzcJxBp8j0nExn9Cnhgd9KuYQIpBsfjHvJF50X+gLlRo7wpe4x+B
         iuwMl6EycXVvvzBFEXVjcmCHNaGj/of7MPz3Bvvxz7M7DeNs0ch+lolEIsPjbZaLjtJl
         YtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373052; x=1751977852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=;
        b=O8M+6jj5SpeyNWYI8pOwi0s3iszULOLL5vA3f3E0E1FTuTroDOtdWRBqn/2Up8Xsw3
         3rdEpZmVz8jEDlQsM3rs1JS4ovh1P3/iXQjjIUJ/Z1faCMgSzSQWA9foQAJc6dqBkj+p
         XJzoezcbVSDBvdBQp2pyFg0YjDb6PMJBJMnYfHwUZJEYVD7qWVi02ZGcH3s3TNNbq73R
         q9kgVzZCcKTaeta4w7GeUPj4WSG70g0f6YhfGIu90PRQKvAIN0uj1PJV/JZXuUu4FDwq
         vb/B9PsgQsuFU80E352KiiZvI4e+bt2/3/EArhQdD5//vj8nIYrCZCsX8N5ZBS37d0Ne
         Xi1w==
X-Forwarded-Encrypted: i=1; AJvYcCWTTfhFx9VaC7xo9RSgTGiC66+yvP2qEsQTr+2Y64O4lsiEBFvHOpaGy33ofd9sFYt+dXtdkT/n91g=@vger.kernel.org
X-Gm-Message-State: AOJu0YydoTyIMMWpu9J8bstXycpZoiuE3Els4qWJO6EFv6RJRTtPJ3VR
	K/naXIsvF8tZm61zjycoL0hSU7jjtoIVXBi3EIh73kgQVkgl9ykL0ueFwwpVEX0U1Q==
X-Gm-Gg: ASbGnctki7tKD3JBBRMk0D9tHOTIuyD7P3MDEV7A1d8kpFNomC8IBi4Sgqv7mOhNgBA
	LzQyU5eQguSNS91uT5px7jbGRkwRvcDekYqvM1HIOj2KAkM+pOgRjJ+jNIeBpkYxuqi3T9jmPSz
	s4C0QIH8fRWGtLdLl8c4I328Jpf/KFAOBFPBx3sBGgvQ9cIzzHgX31ZDubzm9j38YEUJ1xIDmiD
	/j9HDmGnw0kgooAe+8YN+IC+IEhmrPBkSpWTDzkrfmqc2v5t88HT2ZxQQj8s5EFuUKDRsnVkQGP
	SiZcaXdFTSIa5h+KFB1Q0rUMNA1yKBK7XKpvR8iAKVevYjQli0KWdq46adI6IgszhO3OFkPS+03
	XspOOXN8za+NQ6LIX8Pow
X-Google-Smtp-Source: AGHT+IGYS+ky70yGGbfgecWTu3WMn+4HvkqtKADO91HI0LqScQKuEGTHZn38lZjYqivfuwsxMW7HzQ==
X-Received: by 2002:a17:902:ce89:b0:235:f10a:ad0 with SMTP id d9443c01a7336-23c601a7645mr2227915ad.28.1751373051941;
        Tue, 01 Jul 2025 05:30:51 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da818sm9319671a12.61.2025.07.01.05.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:30:51 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:30:42 +0000
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
Subject: Re: [PATCH v7 02/28] iommufd/viommu: Explicitly define vdev->virt_id
Message-ID: <aGPU8qgfsa816eQ1@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>

On Thu, Jun 26, 2025 at 12:34:33PM -0700, Nicolin Chen wrote:
> The "id" is too genernal to get its meaning easily. Rename it explicitly to
> "virt_id" and update the kdocs for readability. No functional changes.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 7 ++++++-
>  drivers/iommu/iommufd/driver.c          | 2 +-
>  drivers/iommu/iommufd/viommu.c          | 4 ++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4f5e8cd99c96..09f895638f68 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -634,7 +634,12 @@ struct iommufd_vdevice {
>  	struct iommufd_object obj;
>  	struct iommufd_viommu *viommu;
>  	struct device *dev;
> -	u64 id; /* per-vIOMMU virtual ID */
> +
> +	/*
> +	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
> +	 * AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table
> +	 */
> +	u64 virt_id;
>  };
>  
>  #ifdef CONFIG_IOMMUFD_TEST
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index 2fee399a148e..887719016804 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -30,7 +30,7 @@ int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
>  	xa_lock(&viommu->vdevs);
>  	xa_for_each(&viommu->vdevs, index, vdev) {
>  		if (vdev->dev == dev) {
> -			*vdev_id = vdev->id;
> +			*vdev_id = vdev->virt_id;
>  			rc = 0;
>  			break;
>  		}
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 25ac08fbb52a..bc8796e6684e 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -111,7 +111,7 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
>  	struct iommufd_viommu *viommu = vdev->viommu;
>  
>  	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
> -	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
> +	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
>  	refcount_dec(&viommu->obj.users);
>  	put_device(vdev->dev);
>  }
> @@ -150,7 +150,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> -	vdev->id = virt_id;
> +	vdev->virt_id = virt_id;
>  	vdev->dev = idev->dev;
>  	get_device(idev->dev);
>  	vdev->viommu = viommu;

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 
