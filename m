Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F0288C2B
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761126255; cv=none; b=OChFwj967OfA5vmqcMeDYf81aMj2KDJjiCWeKBkwY+7P8PR9q6jCITVyLWek+nt4wgRD44SIEImHo0Nos203LGLgH6uXj+kSMGXeJiBQ7QQu7wqj2Nj7kq7U9l5+Pm3Zibz+8V/XAtYzqvAaI8oENdURbr1K0YoDDplHTHupxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761126255; c=relaxed/simple;
	bh=YSsmQnBs93MkLURrGV5cmfNkALdokMBbIl5S2URZs4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXuseVRMrQF97bfG14lSP0mAYrsPj/WnH4JhW2/fmFHhEluetUc3bfabe3bIULhlp0rkOjXIgu5SXFniw94LDQ3V2MHXaVisLBf2OkmCeyLNxeFx8dSi//V8LDqY2al3VYU7gvBZZ7LsRvX/kP0UbRKXdxuJvu9VNIjh+TBe0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8q4d/gx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8q4d/gx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47117e75258so33036225e9.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761126251; x=1761731051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2q2OfszUqpeadKayMdXndWnS6PaM7t8jQzEItp97vM=;
        b=E8q4d/gxobhWW49fipSD2pu/EvWAHXJ/k3jj1gk9LLCCuemvkDrgHPszwGTcpjhyfj
         5WAnKahSBraUqXjuh/LlJ29vxFP6j4z2h7BzDZDEjQnIh2jBmIBPtHyq40n0JlQl6eex
         4gOmC3Y9iy5mGOvYiz+4IM+kgTfUEisGbQUsf7n1M8Bqz5rsW45AqtUPo/4UTMKatYge
         gGWvi5a2KamaGHRV6bIWzFs8wIVscgfDskauk9gaHir0JyYd7Q3wI/2oMOaVfy0e+gSb
         dAewPaMmLVG/6QxpB8zWowN+iHZtimW2NLyTGT0vKDAVtyV4Wef0sUKNpeFTWdQUX9pD
         bwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126251; x=1761731051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2q2OfszUqpeadKayMdXndWnS6PaM7t8jQzEItp97vM=;
        b=ZWH/dYNUibLBjbjRzffgihUsmklxkVosag9iJ9BCvy0fd3ORXHFFJlRIWAXWPFiE/G
         OI7ZPbkOnvW/g4GzhrIZvRZCmQg9OttV1tcQC4vqLCl+Z5j2NGC16fwkW9ogROsUMZ1i
         Vx+Vdbjlh+9WkShl6lx2bFUw4gh03c52dcB46mpHir6XC9nzkpBN5TxPj62ogkevrvV9
         cOqOCRseEiSf79qTDWr2UYmE/pafCS170U13tY9ekCDvSLqKeRohq36DcgdmlDw83Qr3
         C0D+MnAd53kfZwc2fCDjp0dFcD/6V8ZWUixCvht8Mk6QBuOOZIrgPrCdGlaTg80+y0bA
         l4eA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0PCXhNrN8bBx9QBHYXho/42xsfuraGSlXwoQCWcANl+A4muEzjlMZEYe2eVm6y8q8TO/9YiHa4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi2hLwsGVfBh0PyhPD/8bbm6uXH9izgiTNUjlKPWZd6SNgOb6u
	b9bbNoDpxIc1FfkjDhKlRLxGAmCAeerKSmJwaFaAeRwNAq+QHAA1QuQLaewfPE11ELQ=
X-Gm-Gg: ASbGncug/inS+HdXa/J0zqb0CLHsHbugaPhx/W0ZkA4Ssc0lQiMD6DXGf1YEpk5zuze
	3MPZrLI84gBMJBzOGIpNPVg4juyfgi6CKCoWX3Pd8npHo1hMAIQt1rxf11kY90gzyv+gtPZc6Lw
	I8M0m9l7a7t9c0ekH6MCBbB/a+T0ccMbv6piU2g9+JSspmtUkAxHVyCl8qZATtPJEhk5KdbOZHN
	o+oPOmTcEJAwDO2tEpQ5ZpD2HRcYPLdkP6lkK5D2azhIL067TqksVFne4rHJREMEJIij/LaK6Uo
	DlnwuM41733Mu+bNFvu/gw+yhYnhbYejvJJY8dKR+7Vczfzc8uFQixErMRHdznhf4kYnMmIBhyN
	It1wAUzwVVSEbfk9Nhy4nE2LyYo3ftPLaWR+fqfVbYaukLSzcLTthQZ3SmfhN0zCI0JGehC3/xf
	nN9loF2ZqX9WxTJfqT
X-Google-Smtp-Source: AGHT+IHyKNaFr6+KT+wcGuk5QcgPZ2E1s+s6FjRqi/hA/8rUpJL4cF8k2yXbn4dNu2GHhIteFm2DEA==
X-Received: by 2002:a05:600c:4e93:b0:471:9da:524c with SMTP id 5b1f17b1804b1-4711789e39emr140864945e9.12.1761126250776;
        Wed, 22 Oct 2025 02:44:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d26affsm32511685e9.12.2025.10.22.02.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:44:10 -0700 (PDT)
Message-ID: <3c6b723c-d3d4-4be7-9333-9ab46d270194@linaro.org>
Date: Wed, 22 Oct 2025 10:44:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
 <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
 <CAJ9a7Vj1NnikoJyabXnad+=3SDULKCyqoZiNb_S66SkG+HD+dw@mail.gmail.com>
 <bfce6b68-783f-4aa1-b9db-d905230be609@linaro.org>
 <20251021172224.GO281971@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251021172224.GO281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2025 6:22 pm, Leo Yan wrote:
> On Wed, Oct 15, 2025 at 04:19:04PM +0100, James Clark wrote:
> 
> [...]
> 
>>>> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>>>> +                                      struct perf_event_attr *attr)
>>>>    {
>>>>           int ctridx;
>>>>           int rselector;
>>>>           struct etmv4_config *config = &drvdata->config;
>>>> +       u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
>>>> +
>>>> +       /* Disable when ts_level == MAX */
>>>> +       if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
>>>> +               return 0;
>>>>
>>>
>>> Returning 0 from this function _enables_ the timestamps
>>>
>>
>> Returning 0 just means that etm4_parse_event_config() doesn't exit with an
>> error. For ts_level == MAX we want to disable timestamps generated by the
>> counter, but we still want the minimum periodic timestamps.
>>
>> To disable all timestamps you'd need to have attr->config & BIT(ETM_OPT_TS)
>> == false. This is set by the "timestamp" format flag which I tried to
>> explain that in the docs change.
>>
>> I could also change the comment to say "/* Disable counter generated
>> timestamps with ts_level == MAX */"
>>
>> It's unfortunate that there are now two format options for timestamps. Maybe
>> instead of adding a second option we can change "timestamp" from a 1 bit
>> field to 4 bits, with the following meanings:
>>
>>   0:     No counter timestamps or SYNC timestamps
>>   1-14:  Counter timestamps = 2 ^ x. Plus SYNC timestamps
>>   15:    Only SYNC timestamps
> 
> I am just wandering how can extend "timestamp" from 1 bit to 4 bits.
> 
>    #define ETM_OPT_TS              28
>    #define ETM_OPT_RETSTK          29
> 
>    PMU_FORMAT_ATTR(timestamp,      "config:" __stringify(ETM_OPT_TS));
>    PMU_FORMAT_ATTR(retstack,       "config:" __stringify(ETM_OPT_RETSTK));
> 
> "retstack" has occupied a higher bit, we cannot naturelly extend
> "timestamp" field?

Easy, just put it wherever there is a hole. I think there's one in 
"config:4-7", but it could be put in config3 or config4:

  /* Old enable timestamp bit for backwards compatibility */
  #define ETM_OPT_TS_old              28
  PMU_FORMAT_ATTR(timestamp,      "config:4-7");

The position of the timestamp field is published and tools read it, so 
as long as we don't change the name of it it works fine.

We only keep the old bit 28 because we know old Perf was buggy and 
didn't read the bit position, but if it wasn't we wouldn't even need to 
do that.

> 
> Even we can extend "timestamp" format to 4 bits, it will be mess when
> run the updated perf on old kernels.  Let's see an example:
> 
>    perf record -e cs_etm/timestamp=0/ -- test
>    perf record -e cs_etm/timestamp=2/ -- test
> 
> Because the lowest bit is cleared for both timestamp=0 and timestamp=2,
> the old kernel support only one bit always treats these two setting as
> timestamp disabled, or the perf tool needs to do extra checking for
> old kernel.

It won't be. Old kernels report a 1 bit field and Perf errors out if you 
try to put a 2 into 1 bit. Very old Perfs just set bit 28 which new and 
old kernels will respect.

> 
>> Now we basically have the same meanings except you also have to set the
>> timestamp bit. Seems a bit pointless.
> 
>> Previous versions of Perf were hard coding the timestamp format bit rather
>> than reading it out of
>> "/sys/bus/event_source/devices/cs_etm/format/timestamp" though:
>>
>> -       /* All good, let the kernel know */
>> -       evsel->core.attr.config |= (1 << ETM_OPT_TS);
>>
>> For that reason we'd have to leave that one where it is for backwards
>> compatibility. If it's set it would be equivalent to the new wider timestamp
>> field == 1.
> 
> Are you suggesting the timestamp field to be extended to two
> non-consecutive fields?

No, just a new 4 bit field in a new position.

> 
> For me, this is even worse than current two discrete formats. The reason
> is it is complex in implementation, and it is not directive for usage

I really don't think the implementation is complex. We just extend the 
field to 4 bits and make 0 off, max is the lowest rate possible, and 
every other value in between is in between.

> (users need to digest the field for three different semantics: on/off,
> counter, and SYNC mode only).
> 

That's like any enum, it has multiple meanings for each value. I'd argue 
that two fields for the same thing is more complicated because now this 
won't work out of the box, and it would work if we did 1 field:

   perf record -e cs_etm/ts_level=2/ -- test

There will be no warning, but no timestamps either. You have to specify 
both manually. And the only reason for that awkwardness in the API is 
that we added a new field instead of extending the existing one:

   perf record -e cs_etm/ts_level=2,timestamp/ -- test

> Thanks,
> Leo
> 
>> I don't know if there's any precedent for changing the bitfield that backs a
>> format field, but presumably that's the point of publishing them in files
>> rather than a header.
> 
> 
>>
>>>>           /* No point in trying if we don't have at least one counter */
>>>>           if (!drvdata->nr_cntr)
>>>> @@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>                   return -ENOSPC;
>>>>           }
>>>>
>>>> -       /*
>>>> -        * Initialise original and reload counter value to the smallest
>>>> -        * possible value in order to get as much precision as we can.
>>>> -        */
>>>> -       config->cntr_val[ctridx] = 1;
>>>> -       config->cntrldvr[ctridx] = 1;
>>>> +       /* Initialise original and reload counter value. */
>>>> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>>>>
>>>>           /*
>>>>            * Trace Counter Control Register TRCCNTCTLRn
>>>> @@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>>>                    * order to correlate instructions executed on different CPUs
>>>>                    * (CPU-wide trace scenarios).
>>>>                    */
>>>> -               ret = etm4_config_timestamp_event(drvdata);
>>>> +               ret = etm4_config_timestamp_event(drvdata, attr);
>>>>
>>>>                   /*
>>>>                    * No need to go further if timestamp intervals can't
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> Regards
>>>
>>>
>>> Mike
>>>
>>> --
>>> Mike Leach
>>> Principal Engineer, ARM Ltd.
>>> Manchester Design Centre. UK
>>

