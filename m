Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7279C4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 16:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E3706115B
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 16:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhFUQQ5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 12:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34013 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230028AbhFUQQ4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 12:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624292081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G817IJLoTEYUuE/9RZvRi1mEhIu8nStp2ksiuR5OOGA=;
        b=QxSjiIr78LT6ufrSnDRnLN/+ZxdzpiHtEAwEsKMAUHagsoFCGlj/akj127FroaHcK4tymw
        9QiORn47PpNrEXgVhkBGpsG4IKSkFnMjEguOlWH00SKSIEp9JiETqz1D/nDIws11tG2iU/
        AYDWg3r8VshY5GkNgz4FvnPWJ/FFPFc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-m2i59JxHNcmFsezrn9aQiA-1; Mon, 21 Jun 2021 12:14:39 -0400
X-MC-Unique: m2i59JxHNcmFsezrn9aQiA-1
Received: by mail-ej1-f70.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccso6529617ejn.10
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 09:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G817IJLoTEYUuE/9RZvRi1mEhIu8nStp2ksiuR5OOGA=;
        b=oYBHP+UGD/9HsxNNm7xwJr7U0UaemNFTU7Wxs6Sx+2R4dG+BrtdytrRLQw4oUUGh3U
         MUnmFZm4VKSo/lU991BvogEXr034M+HgGW2Ws6zQc+XMaYEs3W1ppUR8ZK8qEAf3i2yT
         n/V+WoCRHX7IsASYUylZvfdJF51LyE3VzF8C1zZAtUT5puI+X6RntWnSZrc5VrZ/plnK
         bOtXOD9ZTexp/CxfhoCOzziEZRTKSFvLOMu9VMr/ozPrTpwxf2O7/HvVDI9X2eQ1phvj
         Mb56liRDXBX7gVduvLGJ62YFHuFnH5Q8ZdCfLD3OvJ9EaaLsU44gIMbvJKqo2xsg/5JW
         31Aw==
X-Gm-Message-State: AOAM5300GQpI8pASy6y354hFyfbyv/B3qp5kgnLJDqtGEkvQjgE3lQcC
        zLfkx/BzSF86m9jXrWffsvbKq+6iM/sApsdjSGKeiT4BcCk+mOs6YMw3ek5sxaYGdEK0ZoejBZH
        cUE3CzJ+5N5sV448Ct8mQ
X-Received: by 2002:a17:906:1806:: with SMTP id v6mr25386681eje.454.1624292077949;
        Mon, 21 Jun 2021 09:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz27MBznOXPqaISYzA2hEKAT6acpypZ5IVecmksOYSopF0Gsp3VTsfqkrPS8N7V8T56x7UykQ==
X-Received: by 2002:a17:906:1806:: with SMTP id v6mr25386670eje.454.1624292077790;
        Mon, 21 Jun 2021 09:14:37 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id x9sm5155238ejc.37.2021.06.21.09.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 09:14:37 -0700 (PDT)
Subject: Re: [PATCH V4 05/12] trace/hwlat: Support hotplug operations
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
 <8899f8a8bec38bc600f7a2c61bc6ca664aa7beeb.1623746916.git.bristot@redhat.com>
 <20210618124503.388fe4d4@oasis.local.home>
 <20210618150020.689439d4@oasis.local.home>
 <c4b86b0e-b45d-3039-f49c-0dc53e1adcbd@redhat.com>
 <20210621112528.12aee665@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <c87c24bd-253c-a645-1f29-83c558d8d4c5@redhat.com>
Date:   Mon, 21 Jun 2021 18:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621112528.12aee665@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/21/21 5:25 PM, Steven Rostedt wrote:
> On Mon, 21 Jun 2021 13:34:44 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>>> And of course, because get_online_cpus() is called within
>>> trace_types_lock, doing this check is going to cause a lock inversion.
>>>  
>> Yep! I tried to take the trace_type_lock here, and got the lockdep info about
>> this problem.
>>
>>> The only thing I could think of is to wake up a worker thread to do the
>>> work. That is, this just wakes the worker thread, then the worker grabs
>>> the trace_types_lock, iterates through the cpu mask of expect running
>>> threads, and then starts or kills them depending on the hwlat_busy
>>> value.  
>> So, it will not wait for the kworker to run?
> What wont wait?

For example, at the shutdown, should the hotplug callback wait for the workqueue
to run & kill the thread, or not?

-- Daniel

> -- Steve
> 

