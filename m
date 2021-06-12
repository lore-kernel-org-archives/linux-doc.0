Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1A1C48BE5
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 08:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC276128A
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 08:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhFLItV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 04:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30635 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229584AbhFLItU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 04:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623487640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O6H7xrH8WlW3JYgBRosKfDcCNQcDPejOi41gdwYkK9Q=;
        b=AE+XP9RiDwVJLJ+CKT31dKJSY4YKhJKj2Z+0lDWNZzPs3l9MRw6yEaUlIG4lZkWphcBHXo
        nOKbuMQbHYjS1h0/EzREo+eIyq+fbpkISPbLtMLWEcOSV7N9nX7vo/4v5lq9Z9y9h5U614
        NlKEzGxhD651aOP/MOgL0AFDoDryU8I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-aJBFxi9jOI2gpwl-EZOofw-1; Sat, 12 Jun 2021 04:47:19 -0400
X-MC-Unique: aJBFxi9jOI2gpwl-EZOofw-1
Received: by mail-ed1-f69.google.com with SMTP id q7-20020aa7cc070000b029038f59dab1c5so17153772edt.23
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 01:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O6H7xrH8WlW3JYgBRosKfDcCNQcDPejOi41gdwYkK9Q=;
        b=F4e32IwEgcs5T1RY1Drowi7rEsdcwjjEj6rA4n3+Zas1B3loI6QKlxEQ7Zu30rAtqf
         EHCgaXoAGSpDObvZCqbGrr77ec0cQFDmGCT2mzKHg3mdqpOMI2WGrEjDfS77mJj/sH4L
         ttWGUYqHZmQ7p0JopYr7A5A4475unD7hQw53ZF2bQSfBNKyoqP3T7lpi5UtQDTKKfq+J
         yG6mZWu17QIFLw2GZvK4iZyDzUCNhqbpqQpAUwYNqrl5r3MuPSWwOmXCJIxcaABK7CgI
         w1kfdyt9NgBeMA8DF8eptIexaaWbMvSR2ibYfDD9PqK6pLAEzcNaiVzkJ6iNJe1qG5oh
         uOHg==
X-Gm-Message-State: AOAM533GeMlH5pSDaXIrNlexispelA+RITTUdlejZNPCdHSn4XMQEMqm
        evPHY/hM25FN+aIMm1u/Nn69I2tD6YEGJ/NmUba++30oczeklCK3eUrV5ZDu23Wc22ES4RXIx7n
        4h4PKzJHHd5Xlslvuhe13D4pkO3wIKtABuoIEnUCaj1u/tpNk7g1zNgIpR/r8lu9JPBMfAb4=
X-Received: by 2002:a17:907:1117:: with SMTP id qu23mr7183465ejb.71.1623487637994;
        Sat, 12 Jun 2021 01:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCQFIo7KBPYozGVLGIZN1XqAQl41VgxnT8t2//ftPGOd03P9hy2+n8/dmKkrs6fnx0gHNpOA==
X-Received: by 2002:a17:907:1117:: with SMTP id qu23mr7183441ejb.71.1623487637723;
        Sat, 12 Jun 2021 01:47:17 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id l24sm450239eji.14.2021.06.12.01.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 01:47:17 -0700 (PDT)
Subject: Re: [PATCH V3 9/9] tracing: Add timerlat tracer
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621024265.git.bristot@redhat.com>
 <b650672b9973887ef1420bc1e76b97940b6522d6.1621024265.git.bristot@redhat.com>
 <20210607213639.68aad064@gandalf.local.home>
 <6bc850eb-14c8-6898-847c-d9f0e67d60f8@redhat.com>
 <20210611164855.252f35fb@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <80f74da1-a9a7-2af9-dd4f-c22f312214df@redhat.com>
Date:   Sat, 12 Jun 2021 10:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611164855.252f35fb@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/11/21 10:48 PM, Steven Rostedt wrote:
> On Fri, 11 Jun 2021 16:13:36 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>>>> +
>>>> +#ifdef CONFIG_STACKTRACE
>>>> +/*
>>>> + * Stack trace will take place only at IRQ level, so, no need
>>>> + * to control nesting here.
>>>> + */
>>>> +struct trace_stack {
>>>> +	int stack_size;
>>>> +	int nr_entries;
>>>> +	unsigned long           calls[PAGE_SIZE];  
>>>
>>> That is rather big. It's 8 * PAGE_SIZE. I don't think that's what you really
>>> wanted.  
>>
>> no, I did not want that... is 256 a good number?
> 
> Sure. But make it a macro.
> 
> #define MAX_CALLS 256
> 
> or something like that.

Ack!

>>
>>>> +};
>>>> +
>>>> +static DEFINE_PER_CPU(struct trace_stack, trace_stack);
>>>> +
>>>> +/**  
>>>
>>> Again, remove the KernelDoc notation of /**, or make it real kerneldoc
>>> notation.  
>>
>> Fixed!
>>
>> [...]
>>
>>>>   *
>>>> @@ -801,6 +1017,22 @@ void trace_softirq_exit_callback(void *data, unsigned int vec_nr)
>>>>  	if (!osn_var->sampling)
>>>>  		return;
>>>>  
>>>> +#ifdef CONFIG_TIMERLAT_TRACER
>>>> +	/*
>>>> +	 * If the timerlat is enabled, but the irq handler did
>>>> +	 * not run yet enabling timerlat_tracer, do not trace.
>>>> +	 */
>>>> +	if (unlikely(osnoise_data.timerlat_tracer)) {
>>>> +		struct timerlat_variables *tlat_var;
>>>> +		tlat_var = this_cpu_tmr_var();
>>>> +		if (!tlat_var->tracing_thread) {  
>>>
>>> What happens if the timer interrupt triggers here?  
>>
>> The tracer will not report the softirq overhead. But at this point, the softirq
>> is returning, and the duration would be from this time to...
>>
>>
>>
>>>> +			osn_var->softirq.arrival_time = 0;
>>>> +			osn_var->softirq.delta_start = 0;
>>>> +			return;
>>>> +		}
>>>> +	}
>>>> +#endif
>>>> +
>>>>  	duration = get_int_safe_duration(osn_var, &osn_var->softirq.delta_start);  
>>
>> here.
>>
>> We can disable interrupts to avoid this issue. But the question is, is it worth
>> to disable interrupts to avoid this problem?
>>
>>>>  	trace_softirq_noise(vec_nr, osn_var->softirq.arrival_time, duration);
>>>>  	cond_move_thread_delta_start(osn_var, duration);
>>>> @@ -893,6 +1125,18 @@ thread_exit(struct osnoise_variables *osn_var, struct task_struct *t)
>>>>  	if (!osn_var->sampling)
>>>>  		return;
>>>>  
>>>> +#ifdef CONFIG_TIMERLAT_TRACER
>>>> +	if (osnoise_data.timerlat_tracer) {
>>>> +		struct timerlat_variables *tlat_var;
>>>> +		tlat_var = this_cpu_tmr_var();
>>>> +		if (!tlat_var->tracing_thread) {  
>>>
>>> Or here?  
>>
>> The problem that can happen with the softirq cannot happen here: this code runs
>> with interrupts disabled on __schedule() (it is hooked to the sched_switch).
>>
>>>> +			osn_var->thread.delta_start = 0;
>>>> +			osn_var->thread.arrival_time = 0;
>>>> +			return;
>>>> +		}
>>>> +	}
>>>> +#endif
>>>> +
>>>>  	duration = get_int_safe_duration(osn_var, &osn_var->thread.delta_start);
>>>>  
>>>>  	trace_thread_noise(t, osn_var->thread.arrival_time, duration);
>>>> @@ -1182,6 +1426,197 @@ static int osnoise_main(void *data)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +#ifdef CONFIG_TIMERLAT_TRACER
>>>> +/**
>>>> + * timerlat_irq - hrtimer handler for timerlat.
>>>> + */
>>>> +static enum hrtimer_restart timerlat_irq(struct hrtimer *timer)
>>>> +{
>>>> +	struct osnoise_variables *osn_var = this_cpu_osn_var();
>>>> +	struct trace_array *tr = osnoise_trace;
>>>> +	struct timerlat_variables *tlat;
>>>> +	struct timerlat_sample s;
>>>> +	u64 now;
>>>> +	u64 diff;
>>>> +
>>>> +	/*
>>>> +	 * I am not sure if the timer was armed for this CPU. So, get
>>>> +	 * the timerlat struct from the timer itself, not from this
>>>> +	 * CPU.
>>>> +	 */
>>>> +	tlat = container_of(timer, struct timerlat_variables, timer);
>>>> +
>>>> +	now = ktime_to_ns(hrtimer_cb_get_time(&tlat->timer));
>>>> +
>>>> +	/*
>>>> +	 * Enable the osnoise: events for thread an softirq.
>>>> +	 */
>>>> +	tlat->tracing_thread = true;
>>>> +
>>>> +	osn_var->thread.arrival_time = time_get();
>>>> +
>>>> +	/*
>>>> +	 * A hardirq is running: the timer IRQ. It is for sure preempting
>>>> +	 * a thread, and potentially preempting a softirq.
>>>> +	 *
>>>> +	 * At this point, it is not interesting to know the duration of the
>>>> +	 * preempted thread (and maybe softirq), but how much time they will
>>>> +	 * delay the beginning of the execution of the timer thread.
>>>> +	 *
>>>> +	 * To get the correct (net) delay added by the softirq, its delta_start
>>>> +	 * is set as the IRQ one. In this way, at the return of the IRQ, the delta
>>>> +	 * start of the sofitrq will be zeroed, accounting then only the time
>>>> +	 * after that.
>>>> +	 *
>>>> +	 * The thread follows the same principle. However, if a softirq is
>>>> +	 * running, the thread needs to receive the softirq delta_start. The
>>>> +	 * reason being is that the softirq will be the last to be unfolded,
>>>> +	 * resseting the thread delay to zero.
>>>> +	 */
>>>> +#ifndef CONFIG_PREEMPT_RT
>>>> +	if (osn_var->softirq.delta_start) {
>>>> +		copy_int_safe_time(osn_var, &osn_var->thread.delta_start,
>>>> +				   &osn_var->softirq.delta_start);  
>>>
>>> Isn't softirq.delta_start going to be zero here? It doesn't look to get
>>> updated until you set tracing_thread to true, but that happens here, and as
>>> this is in a interrupt context, there will not be a softirq happening
>>> between the setting of that to true to this point.  
>>
>> No... on the timerlat, the "sampling" is always on. And the
>> osnoise_data.timerlat_tracer is only checked at the softirq return, so the
>> softirq entry always set set the delta_start.
> 
> OK, I was confused by the timerlat using the "__osnoise_tracer_start()". If
> timerlat is going to use that, perhaps we need to rename it, because the
> "osnoise" is one tracer, and its confusing that the "timerlat" is using
> functions called "*_osnoise_*". I was thinking that those functions were
> only for the osnoise tracer and not part of the timerlat tracer, and
> ignored them when looking at what the timerlat tracer was doing.
> 
> Can we rename that to simply "start_latency_tracing()" or something more
> generic.

right, also considering that we will (I hope) have the rtsl next, and other
ideas coming around the usage of osnoise: events on other tracers, I also think
should a more generic term to the events. Indeed, on rtsl they have a different
name.

Thinking only about the instrumentation/events, what they are tracking is the
execution time. So how about naming them as:

exec_time:thread
exec_time:irq

Also adding that, although here we measure the execution time of "task" context,
on rtsl we have other kinds of "windows" that they measure, for instance, the
poid window (Preemption or IRQ disabled). So, the term exec time also fits there.

?

>>
>>>> +
>>>> +		copy_int_safe_time(osn_var, &osn_var->softirq.delta_start,
>>>> +				    &osn_var->irq.delta_start);
>>>> +	} else {
>>>> +		copy_int_safe_time(osn_var, &osn_var->thread.delta_start,
>>>> +				    &osn_var->irq.delta_start);
>>>> +	}
>>>> +#else /* CONFIG_PREEMPT_RT */
>>>> +	/*
>>>> +	 * The sofirqs run as threads on RT, so there is not need
>>>> +	 * to keep track of it.
>>>> +	 */
>>>> +	copy_int_safe_time(osn_var, &osn_var->thread.delta_start, &osn_var->irq.delta_start);
>>>> +#endif /* CONFIG_PREEMPT_RT */
>>>> +
>>>> +	/*
>>>> +	 * Compute the current time with the expected time.
>>>> +	 */
>>>> +	diff = now - tlat->abs_period;
>>>> +
>>>> +	tlat->count++;
>>>> +	s.seqnum = tlat->count;
>>>> +	s.timer_latency = diff;
>>>> +	s.context = IRQ_CONTEXT;
>>>> +
>>>> +	trace_timerlat_sample(&s);
>>>> +
>>>> +	/* Keep a running maximum ever recorded os noise "latency" */
>>>> +	if (diff > tr->max_latency) {
>>>> +		tr->max_latency = diff;
>>>> +		latency_fsnotify(tr);
>>>> +	}
>>>> +
>>>> +	if (osnoise_data.stop_tracing_in)
>>>> +		if (time_to_us(diff) >= osnoise_data.stop_tracing_in)
>>>> +			osnoise_stop_tracing();
>>>> +
>>>> +	wake_up_process(tlat->kthread);
>>>> +
>>>> +#ifdef CONFIG_STACKTRACE
>>>> +	if (osnoise_data.print_stack)
>>>> +		timerlat_save_stack(0);
>>>> +#endif  
>>>
>>> No need for the #ifdef above. timerlat_save_stack() is defined as a nop
>>> when not enabled, and the compiler will just optimize this out.  
>>
>> The osnoise_data.print_stack is ifdefed, should I remove it from ifdef?
> 
> Well, the above ifdef is for STACKTRACE not for TIMERLAT_TRACER, which
> encompasses all of this. And the "timerlat_save_stack()" is a nop when
> STACKTRACE is not defined. So no.

Ooooppppsss, right, miss attention from my side.

-- Daniel

> -- Steve
> 
>>
>>>   
>>>> +
>>>> +	return HRTIMER_NORESTART;
>>>> +}
>>>> +
> 

