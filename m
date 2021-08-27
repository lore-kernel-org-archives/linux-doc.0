Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1084C4320E
	for <linux-doc@archiver.kernel.org>; Fri, 27 Aug 2021 21:19:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3E8E60F58
	for <linux-doc@archiver.kernel.org>; Fri, 27 Aug 2021 21:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhH0VU2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Aug 2021 17:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231954AbhH0VU0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Aug 2021 17:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630099177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U1joG16srsSQx+ASNF6WUB8jVFgT0G7DpTPaFt49UTk=;
        b=DXN2dRTvX6QWbIqjQ9YAAcbsKUkSYxZZs4me7wK1rdCY994MdltPNBtRk60TKmtCOAK5ro
        1dWlFe5ePx8kdJ//XpMUuw3uta9uQr7OapSjqPUwvZHnd4yMgjQmsmWvbk9UNDYKid6BLk
        iaFB83vgdb7LYx4hdC3qK4TXtVbcrZ0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-BjKdzM3UO1iPQCNjHaDBUQ-1; Fri, 27 Aug 2021 17:19:35 -0400
X-MC-Unique: BjKdzM3UO1iPQCNjHaDBUQ-1
Received: by mail-qk1-f197.google.com with SMTP id w2-20020a3794020000b02903b54f40b442so2091726qkd.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 14:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=U1joG16srsSQx+ASNF6WUB8jVFgT0G7DpTPaFt49UTk=;
        b=YsI4dRGpYEKIHW2OlzAHqX6whyRNaByLQNyKfT9EIitJtjRp64A4eM+ercTGgji2G8
         T3tpGInMOCFrlH+AoHl13eEwWsbgii39O+htp17RLcxthbeEqEPDFX0XJX4uI+Hpsi5V
         DMXnUBTdP3XCI28PIHlzsZAMygqhejAtI6+7GSMbpgxMQdrDrGA9Gpg1f3KA0aI3NIMM
         HO5QncFNLcyZ84XTdS2GWy4RVzCE0beOhjgq/sVtPteSUpNPSuN2gOceRhZfaKn4OOqi
         uMiXLtEpLmep/TApTevUqX5lqfoJsv+35Pk6oEx8raPM37d9RmTwwUZ68oAbm+fYuReF
         WN1A==
X-Gm-Message-State: AOAM530qGVO9+sDel96UINt6OCkNoX5U6YJQ1y9S7ulqHNsYE+hcx0h7
        +aDWFWBT4XY6SmqR1XpfvaSFJunsYwwDY2ivQgFg6WhUx7OTBh/sTuk3lo+NC1zjrINj0lXOeh2
        xnwy2tqc4sVexQKlkjmmZ
X-Received: by 2002:ac8:5905:: with SMTP id 5mr10126464qty.286.1630099174846;
        Fri, 27 Aug 2021 14:19:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSgcChWoGG7JzhgBHKTsf5bPMKevttJCBAb34KxbwiSpBx7V0ruD8rOHDWgSN7ARHcPzidpQ==
X-Received: by 2002:ac8:5905:: with SMTP id 5mr10126447qty.286.1630099174585;
        Fri, 27 Aug 2021 14:19:34 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id 75sm5578360qko.100.2021.08.27.14.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 14:19:33 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v7 5/6] cgroup/cpuset: Update description of
 cpuset.cpus.partition in cgroup-v2.rst
To:     Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
References: <20210825213750.6933-1-longman@redhat.com>
 <20210825213750.6933-6-longman@redhat.com> <YSfQ0mYWs2zUyqGY@mtj.duckdns.org>
 <32e27fcc-32f1-b26c-ae91-9e03f7e433af@redhat.com>
 <YShjb2WwvuB4s4gX@slm.duckdns.org>
Message-ID: <d22ea3be-2429-5923-a80c-5af3b384def9@redhat.com>
Date:   Fri, 27 Aug 2021 17:19:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YShjb2WwvuB4s4gX@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/27/21 12:00 AM, Tejun Heo wrote:
> Hello,
>
> On Thu, Aug 26, 2021 at 11:01:30PM -0400, Waiman Long wrote:
>> What I am doing here is setting a high bar for transitioning from member to
>> either "root" or "isolated". Once it becomes a partition, there are multiple
>> ways that can make it invalid. I am fine with that. However, I am not sure
>> it is a good idea to allow users to echo "root" to cpuset.cpus.partition
>> anywhere in the cgroup hierarchy and require them to read it back to see if
>> it succeed.
> The problem is that the "high" bar is rather arbitrary. It might feel like a
> good idea to some but not to others. There are no clear technical reasons or
> principles for rules to be set this particular way.
>
>> All the checking are done with cpuset_rwsem held. So there shouldn't be any
>> racing. Of course, a hotplug can immediately follow and make the partition
>> invalid.
> Imagine a system which dynamically on/offlines its cpus based on load or
> whatever and also configures partitions for cases where the needed cpus are
> online. If the partitions are set up while the cpus are online, it'd work as
> expected - partitions are in effect when the system can support them and
> ignored otherwise. However, if the partition configuration is attempted
> while the cpus happen to be offline, the configuration will fail, and there
> is no guaranteed way to make that configuration stick short of disabling
> hotplug operations. This is a pretty jarring brekage happening exactly
> because the behavior is an inconsistent amalgam.
>
> It's usually not a good sign if interface restrictions can be added or
> removed because how one feels without clear functional reasons and often
> indicates that there's something broken, which seems to be the case here
> too.

Well, that is a valid point. The cpus may have been offlined when a 
partition is being created. I can certainly relent on this check in 
forming a partition. IOW, cpus_allowed can contain some or all offline 
cpus and a valid (some are online) or invalid (all are offline) 
partition can be formed. I can also allow an invalid child partition to 
be formed with an invalid parent partition. However, the cpu exclusivity 
rules will still apply.

Other than that, do you envision any other circumstances where we should 
allow an invalid partition to be formed?

Cheers,
Longman


