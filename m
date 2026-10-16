Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3684D09E9
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159164; cv=none; b=sj2axtArRdkILGqTAA+8hlS+m0ljaB533SKixZf325pNy4RihOdLeh2ExY+3IiHgv53tas5QUv7D30GaabtxsiC2dD/NHtAnE/khUNB1LCxirR3tzc8k5RYdQjcSE4dh+kOkXWHHNBPAskXHGAl/lU9///FKSB4qyNL/HwVXc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159164; c=relaxed/simple;
	bh=HlxxOX9hc1IcZ7vS0lzEwAlAmQp50vCCaoHbS431348=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSNUh1kx65rv7BD3UgVqsOcnzwVUOgo9HMaEyGxx0mAYCmvzDSIOuZheujCi6Z8v6vO17AU4AHKirN7LxFv327v3mZimECE9un7g1sDmcJ9qrW/P+51VEbC6B5AMHIDQ5vP28wuwrismQe2lFEGB+zriZHZT7ZVMbVa9D6WAUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAbEK4fb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAbEK4fb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1152089f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792159161; x=1792763961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZ7aNbjQZUrQzNKHssers5+AZqgNNYh0ssOAYLIZWvc=;
        b=WAbEK4fbM2OLOIDmTSsQde5j74EB0KJCUymGGjE2s08OXXpAI1vX4j5VKvXVFvn6iW
         6hK1ElX0WWWuXtgjKRQBz7HlK035F+Spprg1O40zu4LpdNpZH4v3AmSxmgUr82/BW/B3
         MPCgEHBp5lGUGYnTGFI8oRtUaoGgpwjlAokjFZKyFC/nDYjnDoUw03I/nImeQnKq7mIc
         ETLeBpjgQfoos/qjopbXvMCinlsEn4C9FEWnBPUVz7U9mgPt7P/L6dCgyM/6afncodlI
         7EL4mj5McxrbK1cccX4t1U2SJmUtaYLcl/5SLb7XIilxCzhhOnkSzZIZWmzsGl8dRj5P
         7eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159161; x=1792763961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ7aNbjQZUrQzNKHssers5+AZqgNNYh0ssOAYLIZWvc=;
        b=0+N02ajk+sBha0kP5Dv6tSP+J5i2YaXo8GkRHWSwzYdsaPWRFrS2y/dSLCdtpLSPpH
         h854OU3pY1GTq97GcuBWTaZbl4nauBIOdhe3qoJ5rADGhPjAlVfrhSiiyr78UR6XqMjH
         RCk6JtvaoNt45ocWDrwa7IHwHlUNQf1FOsJVUVF0oatnlKx5Q/YQd+NTvbBkQFh2SnTX
         ziklnZFyOXe8rwfwrhYS59BomxjPwPSkKY48PwXdHTkLNmy+y7nvCDE8ZhGyMGrBFtFG
         DMe62axDj/XwE9xb+YoHQGlJ2hLC/Rp4YFAXox4kPxwROwNZoeVCziEhrMXxOFrqYXWw
         VKtA==
X-Forwarded-Encrypted: i=1; AKwUvBxpo1G10+5nceIPZ0kr2sfQ6hgFxSUr+I1H1pybuQ4fdjenk4ghc9XygeReDXNuis256djre9JZ2uY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLTfqUZtrku6a+KpzWzMYxiolg78s/TThsL53D77YOkY2uOLrn
	K0JueG8mN5+Kh5k6ejK1Ub/GErGvfMkoQm9Df1BtFmxRXINvPRlNIdKg4oyIQn6efF4=
X-Gm-Gg: AYBFou0hKx2E+pT49aaFcFgUasQmQwJDkBruPZ4kUBVL8YvpXxP62gx3XUT5cEvc7Wv
	4Vtb4ICxfnFj6PTkBOhmksCUB8DDBJc4pVeSDRl91kIOFCjkeftzF4pAhtDZ+YvjnPx+RTOukEC
	gGPQb960LJnN2OEXVv+WmRuOl8VtgfTtCWt9nvogAxopqD+SB9SYBT2PCYfOeFN2TtZKKMtenJS
	g7OlvHyDbJNBx6B/EVCEZmLQ1jzbxNm67v5pjFlJaDflERO2Iy+rn5yRXQGZW3ZnAnbtqami92S
	uTMJRFeSuJ7zO58GgNAHCz+miQfEYMJ+RtJkLyTamKVQX5G5XY2gprvdEBvBzTlH5jAsDRX+MMm
	P3dJXZ7orKQ1kkqGpry5YWqjWqbDvgrNBnSen2bqmQngaWkThwYstUznieA2hVGhaI1/km8SwgR
	q/TngDGZUrrDAFNpAfc3nIK025xj3HR0jOYsTJpp/gmCwpAIsbSuMMd0mVi91xRDNwWLdkusTyP
	MLLMtH36Y9tJ2ctfQU6aVmyFDx2rEp1gt+9IYvXnTUgCpgj0Tcf1HrIpswqiA==
X-Received: by 2002:a5d:5f82:0:b0:48d:ff0b:9b52 with SMTP id ffacd0b85a97d-48dff0b9cf2mr4016547f8f.19.1792159160653;
        Fri, 16 Oct 2026 06:59:20 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm5181686f8f.42.2026.10.16.06.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:59:20 -0700 (PDT)
Message-ID: <73a053af-9c07-4d09-be30-66778b5f433d@linaro.org>
Date: Fri, 16 Oct 2026 14:59:18 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/25] coresight: perf: Simplify flow for CPUs without a
 path
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
 <20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> etm_setup_aux() removes a CPU from the event mask when it cannot build a
> path from that CPU's ETM to the selected sink. The start nevertheless
> allocates buffer handle and keeps event data active until the
> corresponding stop callback.
> 
> End the newly acquired handle immediately when the current CPU is not in
> the mask, and do not publish event data in the per-CPU context. The
> event remains logically active so that a task event can trace after
> migrating to an eligible CPU. A stop on the unsupported CPU then has no
> CoreSight modules to disable or trace data to synchronize. Mark its
> hardware state stopped and up to date.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 38 +++++++++++-------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 13d865ca86f1161b2e21174f096473c4829afc8c..afd22fd4a851e600ab69fd5b6883e6f8518b2cab 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -572,13 +572,15 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	 * the sink was specified or hinted to the driver. For
>   	 * now, simply don't record anything on this ETM.
>   	 *
> -	 * As such we pretend that everything is fine, and let
> -	 * it continue without actually tracing. The event could
> -	 * continue tracing when it moves to a CPU where it is
> -	 * reachable to a sink.
> +	 * In that case, leave the event logically active but stop AUX
> +	 * output on this CPU. The event could continue tracing when
> +	 * it moves to a CPU where it is reachable to a sink.
>   	 */
> -	if (!cpumask_test_cpu(cpu, &event_data->mask))
> -		goto out;
> +	if (!cpumask_test_cpu(cpu, &event_data->mask)) {
> +		perf_aux_output_end(handle, 0);
> +		event->hw.state = 0;
> +		return;
> +	}
>   
>   	path = etm_event_cpu_path(event_data, cpu);
>   	path->handle = handle;
> @@ -613,7 +615,6 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		perf_report_aux_output_id(event, hw_id);
>   	}
>   
> -out:
>   	/* Tell the perf core the event is alive */
>   	event->hw.state = 0;
>   	/* Save the event_data for this ETM */
> @@ -709,7 +710,6 @@ static void etm_event_pause(struct coresight_path *path,
>   
>   static void etm_event_stop(struct perf_event *event, int mode)
>   {
> -	int cpu = smp_processor_id();
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> @@ -719,6 +719,15 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (mode & PERF_EF_PAUSE)
>   		return etm_event_pause(path, event, ctxt);
>   
> +	/*
> +	 * With no path enabled, there is no hardware to stop or trace data
> +	 * to synchronize. Mark the event stopped and up to date.
> +	 */
> +	if (!path) {
> +		event->hw.state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
> +		return;
> +	}
> +
>   	/*
>   	 * If we still have access to the event_data via handle,
>   	 * confirm that we haven't messed up the tracking.
> @@ -738,19 +747,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (WARN_ON(!event_data))
>   		return;
>   
> -	/*
> -	 * Check if this ETM was allowed to trace, as decided at
> -	 * etm_setup_aux(). If it wasn't allowed to trace, then
> -	 * nothing needs to be torn down other than outputting a
> -	 * zero sized record.
> -	 */
> -	if (handle->event && (mode & PERF_EF_UPDATE) &&
> -	    !cpumask_test_cpu(cpu, &event_data->mask)) {
> -		event->hw.state = PERF_HES_STOPPED;
> -		perf_aux_output_end(handle, 0);
> -		return;
> -	}
> -
>   	source = coresight_get_source(path);
>   	sink = coresight_get_sink(path);
>   	if (!source || !sink)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


