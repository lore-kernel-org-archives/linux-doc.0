Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D0B1EFF9B
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807397; cv=none; b=WWAr/fKMRIjc1sgsrbdDrdEjFE1cc1up/M3Tf0lMKMvsGueagbZJlm3ARGJ/Qi5WsUsjD4HD/lPFdz5TXxOCs4oYZYQJPovXVi7TmuvAO+Oderbzb/H1ORbGoKWaZTZeIp3aVsDNTxjZrYM81pPwSFMbVpwfA6Kmejt39A0Vs30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807397; c=relaxed/simple;
	bh=sSqjP4cvcawLrblfY9/wyy/hyoTTAKgpnyDa32+hyZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXBawjXLXfDNltDlgRiN7XPe4kU2Mtpi8DViNkEwGVOfUVZXNCTD79RJ6cgr6wYx0FM33F+/ElIaQzKhowDpHOI/mwiqjkbx5IPFn3+G/WJ/BUnypKYIkx/XeM9mfPXYdUykusVWPW+O0VfqPqXSKmaWw76b33g0XAbGSf7WnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pNVcdayR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pNVcdayR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so681376f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758807393; x=1759412193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fx9sm2SG/XPK/zOHzWrJwHUPoT7scPpd+/H8+WI3Eu8=;
        b=pNVcdayR5oUrFeRDU0/+k/DMuwh1UJUitwxQmMWFRwZSDNsnTaJWymZtfYVKQrhkV6
         k9Dg9MQEKbDh9b69Mlxj+SgMSXAjFTzeNMiQtEjqTgiqyZFK1CIeKwi391y48eqAd1XX
         KBKW6cR4sRt2YNDrIAcyzvkWcUDp6Q5uJE5ZR9vxwgXFv9V5wLLWk04QRM3keo5OR+ZA
         AcBgkYL1uibz5EYT64nX75ZTqDx5zc9Rlqceuy6d8frJ9z4imWLf7KInh1uJ3KMaO1Ic
         L3yZMX9fPeTt9+L4aKZi1fse6voYFd6ApMJFlwX0JHdS0yTCstIQfLepl3qoTZct4rgc
         bzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807393; x=1759412193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fx9sm2SG/XPK/zOHzWrJwHUPoT7scPpd+/H8+WI3Eu8=;
        b=ECdlDLUJBEvci9jP+YPLibXBS7AXbPauYJxTnbSEe8Lay/BdNyf42QjQjvy8/Kf0H7
         UdLh7nZwMA+tR4s2QzVZMstUx1nh4nlO4ui0zgXr57m6Fth5VMi/2qe4ykYrpcLEO7Wt
         wNG/Ir0u0BgJvKBsuQdFe+LW7iYK3ibDElgt7VstQwuYIeULxVgX/h2V/D6JAipWbbbl
         Au04ZG/5kMSKBMStfey+7XVJUWfkXvM5wdnmOsjsmmzp/eZqqvYbEOcQWDu4VnNERGMB
         O0ACa84Tpyw+pYoS6Vu48VKdffyPzXKXD8rL4Io0ZcJUbYhyRBvNsCKZHiIg7Imw8yq4
         G+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUn8kOcsxEuAZnMJrp4mLK33/H8SsJTD9pPbXCVhE+ONKv8jmGC9umhyASyaSL+Av8KYAHhBc1tisY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5EGMTPIsAg/TzSITADpCMg3bGzAL2EfeKXSbrKXRus+RwLHa
	Pc54d5XNJ2LSnAuOKODdyrdhTSEP3s6GOu60UCWYxVvvlmU6Cgg1eU1JvENpirkhMfU=
X-Gm-Gg: ASbGncuy3susR9RG6E+p9sOxMQKGYFyrCSkgjhftAaku0+CXjyygAGz/Kyj0OJRbY2V
	8iduLzs6YP73r7+fLqoyw2z6guduUz/c68rVaQQT7TMnu8IbD829HNFT4Rd6Dio5uqyi8MjRzHL
	fhfvcPouFXNUUio0dfB4kjIXUWh3ceaSbT5fyneyqnHD9fgBH9lWEnUNnpMHhg+nH3bW+GOGS9N
	VekVjkVC/l/GrJx98pwyWUWqpOZwEYicMAq8ypYlq/mxxcfqKY5et1hJ/3fAZV6zMm0qmJ1tXRv
	12XogUb3S0m0K+xpAp7UBTfGJO+20jpLwjuUE1+yPZ4UA2vr/rGI79WnWIN1zM8/PuzcNCozlCn
	aqxuPvTwZ1zQ6uYNWKffgfeGmNIYx
X-Google-Smtp-Source: AGHT+IHR1VtsrqYdEOR5yfalGbybkOIcDKOqLqd1M8rHZFAAkkevuzTqFI72lGmxMsSzzCv1aIizeQ==
X-Received: by 2002:a05:6000:290b:b0:3ee:154e:4f9 with SMTP id ffacd0b85a97d-40e45a92e7emr3845371f8f.20.1758807392860;
        Thu, 25 Sep 2025 06:36:32 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb2eesm3203962f8f.12.2025.09.25.06.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:36:32 -0700 (PDT)
Message-ID: <4d5bf14a-0465-47b2-88c3-1bf85b008707@linaro.org>
Date: Thu, 25 Sep 2025 14:36:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/12] perf: Add perf_event_attr::config4
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
 <20250901-james-perf-feat_spe_eft-v8-8-2e2738f24559@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-8-2e2738f24559@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2025 1:40 pm, James Clark wrote:
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   include/uapi/linux/perf_event.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -382,6 +382,7 @@ enum perf_event_read_format {
>   #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
>   #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
>   #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
> +#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
>   
>   /*
>    * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +544,7 @@ struct perf_event_attr {
>   	__u64	sig_data;
>   
>   	__u64	config3; /* extension of config2 */
> +	__u64	config4; /* extension of config3 */
>   };
>   
>   /*
> 


Hi Peter,

Did you get a chance to look at this? Patches 1-7 have been taken, just 
waiting on an ack to take this config4 change before taking the 
remaining ones.

Thanks
James

