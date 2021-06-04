Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F215AC07E94
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB02861402
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFDQJL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 12:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43330 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230033AbhFDQJK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 12:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622822843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6IOMKca253QnX7O6EvR9vtha+4GgFumE9P0ieiFmffc=;
        b=IxkuOXAr+YoHRHLgx7juaBCcKtiimgTFirwoC2upzYRJVT5XZQuN+i4jGj3aTnzS/J7BKn
        lDqIlEHVrD2bN5ODqWWCJ6jXOeKgzboUpUBwoVwo5/hfi5tjsHkfRPJcK54e9ZQ/Lxq9Mq
        U2TuUgSaRAEr4kCrFjnKYBehoBoZgic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-jmUfzPN_MyKL-TjX8GffQw-1; Fri, 04 Jun 2021 12:07:21 -0400
X-MC-Unique: jmUfzPN_MyKL-TjX8GffQw-1
Received: by mail-ed1-f71.google.com with SMTP id q18-20020a0564025192b02903888712212fso5192791edd.19
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 09:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6IOMKca253QnX7O6EvR9vtha+4GgFumE9P0ieiFmffc=;
        b=BP8NU5R/WYdWLOUbCqcyFwgNAVrS2s21g/iIwDrt1T73jte0C4nh1C+evVRRMGowC1
         hLsQEXkoPP43B8/CN9iczTa92StgV30GFZujxXPkZKN2VpD25jbzOY9p1Qmez6BTU3vn
         d32RIoXrv8TnGOwZKB7oANJ8fVmMXssPq+OyeH4im+CPYF2fIYs4mnWIhUkt4xuLsi/A
         plw1uR3AaMynxudJ935ayXGLEgQMXSpGhN3fv2Gz47GotIKpmmYcCPwWKTSLgMeS6AV1
         JIKOxVK2KsuHXSou1y/PT4fTrlhTMpxbG8n4p0pd+cznLhsDlgKoIyl2qZlbMLmIkJLT
         OG/A==
X-Gm-Message-State: AOAM532VOcT4BkH2lbu9JpvZB7XkGu0Mmy1O3o+48vTdBaZJa173MSre
        o7laaKmOqi9EKSnUYe3CyrjKy/4h+Goc1pRQ1L0tJPD478RfKHeAL5u8Zq+b5cHvOsDQOCRtj8C
        fRbLFhkJpBbtYSquM18Fazg8Xrjy2KwwVxMaGWZw+czkQDVD4U2WSqtaUUEKEAxr2Ig9IVKo=
X-Received: by 2002:a05:6402:3585:: with SMTP id y5mr5431420edc.121.1622822839818;
        Fri, 04 Jun 2021 09:07:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysFc+IXecovq7wOTL/l2Kj+asrOqzbqGEbDrbVAkIX2jYwPMBoe5N76/IwOLWcMPp+4r/L/Q==
X-Received: by 2002:a05:6402:3585:: with SMTP id y5mr5431385edc.121.1622822839587;
        Fri, 04 Jun 2021 09:07:19 -0700 (PDT)
Received: from x1.bristot.me (host-79-24-6-4.retail.telecomitalia.it. [79.24.6.4])
        by smtp.gmail.com with ESMTPSA id a22sm2937021ejv.67.2021.06.04.09.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 09:07:19 -0700 (PDT)
Subject: Re: [PATCH V3 7/9] tracing: Add __print_ns_to_secs() and
 __print_ns_without_secs() helpers
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
 <2c59beee3b36b15592bfbb9f26dee7f8b55fd814.1621024265.git.bristot@redhat.com>
 <20210603172902.41648183@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <a343ad15-4deb-ae14-eead-60f7d95fa7d3@redhat.com>
Date:   Fri, 4 Jun 2021 18:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603172902.41648183@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/3/21 11:29 PM, Steven Rostedt wrote:
> On Fri, 14 May 2021 22:51:16 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> +++ b/include/trace/trace_events.h
>> @@ -358,6 +358,21 @@ TRACE_MAKE_SYSTEM_STR();
>>  	trace_print_hex_dump_seq(p, prefix_str, prefix_type,		\
>>  				 rowsize, groupsize, buf, len, ascii)
>>  
>> +#undef __print_ns_to_secs
>> +#define __print_ns_to_secs(value)			\
>> +	({						\
>> +		u64 ____val = (u64)value;		\
>> +		do_div(____val, NSEC_PER_SEC);		\
>> +		____val;				\
>> +	})
> 
> I know my name is on this, but we need parenthesis around "value".
> 
>> +
>> +#undef __print_ns_without_secs
>> +#define __print_ns_without_secs(value)			\
>> +	({						\
>> +		u64 ____val = (u64)value;		\
> 
> Here too.
> 
>> +		(u32) do_div(____val, NSEC_PER_SEC);	\
>> +	})
>> +
>>  #undef DECLARE_EVENT_CLASS
>>  #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)	\
>>  static notrace enum print_line_t					\
>> @@ -736,6 +751,16 @@ static inline void ftrace_test_probe_##call(void)			\
>>  #undef __print_array
>>  #undef __print_hex_dump
>>  
>> +/*
>> + * The below is not executed in the kernel. It is only what is
>> + * displayed in the print format for userspace to parse.
>> + */
>> +#undef __print_ns_to_secs
>> +#define __print_ns_to_secs(val) val / 1000000000UL
>> +
>> +#undef __print_ns_without_secs
>> +#define __print_ns_without_secs(val) val % 1000000000UL
> 
> And around "val" in the above two macros.

Fixing in the v4.

Thanks Steven!
-- Daniel

> -- Steve
> 
>> +
>>  #undef TP_printk
>>  #define TP_printk(fmt, args...) "\"" fmt "\", "  __stringify(args)
>>  
> 

