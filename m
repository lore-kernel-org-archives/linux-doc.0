Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B42836B1
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649763; cv=none; b=lR+2D8OY3BW16X3LdoC0OCryQC3zb3Q3iF3OGG65TFWiwISGtGU1Gi/LfqtkeI61hiMIPxLwqspila0Ni6XWjDi7vCajxbc+oIM0krs5BHUuOHmOB7/EGzCHmwDrmIcwM6PT0j9UD7e2PqxoXgUMoO+Fl1AZnFhTyewu+EMjb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649763; c=relaxed/simple;
	bh=USTINUR/7SHS24ledWk8FwLBfhaD6J1+4rPJNzKqNEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ag3C97rmWKBabJojVYMobmqwulQ6kqe7fGsq7c05d4aXyyOcdRPz/IVWMHGGxipKH93rUS7bYCI4TuKRxCn/yoNrbRzq+5f94acbX9ak1XqFkGUZwjDleVi0I28c7KazpRm9M8ZjaVXtHVCe8Ap1mrYBwkkjyfVElQQCU2Di30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwiL+Ajt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwiL+Ajt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a1c28778so11755425e9.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649759; x=1764254559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Pv7TznRoZvD45ayRdnXnvgz+g3Sc/UP6RMqqLLXWQo=;
        b=ZwiL+AjtWZZYnttm6whgRemnrHhuyqs3ct792zDkEQXgj+FE8CmmP0341RzrORUV22
         0Xwh89mPD5h9tPldrM2JDTvG1cbS+mcjKxnwv+i5BaagGUn9im3tfA7FZdIrSA3TLKtC
         QvbPkNrWNrzTKheOzPsSToN9AMlYIUg/MmK6YIJbIOD8K3YMhGEmbzpZ2AaKEXyVvr8Z
         P9XrnZxpdl6DU21ua0hddPKxw02/FwWVpVCpcPdDzMAAkfyKNp7cgOonKIKzKUsAJgHR
         gZY3/gBaB7tbfFWed10y1yFOwPtL2AXSvUsvWqcO2IwiJkqJF1PTt9Dup6Umv006eZzS
         qf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649759; x=1764254559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pv7TznRoZvD45ayRdnXnvgz+g3Sc/UP6RMqqLLXWQo=;
        b=BEQEjad+lW/PYJHqhATZRExOJLXFLusfqVeCUcig2BzuWYb6Db+EJAtONCV0ZvSN4g
         6xAR7hCYbsJL8unAbpMqTAlNMfVgmcdNfqAuHi+d+gamPxua2D8ODsme3FeCf13HBnlK
         SfCrzThUlwt/PvwVgj/8iGT0bH8gtUvI6LOuS3q19DBDKq6ut+pnnU8Noa4Sdrl0wD6Q
         SoBD790sgLhZQJk0VarUjX38wCnDDg42RtI8r5xT7Yws8NFEkjlnkVeh+LXMglpnMNId
         UI25ANwE61oUHXstcSBCRJamB2GuvZ3s0vh0g+51TP239+n2oYGKXk3nHih0nWcYl103
         YWQA==
X-Forwarded-Encrypted: i=1; AJvYcCX1R2tF74jhjutyJjTtf4xIBBrRaEqWO4UY4Zi/IEH+Ai5mV1UFvgzSdUvnAS5RstJqaa4qK/EyiMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzhtJl1wG6TXMdQWxqfM2W+/GBthiOrQZqhkMRBWWn/F5QZCD
	C4ahE5rmxbfrhEyaslB7Pg4A8GnYpmpdR0ekTCbA1hQmCfoKMVxSp0PGz5oAlC7/Tx0=
X-Gm-Gg: ASbGnctlHrMiRjigi1sgywLirO4pOYB+ftJHhHnhgA1hNuNacZCHrB0rCrSTggj/T04
	9htlrq2ihY+BezjZVL7p6L2njrkB4ve7Nei6Z1RnBLhc7cBREROlZR+WTBN3/NmO2E1/b3/QuTj
	C/F/FiCPnkjsPEl2Wg7XCGjL9kxF8xVMEZ/neTPUlkoWfus8MKxZIDoLZ+t91RsQm7rSU8+vC32
	blJLcx3euOYdz8kHLSVo6Rf3Jn8iZ337/BMV3dE9t3DS/udWZWKScrndyzcTtx5tBlCUMfA7voz
	gwzIqkdKUwBbICONqrKB6qjXHfCFfCVc5NidmtuaTcGNXcsNGm3QpHtRa1Prsws7fpp6LEaqRnq
	iCXpOBztti+tZ2JtR9a8YPAF05G+zolhrXqnsgA6ATFSsyD+u2PZCmQXRCiep6FnzKflg0z7GHZ
	Rv7pntCuI1m+3k/pXZ
X-Google-Smtp-Source: AGHT+IH8NIXJxsYuZU1xz+adVmh3MdApnMN81fR/tx7NjCk4HEn80imm6rNP43gwBlJgqV2nyacdRw==
X-Received: by 2002:a05:600c:1c8d:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-477b857906emr40381285e9.4.1763649758984;
        Thu, 20 Nov 2025 06:42:38 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b8314279sm52911195e9.11.2025.11.20.06.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:42:37 -0800 (PST)
Message-ID: <26c00401-47d8-4c0a-8f3c-e5e888ff0440@linaro.org>
Date: Thu, 20 Nov 2025 14:42:34 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] coresight: Refactor
 etm4_config_timestamp_event()
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
 <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
 <CAJ9a7ViDnGa26qdAk1qWBugMVuGp_9w7NMAnMn4v3wf5HTp-Tw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7ViDnGa26qdAk1qWBugMVuGp_9w7NMAnMn4v3wf5HTp-Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2025 2:26 pm, Mike Leach wrote:
> HI James
> 
> On Thu, 20 Nov 2025 at 13:52, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 20/11/2025 1:04 pm, Mike Leach wrote:
>>> Hi James
>>>
>>> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> Remove some of the magic numbers and try to clarify some of the
>>>> documentation so it's clearer how this sets up the timestamp interval.
>>>>
>>>> Return errors directly instead of jumping to out and returning ret,
>>>> nothing needs to be cleaned up at the end and it only obscures the flow
>>>> and return value.
>>>>
>>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
>>>>    drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
>>>>    2 files changed, 81 insertions(+), 38 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>>> index 560975b70474..5d21af346799 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>>> @@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>>>     * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
>>>>     * there a resource selector is configured with the counter and the
>>>>     * timestamp control register to use the resource selector to trigger the
>>>> - * event that will insert a timestamp packet in the stream.
>>>> + * event that will insert a timestamp packet in the stream:
>>>> + *
>>>> + *  +--------------+
>>>> + *  | Resource 1   |   fixed "always-true" resource
>>>> + *  +--------------+
>>>> + *         |
>>>> + *  +------v-------+
>>>> + *  | Counter x    |   (reload to 1 on underflow)
>>>> + *  +--------------+
>>>> + *         |
>>>> + *  +------v--------------+
>>>> + *  | Resource Selector y |   (trigger on counter x == 0)
>>>> + *  +---------------------+
>>>> + *         |
>>>> + *  +------v---------------+
>>>> + *  | Timestamp Generator  |  (timestamp on resource y)
>>>> + *  +----------------------+
>>>>     */
>>>>    static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>    {
>>>> -       int ctridx, ret = -EINVAL;
>>>> -       int counter, rselector;
>>>> -       u32 val = 0;
>>>> +       int ctridx;
>>>> +       int rselector;
>>>>           struct etmv4_config *config = &drvdata->config;
>>>>
>>>>           /* No point in trying if we don't have at least one counter */
>>>>           if (!drvdata->nr_cntr)
>>>> -               goto out;
>>>> +               return -EINVAL;
>>>>
>>>>           /* Find a counter that hasn't been initialised */
>>>>           for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
>>>> @@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>           /* All the counters have been configured already, bail out */
>>>>           if (ctridx == drvdata->nr_cntr) {
>>>>                   pr_debug("%s: no available counter found\n", __func__);
>>>> -               ret = -ENOSPC;
>>>> -               goto out;
>>>> +               return -ENOSPC;
>>>>           }
>>>>
>>>>           /*
>>>> -        * Searching for an available resource selector to use, starting at
>>>> -        * '2' since every implementation has at least 2 resource selector.
>>>> -        * ETMIDR4 gives the number of resource selector _pairs_,
>>>> -        * hence multiply by 2.
>>>> +        * Searching for an available resource selector to use, starting at '2'
>>>> +        * since resource 0 is the fixed 'always returns false' resource and 1
>>>> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
>>>> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
>>>> +        * are no resources, there would also be no counters so wouldn't get
>>>> +        * here.
>>>> +        *
>>>> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
>>>> +        * by 2.
>>>>            */
>>>>           for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
>>>>                   if (!config->res_ctrl[rselector])
>>>> @@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>           if (rselector == drvdata->nr_resource * 2) {
>>>>                   pr_debug("%s: no available resource selector found\n",
>>>>                            __func__);
>>>> -               ret = -ENOSPC;
>>>> -               goto out;
>>>> +               return -ENOSPC;
>>>>           }
>>>>
>>>> -       /* Remember what counter we used */
>>>> -       counter = 1 << ctridx;
>>>> -
>>>>           /*
>>>>            * Initialise original and reload counter value to the smallest
>>>>            * possible value in order to get as much precision as we can.
>>>> @@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>           config->cntr_val[ctridx] = 1;
>>>>           config->cntrldvr[ctridx] = 1;
>>>>
>>>> -       /* Set the trace counter control register */
>>>> -       val =  0x1 << 16        |  /* Bit 16, reload counter automatically */
>>>> -              0x0 << 7         |  /* Select single resource selector */
>>>> -              0x1;                /* Resource selector 1, i.e always true */
>>>> -
>>>> -       config->cntr_ctrl[ctridx] = val;
>>>> -
>>>> -       val = 0x2 << 16         | /* Group 0b0010 - Counter and sequencers */
>>>> -             counter << 0;       /* Counter to use */
>>>> -
>>>> -       config->res_ctrl[rselector] = val;
>>>> +       /*
>>>> +        * Trace Counter Control Register TRCCNTCTLRn
>>>> +        *
>>>> +        * CNTCHAIN = 0, don't reload on the previous counter
>>>> +        * RLDSELF = true, reload counter automatically on underflow
>>>> +        * RLDTYPE = 0, one reload input resource
>>>
>>> These field descriptions should match the terminology in the spec -
>>> and this is not field in this register as defined in the spec - nor
>>> are the following really. The event format is generic - so need a
>>> event select macro, which is then applied to any register that needs
>>> it
>>>
>>>> +        * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
>>>> +        * CNTTYPE = 0, one count input resource
>>>
>>>
>>>> +        * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
>>>> +        */
>>
>> Hmmm not sure where they came from. I think I got stuck trying to decide
>> on which format to use because the ETM spec and Arm ARM are slightly
>> different. I tried to settle on the Arm ARM (because this code is also
>> for ETE, it's newer, and there was existing code that matched its style)
>> but didn't copy that properly either. It should be:
>>
>> CNTCHAIN
>> RLDSELF
>> RLDEVENT_TYPE
>> RLDEVENT_SEL
>> CNTEVENT_TYPE
>> CNTEVENT_SEL
>>
>> Some are correct but some need updating.
>>
>>>> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
>>>> +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
>>>> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
>>>>
>>>
>>> So if we define generic event generators:-
>>>
>>> #define ETM4_SEL_RS_PAIR BIT(7)
>>> #defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
>>> #define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
>>> rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)
>>>
>>> these are then reuseable for all registers that need the 8 bit event
>>> selectors, beyond just this register.
>>>
>>> Thus we now accurately define the fields in the TRCCNTCTLRn
>>>
>>> #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
>>>
>>> and use
>>>
>>> FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
>>> ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))
>>>
>>> etc.
>>>
>>>
>>
>> I'm not sure I agree with that, the Arm ARM has CNTEVENT_TYPE as a
>> regular bit in the TRCCNTCTLRn register so it should be set like any
> 
> Given that this is the ETMv4 driver I was looking at the ETMv4
> specification that defines an 8-bit event field. This might have
> changed for ETE
> 
>> other. Hiding it as a subfield of "EVENT" when it always exists and
>> always does the same thing was maybe seen as a bad decision which is why
>> it was updated?
>>
> 
> I think it is more a side effect of generating documentation from
> computer readable register definitions - which in my view results in
> far poorer documentation from a human readable/comprehension
> perspective.

If that's wrong then it makes sense to get it fixed up in the Arm ARM 
first. And then once that's fixed we can update the driver. We're moving 
towards the sysreg-defs.h style, and even that can be auto generated 
with json so will give us the registers defined in this format.

I don't think the Arm ARM can ever be "wrong" because there's some other 
document that used to define something slightly differently.

> It is a common event format, and naming a bit that always appears and
> does the same thing with multiple different names is not more
> understandable.
> 
> 
>> Also IMO, beyond using labels instead of raw numbers, the code should
>> just show what's programmed into the register.
>> ETM4_RS_SEL_EVENT_SINGLE() would be one more macro to jump through to
>> see what's actually happening.
> 
> Except that if the macro is used consistently throughout the code, and
> you understand the event field format - then you only need to look it
> up once to understand what is happening everywhere it appears in the
> code.
> 
> Moreover, "TRCCNTCTLRn_RLDSEL_MASK GENMASK(12, 8)" is only actually
> valid if TRCCNTCTLRn_RLDTYPE is set to 0. If this bit is set to 1 then
> the correct mask is (11, 8) - you can have 0-31 single resources
> selected, but only 0-15 pairs.
> 

I'm wondering if this review is taking into context what the commit 
message says this change is doing. I'm trying to remove magic numbers 
from existing code in a single function, rather than re-write anything 
or make any new frameworks.

Of course we can always do more and start to validate and assert like 
Leo suggested, but that can be on top of this and is more of a 
functional change. I don't think it necessarily needs to block this 
change as it is now. Only the slightly off field names in the block 
comment make sense to update.

This has also been on the list for quite a while now and I'm starting to 
wonder if style changes at this stage are the most efficient way to go 
about tidying up.

> Regards
> 
> Mike

>>
>>>> -       val = 0x0 << 7          | /* Select single resource selector */
>>>> -             rselector;          /* Resource selector */
>>>> +       /*
>>>> +        * Resource Selection Control Register TRCRSCTLRn
>>>> +        *
>>>> +        * PAIRINV = 0, INV = 0, don't invert
>>>> +        * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
>>>> +        *
>>>> +        * Multiple counters can be selected, and each bit signifies a counter,
>>>> +        * so set bit 'ctridx' to select our counter.
>>>> +        */
>>>> +       config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
>>>> +                                     FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
>>>>
>>>> -       config->ts_ctrl = val;
>>>> +       /*
>>>> +        * Global Timestamp Control Register TRCTSCTLR
>>>> +        *
>>>> +        * TYPE = 0, one input resource
>>>> +        * SEL = rselector, generate timestamp on resource 'rselector'
>>>> +        */
>>>> +       config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
>>>>
>>>
>>> FIELD_PREP(TRCTSCTLR_EVENT_MASK, ETM4_RS_SEL_EVENT_SINGLE(rselector))
>>>
>>>
>>>> -       ret = 0;
>>>> -out:
>>>> -       return ret;
>>>> +       return 0;
>>>>    }
>>>>
>>>>    static int etm4_parse_event_config(struct coresight_device *csdev,
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>>>> index d178d79d9827..b319335e9bc3 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>>>> @@ -225,6 +225,19 @@
>>>>    #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
>>>>    #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
>>>>
>>>> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
>>>> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
>>>> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
>>>> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
>>> per spec this should be
>>> TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
>>>
>>>> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
>>>> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)
>>>
>>> per spec this should be
>>> TRCCNTCTLRn_CNTEVENT_MASK  GENMASK(7, 0)
>>>
>>>
>>>> +
>>>> +#define TRCTSCTLR_TYPE                         BIT(7)
>>>> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)
>>>
>>> TRCTSCTLR_EVENT_MASK GENMASK(7:0)
>>>
>>>> +
>>>> +#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
>>>> +#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
>>>> +
>>>>    /*
>>>>     * System instructions to access ETM registers.
>>>>     * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
>>>> @@ -824,7 +837,7 @@ struct etmv4_config {
>>>>           u32                             eventctrl0;
>>>>           u32                             eventctrl1;
>>>>           u32                             stall_ctrl;
>>>> -       u32                             ts_ctrl;
>>>> +       u32                             ts_ctrl; /* TRCTSCTLR */
>>>>           u32                             ccctlr;
>>>>           u32                             bb_ctrl;
>>>>           u32                             vinst_ctrl;
>>>> @@ -837,11 +850,11 @@ struct etmv4_config {
>>>>           u32                             seq_rst;
>>>>           u32                             seq_state;
>>>>           u8                              cntr_idx;
>>>> -       u32                             cntrldvr[ETMv4_MAX_CNTR];
>>>> -       u32                             cntr_ctrl[ETMv4_MAX_CNTR];
>>>> -       u32                             cntr_val[ETMv4_MAX_CNTR];
>>>> +       u32                             cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
>>>> +       u32                             cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
>>>> +       u32                             cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
>>>>           u8                              res_idx;
>>>> -       u32                             res_ctrl[ETM_MAX_RES_SEL];
>>>> +       u32                             res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>>>>           u8                              ss_idx;
>>>>           u32                             ss_ctrl[ETM_MAX_SS_CMP];
>>>>           u32                             ss_status[ETM_MAX_SS_CMP];
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> Regards
>>>
>>> Mike
>>>
>>
> 
> 

