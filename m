Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8C26561D
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539163; cv=none; b=PP41P727bUQRAI3dDy+kFhLfiT3c2rKTDyOqJ9t+HLTPDFuotskNipgrKYAyX/XMDJz2ftd+tkV8Py+/a6kywU/ib1B/HuD1PJiZhKXFbN4qQ8hN0ld1g7Ycy/spSRDzbNIaadyAxdbKvTWFiWp4PJ9Kxq+Y0mKjF+fOcpiR1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539163; c=relaxed/simple;
	bh=uyY6WIiP5Ib/0oE0uaMBrT8UsWCxhz3Zm4essVialEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbURIWRYuRBKX4m4tccJ5HaX2v/MZcAFjmdAfueuUmltCc1z8+VuZQ6XfsOi1cY5bLxhbgrzbatQhhYQidNzhC8DC8ck3oi4+ijdlm4z3s+jm5bvMrZQr107Vd3cvKT7W/nkjGuny2zueNHgebfq8aYRs1/DX6xCZqEfnH+uQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9F70nY8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9F70nY8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47108104bcbso5462525e9.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760539160; x=1761143960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NWaYEYLQddik1cbxrMAgVpyoQxDPjwCbyrPoo8tvR8=;
        b=H9F70nY8IVrYZLQUvvwVvo3GEh5+BFYTT8VmR969AbqDrs0L+pJI8G71LccPhBuRWE
         tHhaYRUyLqDxAYbWbGoQIoPNQp07yV087YtcNdA6pdwoxNmiyvM81Meo7N6Uy1TeMKK/
         5R3x69OdP2E8ucGcqDc9tZIjopDwZDwlw18Haw9kxCc43xejiAjYVsE/9JFAitNmEYgu
         e3P0MD/27zxWn10aV3Ob3WadX6SfqBTBO/vpp5xtT/c377k00/Rf5bgE6/TX1+uAG6gv
         1mDYxiUcFNGFKywI8auowFCgRdXbtY6Irzqz2EYzYWX8wRdDd6OCtrWpDVaM32tJhLmi
         z0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539160; x=1761143960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NWaYEYLQddik1cbxrMAgVpyoQxDPjwCbyrPoo8tvR8=;
        b=VKmX5mxL59uXx6lb8vUJVCM2O3gLjV5oovzCOxqer7QW1a19NVGjWyDIIpE3LBT7JP
         L9fBvLoesNmB6eBnN+dSr5Q+Vw9CLJxqfOVI7qu52KAqCYQm1UoMQ5IdOZSNl9F0fNtk
         rckkJOt3/1hx+ivBQunbDnYdFXSYSMhx6gaD8WJ8GbpBfUFNLev0Mx0MXveMLN5jtnBX
         NrF8PcnSR40/6iXvFPTwVD2LSZrPdRoYIPRzKO5Jb5fFQvUxfCdvUYR+crncoju1cAIc
         oTgGSHdFzo1h+GOroIupPflHBBXAxhy+Ln2vDGbBSdihEYa9JX9K9UnIyAaTtoP65mGo
         HI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz014MZA2Z+h3eTkjfx2guVA+d6RjagM9FEJTesyqF9MWBw0LZca7QSpSgB4raKQQEWjkc6HisI9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+vhZZrXLRZece2EPzIMr0n3tNGs5TT8wcS73ciB0UEEYbh2d
	/kXXWFb70CKTEngDMgnQ61uz1Pk+fvMfol1bhF7DRiBvbrXO+iT1jju03pCsgy7w18Y=
X-Gm-Gg: ASbGnctFBqYsvTV7A/XojZIWLDM6fhlzrEmSi7Gmn6HcAgZUDm2LU4QbiFDeagjzQJi
	jIr1nsbdV+HDNOMdsVH/nt37QcY2hAswdDNn4hPz5LWJ8UZ3kD+K0fkXiHQWo1fpZpmzrrLru5z
	j8Cvx732kQTgk4bZEIHEtUE45Xk9NRUYVVhXnKntprfr7/ydmeQlMIUfjv774OIkhnvvZljkhJS
	/ufrafX4bnA/Na45fAmYO5wPCtRKzCF6PDxAtpEgZa5Y+R8weX/Tci9NFIHfdpEhL4WONgbcZ6p
	tB7fQoKqpCINtOndRkc7c1b8/9pkpIsQnD6FAfERkkXk8qJ4g/w7rLRNqHbPyBwgagi+NCXSltt
	94sx43zbS/7lw2duIbEIvrEdRWSYUw5NF57YRnuGAzZex8l/zRew=
X-Google-Smtp-Source: AGHT+IGH5AEBTaoFH9gRVPnvA7F0J9tUlRbBsBoHjKor3wYJNGBDeV5cNwCHITXzKqNJHSYykywIdw==
X-Received: by 2002:a05:600c:1e87:b0:46e:4b89:13d9 with SMTP id 5b1f17b1804b1-46fa9a22e67mr203510305e9.0.1760539159786;
        Wed, 15 Oct 2025 07:39:19 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47106fc96bbsm10994375e9.3.2025.10.15.07.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:39:19 -0700 (PDT)
Message-ID: <776064a4-d5e1-4a1e-b992-8f776d68da88@linaro.org>
Date: Wed, 15 Oct 2025 15:39:18 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] coresight: Refactor etm4_config_timestamp_event()
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
 <20251002-james-cs-syncfreq-v3-3-fe5df2bf91d1@linaro.org>
 <CAJ9a7VgOO1pmS0chOXugC7eR06v_Tu8onjJA7rnbqcBdZ2m1iA@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgOO1pmS0chOXugC7eR06v_Tu8onjJA7rnbqcBdZ2m1iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/2025 5:02 pm, Mike Leach wrote:
> Hi James,
> 
> On Thu, 2 Oct 2025 at 11:09, James Clark <james.clark@linaro.org> wrote:
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
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 95 ++++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-etm4x.h      | 20 +++--
>>   2 files changed, 77 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 020f070bf17d..920d092ef862 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -609,18 +609,33 @@ static void etm4_enable_hw_smp_call(void *info)
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
> 
> As you mention elsewhere - TS will always be output for at least every
> 4096 bytes - so if we have no counter perhaps we can live with that.
> Previously we where trying to get as fast as possible, now we want to
> slow them down - so every 4096 looks a decent compromise if the
> hardware has no counters.
> TRCTSCTLR will be 0 - which selects the false event - so only the
> non-event timestamps occur. Returning 0 here will enable the non event
> timestamps
> 
> What this means is if the user selects timestamps, there will always
> be at least some timestamps output.
> 
> Alternatively, TRCTSCTLR = 0x1 selects the TRUE event - which might
> result once again in the etm attempting to insert timestamps at every
> available opportunity. - though never tried this!
> 

I tested it and it doesn't make a difference to the frequency (on N1SDP) 
whether the TRUE resource is used directly or routed through the counter 
with reload value = 1. When I first looked at the function I was under 
the impression that TRCTSCTLR.SEL couldn't use the TRUE resource 
directly, and it had to go through a counter. But looks like that's not 
the case so I'm not sure why it wasn't done that way in the first place.

We could change it so that if ts_level == 1 then don't consume a counter 
and use the TRUE resource. But I'm not sure if it's worth it because 
nobody ever complained, so it could be adding complexity where it's not 
needed.

I also wouldn't do it if ts_level > 1 and no counters are available. I 
think continuing to return an error is better in that case because we 
can't give the user what they asked for.

>>
>>          /* Find a counter that hasn't been initialised */
>>          for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
>> @@ -630,15 +645,17 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
> 
> Well - from ETMv4.3 that statement is not true - there can be no RS
> pairs - but no RS pairs forces no counters so should not actually get
> here.
> Needs comment to reflect this.
> 
> 

Will insert "...every implementation _with counters_ has at least..."

>> +        * Searching for an available resource selector to use, starting at '2'
>> +        * since resource 0 is the fixed 'always returns false' resource and 1
>> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
>> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'.
>> +        *
>> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
>> +        * by 2.
>>           */
>>          for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
>>                  if (!config->res_ctrl[rselector])
>> @@ -647,13 +664,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
>> @@ -661,26 +674,42 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
>> +        * RLDSEL = 0, reload on resource 0 (fixed always false resource, never
>> +        *             reload)
>> +        * CNTTYPE = 0, one count input resource
>> +        * CNTSEL = 1, count on resource 1 (fixed always true resource, always
>> +        *             decrement)
>> +        */
>> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
>> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, 1);
>>
> 
> if we are eliminating magic numbers - the '1' here should be something
> like RESOURCE_SEL_TRUE?
> 

Given that resource 0 and 1 are fixed function, yes I think a #define 
for them could be clearer.


Thanks
James

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
>> -       ret = 0;
>> -out:
>> -       return ret;
>> +       return 0;
>>   }
>>
>>   static int etm4_parse_event_config(struct coresight_device *csdev,
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>> index 813e7208ad17..a06338851ef5 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>> @@ -225,6 +225,16 @@
>>   #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
>>   #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
>>
>> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
>> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
>> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
>> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
>> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
>> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)
>> +
>> +#define TRCTSCTLR_TYPE                         BIT(7)
>> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)
>> +
>>   /*
>>    * System instructions to access ETM registers.
>>    * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
>> @@ -824,7 +834,7 @@ struct etmv4_config {
>>          u32                             eventctrl0;
>>          u32                             eventctrl1;
>>          u32                             stall_ctrl;
>> -       u32                             ts_ctrl;
>> +       u32                             ts_ctrl; /* TRCTSCTLR */
>>          u32                             ccctlr;
>>          u32                             bb_ctrl;
>>          u32                             vinst_ctrl;
>> @@ -837,11 +847,11 @@ struct etmv4_config {
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
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

