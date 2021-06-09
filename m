Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BCEC48BCD
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BB86610A2
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbhFINqe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46013 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229947AbhFINqe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623246279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W7L7JBT7+RaBdq8+y+T8lbBR7/kh6fTxG2yTLzyTFAI=;
        b=KCV1i8xupQ61V2f1x5ylVlfON9+4ayHWYAhNhkXXkW4xyexKgY9KmLgFQ1wWGLK5Bo08Lk
        TEtGQW4rR1mxI5ZLfJnQhWDTUhC4TI0vwiZg86UlwfgCjMC+1vorJ2d5saqmIA35Pa/AJP
        2ouqo6C3Oo+UsGMVM65yTT8bfGCl/TQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-M2AnZoBqOFqTMO7VO3jW4Q-1; Wed, 09 Jun 2021 09:44:37 -0400
X-MC-Unique: M2AnZoBqOFqTMO7VO3jW4Q-1
Received: by mail-ed1-f70.google.com with SMTP id u26-20020a05640207dab02903935beb5c71so6603698edy.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W7L7JBT7+RaBdq8+y+T8lbBR7/kh6fTxG2yTLzyTFAI=;
        b=DMEnmEjrsmNKMrlNY4+2FBiL/KwQ5TOtvkqU84ccQK/i0q7Uf92zMStCMa6o0e/FYD
         UWSUMADgSbMAkn8qEbjCJid7nMMsfjY9XoWk+fxvYsN6xxsmPUGq7UolZPep/M3G7g+T
         plR7lKlmUBdL+nJf0C0RSbj79zs+UO+qkpzG21WiKTpcE+4GmJYD6IoaY7dubkYd/Zha
         JGlMQXpQb09vPhdKnC786Sjz9tkmufY/pXJeEOqiPEByO2EdbOkY6mQpb7j3RdiWlyYM
         n9Qv0fd1psQQIkU8ygpluxhSVuezfkt0mt1l/PmTjNcREFBV9Z0CdsHi4yizHhXWVWHx
         wKlA==
X-Gm-Message-State: AOAM530ygkfNx9/vpKMgz5KdN3dPgfrHO2jk2tobhPfVHtRP5iMWqgEe
        Acl5gnkjZDWEe5RQjvU71VF9RG2+zKdPhOfpE8arfgmf/SI8hHjtLqiPOPpagQTOa4LE2/SohCS
        4UvKGIGvlzA1+X7ly1784BxjCeuRd9RFTA03ZI74Om/SYssPv9Tm63W2feqnZrCm1JEViqMU=
X-Received: by 2002:a05:6402:1216:: with SMTP id c22mr30617143edw.36.1623246276504;
        Wed, 09 Jun 2021 06:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysr83XDBmvNZDwRD2jENaw+ntU+KxOYNtyKcWA5PzQtIM8E0vGx80pX2Fel4ObpcusKtKRkQ==
X-Received: by 2002:a05:6402:1216:: with SMTP id c22mr30617104edw.36.1623246276220;
        Wed, 09 Jun 2021 06:44:36 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id f10sm1160643edx.60.2021.06.09.06.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 06:44:35 -0700 (PDT)
Subject: Re: [PATCH V3 8/9] tracing: Add osnoise tracer
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
 <bd09a2be9cd0cecee86374dbb49235dd2ef9d750.1621024265.git.bristot@redhat.com>
 <20210604172803.527aa070@oasis.local.home>
 <06d72b7d-4beb-1dff-b537-e7449abf3d4e@redhat.com>
 <20210609090329.53679e79@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <30ed6e4f-2320-7389-c560-2c7a25250442@redhat.com>
Date:   Wed, 9 Jun 2021 15:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609090329.53679e79@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/9/21 3:03 PM, Steven Rostedt wrote:
> On Wed, 9 Jun 2021 14:14:17 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> On 6/4/21 11:28 PM, Steven Rostedt wrote:
>>>> +#ifdef CONFIG_X86_LOCAL_APIC  
>>> I wonder if we should move this into a separate file, making the
>>> __trace_irq_entry() a more name space safe name and have it call that.
>>> I have a bit of a distaste for arch specific code in a generic file.
>>>   
>>
>> I am placing the intel specific file in:
>>
>> arch/x86/kernel/trace_osnoise.c
> 
> I would make it just arch/x86/kernel/trace.c

moved!

> so that it can hold all arch specific tracing information, and not need
> to create a file for anything else we might need later.
> 
>>
>> and the kernel/trace/trace_osnoise.h looks like this:
>>
>> #ifdef CONFIG_X86_LOCAL_APIC
>> int osnoise_arch_register(void);
>> int osnoise_arch_unregister(void);
>> #else /* CONFIG_X86_LOCAL_APIC */
>> #define osnoise_arch_register() do {} while (0)
>> #define osnoise_arch_unregister() do {} while (0)
>> #endif /* CONFIG_X86_LOCAL_APIC */
>>
>> This can be used by other archs as well...
>>
>> sound reasonable?
>>
> 
> The proper way to d that is to use weak functions in the C code in the
> generic file.
> 
> int __weak osnoise_arch_register(void)
> {
> 	return 0;
> }
> 
> int __weak osnoise_arch_unregister(void)
> {
> 	return 0;
> }
> 
> Hmm, does the unregister really need a return value?

it was always returning 0, changed it to void.

-- Daniel

