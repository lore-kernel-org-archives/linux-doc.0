Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2378DC48BC2
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 12:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CEEB6112D
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 12:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFUMLp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 08:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33008 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229888AbhFUMLn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 08:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624277369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YWLGzFFw3zyjOh0fj+lFDA+n9XXDAV90g9yN8bnLdyI=;
        b=ikto6qzl9Hep0fCP66ysqJS/HDQZ8uzDfqDB4pfgL8N3DQHnGsPBh6LNwfQFNfQnqmqUoS
        VTRmSDI8qWxqQE4pMcZDpXczRrE0pLH/1Hx/SmGrO8yc5rMsSBnEdvpum9nmnax1ff0mhJ
        ZxugXKP/nPow/aB2hiscSI7LIez5kXU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-LxT607tsM7eG03CpfZIxMw-1; Mon, 21 Jun 2021 08:09:24 -0400
X-MC-Unique: LxT607tsM7eG03CpfZIxMw-1
Received: by mail-ed1-f72.google.com with SMTP id v8-20020a0564023488b0290393873961f6so7651771edc.17
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 05:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YWLGzFFw3zyjOh0fj+lFDA+n9XXDAV90g9yN8bnLdyI=;
        b=JCayQEE5rnS98uHnpaw9czEzaWs5PHkgJcQSogwIIgq8KzYq5/CMjE6yL7S33PuYH4
         qyq/5tWtos1amY8gDeT++GwVmOKKlNWnaIi9u4y+S8I4hnehxNeOMo3/H90hQ6WAqkQr
         QUx6AoZNnXwgBFy6tFYeKcswAVfefmE6ZBGQcmM7U5FmHFlPXiirg/Z8mBtIUZTB7sj9
         8vQUEvdLp641ZLpt/uWT17ygZzyq5cxNxDImw0vfGziKYk9OOqOuVGM0h+XgSYJ4/wlj
         +AeFnyIbpCctG6q7UbnyKgja9diw1ZBiuD0FseMwX396h0pRkjPyZcBBUV3MmMZpjHwj
         EnMw==
X-Gm-Message-State: AOAM533a52EYojTaOQfi2BUtfeswPA1ch3GLS7iYSLUqxAWbYLJTnjpq
        5TtYZFmzrpKufuKNpdx/SZDbbEBeUKt3NGXb9vhd9gO4gC+JjjPNclGfs4JJCUkCKkol4VM0YEG
        LBYieC6IZHel41HV4V5ts
X-Received: by 2002:a05:6402:31a5:: with SMTP id dj5mr21198987edb.229.1624277363350;
        Mon, 21 Jun 2021 05:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0gJw5fntEnkU/VjY+oEu9BhzRKxRNOQ+MKjfluFQ5VrQWJjZ0zmJjRVcZThY6xoT66d4pQg==
X-Received: by 2002:a05:6402:31a5:: with SMTP id dj5mr21198966edb.229.1624277363254;
        Mon, 21 Jun 2021 05:09:23 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id e22sm10689259edu.35.2021.06.21.05.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 05:09:22 -0700 (PDT)
Subject: Re: [PATCH V4 10/12] trace: Add osnoise tracer
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1623746916.git.bristot@redhat.com>
 <c555b92d6cfef5b3d05c426696d98553c1a46c8d.1623746916.git.bristot@redhat.com>
 <20210618135511.7c06a635@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <1b7876e9-909e-8f69-986e-11110890afbc@redhat.com>
Date:   Mon, 21 Jun 2021 14:09:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618135511.7c06a635@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/21 7:55 PM, Steven Rostedt wrote:
> On Tue, 15 Jun 2021 11:28:49 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> diff --git a/arch/x86/kernel/trace.c b/arch/x86/kernel/trace.c
>> new file mode 100644
>> index 000000000000..e67d63657628
>> --- /dev/null
>> +++ b/arch/x86/kernel/trace.c
>> @@ -0,0 +1,238 @@
>> +#include <asm/trace/irq_vectors.h>
>> +
>> +#ifdef CONFIG_OSNOISE_TRACER
>> +extern void osnoise_trace_irq_entry(int id);
>> +extern void osnoise_trace_irq_exit(int id, const char *desc);
> Any reason to have the above outside the LOCAL_APIC def?

no...

It's not used.
> In fact, this could just be turned into:
> 
> #if defined(CONFIG_OSNOISE_TRAECR) && defined(CONFIG_X86_LOCAL_APIC)

I will do that!

-- Daniel

> -- Steve
> 
> 
>> +
>> +#ifdef CONFIG_X86_LOCAL_APIC
> [..]
> 

