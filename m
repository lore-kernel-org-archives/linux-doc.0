Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA314C9E01
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158791; cv=none; b=DtJmxEuaSKWEQkj06yWquWYkT/7VbfoT2SF5WNcUl9tbwz3FIhUts2urqKRjtVBq+FkbdbY10v2CEib+REW8eDEK4+j0Y1ZtSTTUtMJOaSgKYA6fhqnZeOAhbLJyhCDqhQVURp2L/JSsw63h6H2PzWPzRLzPqJixjpxknKVsIWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158791; c=relaxed/simple;
	bh=oNZoC/1XfNmiFXh0Vy39LTZxHGERleLuLCyxabvzoWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyhQUTeBseAb9YgfOCjgmlJ2gwwp0LtpNNRa3PzIq1r0/2jyQoL3q73ID1p6tGnjNVls8z5jzq+GRV3O3Np6ECQ20kSTubjy9CtjaCLbRGYr64YrtvNBmkTsfo39w/2rPD/bvPldyPFH1pqzWp0VBPc8uon4hRlnbskStXUAoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B36rcz9t; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B36rcz9t"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso46949735e9.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792158788; x=1792763588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u1hd3MVH4854Wnbwnw1BZQepD7XiDLggdf6oqUpphg=;
        b=B36rcz9tosqcvMwRjZlWNJEugPuiP1/Vv11WHCTKzQPcBx2bck5/+9HD3aBgCFWR5b
         4OzHSE1LaWCQ0qNslA9cZVPTTK67KvuTW2gd3yF4qj74X8fUdcov9gd4GGmHxkN97xYV
         wyns4yjJkb6X+tl68GbxwUbzc7n29c09aJtEXCh/OkTUIjTFAXDIoLkAJBxqXqUH3PAw
         E1X08r1+HeeIJvHikozl7fZnl7FFkbjZED/R5m/dnDLnmB8oiQCm6mV6vom/pBV/PBo7
         htd09EEyBTxG9mkLKUjKakb9VzFW3Ts10uJe+uGGBetspL2Ve1gd8Ja6lgp8dnPEaWTd
         ZCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158788; x=1792763588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u1hd3MVH4854Wnbwnw1BZQepD7XiDLggdf6oqUpphg=;
        b=e7xTdr16EAP+btK2vCRuEAwIFFxmu+ILvilsUfqmF5nEvZD7XE1Wk60TXziw5AYQIj
         Fv16dtNLlrTJjtKJHMh//rLt/hkDFS0zXAuXDUSZsa8iHm1l2sVolr0bC/IPeRjkHWbL
         r10Z9EFWuMFCsLapltMVwGjup7j1beDdBfCQxGUh2TSGV4rYNBIlwWJu8x92oGl8OwId
         wWMQEKHffCWMVjevIbA3wWk3agERVtDg3ZSO4yRk+NjWX882lvZO+E8Z1mEq109LNBOe
         2+bayT0M3CqKKbFwiY6jUZXlcq/2sePyQIVSDvAiRWW6zuBZKAdXOVNLVY/yhKQxFHiC
         iiAg==
X-Forwarded-Encrypted: i=1; AKwUvBw1p0WkEmqYhUHsbVv281LqNCjHpDF4/ZFNWe2stWEBRDD1kotqN13yzzRi4iCloo0lx7GbnT/Y/iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUgq7YjAyTsuk4oYEZo4idgle/5nIPbmOyf8x8bIHb2TH/G2wT
	XxkEiLAnnvWOEth2tmi9VnbtfcdZvJLeM5IQl80VFYcU7fOvkMBAGtOOb2q4r0eeqac=
X-Gm-Gg: AYBFou2orJgK5jASkfrn832e7OYmsPbC7fmiIkvw2LSMKM4XKf3GxZorV/+o0A8GfRc
	R8HROrhgDMpt5H6D/NcB6+S+JqHP/tS1XacYAiYDz+fZy0r4b/D2IB2V8BPonOccz2I/M1vcU1T
	iAAcpbkFg55WZ5Xrg7YQ0rH4VGjMc7WAreRrXrDJJ1k9YHEI2fZ4Q0WLIAaQ23MmjrM2IsTgtC5
	TDJwu4RMoNWQt/B76cPvfpJ8s7aJWA8AgXubb7by0UPN84NENsOEEs7YPlGIAp1mRj3ZXdheHjD
	jXaSY3PWWW/tEVVX/zjIOwNjty3N6Cv/j2g8NcK4ZAMCk3bL5ZS9WnPVBrR9Z9shs6t+1Y1mT27
	2se9gH3QrK5N/txHeyZZZlw3si3KoQKWAdqmfeqdHO0iEDDeplfQNdKwYdoQ4726zUtFkm9ga48
	eJQ9u50tESq8mgThq3aNxCpgjzSS8FOcSVc89tfXJq7Y3RMrJlgH30IRASVibjE1yTxgpab/QvA
	C8=
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1ac666396mr241877715e9.15.1792158787676;
        Fri, 16 Oct 2026 06:53:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d0e2bb8dsm35630445e9.2.2026.10.16.06.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:53:06 -0700 (PDT)
Message-ID: <43db2ca6-27be-416b-83f8-131676e5d444@linaro.org>
Date: Fri, 16 Oct 2026 14:53:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/25] coresight: perf: Extract AUX buffer update helper
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
 <20260915-arm_cs_support_aux_sample-v1-5-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-5-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> The pause and stop callbacks duplicate the sequence that updates a sink
> buffer and finishes the current AUX output transaction. Move the common
> sequence into etm_event_update_buffer() for a single implementation.
> 
> The helper first verifies that perf handle is active. It updates the
> buffer when PERF_EF_UPDATE is requested and otherwise ends the
> transaction without data. The pause callback can then start a new perf
> handle for resuming trace.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 89 ++++++++++--------------
>   1 file changed, 36 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index a45f69f39f175f3044322b25fe5413fb97154496..13d865ca86f1161b2e21174f096473c4829afc8c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -637,6 +637,38 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	return;
>   }
>   
> +static void etm_event_update_buffer(struct perf_output_handle *handle,
> +				    struct etm_event_data *event_data,
> +				    struct coresight_device *sink,
> +				    int mode)
> +{
> +	unsigned long size;
> +
> +	/*
> +	 * Make sure the handle is still valid, as the sink may close it from
> +	 * the IRQ handler. E.g., the sink driver may fail to restart the
> +	 * handle during interrupt handling due to insufficient buffer space.
> +	 * The sink driver must serialize update_buffer() with IRQ handling,
> +	 * so this should return either a valid handle with a valid size
> +	 * (which may be 0), or no handle at all.
> +	 */
> +	if (!perf_get_aux(handle))
> +		return;
> +
> +	if (!sink_ops(sink)->update_buffer)
> +		goto out;
> +
> +	if (mode & PERF_EF_UPDATE) {
> +		size = sink_ops(sink)->update_buffer(sink, handle,
> +						     event_data->snk_config);
> +		perf_aux_output_end(handle, size);
> +		return;
> +	}
> +
> +out:
> +	perf_aux_output_end(handle, 0);
> +}
> +
>   static void etm_event_pause(struct coresight_path *path,
>   			    struct perf_event *event,
>   			    struct etm_ctxt *ctxt)
> @@ -644,7 +676,6 @@ static void etm_event_pause(struct coresight_path *path,
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source, *sink;
>   	struct etm_event_data *event_data;
> -	unsigned long size;
>   
>   	if (!path)
>   		return;
> @@ -669,27 +700,16 @@ static void etm_event_pause(struct coresight_path *path,
>   	if (WARN_ON_ONCE(handle->event != event))
>   		return;
>   
> -	if (!sink_ops(sink)->update_buffer)
> -		return;
> -
>   	event_data = READ_ONCE(ctxt->event_data);
> -	size = sink_ops(sink)->update_buffer(sink, handle,
> -					     event_data->snk_config);
> -	if (READ_ONCE(handle->event)) {
> -		if (!size)
> -			return;
> +	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
>   
> -		perf_aux_output_end(handle, size);
> -		perf_aux_output_begin(handle, event);
> -	} else {
> -		WARN_ON_ONCE(size);
> -	}
> +	/* Prepare the handle for resuming trace */
> +	perf_aux_output_begin(handle, event);
>   }
>   
>   static void etm_event_stop(struct perf_event *event, int mode)
>   {
>   	int cpu = smp_processor_id();
> -	unsigned long size;
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> @@ -742,45 +762,8 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	/* tell the core */
>   	event->hw.state = PERF_HES_STOPPED;
>   
> -	/*
> -	 * If the handle is not bound to an event anymore
> -	 * (e.g, the sink driver was unable to restart the
> -	 * handle due to lack of buffer space), we don't
> -	 * have to do anything here.
> -	 */
> -	if (!handle->event)
> -		goto out;
> -
> -	if (mode & PERF_EF_UPDATE) {
> -		if (WARN_ON_ONCE(handle->event != event))
> -			goto out;
> -
> -		/* update trace information */
> -		if (!sink_ops(sink)->update_buffer)
> -			goto out;
> +	etm_event_update_buffer(handle, event_data, sink, mode);
>   
> -		size = sink_ops(sink)->update_buffer(sink, handle,
> -					      event_data->snk_config);
> -		/*
> -		 * Make sure the handle is still valid as the
> -		 * sink could have closed it from an IRQ.
> -		 * The sink driver must handle the race with
> -		 * update_buffer() and IRQ. Thus either we
> -		 * should get a valid handle and valid size
> -		 * (which may be 0).
> -		 *
> -		 * But we should never get a non-zero size with
> -		 * an invalid handle.
> -		 */
> -		if (READ_ONCE(handle->event))
> -			perf_aux_output_end(handle, size);
> -		else
> -			WARN_ON(size);
> -	} else {
> -		perf_aux_output_end(handle, 0);
> -	}
> -
> -out:
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
>   }
> 
Reviewed-by: James Clark <james.clark@linaro.org>
