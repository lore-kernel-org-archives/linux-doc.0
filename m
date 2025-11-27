Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9718334C08
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259790; cv=none; b=u8npkMRgaNam5Q9R1nSDngbzF3fdMzPrWTy0pNkqrr24pZsxl0yNK5oDkUtVBt7IyN/L7SLR5CKR//e10GyZGLhDI7gYBpqibns7z6P877OPd7UALDdqfsSqsCpWqXHCzDdllDTy0XEqaRK/t+z/zDAyfMy0lgu7LT6hlWk0XXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259790; c=relaxed/simple;
	bh=Shy1HFgfU90K6/nNwp8t68zQdNeKMbk7tWOQoJuS11Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lypp/vzsZ48B7qC4zFIRTMKvfHCYqk1v554lDQK8cWjaoNRF/S0p+9UeElojdFNAxhcHMU9qjE4IMF8SisTh0DUMTuRugOK6ZZa+aSK8Ns+CJ57NoWsVvFUdXEb2qDS1swMyXuoae59lHy8FrUxbmKUAZyPD8yHtDUs9jtI25kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXPbkdHT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXPbkdHT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so6917055e9.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 08:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259787; x=1764864587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cpIrGri61+e+bZAB58zpN3dYTJlO6XdCHLnWd6iMRc=;
        b=iXPbkdHToa0CqRei+F5zqIgct9fAoR25c/iCsBNXS9Yo/Tsia+/qr/Qr4MYQVuV1V3
         eAwfm2wHj3uOwnwBgayl5DGhfJkYC1I633eEbYDdtYEUgk9wcNdOwENmnpD+jt/VVo7g
         pt39xg2mzFPJdePjAgF5OjqmrHnza/ZTd6KjJiZ/6tHZ3fMxjahc3UhsgZBZlopXyeYA
         8MD4xbRwBJp01/9Lw/YIE6tGIQ66Y8IN0llVuZEIukNvD3NqiS+K6Dj8ECS/TKr4Nerz
         F9IbcEjNT4ADGfSz6VWHLgwYwdt9KQrAl3hp8SakyqxQ/m0nuKUW30UBQal/nq7IkdId
         Np0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259787; x=1764864587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cpIrGri61+e+bZAB58zpN3dYTJlO6XdCHLnWd6iMRc=;
        b=nYikY7CtMYbmBVb58jnDh8c2GyOnW328vU3iy5DRqjNaOGijOqdpzKa/FsmU8ZB1V/
         7MUf7ndXl+4F84SYyfbHkbVtd+IIVQGDdGsbXqVbKHltk5pMgRDQQk26JD7bvbKPKHjG
         5H6/SrCvbcb9FnIGra0hviPFI203pLIThMLEHQ6U0mrFkMYyfZkVr7NaATPDR4npHbrC
         /M9hHusy9l75USOkYx3Yq84wIZDF9RphtY+omFUQK5XBmgAlmsNXYdCdNYkt8gudCDMk
         o9/9Xb5eEYWfq4+Sj5qeUc4ISBtuitljCXlvTYIoOoBPbJUigr+8+GBtML06Gx7dHWLl
         hzFg==
X-Forwarded-Encrypted: i=1; AJvYcCUd6wsUg6Jb/O6KUbKogv6MtgZaB6mPeUNA0D3UlxrwS8I+YTbKTHglB6PppB9Ptq/ODCNvpTLB+5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHAarG2OU8TYUsybWqxRADaRAgF5MZ+UkvO1jm8ofIU/Ahl2T
	3aW8sTFdBJHEJbQZZpMfuCw49KVnhsohQkSWkj4niwfcvSe8D/5tfgaRZ5FzGGd/2Hk=
X-Gm-Gg: ASbGncvVNLG9XRFTSFTnp4V21US3aBwE8OKhJ0qiN0rTRgJJfHABVaGD+xwILGYkjwq
	IlT/dzdztHFfwKdPz3eVjaFfkwS6c5ZO3rWux39TanQec5C8uqe5d57N0HMQmGLvmVta/8Jp5Gm
	2QQyKpwUypztptNVN2SMPrPZ3Xn13Lc2AHlpzUZ2Jm++0281Djcx5P+JeQ0RKacPg9Y03hFP9bj
	XMKdM3VuRG9IdAIy7VEBz/uRYuojdyPKkBCJpAoIte1i14UyaAGfpf4LEdKmu2QsJOZVHYLhphV
	7Q3ja1BIPMAUeVDHga0Vts3ES4/qJKdpfSJez6jmhTVB+UMdMMfVwefHKxA/5JYXnLZKgEWI6Ql
	UXR+c2Zvk3exJtCeBB2A61covAm3MhkOGHr1LCHa++KPgbc0SfflOkUt4xp5irlgkW/nEuIYCjx
	gJDT8jqWi9fV635xgR
X-Google-Smtp-Source: AGHT+IGXhcwFBRvfQzDOHSo9hFl4xdfh4gra5/RCy9pJflHLTngXIl7AkUmgjKB8t4pi3YsRh+RXCQ==
X-Received: by 2002:a05:600c:21cb:b0:477:acb7:7141 with SMTP id 5b1f17b1804b1-4790f03337dmr46833965e9.3.1764259787134;
        Thu, 27 Nov 2025 08:09:47 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm113711125e9.1.2025.11.27.08.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:09:46 -0800 (PST)
Message-ID: <718ffc8b-21ec-4536-b0c4-aaf2635aaf75@linaro.org>
Date: Thu, 27 Nov 2025 16:09:45 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
 <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/11/2025 3:48 pm, Mike Leach wrote:
> Hi James
> 
> On Wed, 26 Nov 2025 at 10:57, James Clark <james.clark@linaro.org> wrote:
>>
>> Timestamps are currently emitted at the maximum rate possible, which is
>> much too frequent for most use cases. Set the interval using the value
>> from the timestamp field. Granular control is not required, so save
>> space in the config by interpreting it as 2 ^ timestamp. And then 4
>> bits (0 - 15) is enough to set the interval to be larger than the
>> existing SYNC timestamp interval.
>>
>> No sysfs mode support is needed for this attribute because counter
>> generated timestamps are only configured for Perf mode.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
>>   2 files changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
>> index 24d929428633..128f80bb1443 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
>> @@ -7,6 +7,7 @@
>>   #ifndef _CORESIGHT_ETM_PERF_H
>>   #define _CORESIGHT_ETM_PERF_H
>>
>> +#include <linux/bits.h>
>>   #include <linux/percpu-defs.h>
>>   #include "coresight-priv.h"
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index c7bf73c8f2d7..0129b0502726 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>    *  +--------------+
>>    *         |
>>    *  +------v-------+
>> - *  | Counter x    |   (reload to 1 on underflow)
>> + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
>>    *  +--------------+
>>    *         |
>>    *  +------v--------------+
>> @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>    *  | Timestamp Generator  |  (timestamp on resource y)
>>    *  +----------------------+
>>    */
>> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>> +                                      struct perf_event_attr *attr)
>>   {
>>          int ctridx;
>>          int rselector;
>>          struct etmv4_config *config = &drvdata->config;
>> +       struct perf_event_attr max_timestamp = {
>> +               .ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
>> +       };
>> +
>> +       /* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
>> +       u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
>> +
> 
> I could be missing something here - but if we have a perf command line:
> 
> perf -e cs_etm/timestamp=0/
> 
> is this bit not changing that to timestamp=1 regardless? The docs
> (patch 13) indicate timestamp=0 to be timestamps off.
> 
> This command is used in test_arm_coresight.sh when testing the
> combination of options on the CS system.
> 
> Mike
> 

No, no change. This function never gets called if either timestamp or 
deprecated_timestamp = 0.

timestamp=0 and timestamp=1 still behave exactly the same as before. The 
only new change is timestamp values > 1 and that the bits used in the 
config are different.

>> +       /*
>> +        * Disable counter generated timestamps when timestamp == MAX. Leave
>> +        * only SYNC timestamps.
>> +        */
>> +       if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
>> +               return 0;
>>
>>          /* No point in trying if we don't have at least one counter */
>>          if (!drvdata->nr_cntr)
>> @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>                  return -ENOSPC;
>>          }
>>
>> -       /*
>> -        * Initialise original and reload counter value to the smallest
>> -        * possible value in order to get as much precision as we can.
>> -        */
>> -       config->cntr_val[ctridx] = 1;
>> -       config->cntrldvr[ctridx] = 1;
>> +       /* Initialise original and reload counter value. */
>> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
>>
>>          /*
>>           * Trace Counter Control Register TRCCNTCTLRn
>> @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>                   * order to correlate instructions executed on different CPUs
>>                   * (CPU-wide trace scenarios).
>>                   */
>> -               ret = etm4_config_timestamp_event(drvdata);
>> +               ret = etm4_config_timestamp_event(drvdata, attr);
>>
>>                  /*
>>                   * No need to go further if timestamp intervals can't
>>
>> --
>> 2.34.1
>>
> 
> 

