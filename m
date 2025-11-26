Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929C238150
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169693; cv=none; b=CnPtIddOG9P4NY/XkHSGlUaTlVk+8ZhMFajeS4ygTyMgNvRCn2Il0wZpLTJIipCojP0jEDYwKYCM8GQKRsOMJiJSR3o2oT3G9jxELwLpqN7g+8IFUzuDteFK9BC4tAdIVQf8FR2W4GPgv/bkIv3EygV3ZbwkEMSJmPtMA0u+ujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169693; c=relaxed/simple;
	bh=pELbEQhhXXFN63mjVgAqwM72vyKZdXSdreb+FbOJCpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8xbvin6nIVazN7NLcUmGneEGFi1iUKIxPXxPC+B8mILRRMG/mO6r+HZJ/VqB/xmOF0OcDepl6iXtnjTIeou7Zk8xLB4ikJJEJdxkURIOw/J0gynCvvTVEzQ02ruvcVP+94XnJpbTgYVklGT8efj3wri2/R3s+9tk0bt3ETVrQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLbq1e8o; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLbq1e8o"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso2740167f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 07:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764169690; x=1764774490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6OgNIakmq/dMbgcCgQqjaI96XbvPUGh0ExL/DxZVZY=;
        b=hLbq1e8ogeMYHrWQXtFr9J+GE3b5u5wdA+HbHkkvOsrwvpsky8rlpnW1B8WrzHvepm
         +b0k3bqt6uYan9itxQTrLlvpP3ZqbnD6PStvwFyR78K9eM0KDVKakDPT1881SgnJHpeH
         Qsj0Yh7qZqt4yupTBjmN0Xaf8/+zXv1d4vOQEmfeYVQPd4x4ebJ/dewYOGrOYU/huvIx
         ZoZJxQC5EfXuRr0m5w3WRIlKWwTATr4Pcgl+Ik/1EIbP6DqOV7RlsGUjGkJqI8sFOEND
         JKPN2PuxabyxISBqz0o9anppq2uj26cCYFBo+GNXbHqDkgMDEsNmMAEUyQEjnJ8qLx0Y
         a4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169690; x=1764774490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6OgNIakmq/dMbgcCgQqjaI96XbvPUGh0ExL/DxZVZY=;
        b=p5AqlEIrfGFJ6qg0LYf2JdwCh0+IMq2j5LiJC3f83R9Q2dZJeCiCvWMvabNjcwcNjZ
         lYkhSIPkSQEpJL5sjC2vJzW0q58f+mklW9tUNawcnuews6E9HDuQ60cuS+ekU7QX5vSu
         X3kdCJ7jWGE7Dp1PMSTMK7fLZ+5cRwNTB7DGdT+KG0qCQrHLtf67PftbACWCCnM1sWxq
         x0Jt+/RpkxZs9AxY8Q8PPkfEHCFY2XSIYITF7cbZnErrwxiffuWDLE52RiPkyOvVCkoi
         kJxW+7VtJNdNkKp629UkN3KFLuW8lf4958CvVoteE+3LJgO4uzJGVxYREOMfnVJv3TiE
         4FJA==
X-Forwarded-Encrypted: i=1; AJvYcCW+UwCGBMbEN94xgZVsnM5fvM0mkyVgV3+szzD+lnzMjYoWfDmQfQ8X2p4/1bB8ql0Zygd8ND5J+pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAb61ANDQCvsSah9GxsMV582y8ufJeg8lZ3ehQ06POoW/UQ1Yj
	o1+TeUfzUzhBqoF/o/9JqnVahre3JY/9cxq3QqGMLC4lj75V+TIZOoGSKOxYE3yIwNw=
X-Gm-Gg: ASbGncuw8Zhyx7UOscbt1lR/RgaGUUoOf4PE2Qhx+/v+1S/lPEc228Z8+cyPNclHCQO
	vFiGyez7uJEFx8TEcgzLuFX8dNhJMB6NuyK24coSzRAF37MPs4H5ouKOQJdxadajyftQ1RUWbEs
	9aiKvFlg+TElLHB3uOLY0xGBd9b3fINZ98j5Z+BlFr1qwcbo6XYyEoFXHL3tHIOrNhhQK8YBrVR
	6zIieW5U3jNt4uAX0+uTslH4X8LSODf+RRuu83bD0yKCGs47X6ZaK9YsDnCvphkpeM8uxAjMAki
	NhdDDs43SFaAji5gjatVTQwqULfZP8w2Q0KUU/XISqOYSnOrIncUX7JXPFfytn7zShA8wMSAfhe
	6c55LG5OosnOSmPuC8dpVI9iWppMknWTUvVutgKj2JpFVsykr7Ky6O3+WNhqsKCVWpqc9yNh+Z2
	0PC8BaL8wyXXboYTtF
X-Google-Smtp-Source: AGHT+IGrnn1L8KSzGAh7XbvH79/rG6fnYHAK9B7UFvN5X3Uprgh7HyajfkfIB/lPSY0JEyfTs23H3Q==
X-Received: by 2002:a05:6000:40dc:b0:429:66bf:1475 with SMTP id ffacd0b85a97d-42cc1ac9d4dmr21082742f8f.3.1764169689695;
        Wed, 26 Nov 2025 07:08:09 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35b7sm41986590f8f.20.2025.11.26.07.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:08:09 -0800 (PST)
Message-ID: <5096f4ba-913a-477f-bfe7-f2a6bb563d30@linaro.org>
Date: Wed, 26 Nov 2025 15:08:08 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251126144437.GL724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/11/2025 2:44 pm, Leo Yan wrote:
> On Wed, Nov 26, 2025 at 02:20:14PM +0000, Mike Leach wrote:
> 
> [...]
> 
>>>>      * - timestamp
>>>> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>>>> -       <coresight-timestamp>`
>>>> +     - Controls generation and interval of timestamps.
>>>> +
>>>> +       0 = off, 1 = minimum interval .. 15 = maximum interval.
>>>> +
>>>> +       Values 1 - 14 use a counter that decrements every cycle to generate a
>>>> +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
>>>> +       - 1). If the value is 1 then the reload value is 1, if the value is 11
>>>> +       then the reload value is 1024 etc.
>>>> +
>>>> +       Setting the maximum interval (15) will disable the counter generated
>>>> +       timestamps, freeing the counter resource, leaving only ones emitted when
>>>> +       a SYNC packet is generated. The sync interval is controlled with
>>>> +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
>>>> +
>>
>> What is the default value?
> 
>  From driver's pespective, the default value is 0 (disabled).  We do
> set default values in perf:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm/util/cs-etm.c#n444
> 
> IIUC, the default value would be the same with or without this series.
> 
>> As far as I recall when this command line parameter was a bool then:
>> perf -e cs_etm/timestamp/ <program>
>> is sufficient to turn on timestamping.
> 
> Hmm... with the latest perf, we must assign value to `timestamp`,
> otherwise perf will report error:
> 
>    # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
>    event syntax error: 'cs_etm/timestamp/'
>                         \___ Bad event or PMU
>    
>    Unable to find PMU or event on a PMU of 'cs_etm'
>    
>    event syntax error: 'cs_etm/timestamp/'
>                         \___ no value assigned for term
>    
>    event syntax error: 'cs_etm/timestamp/'
>                         \___ no value assigned for term
>    Run 'perf list' for a list of valid events
>    
> 

That's unfortunate and not what I expected. And I don't think it makes 
sense to remove that validation from Perf. The test uses "timestamp=1" 
so I didn't notice.

Can we accept that people are most likely using the defaults so 
timestamps are already on and they wouldn't be using it? The only real 
use case of that at the moment is to do timestamp=0 and that doesn't fail.

Although it's not the default for per-thread mode and I did find the 
OpenCSD HOWTO.md uses it as an example. timestamps make less sense in 
per-thread mode as you don't need to correlate between CPUs or watch for 
context switches.

I suppose we need to choose what's worse, breaking some subset of Perf 
commands in a slightly annoying way or having two separate options to 
control timestamps that you have to use together. I think it's 50/50, 
maybe with the breakage being the slightly better option.


>> This is worth mentioning so users can correctly assess what happens
>> for any existing scripts they might have.
>>
>> Based on this then the same command must set the timestamp to 1 -
>> which will have the same effect as before as we do not want to break
>> existing behaviour.
>>
>> Mike
>>
>>
>>>>      * - cc_threshold
>>>>        - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>>>>          default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>
>>
>>
>> -- 
>> Mike Leach
>> Principal Engineer, ARM Ltd.
>> Manchester Design Centre. UK

