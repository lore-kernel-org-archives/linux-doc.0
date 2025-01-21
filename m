Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5FC1B87C2
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456839; cv=none; b=LiCQfJ28yIRq2CCIVUJdl1K7E2uU5OLGRZPJF1/HwpYXzBCXB7qKGPZzrQLw77cXUSvxSCuaIFBSGZt5wlejEss5FKq4F2b7HCqswyyqUiaEUoZLpAYUSncAPBt6phpi6M9ZJ02TEkxyNTSU93STLoO0flTU5hDSMBD1j2H7zIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456839; c=relaxed/simple;
	bh=0ynwDrtDkg1RPfVG987QiweEJhmx1Sy57xEmZffD17M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sf9Dq7cpOeCJ31XJi5Htie4z8SZbQczYC+HILwVlT/bqWhn/fdEwtSFPRdgV27fn5/7N1zt9OQOVyjlXkMsb4GMORXQ+9sOts1beJ875CQtjFnSnk/WACuz1BJjGQftpudKbgRrs1MKWuKo0houd+zqkyjzEQyZJrHhEPp++MbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHhxAHcE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHhxAHcE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2165448243fso117584465ad.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 02:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737456837; x=1738061637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENcOYGqRioU/9ihcSEEFfnUaDfvEIG5xAfpIwJ8DI8A=;
        b=mHhxAHcEvNSvxr3GKPuedsXvO/+WZfQnBwyK7ZP8uG8XulGcMVXxRQCL7bI2AYQ3yj
         pxRdtTHsYAYUZee8xP1xkkxMVigmLmeLfAIU9Y/p347jey6h8OA/Od17V0iZvxbtZicC
         tDF9aaAeQ6sJW/D9DjKQV8L77XnPpLzFvy+9gJ2MgvqhOJUgdBje7gicyno0CERWAQ6t
         +Ga7B0AARoJny0yUrbtKMx79Sa/hRyZ8HW3m6k/B1IRkvh4fYkioeBs2DusPTBEEkXjJ
         ab/+taNiM+Wn75oj3fexoP9p7aSGlffY+7CYC2hp5cj09O5StU8gP0EIHWsxIVm7qCl4
         DknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456837; x=1738061637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENcOYGqRioU/9ihcSEEFfnUaDfvEIG5xAfpIwJ8DI8A=;
        b=hjUrlPhIwf79l/2LzBwi2+VrpYa3kme/Q4a//XX/4MP87T1JTa/kGFGZ/pa4PsRtUZ
         SbuXFC+afoyOIcsSdhfDFuFyDXrfZyEpnK3rODyIuE8B2/zCwBJA4RCg0BvAbGx9+TX1
         lldnxpenoZj47ZML8PvfOuMrHa8ysiaRIwx3IsqVJH9Rd3gnF2rIdE6HeX/jObNZ6avK
         RKm6fQsp+B8rVrJDbFLsgFFhtxbtL5IaXpkqBzSmH/zH5Cb/6aO5VxAFdILmEZOKvh7r
         4MN/+cBXSKlvW4sqO/aV9Ho78c2sgpOi3vISxVut7Z+LZe/vEC1/tpExY+5vWX6S1joF
         ystA==
X-Forwarded-Encrypted: i=1; AJvYcCU3jkBuDb0oQBpW59Sp79JhIqfwBHCWwa3bXl5JgmBcB1hoboGqtmwt3GrQG5nSdsf/oBoiEOg3+KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9YtieyBaln2MHzN/F8Ylhoj/f1Nish9f71CmRZqw/saJVY8c
	VjrLJ/Vz1JJjWPtxOiNpIzcYg7Y+KFTNGQdPx/B2SMQ/D/BtmcPHYj4FYioQ47A=
X-Gm-Gg: ASbGncsf6RYHVf4lws7WNlcQDVst0rnjHheu/yM4YTyH4z0mnMD187+0mzNritBht/w
	OusFS/H3qCzZrTIUUOd8GQku6M44Vn8Kk2UTeXRTwe2kGljjZ2mOaSwHw+57dgUvl0AK18FxQHn
	fydoFrR3TIwLXiD+HsJMwgCVztFsZMd5EzJNmEzs0CHnL209d/ycebiNqfV1zeK6TGbSols/w9f
	HeMUtQXbjuMWd8SEVDFS/E2A3Vz9DFM1oxi1co+RqnPl6FTpS22NdXNgU/KHJK98DwGgiiq
X-Google-Smtp-Source: AGHT+IEuSER7ZHNDig6EsFOlbiWEGwJUjzQk6/UxpR2ZgEZDY1r5dRIoJzux0fIbg2I24q8x/2ZFgg==
X-Received: by 2002:a17:903:32c9:b0:216:46f4:7e3d with SMTP id d9443c01a7336-21c3550f34emr265771255ad.15.1737456837580;
        Tue, 21 Jan 2025 02:53:57 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb767asm75949395ad.84.2025.01.21.02.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:53:56 -0800 (PST)
Date: Tue, 21 Jan 2025 16:23:55 +0530
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
Subject: Re: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250121105355.sdrgmjv2w2256qfn@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121084435.2839280-3-beata.michalska@arm.com>

On 21-01-25, 08:44, Beata Michalska wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 6f45684483c4..b2a8efa83c98 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -733,12 +733,20 @@ __weak int arch_freq_get_on_cpu(int cpu)
>  	return -EOPNOTSUPP;
>  }
>  
>  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
>  {
>  	ssize_t ret;
>  	int freq;
>  
> -	freq = arch_freq_get_on_cpu(policy->cpu);
> +	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
> +		? arch_freq_get_on_cpu(policy->cpu)
> +		: 0;
> +
>  	if (freq > 0)
>  		ret = sysfs_emit(buf, "%u\n", freq);
>  	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)

Maybe this should be a separate commit ? And also I am not very happy
with the new kconfig option. I don't want others to use it as we want
to get rid of this for X86 too eventually. Making it a kconfig option
allows anyone to enable it and then depend on it without us knowing..

Rather just write it as "if (x86)", with a comment on what we plan to
do with it in few release cycles.

-- 
viresh
