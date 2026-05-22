Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20425B08D
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 05:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428625; cv=none; b=X5Eh0V5dewS7G4zNI5vJssmGyMinAgJXXIExj6sB0aQS/GvsWnBl44Lyruf9joqLnz616FnnJoocfRIMaCI5o9uBVo5bBYnhdGVGXHuTrLcfPbjCbXhAU1IChTpVBmblK9sJ6uYqwAryGyIY1lCpvjUkJ58YJbuVNBHSlSK36ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428625; c=relaxed/simple;
	bh=Q7K1F3np4WJv4oG/sTNlQkMLHtgmoG8J9W9dCcnSGYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnYsHA2Cd2C0/Y4BrAX0yic1N3LySZqwYL4fvxDCVMiFaUGG2YIk7MmljohsDPHlIgSk5B9w8V7iHkcz48TQhTMY4OdnsSe6yJS8tiDQyOF9+IrFYZLLXYvBN5Kpm+UYxOYCelrfJv/9lLC128h//oOTgwbKEV3eMpxU00tkUqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwbFH4Lz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwbFH4Lz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so3370484b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 22:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779428623; x=1780033423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dA9bLoOSaD6AuZlc4efO47Bjrc+kVVqleEY+CSgNcvY=;
        b=NwbFH4LzXN4K6y2i9I+adSodvqtHCJv/u7tVQeQoouliz85gfsjpaZOTyjdF2JZhxF
         EeaBFWdqNgoW3CTRmmfm/88HQVIxw+hWXcLCdTeRhRmnLYXgpCOSGVH0WvSRUW7ZnNGX
         fZFFnsAiouUCzhJAbYZD0nedPx/M8prb5NNhd85btVJHn3VQ4jb+kzzexYHU+qQas8+E
         2mEKqEtnH1G3X0ywyWs24FLSw/HD6e1JdtoRYVXzTx954NP3AYPTD9mfNuCyN0AEGBhR
         cuiXSIL98zrnWucMBEBouFOUC18jaWGzj4TrrjmalyCnR5pp2E/SpwWWLjFaz+BHelko
         8SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428623; x=1780033423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA9bLoOSaD6AuZlc4efO47Bjrc+kVVqleEY+CSgNcvY=;
        b=gaTfT8u4fC4BNIWkOZ8cbvRfoS9r+smEF7tjNrISymSF4sokvo7WKTa28XwVDtbCSD
         cEKDJg3JP/7yQtLMv8iRqM3zG7WFTX6retvblzgM9YuAZz3fu7aysNL4aeUZ1WduFY5a
         1kXq3M05t8UhRZifr8iDoGkPzK6yhY8jnZwHcIG5gdPmCTTSAqRVmdNgWcHykctkt14V
         sbJcQfRgvErLXHMJycc07SVmWw49U9gD+HuL6F2ghrItTdgeIVF63yiu14Ht/F7bZQ6V
         pQunjwDeSC7k2hxFsfwkl9WG0z8wwcNT4IpYOPSTN0IAZCuxbYjET3TXP5CSY8jXJRUp
         PO6g==
X-Forwarded-Encrypted: i=1; AFNElJ/wgc5/AdniZLcWci13rsZ8g0BH9nyf8a56qRW3B5qzL+wZCGdpqsZzNVaHF1gzgrwpeHAa2VtT57U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyebPKYuFOt/1f49oXbcDO813+dXkE8OItQ7pqdSk/oBg7LDn0I
	1ceDGGA0mdeK+O2OvhAOaQlxK/g2n5kYGXbpp9BodHkPoKIfQ86BhcPR/qjOgEgrQU0=
X-Gm-Gg: Acq92OFIj+RbgjtkZjL2RsEA4ZRgF4cx4+yMNV6Y+DOabKDOZ3TwreY6r5f7ihwHzBp
	co0efkcWDN2Ex2JAVzMBmp9zIyUhzeOdkIfsBojjBVduzFuujcD/mFHVku7VEfIzCw45mxLieyz
	AZcQuflxIUCVJUb3ERjnxu08fX7ZxvGmcK0zhHtWAgO3Q/UnbFpKjliL+r8D1ESBuo2rA0gMSbd
	1hBJ89K3smt1guwem4S0H2kDo9oajc4fgsyMxNeuCvb8LBuoG+ohvgK3eboFXmqfhHl7BdRHT13
	PC8+5HxZUjc3g410rwB94g2RuBTHqa2w+55n/oHgeEaqLsWXr0nwONUfwgpNJ2HD85Fcxv0W4Op
	GkXa69q1hw5iZsSzM1uf4z67p2374w27b3WoooZa406DUHcclTfqzkiYrMBg5Dzcpwa4/wqoCU1
	vGqsiGrI5wN4WyWUUhs6YPomc=
X-Received: by 2002:a05:6a00:1412:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-8415f37d836mr2434622b3a.22.1779428623390;
        Thu, 21 May 2026 22:43:43 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164afe343sm659817b3a.20.2026.05.21.22.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:43:42 -0700 (PDT)
Date: Fri, 22 May 2026 11:13:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Jie Zhan <zhanjie9@hisilicon.com>, 
	Lifeng Zheng <zhenglifeng1@huawei.com>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Sumit Gupta <sumitg@nvidia.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Huang Rui <ray.huang@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] cpufreq: Set default policy->min/max values for
 all drivers
Message-ID: <5jmfuo7wi4zqz3cv3voeheq6jm4xaxkwrnsprpjwewtk6v6qjs@vea3o4u7cyl4>
References: <20260511135538.522653-1-pierre.gondois@arm.com>
 <20260511135538.522653-3-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511135538.522653-3-pierre.gondois@arm.com>

On 11-05-26, 15:55, Pierre Gondois wrote:
> Some drivers set policy->min/max in their .init() callback.
> cpufreq_set_policy() will ultimately override them through:
> cpufreq_policy_online()
> \-cpufreq_init_policy()
>   \-cpufreq_set_policy()
>     \-/* Set policy->min/max */
> Thus the policy min/max values provided are only temporary.
> 
> There is an exception if CPUFREQ_NEED_INITIAL_FREQ_CHECK is set and:
> cpufreq_policy_online()
> \-__cpufreq_driver_target()
>   \-cpufreq_driver->target()
> 
> To prepare for a following patch that will remove all
> policy->min/max initialization in the driver .init() callback
> if the min/max value is equal to the cpuinfo.min/max_freq,
> set a default policy->min/max value for all drivers.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/cpufreq/cpufreq.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 034603c2af325..9e2d9d3fc5351 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1401,6 +1401,13 @@ static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
>  {
>  	int ret;
>  
> +	/*
> +	 * If the driver didn't set policy->min/max, set them as
> +	 * they are used to clamp frequency requests.
> +	 */
> +	policy->min = policy->min ? policy->min : policy->cpuinfo.min_freq;
> +	policy->max = policy->max ? policy->max : policy->cpuinfo.max_freq;
> +

This has nothing to do with qos-init, we should do it along with:

        cpumask_copy(policy->related_cpus, policy->cpus);

in cpufreq_policy_online().

-- 
viresh
