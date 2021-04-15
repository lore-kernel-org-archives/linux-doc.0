Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A002C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 13:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35780611AC
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 13:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbhDONKT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37544 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232844AbhDONKT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 09:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618492195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rcfOGYDOZJobJmnJT5yvHFiJkEAkVq4u74+KOwotCm4=;
        b=Vb51OukV36KBLicFhG7RORru1ljc4kHzbwhqxlUxvRBOPduk8z54dDhz2qdfwLr4W1gb4Q
        Czn9t3WI7ukcyKdg9i3rzRY9If8b09w+N5Lhsijvg/bcg5KwqGbeHeZl0sndRlJUTn2ZOF
        +FQO6ny3YTvDYm69Sjg52mxApSDFEMc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-lEU-yKtHMk-mUM8o6N0_Kg-1; Thu, 15 Apr 2021 09:09:54 -0400
X-MC-Unique: lEU-yKtHMk-mUM8o6N0_Kg-1
Received: by mail-ed1-f72.google.com with SMTP id w14-20020aa7da4e0000b02903834aeed684so3392750eds.13
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 06:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rcfOGYDOZJobJmnJT5yvHFiJkEAkVq4u74+KOwotCm4=;
        b=LIMAOZnmgYxLYdFTJp4XKeUGq75nFb8X3FK6WLcTmioKIcirspTTYV05rlBjsARf7g
         sfWsxI7kNm7db/n/Q1BLIrTI/LHajIDxZos+bKwgkzp+hzduoggQmlqFoJY+7Px3AOLe
         J6G/QkNgdBmO6FOvj3sICIsTOaDD7ADasTvjaH5ka+JQ3+VHaLc7O6/ckMjv95cAZYUw
         mp6ViAhB4s0uf7hiIzshKFCHj4yfvN34A0tihExLnDyHQFo0LVV9vghf+xTxATNHeC+o
         EF3RNYDwxmYoBbV9CuZNB0ZR0NpJ2/wjV+ArCY+LGQCy1G7bpOkNEPYgqBCuzs3WNfMc
         xyYg==
X-Gm-Message-State: AOAM533NBJ5tIineQMWcZWdudlsslaq9RY3YQ6M0XFmC0RwwOcLgdk0g
        ZM2zeFvWo4ZS15yMsMl7C0xE7ozOroPnZXzQXcHlIjpBmZ4WCcxBNL6c0fIu2OyPkkXZ6Qp/T87
        fzrHAxg1omG86RRlwok5y+lYZ38t2EYGO0UN8+MxS4Bdcb8Dl2iWBwqVDxfVpybCMrsv7Py4=
X-Received: by 2002:aa7:d541:: with SMTP id u1mr4069690edr.95.1618492192682;
        Thu, 15 Apr 2021 06:09:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztbqEc58IXo51n3CQKANi82UpWbzB4CFNXcSG44HrRluUMVGDf2DYidY8yD4aatSBB2zP0Aw==
X-Received: by 2002:aa7:d541:: with SMTP id u1mr4069652edr.95.1618492192420;
        Thu, 15 Apr 2021 06:09:52 -0700 (PDT)
Received: from x1.bristot.me (host-79-56-201-31.retail.telecomitalia.it. [79.56.201.31])
        by smtp.gmail.com with ESMTPSA id cz2sm2458886edb.13.2021.04.15.06.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 06:09:52 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] tracing/hwlat: Add a cpus file specific for
 hwlat_detector
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, kcarcia@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1617889883.git.bristot@redhat.com>
 <94bbcd0e0f06b79aeb775e8dbf3a301f6679bb4c.1617889883.git.bristot@redhat.com>
 <20210414101019.7c5a66f6@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <e5547e9a-d3d8-2cd1-7cb9-e567c798e78d@redhat.com>
Date:   Thu, 15 Apr 2021 15:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414101019.7c5a66f6@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/14/21 4:10 PM, Steven Rostedt wrote:
> On Thu,  8 Apr 2021 16:13:19 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> Provides a "cpus" interface to the hardware latency detector. By
>> default, it lists all CPUs, allowing hwlatd threads to run on any online
>> CPU of the system.
>>
>> It serves to restrict the execution of hwlatd to the set of CPUs writing
>> via this interface. Note that hwlatd also respects the "tracing_cpumask."
>> Hence, hwlatd threads will run only on the set of CPUs allowed here AND
>> on "tracing_cpumask."
>>
>> Why not keep just "tracing_cpumask"? Because the user might be interested
>> in tracing what is running on other CPUs. For instance, one might run
>> hwlatd in one HT CPU while observing what is running on the sibling HT
>> CPU. The cpu list format is also more intuitive.
>>
>> Also in preparation to the per-cpu mode.
> 
> OK, I'm still not convinced that you couldn't use tracing_cpumask here.
> Because we have instances, and tracing_cpumask is defined per instance, you
> could simply do:
> 
>  # cd /sys/kernel/tracing
>  # mkdir instances/hwlat
>  # echo a > instances/hwlat/tracing_cpumask
>  # echo hwlat > instances/hwlat/current_tracer
> 
> Now the tracing_cpumask above only affects the hwlat tracer.
> 
> I'm just reluctant to add more tracing files if the current ones can be
> used without too much trouble. For being intuitive, let's make user space
> tools hide the nastiness of the kernel interface ;-)

[discussing about the cpus file in both hwlat and osnoise here...]

I see your point, but by having two different instances give you two
different output "trace" files... and it is not that always practical to
merge them when using only the tracefs interface (I like to use it, and
it is very handy when dealing with immutable systems, on customers...).

Thinking aloud, one might say: sort the two trace files by timestamp...

and other might reply: but some lines do not have a timestamp associated,
e.g., the stacktrace.

Anyway, the cpus file on hwlat is not a super essential thing, I agree...
interrupts are disabled, so not much could go wrong (although I really
needed the trace from a sibling cpu in a real case).

But for the osnoise tracer the cpus file is really useful. For instance, on a 
system with the CPU 7 isolated:

----- %< -----
 # echo 7 > osnoise/cpus
 # echo target_cpu == 7 > events/sched/sched_wakeup/filter 
 # echo stacktrace if target_cpu == 7 > events/sched/sched_wakeup/trigger
 # echo 1 > events/sched/sched_wakeup/enable
 # echo osnoise:thread_noise > set_event 
 # echo osnoise > current_tracer
 # cat trace 
    [find...]
     kworker/0:1-7       [000] d..5  1820.717780: <stack trace>
 => trace_event_raw_event_sched_wakeup_template
 => __traceiter_sched_wakeup
 => ttwu_do_wakeup
 => try_to_wake_up
 => __queue_work
 => queue_delayed_work_on
 => vmstat_shepherd
 => process_one_work
 => worker_thread
 => kthread
 => ret_from_fork
     kworker/7:1-410     [007] d..3  1820.717790: thread_noise: kworker/7:1:410 start 1820.717786519 duration 3626 ns
       osnoise/7-1000    [007] ....  1821.582340: 1000000         90  99.99100      15      1      0     12      6      1
----- >% -----

It was possible to easily find that the '1' thread noise was a kworker,
dispatched from CPU 0, and that it was dispatched by "vmstat_shepherd".

Also, the osnoise dir is not added to a new instance... so, it only
costs "one" file...

> -- Steve
> 

