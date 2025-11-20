Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE334405B
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646729; cv=none; b=aOHVxHS532F1VMZxZSDaRKYHiJHGhy/+28OIuXThyDXuY7HpxLdmwl0Xzn4Kbh5sn60VOXlDJN1GTCgq21Ph/3o/+4mbZQprOCby3KvqxiI95zlIihOZox1AB22TJpwdYQptun9K1UHVmxD6gKQ17i+ObXvWb24O5O7pAZ6BAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646729; c=relaxed/simple;
	bh=eOw1DQwkufV5vG2X8kaSJrDO65KJXbOgm/nDJaR6J+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qu9jghSh6l90MOyHYwl/SUehiGqBk2zT82bA9IQHCHnJOprBSDu7JUXMMujmINJCFT0aLfcI2K9wbSAwRJPNIoD6hJearX3vboCn3Tc0xxligQ9aW+wB5ZKc14S9Hg3s+o9eEVTTwU3X4MtuRMc0PxUMCxh/DC3EOIKnLi0W4x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLp+XSv2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLp+XSv2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755a7652eso5946645e9.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763646725; x=1764251525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxTd+ZeWp+eit6g5odQFlyFPNtqZSMO4jz828a5I+y4=;
        b=yLp+XSv2OO4zHwVnu44TfY2msKo1gW6LuRxdAZwuQ8R3gXAOoFIc55sdmiOtAsQmGV
         0/cpbucvlq+Qyrj9MYO45s0uWSiYBycaAL3Pn5v17BLGaOKeXcBizV9M5iCcOPFeuqnb
         XUOLbMmkTtogfaHESrsBc6wkdLt4JTvRevCrMPkvCFpc+vKNdaZXD6UqG1HvTvmcadSE
         C1zbn96s1P32pSWjdQ23+uYRVszkL0iQu6c7g2czSzazPH3f7ZJIXNPq/rOqNwjYP04o
         NymRJ6QN5PcCsUbAXZso4MPSn1kDc/7N/XB+9lYpJUxJUVB5TL5vYLuzWDZOltqv4QdB
         rp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646725; x=1764251525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxTd+ZeWp+eit6g5odQFlyFPNtqZSMO4jz828a5I+y4=;
        b=uhBpst5syjRNxyas+nC+h0z9N8K8cvPlXyDLdJ2JfMzij+gx/Z9FOXoQic/JzjzJ8f
         cW9CZle6VFKW0j1HCmZNnDQ5xmtlkJz+v4iIiDBUhA1dAn1N6MfnFXQUGWhX6Yg6EWu2
         7uFoDWFY6SXeIab+vEyCShO5WtzM0Ozx0H3ggW9FBOO3uBxVbcxsoC5cTFtmg1okag2D
         MbbliQZiJjaaPI2jyE+hvcgB4tSxzrog6rcPc/I08GcZNweskESvEh1lBXFbkYow169F
         Z10tL2tpVQvqwbTNCx4SAq6VFbdHJ8NwjrbOh4hdMRP+YMplwhMMLXKsyimoaQioYmTi
         GXqw==
X-Forwarded-Encrypted: i=1; AJvYcCXmNa/1shIkkCp54qK/ISgerWwRRGpvMNw8WCmGnD8pxtaUbk8REC+cMXl7imAWM1HsQnict69zxKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59tUnV71xmE+uMDZI/CTuVL/iZyMdCYZIWoIPWST06DwD5SKS
	Tr3FxEOG/cp1tSEC9AdP92pD8jOmS7WqjVLv48fKXS2ixrgoD/CKssYTdEZPZX8UUuPrvxy0m0b
	KT7iFwvo=
X-Gm-Gg: ASbGncvQHiyjUl2JP27qK0UMEEdAKJIpkytYYY1G/NwPAwDGMWd+4T6yHgRB8lzxYtq
	7tIzxJFHXR5/hIHgYohxMKVk8hrE0E0uqREHrkh9p7XMgQt7GRiZFjexNAxGPIb50nPz2qLJIfV
	8kPdi8Gh+TPL9FVSdD8WDmDCDtdcuQ/C2v6w1yOc3XKMqvgwAw9leo2r/sxW/QvkOkdrPXIsb1Y
	k0Qx4nEz4NlaC0oAjdHJ6IpbEKl7HoSj7C2e1PK9uKLL3/zCdzapo4FOVrRRfqYgLeZS+ekabCj
	iTmkmde3D4+KquxPYfsEKcDhAmRKS2MUDyByosAILx5IjgcxTbyw0A1NKGpbtNj9NXJ91C9IRiR
	aAL43FoezAXh2DEFgfhCkxmOOWFhO/TXsBFg7LqUB0iSIzZ13lA9da213ncq4mKGmcW/e+qXsYE
	5+XKxNSK16s2dr3WTx
X-Google-Smtp-Source: AGHT+IF1KwvPoKIcMDIeku4afeJZA1JQ7f2jXYLujWBADiCytVhFQL+pkqFTvnQP4KiJjRvIs5nyHA==
X-Received: by 2002:a05:600c:1987:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-477b8a9b973mr28118915e9.27.1763646725157;
        Thu, 20 Nov 2025 05:52:05 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10763a9sm109553065e9.12.2025.11.20.05.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 05:52:04 -0800 (PST)
Message-ID: <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
Date: Thu, 20 Nov 2025 13:52:03 +0000
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2025 1:04 pm, Mike Leach wrote:
> Hi James
> 
> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>
>> Remove some of the magic numbers and try to clarify some of the
>> documentation so it's clearer how this sets up the timestamp interval.
>>
>> Return errors directly instead of jumping to out and returning ret,
>> nothing needs to be cleaned up at the end and it only obscures the flow
>> and return value.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
>>   2 files changed, 81 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 560975b70474..5d21af346799 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>    * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
>>    * there a resource selector is configured with the counter and the
>>    * timestamp control register to use the resource selector to trigger the
>> - * event that will insert a timestamp packet in the stream.
>> + * event that will insert a timestamp packet in the stream:
>> + *
>> + *  +--------------+
>> + *  | Resource 1   |   fixed "always-true" resource
>> + *  +--------------+
>> + *         |
>> + *  +------v-------+
>> + *  | Counter x    |   (reload to 1 on underflow)
>> + *  +--------------+
>> + *         |
>> + *  +------v--------------+
>> + *  | Resource Selector y |   (trigger on counter x == 0)
>> + *  +---------------------+
>> + *         |
>> + *  +------v---------------+
>> + *  | Timestamp Generator  |  (timestamp on resource y)
>> + *  +----------------------+
>>    */
>>   static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>   {
>> -       int ctridx, ret = -EINVAL;
>> -       int counter, rselector;
>> -       u32 val = 0;
>> +       int ctridx;
>> +       int rselector;
>>          struct etmv4_config *config = &drvdata->config;
>>
>>          /* No point in trying if we don't have at least one counter */
>>          if (!drvdata->nr_cntr)
>> -               goto out;
>> +               return -EINVAL;
>>
>>          /* Find a counter that hasn't been initialised */
>>          for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
>> @@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>          /* All the counters have been configured already, bail out */
>>          if (ctridx == drvdata->nr_cntr) {
>>                  pr_debug("%s: no available counter found\n", __func__);
>> -               ret = -ENOSPC;
>> -               goto out;
>> +               return -ENOSPC;
>>          }
>>
>>          /*
>> -        * Searching for an available resource selector to use, starting at
>> -        * '2' since every implementation has at least 2 resource selector.
>> -        * ETMIDR4 gives the number of resource selector _pairs_,
>> -        * hence multiply by 2.
>> +        * Searching for an available resource selector to use, starting at '2'
>> +        * since resource 0 is the fixed 'always returns false' resource and 1
>> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
>> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
>> +        * are no resources, there would also be no counters so wouldn't get
>> +        * here.
>> +        *
>> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
>> +        * by 2.
>>           */
>>          for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
>>                  if (!config->res_ctrl[rselector])
>> @@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>          if (rselector == drvdata->nr_resource * 2) {
>>                  pr_debug("%s: no available resource selector found\n",
>>                           __func__);
>> -               ret = -ENOSPC;
>> -               goto out;
>> +               return -ENOSPC;
>>          }
>>
>> -       /* Remember what counter we used */
>> -       counter = 1 << ctridx;
>> -
>>          /*
>>           * Initialise original and reload counter value to the smallest
>>           * possible value in order to get as much precision as we can.
>> @@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>          config->cntr_val[ctridx] = 1;
>>          config->cntrldvr[ctridx] = 1;
>>
>> -       /* Set the trace counter control register */
>> -       val =  0x1 << 16        |  /* Bit 16, reload counter automatically */
>> -              0x0 << 7         |  /* Select single resource selector */
>> -              0x1;                /* Resource selector 1, i.e always true */
>> -
>> -       config->cntr_ctrl[ctridx] = val;
>> -
>> -       val = 0x2 << 16         | /* Group 0b0010 - Counter and sequencers */
>> -             counter << 0;       /* Counter to use */
>> -
>> -       config->res_ctrl[rselector] = val;
>> +       /*
>> +        * Trace Counter Control Register TRCCNTCTLRn
>> +        *
>> +        * CNTCHAIN = 0, don't reload on the previous counter
>> +        * RLDSELF = true, reload counter automatically on underflow
>> +        * RLDTYPE = 0, one reload input resource
> 
> These field descriptions should match the terminology in the spec -
> and this is not field in this register as defined in the spec - nor
> are the following really. The event format is generic - so need a
> event select macro, which is then applied to any register that needs
> it
> 
>> +        * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
>> +        * CNTTYPE = 0, one count input resource
> 
> 
>> +        * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
>> +        */

Hmmm not sure where they came from. I think I got stuck trying to decide 
on which format to use because the ETM spec and Arm ARM are slightly 
different. I tried to settle on the Arm ARM (because this code is also 
for ETE, it's newer, and there was existing code that matched its style) 
but didn't copy that properly either. It should be:

CNTCHAIN
RLDSELF
RLDEVENT_TYPE
RLDEVENT_SEL
CNTEVENT_TYPE
CNTEVENT_SEL

Some are correct but some need updating.

>> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
>> +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
>> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
>>
> 
> So if we define generic event generators:-
> 
> #define ETM4_SEL_RS_PAIR BIT(7)
> #defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
> #define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
> rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)
> 
> these are then reuseable for all registers that need the 8 bit event
> selectors, beyond just this register.
> 
> Thus we now accurately define the fields in the TRCCNTCTLRn
> 
> #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> 
> and use
> 
> FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
> ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))
> 
> etc.
> 
> 

I'm not sure I agree with that, the Arm ARM has CNTEVENT_TYPE as a 
regular bit in the TRCCNTCTLRn register so it should be set like any 
other. Hiding it as a subfield of "EVENT" when it always exists and 
always does the same thing was maybe seen as a bad decision which is why 
it was updated?

Also IMO, beyond using labels instead of raw numbers, the code should 
just show what's programmed into the register. 
ETM4_RS_SEL_EVENT_SINGLE() would be one more macro to jump through to 
see what's actually happening.

>> -       val = 0x0 << 7          | /* Select single resource selector */
>> -             rselector;          /* Resource selector */
>> +       /*
>> +        * Resource Selection Control Register TRCRSCTLRn
>> +        *
>> +        * PAIRINV = 0, INV = 0, don't invert
>> +        * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
>> +        *
>> +        * Multiple counters can be selected, and each bit signifies a counter,
>> +        * so set bit 'ctridx' to select our counter.
>> +        */
>> +       config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
>> +                                     FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
>>
>> -       config->ts_ctrl = val;
>> +       /*
>> +        * Global Timestamp Control Register TRCTSCTLR
>> +        *
>> +        * TYPE = 0, one input resource
>> +        * SEL = rselector, generate timestamp on resource 'rselector'
>> +        */
>> +       config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
>>
> 
> FIELD_PREP(TRCTSCTLR_EVENT_MASK, ETM4_RS_SEL_EVENT_SINGLE(rselector))
> 
> 
>> -       ret = 0;
>> -out:
>> -       return ret;
>> +       return 0;
>>   }
>>
>>   static int etm4_parse_event_config(struct coresight_device *csdev,
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>> index d178d79d9827..b319335e9bc3 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>> @@ -225,6 +225,19 @@
>>   #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
>>   #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
>>
>> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
>> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
>> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
>> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
> per spec this should be
> TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> 
>> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
>> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)
> 
> per spec this should be
> TRCCNTCTLRn_CNTEVENT_MASK  GENMASK(7, 0)
> 
> 
>> +
>> +#define TRCTSCTLR_TYPE                         BIT(7)
>> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)
> 
> TRCTSCTLR_EVENT_MASK GENMASK(7:0)
> 
>> +
>> +#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
>> +#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
>> +
>>   /*
>>    * System instructions to access ETM registers.
>>    * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
>> @@ -824,7 +837,7 @@ struct etmv4_config {
>>          u32                             eventctrl0;
>>          u32                             eventctrl1;
>>          u32                             stall_ctrl;
>> -       u32                             ts_ctrl;
>> +       u32                             ts_ctrl; /* TRCTSCTLR */
>>          u32                             ccctlr;
>>          u32                             bb_ctrl;
>>          u32                             vinst_ctrl;
>> @@ -837,11 +850,11 @@ struct etmv4_config {
>>          u32                             seq_rst;
>>          u32                             seq_state;
>>          u8                              cntr_idx;
>> -       u32                             cntrldvr[ETMv4_MAX_CNTR];
>> -       u32                             cntr_ctrl[ETMv4_MAX_CNTR];
>> -       u32                             cntr_val[ETMv4_MAX_CNTR];
>> +       u32                             cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
>> +       u32                             cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
>> +       u32                             cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
>>          u8                              res_idx;
>> -       u32                             res_ctrl[ETM_MAX_RES_SEL];
>> +       u32                             res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>>          u8                              ss_idx;
>>          u32                             ss_ctrl[ETM_MAX_SS_CMP];
>>          u32                             ss_status[ETM_MAX_SS_CMP];
>>
>> --
>> 2.34.1
>>
> 
> Regards
> 
> Mike
> 

