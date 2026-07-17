Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFC6331A48
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318364; cv=none; b=JcxkhB0/Qrgd4KqPVKq6DN+cvNOANE1Tm6CQOjVGGoT4qE73g1NdVfMhfFN0rzqNyS58+8SH2OCjw6BPBPvNkYF25dE8yo94NKcajgwib/9sal3O/2B4OP7P8+9w7uSXxHPegFMbmrlZ7alqTudPeM2TmVivQv8G5QnNsMOtjwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318364; c=relaxed/simple;
	bh=LMQ7fUo3sorzck80ZDANF3wgbQwKbSE7cQhncLMM+/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mM7MfR9aySj7FuJNJ+7aKZITx56n+J5oCiSCBK/IlyPtvIGI6E0KlZj4OdhXxggCx0aiBn7pGakvaPy7J2U84gA2RObPeo48nOqTyNk2ElgiU4F/RLYQmHy3u7yRVHtRkDXXTrYzW+9Xstl/myhax6k6YCkKMyrBP43ZOXJXhPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=a3W7GYED; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="a3W7GYED"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8efef6533aaso47828116d6.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784318361; x=1784923161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=;
        b=a3W7GYEDEbV2fvImRDO1KYv+kg1MGa2nWGHCxwBO/w09J79inNMC3B3Yy3W0mZ4zsE
         26Egd6NORzeFDSPogz4DDN02zb90CELgJERppeHgzmPCZ8qMMdHYslk8Z2HzpfqCox+s
         ludYiZLfVsKxjDYAKjVgwxGjFpdghilv7hgKtnKJyMXW/vXGMoHWg9J1hex8US3Kpswd
         IZrsmbkfCWYtc5d8tAozo1P30kLhrrgbA2aw6Ahmu6aqyn29+lQjNKQEtgscPpP9H3VA
         JXOhzb5gVFuOttuFakbPz+N9fnJA/P7hlWfKNIyQx+JykbvlQCBO6HjywCFwEtE46UbL
         k6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318361; x=1784923161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=;
        b=Emvz1VCofQOE/ZtT3LEUnKNpq3D4lJiG81N26OarQ4EEUxvJ15KPmWygDgDqC+2BYf
         di/aDzX3fFRYtIQ0yBDi0zXHU/uTyDYSulZ5cxla8LAThNz7rfXjH592UTaWwBTsMX/m
         9d1xkMkywBUKUlrZOxMsw/qNvFuhLdK/ioaugXe4OTvhCV0YZvorTHjyUjb3RLE0FcyE
         KdZF4Qg95DZr7g+H6mxlpgMsnWJOfjXI/a0ufdnin8AkFc7KI54qFx/J9fPZOZ/Ir1M6
         pKwjJCmLdjo/MKhVJQtyI55S8pv6HmSzZaxu3MwAVW4tLZc5OpfnIRyc7fAGrMaGMAmY
         ysqg==
X-Forwarded-Encrypted: i=1; AHgh+RrgKwatmajFKLUAzBk860zH/83g7VR6dAwvHWKEo04P/vHvvrK8XerCv4ryG0BeoWXUOSmpH73PhfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8spmFmRtRjccesKqgSWXoQqniGiIRPc/FV6GkOp5MkBCNidkj
	OIsR3XhqERziMtIh0QrG+HDTXwdrjOq63Eo4MJ2GEJE/N5MW0pCOUwLg5aU301BN9Bs=
X-Gm-Gg: AfdE7cnuGN3eZ5GsIppnH1MjS9t17gpbmP78bB9u7kBJt/od+caHMKQbhUmEbSfcRxi
	EwDKeC+YbajLDoxCfp6Mhq5/PCkkNyE+VPPydVZgfJQRZYBEBjbLQNZFSaeZWB1oyf4jNo88aFR
	taYp9mRYNu1R84LbT23iuIrpgUytBKwuK4ii92k1Y1yKZu+JiF19tNc5hLK0JvZcMVAQ0kU2yp6
	6COlDIRpAT2OhLfOE4aGaxeg3BQKMhb3cQZJ6BDYKsw3uvTdwrAZMFkeUUsgim55mc8ZwS5nE/S
	Jx/VwrP2QoAfmayZqcHCgzKy1WUJI64veb9r2Ys4/kbY00Rr+jp8Ffy837ivIpr2MYxsBtuz2TC
	KMFNY3AAwIBargoUMTVaEAG0x/hSHP6UHJjl6FhMDsNZEuy4cl5HQJD1GSqtg
X-Received: by 2002:ac8:5f87:0:b0:51c:1291:e68c with SMTP id d75a77b69052e-5213b148393mr36523971cf.30.1784318360897;
        Fri, 17 Jul 2026 12:59:20 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214ffcb2c6sm19444171cf.27.2026.07.17.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:59:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkoiN-000000051Gu-1TIS;
	Fri, 17 Jul 2026 16:59:19 -0300
Date: Fri, 17 Jul 2026 16:59:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch
 force-sync conditions
Message-ID: <20260717195919.GB701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-2-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-2-amhetre@nvidia.com>

On Tue, Jul 14, 2026 at 10:42:00AM +0000, Ashish Mhetre wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
> flushing the current batch with a CMD_SYNC before appending the
> new command:
> 
>   - The batch's pre-assigned cmdq does not support the new command.
>   - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
>     forces a SYNC at one entry before the batch is full.
> 
> Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
> so that adding another force-sync condition becomes a one-line
> addition. No functional change.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 23 +++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
