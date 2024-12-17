Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E614659D
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 04:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734409651; cv=none; b=p4RbJpEFJwfh2XR4kPdWKEwn2IjI+xjoQ+x9plBehhpJjFwqhfeVVqFWy60KD9Y+A45CX5mhSusRs416NRf5BRDI00WBC/NVjamOe6i3gtOIylPEV33AaUCK9RmA2SI18/9QjjGLoxVf1pRiokPQ/A/hY01u1n3c3B17Nm3o+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734409651; c=relaxed/simple;
	bh=KGf3WEZUTgWBNJDe2xew7TkgY4CxKh65T66dzPPcwMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5cZzWmC+HpE1dzslRyQIjlTgB1SXipX0fPILqgCvdW8/n9kNX0HVQNEHhAHkvJRUx5APR1BOZzJo/caic/YMO2NSHwEGKrDSWTkJ+ZNu2qVoRZpdaELk/I+Y5P2nNUZ5235GBCFwTRFX8HxFTokMzMCk8d6y/BQYTq8zskZOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GALa36JQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GALa36JQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso4376348a91.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 20:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734409649; x=1735014449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr3GeSntlHloZ4yayQx6BsNSKnwpryezH5Wr5AEdqz8=;
        b=GALa36JQf9P2udVWsBlKW83PFKRaM1xO+HG3eiFw7WlO1O0Wn4+oq8x6fbQKgDefNv
         XxQQYZxiuDM0ud9PEIyOF6SBGhx5QA/9M9nliQ5krmXOJnYGwDf34OlbAE6bAjXPbkzc
         3X9a7sbTgxbzGb40JBMlERxMGW80J9tLlm5b6M5q+cyd5favPWLXEvMwuztljLkaCn1T
         PSq2ANdZhssa/LoB+3FYIBteMGi/lV7uCeOX/UqnGprCPa7MHnJmDMBcI6vT60Fgftr6
         lsw6hky/0n3ikwns0s75tFAXnC+BwKbuA1AHHJ6nCWNtjIUM7rL4vGG9Odz+Yi5X/e0I
         nzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734409649; x=1735014449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr3GeSntlHloZ4yayQx6BsNSKnwpryezH5Wr5AEdqz8=;
        b=E1Suh1xRZfs6k6kEGi8iZt94xYscJSIn2w9wLusKRyzjGibyyBrkf1YFPuVxzyMrwB
         ez/noNwbdA7GQTdKlPLajomrJQeFvhA45m9EdrF1v2R6kAD1KsBtqa1i0HLnRnpxptm6
         GoQUDE1+pP4l4v/WVvOD60sFXwPpiD1BusMCpQO7DrgEkYO24puYta3LRRsGSJGVdLuQ
         m50VoX8tyj6naqIZAHDlaRo3R7hJttez2U1Uy7e7mStcwn3Tea3PkK8kb5WOzBAtJJLI
         5cfkI3afCWLtFwOsRfiX/RC9qYv3c1aUodnuPIwpdUD3PFLMcum3oV9DEQkKCeTCD6ls
         /yrw==
X-Forwarded-Encrypted: i=1; AJvYcCXO7KzC7CaNgSphYliBgu6GhzPE2AfKLLowm7iViRghEVzzLu7H2TDWZIg80fybNosDxJXPPzVmxtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7RWabFZwIUIjPEkAU4fEM4Vpr5LHvPXWWWsMLOoPAxDsNS2i
	Wv2zLQSh8F774+Mke1ZWhXiMMLT5QlV9chjkmm7BJ1QIRBCRSdC2nOy0yo4zx3o=
X-Gm-Gg: ASbGncspcTbrHOuWFw4cV8DiqVwqvycivJ9qQJ+mEA9eTzOIosmzsLQuZbopf1p9qqp
	f8Kb9Tyoa6L1C5UFpnXqR2hSekTN7tv2Jk6tEpblIGLW9lBb+Jo7i+9cRjZ73Lpu3j96L5yQPDC
	5iI97R6MeIH4oaRCzwjlqdxJNEzPiLN0mEBBdkcdXie5P90SAttEaLE31lXPI3ldY+zIZPpjw/l
	RPZG2JAuQJQu+DHhsTpx0/jLqntQUHrVBHiGD1fvXuRXh++ptUt8C7IQB4=
X-Google-Smtp-Source: AGHT+IE/JeMuR4dBQFhr2ewi062MYvFxM7gFUf/kYOjekW7K8q6et1llylqaVQeIxsiURZEwVjKeIQ==
X-Received: by 2002:a17:90b:2e48:b0:2ee:6736:8512 with SMTP id 98e67ed59e1d1-2f28fb6f983mr28756658a91.12.1734409649481;
        Mon, 16 Dec 2024 20:27:29 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d45sm9072765a91.11.2024.12.16.20.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 20:27:28 -0800 (PST)
Date: Tue, 17 Dec 2024 09:57:26 +0530
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
Message-ID: <20241217042726.isllh5bulpnwql7i@vireshk-i7>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
 <Z2CmcelSy89NULtz@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2CmcelSy89NULtz@arm.com>

On 16-12-24, 23:15, Beata Michalska wrote:
> My bad as I must have misinterpreted that message. Although I am not entirely
> sure why this might be unacceptable as it is not such uncommon approach to use
> signed int space to cover both: expected positive value as well as potential
> error code case failure.

This part is fine. The problem is with handling frequency here. Signed int can
capture up to 2 GHz of freq, where as unsigned int can capture up to 4 GHz and
so we would really like to keep it at 4 GHz..

Maybe we need to move to 64 bits for frequency at some point of time, but at
least we should try to not break it for now.

> Enabling the new attribute for all is an option, tough not entirely compelling
> one as exposing a feature that is known not to be supported seems bit
> counterintuitive. On the other hand using cpufreq driver flags won't help much
> as the support for the new attrib is platform-specific, not driver-specific.

-- 
viresh
