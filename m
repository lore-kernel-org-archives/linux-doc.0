Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502429D270
	for <linux-doc@vger.kernel.org>; Wed,  1 Oct 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759326252; cv=none; b=M0eVpS6vnKBHDuUpw2KGcWqsNt0zPEtoazSXCbDiqz2nKuDjxyFjVNF6ycfENzJ3P5SBvG1jm6qe4DSMkSOYiBVhr84oakk52KqBIodUxluu9xHbZqHeGUwa68QYpwFmu0mDrqRZhqqNNZX4e5SSxkq6qtL7JHPGzIZ40QrY62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759326252; c=relaxed/simple;
	bh=zZG41IIPpecftPSR/BMuKoOK5Drk5rCESRq1EzmErag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdLwZDAdYgbYtkfdV9De2TlS5zSb5/VxKKvaoWS8L+bJSljfXvwP98ME0d4J1TiJzg9FnKd7PPJ138C+ZPmheZ9Xr1CNwt5mQ+ZRru2RS7xvB3bHAjc2wnLtFNDKIPzAixxhREt0tp3dqQINwq6Mpo8m5V9cXQ8LDxGk2/cTFc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8fVYTZj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8fVYTZj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46b303f755aso63942215e9.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759326247; x=1759931047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sk9/01sjLhSDKrsz2vI2OXUeP/F7c38Pwscg4TdgVDU=;
        b=d8fVYTZjCsKyvZALElY1lsLUXATVDT8AzqlDb4am5IdPnsgxUl95tP2R2i8hr2f8ry
         EL2Cu8Woz6/bBb2oyMaI8PuUiwujxLFxSV+qwIwyRPCaul9fG6HzWSJOxHnsoFIXYtes
         o6LZXUWcpJDxvwq7VTYhmHtrze+Djf20PEXQINA1p/rcQI+/NmA594cIZ0/YX5GOXlax
         ULJAisesNkNHdaNz6BDGQAxibpaYSKTGbOBoGIL+GrbGpkPrQgK4RqT3k7YgBzGCcnDH
         pCDASkbL7Xj5lnqXgV/Pq8b89j0J4mv7kyXG0euLKbTeQeqgRbIQQkW2zX8BgichHeMT
         jFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326247; x=1759931047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sk9/01sjLhSDKrsz2vI2OXUeP/F7c38Pwscg4TdgVDU=;
        b=RlGsCfw0+/0qHwRuU9p8SyykRAv1OIGngKScDuGbz3aBTQM65ciILJlmkvrqwPr/7X
         JTUnfpQr91OOk4GtV0mdI4BXStoGtaM0lCCpFGF398Iy4vQtO2POuZ7SvpuFAlv7w7WG
         M0kBoCr/v35uLOlqXr8p+lrJOYt2qiZAga5l9WuxgqasIswn2l/604aZhYzSF2mL7EXm
         gchaWoenO8JfWU0re70UExj22RwYY+9Fz5fuqtT6R3IHMYJB5Q3zsyTuABhWtr5J+Ohk
         dW3S6IaKN/xdGlv8XpBn4YyaRhsU3qOB0A3uDFdJ2tXQcxlZj8UahK5518Vtr608iUnW
         2RWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGN7Rr584iOnqewd8O5huGrnlU5a8rHwM/X5LEz8w04L0/2eg1P43tM2QV2HoXBia8yn/UcFX/sgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVpvX0kDX8w/IFTyW4K+Q+ljHgWndnCLofD8iaG9a75Do+YCcp
	JPmjG9KQa86OW5GuM/PZnn+b6Ool/O51meuQEnTTa9nFa4JAD5/HGOxV610bZsYaD28=
X-Gm-Gg: ASbGncvM0qHboc9z/uPcMHajNS6ZzEnNs+x+JP7Cdh633vuHklgsM7mXC5qOE5Tn0wd
	FIZVosnlW/6Xy5mssywW+OHqRWH9II9kKADjX/JIHZ/e6FoCUqVoyajnNcBLI5g0WTIPC/YCEku
	J4SVxCLLg1yTiRSZ5poU2t0nuT1WoLWQmZFMCAWASZO7pqlFJkIsklDRyv0pA9j+QRJrjCoJZ4l
	gljFBxOjLxd+qVT0lSARlIellbUFCPnI4UAAVBIBW9r/I23P26RCCL/dD9/l80RSMjTtd2iezO2
	rpteBcYOlUV2jHYOO3QwqmWj3j5D62On//7clW5/j9a2CY9wZKj8QzccjV5y1WNcSFuuVUEZS33
	R4fzPMC/YLFEkr58RcDhHQwaLuGQlN9fanlalMSgbeFwQEWSgHNDxFumr48bCtfY=
X-Google-Smtp-Source: AGHT+IEWE5njzkAVMh0iSC7VPEQmyUpucrPcJT/AcJg5bY23uL7H8GGcf4J5p6a5shSngpQ//r/sAg==
X-Received: by 2002:a05:600c:c162:b0:46e:49dd:525e with SMTP id 5b1f17b1804b1-46e612bc070mr25722595e9.21.1759326247407;
        Wed, 01 Oct 2025 06:44:07 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199250bsm41317945e9.3.2025.10.01.06.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:44:06 -0700 (PDT)
Message-ID: <708a5bbd-2bad-4f94-8fd1-6bd10825ba71@linaro.org>
Date: Wed, 1 Oct 2025 14:44:06 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
 <20250930151414.GK7985@e132581.arm.com>
 <3a731a9e-0621-42b6-b7fc-4b0fd9b7da6e@linaro.org>
 <20251001132815.GN7985@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251001132815.GN7985@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/10/2025 2:28 pm, Leo Yan wrote:
> On Wed, Oct 01, 2025 at 01:40:37PM +0100, James Clark wrote:
> 
> [...]
> 
>>>> @@ -103,6 +111,9 @@ static struct attribute *etm_config_formats_attr[] = {
>>>>    	&format_attr_configid.attr,
>>>>    	&format_attr_branch_broadcast.attr,
>>>>    	&format_attr_cc_threshold.attr,
>>>> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>>>> +	&format_attr_ts_level.attr,
>>>> +#endif
>>>
>>> By using .visible() callback for attrs, we can improve a bit code
>>> without spreading "#ifdef IS_ENABLED()" in this file. E.g.,
>>>
>>>      static umode_t format_attr_is_visible(struct kobject *kobj,
>>>                                      struct attribute *attr, int n)
>>>      {
>>>           struct device *dev = kobj_to_dev(kobj);
>>>
>>>           if (attr == &format_attr_ts_level.attr &&
>>> 	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
>>>                   return 0;
>>>
>>>           return attr->mode;
>>>      }
>>>
>>> Otherwise, LGTM:
>>>
>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>>
>>
>> Unfortunately that won't work because you'd have to always include
>> coresight-etm4x.h. This file is compiled for both arm32 and arm64 so it
>> would break the arm32 build.
>>
>> I could define the TTR_CFG_FLD_ts_level_* stuff somewhere else but then it
>> becomes messier than just doing the #ifdefs here.
> 
> ATTR_CFG_FLD_ts_level_* is only used in coresight-etm4x-core.c, it is not
> used in coresight-etm-perf.c. Thus, we don't need to include
> coresight-etm4x.h in coresight-etm-perf.c. Do I miss anything?

Yes, GEN_PMU_FORMAT_ATTR() uses them but it makes it hard to see.

> 
> A similiar case is the attr 'cc_threshold' is only used by ETMv4, it is
> exported always. It is not bad for me to always expose these attrs but
> in the are ignored in the ETMv3 driver - so we even don't need to
> bother adding .visible() callback.
> 

I disagree with always showing them. I think they should be hidden if 
they're not used, or at least return an error to avoid confusing users. 
It also wastes config bits if they're allocated but never used.

Either way, this was done because of the header mechanics which can only 
be avoided by adding more changes than just the #ifdefs. There are also 
already ETM4 #ifdefs in the file.

> Thanks,
> Leo

