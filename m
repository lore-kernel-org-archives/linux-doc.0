Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578C74E36C3
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410857; cv=none; b=AArsF8tE1p3oVC2zFkUhlMZIbfUqO0SFKmiqmJ0KTeSUN7hF0swOZSvz/ffsBJaI9vESZaS1+zihobDh8qxOxsNC1XjqHRSIU23ZwQ8JyXkWJWnzbzj88zLOqE+RimbPE9vzuGESLLL7IdnaERS89W8O/rjuoPWVZUp0vcFWSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410857; c=relaxed/simple;
	bh=IBXBdxbYHimkoMM+XMeqTFEe7fU69XJjeKdcPHeecxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/f0J1rGQ6548W4aoq7uA7Y7M8nEE6t28iO7aN+fPcI3Z5dh21c9t2VCXmVODIqrzirvM9E200X3+qnfD9n92sMawSe3+eJzmi/TZoLJUzhBeZO87sRVa4T6UDIqbDD5EEVxXz7YlnkMUQL8cT/cjAq6C1G7lMRmqPQb9N+2swo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3a4OZW3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3a4OZW3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0728so504496f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792410853; x=1793015653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Oq/GPmuBLsTY8Av2UJYLNH0P0AYmxlI1V5awo5gufM=;
        b=v3a4OZW3YYdFyZp1UYK50eE6m7aYc5DxJeSc8VkvI0U8qORmQ7Iw0EVlJfuN/NrJXK
         /DmODUK4xoH+1iXLS+jlBgffTuNFa4dyfnDmL0kYlVKC7BKgDrixTd4zXeyGG/bIixOL
         1k2AHlKR/aLmGdAH3z2OhqjJ7IGI4VjR/9Y+MBK70V2K9NSj3p6Hs/Jm8cvj6o03YO9x
         6KMHyKXtj+jgDE0jrcgJPSWgVjNxfXF7cuBAXPJMaBupxiz1hTNWESJ1UIsOBl7KhmVz
         BJMidgkKDRA7TNJQTiFKCI/gmAi92VYCg6SPcqqM7LfoPBmRIC0rTtb6pKOE1bJ+3zRi
         qa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410853; x=1793015653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Oq/GPmuBLsTY8Av2UJYLNH0P0AYmxlI1V5awo5gufM=;
        b=g6/3hscMg2Q+TgiXLwuXpuvn3Rb6uCze7VxkAIsVkbnNt1pvQ8GvdXIMlhWZVF5DIi
         UoqeWMhiGTd4aC0YAATzKuxVgnsa6HLoEvGPrEb37fAVdVXsK64qQuC8VTe3zgu4sSNO
         GvkQAKKOHJ7aT0sd6GSQzAg8yJMqQIA8VzlkaccF3vMLj39GOH+s6PT0i3H/56JTYAWu
         Vl6DVXLQh7s/ajix9P9PHcSyikTo+PmF0TvynKFoCbyK0OSZSaUwLIYAoIM6WADZggO0
         WQBDYzjmew6DKtHBmKLyFyjNYdHiHZl+DDuVAkyPwM9m+Zbiq9wOQHtYGzysezYbEQ9j
         XRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwevcu1k58OWtllKaF+QrvcXmUdVNnfc/u8abROc+MBNKXIYwx5BLPUrV51NwfqyR1RiLwMRrp7ljU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHa9bvm4SmJW9uTvMZvIFlCaSPNz0aPBVk2dod9pWrRFS+e69q
	gettH3R2hIVw2Z8KBvXiziCZfEKVwNc9DhnU+RCSSdnsXSb0dowgy3WJpIpSpbAWCAQ=
X-Gm-Gg: AYBFou1vtY4vblH0BcHLzk/jPx+ZK3NIgg+rcfiM2YFrAHHrQ8myjXEJ2p/PvsvTyiN
	nYAWDlQaIhOG/k9P4Dz/oyX7rudmz0xE/nmk0JnQdZpRlwXxmDwj5Q/fJFWp4wmuzFNq+6NATo4
	64fAEEz9ePOs3BcnTLt0ccmGGmmKcWxeUPKPfpgeSKO0dBaUD47mNs4LvHe04VF/e8mD0qWPnAM
	WvMb8Dbef8VdzZXGpHKFakZ3CRNZO4KmRffJBcWED0PCa2AqC8SiltwLWtX4fvNdOBRgfhDZGck
	hzHVzzDof3dLC5mtyZV1zEZ4CfoeQOX9RIPdMlcKqzBnCFSkPEYgzUMFQbRKDHJsIbkgMa36xXm
	AI2z501kEn2IyuCRXkYwYr3RWECYr1mY7M7+MqRSAIv8bz3bcTPLzujhrpnbbzvj1+/C1ZD/pMu
	e/ew/4tvZN96k8sDFaOb8xumxK73V1ABlMKjBkF6qej+BpqjkKRUPvEKza89f13HJ0s0N0YCMGF
	RM=
X-Received: by 2002:a05:6000:2dc8:b0:48c:4d32:ccf8 with SMTP id ffacd0b85a97d-48e07bbe524mr14711381f8f.16.1792410853522;
        Mon, 19 Oct 2026 04:54:13 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm21216127f8f.21.2026.10.19.04.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:54:12 -0700 (PDT)
Message-ID: <aadce723-2a51-4d57-8d16-03a101d1a93f@linaro.org>
Date: Mon, 19 Oct 2026 12:54:11 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] coresight: trbe: Track per-CPU sink interrupt
 handling
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
 <20260915-arm_cs_support_aux_sample-v1-12-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-12-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> A sampling NMI can interrupt TRBE while it is using the active AUX
> handle or buffer. Circular buffer mode avoids wrap interrupts but can
> still generate fault interrupts.
> 
> Add an in_interrupt flag to per-CPU sinks and set it around the TRBE IRQ
> handler. Compiler barriers keep AUX buffer accesses between the flag
> updates. This lets NMI callbacks detect when they have interrupted sink
> handling before modifying its state.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 17 ++++++++++++++++-
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index ab3c5c7d27f3d272b07eade1e6452559808b196c..8eb625d3fc99db57a18e35ef59ef814dacf20a09 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1185,7 +1185,7 @@ static u64 cpu_prohibit_trace(void)
>   	return trfcr;
>   }
>   
> -static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
> +static irqreturn_t __arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct perf_output_handle **handle_ptr = dev;
>   	struct perf_output_handle *handle = *handle_ptr;
> @@ -1249,6 +1249,21 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
> +{
> +	struct coresight_device *csdev = coresight_get_percpu_sink(smp_processor_id());
> +	irqreturn_t ret;
> +
> +	/* Circular Buffer mode can still interrupt on a fault. */
> +	WRITE_ONCE(csdev->in_interrupt, true);
> +	barrier();
> +	ret = __arm_trbe_irq_handler(irq, dev);
> +	barrier();
> +	WRITE_ONCE(csdev->in_interrupt, false);
> +
> +	return ret;
> +}
> +
>   static int arm_trbe_save(struct coresight_device *csdev)
>   {
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ddf18c970e343041787424c2019f2b5dd49154c2..8830c30be0df53a22525ef4fc3c7e41a0ec6fd90 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -275,6 +275,7 @@ struct coresight_trace_id_map {
>    *		when a source has been selected and a path is enabled from
>    *		source to that sink. A sink can also become enabled but not
>    *		activated if it's used via Perf.
> + * @in_interrupt: Per-CPU sink interrupt handler is running.
>    * @ea:		Device attribute for sink representation under PMU directory.
>    * @def_sink:	cached reference to default sink found for this device.
>    * @nr_links:   number of sysfs links created to other components from this
> @@ -299,6 +300,7 @@ struct coresight_device {
>   	bool orphan;
>   	/* sink specific fields */
>   	bool sysfs_sink_activated;
> +	bool in_interrupt;
>   	struct dev_ext_attribute *ea;
>   	struct coresight_device *def_sink;
>   	struct coresight_trace_id_map perf_sink_id_map;
> 
Reviewed-by: James Clark <james.clark@linaro.org>

