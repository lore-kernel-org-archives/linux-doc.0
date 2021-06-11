Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066B8C48BD1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 20:11:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4D23610C7
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 20:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhFKUNc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 16:13:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229572AbhFKUNb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jun 2021 16:13:31 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68BF3613A9;
        Fri, 11 Jun 2021 20:03:43 +0000 (UTC)
Date:   Fri, 11 Jun 2021 16:03:40 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
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
Subject: Re: [PATCH V3 9/9] tracing: Add timerlat tracer
Message-ID: <20210611160340.6970e10c@gandalf.local.home>
In-Reply-To: <fd2bdb45-e68a-995e-271e-ec181f04ecbc@redhat.com>
References: <cover.1621024265.git.bristot@redhat.com>
        <b650672b9973887ef1420bc1e76b97940b6522d6.1621024265.git.bristot@redhat.com>
        <20210607213639.68aad064@gandalf.local.home>
        <fd2bdb45-e68a-995e-271e-ec181f04ecbc@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Jun 2021 14:59:13 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> ------------------ %< -----------------------------
> It is worth mentioning that the *duration* values reported
> by the osnoise: events are *net* values. For example, the
> thread_noise does not include the duration of the overhead caused
> by the IRQ execution (which indeed accounted for 12736 ns). But
> the values reported by the timerlat tracer (timerlat_latency)
> are *gross* values.
> 
> The art below illustrates a CPU timeline and how the timerlat tracer
> observes it at the top and the osnoise: events at the bottom. Each "-"
> in the timelines means 1 us, and the time moves ==>:
> 
>      External          context irq                  context thread
>       clock           timer_latency                 timer_latency
>       event              18 us                          48 us 
>         |                  ^                             ^
>         v                  |                             |
>         |------------------|                             |       <-- timerlat irq timeline
>         |------------------+-----------------------------|       <-- timerlat thread timeline
>                            ^                             ^
>  ===================== CPU timeline ======================================
>                    [timerlat/ irq]  [ dev irq ]                          
>  [another thread...^             v..^         v........][timerlat/ thread]  
>  ===================== CPU timeline ======================================
>                    |-------------|  |---------|                  <-- irq_noise timeline
>                                  |--^         v--------|         <-- thread_noise timeline
>                                  |            |        |
>                                  |            |        + thread_noise: 10 us
>                                  |            +-> irq_noise: 9 us
>                                  +-> irq_noise: 13 us
> 
>  --------------- >% --------------------------------  

That's really busy, and honestly, I can't tell what is what.

The "context irq timer_latency" is a confusing name. Could we just have
that be "timer irq latency"? And "context thread timer_latency" just be
"thread latency". Adding too much text to the name actually makes it harder
to understand. We want to simplify it, not make people have to think harder
to see it.

I think we can get rid of the "<-- .* timeline" to the right.  I don't
think they are necessary. Again, the more you add to the diagram, the
busier it looks, and the harder it is to read.

Could we switch "[timerlat/ irq]" to just "[timer irq]" and explain how
that "context irq timer_latency"/"timer irq latency" is related?

Should probably state that the "dev irq" is an unrelated device interrupt
that happened.

What's with the two CPU timeline lines? Now there I think it would be
better to have the arrow text by itself.

And finally, not sure if you plan on doing this, but have a output of the
trace that would show the above.

Thus, here's what I would expect to see:

      External         
       clock         timer irq latency                 thread latency
       event              18 us                          48 us 
         |                  ^                             ^
         v                  |                             |
         |------------------|                             |
         |------------------+-----------------------------|       
                            ^                             ^
  =========================================================================
                    [timerlat/ irq]  [ dev irq ]                             
  [another thread...^             v..^         v........][timerlat/ thread]  <-- CPU task timeline
  =========================================================================
                    |-------------|  |---------|
                                  |--^         v--------|
                                  |            |        |
                                  |            |        + thread_noise: 10 us
                                  |            +-> irq_noise: 9 us
                                  +-> irq_noise: 13 us
 
 The "[ dev irq ]" above is an interrupt from some device on the system that
 causes extra noise to the timerlat task.

I think the above may be easier to understand, especially if the trace
output that represents it is below.

Also, I have to ask, shouldn't the "thread noise" really start at the
"External clock event"?

-- Steve
