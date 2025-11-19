Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59801F463E
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553635; cv=none; b=ceP4V6T0IJnRJ08Tam3Y7+9WwaRJmmS1zyX6EYf9CZQw+S20yeoXlJcdEMedVwUdXkxP3LSib4X++h6jqP4Va2KoDJzxNF+7Pg/iAxTNxAfR+Ie/naFdC/bp0v4WdtkyhJ78lxNIgyCWD4OJjxAXcyH67Uu6JdozO6Jy2nivJEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553635; c=relaxed/simple;
	bh=b/AfRECK9FvbmPxeFKDlbUY1hR6Y9/LzS8ArvzcNmi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6kCFedZw6UkrhqyHDfms9olhZiPYcClxBGTnIkjcvsZ1ll895QwZ8/QwDkYqBirF6ZVWRid+mgVNbM1yF04lOBLpyDHyFEmdCJxV2vtSe774/5BcnQHf3zd4mWBJnXFLMf33/ZMOIb0FYRTtJu9UgLxQO5JxbtDwCxj75KNyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbeyJM97; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbeyJM97"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so1938122a12.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 04:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763553632; x=1764158432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjdgFaHq4s478NGT+krUukAjT5h9G3MEsOtOmyXQZrk=;
        b=WbeyJM976aSqAgMOUGiM9jSXak0iCLkTmZ4GfDuCwU7vDDMOH1d0TxOYqqYLgtKbhD
         gq4tW7KuZuf9ToIehQqcAJbqdTl3cmjK3TDyOF6udEytCebkqmWL5r/keybs2ebG4Pux
         8D5oRE4gc+sYByNiditNzGRZoc/Ko8TqQCaabpqIq/aCb0zfW2UM7ZKnzFez3JhYgwe9
         x8fC5qOVJnGrplJwn+FVsChz2cO9Wxz+6fDpee/GwwqPsvwktSw8Q59OOFCZoBkjHojF
         Wsvoh4DtzynLO+jWiN737o5pPM2KsESyQoe7OUCEPEDgczsdCbOxKVsGuWW8laUnzq6H
         FqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553632; x=1764158432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjdgFaHq4s478NGT+krUukAjT5h9G3MEsOtOmyXQZrk=;
        b=QMSpE1PpqaX8Pi2QFyL4lu1tpiJg8CbI81bLHNpWGmIgSWUT/BbxQ5+pgKQTYKqmtD
         vbmjsl7IPrRFZY9JialfZ9ukfzlFo4wEiYOZaNDMFXApCG/95HvzKpU8Xn0MgfAdjjo3
         pRJoYhyDBTeCkxuTpb73GaJaD6hQXRtkEAZ1gUR/CxqOGx44KX73K/aANgBECR3R5B1E
         XM/UfLxyeN+HclbVV8oSQ5kc4nLub8UAOm1MR9djBObLeFHssj9kxNoJDkXq3j4CcIfU
         cUGRnVOBKfKeao0N2yz8lnMn3ch7bQ9hDJwyiRwp7Nr2/jZO9GKb3zoHkQF5JkF+MIrc
         PJXw==
X-Forwarded-Encrypted: i=1; AJvYcCWUS+wtvr59cEPdFX/JveoMKsqy1AqSBCWTMAYRIYQDF4kHtbws0p+8Lghw4ik2LzNkF9oDPhj1r64=@vger.kernel.org
X-Gm-Message-State: AOJu0YztXMIx6QX/p2wJB6eTniut/cvivESsZ+W3kc1lHlRj77HNh0xN
	OYG6+LaeHwX3xFSs0dxT6GOlNDBlJS040TXoMel7+i20pZwpE+8CmUzlkoG8hqC8+ZI=
X-Gm-Gg: ASbGncvxUTVyYtiuLzFFVAoNMZuMNHmgN3c8r83cNRxnogdbhnNFVWxmH/dcOG+1r45
	KkVt42ajkKfYsqqrTCDUI4X3/4A/FicwqXsK6s5IhJ/W9X05nf4a0Foo4ClgZF4Hi9VZ2123C/f
	5R5HILzxygBrv9DFAP9Pzxctt2jsRmLf8DNfw0PAEGZmzc2VjUGTpkSwhfnchWupRO4EcN6+xgL
	XPp9qWndUg7s8hPWUYAGqWC88enu9198Pk1S3k+0JlCqColrzPoawPt0W9WtKKa4UYVo5sQx2i6
	u79Kml5+BIi2id87mzuwWTE2WbEDF1Ds/mEyPPGiM25m7ZEcI+8YMjan+m5kWVP5z9NpjbCly9E
	l/dvVd+k8sjDpu+53ThzdKZO0FJhsHoDXV+MJ06mp4VW0BjPSPPxxsZcWlEcsd9Erybf8yH7w5J
	AQ7IR5zKxcRUvhdFiLg5+auCoWAIE=
X-Google-Smtp-Source: AGHT+IGPn4+V4Y0JmuRCvY3D1OCOga4PGonrGR/jtRNGRuCpMaAJovENXI98966DZDBfDN8BRbsfXA==
X-Received: by 2002:a05:6402:5254:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-64350e03a8bmr18456607a12.3.1763553632151;
        Wed, 19 Nov 2025 04:00:32 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm14948916a12.5.2025.11.19.04.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:00:31 -0800 (PST)
Message-ID: <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
Date: Wed, 19 Nov 2025 12:00:30 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/11/2025 11:45 am, Mike Leach wrote:
> Hi James
> 
> On Wed, 19 Nov 2025 at 11:26, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 19/11/2025 9:32 am, Mike Leach wrote:
>>> Hi James
>>>
>>> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> The "config:" string construction in format_attr_contextid_show() can be
>>>> removed because it either showed the existing context1 or context2
>>>> formats which have already been generated, so can be called themselves.
>>>>
>>>> The other conversions are straightforward replacements.
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
>>>>    1 file changed, 16 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> index 28f1bfc4579f..1b9ae832a576 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>>>>                                             struct device_attribute *attr,
>>>>                                             char *page)
>>>>    {
>>>> -       int pid_fmt = ETM_OPT_CTXTID;
>>>> +       /*
>>>> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
>>>> +        * even though is_visible() prevents this function from being called.
>>>> +        */
>>>> +#if IS_ENABLED(CONFIG_ARM64)
>>>> +       if (is_kernel_in_hyp_mode())
>>>> +               return contextid2_show(dev, attr, page);
>>>>
>>>> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>>>> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
>>>> +       return contextid1_show(dev, attr, page);
>>>> +#else
>>>> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
>>>> +       return 0;
>>>
>>> Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.
>>>
>>> Mike
>>>
>>
>> Not in Perf mode unless I'm missing something:
>>
>> #define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
>>                                   ETMCR_TIMESTAMP_EN | \
>>                                   ETMCR_RETURN_STACK)
>>
>> Only these options are currently accepted. I suppose the comment is
>> describing what the current behavior is, whether that is what we want is
>> another thing.
>>
>> But if we do start supporting context ID in ETMv3 we can update that
>> comment.
>>
> 
> Unlikely - but the comment seems to conflate core architecture and etm
> architecture.
> A core with aarch32 can be traced in etm4 - i.e etm4 supports A64, A32
> and T32 instruction sets.
> If this set gets another version it might be worth saying "not
> ETMv3/PTM" rather than not A32.
> 
> Mike
> 
> 

Oh I see what you mean, yes that would be slightly better. But then to 
make the code match the warning it might also make sense to change 
CONFIG_ARM64 back to CONFIG_CORESIGHT_SOURCE_ETM4X, which Leo suggested 
to change. Maybe I can just delete the warning text, practically this 
warning can never be hit.

It would have been nicer to avoid any conditional compilation or 
warnings and comments, because we're hiding contextid on ETMv3 anyway. 
It's unfortunate that the compiler doesn't allow us to ignore 
is_kernel_in_hyp_mode() being undefined even with short circuit evaluation.

>>>>    #endif
>>>> -       return sprintf(page, "config:%d\n", pid_fmt);
>>>>    }
>>>>
>>>>    static struct device_attribute format_attr_contextid =
>>>> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
>>>>    static void *etm_setup_aux(struct perf_event *event, void **pages,
>>>>                              int nr_pages, bool overwrite)
>>>>    {
>>>> -       u32 id, cfg_hash;
>>>> +       u32 sink_hash, cfg_hash;
>>>>           int cpu = event->cpu;
>>>>           cpumask_t *mask;
>>>>           struct coresight_device *sink = NULL;
>>>> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>>>>           INIT_WORK(&event_data->work, free_event_data);
>>>>
>>>>           /* First get the selected sink from user space. */
>>>> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
>>>> -               id = (u32)event->attr.config2;
>>>> -               sink = user_sink = coresight_get_sink_by_id(id);
>>>> -       }
>>>> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
>>>> +       if (sink_hash)
>>>> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
>>>>
>>>>           /* check if user wants a coresight configuration selected */
>>>> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
>>>> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
>>>>           if (cfg_hash) {
>>>>                   if (cscfg_activate_config(cfg_hash))
>>>>                           goto err;
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>
>>
> 
> 

