Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B417719B3CB
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506243; cv=none; b=ZelJ1ZHGvc5QglaaW5yhEuRDRhbQk9T9Cz8VqxV9DgFXMS5hBdGcQJF6H32W042e1YIio9aW4wYq6wSDr88tWhe4NMx/EEstmR2+mZ1HinWMO0G/huovx9/rKyQBMCXtN4XKUchBr7lj1ecaiz++H8cjQhpeK4DYGroUNM5B9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506243; c=relaxed/simple;
	bh=31zc1XueM/rGKJ6c+/BQITCsz1wXw3/IbeSan2eXnK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKR4knNytIGhYMq0+OWyuZTsRHbORUDTEeI1QHpJuYFKpVzDa/4cZH1mb00EoprKsNngoYP0jWAReQ0fmQ0ZxLrsAw7o4IemfTIohAMrxARFD27Lh2WTuiOzePpZQ5W9tYt9hVNF95kT/rzb4ET8g2/UV607yT5vQr3GmboyUpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OWgpDTiP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OWgpDTiP"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-221ac1f849fso2915ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740506240; x=1741111040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHaAT6T+XlWe+89P2zugxKrlYk7TledH0w0ahGQr4YM=;
        b=OWgpDTiPQBDBTZcpLxbeBSONYJUditH8XQiAsLTPx1LtKTeeMPuaTc8MGqF/AiMzUf
         nwmXoaHMlhPnsKVfBSWO7DJfNDoqXrIGi0TF63AmmXbFP94rXJydx610p+5CEGHD08Oe
         KhqlANFWKKDMHgSx/SEMc4vAi+PldaiR2ROu5yHq5VRALiRyTLLGKpIXnzMoUmCTqYPp
         IAe4OxcnDait8wAzACbPfLRMfF1rgtD0k4MQX1c6zIUWtCqghWUOnDA9t7uWMluU6HS8
         I9DUw1CUm3tRnL3BpIujyA5sJPsRfm+hKJGDntSdeHRHWCZ1q79wObE2PGoJvzYdCPOM
         JqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506240; x=1741111040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHaAT6T+XlWe+89P2zugxKrlYk7TledH0w0ahGQr4YM=;
        b=SCnNHFsgqDelEKenxzrzbkVExl1e12CjqvqyWdDICmXS9HUYYj7v2o5SctMjEj0BfH
         kfr9RNhVb/aM7wBbe81RFvDzAYBiHqX/DSOEmEUcTzjBE6hhUvlhvhdvopIg0HYey7DL
         KKkAmM//UbzVTR4sL5F86CT+XzweKDmwhg2RGiItb9Y4d+r1eQ4L2gFJ5p7cSZImHF/3
         vsGfGBu3oBOYkjWZGBUdR3obQRMi+huRNvB9rx2uPIgEu40l0YWGf4+0fwHu4iPD0Saw
         N2AetGjJ06iOuSePxI1ZvO0ZPUvAdXwTiTDaEaIu38lXNMunpnBStXTknkxu+Ltbqy1I
         AHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnW7vRHCGdY4A3TmmhDP4OcHrgbuK3MxJs0wt6IGMrc2F+XrCKN1ROHTbCSYhwoN7xK3lmZmD5xYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyjQrV7A9/YPa0VZ0RI+7/sfF8dCZMiByRD1g2JEYgpiOdovSl
	PkSxONUOTmV4ZTTJUrkcn1g6xFowqlkYKatBUruGdzBvS8RALLZYFT4rn82g6A==
X-Gm-Gg: ASbGncsVsAG3Oc7ucb09zcUsROwAGKD1kXfGcsCIMjJmKcvR0e4Fo++q5wCangMdNTv
	RJizgSHmvKGK97uAIKvg08hZ9aNW7sq8imOGXlJAFl7w4i6GlqolLpId7Q+stDYm4+S5VDu/GMT
	qbGxmHkjeA60wVkvzwA5SwXTc1M+pg2Jwnis5mVfoQjZiLQlTpKnxrdOfZadwI4oq4Wf11Sj4lY
	FWtJnISUPPE+EwQz+qWkIJhwUFmxIBJWnrV2RCLpQKpaEE5UZ0kyfWoaCJOAOgQ0RhHoqlEYuB/
	objyCgrj904AYtnoNasZo5/naQEynYW7LovoRqabmuvFsopAYiI7Bid9cy+TQFM=
X-Google-Smtp-Source: AGHT+IG02bNp0tkxmXxczB6ZSntt4wfTEWTePiQeT76QafmUXS7ThOKjH22xno2GMa6y5FkJX+V2yA==
X-Received: by 2002:a17:902:c40d:b0:220:c905:68a2 with SMTP id d9443c01a7336-22307a2c777mr3852445ad.5.1740506240014;
        Tue, 25 Feb 2025 09:57:20 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a61fcsm17251405ad.191.2025.02.25.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:57:19 -0800 (PST)
Date: Tue, 25 Feb 2025 17:57:09 +0000
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
Subject: Re: [PATCH v8 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z74EdXC5YzvmJokk@google.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <7f6813dc2b62f5f396ac3172dc2a7d9bf3b47536.1740504232.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6813dc2b62f5f396ac3172dc2a7d9bf3b47536.1740504232.git.nicolinc@nvidia.com>

On Tue, Feb 25, 2025 at 09:25:41AM -0800, Nicolin Chen wrote:
> Aside from the IOPF framework, iommufd provides an additional pathway to
> report hardware events, via the vEVENTQ of vIOMMU infrastructure.
> 
> Define an iommu_vevent_arm_smmuv3 uAPI structure, and report stage-1 events
> in the threaded IRQ handler. Also, add another four event record types that
> can be forwarded to a VM.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  7 +++
>  include/uapi/linux/iommufd.h                  | 23 +++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 17 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 60 +++++++++++--------
>  4 files changed, 82 insertions(+), 25 deletions(-)
> 

Apologies for my spelling error in [1]. It's supposed to be:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Correct spelling in [2].

Thanks,
Praan

[1] https://lore.kernel.org/all/Z73zvIbsXzJMCaNt@google.com/
[2] https://lore.kernel.org/all/Z730M3XptvDRObBp@google.com/ 

