Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132E25A647
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738869; cv=none; b=EY6ZIyNGL02GhyFKJg5XxAmpXbX+1cpMImNOnZtX407MelCDyGYjgkRStUfRK2VXc2KdkEphzHYB2UriD57k1Lxt+iuvfogE7B6b+HnSkWJf7tDJOPQbKyCVYr+6J83C5fENEZcpDD9SUUTx7RBa/yLC2fHMOVvSeX1DlgSnXok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738869; c=relaxed/simple;
	bh=aD/NIW5FUnM9KNWUYbfUMGjaLngniGnrcJF+wI6pOuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLMU/q4Sglv8/CS5YzBIu2dacbqIl7tMFDAS3Q5aOGUVDOn2yeLjvDvvJVbxJPMR1IG62YXJcSuWlYFjCIc5xJ35kcrTT2VczMH4eFc4KnaZ4rLHZ0jpzRl7qGPXV1juj/J7Rb3B103mQszgjemgy1XjPSBGE6DGBivP7y9Cijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dO+s0RYT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dO+s0RYT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9bd7c480eso3062986a91.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 23:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738738867; x=1739343667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=;
        b=dO+s0RYTJNP9wUMtR0QLLgc1OOesLMB2lodX4zejPIG+1W0oaKf6PxlmH2Y7Z4aNkk
         dCtQN+rhskNJ5H3XavcjRGrKbTAlHfah7vTjJvR/GY6tJIokskLNNgvdK4ZTiMiIYbej
         SR6D4VX7vxhV4XRuuaTlOVqhjMgv5M7cVj09l0Xzwyd/9L4E7mQ+ZkTZ2fvBN0QkmyfY
         KTWbasf1vWJjul3l5GNekOc6VwsiSLKN91bD0GB25DdhC9My+Hem5V5gtasIJXY/LE/4
         Q1bmeqAf/aPKbLlkwr0uqcs9oDHKjE+TUfgqrqeUy8Xk6R8zJw412rp/GCv+U3Sua2bq
         kMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738867; x=1739343667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=;
        b=VPuQp7mgGB4YStUSil4E3JbfGqhGm1ZYAkh8HdTWa3a6aiNvrDDAMe9H952cFU5G1F
         j7+IaWYD7d7HumrUyV1/buXIRUmMNn5bEEw5ywU006hobQG00TraUAuTRMaU0RmW29Sg
         E9lXMhHgaYWkWwKKlJaAJz3LWf9Zlxhv7ppWK5Mn83UzuVBGo0ad5i08UX0HMX32SyXZ
         8zKrpc3NC9fXX8zJxbkgqMuFo7l2d3S3/EApeuZA/zotEYtDi7GqYH2NS4TAQnkMKbLZ
         M9smvu+n+CBCcViAyZ/2Ttzd48iLI3a+RgmDIxA7KPkw60/lmjvSY7olP1HwIqUBWR9X
         oqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn6kneOwfEgAQzOLo/0brHSOdUY7dy2iyymAttTfPK6xU4bGLHdJj8REWrcDPJVsVKIBziHZi6ejE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvfWbFQj6R8uDynMS7oSh/xX57YOD5D+wxehnQDFmo9oD6YNd
	ZKCh12k4XD+gfNfA0NlayawYkXA0vF7rl7XRFJFJjoo0zrFeIwpl8fZahVM0otg=
X-Gm-Gg: ASbGncuAP0buKycO23E5KIOqc+HNVwoez7Nek5ECO9O9uha82aO2CDIUaMPYQJoSJG8
	v3QZqyVJrb/38FRLx82YfSGYi/jnX1tiFKN3efmb0k7YHX56G7N+mdRJA4B7YdQrhcpOaDSZYET
	o2EyATKsJGaoZu8wCKMiW/GFtINMVQdpAgcKz0ugKcIEdsHBPDeiT2HlEnSsXCZuLDRFwUj9v0P
	qVxkLQkWupsRdytOYwQ4joSkv3SD0eTbCymi/3bfhBGW8oaDj/SbDs40eoRHf/QRPcn08oVaQ3c
	61XbSZ5oT7icUyvGsg==
X-Google-Smtp-Source: AGHT+IEu7fqxtK7w5SoEhI6cbco/xUvu7X3eM4no2kX0m2LQwZj0KIS55DISe84WBXdk8tWZ91sBcg==
X-Received: by 2002:a17:90b:38c3:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f9e0792de0mr2925113a91.15.1738738866797;
        Tue, 04 Feb 2025 23:01:06 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1e4253bsm762453a91.49.2025.02.04.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:01:06 -0800 (PST)
Date: Wed, 5 Feb 2025 12:31:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250205070104.6k4n3zcyuki366am@vireshk-i7>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131162439.3843071-3-beata.michalska@arm.com>

On 31-01-25, 16:24, Beata Michalska wrote:
> Currently the CPUFreq core exposes two sysfs attributes that can be used
> to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> and scaling_cur_freq. Both provide slightly different view on the
> subject and they do come with their own drawbacks.
> 
> cpuinfo_cur_freq provides higher precision though at a cost of being
> rather expensive. Moreover, the information retrieved via this attribute
> is somewhat short lived as frequency can change at any point of time
> making it difficult to reason from.
> 
> scaling_cur_freq, on the other hand, tends to be less accurate but then
> the actual level of precision (and source of information) varies between
> architectures making it a bit ambiguous.
> 
> The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> distinct interface, exposing an average frequency of a given CPU(s), as
> reported by the hardware, over a time frame spanning no more than a few
> milliseconds. As it requires appropriate hardware support, this
> interface is optional.
> 
> Note that under the hood, the new attribute relies on the information
> provided by arch_freq_get_on_cpu, which, up to this point, has been
> feeding data for scaling_cur_freq attribute, being the source of
> ambiguity when it comes to interpretation. This has been amended by
> restoring the intended behavior for scaling_cur_freq, with a new
> dedicated config option to maintain status quo for those, who may need
> it.
> 
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: Dave Hansen <dave.hansen@linux.intel.com>
> CC: H. Peter Anvin <hpa@zytor.com>
> CC: Phil Auld <pauld@redhat.com>
> CC: x86@kernel.org
> CC: linux-doc@vger.kernel.org
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
