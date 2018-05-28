Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B1A7E7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 22:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932723AbeE1WNx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 18:13:53 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:35025 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932402AbeE1WNw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 18:13:52 -0400
Received: by mail-pl0-f66.google.com with SMTP id i5-v6so7793558plt.2
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vdFgCTcEJeyIfzvizrjdtWpYnBGnCIIRovgJsTQiZ24=;
        b=aRTsSIQCfxRfSOrFR9kPPqH7CK6mhrky+BTFk44XKXHL/mNDScMCXrSx+Buy1sKiEe
         oq434+Vi3s25oCAifAImi2jcq5ZdZdqXYm+lsIQalWPSPb5ZMrvqmY014wX2A9gF3Eq2
         kRTxfTTqwlgCQIDZIkqBrFjfrR/qOxPEKxd6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vdFgCTcEJeyIfzvizrjdtWpYnBGnCIIRovgJsTQiZ24=;
        b=NQfyyZo8S+9cdBXU/+kDRt3hu5LxhEvB9ZNlibwuGWMBCcdeGKvpMrAiIo8gIGwxIx
         aF62BV2B4MJAjY0/zDUv2frqnQ3JUQUXAvqhvP4ReqXpd6fbqx1m44gzXOGI5CN6Mei9
         WfOt0gptVycHad0xjSXKQKvU4LAiQynwjLgY3IeVmxq1AHS4A5t99/o1PMT9Ix+5M/IW
         nUiGs/BG1n4ch4VNxhdzaBZH0ujhtlfU+WNjfbix4batuuzMiBtFdnluuNC2+aJevm9W
         F5nYEjBj0B3+siShgggCzaQwbACrUtkQ1u55s6j33NFk3zVQtADH9V9DwfN6ITgjB2Y/
         OSUA==
X-Gm-Message-State: ALKqPwcKTP6H2uFzlspbdIoCOrYLdyi5X/6y/izlaQjOrJ+noW2878kf
        FF/9YkWIaIqbB1uB5E8+W4C9HFEzrEc=
X-Google-Smtp-Source: AB8JxZqaifNKZm8kEapTRUV2FXhEVxUP/vZBs6zpF1egGO3Mc+H6lfJNeM/uQWX8Ba0KOv0dkCHGOA==
X-Received: by 2002:a17:902:a416:: with SMTP id p22-v6mr13597678plq.228.1527545631324;
        Mon, 28 May 2018 15:13:51 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k73-v6sm2895534pfb.31.2018.05.28.15.13.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 May 2018 15:13:50 -0700 (PDT)
Date:   Mon, 28 May 2018 16:13:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>, mike.leach@linaro.org,
        kim.phillips@arm.co, Tor Jeremiassen <tor@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [RFT v3 1/4] perf cs-etm: Generate branch sample for missed
 packets
Message-ID: <20180528221347.GA4109@xps15>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
 <1527497103-3593-2-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527497103-3593-2-git-send-email-leo.yan@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Leo and/or Robert,

On Mon, May 28, 2018 at 04:45:00PM +0800, Leo Yan wrote:
> Commit e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight
> traces") reworks the samples generation flow from CoreSight trace to
> match the correct format so Perf report tool can display the samples
> properly.
> 
> But the change has side effect for branch packet handling, it only
> generate branch samples by checking previous packet flag
> 'last_instr_taken_branch' is true, this results in below three kinds
> packets are missed to generate branch samples:
> 
> - The start tracing packet at the beginning of tracing data;
> - The exception handling packet;
> - If one CS_ETM_TRACE_ON packet is inserted, we also miss to handle it
>   for branch samples.  CS_ETM_TRACE_ON packet itself can give the info
>   that there have a discontinuity in the trace, on the other hand we
>   also miss to generate proper branch sample for packets before and
>   after CS_ETM_TRACE_ON packet.
> 
> This patch is to add branch sample handling for up three kinds packets:
> 
> - In function cs_etm__sample(), check if 'prev_packet->sample_type' is
>   zero and in this case it generates branch sample for the start tracing
>   packet; furthermore, we also need to handle the condition for
>   prev_packet::end_addr is zero in the cs_etm__last_executed_instr();
> 
> - In function cs_etm__sample(), check if 'prev_packet->exc' is true and
>   generate branch sample for exception handling packet;
> 
> - If there has one CS_ETM_TRACE_ON packet is coming, we firstly generate
>   branch sample in the function cs_etm__flush(), this can save complete
>   info for the previous CS_ETM_RANGE packet just before CS_ETM_TRACE_ON
>   packet.  We also generate branch sample for the new CS_ETM_RANGE
>   packet after CS_ETM_TRACE_ON packet, this have two purposes, the
>   first one purpose is to save the info for the new CS_ETM_RANGE packet,
>   the second purpose is to save CS_ETM_TRACE_ON packet info so we can
>   have hint for a discontinuity in the trace.
> 
>   For CS_ETM_TRACE_ON packet, its fields 'packet->start_addr' and
>   'packet->end_addr' equal to 0xdeadbeefdeadbeefUL which are emitted in
>   the decoder layer as dummy value.  This patch is to convert these
>   values to zeros for more readable; this is accomplished by functions
>   cs_etm__last_executed_instr() and cs_etm__first_executed_instr().  The
>   later one is a new function introduced by this patch.
> 
> Reviewed-by: Robert Walker <robert.walker@arm.com>
> Fixes: e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight traces")
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  tools/perf/util/cs-etm.c | 93 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 822ba91..8418173 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -495,6 +495,20 @@ static inline void cs_etm__reset_last_branch_rb(struct cs_etm_queue *etmq)
>  static inline u64 cs_etm__last_executed_instr(struct cs_etm_packet *packet)
>  {
>  	/*
> +	 * The packet is the start tracing packet if the end_addr is zero,
> +	 * returns 0 for this case.
> +	 */
> +	if (!packet->end_addr)
> +		return 0;

What is considered to be the "start tracing packet"?  Right now the only two
kind of packets inserted in the decoder packet buffer queue are INST_RANGE and
TRACE_ON.  How can we hit a condition where packet->end-addr == 0?


> +
> +	/*
> +	 * The packet is the CS_ETM_TRACE_ON packet if the end_addr is
> +	 * magic number 0xdeadbeefdeadbeefUL, returns 0 for this case.
> +	 */
> +	if (packet->end_addr == 0xdeadbeefdeadbeefUL)
> +		return 0;

As it is with the above, I find triggering on addresses to be brittle and hard
to maintain on the long run.  Packets all have a sample_type field that should
be used in cases like this one.  That way we know exactly the condition that is
targeted.

While working on this set, please spin-off another patch that defines
CS_ETM_INVAL_ADDR 0xdeadbeefdeadbeefUL and replace all the cases where the
numeral is used.  That way we stop using the hard coded value.

> +
> +	/*
>  	 * The packet records the execution range with an exclusive end address
>  	 *
>  	 * A64 instructions are constant size, so the last executed
> @@ -505,6 +519,18 @@ static inline u64 cs_etm__last_executed_instr(struct cs_etm_packet *packet)
>  	return packet->end_addr - A64_INSTR_SIZE;
>  }
>  
> +static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)
> +{
> +	/*
> +	 * The packet is the CS_ETM_TRACE_ON packet if the start_addr is
> +	 * magic number 0xdeadbeefdeadbeefUL, returns 0 for this case.
> +	 */
> +	if (packet->start_addr == 0xdeadbeefdeadbeefUL)
> +		return 0;

Same comment as above.

> +
> +	return packet->start_addr;
> +}
> +
>  static inline u64 cs_etm__instr_count(const struct cs_etm_packet *packet)
>  {
>  	/*
> @@ -546,7 +572,7 @@ static void cs_etm__update_last_branch_rb(struct cs_etm_queue *etmq)
>  
>  	be       = &bs->entries[etmq->last_branch_pos];
>  	be->from = cs_etm__last_executed_instr(etmq->prev_packet);
> -	be->to	 = etmq->packet->start_addr;
> +	be->to	 = cs_etm__first_executed_instr(etmq->packet);
>  	/* No support for mispredict */
>  	be->flags.mispred = 0;
>  	be->flags.predicted = 1;
> @@ -701,7 +727,7 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq)
>  	sample.ip = cs_etm__last_executed_instr(etmq->prev_packet);
>  	sample.pid = etmq->pid;
>  	sample.tid = etmq->tid;
> -	sample.addr = etmq->packet->start_addr;
> +	sample.addr = cs_etm__first_executed_instr(etmq->packet);
>  	sample.id = etmq->etm->branches_id;
>  	sample.stream_id = etmq->etm->branches_id;
>  	sample.period = 1;
> @@ -897,13 +923,28 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
>  		etmq->period_instructions = instrs_over;
>  	}
>  
> -	if (etm->sample_branches &&
> -	    etmq->prev_packet &&
> -	    etmq->prev_packet->sample_type == CS_ETM_RANGE &&
> -	    etmq->prev_packet->last_instr_taken_branch) {
> -		ret = cs_etm__synth_branch_sample(etmq);
> -		if (ret)
> -			return ret;
> +	if (etm->sample_branches && etmq->prev_packet) {
> +		bool generate_sample = false;
> +
> +		/* Generate sample for start tracing packet */
> +		if (etmq->prev_packet->sample_type == 0 ||

What kind of packet is sample_type == 0 ?

> +		    etmq->prev_packet->sample_type == CS_ETM_TRACE_ON)
> +			generate_sample = true;
> +
> +		/* Generate sample for exception packet */
> +		if (etmq->prev_packet->exc == true)
> +			generate_sample = true;

Please don't do that.  Exception packets have a type of their own and can be
added to the decoder packet queue the same way INST_RANGE and TRACE_ON packets
are.  Moreover exception packet containt an address that, if I'm reading the
documenation properly, can be used to keep track of instructions that were
executed between the last address of the previous range packet and the address
executed just before the exception occurred.  Mike and Rob will have to confirm
this as the decoder may be doing all that hard work for us.

> +
> +		/* Generate sample for normal branch packet */
> +		if (etmq->prev_packet->sample_type == CS_ETM_RANGE &&
> +		    etmq->prev_packet->last_instr_taken_branch)
> +			generate_sample = true;
> +
> +		if (generate_sample) {
> +			ret = cs_etm__synth_branch_sample(etmq);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	if (etm->sample_branches || etm->synth_opts.last_branch) {
> @@ -922,11 +963,16 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
>  static int cs_etm__flush(struct cs_etm_queue *etmq)
>  {
>  	int err = 0;
> +	struct cs_etm_auxtrace *etm = etmq->etm;
>  	struct cs_etm_packet *tmp;
>  
> -	if (etmq->etm->synth_opts.last_branch &&
> -	    etmq->prev_packet &&
> -	    etmq->prev_packet->sample_type == CS_ETM_RANGE) {
> +	if (!etmq->prev_packet)
> +		return 0;
> +
> +	if (etmq->prev_packet->sample_type != CS_ETM_RANGE)
> +		return 0;
> +
> +	if (etmq->etm->synth_opts.last_branch) {

If you add:

        if (!etmq->etm->synth_opts.last_branch)
                return 0;

You can avoid indenting the whole block.

>  		/*
>  		 * Generate a last branch event for the branches left in the
>  		 * circular buffer at the end of the trace.
> @@ -939,18 +985,25 @@ static int cs_etm__flush(struct cs_etm_queue *etmq)
>  		err = cs_etm__synth_instruction_sample(
>  			etmq, addr,
>  			etmq->period_instructions);
> +		if (err)
> +			return err;
>  		etmq->period_instructions = 0;
> +	}
>  
> -		/*
> -		 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
> -		 * the next incoming packet.
> -		 */
> -		tmp = etmq->packet;
> -		etmq->packet = etmq->prev_packet;
> -		etmq->prev_packet = tmp;
> +	if (etm->sample_branches) {
> +		err = cs_etm__synth_branch_sample(etmq);
> +		if (err)
> +			return err;
>  	}
>  
> -	return err;
> +	/*
> +	 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
> +	 * the next incoming packet.
> +	 */
> +	tmp = etmq->packet;
> +	etmq->packet = etmq->prev_packet;
> +	etmq->prev_packet = tmp;

Robert, I remember noticing that when you first submitted the code but forgot to
go back to it.  What is the point of swapping the packets?  I understand

etmq->prev_packet = etmq->packet;

But not 

etmq->packet = tmp;

After all etmq->packet will be clobbered as soon as cs_etm_decoder__get_packet()
is called, which is alwasy right after either cs_etm__sample() or
cs_etm__flush().

Thanks,
Mathieu



> +	return 0;
>  }
>  
>  static int cs_etm__run_decoder(struct cs_etm_queue *etmq)
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
