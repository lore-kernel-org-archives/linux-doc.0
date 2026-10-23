Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748984;
	b=Sd/Q7E5Mb/6lKlBdS0NqKcE35YfIOajiGnNPUYVhHY3SNI81WlfaMQlj6rbqnIco9jxG
	 WyhJIZfDLCPIdFkY7OB8rnATtb39Xg1I+6IcbSEziXtgWJvGSSo84kNjhV+9u4wVuGtY/
	 bIwfz/Y3d5FHlTIHboF92RsPfz68UIivg76Y4/EtYzcZ9HJhOHY5O+IqrqYCDcv7P5fhh
	 sHmWBD/lYmek81RrXSlKxpLsRK30uxiZl0sFKjsHIMfWbrqP7FMHtg/62XR1ppJYXWuNf
	 U41wJFq7BcVcK4pjs348I+AkeJw2RexK52POZzop3HqPqkuzLCHqy9+COJlsRUjaWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
	b=E8P224T4dp6zRQXdxLbR0Q6WVSxrTiipfnGaeiMeQImPrmjCQ8vA5YIvfBvJRNkrFYtp
	 6TC0rrhDKbk/uaaiTpMfvDGh/gp6KUq65Rkse9cyybAkXyx2dibqWC9aJy3yNONPMJolP
	 r4J0H72QLyF5igIT2ERcsWEWqnshZ5y4G8Pvu1hZMD/A2gysYYM+1SG5FDfI55YRZvYFg
	 nQdTi7fN1CMSYoAsN8UGkpWDH0psbDuhGonOxIVj6kK0ac1gkjc0n7pCtX3oNEfYBs83g
	 YvOqnDotDpBzfW3KShM51/NJDDjfWSiRtJeZAU4HPDV0P/KlbVERzC7ym6i4cKaCU8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QOT0oLAh;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62979606A31B
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 09:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62979606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QOT0oLAh
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso5219865e9.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792748982; x=1793353782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
        b=QOT0oLAh+FeYwcTkoAfVaGLY/v1gV4rsyp0CG7wb6tyeWo53uQsnK3CwAfICpxPr+T
         ZgMQlodOxZuqNFSMzPNDlakYZe+M0Xs6rIlVOd4uBZeODJJRu2Aj71IFlrY/fIVMH0C5
         qZd40lddHdmoPcNP7jJoTXwe4HbYteKKjTpZQDztK7XRuOdxkHWf1585ctxEns7iq8/3
         OObTGNf9j3xDjIMRvOGPMXu4S+lhFuxf/i4JsA93AGJH0J24oLs+2O2ptK6gaCppnYKt
         p0HtW0OtexsJS2REv4yIjlrjma0V2nwHiyo8wvZE0qRFam/QLgX7WE48/3Kbqb9v1WiD
         XFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748982; x=1793353782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z78MqIHDK60vritw6uCBZEava4BYph884iz7OBBTNM8=;
        b=oCpZzo+DwmKW1iIumeszsMaq1ThBp7AWcu3zwg2kVjw3ctOWLmRsFcWqmlJe9e7qVa
         oOqpMj1Hyafn6oGhXZsmt747UjQ/SvIz52pxUUpG7oOUr3VfGc62Jg3dgEgBFAGIZe9s
         OBStsJgG8EagnhH3fCXkI96OkYM47I6SEQxsZjOQS6kIF391DohQmYKqVhHcCkkx0vha
         6oznbVEFi5dZNyg2/40dNltDdXlZhr5vfx5SINCD9B9kmj9qH6deCexpZiEGBZZAtJ5H
         HsO35YKjgNYdy1JaWF4p0qwBhPhcrzRxifapLS5qUGCqi0BmDeH1CgaKlPS13m/Z0mz0
         IXgA==
X-Forwarded-Encrypted: i=1; AKwUvBx5JrlV+fFoBsoG2nWnNUHt0e6WiYnsAAp8URv43bq4byT+6r76gh4NNOhrGT+1x4o3hC5CSWPsyWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnROTN7lesXgx85uvgOD5Tix7wfIqPm5G9i7BEerf08K0cOXuA
	+JZ9JimgusGWvtaKCtOTGcFd9hcv0YZkjaofUQ2UxZbiBea0yG4itqrrWQhG2/DXVFfLyEUZLZv
	zET0cuGXbhg==
X-Gm-Gg: AYBFou361hmpV/mfHJ0WQeJTlFNb2PcJF7o33QeLXqywvtNTLTq6B+SYMvvXU+Tr2dy
	Uhi3kQhNpbYIF08ogzLqblk0QRmgohaeCw4Un5zspukU7KWyVS0g6ZDdJTrotsqjDtJe4bE8qKm
	7QzCPIaFLprjfFeFbP/gj4bRu6bc2ZHPM5EpfqWZ2DxzHiFKiL5GvafYkXKP8XyAW1kUVCCflYC
	xfZrpScRwyiRUmCYIWNROxpTILxFFElOfvNlB4bQYgwefW3Cjgso0UtDCsJumhYAM69KpFm0K35
	C5wPKIHEKsvTQi3Q9xdFinnKTPQ8O0G3nhSjSN8HSlTrGICYk2kdd+n/CljYpS6D9PDiBzJbW6C
	twnacfp6rluq0USCl9xNPE5PVi5pDaAzkTrE6carF8QWNcqLS2XGJn6qKGfgfXW2bndJIXeKR4v
	qPZb148mVukfllYiyoXYmWDeQ/APurOKjr3PIq47lSor7Hd5hKAhDVVrCLRfN9dN4ShuMjoFTW+
	bS6mLJZOoNFRUTHYymWUch1u+Uv2dPPVqAEqKuAz+lpjM1r1XdBO6ETSgYz
X-Received: by 2002:a05:600c:3e0b:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4a2150f1703mr22409525e9.12.1792748981720;
        Fri, 23 Oct 2026 02:49:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2103622f0sm64638015e9.6.2026.10.23.02.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:49:41 -0700 (PDT)
Message-ID: <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
Date: Fri, 23 Oct 2026 10:49:40 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261021164332.GI26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2026 17:43, Leo Yan wrote:
> On Mon, Oct 12, 2026 at 04:05:22PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>> --- a/drivers/hwtracing/coresight/coresight-config.h
>> +++ b/drivers/hwtracing/coresight/coresight-config.h
>> @@ -35,6 +35,10 @@
>>    * a device that matches one of its classes and has all of its capabilities.
>>    */
>>   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
>> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))

Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use 
that instead?

> 
> We can just use a single capacity for all output singals. It would be
> good to follow the naming convention in the Arm ARM:
> 
>    #define CS_CFG_MATCH_CAP_TRCEXTOUT            BIT(8)
> 
>>   int etm4_cscfg_register(struct coresight_device *csdev)
>>   {
>> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct cscfg_csdev_feat_ops ops;
>> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>>   
>>   	ops.load_feat = &etm4_cfg_load_feature;
>> +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>>   
>> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
>> +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> I would suggest to enable the capability bit base on drvdata->caps:
> 
>    if (etm4x_is_ete(drvdata) && drvdata->caps.nr_events)
> 	match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;
> 
> For now, we can enable TRCEXTOUT for ETE only, as this should be
> sufficient to detect the feature safely. I'd like to leave this to
> James and Mike as I got suggestions from them.

ETE only makes sense to me.

> 
> Please also rebase onto the latest CoreSight next branch [1], which
> moves the capability fields into drvdata->caps. I found an issue in the
> decoding of caps.nr_event; the attached patch fixes it and makes the
> field hold the actual event count.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git branch: next
> 
> ---8<---
> 
>  From 95307fa0574b1e0b3922ffa23fe98144b2688496 Mon Sep 17 00:00:00 2001
> From: Leo Yan <leo.yan@arm.com>
> Date: Wed, 21 Oct 2026 17:05:18 +0100
> Subject: [PATCH] coresight: etm4x: Fix event count decoding
> 
> TRCIDR0.NUMEVENT normally encodes the number of events minus one.
>  From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
> means that no events are implemented and NUMEVENT is zero. The sysfs
> event controls currently interpret this combination as one event and
> allow writes to unsupported event fields.
> 
> Decode NUMEVENT after NUMRSPAIR and store the actual number of events
> in nr_event. Use the decoded resource count so that older ETM versions,
> where a zero NUMRSPAIR represents one resource pair, still report at
> least one event. Update both sysfs event controls to use the actual
> count and clear their event fields when no events are implemented.
> 
> Also correct the instruction event enable mask for the single-event
> case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
> event 0 from being enabled.
> 
> This change depends on the recent driver refactoring. With no reported
> failures, it is not intended for stable backporting.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 13 +++++++--
>   .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
>   2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e954..af017bd8a5477 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
>   	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>   	/* RETSTACK, bit[9] Return stack bit */
>   	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> -	/* NUMEVENT, bits[11:10] Number of events field */
> -	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>   	/* QSUPP, bits[16:15] Q element support field */
>   	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
>   	if (caps->q_support)
> @@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
> +	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
> +	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
> +	 */
> +	if (caps->nr_resource)
> +		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
> +	else
> +		caps->nr_event = 0;
> +
>   	/*
>   	 * NUMSSCC, bits[23:20] the number of single-shot
>   	 * comparator control for tracing. Read any status regs as these
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db9e603f97ba8..fb38f0102290a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   	switch (caps->nr_event) {
> -	case 0x0:
> +	case 0:
> +		sysfs_config->eventctrl0 = 0;
> +		break;
> +	case 1:
>   		/* EVENT0, bits[7:0] */
>   		sysfs_config->eventctrl0 = val & 0xFF;
>   		break;
> -	case 0x1:
> -		 /* EVENT1, bits[15:8] */
> +	case 2:
> +		/* EVENT1, bits[15:8] */
>   		sysfs_config->eventctrl0 = val & 0xFFFF;
>   		break;
> -	case 0x2:
> +	case 3:
>   		/* EVENT2, bits[23:16] */
>   		sysfs_config->eventctrl0 = val & 0xFFFFFF;
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* EVENT3, bits[31:24] */
>   		sysfs_config->eventctrl0 = val;
>   		break;
> @@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
>   	/* start by clearing all instruction event enable bits */
>   	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
>   	switch (caps->nr_event) {
> -	case 0x0:
> -		/* generate Event element for event 1 */
> -		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
> +	case 1:
> +		/* generate Event element for event 0 */
> +		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
>   		break;
> -	case 0x1:
> -		/* generate Event element for event 1 and 2 */
> +	case 2:
> +		/* generate Event element for events 0 and 1 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   						   TRCEVENTCTL1R_INSTEN_1);
>   		break;
> -	case 0x2:
> -		/* generate Event element for event 1, 2 and 3 */
> +	case 3:
> +		/* generate Event element for events 0, 1 and 2 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |
>   					     TRCEVENTCTL1R_INSTEN_2);
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* generate Event element for all 4 events */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |

