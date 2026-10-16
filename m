Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D214B1269
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156484; cv=none; b=tuJRSUzFprjn8FVQePHIWvmzS9h4f6JpMYqaRTcgaKR1qeJ1k/FGBUqZog5aPQRRjNogjjJdQk3uh8GlA4hShv1H17foMFZ3dHT40pklqYhtUBwF9tfWvk0+HV8de2mVQSsCV7SIm+pISZuxIdX+r1JZ+vw7gaSRaWYuGItbFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156484; c=relaxed/simple;
	bh=/NqlYCkwEDnx+3z9fm1ChPu+6B52abvScuA7rF51W+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSuucnTFM064w3ay/FSMmqBj8EUylEyOsxHv/tWfZil2wFH/M+A3yOvzIKBhMV6Jp8Yk5r0+XGCZCP2IC/XD88h8h00qw+aAZrqWQ7atkstZKiK4lGroYL2y2K2/bu2RXwaS+YLeTpC6dlAFhdShEp8uMiHxD/RUChHnKLQIUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVkxGAv3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVkxGAv3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso30037075e9.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792156476; x=1792761276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=;
        b=lVkxGAv3KRfnAswDLSd36aWmt0Bju6YzWZE6WRaoancEPy0fPAVpUXdazP+b3GqMgS
         u+jKQL+gPzPyrgCf4YaaYOfe2Ls/cBqdAK2KuSTdLB+gd395A21Uhae8RMzoAMsOTaSx
         cBxDkYE9w14L47pLFweQ6EwQQv0f+sbsZvI0g6jB5N5P1ce8KJ1Lu73gEQAqSI1ytg2G
         vgqSbVy1y6dKs0pQ01eqcbgDY31nfaeiTKAfobT9p8P8FgCMrEXdcegWlGJkf7OkHQWz
         btp7PkDxoLQTbNtFBZGO2kH1a865jQsqoB+Ikj6p1nKAwxIGD7+6sWroBETIIg8nAtS6
         P6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156476; x=1792761276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=;
        b=L/AYQCNx26kbnrMKGQa0iJ858sHygxwfjGdbWWD5MNlKKzeOe8O+4Z0Lbgk242QX4j
         vEemsuVKaCPVNClPLL43uuPi84GQYKwVC2ce2L3UNy8AT5dVipUzw0OGO3HUol5/arwa
         yH/YUu6opt+Yl2p4L/CVYyJa36uJ1hTpfqHxwm3QMd/tf0WFnMpNVOKW1Shgeq+HUHTl
         lwk6ImAUfxwPceDFaho9adjhFrm/m5/FftmzfpGeB+p5bmkF8F8ygDo7+hox/r6Yh+Pt
         g04Fy8RiAj3ATw2/pk8qsWon5knWQkfV1Ymx1a6IaU/zQ9tuVVXaszP1tQVmVH8xAxMb
         lWBw==
X-Forwarded-Encrypted: i=1; AKwUvBxTvXy3MBuT64sRkOjeWY6/MIk95kDaTHOQ7bpDi6z19Ewiof47iblLBFa8BjINvY5U2MO8GgQgO8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqKgrkilBZ1dnoz8j0OyJTT5Znaso7dHTJ919+9UtaX1HUqqEX
	bXv45ZrfEc9koifOSlN5VhcEAz33k1WvyAmNXX+b8khvWQyG/4sQ85RQDrCCpjtJ7wU=
X-Gm-Gg: AYBFou3QnGULFiEQWTLRs+WwPVIM/Ty5dIJXVCXhMu8OiX1n0gaznwXJF1o4rRiqIrr
	DDjEVmnnxVMcnb3HSeqqiKZ51nt0TS8G0WyDb0+OrRuKqHrZF9TfQsa4p4y/Rc0+bsPHLnl574d
	F3/7/KaaVLiMywRB1YMDBioqwgOueAq9Fw9kI21rN4c76FumiHCDPoIiXJ6B6C+Dxo58ZuEj/3E
	w3alx4+l3A4oxGcOWeMJQgjlO0hBlgrsEEaIjYaqeFxhbw+yvIxmUXZg130ffuwrMyQO3ou44nQ
	HyA8yEuK4t3uwDrylrIVOgAe3+DtFyZpfBDh4txjF8erXBtrmfU6UyJpoBIugwA5LPteu0UvqrH
	8Chr2DVsHCRvhAWq3K9v/yftByr6YEo71pv7dudwPOV3B+rczK0hZFfS0mykc1x8LCvHEOVEvpo
	wPsCmk0AKy7jAuw7IFfvQI96QxOWjYbg0oSXZTdwhL8zPUookGhLaO1qfE3zVkvhM3FV8AgXB+J
	sQ=
X-Received: by 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr432306165e9.19.1792156474596;
        Fri, 16 Oct 2026 06:14:34 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ac4c70sm45400235e9.2.2026.10.16.06.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:14:34 -0700 (PDT)
Message-ID: <13ac34bc-fc8e-43b8-8976-05e91ae46e71@linaro.org>
Date: Fri, 16 Oct 2026 14:14:32 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/25] perf/core: Reject non-positive AUX snapshot sizes
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> The existing validation rejects negative copy errors but allows a zero
> return. In that case no AUX data was copied, but it is incorrectly
> passed to the alignment-padding check.
> 
> Reject zero together with negative errors before calculating the padding.
> This reports the invalid snapshot result and avoids treating a missing
> AUX payload as alignment padding.
> 
> Fixes: a4faf00d994c ("perf/aux: Allow using AUX data in perf samples")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index fe33fe15689d077e7f445c0b17d9c2e638c884a1..17355e4b8b7c6c106117153c9eb8509e6f9a41e3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8058,12 +8058,11 @@ static void perf_aux_sample_output(struct perf_event *event,
>   	size = perf_pmu_snapshot_aux(rb, sampler, handle, data->aux_size);
>   
>   	/*
> -	 * An error here means that perf_output_copy() failed (returned a
> -	 * non-zero surplus that it didn't copy), which in its current
> -	 * enlightened implementation is not possible. If that changes, we'd
> -	 * like to know.
> +	 * A negative return means that perf_output_copy() failed, while zero
> +	 * means that no AUX data was copied despite a non-zero request. Neither
> +	 * can be treated as alignment padding below.
>   	 */
> -	if (WARN_ON_ONCE(size < 0))
> +	if (WARN_ON_ONCE(size <= 0))
>   		goto out_put;
>   
>   	/*
> 

Reviewed-by: James Clark <james.clark@linaro.org>


