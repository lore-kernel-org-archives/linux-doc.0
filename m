Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96C306B01
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772182; cv=none; b=sCgaXEc68u49RFTwuAF2Qe4jm2BZqKLXn9HNpIpl8BfSOxQiKicwNI5XtMUohu0ZNZUfqkn1wapRq1CfLPJ39nYJgucdZ5EDh+K6ZnRdYZlt1dfLl8SGI7CdUKyf87D3FZ15P2j4LAnFQA4zqyjleH7d6iHjxGn4R5gRpcpoZ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772182; c=relaxed/simple;
	bh=dEl+crxWx0Ue6Eap9IyJQOsh+WWdfuIJZKBgNUUOskU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upFk7OASoo37nAmS0NEK7ndHjqfc/Z4JK9dWbWHQk71xM8g5JNwiXJvitCLCTXcSjA8Iq6F2aBxnuxjNENEufeLX+t0/drvOwCUA10j5OgH5Y5dcOLJnTc8DVAHFaUl4OoByQ/3nHrbf3BBCWn9SJmFcXLIh293+oJPfUUeXAes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKaBLUd8; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKaBLUd8"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bb7799edea8so456902a12.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772178; x=1763376978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HOTgQEUB8GcmpUQcmIkml8fFvXO2yWgEKzXQF7vCTcc=;
        b=gKaBLUd8yrvPVoLyJ80CXi/2i4l/MtEV6mMzBU+Z3JHKX6VOOOfpEhRPfPP8aXEGG2
         TUcf/VMxLyuXljSA+kw8vdEhmUvbjSYf6E7jMeKqHx+HRb9kL7LhIry6g0WMkUFe7x4+
         kRUdnLOR+EjcklQaG5iJ/fCBbmUbZLJy96sQZDrHS/cmCJPfPqJNlZzyt/ytOGIoMISw
         1Lir7UTb14vlK3asD6EnW+PeZmBiZiCNKY6gjsxcrEaX9B6kFcukVIMxH4TqeKLqjyuQ
         uEZNNfA9wkKrK0oKfqqA6g5mOeLXvfHGWgIxeSkkg/qkB+A6ExHOdwDy9v/KaL3/AnNo
         eoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772178; x=1763376978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOTgQEUB8GcmpUQcmIkml8fFvXO2yWgEKzXQF7vCTcc=;
        b=iZUmsoynVbz3LUOoPzLM6mAbV/JRJWgf2VKkUcfR9nuaSFmls5ECSMKYQYVzlji6CB
         rCFPOOOxwtkl8gCD1a3TjyBPcJMFr4qb5afgHigqUfZVLN8hq7CElVX9D8LF0RgVlYhT
         kkUfkO2Qs60xcLvOncSy7HNjU6D+dz7wtiGheY+aoOyCqPakAd1YpSsQvK0CQfQiNLUm
         wRq9XXtPcIB5WEjjgRwRR3iwsdAxh2eZDz/a+ROSIA4yQ8i/nwrCSzGE0ZcQi3HHowQ1
         Zg7ayP5pWcbQcNRS4NpNAgcsXaOKF9Fl4QYJhTzzGwYvVAt3D9EQXm3hHUAMfZNNgtD/
         qJYg==
X-Forwarded-Encrypted: i=1; AJvYcCVskMyvao/jgtsmiQV8fQEmd41nHRCMTqT/x9tOQosfXyYtf5dCQjO5V7oEpIJM4ucsaT5FC+3dLUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaFHViORprf/2DR7IVgE4Iqn8NuB6BBV2m8UTLComHcgc7tMcT
	q3iRlV4OJW6IalcR64f68qd+k+28xbBieKjSBIRC6jHibiYtprrs6NGu4LUKfAyozKw=
X-Gm-Gg: ASbGncuWbOVLEpF3R6xg9vW/RYjkqNj4qdbRiiY4NqoaXKvffPUkNhasyRxECgRgi6p
	RuNPfvQOYCWCvmC8K2Xkep4Rn17RgQVCsRoPjwuuuw7Vy8pjZ/68AcYoer/aGzxN6N808OgyOaR
	sUxW3JzOy3itpiZdFWCoW3ZwpBCWqPZ2D2awUzkDWbzajr33hp4OgVb0y3r/6h5Lc+cmN3JIcj1
	xrT+JUAcUJmTrfMmZ52KpiTz1Xd9wryFd15fVSjTtQrLjpdRMvRh4wTZhL8ltt8v45YsPVxtqEF
	rzbB9KijCIl3domatNHVJYcX4xPuBDB+t4xoC2636fEtrRr4EVPQdXrw/SvPfyce8rqw7bsenqw
	ZXnTKCNaScp1krVkC8+g7ffvmhrPRkNM4KIRkGjSLr636UoOwX/t2sny7WFY5e4bb18AWaaeDfz
	5oQiAJM5O4OOU=
X-Google-Smtp-Source: AGHT+IELCZjjS9db2GOOi5gG1D3fReIWK6Fsulo/YaMjMnn+TlgjP5Y2DF6HQCR7hzQBYtF9UG4Urg==
X-Received: by 2002:a17:902:d551:b0:27e:ec72:f6d with SMTP id d9443c01a7336-297e53e7af3mr99902655ad.11.1762772178225;
        Mon, 10 Nov 2025 02:56:18 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297fe688c96sm49938925ad.58.2025.11.10.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:56:17 -0800 (PST)
Date: Mon, 10 Nov 2025 16:26:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com, 
	corbet@lwn.net, pierre.gondois@arm.com, zhenglifeng1@huawei.com, 
	rdunlap@infradead.org, ray.huang@amd.com, gautham.shenoy@amd.com, 
	mario.limonciello@amd.com, perry.yuan@amd.com, ionela.voinescu@arm.com, 
	zhanjie9@hisilicon.com, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, nhartman@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v4 1/8] cpufreq: CPPC: Add generic helpers for sysfs
 show/store
Message-ID: <s5xt53i6c5wryje5x6zlq75r3lx6nxb7pat6umnghpnldi4p2h@jaeew4iimdd3>
References: <20251105113844.4086250-1-sumitg@nvidia.com>
 <20251105113844.4086250-2-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105113844.4086250-2-sumitg@nvidia.com>

On 05-11-25, 17:08, Sumit Gupta wrote:
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> -static ssize_t show_auto_act_window(struct cpufreq_policy *policy, char *buf)
> +static ssize_t cppc_cpufreq_sysfs_show_u64(unsigned int cpu, int (*get_func)(int, u64 *), char *buf)
>  {
>  	u64 val;
> -	int ret;
> -
> -	ret = cppc_get_auto_act_window(policy->cpu, &val);
> +	int ret = get_func(cpu, &val);

Why no casting required here, when you need it ... 

> -static ssize_t store_auto_act_window(struct cpufreq_policy *policy,
> -				     const char *buf, size_t count)
> +static ssize_t cppc_cpufreq_sysfs_store_u64(unsigned int cpu, int (*set_func)(int, u64),
> +					    const char *buf, size_t count)
>  {
> -	u64 usec;
> +	u64 val;
>  	int ret;
>  
> -	ret = kstrtou64(buf, 0, &usec);
> +	ret = kstrtou64(buf, 0, &val);
>  	if (ret)
>  		return ret;
>  
> -	ret = cppc_set_auto_act_window(policy->cpu, usec);
> -	if (ret)
> -		return ret;
> +	ret = set_func((int)cpu, val);

... here ?

-- 
viresh
