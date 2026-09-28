Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2043A369D67
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621086; cv=none; b=FxttQDiNvsOB798H1XM7Vg4lLAzUxpQiFnwtBjYR05PAa3KusIBmhcQnSCTRccfoHaQurvIo84l5I6zUaUhVxRBmHD2E853oCdJHv83urFK3yElIxw+a4rRzyAyj6Z08VnUmCZLzMmoZDHZyEyIdOTiqDdrY9qS7pq92MFTLFJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621086; c=relaxed/simple;
	bh=fgZb1uyHuREpfJhcxIG+6xsb2Dd9OodLn5MW9pjjays=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qULkc2TFPbFWUruNvadDwmTdueMSsVVXpPV69RT2U45iTV95ejLivRG+jUcAYXdBPhyjPCzE/PUvxEgRCEwu8wVMJn/uLn7gwypSP37orerF1k894SJIjHToxEYFesXy03MdwTndigCzLxDq0+XlfW/agTk4hyZrEQLEI32jWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jq5lNO3P; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jq5lNO3P"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d3b445a84fso9855ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790621084; x=1791225884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGyq3NjAgVBa/imXLuFDsnsoYGS7geOe1+K5qFW3IBY=;
        b=Jq5lNO3PuzN2RsM8/d5VztfPcCsvtz2eAo7WrquXjx/xploELv4Dr4lKuiwQf+y/Vr
         0gnUnJtisfwVdAAKnfHNLa89PMWgW+D1D0nX/h2b54JoTX2nUsJ3Y+nFxI6NIG6TXH4l
         bk7U2xxhFJvqprERXEtkxrXIJRktuqxe8nV5fni87kCw+Bv0LvnjrOscv9sm9h116NZb
         xL/gmj98VtE7Qoc6NLTjHv73rnnXfbCfpkCyJPI+iU6wOaHdOkY2iMhLIBL2OfmQVWjE
         gbXxXQYl2BZSQ4ubfA4OKX5Z8EV9b++qhsdOz/kojdbJHW3/OcyYUfa7ayO92ppV5uwr
         ej7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621084; x=1791225884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGyq3NjAgVBa/imXLuFDsnsoYGS7geOe1+K5qFW3IBY=;
        b=G7PxNBaijVHjQ4Cbxt4h+1L40a0m6Fyme3yWzhk+xDc1gjOojokSg1qgq649UK5V9N
         0169gk419fy2I11fGpZ+3D7ilmVLsbbN6ll9R5VIL2s4jkkk8ROOdVyVUCgNJmcrujfA
         3svVq5wqGde1aeAxgJUZMKibjiCNBvLeUa3Sl+mCfLq19VpX8todqR0jzKlSlGEEklsB
         FgAd0to074efAl3YSKcaPCpwv9nF5114UjOIG02ewNXJzCINFIkIB9CHJH/sJ8cHhfQC
         arLMfIh9BwJ+CGasK5agzrqjq2KlUUw3Y9IjQFg6IzP/txrfb2sgIt0jVkgPsCwpdJKT
         lY2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlIj3vp0qG77n6eUBd3jaCvDIEFUai9cSab106aTqTstGt1O/f3lufL/++lkdLCw1LRBT/ixkzH20=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb6wrUJcVVKHLdSpwqJaVIHMl8A6z6UUpmR+3pMfjeRQihhRhU
	Iaa9KpKlkUJPxv7LEOXe9gsFk68hl9N+n1g8Qgn0YDdMZDaf2F50V4BIa3GzBxJBmQ==
X-Gm-Gg: AYBFou3dXxGGvJ4rR74WIRZnR0AfyXESWkiCmkFfgDLOU+hv73d9XacTaLl9PuiPZN1
	ekYbM7kyOLmfAsqu1J2OejBuHjXKoK6eSBjssbj2FvSaklazIloeZhhRUWecDps4KgvW/bMoAlG
	c7gmliAKeCZloVuL7vCtW65VYQyARpN4H9C8swf7OmD4W2ZhhA6HerPe3E2t2n3DhMqJcnNDKo+
	dOZO/r4XXqQ2aGW/xR67NDDxUIhCHdV5Iawm886ChDFY4FMUELkMxRmB61k3d6h64S8dc93TUXZ
	Ka4kiV0I2Js5w2Ld6YlR9soiHUcqVBipT23T/TQzmco5C00nb5gkgfZAtr9L4eRaFVHjGaFW09y
	XeFNqFGmqtnrQ+EwyV3MeE7/Byo3LKyD6J8DvlADY60KXQCImiApu+66et3LqzZnZePHr0m2zsv
	PnwuJQtT6UuzRKSZEG3PSBzjhXbRNiw7YfAN8O5zOjpT45U1EMKdXWkoc0OmhwfpMzD3mDKyg8F
	zEkGUeIoUP7b3fuacam5m+f2hRnuj5lg4hY
X-Received: by 2002:a17:903:3a8b:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2e2c600c613mr90615ad.8.1790621082290;
        Mon, 28 Sep 2026 11:44:42 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1910sm767152a91.14.2026.09.28.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:44:41 -0700 (PDT)
Date: Mon, 28 Sep 2026 18:44:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 9/9] iommu/arm-smmu-v3: Support the DS expansion of
 range invalidation SCALE
Message-ID: <arq1kpVwCUO8xrh2@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <9-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:17PM -0300, Jason Gunthorpe wrote:
> If DS is supported then SCALE can go up to 39. Compute a scale max that is
> compatible for the entire invs list.
> 
> Replace the has_range_inv in the invs list with a 0 range_inv_scale_max
> to mean range invalidation is unavailable.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

[...]
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1060,9 +1060,15 @@ static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
>  		invs->has_ats = true;
>  
>  	if (inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		invs->has_range_inv = true;
> +		unsigned int scale_max;
> +
>  		if (inv->smmu->options & ARM_SMMU_OPT_FULL_CONT_RANGE_INV)
>  			invs->has_full_cont_range_inv = true;
> +
> +		scale_max = (inv->smmu->features & ARM_SMMU_FEAT_DS) ? 39 : 31;
> +		if (!invs->range_inv_scale_max ||
> +		    scale_max < invs->range_inv_scale_max)
> +			invs->range_inv_scale_max = scale_max;

Nit: maybe a short comment here, e.g. "SCALE is 6 bits when
SMMU_IDR5.DS == 1, values above 39 are treated as 39 (H.a 4.4.1.1)"?

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
