Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539661F4177
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506395; cv=none; b=T8QQWxhud9EmvNR/kAL/ggihVxkOfV+05jRKjdknneg40kX50TCwiIvN+IbpvFpOdNIeaylC+h+wnb+zonArAUcXj57qn/OHRM2AhKcwULwQbgsjU+YJfpwjFnWYT19LNG14eSgvFLx9bFww7fZ9s4h2vFLaEbOkd/p9H732Iyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506395; c=relaxed/simple;
	bh=t+3/xgTztA90riGckbgrI9IzG66KkbXPYhDKFDRxAeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnqt5QYvU8CFjUJZeDyqyAaQ0EJc9hpGrrKNU3yWOl8JIYI7ptUSGJc40w7cql16Wp4aCKJxh7HghzJDrVb5NQ6GniNEPXQpRoM1hstTnurklk1nfb4qVPipq9fryi/kDWwj+xqWES4PgYWsD6IrfJmXHrceMYmAqO7Cf4ImKa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EuL96jSb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EuL96jSb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-221ac1f849fso3575ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740506392; x=1741111192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zet+c1c4ONj7xvmenDNyn9l5ztIYraYudvekwtRFR4g=;
        b=EuL96jSbDAd25L16qFsOdYafktXepV3jB/EwvZHTHfcwGBFQrsz56rYMMmmxKJVGkr
         ulcf+FZSW7aycHtGq3HCGJpMIPxPmZWSa21wwihB9L9ePlpWzMo/yaUj71NZYqIIr6fy
         6n1c6qiR635r6M8mVbH3THSLsE1qnw6ho9hB1ICNCWd9bcpDBlgYAA4UW85o1cqa2sFF
         b8dhDYeXI2lhJs2hojov22fkpHvJMPIB58H7gUQpiwjff8LS0S6KPir+0Rs/KmWtS3A6
         rnzxoER08rxh/8uDs/Dto6Gyp5Rv0Cqdbtd/ViS5lZMulIF1EiIYvVfCBRltMjx5IbDv
         fWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506392; x=1741111192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zet+c1c4ONj7xvmenDNyn9l5ztIYraYudvekwtRFR4g=;
        b=LgMSjlMt5hFGLpyNQd5K4wf3u+ZJrB11WigHcrkIZKLXYc4igmBAk45cKVLpTLSAN4
         LD+RUzfwQ+R89eOZku0E4JEyO2L0g7XciA8fLcdv3YbeNO0GS+WORAaMPh5ek/9+NxFh
         owxO/yCfwT1p61MOH5Yujcj1maD4OBjEx0ncqyB2DceswztzH1kZes/bGcegDMeE+GBS
         +K5Qfcwl+SdYo/5+rki9KBf5eH9xDRLiRuFZfdV1BTWztvxY3dmLRh8fouSKsNRs/rB4
         czLhTXSM86o+WwuWuHG+skIrYJolrhrx0GrgStKMPhfEOYJEd5RSxBtRks1f5YQa3KBM
         iCCA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ilbNyrQJBTC8oDduMrAf/VIYX88v0dXQhcMEXs6NepObtSWVUWAztBH5ZMU4WrGhHIQR+fMDxPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QdM8E1guoPxAkMgtBBAHLraPdo0Sv3NpRQmCuQZhO+9iGHxp
	rZpLVMoklKc5SeV5B612gOrla1lLZOcC7aE4j2bH2zp/vSnQLElGiMsqQaFs2A==
X-Gm-Gg: ASbGnctfUxVdtk/fRQwFm2m/o7GPmnuF0FmZQQNuJLnze8AW+nW/m5cF7Z4EjURms4u
	QwC+wAzhl9JempCoj2mtYl8b/Y9YlGURjMaaKEWTeOO2Adr9pvZs9ZvYoNjYn6feYiAB27QgqyT
	HvSM3j5RTj0wjkFeNreIiWuQmzLdjtdvR1eioCuTHbfWwrvtSOYThDCefgi97KxEzjq2c48kOvZ
	1efx8T/iA4B9JbvlY2A+b+y5OVRTFgcaD0W7dVWCAqohYl1wWReocDFlWlRkP4YIqO2ZNySR59W
	ppAaVn0k4vhkXudIYl4alckM8FDXEe/GJ9caL0PVn3qjnVl6N6U/EyHk56ksA0o=
X-Google-Smtp-Source: AGHT+IHt1jR5XD9845sVRfVXJk9oOqx4VZihn8kcHDN1a+U5MuzF3NMe86gHqr8wYv7wnn00ZADsGQ==
X-Received: by 2002:a17:902:ec85:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-2230798c8c9mr3956505ad.0.1740506392319;
        Tue, 25 Feb 2025 09:59:52 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6f8ec9sm1867028b3a.53.2025.02.25.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:59:51 -0800 (PST)
Date: Tue, 25 Feb 2025 17:59:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v8 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z74FDTtZkjwrjv29@google.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f465dd9defdc0fc748c2fa2cfc829e37778a4ced.1740504232.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f465dd9defdc0fc748c2fa2cfc829e37778a4ced.1740504232.git.nicolinc@nvidia.com>

On Tue, Feb 25, 2025 at 09:25:42AM -0800, Nicolin Chen wrote:
> There is a DoS concern on the shared hardware event queue among devices
> passed through to VMs, that too many translation failures that belong to
> VMs could overflow the shared hardware event queue if those VMs or their
> VMMs don't handle/recover the devices properly.
> 
> The MEV bit in the STE allows to configure the SMMU HW to merge similar
> event records, though there is no guarantee. Set it in a nested STE for
> DoS mitigations.
> 
> In the future, we might want to enable the MEV for non-nested cases too
> such as domain->type == IOMMU_DOMAIN_UNMANAGED or even IOMMU_DOMAIN_DMA.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 4 ++--
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
Apologies for my spelling error in [1]. It's supposed to be:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Correct spelling in [2].

Thanks,
Praan

[1] https://lore.kernel.org/all/Z73zvIbsXzJMCaNt@google.com/
[2] https://lore.kernel.org/all/Z730M3XptvDRObBp@google.com/ 

