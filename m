Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077324B2049
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403116; cv=none; b=izYFG5QLhgdhofFGd4PWI5YxaDghMpya2FS4/9T1cw08Wcy2VwbrL+MDm3/z4Yf1K8Vrp+qFw1zPRl+Mlyf3sYw6qQiiOgT7IVl84NRaVrOUhss3iXhfvSR+yFcTJDgnei07wPdf8BEJ3hWo9AghA9dpt2bQJa+J7U/TtPVArZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403116; c=relaxed/simple;
	bh=Jaiqy8f/Sl/4tupxPExjmNLGv0E136+VgC8GLOr8zAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k35a79E3t1UEuJCzZoWLL1w+XdjcSll0TCU505aft3jB+AdpPrOAaLf3+xCJTj7oGVxg9M5LOOYf8JzeTf8FMGZgmrLU2ApMBh2Yht1VfU3rF6IitU+aevrBKigMr9TRhLtfh9YV8BVFg348zWeb42joOMR97sf3Thuig8aXrcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHjbtOe9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHjbtOe9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so13156375e9.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792403113; x=1793007913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=;
        b=bHjbtOe96ZF0J5S7kfI9OaYDIq/DeE446+7RhNdlZFlXUkrPL2EXhtFwrYlWOO2SF5
         XZ6bzXs4lsiKiPqGEeEusF/6JlqmcaxTae1LwGCblOvkVe796eqU1v8zrv7bXPWiNsH6
         xe7fHETWgjcE4uXgBNBIayJ94DeqmWeieWxZnVkruthmuMyn77eS1OZ1bBjSh6HzUA+5
         fAds8m73pOzPlyVcrHeiPo6iZhF7s/mnMPDM0aW/WOo2lCTn67/ArqqXWsHpID0mQ4gQ
         tjUtE55BeqktKCAfsFYud7U5rjWOYc7+PKp6m9f/dPVixLXva7eqKIUNkuK0NApDoXEh
         ESqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403113; x=1793007913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=;
        b=MCOFPMGr7ClTqM2ZpXD22bluEUvqOEfhGIpP/BmmLE7STSqaz4LpwQq/zob3sCnEeq
         +iVG0DXKWSXFvyEnA/D32/hq1SXVx/qJ9Uc7zVIZUtYKB8aoe2AaoVYQz/Wy01CsyMuZ
         +F/B4KXxmgaOp06Ze3o4BCk8UXHJ/4JqBTbUU+0RCTFAT2wJIgkcK6U8MZpSIWvOLbYc
         M02tiytvLxmphgbprwf+D/DEQHyNGKWuvfBqpRqLnSOyzMkiyokydJvwvVqU5qgLIx6X
         EISEz+e5BpHX5tkYElLJdhwxXV/PMasGo+C0TRwUTUoPQvXD3QnrBVZrRe7CFH9SuUhP
         VGNA==
X-Forwarded-Encrypted: i=1; AKwUvBwnBuR4IIiEHZdD6kMDQztQrF4ju4WxCfCZO1SKremU6EXpsokqhFB6yPEge6y7lk11Lt6ESRILMWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3aCwKrlqJDX/bFpfoZTkHfDmHQ4/VcaAf8ZQL0SBa+EvaO5ZR
	QZsOtg+g/hNbS5cZwgROSuFteBKCSHC/KeubgQ0pAdZqfgOnYYbR5/WKS/mhSWOCqQI=
X-Gm-Gg: AYBFou0WpgRhgypTov1UuY6CE2Dd040dMJQFz5qrwuH9MnD4zP5veUWfPzAjpHOfs6N
	FoL+kpav/qmFL9Nwx6BFhHiXkp6kpzCXBLPFf8sPHV/Pz6T74NRxZLV9ktQy82m28+gzPyeNhlQ
	HJwmPBtCB/5SM79klt+8HXfigQyGwo//KocQuFSuKT4lDiELv+Dw/9o0al+78Tp4a78J6wlqRMo
	YBiE5kIEMgz7kATOl02RLCHHviPIrvrUSQZOB3LzsdL//mIBw+zoDot4Wm0zIzfFQ6uHYmblN5A
	LlDqZwHdtIVoVjjQG31e2rRbvPoaNIsNb00zrssBsy4ynF0zLmDlj2e/drKWMZYrD8b52kITl0I
	+VLFMnb1wlvQEjuMaNIIy2f8nD9bsPxAA9vfvStgp79QEtlyKjwNCBsbXg58x9JECu7KoNfZNwD
	k+qviUZQuRnmzoddeDmrbk3zcqsJRSgMPSOpmgoPhsidAy8nFxT9gR/+UIhL211BVow0GcCPbSY
	t0=
X-Received: by 2002:a05:600c:1395:b0:4a1:c6fe:5c0e with SMTP id 5b1f17b1804b1-4a1d76148e6mr149657955e9.33.1792403111528;
        Mon, 19 Oct 2026 02:45:11 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm311684915e9.0.2026.10.19.02.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:45:11 -0700 (PDT)
Message-ID: <3d4a1883-3600-4e83-96ca-ccaec398fe91@linaro.org>
Date: Mon, 19 Oct 2026 10:45:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/25] coresight: trbe: Pad snapshot buffers
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
 <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> Snapshot buffers use the head as the write pointer without checking its
> alignment or the space remaining before the limit. After a stop or a
> move to another CPU, the head can be misaligned for the current TRBE.
> It can also leave too little space for the Fill mode out-of-range
> workaround.
> 
> Pad the head to the current CPU's alignment. If the remaining buffer
> cannot hold the minimum trace region, pad to the end of buffer. Update
> the head for setting next write pointer.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 36 ++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf..a31f2ebc327cd681344a62de28c0b3840505a9cb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -374,18 +374,6 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
>   		perf_aux_output_skip(handle, len);
>   }
>   
> -static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
> -{
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -
> -	/*
> -	 * The ETE trace has alignment synchronization packets allowing
> -	 * the decoder to reset in case of an overflow or corruption.
> -	 * So we can use the entire buffer for the snapshot mode.
> -	 */
> -	return buf->nr_pages * PAGE_SIZE;
> -}
> -
>   static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
>   {
>   	u64 size = TRBE_TRACE_MIN_BUF_SIZE;
> @@ -405,6 +393,30 @@ static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
>   	return size;
>   }
>   
> +static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
> +{
> +	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_cpudata *cpudata = buf->cpudata;
> +	u64 buf_size = (u64)buf->nr_pages << PAGE_SHIFT;
> +	u64 head = PERF_IDX2OFF(handle->head, buf);
> +	u64 next = round_up(head, cpudata->trbe_align);
> +
> +	/*
> +	 * A task event may migrate to a CPU with a different alignment or
> +	 * errata. Make sure it has enough space, pad up to the alignment
> +	 * required by the current TRBE.
> +	 */
> +	if (buf_size - next < trbe_min_trace_buf_size(handle))
> +		next = buf_size;
> +
> +	if (next != head) {
> +		__trbe_pad_buf(buf, head, next - head);
> +		handle->head += next - head;
> +	}
> +
> +	return buf_size;
> +}
> +
>   /*
>    * TRBE Limit Calculation
>    *
> 

Wouldn't it make sense to have compute_trbe_buffer_limit() do the 
padding now that it happens for both normal and snapshot mode?

Either way:

Reviewed-by: James Clark <james.clark@linaro.org>

