Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F435A395
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082990; cv=none; b=uBKs2xSG3VTzwnlAtcvQcqR2xiXTYBOAYZgVsTog054OKNUrHsqV+5VS+681uaXqRqV5CT4z3UK4cwu/2t55ng/Jp/iLh+VQeNeHhp6zyExYDwUUL4I1PdVS3ljDZ3LFtA4beWYsVveAJiS56RvojSFQKJGAMwciJkHsnaqNaQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082990; c=relaxed/simple;
	bh=dqXFXbXUVXKpMi3EZoVlEyKmreyknyy7Kt+mgq6gTXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma4vDTiayMQfqx7aL59i8VpkhgMKdpF/ipP9fpa5jXivFUTg90l2FSDKIQvfWxXN4dgvnN/Aozecsd4+CD4ZnSVVSes61kGxQ70ZPQv/PemcVQWzk1AQvDcA5P+5cv5VTDUn/MozSRz9jt7aVejKKbNgmZwUK7/DnT3FO60iFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Bak1hG+F; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Bak1hG+F"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so22310995ad.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785082988; x=1785687788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=;
        b=Bak1hG+FBrVx+Ne3PG5zQVLBoJwXtyk41mVwmpP4efjiO0ntUbke7Zup6sfGPSnt2v
         +UqEROtTQVxefwtDQmSoo3Ul8S8tEH7yiP9BRb8oy1pWPgUqnVVHrunTu/kQtymfgnoh
         hDZj9ttmWXNcXPgawPxKLhtRmZ2baiI8R+/JjZ5M4mEaJS3GNQc3D1IgzYto+3I0KS7S
         Pt5/mCqS7PiLXGKmmFxNfn59ZtiZkLflsLvn3nXxhQGz2ln+1lrBhPSrh2F1fYx0/IgO
         pF3vRCcmbuzMXGN9wUeEQFUVE7BvI6Z+ZTUNZFRRu8oe6PA4evqLWd1JjeWTpLXMUGfz
         YuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785082988; x=1785687788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=;
        b=JEkEIhreuFKyZ6Q0bDTg25WcUmH3dM86LR5/7+CEqhM/U+t1VoLlmxbJWezhcjSUNh
         Uj51L6EOu1Faa0TbUYKccV/MJoyeRUvRwuweX61vbcAAXfFH9lxziuEuhQbljcfVKCO7
         eTGeY6gNOYxiAOQeHCtiSQcAjF4pf4ewGoh+WpvLfOHbKhQPkVb15WPtUdCkO/zPUbz6
         Ffdwt80/2HqbiNH4hCgJaxH4MqRrqSw8W6TrtMAYATk4yDn0Uii3WEbgdw9srAC6Bhg9
         F8c9Ru+chmtRlFIpGl8RB0ucR5Ib+VLJiTKz86q/4i707j1WNJlHGhqaE21+WkZP/TeT
         9mIw==
X-Forwarded-Encrypted: i=1; AHgh+RpQxA1IcU1kI9FzfrNc++5w/Ja0TmNHb+VWncHBtmne0CYusrbqo1b7TQaR1fiUhughZ77NoRL8//w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqvbWs+UmKB42PZ/ViYrdLOnUroiTvaLDSCm0GOw/8/UwQzC4
	efzPuYyMnjGIW3bUK7oUw/9+9crdWs8POpTKL8FcB7l4gHhBEzLkuxSEqDPl8ATB+Cc=
X-Gm-Gg: AR+sD12zRd/udB5cO7UUF/PFSQSamjDfVOaZ62m9iabRKoNXWa7IWeGmCs2SmRwL5MV
	Az4N8eUY0z5r0zwkY5qdkTpHLSokrsKn0KHCMllpAKnDc1Np0k6kYuVQjT7WqTaGD1gs1XyH0Mc
	49d9ZV2Y3b3Vqr5UJ8qpxlhhKEO4vkmW9i/Ds2wb/lmM8UuXz8A1pnnjJsUuHmHPQRfYKF5vy6J
	o/Xv7amWtvjctKsUTqRs6y2TN6+7ohEJgaTF3SAUVSB0YrN3D038KZRemFeEFzhW8fgkaoVRScl
	cGNL1qRhajcx7YJez1NoTX7WLplXuI8HRO5BCGwwSKLHYsRD7X8BMKAY8N+wYEH5qPPCS1q8mee
	58HKJ//LNg1NX9wt2RYUaB+99olPNhOCTdcLeoGZnR+F5n0KWvyY=
X-Received: by 2002:a17:903:4687:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2cfde79058fmr52053305ad.1.1785082988138;
        Sun, 26 Jul 2026 09:23:08 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm21426485ad.77.2026.07.26.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 09:23:07 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wo1d5-0001Tl-8m;
	Sun, 26 Jul 2026 13:23:07 -0300
Date: Sun, 26 Jul 2026 13:23:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 3/4] iommu/arm-smmu-v3-iommufd: Report
 CFGI/TLBI-repeat erratum
Message-ID: <amY0azMCny2sHfX2@ziepe.ca>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-4-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-4-amhetre@nvidia.com>

On Sun, Jul 26, 2026 at 08:19:03AM +0000, Ashish Mhetre wrote:
> A guest with access to VCMDQ generates its own invalidation commands
> and must apply any invalidation errata before submitting them. If the
> host also repeats those commands, each affected invalidation is issued
> four times instead of twice.
> 
> Add IOMMU_HW_INFO_ARM_SMMUV3_ERRATA_REPEAT_TLBI_CFGI to report the
> CFGI/TLBI-repeat erratum to user space. This allows the VMM to expose
> the erratum to the guest or apply the workaround itself.
> 
> Use the raw __arm_smmu_cmdq_issue_cmdlist() helper for user-provided
> invalidations so the host does not apply the workaround a second time.
> Add arm_smmu_erratum_repeat_tlbi_cfgi() to query the static key when
> populating the SMMUv3 hardware information.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c |  7 +++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         |  7 ++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         |  1 +
>  include/uapi/linux/iommufd.h                        | 13 ++++++++++++-
>  4 files changed, 24 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
