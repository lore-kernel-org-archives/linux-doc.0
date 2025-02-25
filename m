Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A531925B8
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503311; cv=none; b=JpU78fdOJkwzul6LCA7SGrrx06c/SJUTCvfkRdnOsy1AsNn/w0a3jxVkcQE7UNAIaXicU95h0ebayhmBgsAXxtNk63R2ZedJbzxwayaVv2EPdFbw24SQbB348Acxoj0g0oUejGo5hLfWgMU3QNoR8zwaEcF+aM2aCzZt7t2i6S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503311; c=relaxed/simple;
	bh=SS9kgyaImj6RHK5LJn7d2R6kJ3V1FoRJ0mFcyFKs1aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6bBSVp5ox5Ak6aQLxYDcYSeZz3X6GZ9/yqpBZQFFIyrvIUT2O5USSWx5ZZoSxUH2Q+LOXZwx9mj+wrU4hqEMrFzzsgyQsNNC2miQ2ezWFInOCY8cXF2AdHuNaKOrXvhYqDxrjUp4wSBINwRaITp6gyNghi3m/OdUKaSzjExt5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1+90Mwc2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1+90Mwc2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2212222d4cdso177735ad.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 09:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740503309; x=1741108109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QM6kau2iQ4j6ZEaDdmG4fMZZFTf4UoSv3ypQuKbFJw=;
        b=1+90Mwc2tBTehc48eAdUaVeASRqHpq6148FESDI3wonZcgPuiM8ddmoGqsMMpOOGWF
         RwHdsMJL/7i0ZPXQzGm1EnbMF/WPCBqHcKcSHykx7E6VhAgejGNnmm8aD76BADryfK52
         rDwA/mLwrT/Xv6W7jwP3T0qYWMf6NY3BEdyQRVKYinPBktKurSCW+RYXr4K0g//SjNT2
         V/6qieZycgjxgyBjkYvto6mxcEM5kRgn+QG2LSluWa9LuJcuejeOlWlAQMnP4oB+dx19
         6uklvoKdzZp3m4PV/YTtO9fJ9Kn2ziOW4/OPm36Qil/8SSnyQkFFWeuN7++7MVESIf+9
         KoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503309; x=1741108109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QM6kau2iQ4j6ZEaDdmG4fMZZFTf4UoSv3ypQuKbFJw=;
        b=QSl1PZcrQd/34puOeE83swBeuHMUdouQHWLckjXhFBJy+zV2tDoFiLmYZAhZJVjqn/
         KMMJUid2ryHeXtQjdwDXEtl/z8NVSA4IUGhpUH6idcdoDrmL4IWE/K4uKyovGPuGoVa3
         7OpJhWBv1jy6xb5PVgGzOUZZ6Tuvq67qcG7gynFOrep168tVd3RvX1XLiHFPaV0Nev5m
         WaiFfP92OmTenAlKI28K4qH1wbBVxCKFnMoTAwWuIKNb2splJSh8PqAsW8wkqrLvlxtI
         SFDGrWjw3oG44bAuzk68uSiyVfph7Njt0gqr5xdZQPLdjGC9D78s0+EaBjESsZg3j33h
         QEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIFaRV2zmAIfooYhlmRvCs/5NLf77WEFfT/6dS5GIuw85UqShKqyQ0t+Fcd76wZA0Yvfw+ccGMpRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41vE5ohzDsU2Pk60zglqYKeLyDX+8P/A4Cx3NmGGrXDKuAOKa
	rXiscITo/6PRdfO5IH/+ElWH22u8jyvcPLTxg1Y6cGfs+C4z4rPoy3gJM7KRyA==
X-Gm-Gg: ASbGncs4AvYXpTrjEfJw3FA31g+ngzXBU5423iNLEiFrrnzE9ZsbFx/tO+W9qV4EnvK
	WsWTK3nK+R1EQ0DHA+ZXHtKi6qRiaph591D9xDApmaOeet5s05vGMdUGYXaDc8q/CFORMX9+OEn
	D3ZlBkEhAsTg/X6tZdObqjUX0wbu0CxxwIq8u8/nzzyxZ/1nweN2WNvMMccmetKUol8Av2pHT6u
	/EHB0Amdvh+fSpknAiV1xcsMtvHF/d4jiEFUStHcrQf4rEf/gr59UwvemirBXiX7nBr5QDkT8Fo
	dGUXYn8IvWseV9l+6UJquWVyq8EO2XRfIhVYmZNDm5T77SiCx8GsbeF8DmYXkGk=
X-Google-Smtp-Source: AGHT+IHxrabWDtym7s/ddOkqBHoBfq1ZqP6yAIbeWpN90fX7xeP+90KuPUzmekpH3adGkKddVDiEdg==
X-Received: by 2002:a17:902:ec90:b0:216:607d:c867 with SMTP id d9443c01a7336-22307aabb1cmr3599065ad.29.1740503308535;
        Tue, 25 Feb 2025 09:08:28 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9ae8sm1757069b3a.120.2025.02.25.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:08:27 -0800 (PST)
Date: Tue, 25 Feb 2025 17:08:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z735AMlhP29YEndU@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
 <Z7zqdrQn7Q8yXfcn@google.com>
 <Z7zxsbJsOFp41Dzd@Asurada-Nvidia>
 <Z70EnQ5CXacc4ysT@Asurada-Nvidia>
 <20250225160225.GA593877@nvidia.com>
 <Z73yt4r0iDFwbty2@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z73yt4r0iDFwbty2@Asurada-Nvidia>

On Tue, Feb 25, 2025 at 08:41:27AM -0800, Nicolin Chen wrote:
> On Tue, Feb 25, 2025 at 12:02:25PM -0400, Jason Gunthorpe wrote:
> > On Mon, Feb 24, 2025 at 03:45:33PM -0800, Nicolin Chen wrote:
> > 
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > @@ -95,8 +95,6 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > >  
> > >  	iommu_group_mutex_assert(state->master->dev);
> > >  
> > > -	if (domain->type != IOMMU_DOMAIN_NESTED)
> > > -		return 0;
> > >  	nested_domain = to_smmu_nested_domain(domain);
> > >  
> > >  	/* Skip invalid vSTE */
> > > @@ -122,19 +120,9 @@ void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> > >  {
> > >  	struct arm_smmu_master *master = state->master;
> > >  
> > > -	mutex_lock(&master->smmu->streams_mutex);
> > > -	if (state->vmaster != master->vmaster) {
> > > -		kfree(master->vmaster);
> > > -		master->vmaster = state->vmaster;
> > > -	}
> > > -	mutex_unlock(&master->smmu->streams_mutex);
> > > -}
> > > -
> > > -void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> > > -{
> > >  	mutex_lock(&master->smmu->streams_mutex);
> > >  	kfree(master->vmaster);
> > > -	master->vmaster = NULL;
> > > +	master->vmaster = state->vmaster;
> > >  	mutex_unlock(&master->smmu->streams_mutex);
> > >  }
> > 
> > I'd leave the clear_vmaster just for clarity. Commit should not be
> > unpaired with prepare in the other functions.
> > 
> > It looks fine with this on top too
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Ack. I added it back and a #ifdef to the vmaster: 
> 
> +void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> +{
> +       struct arm_smmu_attach_state state = { .master = master };
> +
> +       arm_smmu_attach_commit_vmaster(&state);
> +}
> [...]
> @@ -824,6 +829,9 @@ struct arm_smmu_master {
>         struct arm_smmu_device          *smmu;
>         struct device                   *dev;
>         struct arm_smmu_stream          *streams;
> +#ifdef CONFIG_ARM_SMMU_V3_IOMMUFD
> +       struct arm_smmu_vmaster         *vmaster; /* use smmu->streams_mutex */
> +#endif
>         /* Locked by the iommu core using the group mutex */
>         struct arm_smmu_ctx_desc_cfg    cd_table;
>         unsigned int                    num_streams;
> @@ -972,6 +980,9 @@ struct arm_smmu_attach_state {
>         bool disable_ats;
>         ioasid_t ssid;
>         /* Resulting state */
> +#ifdef CONFIG_ARM_SMMU_V3_IOMMUFD
> +       struct arm_smmu_vmaster *vmaster;
> +#endif
>         bool ats_enabled;
>  };
> 

Umm.. I'm not too sure how I feel about these #ifdefs _between_ a struct
definition. Given that currently, the arm_smmu_v3.h file doesn't have
such `#ifdef CONFIG`s between structs. I'd say, in case
CONFIG_ARM_SMMU_V3_IOMMUFD is turned off, we can simply leave the
vmaster ptr NULL?


-Praan



