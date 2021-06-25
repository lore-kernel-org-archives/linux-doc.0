Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC384C2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 04:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F03B61410
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 04:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhFYEhG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 00:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26925 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhFYEhF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jun 2021 00:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624595685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iOXNcn3ihA08/BMWoG801AKuWrravimbcKyetF5H5nA=;
        b=N6QJS5WoWgjzLKKnACFN7PpxOOTKGmB3dRdyUK+TcQSllB9FTI85EYYBF8/Bv04YQ7Q0K4
        QF0daa8NLkvf3qpNLFlVpiRP7gghVjawtkZLKFRkHhNjqX/g5Z191OM6tYBxeXfDmzERZc
        kamA+gjmW5n58bm+wzraGxCxw/Y9JQ4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-59ROkrzIN8yVZigf0B92pw-1; Fri, 25 Jun 2021 00:34:42 -0400
X-MC-Unique: 59ROkrzIN8yVZigf0B92pw-1
Received: by mail-ej1-f71.google.com with SMTP id w13-20020a170906384db02903d9ad6b26d8so2662942ejc.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 21:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iOXNcn3ihA08/BMWoG801AKuWrravimbcKyetF5H5nA=;
        b=nOikTF2oVCVxTYfLcLZXZP72bwYYYCIRPXtQ5hXc1O9LRAk48wwLhFFuMxuYDuvSXs
         k/6W39u8Aw3M4SU+1VrcdcKr0Sa3OcPI3USlOcGB8fnvafz5WTT5ykMX7x+J3aIElGiK
         EEMVyCQbujcUt/RNdm/T9W4KEmyQN7ZLIx/lOFzv/luSssAkDFMC4GJThifJ4kKm/0sw
         szRhC4xtXkSgI/vbgpsr77IOpj18m+pOYJKrNkDiMCGU1xevbQZZ4m6VM+xmeNUpHIm5
         TRC8sSm0DlTrLM/9XZFT66QPwAGaZ46BZAdAcuiSm3fuXQNW/p3RAfexguWkJI/CUCaD
         Ol2g==
X-Gm-Message-State: AOAM5311Gj8f71jrc3FL5/eRo7skSqroaoJwZ6eLRHXxLqSczEMxc+em
        AV+9IgEinHBScClqQ6Vtzbk3T/g5MsgbUKj6Bfa1IGDPlLRPL8W+wcIudLdUi2+ho6ykoQ1NKjK
        Inx53AnJk/kcT2xd4eXrX
X-Received: by 2002:a17:907:d06:: with SMTP id gn6mr8668878ejc.447.1624595681467;
        Thu, 24 Jun 2021 21:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy94UZESp6JhkKfkZN/zLYR04uj5C5EiXTnt9xX8ABk3z1fHh1RbBaG5kYakIHzmbIxq1K0Ww==
X-Received: by 2002:a17:907:d06:: with SMTP id gn6mr8668871ejc.447.1624595681278;
        Thu, 24 Jun 2021 21:34:41 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id h19sm1274024edt.87.2021.06.24.21.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 21:34:41 -0700 (PDT)
Subject: Re: [PATCH V5 12/14] trace: Protect tr->tracing_cpumask with
 get/put_online_cpus
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
References: <cover.1624372313.git.bristot@redhat.com>
 <38d2ef13b33c42fcf424a6213a27c8b5246548e0.1624372313.git.bristot@redhat.com>
 <20210624173902.57f4f34f@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <84a00fe6-5f6e-ab17-ada6-018d6394c65f@redhat.com>
Date:   Fri, 25 Jun 2021 06:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624173902.57f4f34f@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/24/21 11:39 PM, Steven Rostedt wrote:
> On Tue, 22 Jun 2021 16:42:30 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
>> index 52fc9438b7b4..c14f33db147e 100644
>> --- a/kernel/trace/trace.c
>> +++ b/kernel/trace/trace.c
>> @@ -5053,7 +5053,13 @@ int tracing_set_cpumask(struct trace_array *tr,
>>  	arch_spin_unlock(&tr->max_lock);
>>  	local_irq_enable();
>>  
>> +	/*
>> +	 * tracing_cpumask is read by tracers that support CPU
>> +	 * hotplug.
>> +	 */
>> +	get_online_cpus();
>>  	cpumask_copy(tr->tracing_cpumask, tracing_cpumask_new);
>> +	put_online_cpus();
>>  
>>  	return 0;
> 
> Hmm, the tracing_cpumask is only touched in he work function, with the
> necessary locks. How is get_online_cpus() protecting it here?
> 
> That is, tracing_cpumask isn't touched in the path of bringing up or
> taking down a CPU, and shouldn't be an issue here.

You are right, it is not needed with the new hotplug method.

> Should I just drop this patch?

Yes! drop it.

Thanks Steven!
-- Daniel

> 
> -- Steve
> 

