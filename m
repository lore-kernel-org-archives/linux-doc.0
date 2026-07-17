Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93F2F6560
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319583; cv=none; b=Ti9nHQKZF7uNenCmzlgCYOry9qd1mAZbw8yfb+1Coz8tpwgLC8bCRZOK2mK19OvjdSWM6eHTkGpkFmc/b2Uvs2aO61u7lXlSCdJecjum4rbugatFI5HgztQHnXZ8KUzAJ2zfOYM16mrmLsyrRh74sP1kG3yig/64Zpk88mkpT2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319583; c=relaxed/simple;
	bh=PbNViWUgj3WBUCT3/UpmOD/6P42BeZf6CSc/xOU4GB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vwl6SjzYy9pAJsc2oHFOpt7YVeUVHCEwiTWIStswLH0CrPvXDMhpPNSP70JFEke7C2fSdq6t/m0fNtRNXPjGyUT/45uuGiGknC31JtCjTp0r3lwDO3m4i9Z6F3AQtklSS9SqysHTzJ56+em5fDwteNd+swuZUtmh7UROIbCsoS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nxDCdeL7; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nxDCdeL7"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92f0b5ed131so447685585a.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784319579; x=1784924379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=;
        b=nxDCdeL7I7YfexVFnMm/ygiGxhax4KwIP07v1eSNxhQ9V87DIaidreAITQGVEv+1cf
         QeIxWppl+iQPMLfI22sc38VcegAWgvY40n45JfMm9AiUBh7EQ8n3pNA/S+Y7ZHs8cbLP
         UXJtfxomJUJzzMG4R2OtaMkETa4A5DKpXHAG4SsAZ3BbCkCt3KmxkLAY1FzhbPHy5wj5
         2jtmN3uQ6UZPtTS089gq8dyp2mM1XTi3cXQLvkskJWnsNcdhdirz/PkZ84pW55tbcbZQ
         Q1w+t/4dBcNGUhwzFMbV8iPZI6HpiLZMF5Gix1+a0MJ/hQg0t97Gh5XzKEzXPsfnldQ4
         17qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319579; x=1784924379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=;
        b=mXJ+7Ee+4VLuFHwDd2JlIWWJnRZrqjVmaGrDfRl7jmmHPuzlvgEdpsF+biqPZafYr1
         D2TR2Jbd/OsSEU34uTANmB2UWcXPOsAyeXRylmVfqEM0R2tn3o8FTxbXbmBqs0YwKrya
         IrZJP1AJh+6gQerwAskF/sf7vAJOqZiPNiSf+mkRpsZUkvuDJVYTzzequxCk2df+CLEZ
         Z5fwqITglqcjh77L2b01oy+bFfDrPq3N2IX5YtxWnhnFj+6PXjjf3tPh76IQGXNfxGMy
         T+Oe7pfvcxu+Ybk8iEvwXDhWlwU2aof4veN3s+yAUDN917pyV4IftjG2ilNscJHQ1en8
         sr6w==
X-Forwarded-Encrypted: i=1; AHgh+RqtRMprYdkALKxloyL0+fYxibXea/g9VP9Is88iZNSR9OtLj9+mT56e3wtdyRL/ipU4+R56Q09t/fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX13ENIJSdTkkydbPoR+4/1Mtc/toHkJIN1TgTHcuzFwNQM+tw
	Rx28axwXhe1JMilhJjyQDWZ9JcZObu11mdvupPD4ZPwv5e+sxyeKbNJPM/fe7lGaEMw=
X-Gm-Gg: AfdE7cmAK9YkG877RiP3a2O09nGHDGuRgNL2q8697FTlShaX4hxOxV9fMOkHiAjy7ID
	b3bj/jS+e8g+eDVV+QQphvGtbNeHTCkJIY8SFY4+mC0l1BT1C+T+Lp8pGAcHFBxwinJtYftS+fK
	guaJijmVydG6PQPPzkQ/4RsUdkeJayisIdflMPi89yygovEkSJphwNQ0zvr+RXRwlKBgH9pOD4A
	OO394rrvSFwHoDNrjfiTCIbprhb2FDrESPgAtYC3jf5faEzGMjHDSu8eO0VFMfKXwP1xBGpXWnw
	KiTX5/n2QouqOA3N3YlUFfhrar6lpg2Zrb2kaPR4/3D8V7BX9iVUAxzv/Nz41AmGJmHrPsIpxNY
	X5IWV/cSulhJYDNjmgMz4VLTL10XRWwufmWVAvYFW6W+esPlAWQ==
X-Received: by 2002:a05:620a:4588:b0:92e:e2a4:9d40 with SMTP id af79cd13be357-930b3f4547cmr452740585a.27.1784319578518;
        Fri, 17 Jul 2026 13:19:38 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542b300sm245589785a.26.2026.07.17.13.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:19:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkp20-000000052xd-3lLn;
	Fri, 17 Jul 2026 17:19:36 -0300
Date: Fri, 17 Jul 2026 17:19:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 3/3] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <20260717201936.GD701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-4-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-4-amhetre@nvidia.com>

On Tue, Jul 14, 2026 at 10:42:02AM +0000, Ashish Mhetre wrote:

> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5357,8 +5357,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  	if (of_dma_is_coherent(dev->of_node))
>  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>  
> -	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
>  		tegra_cmdqv_dt_probe(dev->of_node, smmu);
> +		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
> +	}

It is a bit of a big hammer to not have the per-instance FEAT but it
probably doesn't matter

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
