Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBC12FF69
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977347; cv=none; b=coOgMuzGa5sIG9afZmnyo1WdqLQWtEGgSCQWhZzUScRBkNscSm9FCTnQC+VYJn22/RzCauez5tGG3eoJqTKhPBobT5IACGMWy03oVwJovuTgfZY+1tE2y4Zpli2sz4GWVlDlCdmt+8ANWYe4KwbbitJNQkWk9uDUVns+xR250CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977347; c=relaxed/simple;
	bh=Rv1r8dv2fMO1hwBpdwwzJj8JqTXDJYeq3tbS5KG+HZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcVCsdjaRZJp7AW4VLabb67uom0Cw/X1iaKm+h/MHQ64EWTjOgeeKziQgbmI/b1d+gcmLzEVvsskDjpeTETMz83E2Na5HjIWSMwpfVtzAx17lsMdH6S/b6cxn+Uo8FqJTwL7Uv5t/8lKBpevl559qhWsCuOBPkfmRXgwTgjWBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wzsery0w; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wzsery0w"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2dcdde698so610507585a.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763977344; x=1764582144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BqhaweuwzMttxmZu8t6Oiw75KHZIeFhkpjfIVLPQGMk=;
        b=Wzsery0wI2HVA9+XcwYfEvBNRx9WkV5kdRZ9k8PtbRAv+NpyMwerov2egP0InN8CgX
         6aOFTSFZqAgavKsbMPuxKyXbAEea4Qc6Y+zaGBhzIS3Tq7aKeWkBv1nmeSVUXiMXNBlK
         A5B95rxe50O3zqjMPrDCZ+dqDL4yLJJjv044Iq/7+si3GdZE5cCLgk5a+P2W81P91F1v
         ZeI7NAlWbLABNYSHDX9SOQHS5gBFjj4aimKG1OJXgawgVfNM7XRJIcjFKe6nPue4FKYi
         6dQ/rR1+xf3/liMGBlpxZTDRnSAmXfRHyPrjTu6NXLPe8IXjvRlZWNZwtNWouNuhvrMP
         0p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977344; x=1764582144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqhaweuwzMttxmZu8t6Oiw75KHZIeFhkpjfIVLPQGMk=;
        b=a7gflgw+BMlgHHeouqatPjS+q6XNELPlj2k37jUUAnFFmf3fUclHAAHqR44SoQ7E5L
         6HtWA3HR/fd9bMChZ5Jqcykj0x+KZJ5wEKr7nGAcsklbaDoB0sPaYxgliFiMUJ/bSVbt
         23aXVFULzYWoRQFP5CGOjlurqDp7QkL+W5n69+hPG/TV/9E5SOcF8+LUX6lB58B9BWq7
         J4Du7OCHUeLUVNVLcFva6Y5A9Ru23TKKwCHh2z/rRVw/3no2PbZ7XArsENfFfUb1Dcqu
         awaG/nEFxSmZBpHg8xqnOWaZ/W+aHG/1kEhzI2Ne7zIgLrg5d8S/XSPaZ3djw5k3Kzxs
         wYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5vW6tA378i/OrkzNZfcNBzQiAa265zWdrhnasFD5d3y6AQMtqD4P/oCblWv5Yx5ueXoscyVQGZt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmi1UAvUoK/h6CWuvzukTSZPEcf7H3ebx9vgDMFsz1Q7H1dLJ6
	PWsvfQQpS7Q2OWb49VCl5futOQOhIekoCId+ColTqgkFDZ8/f1SigraCg/2Ukq/objR4tBcMKQf
	ZCyJ2SVR6BdNWPrflYGZSg4yQ8xvj54qrRMb6T3K1PdT8m2fCEWb5
X-Gm-Gg: ASbGncuL0DXLFHf8m+gNSbhIzyQqFWRaiMY56LfqoqbxJ8w27yo+yF+WzmieDdRdy4c
	6+hIRd6vFWLqrI1W08n5G1D4FGe7QlUwNULLaEIGlagy03aJr8sOdpu/YeH1mbt4pbrTwCctjci
	HgTFI0DYLz7Jm9r+zChgfCCSqaXTNOfN6QXQUWnQKqQh0mFVUYmUjHbvFp4JqVx/QfFJVLm7yOn
	qMTArv43+kviA9buqRDOO9sR648rppJ2Ha3xaUTH6F5S/Alxb9ldelz1X5KJjV2QT/ww+4DFo+4
	vl5uc0TIFSNInad2fc/1T9n/S+Ac
X-Google-Smtp-Source: AGHT+IFFxSO5AlAryI2psTqWj0Xzeun0O+KDEbJaL9Cfcyk6Wevx0S+SNPLnjccuMxNfD3QLuE5nhCcO9Qo7ZqI+2TM=
X-Received: by 2002:a05:620a:4713:b0:8b2:7290:27f6 with SMTP id
 af79cd13be357-8b33d482773mr1370994185a.67.1763977343915; Mon, 24 Nov 2025
 01:42:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org> <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org> <CAJ9a7ViDnGa26qdAk1qWBugMVuGp_9w7NMAnMn4v3wf5HTp-Tw@mail.gmail.com>
 <26c00401-47d8-4c0a-8f3c-e5e888ff0440@linaro.org>
In-Reply-To: <26c00401-47d8-4c0a-8f3c-e5e888ff0440@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 24 Nov 2025 09:42:12 +0000
X-Gm-Features: AWmQ_bmJymMlXgre4EvK2wVNQi6ukI7O7-lngQZf_923iAhe4USPabXVGZfhgOo
Message-ID: <CAJ9a7Vj8EO4Dd1_qf1YqQz6L8s-37ASyngUU7vEJxJrMjC5hDg@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] coresight: Refactor etm4_config_timestamp_event()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James

On Thu, 20 Nov 2025 at 14:42, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 20/11/2025 2:26 pm, Mike Leach wrote:
> > HI James
> >
> > On Thu, 20 Nov 2025 at 13:52, James Clark <james.clark@linaro.org> wrote:
> >>
> >>
> >>
> >> On 20/11/2025 1:04 pm, Mike Leach wrote:
> >>> Hi James
> >>>
> >>> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
> >>>>
> >>>> Remove some of the magic numbers and try to clarify some of the
> >>>> documentation so it's clearer how this sets up the timestamp interval.
> >>>>
> >>>> Return errors directly instead of jumping to out and returning ret,
> >>>> nothing needs to be cleaned up at the end and it only obscures the flow
> >>>> and return value.
> >>>>
> >>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
> >>>> Signed-off-by: James Clark <james.clark@linaro.org>
> >>>> ---
> >>>>    drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
> >>>>    drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
> >>>>    2 files changed, 81 insertions(+), 38 deletions(-)
> >>>>
> >>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >>>> index 560975b70474..5d21af346799 100644
> >>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >>>> @@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
> >>>>     * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
> >>>>     * there a resource selector is configured with the counter and the
> >>>>     * timestamp control register to use the resource selector to trigger the
> >>>> - * event that will insert a timestamp packet in the stream.
> >>>> + * event that will insert a timestamp packet in the stream:
> >>>> + *
> >>>> + *  +--------------+
> >>>> + *  | Resource 1   |   fixed "always-true" resource
> >>>> + *  +--------------+
> >>>> + *         |
> >>>> + *  +------v-------+
> >>>> + *  | Counter x    |   (reload to 1 on underflow)
> >>>> + *  +--------------+
> >>>> + *         |
> >>>> + *  +------v--------------+
> >>>> + *  | Resource Selector y |   (trigger on counter x == 0)
> >>>> + *  +---------------------+
> >>>> + *         |
> >>>> + *  +------v---------------+
> >>>> + *  | Timestamp Generator  |  (timestamp on resource y)
> >>>> + *  +----------------------+
> >>>>     */
> >>>>    static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> >>>>    {
> >>>> -       int ctridx, ret = -EINVAL;
> >>>> -       int counter, rselector;
> >>>> -       u32 val = 0;
> >>>> +       int ctridx;
> >>>> +       int rselector;
> >>>>           struct etmv4_config *config = &drvdata->config;
> >>>>
> >>>>           /* No point in trying if we don't have at least one counter */
> >>>>           if (!drvdata->nr_cntr)
> >>>> -               goto out;
> >>>> +               return -EINVAL;
> >>>>
> >>>>           /* Find a counter that hasn't been initialised */
> >>>>           for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
> >>>> @@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> >>>>           /* All the counters have been configured already, bail out */
> >>>>           if (ctridx == drvdata->nr_cntr) {
> >>>>                   pr_debug("%s: no available counter found\n", __func__);
> >>>> -               ret = -ENOSPC;
> >>>> -               goto out;
> >>>> +               return -ENOSPC;
> >>>>           }
> >>>>
> >>>>           /*
> >>>> -        * Searching for an available resource selector to use, starting at
> >>>> -        * '2' since every implementation has at least 2 resource selector.
> >>>> -        * ETMIDR4 gives the number of resource selector _pairs_,
> >>>> -        * hence multiply by 2.
> >>>> +        * Searching for an available resource selector to use, starting at '2'
> >>>> +        * since resource 0 is the fixed 'always returns false' resource and 1
> >>>> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
> >>>> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
> >>>> +        * are no resources, there would also be no counters so wouldn't get
> >>>> +        * here.
> >>>> +        *
> >>>> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
> >>>> +        * by 2.
> >>>>            */
> >>>>           for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
> >>>>                   if (!config->res_ctrl[rselector])
> >>>> @@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> >>>>           if (rselector == drvdata->nr_resource * 2) {
> >>>>                   pr_debug("%s: no available resource selector found\n",
> >>>>                            __func__);
> >>>> -               ret = -ENOSPC;
> >>>> -               goto out;
> >>>> +               return -ENOSPC;
> >>>>           }
> >>>>
> >>>> -       /* Remember what counter we used */
> >>>> -       counter = 1 << ctridx;
> >>>> -
> >>>>           /*
> >>>>            * Initialise original and reload counter value to the smallest
> >>>>            * possible value in order to get as much precision as we can.
> >>>> @@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> >>>>           config->cntr_val[ctridx] = 1;
> >>>>           config->cntrldvr[ctridx] = 1;
> >>>>
> >>>> -       /* Set the trace counter control register */
> >>>> -       val =  0x1 << 16        |  /* Bit 16, reload counter automatically */
> >>>> -              0x0 << 7         |  /* Select single resource selector */
> >>>> -              0x1;                /* Resource selector 1, i.e always true */
> >>>> -
> >>>> -       config->cntr_ctrl[ctridx] = val;
> >>>> -
> >>>> -       val = 0x2 << 16         | /* Group 0b0010 - Counter and sequencers */
> >>>> -             counter << 0;       /* Counter to use */
> >>>> -
> >>>> -       config->res_ctrl[rselector] = val;
> >>>> +       /*
> >>>> +        * Trace Counter Control Register TRCCNTCTLRn
> >>>> +        *
> >>>> +        * CNTCHAIN = 0, don't reload on the previous counter
> >>>> +        * RLDSELF = true, reload counter automatically on underflow
> >>>> +        * RLDTYPE = 0, one reload input resource
> >>>
> >>> These field descriptions should match the terminology in the spec -
> >>> and this is not field in this register as defined in the spec - nor
> >>> are the following really. The event format is generic - so need a
> >>> event select macro, which is then applied to any register that needs
> >>> it
> >>>
> >>>> +        * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
> >>>> +        * CNTTYPE = 0, one count input resource
> >>>
> >>>
> >>>> +        * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
> >>>> +        */
> >>
> >> Hmmm not sure where they came from. I think I got stuck trying to decide
> >> on which format to use because the ETM spec and Arm ARM are slightly
> >> different. I tried to settle on the Arm ARM (because this code is also
> >> for ETE, it's newer, and there was existing code that matched its style)
> >> but didn't copy that properly either. It should be:
> >>
> >> CNTCHAIN
> >> RLDSELF
> >> RLDEVENT_TYPE
> >> RLDEVENT_SEL
> >> CNTEVENT_TYPE
> >> CNTEVENT_SEL
> >>
> >> Some are correct but some need updating.
> >>
> >>>> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
> >>>> +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
> >>>> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
> >>>>
> >>>
> >>> So if we define generic event generators:-
> >>>
> >>> #define ETM4_SEL_RS_PAIR BIT(7)
> >>> #defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
> >>> #define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
> >>> rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)
> >>>
> >>> these are then reuseable for all registers that need the 8 bit event
> >>> selectors, beyond just this register.
> >>>
> >>> Thus we now accurately define the fields in the TRCCNTCTLRn
> >>>
> >>> #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> >>>
> >>> and use
> >>>
> >>> FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
> >>> ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))
> >>>
> >>> etc.
> >>>
> >>>
> >>
> >> I'm not sure I agree with that, the Arm ARM has CNTEVENT_TYPE as a
> >> regular bit in the TRCCNTCTLRn register so it should be set like any
> >
> > Given that this is the ETMv4 driver I was looking at the ETMv4
> > specification that defines an 8-bit event field. This might have
> > changed for ETE
> >
> >> other. Hiding it as a subfield of "EVENT" when it always exists and
> >> always does the same thing was maybe seen as a bad decision which is why
> >> it was updated?
> >>
> >
> > I think it is more a side effect of generating documentation from
> > computer readable register definitions - which in my view results in
> > far poorer documentation from a human readable/comprehension
> > perspective.
>
> If that's wrong then it makes sense to get it fixed up in the Arm ARM
> first. And then once that's fixed we can update the driver. We're moving
> towards the sysreg-defs.h style, and even that can be auto generated
> with json so will give us the registers defined in this format.
>
> I don't think the Arm ARM can ever be "wrong" because there's some other
> document that used to define something slightly differently.
>
> > It is a common event format, and naming a bit that always appears and
> > does the same thing with multiple different names is not more
> > understandable.
> >
> >
> >> Also IMO, beyond using labels instead of raw numbers, the code should
> >> just show what's programmed into the register.
> >> ETM4_RS_SEL_EVENT_SINGLE() would be one more macro to jump through to
> >> see what's actually happening.
> >
> > Except that if the macro is used consistently throughout the code, and
> > you understand the event field format - then you only need to look it
> > up once to understand what is happening everywhere it appears in the
> > code.
> >
> > Moreover, "TRCCNTCTLRn_RLDSEL_MASK GENMASK(12, 8)" is only actually
> > valid if TRCCNTCTLRn_RLDTYPE is set to 0. If this bit is set to 1 then
> > the correct mask is (11, 8) - you can have 0-31 single resources
> > selected, but only 0-15 pairs.
> >
>
> I'm wondering if this review is taking into context what the commit
> message says this change is doing. I'm trying to remove magic numbers
> from existing code in a single function, rather than re-write anything
> or make any new frameworks.
>

I am not suggesting new frameworks or re-writing.  Naming as per spec
seems reasonable though, and the issue here is that this is a combined
ETE/ETMv4 driver and the specs differ on the naming.
No problem using the ARM ARM names - perhaps a comment to say which
spec is used for the names would work.

However., the defines do need to be accurate, and the field size does
change with the value of the type bit in the two registers in use in
this patch. As a minimum the define name should indicate that it is
for a single resource field, and we can then add a second define for
the resource pair case if and when needed.

Regards

Mike

> Of course we can always do more and start to validate and assert like
> Leo suggested, but that can be on top of this and is more of a
> functional change. I don't think it necessarily needs to block this
> change as it is now. Only the slightly off field names in the block
> comment make sense to update.
>
> This has also been on the list for quite a while now and I'm starting to
> wonder if style changes at this stage are the most efficient way to go
> about tidying up.
>
> > Regards
> >
> > Mike
>
> >>
> >>>> -       val = 0x0 << 7          | /* Select single resource selector */
> >>>> -             rselector;          /* Resource selector */
> >>>> +       /*
> >>>> +        * Resource Selection Control Register TRCRSCTLRn
> >>>> +        *
> >>>> +        * PAIRINV = 0, INV = 0, don't invert
> >>>> +        * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
> >>>> +        *
> >>>> +        * Multiple counters can be selected, and each bit signifies a counter,
> >>>> +        * so set bit 'ctridx' to select our counter.
> >>>> +        */
> >>>> +       config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
> >>>> +                                     FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
> >>>>
> >>>> -       config->ts_ctrl = val;
> >>>> +       /*
> >>>> +        * Global Timestamp Control Register TRCTSCTLR
> >>>> +        *
> >>>> +        * TYPE = 0, one input resource
> >>>> +        * SEL = rselector, generate timestamp on resource 'rselector'
> >>>> +        */
> >>>> +       config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
> >>>>
> >>>
> >>> FIELD_PREP(TRCTSCTLR_EVENT_MASK, ETM4_RS_SEL_EVENT_SINGLE(rselector))
> >>>
> >>>
> >>>> -       ret = 0;
> >>>> -out:
> >>>> -       return ret;
> >>>> +       return 0;
> >>>>    }
> >>>>
> >>>>    static int etm4_parse_event_config(struct coresight_device *csdev,
> >>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> >>>> index d178d79d9827..b319335e9bc3 100644
> >>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> >>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> >>>> @@ -225,6 +225,19 @@
> >>>>    #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
> >>>>    #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
> >>>>
> >>>> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
> >>>> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
> >>>> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
> >>>> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
> >>> per spec this should be
> >>> TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> >>>
> >>>> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
> >>>> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)
> >>>
> >>> per spec this should be
> >>> TRCCNTCTLRn_CNTEVENT_MASK  GENMASK(7, 0)
> >>>
> >>>
> >>>> +
> >>>> +#define TRCTSCTLR_TYPE                         BIT(7)
> >>>> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)
> >>>
> >>> TRCTSCTLR_EVENT_MASK GENMASK(7:0)
> >>>
> >>>> +
> >>>> +#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
> >>>> +#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
> >>>> +
> >>>>    /*
> >>>>     * System instructions to access ETM registers.
> >>>>     * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
> >>>> @@ -824,7 +837,7 @@ struct etmv4_config {
> >>>>           u32                             eventctrl0;
> >>>>           u32                             eventctrl1;
> >>>>           u32                             stall_ctrl;
> >>>> -       u32                             ts_ctrl;
> >>>> +       u32                             ts_ctrl; /* TRCTSCTLR */
> >>>>           u32                             ccctlr;
> >>>>           u32                             bb_ctrl;
> >>>>           u32                             vinst_ctrl;
> >>>> @@ -837,11 +850,11 @@ struct etmv4_config {
> >>>>           u32                             seq_rst;
> >>>>           u32                             seq_state;
> >>>>           u8                              cntr_idx;
> >>>> -       u32                             cntrldvr[ETMv4_MAX_CNTR];
> >>>> -       u32                             cntr_ctrl[ETMv4_MAX_CNTR];
> >>>> -       u32                             cntr_val[ETMv4_MAX_CNTR];
> >>>> +       u32                             cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
> >>>> +       u32                             cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
> >>>> +       u32                             cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
> >>>>           u8                              res_idx;
> >>>> -       u32                             res_ctrl[ETM_MAX_RES_SEL];
> >>>> +       u32                             res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
> >>>>           u8                              ss_idx;
> >>>>           u32                             ss_ctrl[ETM_MAX_SS_CMP];
> >>>>           u32                             ss_status[ETM_MAX_SS_CMP];
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>> Regards
> >>>
> >>> Mike
> >>>
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
