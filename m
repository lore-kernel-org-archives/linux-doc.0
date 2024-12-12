Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB6C18787A
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733986265; cv=none; b=kXOqt5ux8P1m8dJbF0+h9+50kosu/letdhjb+hHAwMM3G+DPlaACiDsf/mw/HH5CQei2Civz+vOjHSHatFp6WboV8pPsScLc/ZrRPCEyEcavEZ5BYsaPwI2w9u6lbMJpCpe4HA/X9OkwergSiDRgbBygcaWQnZnk5SNvmljJa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733986265; c=relaxed/simple;
	bh=J5qTMehS3VZ62nZjN03LGp8GqaYD+XZuK6SdZqnwox4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAQGq7fNBwwsVeST9OplNfaYfjAjaDX3V/hArVtmcKX0PjQVkZBw7gvZ7VCurPSqt3r3YL0gVEE6IzSibuKMr6AXkI13E9VH9M84NEpTGtp1TXNbrBevmQwjWkZEo+Dt96riEDPdwVChiGTHn9qnEcd8LC9iZsFV41fPTYcCE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXFnks2q; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXFnks2q"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso220349b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 22:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733986263; x=1734591063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzE1O+wEcFJCWBuWQepSclrHJZ9pm/tyRfOt1u5cgLg=;
        b=AXFnks2qbV0MiA1bgTfCHENGufngpialPoAEaehB+J9DhSOEay/ENWfonPAaEAvk+Q
         VIhF/XgdWHCTr/WZlEdWzxDWKhFttJsL+GvOZKfrWPIJKbJMZSFqEi8hQv/Q0QM5cWgp
         l6UboFp5y7MddO6KU0x/pqrS3qQxpY7oehPbWTnmkCtvGacseg52O74GKjSnUXdfiSPs
         IwDDZl67d3j9U1/PXG+Yal7ZgN5tdfcv5ZOOOTNCVwnRsqlnaFZPeZoa//igP8MFRguF
         Hzr1zOsLycE43CquhBsGJkCcAB1Y4sZXXEtbHWL/17eFINWJe6U1+eMDLlFBw6M3g4f1
         G87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986263; x=1734591063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzE1O+wEcFJCWBuWQepSclrHJZ9pm/tyRfOt1u5cgLg=;
        b=vGrvEbCZz28RyiVYiaiPCPqcB7xLKDGNvGlUcZg44RT+PQZKWX8KFfFJlm0/OdVlEI
         t1BquCicJRIv7bzGp+FZaPwvO7kS0zTx8W84ThDvVdIn6NPCzdg3Q+LG21oKuVt/AJW0
         yAAGwW0Ia9pJaxpD9RcpGf3BbdgKnTUjA9eQmu8m05GMj1WpA4K+NyuXWSiqtM7r+GVt
         0SLRg8VexBbUPpQV3SA0m6MNNfY756vEnB5+2iJYQHDbZa94RWtbkS93lR7XRYAdPpV6
         cQN+MgvUaJgGVnji6cTTpReLDE4X0H/15TuumXvC2PDPIogg9XjBPFmPfOBTxo3BFlSB
         e7jA==
X-Forwarded-Encrypted: i=1; AJvYcCU77f/2SzUyzqvev165+j7pcHUzvT/Vh1pcMTLSHd/QJEQhYjwsRR/Tm0s9P7LSqLuaE4oFEuRf/j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQr6vlK/H7RfcnlCXjzJHcnMNlHC3iETX5yP5w0WaDqpgW49o
	yYNyoKGME/r1tudCUEIRkk7p6BMBdbPdLabKw++J6Nc85OWQiFpMSJc/846jBlQ=
X-Gm-Gg: ASbGnctU2nExhSI9iijW+lTZSx6HzgEnyZwR+kZxyhIWXQpoOL2s53e1t2YV3TmcEL/
	fqy+ocMrkZACYkilvoyd1AfMxFrI+wKjuEo/iIiEOBn+u1LBLWB1rige9QyU8lys7HIcKxxOBSh
	b3xi7tjzUG/3znE+K20GHVdUmsfAhZ4zJMGMzUIJR1oI79jtFEAy+HiPRJH8l5DdAwxWvVguUUp
	7qTtxvRzmGj368JD5YPAI61FVfRNIC7M87aH5p6ZkvQGHIHuMGrW/SKNtY=
X-Google-Smtp-Source: AGHT+IFE78oKDXfbnWAKipxIsGcsj9ziBXqvMJZisKuD8EuJoQLV1Ku/T9xLrtjkJtyJVpTFpdinxQ==
X-Received: by 2002:a05:6a00:9aa:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-728faa1ce63mr3316269b3a.14.1733986263004;
        Wed, 11 Dec 2024 22:51:03 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e82197e4sm7131155b3a.72.2024.12.11.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:51:02 -0800 (PST)
Date: Thu, 12 Dec 2024 12:21:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206135600.4083965-2-beata.michalska@arm.com>

On 06-12-24, 13:55, Beata Michalska wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 04fc786dd2c0..70df2a24437b 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -747,9 +747,14 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
>  show_one(scaling_min_freq, min);
>  show_one(scaling_max_freq, max);
>  
> -__weak unsigned int arch_freq_get_on_cpu(int cpu)
> +__weak int arch_freq_get_on_cpu(int cpu)
>  {
> -	return 0;
> +	return -EOPNOTSUPP;

I did suggest not doing this as it may not be acceptable.

https://lore.kernel.org/all/CAKohpokFUpQyHYO017kOn-Jbt0CFZ1GuxoG3N-fenWJ_poW=4Q@mail.gmail.com/

-- 
viresh
