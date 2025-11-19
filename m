Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CECB342C8E
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551574; cv=none; b=jLtAUYSCUlxXLoR4s4BvbVl5cE8m6Ykpf0zu/cPUk+8RjrC8f63IzN/joj9q60F5NUKrg0/6SMqeBwlhTJF7jrluZoKyGOiDblW4IUQ2WDxB/KqvHfcZ0MIcYGfZpoi5vEe7E7K3TP1KfUVrlGES7JccJrd3IuuymZ66wYX43ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551574; c=relaxed/simple;
	bh=VmQAL5PbKWFn77lQXs2vdQrJbqq+/TScMrUt1BqdGCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yp2kJWieuAajwph9QyK/rH7FTT5+gDR3vcao1i/m1ckMqJkIaYrO2cYr4UuHSNC4QJ5F/ex8aZqHAniwbawYUebkzzSfIzdbXeFWa+Mx9CxUSD2QQdFvdvW/IIbJcBgQhMi2C7qZnOKQjud9H+bhAXzTATTGlCphQhvjnmntTG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6liX80A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6liX80A"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a1c28778so40859925e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763551570; x=1764156370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oWUgdV1H4j7xM7VCXc76DVxug1qnbqfi8eo3se1cmc=;
        b=h6liX80AlHJdjWxlgkZz/9Ya3btNy7wzfUEl6byh4rxc1RbVaXD/tn+2fNmTLZ5B9W
         M7gbznUzM0Hd1A2P5Y/2eKpwRFxv2ISkHGUgZRZqLlusUfiUVkR3zMby65Ryg1FYfD4j
         73Aor06+Ped5UJr9l4nWVqyOl6oMD5mKKk6KqxAr3cVQzWJqleYlp/aWMO3u5lGRzYyP
         aop0KYZYOd1FlS6xssd9lYzkda5a8Cq2+2i+iTBpLJch3t+POHEilLEmJ1CrnJ450quq
         n1fH2bII2rfrdPMuwDaAxzmtDQf/41HEwwj/9JhiEZ6vKXqY2NjOcci/TLrA5g4u8DaC
         B4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551570; x=1764156370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oWUgdV1H4j7xM7VCXc76DVxug1qnbqfi8eo3se1cmc=;
        b=tYC43KRWp8Ox5JM7czlv05/TCY1dlsdVsFFpRng4+ssTOj3lwEjDBIsrlWQyggZFlH
         qEftbpm+pL6zLblN4L5X/iRryGNHSk1/M0G6fL9B2cy0nkTajF2SXVkbDfyRPRsdStyv
         pseLiBSy2DNL1wPp1yVhXd2xzcJh46S2laYnetmjdx41jtScn/CwpOqYwfxzhEWey6F0
         lyPhReEZ79g8bewio5lyLtlun8t1HLa9KVwO3Eu59Bfu8M717Urxh2EzQ2yKz2O1zKhJ
         h9zRf55qY4I4GH+mRkoGg9pw/u0SQFO7pyxARW4ZbCkJ3bCDaylrZP++SgvLly6sLlfW
         8quA==
X-Forwarded-Encrypted: i=1; AJvYcCUawpAVruCrOI6TJ270QeoJQ5b2jR/9q/bHQJebxTqquhraayZ1URsqg3XzM1tugARg9e0BEvai9FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvTDJ0WS09Wov7uKBRV9gDQ3RZZoJ3IlSm/X1PQT856a6hsBHx
	4J5sHT/0dqFyTxJhRZCHe3/13bS+rtQLfxIXZH4z84NYrA44C6bE3vfaB0dFBIw7v9Y=
X-Gm-Gg: ASbGncu15PhG1UJBO8x8umeTmzWvDphl5bZ4YRx246Lccntt2sbXq/iMJ3UMjEz9WY5
	w9b1opg0cySFbJ2MbmQiadI9gBZ0/u2tPMkHXUJW1onc00HyqIsYWYj/pYs3z5TMlHNynBcRuF+
	k7alcm64KS5lmy1pjucXezKaxtcV9gGx8OqgtiiOSr2jBnGzOt4lcUkcnbob5W+nuGQmqOdtYu/
	ktbV1q1xiPK3lt4XHCs43a4vnHXqmXFvreFZXRXnqNNr+wbYqL6rTjq8zFiqO+Qiy8/x8HVB+5O
	RCDZHbR6Cobc1AcNy2xzydjGd5h/7Q0//QPgAajTUV1Fzt0QRJU6EWpx9X/2YfQPUAk9HHkN4FU
	TacbaLC6h9AoH47fE85VMAmtufCQ06SDN77zk7WuwQ07lr+tD14sf0MUcLlJDIBL8P/0wolMaB3
	J8xG0NBVtJ8Sx4ik5x2oKEUhLOtC8=
X-Google-Smtp-Source: AGHT+IGe8fJfkQN0l8WespUyvIlqiHPxZFXrEGy+rBfciXs6pY1j7OqqJ24AL/wb750j5kxbZz4Z/g==
X-Received: by 2002:a05:600c:a47:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-4778fea195emr225174955e9.30.1763551570462;
        Wed, 19 Nov 2025 03:26:10 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm37765550f8f.40.2025.11.19.03.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:26:10 -0800 (PST)
Message-ID: <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
Date: Wed, 19 Nov 2025 11:26:08 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/11/2025 9:32 am, Mike Leach wrote:
> Hi James
> 
> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>
>> The "config:" string construction in format_attr_contextid_show() can be
>> removed because it either showed the existing context1 or context2
>> formats which have already been generated, so can be called themselves.
>>
>> The other conversions are straightforward replacements.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
>>   1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 28f1bfc4579f..1b9ae832a576 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>>                                            struct device_attribute *attr,
>>                                            char *page)
>>   {
>> -       int pid_fmt = ETM_OPT_CTXTID;
>> +       /*
>> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
>> +        * even though is_visible() prevents this function from being called.
>> +        */
>> +#if IS_ENABLED(CONFIG_ARM64)
>> +       if (is_kernel_in_hyp_mode())
>> +               return contextid2_show(dev, attr, page);
>>
>> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
>> +       return contextid1_show(dev, attr, page);
>> +#else
>> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
>> +       return 0;
> 
> Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.
> 
> Mike
> 

Not in Perf mode unless I'm missing something:

#define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
				 ETMCR_TIMESTAMP_EN | \
				 ETMCR_RETURN_STACK)

Only these options are currently accepted. I suppose the comment is 
describing what the current behavior is, whether that is what we want is 
another thing.

But if we do start supporting context ID in ETMv3 we can update that 
comment.

>>   #endif
>> -       return sprintf(page, "config:%d\n", pid_fmt);
>>   }
>>
>>   static struct device_attribute format_attr_contextid =
>> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
>>   static void *etm_setup_aux(struct perf_event *event, void **pages,
>>                             int nr_pages, bool overwrite)
>>   {
>> -       u32 id, cfg_hash;
>> +       u32 sink_hash, cfg_hash;
>>          int cpu = event->cpu;
>>          cpumask_t *mask;
>>          struct coresight_device *sink = NULL;
>> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>>          INIT_WORK(&event_data->work, free_event_data);
>>
>>          /* First get the selected sink from user space. */
>> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
>> -               id = (u32)event->attr.config2;
>> -               sink = user_sink = coresight_get_sink_by_id(id);
>> -       }
>> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
>> +       if (sink_hash)
>> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
>>
>>          /* check if user wants a coresight configuration selected */
>> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
>> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
>>          if (cfg_hash) {
>>                  if (cscfg_activate_config(cfg_hash))
>>                          goto err;
>>
>> --
>> 2.34.1
>>
> 
> 

