Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008198;
	b=jfG59H8ikqqzlGqXW/i/5yPRiIPj+plQ2iH97aMbnZjNMKe+sKUX0RcRVaEufMgmhFj2
	 nK9Xku9ZyEJ9sChAWTeSLiSXM2TLyz21cvxdo9vyeE4bK428D9Ervyrb8EZdSmXnF1DBt
	 TbrOfizVJTbbQhj1r4OSKFFGS9be8bLQOSRlXI3PvtNfQSe6Lj6yr6JOupt3oAt/GziyC
	 OkhwIQbf3qYoE7i61Hzq8AcY/9rpfiVEypXJ7WWWtDfan3q90bXp/VKWB5Q8kyCceFPm0
	 qkN6JTLkHL8MtmsTSF2srI6GEiXzhLJyDNmYfQ4eVMq0Pzs7eN5k6oDmsuj05ypNogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kgHqO+fhYKyfCEdeXUZGJLv/oRemT+gvt+GWE9ye3yM=;
	b=j/hogp5LmQTjUXjq3DlHFq1dJcehYfAnb9kknuUeTay2a3t3Y21OwzaMFVjY/OU5UZ/2
	 0x5Kpmw6V9p1INofS4jMCokP9cvwCyZd6Z+h/jwVnOW7c0usxU2jmVsoyJrjXjUnm0jZ7
	 neqqPpIbKFv+6p6z+jlOZOHiUCCzJP63fBKV0U6/RtleWesCBSXp9PQR/7sC+bE1zm4uq
	 7ngnK9B5Ma6LQIHcKPtD4Mu76SMGNPoY8a9eIG67Qwme5tIlZqV2LpTn2ctniLUDuTA0H
	 HePFWNuFgU2DzVHmN/3lAvrJVeniWrQXFvp3lFCyxdOLT4VeCr4U+fCsz/YhrM4IdIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNo+WCeI;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68FE606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNo+WCeI
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1468176f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008196; x=1793612996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgHqO+fhYKyfCEdeXUZGJLv/oRemT+gvt+GWE9ye3yM=;
        b=RNo+WCeIwCfpJ0C/z/FjHnmIM0LmAwnN4NIHt7+1KEZ+c4ykIrJ+GuDq8z+1OEDcjt
         MYx4qzeDeKiMtfgLeBJjhtL2/B0YRHlN/luBIQpLvdCfPnSmbGj8FWDx1e5wcJ9qytax
         RFL+sWZUUpF7enMLzYPWqkfoPNj0A/oskyWtqBZ7oaxeYCf/y+wouOuSSvwE2gKcmfHz
         MmZqXEQQPQCfRTO0zXWBy9PCbVgQ1qkhKhKtNLJXqJ0ed4mOVr7VfB9lTpqaMwlyYzd4
         lM0eNv3/O1en2uCC8ppSuE+rLpoTjwm44NACw9ceThEd4qb1O5b5Zc0vqDzVk2QV0zui
         d5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008196; x=1793612996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgHqO+fhYKyfCEdeXUZGJLv/oRemT+gvt+GWE9ye3yM=;
        b=OWxOz0QpIsZ87iTFAMDwj99/4xw7bbW34kw7nbY3GuJ6xXmiS/ALK4xtm6/iZvp1Ql
         t0lR0pZdpoiGWe7im1MBt3l6ZbHHUNgEum5aL2iM/U4FsmSbA5HFjtNPLj7SgcXgpitR
         VGWnL7Jf5qQLVl3X+5kgZM8ZxnDekLYNSJqFgx97qRFOTJpJrZKwrH/2UvUwh9mRKBf9
         6qBhGQebyCU15OlSRvZDA8vGCq0Bmzpsk/CDdszY6LuFEuF2PRJbDm/zAbAMW+ZXninO
         jOhoNM908D2L74H1YUwuQHNIi11BmrgFiH+KuI5T30smbtnG/152QOOqij+qoZaqq1uR
         Octw==
X-Forwarded-Encrypted: i=1; AKwUvBxp+hVwawd+jC2ODoq3tUBTorCLmcrRlMdcvDNwkTBwyJT8bEbJngnEdJi+CRB/9A6snJv05c8EkcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmXMjdCTIuM8nYqLU9sRKyBNxWyxfAETtwjug3EblRJ0y+8C4n
	a7FYUUnOj0nISYlACgaYKzYc8qsQsnIH+8o62l3UoCb5yJy4rQPgMVWrA3Y9Y971gd8=
X-Gm-Gg: AYBFou22xRMNf0EhYrzQfLUphWMrsRoRPFMJqgG8Zjlnb7ACUZF8oaBjuwe6yCe+1SO
	oeQCyK5TT2B4XDE4Qd2iGGtOmK3id4tGh/uuNpgRonsFi+RmROGZMqegUNCZ8aSArwkMaruj9AV
	N9RJeoaITgpjYFeDflZ69q2trn33J8K8lnaieQXhSOQ3QId+2pl9lfMsk3kw8lSdn1l5Q6S9HXt
	zRLeGyZb1TlIib+4uTNIcnLVlKarzyABY/91yv65bmmQQ00+ioC6wlLyt66BgXak+k+fboVtbmo
	9yvwwPOPvyfhNKvTVVVgEJkPU91IcafYFZH+ea1jgkpIYWcYkcnv0rOFJemgcuNGSjCQLQEurjE
	ATpsVHeYxyJqkb6DauQhYQgUbA2ENoa84jBcn90ozbFPbjowayDx5Qv7KVOkGbQ6BELENxvU7hc
	UjccqXK02pQKSpebJlTIbvE3ErZGsJqosMC3bSUD91OTZXUdMh+ae9NwBkmoCFBVtThJ0EgvkX0
	df/EQpeo4kCPi1u5cLEE5JnqXqZj3qmj8L4sGk4HFN06dWgFVq2H9OOl2c8
X-Received: by 2002:a5d:6f08:0:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e3eba1207mr11656985f8f.51.1793008196231;
        Mon, 26 Oct 2026 02:49:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm10525562f8f.40.2026.10.26.02.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:49:55 -0700 (PDT)
Message-ID: <c445cac0-a124-4499-b99e-21fba1e8bd1f@linaro.org>
Date: Mon, 26 Oct 2026 09:49:54 +0000
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
Subject: Re: [PATCH v4 6/7] coresight: etm4x: Report whether the PMU counts
 the external outputs
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <a433810b85a9b768489d7b7b3ceb50324a2cd336.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a433810b85a9b768489d7b7b3ceb50324a2cd336.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> Some CPUs count the trace unit's external outputs as the PMU common
> events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
> PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
> have no such events, and a feature relying on them would silently do
> nothing there.
> 
> Detect at probe, on the trace unit's CPU, whether the PMU counts every
> external output: the trace unit has an external output for each of its
> events (caps.nr_event), and pmuv3_event_implemented() reports whether
> the PMU implements TRCEXTOUTn. Only check ETE: per its specification, an
> implemented TRCEXTOUTn event counts external output n, while whether that
> output is also an external input is IMPLEMENTATION DEFINED.
> 
> Add a CS_CFG_MATCH_CAP_TRCEXTOUT capability match flag, set it on those
> trace units, and show it in the feature's configfs 'matches' attribute.
> With capabilities matched separately from the device class, a feature
> that requires it only loads on those trace units.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../hwtracing/coresight/coresight-config.h    |  2 ++
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |  6 ++++-
>   .../coresight/coresight-etm4x-core.c          | 26 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm4x.h |  3 +++
>   .../coresight/coresight-syscfg-configfs.c     |  3 +++
>   5 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index 220bc54f8e5e1..4cf53230854d0 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -38,6 +38,8 @@
>    * a device that matches one of its classes and has all of its capabilities.
>    */
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
> +/* the PMU counts the trace unit's external outputs as TRCEXTOUTn */
> +#define CS_CFG_MATCH_CAP_TRCEXTOUT	BIT(8)
>   
>   /*
>    * Limit number of presets in a configuration
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index 52cb036bb04b9..9e4dc5950c13d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -176,9 +176,13 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>   
>   int etm4_cscfg_register(struct coresight_device *csdev)
>   {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>   
>   	ops.load_feat = &etm4_cfg_load_feature;
> +	if (drvdata->caps.trcextout)
> +		match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;
>   
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> +	return cscfg_register_csdev(csdev, match_flags, &ops);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index af017bd8a5477..cb5fbb0279b88 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -30,6 +30,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/perf_event.h>
>   #include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/property.h>
> @@ -1399,6 +1400,29 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_caps *caps)
>   	}
>   }
>   
> +/*
> + * Whether the PMU counts each external output of this trace unit as
> + * TRCEXTOUTn. The trace unit has an external output for each of its events.
> + * Only ETE is checked: per its specification, an implemented TRCEXTOUTn event
> + * counts external output n.
> + *
> + * Must run on the CPU that owns the trace unit.
> + */
> +static bool etm4_pmu_counts_extout(struct etmv4_drvdata *drvdata)
> +{
> +	int n;
> +
> +	if (!etm4x_is_ete(drvdata) || !drvdata->caps.nr_event)
> +		return false;
> +
> +	for (n = 0; n < drvdata->caps.nr_event; n++) {
> +		if (!pmuv3_event_implemented(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void etm4_init_arch_data(void *info)
>   {
>   	u32 etmidr0;
> @@ -1562,6 +1586,8 @@ static void etm4_init_arch_data(void *info)
>   	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>   	caps->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
>   
> +	caps->trcextout = etm4_pmu_counts_extout(drvdata);
> +
>   	coresight_clear_self_claim_tag_unlocked(csa);
>   	etm4_cs_lock(drvdata, csa);
>   	cpu_detect_trace_filtering(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 5417280cdb274..33994ad4b2641 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -868,6 +868,8 @@ enum etm_impdef_type {
>    * @lpoverride:	If the implementation can support low-power state over.
>    * @skip_power_up: Indicates if an implementation can skip powering up
>    *		   the trace unit.
> + * @trcextout:	The trace unit is an ETE whose PMU counts its external
> + *		outputs as TRCEXTOUTn.
>    */
>   struct etmv4_caps {
>   	u8	nr_pe;
> @@ -907,6 +909,7 @@ struct etmv4_caps {
>   	bool	atbtrig : 1;
>   	bool	lpoverride : 1;
>   	bool	skip_power_up : 1;
> +	bool	trcextout : 1;
>   };
>   
>   /**
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> index 2b40e556be872..7b3800138f625 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> @@ -250,6 +250,9 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
>   	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
>   		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
>   
> +	if (match_flags & CS_CFG_MATCH_CAP_TRCEXTOUT)
> +		used += scnprintf(page + used, PAGE_SIZE - used, "TRCEXTOUT ");
> +
>   	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
>   	return used;
>   }

Reviewed-by: James Clark <james.clark@linaro.org>

