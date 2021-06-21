Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F138C4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 11:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4DCE601FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 11:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhFULhH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 07:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34205 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhFULhF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 07:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624275291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9TwczRoV9TVoF9ppyrvU2lNC6nAkuKP+unrhoJpPrvc=;
        b=L5Wm8mLYsCyAtWlhuLmZLCFhb6dMss8OGiTh1CLO9uXCAwGOMVKS5ZAfQvVz4uqb8vSFEM
        RDP4K7bSPHyj/wWo0pqixHNihu933nMUkI0NSoQEyo115cI4lmeyz1QaGDuZZhD+OMknDc
        81rJeweRkNZ6zWvzRnkiFQgYnEoGFgo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-proh88FmOeiFsIhRwxrw0Q-1; Mon, 21 Jun 2021 07:34:47 -0400
X-MC-Unique: proh88FmOeiFsIhRwxrw0Q-1
Received: by mail-ed1-f69.google.com with SMTP id x12-20020a05640226ccb0290393aaa6e811so7587032edd.19
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 04:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9TwczRoV9TVoF9ppyrvU2lNC6nAkuKP+unrhoJpPrvc=;
        b=GVjnIxbxaFxRJi5M/hngXM+Qa0IIwbxAZSU3v4MwVOBfb4jOmYxcehwQ00mwNquYTe
         88Ve7OtjIH0MZD2xBZ5v6y8AcOujTQCQ8ckX8L55oI2ms3U0vWbvGYz2xLcAQZhR2j0o
         I4OVOgTlPhPPtxT0FUDxLkhFj9r6TGcmamJI7p+Gp1HulxdxMURuS0JooCpWM4TcA/Mj
         a3ApEaJ6bVSq+rD46LbwQLJDH+uJYlnaM7WqZRZs9+vot0z2ru+fhmLIiY8wtH4yjevL
         LbXeD59SHJ4+lyMAyWaB/EC3g3CikzlatZG1ftZmoI2fvbI2Dley01ncbnewWFGZmnR1
         oJSg==
X-Gm-Message-State: AOAM533HPSSkzsSeVEV/reqd5cyMHLwqxUc/C5WCbrE+fg/OoeKNMLgO
        QYYJKlEgH30lt5LlvL8JCm+W5hiN2Od0nmw4WxZ4tmzRymFxEoOiPn5FVKzB/D88jQdGn3hI1YD
        EHCl/MAGPMw6olHFoZBfl
X-Received: by 2002:a50:fb01:: with SMTP id d1mr17865069edq.347.1624275286710;
        Mon, 21 Jun 2021 04:34:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5GYkRn/hWTnlTfafpPFgrzzQGS8dyogRPPpTKNdQknQZ61PLiOKvCURpTZYCiBV79BiWAtw==
X-Received: by 2002:a50:fb01:: with SMTP id d1mr17865052edq.347.1624275286560;
        Mon, 21 Jun 2021 04:34:46 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id u21sm4664524eja.59.2021.06.21.04.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 04:34:46 -0700 (PDT)
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
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <c4b86b0e-b45d-3039-f49c-0dc53e1adcbd@redhat.com>
Date:   Mon, 21 Jun 2021 13:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618150020.689439d4@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/21 9:00 PM, Steven Rostedt wrote:
> On Fri, 18 Jun 2021 12:45:03 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>>> +/*
>>> + * hwlat_cpu_init - CPU hotplug online callback function
>>> + */
>>> +static int hwlat_cpu_init(unsigned int cpu)
>>> +{
>>> +	struct trace_array *tr = hwlat_trace;
>>> +  
>> You need to take the trace_types_lock here, between testing the
>> hwlat_busy and starting the threads. Otherwise, between the two, the
>> hwlat tracer could be turned off while a CPU is coming on line, and
>> then you just started a per cpu thread, while the hwlat tracer is not
>> enabled.
> And of course, because get_online_cpus() is called within
> trace_types_lock, doing this check is going to cause a lock inversion.
>

Yep! I tried to take the trace_type_lock here, and got the lockdep info about
this problem.

> The only thing I could think of is to wake up a worker thread to do the
> work. That is, this just wakes the worker thread, then the worker grabs
> the trace_types_lock, iterates through the cpu mask of expect running
> threads, and then starts or kills them depending on the hwlat_busy
> value.

So, it will not wait for the kworker to run?

-- Daniel

> 
> -- Steve
> 

