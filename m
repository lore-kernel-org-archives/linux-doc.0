Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F335C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  9 Nov 2021 13:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36194610A3
	for <linux-doc@archiver.kernel.org>; Tue,  9 Nov 2021 13:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhKIOB2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Nov 2021 09:01:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236731AbhKIOB1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Nov 2021 09:01:27 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67A7C0613F5
        for <linux-doc@vger.kernel.org>; Tue,  9 Nov 2021 05:58:41 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id g18so14816036pfk.5
        for <linux-doc@vger.kernel.org>; Tue, 09 Nov 2021 05:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y30tES1mRbobBQ+m/yFfcYggfkhOFouTPN0eCLqdkac=;
        b=Uxmdf4znCpTXGzwMRB/AMMCqss7/LZk+9jxusKZRrq3r5+Tb+7PwY3/Uz+yuixUuTc
         a7KF+nrZAsxO0ezbYvMvahzD9nRoKh1K1Y1fhWIYzbjkVQNwkF1Ldmtg7D7xKs02Bx1I
         +2Qzciv5ZLtEFIgXWj5hLSZStRi/GVrOhKefP5n/45RUXE4BVstirUAKlQSzaIJXE8Mq
         vOrCFmoZzUJaJnuqw3nYonp0nWKmW4aN55IH3I6CW3GGxxPXkU8syNSvsXMgoAqw69r5
         efJwpH4k6IteCT9DfyhNnHVnPdsfftpuObaExxMpZ/URQma3NEkYdYudn92CR7TZgE7B
         hKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y30tES1mRbobBQ+m/yFfcYggfkhOFouTPN0eCLqdkac=;
        b=srqAFlnIfRemQi2d8LV9+B2QKGjnSdDDVkJRvPYz9Lbk+KuqJ7NQeOIufrhTCxX2cO
         dyI7xmaAlUnRWrlO2uPrz2suUcqpBVaqj1Sn9edDcyEI779YFoF25/g29Ohkv3acZ12J
         dbRHIIDREEwlYw2qQaeEee8uvhTrxFNzxwGfUeNFCmjKVe7ivwoImL+0xJe6qVmAdNiV
         fIZLPlGOdFdrF3wwadowxod5giS4TiPz9iEdzMLYtmSmqMJbG0r0B/C5Q+ypbtuLziz6
         x41O6PXhprW1EsTbHFA4FcX59Ws0AOL0ooAWquJRl09qvaW6swf7KTucWSLYH36moryb
         v9ag==
X-Gm-Message-State: AOAM530cLZHraB7OyiFARGr4NxSKTztwD+cu1R+DgGR5nzAZeZ+UvEUN
        V82NBA6H+yzguTSwjbtlecMNknNrWyaEYA==
X-Google-Smtp-Source: ABdhPJzWFlZcFbzZsn65SN5dY7OVkgY7rcUmnQO3V4I/9mqB60l/OLip0qZ0tcw0tPBNnSncs09/Uw==
X-Received: by 2002:a63:9042:: with SMTP id a63mr5939760pge.345.1636466321161;
        Tue, 09 Nov 2021 05:58:41 -0800 (PST)
Received: from [10.254.105.98] ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id p3sm18854221pfb.205.2021.11.09.05.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 05:58:40 -0800 (PST)
From:   Gang Li <ligang.bdlg@bytedance.com>
Subject: Re: Re: Re: Re: Re: [PATCH v1] sched/numa: add per-process
 numa_balancing
To:     Mel Gorman <mgorman@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20211027132633.86653-1-ligang.bdlg@bytedance.com>
 <20211028153028.GP3891@suse.de>
 <b884ad7d-48d3-fcc8-d199-9e7643552a9a@bytedance.com>
 <20211029083751.GR3891@suse.de>
 <CAMx52ARF1fVH9=YLQMjE=8ckKJ=q3X2-ovtKuQcoTyo564mQnQ@mail.gmail.com>
 <20211109091951.GW3891@suse.de>
 <7de25e1b-e548-b8b5-dda5-6a2e001f3c1a@bytedance.com>
 <20211109121222.GX3891@suse.de>
Message-ID: <117d5b88-b62b-f50b-32ff-1a9fe35b9e2e@bytedance.com>
Date:   Tue, 9 Nov 2021 21:58:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211109121222.GX3891@suse.de>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/9/21 8:12 PM, Mel Gorman wrote:
> 
> That would be a policy decision on how existing tasks should be tuned
> if NUMA balancing is enabled at runtime after being disabled at boot
> (or some arbitrary time in the past). Introducing the prctl does mean
> that there is a semantic change for the runtime enabling/disabling
> of NUMA balancing because previously, enabling global balancing affects
> existing tasks and with prctl, it affects only future tasks. It could
> be handled in the sysctl to some exist
> 
> 0. Disable for all but prctl specifications
> 1. Enable for all tasks unless disabled by prctl
> 2. Ignore all existing tasks, enable for future tasks
> 
> While this is more legwork, it makes more sense as an interface than
> prctl(PR_NUMA_BALANCING,PR_SET_NUMA_BALANCING,1) failing if global
> NUMA balancing is disabled.
> 

Why prctl(PR_NUMA_BALANCING,PR_SET_NUMA_BALANCING,1) must work while 
global numa_balancing is disabled? No offense, I think that is a bit 
redundant. And it's complicated to implement.

It's hard for me to understand the whole vision of your idea. I'm very 
sorry. Can you explain your full thoughts more specifically?

----------------------------------------------------

Also in case of misunderstanding, let me re-explain my patch using 
circuit diagram.

Before my patch, there is only one switch to control numa_balancing.

             ______process1_
...____/ __|______process2_|__...
            |______process3_|

        |
     global numa_balancing

After my patch, we can selectively disable numa_balancing for processes.
And global switch has a high priority.

             __/ __process1_
...____/ __|__/ __process2_|__...
            |__/ __process3_|

        |       |
     global  per-process

Why global numa_balancing has high priority? There are two reasons:
1. numa_balancing is useful to most processes, so there is no need to 
consider how to enable numa_balancing for a few processes while 
disabling it globally.
2. It is easy to implement. The more we think, the more complex the code 
becomes.
