Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8EB0A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 13:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfGZN6g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 09:58:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46563 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbfGZN6f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 09:58:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so54534616wru.13
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2019 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OHBqTEA6lm/JyJiQHKcANS/JCJ/e3JQqEWDJmrbUQX8=;
        b=Uiw5+9bNmAM4UoMLYPW0DyT5q8WxsTQ98haz0DI/oYrW9Ni1Fo2qC+aF1bskzVD0tV
         oaTtx+iW1QRcTATPc52pQFg9Ebz3UQUO0E5vITEsehKfUg22lyS1baDcR9GTuqfv97jk
         1/BQUvCMYYavyPQrvWnxOiSugy1u2it0VyhMotl/O3VpNs/aq0qmpiPXHY2dyl69xISe
         p3AIfObIW3cI/iQTObKMbYawNp4PVZVuR62Qv1YfzQUAw2QON4DIw2dv8e6tlXioR75n
         1w9KRIhlxRiHAIUfna0HWkdlEJxSC9f6/0v9IfZAFWDvK/KB9TgB+6xGeyq2fXnNjBon
         AeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OHBqTEA6lm/JyJiQHKcANS/JCJ/e3JQqEWDJmrbUQX8=;
        b=eYysBUgYtOKhDWqupEAM8LWDo74e+Rdn2RV4PgxfVOSj6GK5soqmFEurqOnTEYMah5
         77DM5kpSpb8YP1cVJCuojPtnFDMDQHOGC3wdaKGw9zHUYX4w/6hkxJjxk4zwlzogxiem
         N/jTfYxTMK7rkjGH7N6WWpOVMSMAWs+DFcG9UGyAQ1/juQXhKzJUb9pT7PacuI75bOd2
         ywKIwLKgF0rb/x7UDt8/i3W9L0JoxmKVnGv3d31D4SBy6bNtI35g/GAUGB7NVp+/qD9T
         jYweZd9UqK/7JOkhRxneK9Uy5wXjHIobsHAfkEEB3fIAdZ9Lnn5FGv+s2M6+lhP6Pe7R
         wGXA==
X-Gm-Message-State: APjAAAVljrDRK0ZFnKfXJPQtvYmcKKhFHYd+z2WIVqKkq3vl4/4qsU7M
        TXjwLXmywJ+hLahJCo04DDqV9WfwO20K713/hNAhDb22sanIII2E0z34WMfekKC2FQP4LQWVuXh
        hDvTAB0gLIJr6LkRG6PCdlBWsTsceHOjiuima3hC9T8C2nxGVWzvynNKD0E+DAPq0y9aNgK6oCP
        ADCrfSDUpUtIf4B+8d8rdti+dHGQ==
X-Google-Smtp-Source: APXvYqwvJxhcLQvBBrKt39JjVYUcq6uNPBpS9CONWcVP/QiYDpLv187OimwvKYfe9H7d+gWH3MwvIA==
X-Received: by 2002:adf:f186:: with SMTP id h6mr777980wro.274.1564149513322;
        Fri, 26 Jul 2019 06:58:33 -0700 (PDT)
Received: from [10.83.36.153] ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id r123sm48645151wme.7.2019.07.26.06.58.32
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:58:32 -0700 (PDT)
Subject: Re: [PATCH] hung_task: Allow printing warnings every check interval
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Vasiliy Khoruzhick <vasilykh@arista.com>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20190724170249.9644-1-dima@arista.com>
 <2964b430-63d6-e172-84e2-cb269cf43443@i-love.sakura.ne.jp>
 <aa151251-d271-1e65-1cae-0d9da9764d56@arista.com>
 <9a919c32-4e0e-ca1b-887f-c329543913d3@i-love.sakura.ne.jp>
 <41fd7652-df1f-26f6-aba0-b87ebae07db6@i-love.sakura.ne.jp>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <eb3d9058-a623-3c10-68e2-f11498a7c174@arista.com>
Date:   Fri, 26 Jul 2019 14:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <41fd7652-df1f-26f6-aba0-b87ebae07db6@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CLOUD-SEC-AV-Info: arista,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/26/19 2:28 PM, Tetsuo Handa wrote:
> On 2019/07/26 20:29, Tetsuo Handa wrote:
>> On 2019/07/25 23:25, Dmitry Safonov wrote:
>>> Yes, also current distributions already using the counter to print
>>> warnings number of times and then silently ignore. I.e., on my Arch
>>> Linux setup:
>>> hung_task_warnings:10
>>
>> You can propose changing the default value of hung_task_warnings to -1.
>>
>> Current patch might be inconvenient because printk() from hung_task_warning(t, false)
>> fails to go to consoles when that "t" was blocked for more than "timeout" seconds, for
>>
>> 	if (sysctl_hung_task_panic) {
>> 		console_verbose();
>> 		hung_task_show_lock = true;
>> 		hung_task_call_panic = true;
>> 	}
>>
>> path which is intended to force printk() to go to consoles is ignored by
>>
>> 	/* Don't print warings twice */
>> 	if (!sysctl_hung_task_interval_warnings)
>> 		hung_task_warning(t, true);
>>
>> when panic() should be called. (The vmcore would contain the printk() output which
>> was not sent to consoles if kdump is configured. But vmcore is not always available.)

Fair enough.

>>> Yes, that's why it's disabled by default (=0).
>>> I tend to agree that printing with KERN_DEBUG may be better, but in my
>>> point of view the patch isn't enough justification for patching
>>> sched_show_task() and show_stack().
>>
>> You can propose sched_show_task_log_lvl() and show_stack_log_lvl() like show_trace_log_lvl().

I'll try, not sure how well it will go..

>>
>> I think that sysctl_hung_task_interval_warnings should not be decremented automatically.
>> I guess that that variable should become a boolean which controls whether to report threads
>> (with KERN_DEBUG level) which was blocked for more than sysctl_hung_task_check_interval_secs
>> seconds (or a tristate which also controls whether the report should be sent to consoles
>> (because KERN_DEBUG level likely prevents sending to consoles)), and
>> hung_task_warning(t, false) should be called like
>>
>> 	if (time_is_after_jiffies(t->last_switch_time + timeout * HZ)) {
>> 		if (sysctl_hung_task_interval_warnings)
>> 			hung_task_warning(t, false);
>> 		return;
>> 	}
>>
>> rather than
>>
>> 	if (sysctl_hung_task_interval_warnings)
>> 		hung_task_warning(t, false);
>> 	if (time_is_after_jiffies(t->last_switch_time + timeout * HZ))
>> 		return;

Good point, will do.

> Well, another direction is to disassociate sysctl_hung_task_panic from
> sysctl_hung_task_timeout_secs. Since nobody would want to call panic() when
> a thread was blocked for only one second, allow sysctl_hung_task_panic to
> specify larger than 1, and interpret it as sysctl_hung_task_timeout_secs for
> calling panic(). Roughly speaking:
> 
> -	if (sysctl_hung_task_panic) {
> +	unsigned long panic_timeout = READ_ONCE(sysctl_hung_task_panic)
> +	if (panic_timeout == 1 || (panic_timeout > 1 &&
> +	     (jiffies - t->last_switch_time) / HZ >= panic_timeout)) {
>  		console_verbose();
>  		hung_task_show_lock = true;
>  		hung_task_call_panic = true;
>  	}
> 
> If use of different loglevel is not a requirement for you, this would be the simplest.

No, we consider such messages as notifications/warnings, rather than
complete failures. So, it would be better to hide them from console.
They're also not rate-limited which is a bummer with slow serial
consoles that we've on some devices (9600).

Thanks for the review,
          Dmitry
