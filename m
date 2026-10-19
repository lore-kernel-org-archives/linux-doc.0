Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A1483823
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402409; cv=none; b=LlOoQowR17eFZHbZNzoo6vpKr83y/8ywDtOMr2Km8r7vyVeJJzryeiF/Pd5roYJbyov1YPVA3lUwJdT5ATwseZbSgmzUw5wnYvXQLvIRIz7iZP1/aRYMcu2XjxrRvJSN0oSn9v47Zjgm87MqAdeOenyoxJCyP0sIbFbQkvol5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402409; c=relaxed/simple;
	bh=YjWzbirDWLgeb8E0r2U0TDoM/eN47zJuQ3QNGq/Lxls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSaRD52iWTQTYfgT3RNbLBftYQKJ1QLf+Rnued6NaHQO7oGWYxgVaZDZ4L0kz9doDffkGe9AZJ9Aw0MYgqZ6HU5tg2zUBfCJOYxys/jBHuy/3aSkdYEmhQYTa6epqhM6sOZaOyBnqk/bUyOxRniRxcDPJ1F6mTbHYL/j57t6dRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhWVM3+p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhWVM3+p"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1129654f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402406; x=1793007206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okjHac9HA8yNuFEbyuUJm7e15weplnoREC6dmkLj8fw=;
        b=hhWVM3+pg4lFr7LQuAocxcyqiTlb/XaiMSbdNuLDV3rmCUueDCE37GWKwD7hvpNh5q
         Dl67pa9D0J9NnGS4cyRxgndVtF0Q7/10IlCODdhPNs3sF7AxLsMuG51eH6vPqFhPr5XR
         D+m5oU3oQnYsIBLDT9JSoHxXLPIhMQUxGUNNw24reSNt0fwS2WUx1Y44dlObmBL1UZMQ
         7dotvbC4XEn8hoGf3Z9eth3jWJXpjcqlXR4WLZ6Ui07EaFVNO8BexTP6RtQyUiOs7slY
         e6iLEhJMtVZFVbPIIRERLuZVa5mY2u/Tf1GRsGjDGCVn88gKVTv54qm15y2MQvYNijcF
         fhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402406; x=1793007206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okjHac9HA8yNuFEbyuUJm7e15weplnoREC6dmkLj8fw=;
        b=c5e5lvKRyyrKVvtHdHsupkPHx0RJjlb3f+F3iYwks2Lxubly/3nXT3vKapC8BrDSum
         ogZcqO2sJLexRY0BaQQ4AkqXguY9qtSvVmlmZPyDCavsCp2MbT1jcXj57ayJ3dDGlr7X
         hnYOGfbBCvlJEXoweJIWuwkvIVYj0AgsqCUyPC8QYapCO6H+eIIOfhINlGmLLKV1/zCC
         i/htjB4bxgwF2elSAlPPdps61o39UEX0EkD5klWZ8qHc2DNR3jC2C49do5sBtCbzrS4x
         /KUbrZvcBZD5TXPIPeZJa7SavRDYB09BpuhbV/k86Rl9RG5z+TK3wD1W3YKBjGVVzAhA
         cCzA==
X-Forwarded-Encrypted: i=1; AKwUvBxvSCV1xGEhrL6QCLI1g4OylwPoRbo+oTDgoqNdBhKgUTZadeCX8W+Zp4CnGfOYuqSFQ2jP476h6Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfBQRMJ2itwXR2M8z5kD/WvGhyJFZeVnOWw1Y8WZjAN481a0wA
	N4zSRQo0G96K3a3cM/7INo3DETukwkZaeMB2ZW82i+OfK2CxiPOHgVl8hUnVULULiUg=
X-Gm-Gg: AYBFou1asKs592DirPbJWAYPOh4a7jfJ3eyBjsruXsHdKJZdCkIZAxomGL8pOusIFXU
	YDDTlRZb3A8S5vG064+qU8obrSslBjpyTDy2GgIY08KwrFQHSgVjCTH7JOCi4h3uaeSRakeqhda
	813lbLold/uvWuehYZ2wgCuKaO8//o3MpqDUADdzKhhWKt5zxAfIszRTL522856L6y64dN0UXKN
	iZ0uS8atSb5on/5Xbxm1IU7TBXz9+1E/0OB9CpTQG9WsmY30voR+AOABOEClSZ0TqKVLhc1dnLa
	svU7TRsSIBNapenYmXyns1j/iQD5LeQSiU1t290caD7KgYsMAan1yWsc2rikmNrY80V2Gy1yMWr
	3vCsrdlMW8eDqrnciPP5fSd3ePKJC6ilJpbXG1MRyCwqm9/Z6heO5oDSDo4UVFLqU/5NX15WtvN
	qv/5IpyTwYN0n/QlrP+7WtwiHQgOnSLC3crE39Bm7UtyaJKAsDx6ErECRcFg30cAD14dJxZlth0
	TQ=
X-Received: by 2002:a05:6000:490f:b0:48b:9d80:53a5 with SMTP id ffacd0b85a97d-48e07bbe5d5mr13361426f8f.10.1792402405652;
        Mon, 19 Oct 2026 02:33:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm323988f8f.35.2026.10.19.02.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:33:25 -0700 (PDT)
Message-ID: <ebf74a45-f406-4502-99e3-434e19feef6e@linaro.org>
Date: Mon, 19 Oct 2026 10:33:23 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] coresight: perf: Improve hardware state transitions
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
 <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> Keep hw.state consistent with event activation and AUX buffer updates.
> Initialize events as stopped and up to date, clear both flags after a
> successful start, and set UPTODATE after committing an AUX buffer
> update. On resume, clear UPTODATE only on success. Preserve state on
> resume failure and ignore duplicate stops.
> 
> Add helpers for setting and clearing state bits. Use READ_ONCE() and
> WRITE_ONCE() to prevent compiler merging or refetching of state
> accesses.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 58 ++++++++++++++++--------
>   1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index e3c9d3cf84c502f357a430bc3bfa854a776618f1..f66c99b26e1862ab04105704276c901b21728207 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -150,6 +150,20 @@ etm_event_cpu_path(struct etm_event_data *data, int cpu)
>   	return *etm_event_cpu_path_ptr(data, cpu);
>   }
>   
> +static inline void etm_event_set_hw_state(struct perf_event *event, int mask)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +
> +	WRITE_ONCE(hwc->state, READ_ONCE(hwc->state) | mask);
> +}
> +
> +static inline void etm_event_clear_hw_state(struct perf_event *event, int mask)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +
> +	WRITE_ONCE(hwc->state, READ_ONCE(hwc->state) & ~mask);
> +}
> +
>   static void etm_event_read(struct perf_event *event) {}
>   
>   static int etm_addr_filters_alloc(struct perf_event *event)
> @@ -520,6 +534,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   static int etm_event_resume(struct etm_ctxt *ctxt)
>   {
>   	struct perf_output_handle *handle = &ctxt->handle;
> +	struct perf_event *event = handle->event;
>   	struct coresight_device *source;
>   	struct coresight_path *path;
>   	int ret;
> @@ -536,10 +551,13 @@ static int etm_event_resume(struct etm_ctxt *ctxt)
>   		return 0;
>   
>   	ret = coresight_resume_source(source);
> -	if (ret < 0)
> +	if (ret < 0) {
>   		dev_err(&source->dev, "Failed to resume ETM event.\n");
> +		return ret;
> +	}
>   
> -	return ret;
> +	etm_event_clear_hw_state(event, PERF_HES_UPTODATE);
> +	return 0;
>   }
>   
>   static void etm_event_start(struct perf_event *event, int flags)
> @@ -553,8 +571,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	u64 hw_id;
>   
>   	if (flags & PERF_EF_RESUME) {
> -		if (etm_event_resume(ctxt) < 0)
> -			goto fail;
> +		WARN_ON_ONCE(etm_event_resume(ctxt));
>   		return;
>   	}
>   
> @@ -583,7 +600,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	 */
>   	if (!cpumask_test_cpu(cpu, &event_data->mask)) {
>   		perf_aux_output_end(handle, 0);
> -		event->hw.state = 0;
> +		etm_event_clear_hw_state(event, PERF_HES_STOPPED);
>   		return;
>   	}
>   
> @@ -621,7 +638,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	}
>   
>   	/* Tell the perf core the event is alive */
> -	event->hw.state = 0;
> +	etm_event_clear_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
>   	/* Save the event_data for this ETM */
>   	WRITE_ONCE(ctxt->event_data, event_data);
>   	return;
> @@ -639,11 +656,12 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		perf_aux_output_end(handle, 0);
>   	}
>   fail:
> -	event->hw.state = PERF_HES_STOPPED;
> +	etm_event_set_hw_state(event, PERF_HES_STOPPED);
>   	return;
>   }
>   
> -static void etm_event_update_buffer(struct perf_output_handle *handle,
> +static void etm_event_update_buffer(struct perf_event *event,
> +				    struct perf_output_handle *handle,
>   				    struct etm_event_data *event_data,
>   				    struct coresight_device *sink,
>   				    int mode)
> @@ -668,6 +686,7 @@ static void etm_event_update_buffer(struct perf_output_handle *handle,
>   		size = sink_ops(sink)->update_buffer(sink, handle,
>   						     event_data->snk_config);
>   		perf_aux_output_end(handle, size);
> +		etm_event_set_hw_state(event, PERF_HES_UPTODATE);
>   		return;
>   	}
>   
> @@ -704,7 +723,8 @@ static void etm_event_pause(struct coresight_path *path,
>   		return;
>   
>   	event_data = READ_ONCE(ctxt->event_data);
> -	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
> +	etm_event_update_buffer(event, handle, event_data, sink,
> +				PERF_EF_UPDATE);
>   
>   	/* Prepare the handle for resuming trace */
>   	perf_aux_output_begin(handle, event);
> @@ -716,8 +736,13 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
> +	struct hw_perf_event *hwc = &event->hw;
>   	struct etm_event_data *event_data;
>   
> +	/* If we're already stopped, then nothing to do */
> +	if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
> +		return;
> +
>   	if (mode & PERF_EF_PAUSE)
>   		return etm_event_pause(path, event, ctxt);
>   
> @@ -726,7 +751,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * to synchronize. Mark the event stopped and up to date.
>   	 */
>   	if (!path) {
> -		event->hw.state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
> +		etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
>   		return;
>   	}
>   
> @@ -734,9 +759,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	/* Clear the event_data as this ETM is stopping the trace. */
>   	WRITE_ONCE(ctxt->event_data, NULL);
>   
> -	if (event->hw.state == PERF_HES_STOPPED)
> -		return;
> -
>   	source = coresight_get_source(path);
>   	sink = coresight_get_sink(path);
>   	if (!source || !sink)
> @@ -746,9 +768,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	coresight_disable_source(source, event);
>   
>   	/* tell the core */
> -	event->hw.state = PERF_HES_STOPPED;
> +	etm_event_set_hw_state(event, PERF_HES_STOPPED);
>   
> -	etm_event_update_buffer(handle, event_data, sink, mode);
> +	etm_event_update_buffer(event, handle, event_data, sink, mode);
>   
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
> @@ -759,12 +781,12 @@ static int etm_event_add(struct perf_event *event, int mode)
>   	int ret = 0;
>   	struct hw_perf_event *hwc = &event->hw;
>   
> +	etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
> +
>   	if (mode & PERF_EF_START) {
>   		etm_event_start(event, 0);
> -		if (hwc->state & PERF_HES_STOPPED)
> +		if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
>   			ret = -EINVAL;
> -	} else {
> -		hwc->state = PERF_HES_STOPPED;
>   	}
>   
>   	return ret;
> 

Reviewed-by: James Clark <james.clark@linaro.org>

