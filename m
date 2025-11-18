Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0ED35E521
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477798; cv=none; b=QVPGgFR9kLY7gMwi2PKNPaosa4seM59HND7RvL63ALpSCFt8eVIoux3LCYag5vCCU07UZx1wZwu2UhnEJwW/gHl6ODHXl/oJlXgUfUwpHByci/2Y5Plvg4Sacy9tfsWPfbtJ/xKmB6iBPBt6zSBOWOlC0JL6gGvjHWKEBlPDfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477798; c=relaxed/simple;
	bh=gSblTBuib/DsPgf51W9AKdDlVBmMrOZuq9XqBR+F1Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rs+fH0Bed7mGe/TLhFgK+Xqu4eF4HPHY+LL0aVgaJVE8P0uWswOwK+R263NZXthvfgnwmr7qurtOz9p5ZCugbGCMc4tWldDUqNQ6w6eUdR3Tg+EyH1S85raGs10oJL00Yhgv7VdIH+sjH7Zj6f8zKHoGFbVSXhOx5aixa76Hjyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPBrSkXS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPBrSkXS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso39053665e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763477795; x=1764082595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erEHQ4pvbvg9bgc6g+PKRhvaKSni7/5fNBZmCyyjnTM=;
        b=RPBrSkXSCdy1PXsRaZQebTUCKek+7FaNeCNncOukHZLAITh64MY3LT6l0m1fU0s5Kx
         pD5QLShmAnP35S89yGhkj2+8v9ed8v0ETYJVoJSClCbv/CHVzZusISvyo3T0SWqxddGX
         ULKXuh8cX5UtGhF3MIdiyOhRIV4BzADsM2xfM7/tVfbzIZymOzCjVvhEDz8G5Hxm+kgT
         NbMlVyjn+JtsElXXgZ788I5UHqoCk//kGO9kEoQbtmRzp1+WD1PlOKSEwUqLOpnQbh+I
         Z4aPhG2DJUW7P5U5GTMBwLwpu4CzWxR2sHlInoWL69+qeFg0jxUIUap133lj5Vcooh1I
         QrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477795; x=1764082595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erEHQ4pvbvg9bgc6g+PKRhvaKSni7/5fNBZmCyyjnTM=;
        b=FSu4fttMU1l0mVPyESBMUMqJ5Nmn8YbczSnhAwTrxKaC1yaeNiO5VAcwDiQeA8lcPi
         cPKSqP6VkWX8ZgOqs+y6ghxafJOQiUBw+OL9zCOBBsftZMGnYZ4ucWJXhv03W3LtFWL+
         xEPGml62y0lvu1rAG01GuFCNvBqlSmS6w/XiiCqohLVYNQSd8+fvvfoJi/h8JTR98FMO
         x0Sv7SZD8fT1IGuBTQoLaAD1eYyN3vfpTudWKf/EI3qOacxO0wH6KN1MPqlAmYnvDcQN
         dX8AX4qrGwWFQkG66qieGJD5B3cW6kmGZiOPersYaEe+uPEdGosyfxPGTUx3tYfDV3HG
         dB4g==
X-Forwarded-Encrypted: i=1; AJvYcCW2P5/QQmLJvG93yZgNiT0T1TCou305n7fExLbDsPetGwB/zYruQSLuCqmnd6fy2XMcHZ7AgRHKBaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0doo6uXLXCThhiEjrBeCBvKF2T7wIwvUtAWu195Cxo7RHUlyN
	0IgSOYjJT1lQJy3tEs7qfeDSt2/2k3ooACbLcCmq8pi2dU7RobfPYTIxp+cIWtSxRsb/Lnwe56m
	MZ9ndF0c=
X-Gm-Gg: ASbGncs2en9Zz6iVwiP+Xbtl7JBlpD6CBO1l6kst3U1aL5eVTf94bg2yEXAN3SWtGp7
	X4sey/YJtdJvV729EIgIYFBXZMRUnzZ+n5WRHYmTwMEgm/mgqTZHe5DcAFUWcV88kNhxfv9eFv3
	n4iPmEzUNOwjLRbog1rY6fwCSgHVOpxYA0PNmf27nu1cgrEDlzPsmeXA05dqvB4ZbDbfHNRTxIQ
	UjdTZziLL1op8tXTvXX/+ueaqFBMJh6a16PNzra3k03JNvzt+YEcCvRndkk2iD/OXi11zIFcTv0
	NiOV5VLbLGg1KkdGms7UJIJdxgM911DAyg8i/qHpO0BEmUJH6i8IZUGewhfqiqPDhGrhxC7L55A
	hNZ3L0zO6FWLzM6hNKRnS0819QkwKGiFyIHH+N0ZeUBITOerxGCfyXmhdFnO3OJTTuuOz3yVD6u
	LFQJRQACN/zjsvTtNT
X-Google-Smtp-Source: AGHT+IH5rPcLsF1PsanW87LKAAXsro5M9DDqlKkuIu9cobKHCgs8dMk+WcC9kiNwue3QlRTwXXWRBQ==
X-Received: by 2002:a05:600c:1d15:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-477aed0fad1mr12311775e9.8.1763477795371;
        Tue, 18 Nov 2025 06:56:35 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779d722bc5sm192660755e9.2.2025.11.18.06.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:56:34 -0800 (PST)
Message-ID: <0334300a-ae81-4b55-a3b0-c6137e13be6a@linaro.org>
Date: Tue, 18 Nov 2025 14:56:33 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] coresight: Hide unused ETMv3 format attributes
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
 <20251114145521.GD3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114145521.GD3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/11/2025 2:55 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:10PM +0000, James Clark wrote:
>> ETMv3 only has a few attributes, and setting unused ones results in an
>> error, so hide them to begin with.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 17afa0f4cdee..91132abca244 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -106,8 +106,27 @@ static struct attribute *etm_config_formats_attr[] = {
>>   	NULL,
>>   };
>>   
>> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
>> +					  struct attribute *attr, int unused)
>> +{
>> +	/* ETM4 has all attributes */
>> +	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
>> +		return attr->mode;
>> +
>> +	/* ETM3 only has these attributes */
>> +	if (attr == &format_attr_cycacc.attr ||
>> +	    attr == &format_attr_timestamp.attr ||
>> +	    attr == &format_attr_retstack.attr ||
>> +	    attr == &format_attr_sinkid.attr ||
>> +	    attr == &format_attr_configid.attr)
> 
> Do we support configid for ETM3?
> 

They're "activated" in etm_setup_aux() so this would be for both ETM3 
and 4. But they're only subsequently "enabled" for ETM4. So no, they're 
not supported. I'll hide this attribute too.

I can leave it for a later fix if we want to stop activating them, but I 
don't think it does any harm.

>> +		return attr->mode;
> 
> It is good to give a bit information why only these attributes
> supported, e.g.,
> 
>    /*
>     * ETM3 only support subset attributes (see ETM3X_SUPPORTED_OPTIONS),
>     * keep 'sinkid' attr for specifying sink ID.
>     */
> 
> Two side topics but not issues caused this patch:
> 
> - Since CTXTID/CTXTID2 is only used for ETM4x, we can remove "#if
>    IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)" from the
>    format_attr_contextid_show() function.

Will change to CONFIG_ARM64 as mentioned on the other thread.

> 
> - etm_parse_event_config() does not check attr->config3, thus user
>    sets 'cc_threshold' it will slip without any error report.

Will ignore this comment as mentioned on patch 7, we're not doing any 
errors for unsupported arguments anymore.

> 
> Thanks,
> Leo
> 
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct attribute_group etm_pmu_format_group = {
>>   	.name   = "format",
>> +	.is_visible = etm_format_attr_is_visible,
>>   	.attrs  = etm_config_formats_attr,
>>   };
>>   
>>
>> -- 
>> 2.34.1
>>

