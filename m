Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA073C945A
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083003; cv=none; b=FwSRH96doIBIkj/v2O4O4tj+yL18mFd+kt+BAsQi4b2R63b9aenpw/qStTA4WC2Wr1Bt44sOwtBnArlLa2MJk/a+JKtFLaRI0yGT26AfqbxuzsWBW8D5XZEQFnPhoFlutPcxa/3DeeDAiWcxeoqpDEExsse/m/ZJoJyaqJanDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083003; c=relaxed/simple;
	bh=eh2uHeTUG5CmXS9cNmYuwq/yTrAZwmMBCh6xBgYyXpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNF4btMG3Z8N7wjVi9gYaKx+p79NPJW5trn78oxvOI+Sd9NZFHcrWHkfw80Xp2mI99EbqCCBJAfDj1zIZ3um1XtMUFkYvVfeuKida7jr4oae1uzQNszaj9SqP5EsojD11IetpOhC4e7hFT3HGeBucy2RUK1OpFh5m9urt2I7+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lqUZ28II; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lqUZ28II"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso26590475ad.3
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785083001; x=1785687801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=;
        b=lqUZ28II4mN+pz3ssfvM094CWZ4FCq/m18+CxzOWrVHqCPE9iUBpk+qG/vG+pjcVDf
         7iib6tASisd4sDH7uyNuyQBpUhL5c/yUbUPzIdhIebaTW1GuvlTmMrTuh/OP5JV6CnzB
         8GSxSRZwwHYtLYflc6/TktpgQG+UyEoISpYg5CDm8cJQFDWTgOonBG/mGbPQKlYN6yTY
         dtMgD7UxxRze5fLGSJ9SYEBBy5y6vpWrX5TUj6G3ygRhzif59JdvuxrhSkkBQjq8CqeU
         oy2dOhBd+lFt20IUkwpfE1NgfMljswoc0l6qZB4L2sxdTF/yypVVvZJRIByhWHWnuXxt
         9Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785083001; x=1785687801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=;
        b=k/1AmPQYDRx542w/1ZDWyq3QsTMD0RgMikSXUjCLmmOhqSky3y+TQfAjhdSnouKPx/
         NKsqWQCqMYPYLmAI9LYJcKsKZtczDTuUCWrFwfkb35T160sOGyQDu77ZoKwqkUUaPTM3
         ABb1KVPjys7cuh3xu0dVbBzTnBxhYC8n/3pxZQ8mCr3nyn6mgcyHwS3JPnoHF9UqyslY
         aH6kS05RwFrTJRvCJg8B3F1rJS5RX8RNA4tfsYz4RMd5zK222JDs1L4rHU6w0v5MLGzY
         TlaO012EF5tJRVKeni/cUxxMZvt6K0nM+AB8XD1LJKqYWJmWncrVML1MMr66iCJLqJ7P
         h9NQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfENeH++NOvsTA0t2kabf8T3sR6abAZUioqydJKBrBqh/ZF7t/8uOFxBSFxk+gnuxNsdP1awgT2zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdjHYvtjhY6osuabM2ckAmJosfhJ4MB9e5TGgYECERNL6/HZFh
	fqHoQLFn3vYj1/Y5wU/3za5xK6z2bFg+MrJfBpCuJ4N7rNQ1qwMDb2bRtbVKhipoBJ0=
X-Gm-Gg: AR+sD11GT2m4L7Tkg4WMv3XkGsCiEcjEp2+8Tx53TdlwGr3USRkMcRf7K2wyw7mzpI8
	aI+BrhC3zM0SsMimJKIee6g+bhKS6RkDlMWAbywz9YPmOaD7QL7hRSTCckGJgMhUu1RgIXPKpxp
	4cxwrKEoN4qHXj33/9JGdW+bQkbj/nqCETFLY4kmvC6zgvZfi6ZlBllGrngU6TgDQBlmyd5znu5
	z8vQFX2PJwQtKa3Oxrgtogzkw90nidZOHIKx+DdhS4jApDIakHWzYvcAS4toCmvJ0gsyslq9TDq
	ujlhh5vvgKyYiKLIeiIpNMcleFHmQWblZHeBRxtDt7D/h8blJZlvRLC6bCR4t5tQjO/e77mKEs7
	vNOkjL98Q+CzmKPglIMmnwFliq6gzkOyDrc5KMIWAL553vLO0j7c=
X-Received: by 2002:a17:903:124f:b0:2cf:7882:a444 with SMTP id d9443c01a7336-2cfde7bd3d6mr49402625ad.16.1785083001604;
        Sun, 26 Jul 2026 09:23:21 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm22177955ad.20.2026.07.26.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 09:23:21 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wo1dJ-0001U5-2C;
	Sun, 26 Jul 2026 13:23:21 -0300
Date: Sun, 26 Jul 2026 13:23:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 4/4] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <amY0edpcgNbqFQ7s@ziepe.ca>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-5-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-5-amhetre@nvidia.com>

On Sun, Jul 26, 2026 at 08:19:04AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMU is affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice, and
> that infrastructure is already in place behind
> arm_smmu_erratum_repeat_tlbi_cfgi_key.
> 
> Neither IDR nor IIDR flags this Tegra264-specific bug, so hardware
> detection is not possible. Tegra264 is device-tree-only (no ACPI/IORT
> support) and already has a dedicated "nvidia,tegra264-smmu" compatible,
> so DT-probe is the only viable detection path.
> 
> Enable the workaround on instances matching the existing
> "nvidia,tegra264-smmu" compatible by calling static_branch_enable() on
> arm_smmu_erratum_repeat_tlbi_cfgi_key. Document the erratum in
> Documentation/arch/arm64/silicon-errata.rst.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
