Return-Path: <SRS0=LpQx=B3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F27C433DF
	for <linux-doc@archiver.kernel.org>; Mon, 17 Aug 2020 17:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3F8320786
	for <linux-doc@archiver.kernel.org>; Mon, 17 Aug 2020 17:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="Z23cJzvo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731634AbgHQRxf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Aug 2020 13:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388636AbgHQQLj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Aug 2020 12:11:39 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CF5C061343
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2020 09:11:38 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b14so15442262qkn.4
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2020 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=EPZNWjTuoNbn3/0iITSmRZt5ivNwv7BWW6z1AtL/Hmc=;
        b=Z23cJzvoZmVLpOK2aT+f4XT4iV2NnQq1w6sWZWEGLYa39+S+I66Qx1sJuEz0lgvGq1
         9MafbfOp+fkSCLAdwkxY3sqWfa/7Ya+r03VJzdWTWGLlMGY81AwTZ2a03DaIZWFHcudU
         YK2AWWX4x4DALRmK9f7+jCQ+8hCmXiM0ppCuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=EPZNWjTuoNbn3/0iITSmRZt5ivNwv7BWW6z1AtL/Hmc=;
        b=pZHlhmSsNYFGr/WB03r5xSe/2sSdymYuGFoBcfkHQXfuQ14f7lEBUeBHUU5egdLezT
         U1hOHVIMIWbvV6CqWP+OETCacP+Ss8iYj8nmHlHos6jWfWkURwwBtPNzMw90fOzVQDUU
         PCEtq9YEBofYIImUg5bo4EwfwG3L3x215Zqbuqp4PIcd2nctuHKba6vqq0Ff6i2s2Bhl
         shmwVDgRYNSwblHcT+5LvRr7OGpO7duiIB+9zCm4339juwn+Is7uPc/e71yB96Y1pytt
         vZHWQAzLJyPBeqEtwmHXWyiTHJQ73HExaWTPtz1Au52DUAlXuJ0WL0KYDtO5yAKxZQ6C
         kaUA==
X-Gm-Message-State: AOAM531jLeSiGvURr6KMHF+r3vOKiD1SNIcynPSmw9N1I9FMIjQklw4u
        i7jYPkS9nOReaq86QjaeIW8RQQ==
X-Google-Smtp-Source: ABdhPJxCfcujs7UvLmGxbMeQ2XhvVrOMYp62V16ipQ+dV/Tk0r1zxthxYII+3rcf8N5c4NDp4jS9dg==
X-Received: by 2002:a37:9a46:: with SMTP id c67mr13909866qke.85.1597680694869;
        Mon, 17 Aug 2020 09:11:34 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:47cc])
        by smtp.gmail.com with ESMTPSA id z14sm19093304qtn.92.2020.08.17.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 09:11:34 -0700 (PDT)
Date:   Mon, 17 Aug 2020 17:11:32 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/8] memcg: Enable fine-grained control of over
 memory.high action
Message-ID: <20200817161132.GA5171@chrisdown.name>
References: <20200817140831.30260-1-longman@redhat.com>
 <20200817140831.30260-2-longman@redhat.com>
 <20200817143044.GA1987@chrisdown.name>
 <934e4bc3-bab6-b19a-49f9-6a6ae8638570@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934e4bc3-bab6-b19a-49f9-6a6ae8638570@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Waiman Long writes:
>On 8/17/20 10:30 AM, Chris Down wrote:
>>Astractly, I think this really overcomplicates the API a lot. If 
>>these are truly generally useful (and I think that remains to be 
>>demonstrated), they should be additions to the existing API, rather 
>>than a sidestep with prctl.
>This patchset is derived from customer requests. With existing API, I 
>suppose you mean the memory cgroup API. Right? The reason to use 
>prctl() is that there are users out there who want some kind of 
>per-process control instead of for a whole group of processes unless 
>the users try to create one cgroup per process which is not very 
>efficient.

If using one cgroup per process is inefficient, then that's what needs to be 
fixed. Making the API extremely complex to reason about for every user isn't a 
good compromise when we're talking about an already niche use case.

>>I also worry about some other more concrete things:
>>
>>1. Doesn't this allow unprivileged applications to potentially 
>>bypass    memory.high constraints set by a system administrator?
>The memory.high constraint is for triggering memory reclaim. The new 
>mitigation actions introduced by this patchset will only be applied if 
>memory reclaim alone fails to limit the physical memory consumption. 
>The current memory cgroup memory reclaim code will not be affected by 
>this patchset.

memory.high isn't only for triggering memory reclaim, it's also about active 
throttling when the application fails to come under. Fundamentally it's 
supposed to indicate the point at which we expect the application to either 
cooperate or get forcibly descheduled -- take a look at where we call 
schedule_timeout_killable.

I really struggle to think about how all of those things should interact in 
this patchset.

>>2. What's the purpose of PR_MEMACT_KILL, compared to memory.max?
>A user can use this to specify which processes are less important and 
>can be sacrificed first instead of the other more important ones in 
>case they are really in a OOM situation. IOW, users can specify the 
>order where OOM kills can happen.

You can already do that with something like oomd, which has way more 
flexibility than this. Why codify this in the kernel instead of in a userspace 
agent?
