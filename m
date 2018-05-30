Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE6A17D062
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 00:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966970AbeE3A2u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 20:28:50 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:45082 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965404AbeE3A2t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 20:28:49 -0400
Received: by mail-wr0-f196.google.com with SMTP id w3-v6so27704962wrl.12
        for <linux-doc@vger.kernel.org>; Tue, 29 May 2018 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fTEa843h8mUDPQq89wxhmcKRAvI2ezEIaG+TUvs6hVY=;
        b=S7bmtc9wlwXvySa4kLsX/mWcD/qdRrsvJxlgsCPb0yvx7AssJaW0bPtIlb0Fql2M6p
         CyufAxPB5dvn0cIfbEO64KpEPdfyH0sBhLc5swe2zpZD0NTzOB4rjh5GoyRsAOPyGYWs
         o0o0RFr+aKnopavWKGcTQocUEV3CSUnWFT6ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fTEa843h8mUDPQq89wxhmcKRAvI2ezEIaG+TUvs6hVY=;
        b=k08vilUzSYFW3371IvofEfSLmorvMZyj5ovROHxWVs4KhDRvG1uUKpW2j8duXmU9it
         hO4KhYK/NqSWreQ3Q8Kzb9/R7AbJ+KUtvN4qFk0ICnLw+2IC6cEpVotDzQCWl/zsy/6+
         9GGRHohy3RM+0FifNAxgtD57FO+A69dmSu7C90566n1MnHfSNzVLv6nPluQcbzkzCluu
         jDanu3jhUjhAPWXwb8OKnHJDk1+Xn9PMrN+wf6Ri5Eb7qqGBBUR/3TgU2XzzWhcvzSKg
         fUmyW9MuoxxtPkah/CigymI11NoF4a6eHucoXNMYjbOXLhKOIrwpfzsDcqdrwuYao7MN
         jQsg==
X-Gm-Message-State: ALKqPwc314unV1O4hk24yWJdZG5mqcrI/1F9h0rQHj8s/vMe+XMdsFHu
        3SegPnf1iFaEHV3KVZcK+ZmcfQ==
X-Google-Smtp-Source: ADUXVKIAlt0V6Ds5PpZRhD3KRrR5tqklOKTZ2Ki4Kp0aAa4AAu3ID7GQfHT+uoTSI7t2SmROcxk35g==
X-Received: by 2002:adf:b053:: with SMTP id g19-v6mr355471wra.128.1527640127913;
        Tue, 29 May 2018 17:28:47 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id d83-v6sm24861819wmh.16.2018.05.29.17.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 May 2018 17:28:46 -0700 (PDT)
Date:   Wed, 30 May 2018 08:28:37 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Kim Phillips <kim.phillips@arm.co>,
        Tor Jeremiassen <tor@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        coresight@lists.linaro.org
Subject: Re: [RFT v3 1/4] perf cs-etm: Generate branch sample for missed
 packets
Message-ID: <20180530002837.GB11923@leoy-ThinkPad-X240s>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
 <1527497103-3593-2-git-send-email-leo.yan@linaro.org>
 <20180528221347.GA4109@xps15>
 <20180529002538.GA11317@leoy-ThinkPad-X240s>
 <CANLsYkzEU90aVtPMRqf=YHzee8DHq8JZttRuxjLKGz-gRYiBuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzEU90aVtPMRqf=YHzee8DHq8JZttRuxjLKGz-gRYiBuw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mathieu,

On Tue, May 29, 2018 at 10:04:49AM -0600, Mathieu Poirier wrote:

[...]

> > As now this patch is big with more complex logic, so I consider to
> > split it into small patches:
> >
> > - Define CS_ETM_INVAL_ADDR;
> > - Fix for CS_ETM_TRACE_ON packet;
> > - Fix for exception packet;
> >
> > Does this make sense for you?  I have concern that this patch is a
> > fixing patch, so not sure after spliting patches will introduce
> > trouble for applying them for other stable kernels ...
> 
> Reverse the order:
> 
> - Fix for CS_ETM_TRACE_ON packet;
> - Fix for exception packet;
> - Define CS_ETM_INVAL_ADDR;
> 
> But you may not need to - see next comment.

From the discussion context, I think here 'you may not need to' is
referring to my concern for applying patches on stable kernel, so I
should take this patch series as an enhancement and don't need to
consider much for stable kernel.

On the other hand, your suggestion is possible to mean 'not need
to' split into small patches (though I guess this is misunderstanding
for your meaning).

Could you clarify which is your meaning?

> >> > +
> >> > +   /*
> >> >      * The packet records the execution range with an exclusive end address
> >> >      *
> >> >      * A64 instructions are constant size, so the last executed
> >> > @@ -505,6 +519,18 @@ static inline u64 cs_etm__last_executed_instr(struct cs_etm_packet *packet)
> >> >     return packet->end_addr - A64_INSTR_SIZE;
> >> >  }
> >> >
> >> > +static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)
> >> > +{
> >> > +   /*
> >> > +    * The packet is the CS_ETM_TRACE_ON packet if the start_addr is
> >> > +    * magic number 0xdeadbeefdeadbeefUL, returns 0 for this case.
> >> > +    */
> >> > +   if (packet->start_addr == 0xdeadbeefdeadbeefUL)
> >> > +           return 0;
> >>
> >> Same comment as above.
> >
> > Will do this.
> >
> >> > +
> >> > +   return packet->start_addr;
> >> > +}
> >> > +
> >> >  static inline u64 cs_etm__instr_count(const struct cs_etm_packet *packet)
> >> >  {
> >> >     /*
> >> > @@ -546,7 +572,7 @@ static void cs_etm__update_last_branch_rb(struct cs_etm_queue *etmq)
> >> >
> >> >     be       = &bs->entries[etmq->last_branch_pos];
> >> >     be->from = cs_etm__last_executed_instr(etmq->prev_packet);
> >> > -   be->to   = etmq->packet->start_addr;
> >> > +   be->to   = cs_etm__first_executed_instr(etmq->packet);
> >> >     /* No support for mispredict */
> >> >     be->flags.mispred = 0;
> >> >     be->flags.predicted = 1;
> >> > @@ -701,7 +727,7 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq)
> >> >     sample.ip = cs_etm__last_executed_instr(etmq->prev_packet);
> >> >     sample.pid = etmq->pid;
> >> >     sample.tid = etmq->tid;
> >> > -   sample.addr = etmq->packet->start_addr;
> >> > +   sample.addr = cs_etm__first_executed_instr(etmq->packet);
> >> >     sample.id = etmq->etm->branches_id;
> >> >     sample.stream_id = etmq->etm->branches_id;
> >> >     sample.period = 1;
> >> > @@ -897,13 +923,28 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
> >> >             etmq->period_instructions = instrs_over;
> >> >     }
> >> >
> >> > -   if (etm->sample_branches &&
> >> > -       etmq->prev_packet &&
> >> > -       etmq->prev_packet->sample_type == CS_ETM_RANGE &&
> >> > -       etmq->prev_packet->last_instr_taken_branch) {
> >> > -           ret = cs_etm__synth_branch_sample(etmq);
> >> > -           if (ret)
> >> > -                   return ret;
> >> > +   if (etm->sample_branches && etmq->prev_packet) {
> >> > +           bool generate_sample = false;
> >> > +
> >> > +           /* Generate sample for start tracing packet */
> >> > +           if (etmq->prev_packet->sample_type == 0 ||
> >>
> >> What kind of packet is sample_type == 0 ?
> >
> > Just as explained above, sample_type == 0 is the packet which
> > initialized in the function cs_etm__alloc_queue().
> >
> >> > +               etmq->prev_packet->sample_type == CS_ETM_TRACE_ON)
> >> > +                   generate_sample = true;
> >> > +
> >> > +           /* Generate sample for exception packet */
> >> > +           if (etmq->prev_packet->exc == true)
> >> > +                   generate_sample = true;
> >>
> >> Please don't do that.  Exception packets have a type of their own and can be
> >> added to the decoder packet queue the same way INST_RANGE and TRACE_ON packets
> >> are.  Moreover exception packet containt an address that, if I'm reading the
> >> documenation properly, can be used to keep track of instructions that were
> >> executed between the last address of the previous range packet and the address
> >> executed just before the exception occurred.  Mike and Rob will have to confirm
> >> this as the decoder may be doing all that hard work for us.
> >
> > Sure, will wait for Rob and Mike to confirm for this.
> >
> > At my side, I dump the packet, the exception packet isn't passed to
> > cs-etm.c layer, the decoder layer only sets the flag
> > 'packet->exc = true' when exception packet is coming [1].
> 
> That's because we didn't need the information.  Now that we do a
> function that will insert a packet in the decoder packet queue and
> deal with the new packet type in the main decoder loop [2].  At that
> point your work may not be eligible for stable anymore and I think it
> is fine.  Robert's work was an enhancement over mine and yours is an
> enhancement over his.
> 
> [2]. https://elixir.bootlin.com/linux/v4.17-rc7/source/tools/perf/util/cs-etm.c#L999

Agree, will look into for exception packet and try to add new packet
type for this.

[...]

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
