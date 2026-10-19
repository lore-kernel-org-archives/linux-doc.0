Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137604A2602
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402072; cv=none; b=XOCeqBTPBy3Z4NHEeXeJkP2oFTaSo4S5pj9dboVoekAt6AzLEX9SbzlF+9hTzj3QGjtdGCoE5uqX73A61XuBnL7owtHDxZKWWPdece3IW904FodAio5q0ss61fW8RHn85PM3vW39ruAzwlUWXzChGDd6WdxAzOHGzmUI+S6myH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402072; c=relaxed/simple;
	bh=luibakbmz1LG8fvOlXXumwXQ0o1zXo+G2jWoH1UwJqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFIc4BC4izWSDDrcW8eKEvT7wIPD5UIvSXVHAx99WE4PeWtSM4oJnwMBw6lYgAakBwyfe1SOAtUUe0sSsrYQK87Pahr77Dk4NaphRWnk9O/NKzRFs8aDkqxFtqPQmlKD5/X/NAmhhXgmIEIsLi6bqXO203h9RgkQvjAS+EzFrKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1cwu2jr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1cwu2jr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso9287405e9.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402069; x=1793006869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=;
        b=j1cwu2jr+Rzaaas8BvooMezrxIws9tE52OUAKn79wxcrAR8XV/qOhMylgwejI9oibs
         3c12oA1rA4GhbhNE4L7xMC6vfZOUOArZDWldig4Lpb+v/2BkgCQARe8zv3GVRyiOIExY
         Uno2qAs/yzfuB/Sdw67E9YlvXJ8j+mFD1DBv8QQ8XKGFhe7MqkMh6iWwN2KqaaDY8Np0
         q078/NqQKKXZr1OGLEqThehphibX1jkzjiZncLi//z/EXxkb3d/+4peGwTco02nIq4Di
         0aSzfZhlw5JSzDTb9dTniLCQYk3iWM/AebhxlxBYvAtHGkifroQGhIqt3YaKRTtHMoiJ
         P6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402069; x=1793006869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=;
        b=ijSSmVe5LLPQNu/TKCKHoJQhaE6Uw+WY8hjVd1tKom7AYHqy1k+5O6DDvltds4MTHo
         +9EyqAYCQEAn4rTlVcUYhIFrbepmQjSOUZ1QwiTwyl9tKgTRdA74ohThp3Q2bR4TxTJY
         JLgquF7cwuuu28REqwmOf31EtH1rAmikwIb2gKtJAzZhagp/1K3jV0aj8NvUBMXRqRYi
         hwLetN5m7jyEbWoQIX89ebzWe7nWZb2jEgOehq7AVJd1POL9me4E9411LS5QAnuiJoie
         Fuo5YQW/W9vaMmV7Ktlgb4BtcdKPbSFnVVebLs77g7IyDMlwBMwCJIf3s+HufJSB+fqD
         8C7A==
X-Forwarded-Encrypted: i=1; AKwUvByRQ0YrZpLKuOTnBQ1slceQNsHPAMYfZAsNkpp2QwD8ZGZ2ovce1pLeTa2+1SHtoSWd389Taf4jcjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtgYJ+mltmO92nAeI8AKeS7jX9nqz8xJSSth6ZIb2yncSHs/JE
	GBHY5mBwBvx0l1VGmvQWw23z6LFJ7F/3tkmHXsfswXTY0vMNrRSB9YLnboxDx1SVV4c=
X-Gm-Gg: AYBFou1Mpr7Hpso1HaL3WrCjepLal7P9IXQZNyOp5gh47p5AxXe4ow9SXB0abSOgVOt
	J4ZA+uGe52JMKzCLvnBFzIzxKcRO95w6vsVdFxIwWiriE80dR1BI3v/8mfRM16RgHpQBRSiP7En
	kay5nQPu97+jCTbdyF+lYOMSYeMNLX1eHsU/0V4kP/PrxKb1SnDmsPqVtrz+nfs6s6aF/3QZUA0
	FoC5EFevRosd2jT3b7Ma+zkb+SzZtGHmbB+ut0AdYQIxzHLroQvzPR/IbhC0Uy8qsqf5TmhFJu0
	bvBKijVy80psIaABzH6J2qSTWFjaA8OoFmh7eWLPbA1epZC8UMTTVxfPQkLOoPZWwkLzkmwFOV/
	ftyHXS93edDufAhhdtQF3HImn3JI0IoPGDaGz2yfVaAy6ENDFnfsNLYxxZeLcYSdc04J5hZPhmL
	3Q2hSXOjeby8nw+lqFqpLLfPjFx/NwW4Aokr2M5mqe8h6zhWR78+nvWyUoLtUUbL54M2cMgS0Vm
	Wo=
X-Received: by 2002:a05:600c:4455:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4a1e225b8d7mr85661165e9.14.1792402069375;
        Mon, 19 Oct 2026 02:27:49 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm188133145e9.3.2026.10.19.02.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:27:48 -0700 (PDT)
Message-ID: <5ce85fe5-f1ab-40ff-af26-7c315a0d47a3@linaro.org>
Date: Mon, 19 Oct 2026 10:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] coresight: perf: Validate context before resuming
 trace
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
 <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> An AUX pause ends the current AUX output before trying to begin a new
> one. That new beginning can fail, leaving the CoreSight path published
> after the perf handle has become inactive. AUX resume may also overlap
> a normal stop which clears the per-CPU context.
> 
> Pass the per-CPU ETM context to etm_event_resume() and centralize both
> lifetime checks there. Use perf_get_aux() to confirm that the AUX output
> handle is active and path to confirm that the context is still live.
> Resume the source only when both checks succeed.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index c7454da5c881c4a8eea5cc77902c9113c297096e..e3c9d3cf84c502f357a430bc3bfa854a776618f1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -517,11 +517,17 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	goto out;
>   }
>   
> -static int etm_event_resume(struct coresight_path *path)
> +static int etm_event_resume(struct etm_ctxt *ctxt)
>   {
> +	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source;
> +	struct coresight_path *path;
>   	int ret;
>   
> +	if (!perf_get_aux(handle))
> +		return 0;
> +
> +	path = etm_event_get_ctxt_path(ctxt);
>   	if (!path)
>   		return 0;
>   
> @@ -547,8 +553,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	u64 hw_id;
>   
>   	if (flags & PERF_EF_RESUME) {
> -		path = etm_event_get_ctxt_path(ctxt);
> -		if (etm_event_resume(path) < 0)
> +		if (etm_event_resume(ctxt) < 0)
>   			goto fail;
>   		return;
>   	}
> 

Reviewed-by: James Clark <james.clark@linaro.org>
