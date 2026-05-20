Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06A23B38AA
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271416; cv=none; b=TkK8NvHJi521zzmpssVI+bQaqKeGpKPy0MVvd5A4kxB0K84n6ZrWHwakHH83/H8rZyAY1EjoKPhWlV72XKaBmDlpnuxNUobUGqJlnAc4oTy+Xlgz24Fd0gJP9ufi4GXkF8kIxhRT7FhdwFZIsTuiifsb+Pvi2/3jv3N6INONCfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271416; c=relaxed/simple;
	bh=s5McUWYOgOEZHXnOSdmZAt9SCtkvJ7QTUrnHapV5HX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bunKfdk1vHmpug96r/vKnTUCwWBWnvUOoxgxRYHzne6DlK+y9jRaHWDujNH1SI856U03jpD65EEG0a00cQJh9tEitTd6s+Hn/pjdeXWBkEV3dVFxt05JUGRF40Is5ztLXdiAaDCX2ZUZ6MsJW2dYUKhulAvbtHN5osmlGcytl5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vA94rOgQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vA94rOgQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2baef9f5ecdso36993605ad.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779271412; x=1779876212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFK+VIX63/Lj3V2FSQmTOiB37XpHBdZ9pdoCzsYziaQ=;
        b=vA94rOgQr6ttirgCzB3CsEp2xWWRP+dEzWK+64kz29cDLgHri8iuB1a7XAedib1bW6
         5ueKUchFSQrk5HORvGi31OP7rtlMzB3gK612NYCUUyucEpZkaOyNOgiHh152nrmL2tVt
         eeKyL6TxHW06oMTW4YAJMGTcMmamfa72G/XliNBC4ufQoBaDulI+qzbE7SmDTaQRRfw+
         BQ0y2Y2eZ2/UH5iUoNnjGq+vEN1lMqSxP79q6OD8+xXU/QjKNAjeo/YnUMkKXjo2Z0Fe
         3gRt93WTh4buNwWpvbdQ2C/OL5Y4/ZOXDS2wvhnjQV7zyBvsVWzjNJ/6IqQWXsghHQBK
         X0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271412; x=1779876212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFK+VIX63/Lj3V2FSQmTOiB37XpHBdZ9pdoCzsYziaQ=;
        b=Iu4vZdesud16XB9jgfpK5NUZXxuCKSb0WLCEIUmJEJL9w6hkAG3OoinaVkemRn+q9q
         UXkqFPNqoiDZECaKMl/ZvkHyJADDeojED21dEb/GNXdRfck9KZFJrl1sU5a1AHhrDAVE
         sVmivJDKUPjqwo8aFB6/xy6Axp1xMwlGqQB84R1GHZDfbQr4+RM4tGYBb85pdm+L2pXS
         3TgSf7fFMg78VOAX9wyG99D6eOUS01B0FVJRae1HBaXGJEXNldbwolwkIhZ8a6T3COZ/
         pasVnA7AWCMK/HmY+qY0zyjEpkpTlL6z0GmsA+45KB0Cbvj8MmWP88yHvVUJx9otW3Tl
         SzXw==
X-Forwarded-Encrypted: i=1; AFNElJ/pEyQsthyZ78JIALRaC4m37QDM6OAEprBCKY4jLrC8VHAWoUeX1OXc3m7fytDm0R7RbgSX6oSH8Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TonkSz4zU0p9D343wC1uGjLbRQU55qRGljvIw6PSio5woqCT
	imoiv1BeihyUdLHgaVJzeJ84bDgRYsen6KGibexJx2HJsR3zSonFRNuVWT1jposqm7k=
X-Gm-Gg: Acq92OGYY9cObkekGCIv3DMgO7Yh5xM/YENPODa66Fi4ZCONJAprdj0Gb2QrKwef32X
	QfAtLCSQTRCDMnHHNz6g2oqnS5ngomOGRhLwYLGYLFasXEb1aczW1vkbUuxXMPGoVEkMufnLtXZ
	+7eNMXv5UBIsgcxiMtNS8pZ7TS3aVV+72YeBWYEJMA+AeABhRlLSilvTdGClIkj9hDw8Tz2oltc
	dg3UQVFujidEfUznxoBTSTfV0h90aeFPuPjxCD3QT9ZuABsyDDCxUnx3xvh9hkXmovo1XP5sQ9c
	nZApBrWxFlqGMADGlNp2H08ZFP27lsG05ZJAg/lniphyhofQoI6kiHrXznABTpSb98BiZHg3jjj
	MYRApKbYVT/A//TMCJW5rU5JBtpegSt1Wlxdb1oNNM4zYYqRwBgew59O2JsLzIyWjOXU4fUf1Ei
	WxR7rDevB9UOvTs+rXQdS0ojYmcr1RE5NBDQ==
X-Received: by 2002:a17:903:8c4:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2bd8fc01303mr231463085ad.5.1779271412411;
        Wed, 20 May 2026 03:03:32 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217826775ad.47.2026.05.20.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:03:31 -0700 (PDT)
Date: Wed, 20 May 2026 15:33:28 +0530
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
Subject: Re: [PATCH v2 4/4] cpufreq: Use policy->min/max init as QoS request
Message-ID: <bflxwyho5epheovbjnzlsvgvoitaqjbiv7kxcwbnoiz2nlmuvv@dtunrpupeyie>
References: <20260511135538.522653-1-pierre.gondois@arm.com>
 <20260511135538.522653-5-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511135538.522653-5-pierre.gondois@arm.com>

On 11-05-26, 15:55, Pierre Gondois wrote:
> @@ -1399,8 +1399,16 @@ static void cpufreq_policy_free(struct cpufreq_policy *policy)
>  
>  static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
>  {
> +	unsigned int min_freq, max_freq;
>  	int ret;
>  
> +	/* Use policy->min/max set by the driver as QoS requests. */
> +	min_freq = max(FREQ_QOS_MIN_DEFAULT_VALUE, policy->min);
> +	if (policy->max)
> +		max_freq = min(FREQ_QOS_MAX_DEFAULT_VALUE, policy->max);
> +	else
> +		max_freq = FREQ_QOS_MAX_DEFAULT_VALUE;
> +

Why is this required to be done before setting policy->min/max ? And
so I don't think patch 1/4 is required at all.

>  	/*
>  	 * If the driver didn't set policy->min/max, set them as
>  	 * they are used to clamp frequency requests.
> @@ -1418,12 +1426,12 @@ static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
>  	}
>  
>  	ret = freq_qos_add_request(&policy->constraints, &policy->min_freq_req,
> -				   FREQ_QOS_MIN, FREQ_QOS_MIN_DEFAULT_VALUE);
> +				   FREQ_QOS_MIN, min_freq);
>  	if (ret < 0)
>  		return ret;
>  
>  	ret = freq_qos_add_request(&policy->constraints, &policy->max_freq_req,
> -				   FREQ_QOS_MAX, FREQ_QOS_MAX_DEFAULT_VALUE);
> +				   FREQ_QOS_MAX, max_freq);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.43.0

-- 
viresh
