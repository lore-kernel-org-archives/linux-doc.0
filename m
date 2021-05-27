Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A675C4707F
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 12:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE4E5613CC
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 12:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbhE0Maw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 08:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49095 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234795AbhE0Mav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 08:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622118558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=blsvMXsnr00Di8AqsbMtP4oJ8EFY4Alf2SaL+RG/1hs=;
        b=LVjkl0PY9HGPZk7V4eJfAc1DH4nhfZPoh8LhLikYmN08+c+07LK+tD1uBy/lYOupZMeCSo
        xuSd2XAMFIfv9kQwI5G2cr4y+m9AorqRC7IDTStWI9wtcKXq7Nyd0RNCOzzOZGiBTLovU+
        FTU9SEtQkqFqvQll6YFCGeIr0+Ccifk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-QH6wT1biNMKF4cBpWBVxOw-1; Thu, 27 May 2021 08:29:16 -0400
X-MC-Unique: QH6wT1biNMKF4cBpWBVxOw-1
Received: by mail-ej1-f72.google.com with SMTP id dr20-20020a1709077214b02903db77503922so1600371ejc.6
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 05:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=blsvMXsnr00Di8AqsbMtP4oJ8EFY4Alf2SaL+RG/1hs=;
        b=GGTnAJllED4qlouXJYHKm18aup2FT0UpmfW9sxZ/xzbBpDH1rQ5nE43dj9NDJm3wlP
         Tha9yHpOpcDcIsFxFRO7mzS/l8DMm3g2P/e4xEmaXL1lM8rkg/9GTDemMtXGcjK+irKn
         2KU/4eQkwldG8EBpSi3Ju6G5fsPTT+jreev87ns5TiaEuNv3CRc3UOxEPXRm0NDvnW4m
         +P+C6tZnekMqJgwMDGrXUGzotKUnswAaEDv4SunYsoVmsxDyujERjN2QWsJg1X4NkYog
         i7t3rGR3BW5V4KR7OF5vGeWmDdPuxLFnK6nkCXxYBTnGU45yP8sz/oZfifsgRwxv+wWf
         s/+w==
X-Gm-Message-State: AOAM530/NuETxBe273FiQOOFatUOREGVpSHomPuLZoLseT4pRuR1bvPA
        +pN5c4tezMHsFuM2FPmkkm3E2uRF3ikyiIibcM/lF52sz+kl5lSO/MB0EwPpGPYTRPG+5V2vawg
        ZowUfNxlvQDgSG+E+8aLqKlvO2AXzOc3gbvPf0PPAAMptQz0b1PLvDwQVoNglnB94W0wbUOE=
X-Received: by 2002:a17:906:5fd1:: with SMTP id k17mr3466983ejv.78.1622118555116;
        Thu, 27 May 2021 05:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe4mTlKJpJXiiOU031vKBWLZgdwTa9d3E/fVcrPcUscegYQrTzpicqFmVM1iwUX75FSYoA3w==
X-Received: by 2002:a17:906:5fd1:: with SMTP id k17mr3466949ejv.78.1622118554917;
        Thu, 27 May 2021 05:29:14 -0700 (PDT)
Received: from x1.bristot.me (nat-cataldo.sssup.it. [193.205.81.5])
        by smtp.gmail.com with ESMTPSA id r17sm1021115edt.33.2021.05.27.05.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 05:29:14 -0700 (PDT)
Subject: Re: [PATCH V3 4/9] tracing/hwlat: Implement the per-cpu mode
To:     Juri Lelli <juri.lelli@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621024265.git.bristot@redhat.com>
 <187db3f9eed1603c858a1f7669d0140dfb753bfd.1621024265.git.bristot@redhat.com>
 <YK+JfHHNbvV7odqX@localhost.localdomain>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <c5735fe7-5f21-bec7-56bf-45db8e6e616e@redhat.com>
Date:   Thu, 27 May 2021 14:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK+JfHHNbvV7odqX@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/27/21 1:58 PM, Juri Lelli wrote:
> Hi,
> 
> On 14/05/21 22:51, Daniel Bristot de Oliveira wrote:
> 
> [...]
> 
>> +/**
>> + * start_per_cpu_kthread - Kick off the hardware latency sampling/detector kthreads
>> + *
>> + * This starts the kernel threads that will sit on potentially all cpus and
>> + * sample the CPU timestamp counter (TSC or similar) and look for potential
>> + * hardware latencies.
>> + */
>> +static int start_per_cpu_kthreads(struct trace_array *tr)
>> +{
>> +	struct cpumask *current_mask = &save_cpumask;
>> +	struct cpumask *this_cpumask;
>> +	struct task_struct *kthread;
>> +	char comm[24];
>> +	int cpu;
>> +
>> +	if (!alloc_cpumask_var(&this_cpumask, GFP_KERNEL))
>> +		return -ENOMEM;
> 
> Is this_cpumask actually used anywhere?

OOpppsss, this is a left-over :-(....

Before starting using kthread_create_on_cpu(), I was using this_cpumask to set
the affinity of threads created via kthread_create().... but it is not needed
anymore.

I will remove it, good catch.

Thanks!
-- Daniel

> 
> Thanks,
> Juri
> 

