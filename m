Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2620C48BCF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D951761351
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239734AbhFIMQS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44280 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235237AbhFIMQR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 08:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623240862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=77QSgyc+8Sk7HYHiam0rcRrsIJ/0Q1AlHtkTPqxgLeg=;
        b=X3f+vlqesy4PLQ3lYsUdNRyNw+gR+g4X5vxkg98WMCLToW7vrIsSH7iiFjgPd+0sReHINH
        zDlYJLej5Mf9owUbRwaOKQIeZVnpIuf9UBb5a4YZYZw0vEOKsrGz3g3MUMJZQiPhBLZlaQ
        3/pcpz3YeT00BRaeBMlyblH1aRuX174=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Y-Va4aGRP-2df9MfIxiv7Q-1; Wed, 09 Jun 2021 08:14:20 -0400
X-MC-Unique: Y-Va4aGRP-2df9MfIxiv7Q-1
Received: by mail-ed1-f71.google.com with SMTP id z5-20020a05640235c5b0290393974bcf7eso3762119edc.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 05:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=77QSgyc+8Sk7HYHiam0rcRrsIJ/0Q1AlHtkTPqxgLeg=;
        b=YG+JRMbomPlnS2RsnTvqFCMFbnv8T2XHsZJiyT/oXPn7tvbgwR4BfqHYxA+QiIIpMk
         MlIhpu5GbNgNqTJ4zyYGaTHTObVsM6ArmTbisZoBB/m4LIUcguY2nv//CJjKzuQH52XQ
         13/T/hyX6IcofjpwcR2gcX4N2tD9M9M4wi7WGP5/+6hfJo59M7ERorbQQwoljiEugrnk
         OdVeinihYzLn2PEe7gPk+XT5Ozs2fq/TRCKox2S0Ozv7tZ+4WTbnCofnwiQf+DPUgpp/
         wIlJzwXQIDyNy2dAz8vknSdDwHMlEU9+hIG5/w1oRZXyKwcDBzDCLVmnrSfsWf44RqM7
         LeJg==
X-Gm-Message-State: AOAM531l9XDUNlHrU8BAxACh+n71TYE9jowzJ9ELx5+VamdIMhPjTmYN
        cKDm9HoJHQ6TWnaKpeAut+yzt47GSFvCbtOnylOB/JZCU4C2Ras6bRd9zNqScfozyA7bYoIWo2x
        Nj1y1z/bqsQ+O7XimvN4A+S2mBQHfdOdicxE0iQQnUwjqMzVFkUk4CGeN+ceTobSOQI1pyuM=
X-Received: by 2002:a05:6402:3082:: with SMTP id de2mr17956662edb.214.1623240859156;
        Wed, 09 Jun 2021 05:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgQ3/5uZSB81cgZ2oYq3QcOkGNys6k5P1fZOknM8dVYLnNp0EXgn9LjvtdDU4a96tdwdbEbw==
X-Received: by 2002:a05:6402:3082:: with SMTP id de2mr17956632edb.214.1623240858901;
        Wed, 09 Jun 2021 05:14:18 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id gv11sm1054485ejb.13.2021.06.09.05.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:14:18 -0700 (PDT)
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
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <06d72b7d-4beb-1dff-b537-e7449abf3d4e@redhat.com>
Date:   Wed, 9 Jun 2021 14:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604172803.527aa070@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/4/21 11:28 PM, Steven Rostedt wrote:
>> +#ifdef CONFIG_X86_LOCAL_APIC
> I wonder if we should move this into a separate file, making the
> __trace_irq_entry() a more name space safe name and have it call that.
> I have a bit of a distaste for arch specific code in a generic file.
> 

I am placing the intel specific file in:

arch/x86/kernel/trace_osnoise.c

and the kernel/trace/trace_osnoise.h looks like this:

#ifdef CONFIG_X86_LOCAL_APIC
int osnoise_arch_register(void);
int osnoise_arch_unregister(void);
#else /* CONFIG_X86_LOCAL_APIC */
#define osnoise_arch_register() do {} while (0)
#define osnoise_arch_unregister() do {} while (0)
#endif /* CONFIG_X86_LOCAL_APIC */

This can be used by other archs as well...

sound reasonable?

-- Daniel


>> +/**
>> + * trace_intel_irq_entry - record intel specific IRQ entry
>> + */
>> +void trace_intel_irq_entry(void *data, int vector)
>> +{
>> +	__trace_irq_entry(vector);
>> +}
>> +


