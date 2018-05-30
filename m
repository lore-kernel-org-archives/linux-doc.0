Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 342987D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 15:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751548AbeE3PjN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 11:39:13 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38034 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751191AbeE3PjM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 11:39:12 -0400
Received: by mail-wr0-f195.google.com with SMTP id 94-v6so29983130wrf.5
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=83SF39gN8SLb60HWUO+0v3CUhEplNZcl8u4wJQYYmGQ=;
        b=bCo9hfqiCiOau0IDzHCTXNNKNp8Jx1X/WETAWysXPF3Py4qmdqB+a5jcLjpaXFfd+E
         zLmV+uhkusFFUAti2AxWXRL1RTfvj+7VfPfM3wdHnEHwz3ndZBE16KOnb/bVYvOEV6vq
         y1HcHcMmaOOo/glLvfXHYEiJjo2otuMvLh34w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=83SF39gN8SLb60HWUO+0v3CUhEplNZcl8u4wJQYYmGQ=;
        b=d77Fttq4V63Gy7UNUlqlmeEpab6zaA0dYHPhGDtB0oyScJ1L0VZT0RtiANvU5eGoaG
         QxtUbfDa0o5jG4pqURiGUlKY7MFLI26J+AESSb3EO0ynWf3cc8GVePofPJspnMFLpxph
         Yo76rCgGqEXfDuvh1FohAOSN5JDDnx94koOKK1EMl+9+SK5oCZ0AzgfTTFCS7BNN5Un+
         o5LUGKqkk7dHnGEhYnkgbXkEqK0jy51PawkvmCdXYAVKUr4/vl4Fp0nXfrxZbl+x3AnF
         wjbRJEX9NlS678Mm+zlzZNPI+wu1UFNAoCIcdZPkzhFu2mgWW4M6wBZYcw0i2H0ieHsN
         +Tiw==
X-Gm-Message-State: ALKqPwekSQfAGI43rWBuVianEQcsGXL03GMinzJ1K48gAU/btY5remcU
        +Y14Z7k0cWrf5qkquHxujdr8RA==
X-Google-Smtp-Source: ADUXVKKi5z43brymsUzHwGVm0pnixYV8O22mejDuwd6OWRhOyKC5C+2wxz5zQnCKyhpFAO9Z//LHUg==
X-Received: by 2002:adf:9246:: with SMTP id 64-v6mr2732375wrj.90.1527694751261;
        Wed, 30 May 2018 08:39:11 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id h81-v6sm34113458wmd.0.2018.05.30.08.39.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 May 2018 08:39:09 -0700 (PDT)
Date:   Wed, 30 May 2018 23:39:00 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Robert Walker <robert.walker@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kim Phillips <kim.phillips@arm.co>,
        Tor Jeremiassen <tor@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [RFT v3 1/4] perf cs-etm: Generate branch sample for missed
 packets
Message-ID: <20180530153900.GA10925@leoy-ThinkPad-X240s>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
 <1527497103-3593-2-git-send-email-leo.yan@linaro.org>
 <20180528221347.GA4109@xps15>
 <5efe804f-364b-6ae1-3fca-ec7f6d8a383d@arm.com>
 <CAJ9a7VhC7EHJ1DtTEH1uERGiBpCJgseboaH0cqgpsU3ZMcgjgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhC7EHJ1DtTEH1uERGiBpCJgseboaH0cqgpsU3ZMcgjgQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

On Wed, May 30, 2018 at 04:04:34PM +0100, Mike Leach wrote:

[...]

> >>> +               /* Generate sample for exception packet */
> >>> +               if (etmq->prev_packet->exc == true)
> >>> +                       generate_sample = true;
> >>
> >>
> >> Please don't do that.  Exception packets have a type of their own and can
> >> be
> >> added to the decoder packet queue the same way INST_RANGE and TRACE_ON
> >> packets
> >> are.  Moreover exception packet containt an address that, if I'm reading
> >> the
> >> documenation properly, can be used to keep track of instructions that were
> >> executed between the last address of the previous range packet and the
> >> address
> >> executed just before the exception occurred.  Mike and Rob will have to
> >> confirm
> >> this as the decoder may be doing all that hard work for us.
> >>
> 
> clarification on the exception packets....
> 
> The Opencsd output exception packet gives you the exception number,
> and optionally the preferred return address. If this address is
> present does depend a lot on the underlying protocol - will normally
> be there with ETMv4.
> Exceptions are marked differently in the underlying protocol - the
> OCSD packets abstract away these differences.
> 
> consider the code:
> 
> 0x1000: <some instructions>
> 0x1100: BR 0x2000
> ....
> 0x2000: <some instructions>
> 0x2020  BZ r4
> 
> Without an exception this would result in the packets
> 
> OCSD_RANGE(0x1000,0x1104, Last instr type=Br, taken)   // recall that
> range packets have start addr inclusive, end addr exclusive.
> OCSD_RANGE(0x2000,0x2024, Last instr type=Br, <taken / not taken -
> depends on condition>
> 
> Now consider an exception occurring before the BR 0x2000
> 
> this will result in:-
> OCSD_RANGE(0x1000, 0x1100, Last instr type=Other)
> OCSD_EXECEPTION(IRQ, ret-addr 0x1100)
> OCSD_RANGE(IRQ_START, IRQ_END+4, Last instr type = BR, taken)    //
> this is more likely to have multiple ranges / branches before any
> return, but simplified here.
> OCSD_EXCEPTION_RETURN()  // present if exception returns are
> explicitly marked in underlying trace - may not always be depending on
> circumstances.
> OCSD_RANGE(0x1100,0x1104, Last=BR, taken) // continue on with short
> range - just the branch
> OCSD_RANGE(0x2000,0x2024, Last instr type=Br, <taken / not taken -
> depends on condition>
> 
> Now consider the exception occurring after the BR, but before any
> other instructions are executed.
> 
> OCSD_RANGE(0x1000,0x1104, Last instr type=Br, taken)   // recall that
> range packets have start addr inclusive, end addr exclusive.
> OCSD_EXECEPTION(IRQ, ret-addr 0x2000)     // here the preferred return
> address is actually the target of the branch.
> OCSD_RANGE(IRQ_START, IRQ_END+4, Last instr type = BR, taken)    //
> this is more likely to have multiple ranges / branches before any
> return, but simplified here.
> OCSD_RANGE(0x2000,0x2024, Last instr type=Br, <taken / not taken -
> depends on condition>
> 
> So in general it is possible to arrive in the IRQ_START range with the
> previous packet having been either a taken branch, a not taken branch,
> or not a branch.
> Care must be taken - whether AutoFDO or normal trace disassembly not
> to assume that having the last range packet as a taken branch means
> that the next range packet is the target, if there is an intervening
> exception packet.

Thanks a lot for detailed explaination.

IIUC, AutoFDO will not have such issue due every range packet will be
handled for it.  On the other hand, as you remind, the branch samples
(and its consumer trace disassembler) is very dependent on the flag
'last_instr_taken_branch'.

According to your explaination, I think we consider the branch is
taken for below situations:

- The new coming packet is exception packet (both for exception entry
  and exit packets);
- The previous packet is expcetion packet;
- The previous packet is normal range packet with
  'last_instr_taken_branch' = true;

So I'd like to use below function to demonstrate my understanding for
exception packets handling.  I also will send out one new patch for
support exception packet for reviewing.

If you have concern or I miss anything, please let me know.

static bool cs_etm__is_taken_branch(struct cs_etm_packet *prev_packet,
                                    struct cs_etm_packet *packet,)
{
        /* The branch is taken for normal range packet with taken branch flag */
        if (prev_packet->sample_type == CS_ETM_RANGE &&
            prev_packet->last_instr_taken_branch)
                return true;

        /* The branch is taken if previous packet is exception packet */
        if (prev_packet->sample_type == CS_ETM_EXCEPTION ||
            prev_packet->sample_type == CS_ETM_EXCEPTION_RET)
                return true;

        /* The branch is taken for an intervening exception packet */
        if (packet->sample_type == CS_ETM_EXCEPTION ||
            packet->sample_type == CS_ETM_EXCEPTION_RET)
                return true;

        return false;
}

[...]

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
