Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205C335504B
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858322; cv=none; b=aVRISNRjF/ldrBbWGKcXFFCO0kVecwtpbnIEIVTrY7LnSIl2wXoNqyfehNTjOuOrPtBc0t7KRhhBKS5+ndfLn4ln5JteXYnqe05jZ4k9vWUS2nDOq8idN4b6QZZUrW1LurWYiBGZcoyuxOd8UT958waw48j5m5eA3w2OK5FdsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858322; c=relaxed/simple;
	bh=m6qWbR+1BOc5g/YUkO6gL6vx0ximRu5ja0IB00oIB0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdWQlTFBP0nPK6dDIw0BTkjdDrbebrs7+K3jeDh2edFeOlhcP0+SHwVa1X2Ksbkb8B+m276JWmC8n4BRi/Ens0deo0Mx9MAIW0MpksWsnHGcvLXooi4vbs4+Br/0aGwj9FS3lgeIvKM1QSk/WY708WTydxyR0FC4j7/2Y7Gi1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ier0bqY4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ier0bqY4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1929916f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 02:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762858318; x=1763463118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4fv3AqTrlyRPmxlWB1ltGRDPoMxkylJndccFFj9vmU=;
        b=ier0bqY4y+RoD0OaNwkAWLgWuSC2uFSSOkTQfQsYfQ2ruONR4dtT2K53RqfkxYFcxr
         oaLUAPg8rBbgqkpfN7QzzpYhMD/hF9dcmEx34NBHm8PytOhZnu3kFP3/ztqlIY3dcY6Q
         YsrA4dnQ5znrLze/0Q1fpqCaWY0/FE/W7vo/B/qYUUBNVbi5HiEBJyamdt9zpW8UJK90
         G+AQP0GrC3frGjFx/ud3OTwQwVGeOf3gxI9tlIuD388EzqxdhtjtWrK041tdPjJhrSl5
         V44aYDSnHv4dO4p9gtBP5zKZg2TzmapjKQr24OA/YYrdPx8OZhAjeGKQGe27z6xa77Uq
         7ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858318; x=1763463118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4fv3AqTrlyRPmxlWB1ltGRDPoMxkylJndccFFj9vmU=;
        b=qQxYutUtWawZswoL01YQJLFEbxBSkAWvqBSSGADM75pDugqCysnVuPgXxTj4Hj5A9T
         qONFszBDittjSQnOlC/J0ipzw+WbywMvQQtn0H7zqosGhJ+tEH506H8mTQRfVXSvKo4o
         Gcdd61j84U4HRkEi2DHoGUWFqmILfQNQIj7p2A7YeYtfZx080JUjQIQ8Yx2DIdtpWbrP
         3iDSLc6nTE6MynQAq1QkamoRbsNXl9Da7eAOYq6FdN32obgtAh7drHQACn05Zpc91zrV
         sgmAXh4rxhnpdpFbG3jIE5T5a2GTrocNC+wCF2uML6DNCn8MTR9sTizrf2xue6zy6wih
         PP0w==
X-Forwarded-Encrypted: i=1; AJvYcCW/3krj14Vg31AwLlNXYpuks5bHTeb/KX/z6dIbtHKg8FVbvx2EGCAPJjhhSqbHeWSAfucYTDL6mmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxGYE0Ag6FeeYeo2+2dk7wjxI+rSaiB6XfLaJGy9fMANHjBxy
	zjTY/d/C1FMCa46G3Y9QIT7DLBhQE6eHo8/Jh2n4Qner3spvj3yva/uDhoHnCfaYmi8=
X-Gm-Gg: ASbGncsn26pWl87oavLBxXes/Y6HjQq6rZM5jbCuOAOWXd0yyDtibo4nVW8qVXkCTTb
	8TznBxYkTU0aW0SVD8IEXbSTWDem+275JghtophMcKEgMshnJlVkDsUL+MxNrrFR+LkXkFzwfOD
	AyzYLn+waQPXQqPQenMjtfNs77q7Oj4ziasZaZeAmdvZTSZJaHANmqauVnYuyaUoiZS4qh7r+iK
	qq8YdnJfbWXP5t7O9lOtTgAuOZe/juTwoxMhfTTe846EVJSFEYpbjIKvcUg4dPKurTaqKN3AR8D
	jRozrxzaCk/E5lmLFkw+3fWheRSJ3ZBhZKuTaYl2UxOTp98oTCj9wchZJsNhX3KYzgVjgWD/XgM
	NkKFugSYD+YQraM6GBRyK0LMtnOcDj5HH7AnS0gJdwrARSg7/EWCu46E20/HJ9FUv24cB6047oQ
	ROPVIW0g==
X-Google-Smtp-Source: AGHT+IHhoshuEgKwX8/Ru0TwidruwNS7pASY+Vm/EhvoTXpz7woWAzVfFchx4yQuMVjUwDXm+8FRJQ==
X-Received: by 2002:a5d:5d87:0:b0:42b:4069:428b with SMTP id ffacd0b85a97d-42b4069458cmr4219569f8f.51.1762858318427;
        Tue, 11 Nov 2025 02:51:58 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b316775f2sm17429537f8f.16.2025.11.11.02.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:51:58 -0800 (PST)
Message-ID: <8078e440-e97c-425c-b046-987b642640f7@linaro.org>
Date: Tue, 11 Nov 2025 10:51:56 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] perf: arm_spe: Add support for filtering on data
 source
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
 <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
 <20251110154827.GA278048@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251110154827.GA278048@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/11/2025 3:48 pm, Peter Zijlstra wrote:
> On Wed, Oct 29, 2025 at 03:46:02PM +0000, James Clark wrote:
>> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
>> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
>> when any of the filter bits are set.
>>
>> Each bit maps to data sources 0-63 described by bits[0:5] in the data
>> source packet (although the full range of data source is 16 bits so
>> higher value data sources can't be filtered on). The filter is an OR of
>> all the bits, so for example clearing bits 0 and 3 only includes packets
>> from data sources 0 OR 3.
>>
>> Invert the filter given by userspace so that the default value of 0 is
>> equivalent to including all values (no filtering). This allows us to
>> skip adding a new format bit to enable filtering and still support
>> excluding all data sources which would have been a filter value of 0 if
>> not for the inversion.
> 
> So from that I'm reading the config4 field will only have like 16 bits,

The _data source_ is 16 bits, but the _data source filter_ is 64 bits.

> but here:
> 
>> +#define ATTR_CFG_FLD_inv_data_src_filter_CFG	config4	/* inverse of PMSDSFR_EL1 */
>> +#define ATTR_CFG_FLD_inv_data_src_filter_LO	0
>> +#define ATTR_CFG_FLD_inv_data_src_filter_HI	63
> 
> you claim all 64 bits.
> 
> Also, afaict:
> 
>    #define ATTR_CFG_FLD_min_latency_CFG            config2 /* PMSLATFR_EL1.MINLAT */
>    #define ATTR_CFG_FLD_min_latency_LO             0
>    #define ATTR_CFG_FLD_min_latency_HI             11
> 
> Still has more than 16 bits left.
> 
> 
> So why exactly are we needing config4? Can we please get a more solid
> argument?

Each filter bit position maps onto one numerical data source value. The 
16 bit field in the data source packet gives us possible data sources 
from 0 - 65535. The 64 bits of the filter allow us to filter on a subset 
of data sources (0 - 63), but that uses all 64 bits of the filter with 
one bit used for each source.

I think you are assuming the data source filter can only filter on a 
single value as if it was interpreted numerically, rather than bitwise? 
But it's actually interpreted as a separate filter for each bit, which 
allows the OR semantics that are described in the commit message.

It might be clearer if I add a few more words to differentiate "data 
source" and "filter":

   Each bit of the 64 bit filter maps to data sources 0-63 described by
   bits[0:5] in the data source packet (although the full range of data
   source is 16 bits so higher value data sources can't be filtered on).
   The filter is an OR of all the filter bits, so for example clearing
   filter bits 0 and 3 only includes packets from data sources 0 OR 3.

