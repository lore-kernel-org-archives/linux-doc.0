Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9F7C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 07:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F8DF61177
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 07:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhDIHUC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 03:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56679 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229673AbhDIHUB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 03:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617952789;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IguW8kgGlzt9NZWLdeLXN2H9KrPyDih2gPl5AJIXHOs=;
        b=NKS/wqgc4ATW707HOC0a+V/n9LFs/EMZSl3h1E4QUeBzLpSbWCsWVX3YM5V7mfzFZ4qXRd
        RinL6nS8Bi6oOjm0wxFBlfodQlc8GJhi+E2E/Zub6qDoAl87fAsbolkILzUjagRgzDArz/
        Iae1PzUT26n72PYPALS4cpw6KKJi+pY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-RAs8S2sjNxeKMmZkdV_-nw-1; Fri, 09 Apr 2021 03:19:46 -0400
X-MC-Unique: RAs8S2sjNxeKMmZkdV_-nw-1
Received: by mail-ej1-f72.google.com with SMTP id a11so1593813ejg.7
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 00:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IguW8kgGlzt9NZWLdeLXN2H9KrPyDih2gPl5AJIXHOs=;
        b=GHQZVUfuT/8aOzhUYzzzUwZXqcREurH90SYD1tK80hEuADvh1uhfbakeY2FCfI/G3D
         NE3lLdjGaFV3Agfr8ukitvADpSQM3fbqdYh20I0x2godJPOetGe0nLXwlJkys01lMTGP
         sB069evCC3gOBkl74uQ91yQEX/as+uzIRcP4yWZnyibONZS8yOZPecr/aBC0+IUMt+Ek
         7pON202p1yaNYSYJ0c81fb5Dg0Zjo4aXkjtSPhG/Xa+avIAR6flxB9bhH2/ZCuYLrxdx
         hNQZikdl7Z9oUKBOpE7Jz+4zveRszsnyXVd5N9I4OHb26hsHENY9MdA055ddmz46L8gz
         iBZg==
X-Gm-Message-State: AOAM53379CBb4jyPR5xKh00nOcqbL8pZwx85038OjPEMyYnYhV6aVBUD
        q8ym+Zb0xkKRserM+fl8Txts4Nfx7SkT16xV5ejjGwY8n9m4HJi7KQ211oDkALrG09JPqcsYJyb
        fWoOSwnnailxaVWfDV/yDPOw4dyvZunqgS1UTpBHf++fIH2oYgj4b3xavYj8TvtRwWtIaMn0=
X-Received: by 2002:a17:906:eb88:: with SMTP id mh8mr15162402ejb.74.1617952785092;
        Fri, 09 Apr 2021 00:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY41ap57CXKosvNll8nRWMmY6QVDsNdQ7fjAFZZMDSD1+l6HI7mJsboZvYJlWwIeVi4QOZ9g==
X-Received: by 2002:a17:906:eb88:: with SMTP id mh8mr15162378ejb.74.1617952784854;
        Fri, 09 Apr 2021 00:19:44 -0700 (PDT)
Received: from x1.bristot.me (host-79-56-201-31.retail.telecomitalia.it. [79.56.201.31])
        by smtp.gmail.com with ESMTPSA id x1sm791173eji.8.2021.04.09.00.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 00:19:44 -0700 (PDT)
Subject: Re: [RFC PATCH 5/5] tracing: Add the osnoise tracer
To:     Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org
Cc:     kcarcia@redhat.com, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1617889883.git.bristot@redhat.com>
 <3a69303b27bfc5d2274ab893b2cfbd0a8dbe31f7.1617889883.git.bristot@redhat.com>
 <87pmz422gj.fsf@meer.lwn.net>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <b64b560f-09ab-e801-52bf-42a73d26b9bf@redhat.com>
Date:   Fri, 9 Apr 2021 09:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmz422gj.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/8/21 5:58 PM, Jonathan Corbet wrote:
> Daniel Bristot de Oliveira <bristot@redhat.com> writes:
> 
> A quick nit:
> 
>>  Documentation/trace/osnoise_tracer.rst |  149 ++
>>  include/linux/ftrace_irq.h             |   16 +
>>  include/trace/events/osnoise.h         |  141 ++
>>  kernel/trace/Kconfig                   |   34 +
>>  kernel/trace/Makefile                  |    1 +
>>  kernel/trace/trace.h                   |    9 +-
>>  kernel/trace/trace_entries.h           |   27 +
>>  kernel/trace/trace_osnoise.c           | 1714 ++++++++++++++++++++++++
>>  kernel/trace/trace_output.c            |   72 +-
>>  9 files changed, 2159 insertions(+), 4 deletions(-)
>>  create mode 100644 Documentation/trace/osnoise_tracer.rst
>>  create mode 100644 include/trace/events/osnoise.h
>>  create mode 100644 kernel/trace/trace_osnoise.c
> When you create a new RST file, you need to add it to an index.rst (or
> similar) file so that it gets incorporated into the docs build.


ack!

> 
> The document itself looks good on a quick read.  If you're making
> another pass over it, you might consider reducing the ``markup noise`` a
> bit; we try to keep that to a minimum in the kernel docs.  But otherwise
> thanks for writing it!

Thanks for the review, Jon. I will reduce the `` markup (on this, and on some
other docs that are about to come :-))

-- Daniel
> jon
> 

