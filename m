Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5542288D2
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027753; cv=none; b=jlREBgaVO+4cTGPV1XFTbUUvwbAsEnS2LYgy7Fgfqx0JpcFs9C/TSRZ+urths8mxvHY3gZq5icvUiSAD0/VmnnUoMk1Hzqy2J/VEjbc+r7UcBcn+8NKgDWP+TDcjOde+pbsmsVSyg/rH191/UqnYz4q3CLO249ZGXI3VZNPqFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027753; c=relaxed/simple;
	bh=sBCQHBDcAUpG17ddyItmIuUCIWSKR3D3zFJjSYLtoVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQyrvv0p/pArBw649w6MankpkfQ0SwEWY5U5fziBteozEOE8w4lpmace/kKDYTFkpPZfNgAh/UYqLAk5+uHIJLl+Ip62MGbVX4M+/ORMohX2EfTl1eq0JAifD9PZjffme+zTxrtdBF9YZ2Q443d8vG6Wn3tUgjA0t3JTBoMUOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1QJa5vY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1QJa5vY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549b159c84cso1866486e87.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744027749; x=1744632549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=;
        b=O1QJa5vY6mTfmLs4ycXkNd6aOG9TDOigmEPs4fGrs6HMlbtovJIojTYeLGjotYTCEi
         Nu6iahUJ6uSbz3VOCihPxCibWBcX53WqJWABSHx51ja9uZWjhVGK6+c2s0Xf84/jo0TL
         sIeRlZwEVDfcRnGsdTgXbAu5wIYRW02VQofWNVlYgUYF6FGFvJhvX+ny1je2EkvMmMDK
         3k3b7uqj4/3izloAXQNSCGOrJnl5C3ximExbC/8fyjr8Nqn5qhZWy6YgwdiPPH4QXdRB
         NbqhoiRDg1WssFrf8I/vOaF897YXt9zSMnkgOYRqlCGfaF2uukSl0YqXO1xA2WFFmNgR
         v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027749; x=1744632549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=;
        b=A+ZoT7svyR9piIV3kFLAq99pl+wNwEpTIYxoIHFVAddCoHlIRA7CtdeUvycfzm6vId
         w6p6+oWaf7arJ1Vkd6C6YQc1fGh23G7AGpHvhGLNwt3uET2Hoc/Nb3rjEEXBKIE2Jutz
         8yNXBDT4WRFavRGPqf9t5HCZ/tZ4aN59c+7sdsqqVwB60nn4+P1VVRDgHwlM23xCwXyZ
         KoXTnFTfTggb8r/Ebdp4Eh+Wlif/Y4BM1g7ZIJwJCIkzeZrppfZtWdiESlRl/JKYBQN3
         IDTo9UsT96noyvRXlpeVLBDe3tSrTkGHhUcJzVRU0Jp8A5/nPWQ6ISKMFm4sWtuDNp6U
         joFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDfpTx1tTJJqU994dr0iXwbzxs5R3Kq+s7G/kW0mWCHcgrikPLYYaBASLrXtEe+FsqjNgrYYIWUrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDNCUEi068qT23ctsN0whISimcz/ev43PB7W0oK90qSuPOhMXQ
	2tNVNwcaZ9pYVA/uqxvQLSI0IWVlbKYcWaEc4U0/vMK1y1oREjStJ+bavms9yxagS9yldgvlmtq
	nFiSIKfhRSBU3soAzuEh8piIhK6EYy0XH3mtwig==
X-Gm-Gg: ASbGncv4/CUCxzuDbK5+ISNVBqhhnKZIhs2qqX+zRRFeBZ29+lBBrWA63w58zz9YWum
	MhWbeR4jVpHh5o+pxgCIeiRJhrJz/p9flXbuCx38Gf/0TS1WVwlTN9BT4qVqcYRE12AR/N6SDq7
	Z+epi32tLFENSuYCOsKpRbNw/r+A4eCUeZ3WywV0+EKQ==
X-Google-Smtp-Source: AGHT+IE7avfocEmD5lqNIyS63JcSTkkwf3BvTJpAGhR9l+oQoFSuLjrFiN2oMnoA2mOmJOAmlfiARgKB+FZMo6LuuCU=
X-Received: by 2002:a2e:bc1b:0:b0:308:f580:729e with SMTP id
 38308e7fff4ca-30f0a180dd0mr35506541fa.27.1744027749231; Mon, 07 Apr 2025
 05:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com> <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
In-Reply-To: <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 7 Apr 2025 20:08:57 +0800
X-Gm-Features: ATxdqUE-WE2mGG2qPqESoLiVUp7LnTlD7II4G1YhfYdYp1Eq06d5HdYvjf8h2-k
Message-ID: <CABQgh9Fuh2HdBH7pyAteawZBpa55ZzfR9dv2K4RF=Ps4yhREbw@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct arm_smmu_vmaster
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Nico

On Wed, 26 Feb 2025 at 01:35, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Since the vsid reader will be the eventq handler
> that already holds a streams_mutex, reuse that to fenche the vmaster too.
>
> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> or unset the master->vmaster point. Put these helpers inside the existing
> arm_smmu_attach_prepare/commit().
>
> For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---

>
> +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +                                   struct arm_smmu_nested_domain *nested_domain)
> +{
> +       struct arm_smmu_vmaster *vmaster;
> +       unsigned long vsid;
> +       int ret;
> +
> +       iommu_group_mutex_assert(state->master->dev);
> +
> +       /* Skip invalid vSTE */
> +       if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +               return 0;

Why this is removed in v9 and 6.15-rc1?

I tested 6.15-rc1 the qemu failed to boot with qemu branch:
for_iommufd_veventq-v8
"failed to attach the bypass pagetable"

After adding this "skip check" back, the qemu works again.

Do we need to add this back?

Thanks
