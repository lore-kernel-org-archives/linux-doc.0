Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218E4AA03F
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595315; cv=none; b=WOSVzhkbbSK7ymkKvj7ktBAEB3KbEUbp2Lq4yVCwulEbtjFLZDpJEJ/F8LQGQpL0WlkImnquM5ge8tRst6cUZ1IpYfmkA1YkFNul0z8AtU1cgoTwDPdGNaYmw7vjTQgB75eUfJdQMk/GKy9/tK3zazEolLJjkKjEF059OT046Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595315; c=relaxed/simple;
	bh=Sgb/qwXpmQngxdKfzdWp2Tw8ZOcFCpzKxu2JQCTmjco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOw/ZWtC7yq7LdrqAWeOqDY/e3v+kpCQLlv+wyQmtH6dQvM8p1xkNRSSdgUAGCauMpt+vXUTzYJkLyH1htmzcNmjP336GwCTfcD5BwsrSfT3QaQvSlcURUmd2iZGpa6CMjFk8A7WSO5q3v+nRxM5Y6biFFHklN1kTEo+6zmS6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s2Xn6PR+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s2Xn6PR+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8facae850so80175ad.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790595313; x=1791200113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHgrG2jneIj+c6tmDkqbazBsM333la4Thr0x2hp0ezw=;
        b=s2Xn6PR+LfOz+VHrSZQjMdDjbiF9xnMzU2Y2jA4QhLaXZUoy4aFebjqD3TWnAy9MIV
         MVFVEV4JuQCgfsEXJ9j4nETehHwis//bWh7oi/mWwO8zamtpJQPM9k/jDmGxIsiSA2UA
         VY0Fu9DzFJoINm9YSz3mYI1af4GcUdXBUANSC17M0VuNXLOlb+9En7vxj0oV7DIA2bf3
         5xweqhWvBh5/sP/yPm69RU62x1CeFQ8qnSHxZr28Obq+98hxqlh5kF/dYX4sLXAkutG0
         ikr8cAjjf8sWyZoKKxJwam7cSL5FQ17GDg1HEl4ftFTPutfz9lrFpueV+WhM3ea73Ny6
         Zlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595313; x=1791200113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHgrG2jneIj+c6tmDkqbazBsM333la4Thr0x2hp0ezw=;
        b=YVEQu0GT49t8vZS7hKN2NhSUPc0yTRziQCGkL4nFcCgO7Pv2qYxoQIQdt4heKSJE9h
         PI49iT6O+sN0HN6z3oatE41LIIEczjHAWhNN5/bz2C35Q3Aj0XUDhlTOWywzqssWE2RF
         vue1CVqiK/ZW3V66EVZB9/e5BJnbEGtmOljmE6K1FAWJPn+qKLgAgVxye1ica3+C9Caq
         nTfE7evzjUesCfxBg39ACW/PTSvz9OgimF9fyWNTQeAuMCsgIF5Qk8ZGYPr+7FR4X/NR
         8knQJbzSacyWWMAFuCKgVZ+4imcioAWFe18Nc6CdsjQyhLF650PehHo2r3IrWAgsIORb
         pRtw==
X-Forwarded-Encrypted: i=1; AKwUvBxbnkOsFds8Y53Z8I0zbMqKDjbQcmt/IjS82QMEr9dxCKiWwP+Ef1i+AFSNlG5ud6g9yTqsXl8e+I4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdLfusEZxAScVj0ThNEZ23Qf5taSMia1fIqOba5+D9P6MFZA8l
	S4AL1gyzh1fX4rCxOUUUluZoMzAysEJemAkeQByugxce34C9cusV6cYtoRi4K4R3gQ==
X-Gm-Gg: AYBFou0Rg4zyoxOhBMuUDX7PXQxQ/zYNy01kIGYm9m9PeV+RsNLyN+3RUDpfILJkf9E
	NVFe9RT2elwu7yTLNbpmggAII3dQEYLguznFbcd/xvY8qADvo8qrUWuTM1bT89tR3EkiF8OhABl
	JkpuFq3DT1Qvv5tyGNX5u7vjTuaxlmpQmPUf0/hE0nkpbRIVYy/eChjDCu24LCmQRCYNwAIRUb9
	w61LaPvwHDLhMLdU13vx4+Vb4pXGzjFMhzCmRCWwRqXutZHRND8kN8odxRAJzTHxeVGYHI/GWw0
	N90J+94ZSoNheTyGXSP7G8H+X6EDH65gT8IWBXLnFWv06n3JYHIn8dFKiXThGlwfL0nJx/G1UcT
	xIVo6+MLehyim66X4ornkvpiA4Dc2v5/oxiHgwLzK19p2ON228nMTvNreirsnMdX3s5KsRrMNno
	ot5BcrMiTiILcbjTJhENPyjqdJosPTp0F2NgVSi1jbM/aaaviWqQK/y50boXyJWbnAcAer46VC3
	LiX/niZD7InWnKVA6vgJ+XBEwZM1Y9FUcTN
X-Received: by 2002:a17:902:e892:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2dfa62274fcmr6365335ad.12.1790595312887;
        Mon, 28 Sep 2026 04:35:12 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dbc34sm39183265ad.13.2026.09.28.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:35:12 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:35:04 +0000
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
Subject: Re: [PATCH v7 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT
 under invalidation with SVA
Message-ID: <arpQ6KINJE4velBl@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:09PM -0300, Jason Gunthorpe wrote:
> The erratum (MMU-700: #3777127, S3: #3673557) deals with under
> invalidation of a CONT PTE grouping in the SMMU. The recommended work
> around is to use a range invalidation that spans the entire CONT. The only
> user of CONT in the kernel right now is through SVA sharing a CPU page
> table that contains a CONT created by the mm.
> 
> Previously it was thought that this errata was dealt with because the
> driver always uses range invalidation. However, there is a subtle detail
> in the errata that the invalidation range must fully enclose the entire
> CONT for it to work.
> 
> It seems that two sequential range invalidations, with a split point
> falling inside a CONT grouping, will not prevent the errata.
> 
> The SMMU's range invalidation generation algorithm does not produce a
> single invalidation for a single SVA invalidation request, nor does the mm
> carefully align the SVA invalidation ranges to accommodate the splitting
> of the invalidation into several ranges.
> 
> Thus, when processing a SVA invalidation, the range invalidation splitting
> routine can generate a range invalidation that is split in the middle of
> the CONT and risk under invalidation from this errata. This condition
> could be triggered by a malicious userspace manipulating the TLB gathers
> via mmap/mprotect/munmap.
> 
> Update the errata list to the include the S3 variation, detect the IOMMUs
> that have it, and then have SVA invalidations use a simplified version of
> the over invalidation algorithm from the tlbi rework series. This ensures
> that a single range invalidation is issued for a single MMU notifier
> callback and now the range invalidation is guarenteed to cover any posible
> CONT.
> 
> Future work to add CONT to iommu_domain page tables should either use this
> one-invalidate/one-range invalidation algorithm or disable CONT support in
> the iommu_domain.
> 
> Cc: stable@vger.kernel.org
> Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> Fixes: 3f1ce8e85ee0 ("iommu/arm-smmu-v3: Share process page tables")
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst   |  3 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  7 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 91 +++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 +
>  4 files changed, 88 insertions(+), 18 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <peaan@google.com>

Thanks,
Praan
