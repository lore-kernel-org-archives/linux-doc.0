Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE31C48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 09:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14AED61248
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 09:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhFLJnq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 05:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45351 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbhFLJnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 05:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623490905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pPOTnBlb5gG14HcFtr8VUBr+dq0of1GZHHpn43YJCFs=;
        b=U9VRWb/QFPO0z59L/GSoQMcKdhrVdS+91AnsvoRowtfSEm7v7162GHcQSx3sCZ2uZvmHvW
        OFRnWlz4E2a1lG5yoIu8qbVlDb72SPCcqSCxPwBkYoD+xPtjrSKXukS2Z+8rxbxVNyZsdt
        iAEsPPz+U29JMnSXEN6LfNwcLTtGzEA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-niWn08LDMIev_a64XOggxg-1; Sat, 12 Jun 2021 05:41:44 -0400
X-MC-Unique: niWn08LDMIev_a64XOggxg-1
Received: by mail-ej1-f69.google.com with SMTP id n19-20020a1709067253b029043b446e4a03so1671650ejk.23
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 02:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pPOTnBlb5gG14HcFtr8VUBr+dq0of1GZHHpn43YJCFs=;
        b=l0+WPNsVX+bsRPxzQ6uYwcOSs4lx/uRpVAv0S7oMpaZ3hSgdCG21m2P9U4vpWn4pk4
         oTqBazlfrfsoByHZ4lXTMLgYeJRkyRlVR9Se1yjgkX7CbOZhbkJu1mhuFKLMhIGLnvEn
         F027AM2nL5mlRsN2Gnhhv/psjxqrE/0ZD0Y7bALx5Rw3tVI7Hs85Br1Cpm2kI2suvxY4
         y0eLGs6viY8qyBfhDW4rL3oIAD/11BVbZ+IOrYEusdOIR9PqR2R6ckjkMgJKlPRBXfQQ
         iCvlBLfj5A5Z7jagB5LR+bKBqhERAecyjNM2J4QcnBb3SBCUE6ugiBGNsh5B2voYkJoU
         0s+A==
X-Gm-Message-State: AOAM532Pn7R1IEQAJngAWqHbYe/pBvNsVNq8VKjakyQKkuqVgaKotNoG
        EFtk/3wn4i2XfkgBbTH2S3I22hG7hmsY59yvRjgu1iZB4tZWUb3KOjBR5vRHJTzThF8qIx3kjP+
        ihyZtBti0FIZJ/QxTPMdDIB47urK309CloV7DxUCtgY3wfeKrlUS1FAvdt8S48iNHquXbWzY=
X-Received: by 2002:a05:6402:40cc:: with SMTP id z12mr7765836edb.202.1623490903297;
        Sat, 12 Jun 2021 02:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjkRPqvVX2DYHQMsKZKDTTc+kPdXuszH9U3Wlwp10935qst42YhGcUNHLhN676CBUWW0ayrw==
X-Received: by 2002:a05:6402:40cc:: with SMTP id z12mr7765815edb.202.1623490903063;
        Sat, 12 Jun 2021 02:41:43 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id u17sm3529584edx.16.2021.06.12.02.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 02:41:42 -0700 (PDT)
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
 <fd2bdb45-e68a-995e-271e-ec181f04ecbc@redhat.com>
 <20210611160340.6970e10c@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <6808245d-208c-c6d2-1c6e-7410df158992@redhat.com>
Date:   Sat, 12 Jun 2021 11:41:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611160340.6970e10c@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/11/21 10:03 PM, Steven Rostedt wrote:
> On Fri, 11 Jun 2021 14:59:13 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> ------------------ %< -----------------------------
>> It is worth mentioning that the *duration* values reported
>> by the osnoise: events are *net* values. For example, the
>> thread_noise does not include the duration of the overhead caused
>> by the IRQ execution (which indeed accounted for 12736 ns). But
>> the values reported by the timerlat tracer (timerlat_latency)
>> are *gross* values.
>>
>> The art below illustrates a CPU timeline and how the timerlat tracer
>> observes it at the top and the osnoise: events at the bottom. Each "-"
>> in the timelines means 1 us, and the time moves ==>:
>>
>>      External          context irq                  context thread
>>       clock           timer_latency                 timer_latency
>>       event              18 us                          48 us 
>>         |                  ^                             ^
>>         v                  |                             |
>>         |------------------|                             |       <-- timerlat irq timeline
>>         |------------------+-----------------------------|       <-- timerlat thread timeline
>>                            ^                             ^
>>  ===================== CPU timeline ======================================
>>                    [timerlat/ irq]  [ dev irq ]                          
>>  [another thread...^             v..^         v........][timerlat/ thread]  
>>  ===================== CPU timeline ======================================
>>                    |-------------|  |---------|                  <-- irq_noise timeline
>>                                  |--^         v--------|         <-- thread_noise timeline
>>                                  |            |        |
>>                                  |            |        + thread_noise: 10 us
>>                                  |            +-> irq_noise: 9 us
>>                                  +-> irq_noise: 13 us
>>
>>  --------------- >% --------------------------------  
> 
> That's really busy, and honestly, I can't tell what is what.
> 
> The "context irq timer_latency" is a confusing name. Could we just have
> that be "timer irq latency"? And "context thread timer_latency" just be
> "thread latency". Adding too much text to the name actually makes it harder
> to understand. We want to simplify it, not make people have to think harder
> to see it.
> 
> I think we can get rid of the "<-- .* timeline" to the right.  I don't
> think they are necessary. Again, the more you add to the diagram, the
> busier it looks, and the harder it is to read.
> 
> Could we switch "[timerlat/ irq]" to just "[timer irq]" and explain how
> that "context irq timer_latency"/"timer irq latency" is related?
> 
> Should probably state that the "dev irq" is an unrelated device interrupt
> that happened.
> 
> What's with the two CPU timeline lines? Now there I think it would be
> better to have the arrow text by itself.
> 
> And finally, not sure if you plan on doing this, but have a output of the
> trace that would show the above.
> 
> Thus, here's what I would expect to see:
> 
>       External         
>        clock         timer irq latency             e    thread latency
>        event              18 us                          48 us 
>          |                  ^                             ^
>          v                  |                             |
>          |------------------|                             |
>          |------------------+-----------------------------|       
>                             ^                             ^
>   =========================================================================
>                     [timerlat/ irq]  [ dev irq ]                             
>   [another thread...^             v..^         v........][timerlat/ thread]  <-- CPU task timeline
>   =========================================================================
>                     |-------------|  |---------|
>                                   |--^         v--------|
>                                   |            |        |
>                                   |            |        + thread_noise: 10 us
>                                   |            +-> irq_noise: 9 us
>                                   +-> irq_noise: 13 us

It looks good to me!

>  The "[ dev irq ]" above is an interrupt from some device on the system that
>  causes extra noise to the timerlat task.
> 
> I think the above may be easier to understand, especially if the trace
> output that represents it is below.

ok, I can try to capture a trace sample and represent it into the ASCII art
format above.

> Also, I have to ask, shouldn't the "thread noise" really start at the
> "External clock event"?

To go in that direction, we need to track things that delayed the IRQ execution.
We are already tracking other IRQs' execution, but we will have to keep a
history of past executions and "playback" them. This will add some overhead
linear to the past event... and/or some pessimism.

We will also have to track IRQ disabled sections. The problem of tracking IRQ
disabled is that it depends on tracing infra-structure that is not enabled by
default of distros... And there are IRQ delay causes that are not related to the
thread... like idle states... (and all these things create more and more states
to track these things)...

So, I added the timer irq latency to figure out when the problem is related to
things that delay the IRQ, and the stack trace will help us figure out where the
problem is in the thread context. After the IRQ execution, the thread noise is
helpful - even without all the thread noise before the IRQ.

Furthermore, if we start trying to abstract the causes of delay, we will find
the rtsl :-). The rtls events and abstractions give us the worst-case scheduling
latency without adding unneeded pessimism (sound analysis). It covers all the
possible cases, for all any schedulers, even without the need of a measuring
thread like here (or with cyclictest) - and this is a good thing because it does
not change the target system's workload.

The problem is that... rtsl depends on tracing infra-structure that are not
enabled by default on distros, like preempt_ and irq_ disabled events.

So, I see timerlat as a tool for on-the-fly usage, like debugging on customers
(as we do at red hat). It can be enabled by default on distros because it only
depends on existing and already enabled events and causes no overhead when
disabled. rtsl targets more specific cases, like safety-critical systems, where
the overhead is acceptable because of the sound analysis of the scheduling bound
(which is rooted in a formal specification & analysis of the system).

-- Daniel

> -- Steve
> 

