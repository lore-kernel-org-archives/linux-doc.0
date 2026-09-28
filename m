Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6FE4E236B
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607427; cv=none; b=pNGE97DrGcN+7vP6GwamTydaQNXQKkPmIxSjn4vDQzQLnkYm+sEXdelBzLo6s+LX7D0Kh28GmoYRqtohHPKvGd1MLByNttAGWhixqruKakws6lG3/YVch/2XUnYr2lU4q5rEx1NHt9KdLy6aBH8vjmOZR9b3OjIhahq3AZ5QVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607427; c=relaxed/simple;
	bh=hnhQkpKoMw2Zhfw9DM4few3dVnMySo2yIHKJrwxV20g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihXPmX+vU5k4rxVVtKBK0Hf54eBsr7lc3E84qw3nys+fw2mJnPLj4R4vT32raJS6mCud4+3f8alUxi1NN0DaC/8haJGSWBHv39Acv80FHKEDN/qBvoDPpJt7noe/HACJDIwPyo9QHS7LULAPDWtdPna5BD3bsuI4/B9aSIxvo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/jZ3mG9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/jZ3mG9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db33db4de9so92615ad.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790607425; x=1791212225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Go9hn601ofYGhTbmTXvodFkeQSZutx3QY5olFYU9dfU=;
        b=Y/jZ3mG90k+9/OiYbELY+hpBvAWC2O7pfXFE+zOZk7RNy5sDEYHoKttkUiBS67Spm5
         yO8lPO3VAQTJD3ieeZULPxFdhiuqTyCfHmZ0qJc+Chr/M7N1CAW8tsZZ+l8QxoETpZfY
         APjq8dY+T/BSTBXpfsqEYW5cWgETdh/bTH869vAmtD6rN05PkpVluURnkn7r+uTYY/6G
         kTrom5m27/2dqFQmS4PsjJ/EgiHaGIP29Hzksi4k3ToHFJkuwUFv9vxa5MGO80YyGHj1
         BqC5YJrgIH4jrFGbbiVbKRT6wgw+m4xfcmzndZRgpSY7V5pYWXG0bs054yOdAYuYoSma
         rXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607425; x=1791212225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go9hn601ofYGhTbmTXvodFkeQSZutx3QY5olFYU9dfU=;
        b=mcrOODJlWCka66Oyl2C/jbb8zDOmwTtF9mOhW51tr9gTMtT1wId3tJWjxtDCSTfYtk
         wtQ4wZYwnJiVtrKy1pHvUbOOIoDUtv9VcoDvk16EjME0Ktr9HKJMAc155mZuNssRw/Sn
         JDQ7EAH8uHQ1LJBWu5Z9XRiE6w8O0A7HEX1dznGuwuZPmEBZ7h2WruvcupdFJfYNqDla
         QgsrkYLxwktv+1n/glRjTytprOBe6c40GO4L90gQ1wd4OW9PhAbDNK3AUGl7scEAtObV
         34UhBl1X9K549pcI4yUBsWBYwXcrHqykEKrMoLk3mBlDaYjas/8a4C+YyeAYJ6G1kjYv
         y/HA==
X-Forwarded-Encrypted: i=1; AKwUvByK3ElqKWz9/BxQDhNM5PS+KpDL15+5G7e/2a9RTV/bn4o1stHfo9eE056vHURZDubvxSpc+OxZF6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYImOQespHGBQsnICIHzxPm2D3FwnTHl3vkdByF3OZLvoAJJBgGi
	53MpuVedUonkWla2cU3PsYZiD3dFed+WikDrjQXu8dGYd9n3qiAR/kfP7BtyC+IzAl6bUFMmvsy
	DyjA0DBkD
X-Gm-Gg: AYBFou2dGEYz//4xs7++w1XLa2so3y7ecN5ErAwo39dd+3Zw8Ro/8DGCCaHkT2jg5dQ
	MS9bJYfT3u8KcWdMchvb5x3cYp2OukOm/QPmVREob0d932OtVeDQmO9N1OLQZTtxsAVfS5wV5/m
	kD5OVmNJR2K/ICg7LTRdoCfvB2sVBaizTaIfUorWzGHcCBDCPYGisVusx8bALvjhaQI46A1L9FM
	vFi/CeRVha6JYNvU45xLbM5uOlsiokcYuudi1aQoH2qeuYAn3QJSDk5VxR/6gwZ0HWrgkA56bcJ
	F6hnN9XfnYnd2rXqCVsXxCeilBojyIXbF+uHbpHlYEIEzm3GYdqhepFfu+ExAXZOtDw7IulA+Hl
	szabM59IRgD4Zk4SuG2LR2ndFG2DZa1pC/tqsUKyMQnO96/CQU2j9ZECtcDIElBdSTj5r7MVjIh
	f85sXAkSGaV+9htyl2rGcJwPoTPdK4HJD4qNTqMCY6wSE4Flc9NntRR8AWU3bDqdmfl4V7JBVOg
	7rV6S1QAKdWSG9w6kgH2wysv1w3QqC/VJke
X-Received: by 2002:a17:902:d4d2:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2dfa968ef1cmr5442355ad.1.1790607424172;
        Mon, 28 Sep 2026 07:57:04 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm7198628a91.2.2026.09.28.07.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:57:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:56:54 +0000
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
Subject: Re: [PATCH v7 5/9] iommu/arm-smmu-v3: Keep track in arm_smmu_invs if
 range invalidation is used
Message-ID: <arqANvAwIz6GSXJp@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <5-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>

On Mon, Sep 21, 2026 at 08:55:13PM -0300, Jason Gunthorpe wrote:
> Summarize if any of the inv entries will use range invalidation and if any
> need ARM_SMMU_OPT_FULL_CONT_RANGE_INV. The next patch will use this to
> avoid range invalidation pre-calculations unless the range commands will
> be used.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
