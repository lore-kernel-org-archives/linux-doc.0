Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA733AB5DC
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413875; cv=none; b=WuAsIPiFPSqaPMQqUWrH8BgC75xWIKJKFfEbHKmuCt4a183+bm5rVQerSEZOqF00NUmuNpCeQtWaALCVdRlK3/uCFn8bEsaisbWk0V01icyU9UgaL1JqcBbxkWGSqe4fr2WNDdahUJ53jMqCUgfvG9PyHjSUaVXKkMgbDKOVvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413875; c=relaxed/simple;
	bh=OQ8eav9Ux41+oRFB35TB1JhL91JkSCWggnqYSeogg2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSeA8GXcdgW5dDoa2gIT06EPFyZoaGGM/FrXsYif7VPjlVw7FYaA5tRiw0LA3HlLtGD1PZb0AxmEvpxp72HrAwup/S8nBOfkj+JHLjPXQlg6EipktD6TpyoNR/la1jGR71spxs0ApOAP/hfHY/B5HkRPtH5KTblMQ3M5rhvMhPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwthnpkU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwthnpkU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so97068366b.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792413871; x=1793018671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFqTDlj4awkfSbachY987XqpXNk4Iu67BWeqjiuV6NM=;
        b=UwthnpkUVgoNRi551eX+j85IPrcnZf5L6F6LgkXc8dqv3+O0vTljjjzpgTVMC73xFG
         Ze9XSkTKuhuGwLBWMfLfAZGS6mMP9IEJrp5sy0PAw+3OlD+Ks3H3jC6P5nkec5/5sgZJ
         xNuCo2Rv3YQUn7aRkJ/bTs1+5GkjPCuvWBEofBzfCIw6LRJOv3fZpiY8olnNxDuJL5SH
         y4LUSNg43RHF4RrY0apG+L+vEtAitXRs3QQv1EvIcbVjHW8cRT5SA/n7VbwU2InL/KKd
         I7Wuw6G8UWpDQOiKLVXCjfOy6VZ8CkswJrpqMI57QBpb+oKaY6n9ssz+L5uhw0G31Mc5
         08Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413871; x=1793018671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFqTDlj4awkfSbachY987XqpXNk4Iu67BWeqjiuV6NM=;
        b=zUSBzut4eh3/i+MrpYh+MXaPzFT6Metfzv+AnTQPVRF2L3wIidcwiucuIq17h6R6tC
         +tgzo4WA0o2jRqucKE3LDyg2IN8DA0ogjVyiyA9BgmKCHAollyoo6v9O4K+zLDOU7peR
         ylK1O3eQWnjEST/FOJfTK4ykILzGSdL4CsBjCmBY5LhvMm8XS2UiixOf7jWgQ84jqyl6
         vCov5p68nndKW5JBvHX1gHk9qh5r+OWGjjXtzHDycY34gG/9mNlTbdQ0IwSjvXrrEeLB
         wygYjFR0zLvLKBXOLE0CYK9pNUks0iKNDUTiyKQdCfZkBBmBAY6oFUbtTS96wsovpKIE
         P2EA==
X-Forwarded-Encrypted: i=1; AKwUvBzXt+jB5bNI4mBveb8HTRUNq5IzqBCLVoKIPuQgg49Ji5HMS7jaXUg9+5IrmgbEtmRvWa8HUT+7HZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXDmHbe9WcVE3kKNZOr8bcYfJ/2qAndntd0pSWkgkTDkjjnqBy
	d2ELH6BHHqsuGmHHut8W5kU4B6RSXUWCckAJ65Qd/4l4S3W6m/U3Jes8MRnY7LdajMo=
X-Gm-Gg: AYBFou0QU4dakPwmwEsW99vVvxvFBnEV/3U8OGOOfRzcd/h0NfSZDnJvc25n+N6plCj
	3z/I1QZBmr2hw5WEkq6jplVuQ6b1DVSzb8URGqihEVI5hN7f1Y0jzOQ/y/LGJyC7Z7Z7/TpPKEw
	VSIgurWbbvHfvUw/QKSHbblB0I0pgTsDQWF0GV7ID20dd5XU5TtPTF/6FbrnhVX1/bbZa+5F0yB
	H9x9nbsXJN9ckylNkRIC5oU8HJg7NgS78fDNAVZ1D8kRYtp03OJsCchJO0WqWCDF11fnp8lJD4h
	wbX7S6GAHhrb/Ywobf+s6BrhlyaJ8Cc8Id/mMBIxU6GvBJNZ8kl/I4WMioghW794n0HSEVGDtYq
	feLIZwP2iuUfs0/UagSZHXa6dIhBiaNPfpbtTi7+Y1WRB9JoZ44IO5CJORzXpg3Ci1IUslKyuDT
	Mc5pf76f3l0sakpi823PPTWzMNWwWgkbpse3hXdbgZZfhV/O7VfJtHazv0tvn0DO4suXRtounlm
	WU=
X-Received: by 2002:a17:906:9f86:b0:c40:560a:45e with SMTP id a640c23a62f3a-c419f416b79mr534320166b.35.1792413869576;
        Mon, 19 Oct 2026 05:44:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm362496166b.47.2026.10.19.05.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:44:28 -0700 (PDT)
Message-ID: <0aadf786-8c79-46c6-b6e1-d5a6caf30771@linaro.org>
Date: Mon, 19 Oct 2026 13:44:27 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/25] coresight: trbe: Handle an already disabled sink
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
 <20260915-arm_cs_support_aux_sample-v1-13-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-13-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> arm_trbe_disable() detaches the trace buffer and clears cpudata->buf. A
> subsequent disable dereferences this NULL pointer in the buffer consistency
> check before testing whether the sink is still in perf mode.
> 
> Check the mode before accessing the buffer and return success when the
> sink is already disabled. This allows deferred event cleanup to revisit a
> path that an AUX snapshot has already disabled after a failure.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8eb625d3fc99db57a18e35ef59ef814dacf20a09..6da89a890712d32e87a15f7c564ff4dc4d197bb1 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1098,11 +1098,15 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>   	struct trbe_buf *buf = cpudata->buf;
>   
> +	/* A failed AUX snapshot may have already disabled the sink. */
> +	if (cpudata->mode == CS_MODE_DISABLED)
> +		return 0;
> +	if (cpudata->mode != CS_MODE_PERF)
> +		return -EINVAL;
> +
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
>   	WARN_ON(cpudata->drvdata != drvdata);
> -	if (cpudata->mode != CS_MODE_PERF)
> -		return -EINVAL;
>   
>   	trbe_drain_and_disable_local(cpudata);
>   	buf->cpudata = NULL;
> 

Reviewed-by: James Clark <james.clark@linaro.org>

