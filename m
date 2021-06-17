Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DE0C49361
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E555613FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhFQUrt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 16:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60435 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231992AbhFQUrs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 16:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623962739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vpTnIUemqOshEpd//f5xMntFtlQkGOaInP6j17WpXWI=;
        b=FiwDJA8gXXR1EIhAbepiVefUQAiMNjURbrdkP+Yn1F4RdPYZ6Ymhn8oNxeKnNI/9tRMcto
        PBFjiGf+/Cn0Eb6Edt7oiygX9Lwjr3h6fcD8Uwr5NU7qrEVZhwulxLr6cGTm9pGArQQIDf
        dwmVwHvHf/KOr89o1T7sDy/v8atVcyg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-KK7LHlWkOsypck1Buv1fAg-1; Thu, 17 Jun 2021 16:45:37 -0400
X-MC-Unique: KK7LHlWkOsypck1Buv1fAg-1
Received: by mail-qv1-f72.google.com with SMTP id q8-20020ad45ca80000b02902329fd23199so3397917qvh.7
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 13:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vpTnIUemqOshEpd//f5xMntFtlQkGOaInP6j17WpXWI=;
        b=UlKokEy0p2CqN4Sjp4leV39wz00RB0r/+hJ+FLhCaG2CnBevPwdAm/5lvOCYS2rep2
         i9zoUcSU1wHZTRMnfLQcVjWTmcrPaKEosbuDB90f0va9JuskqjdgFArS+1p57Y7OigpP
         aR3y9yqldbwC6vh2xo3OXVi3c82oRr+boG3HYQC7h5aukUlTYGiQRkclU6v1tPV/3x53
         ML3NW2LKVWdhh92vW5pYmbY70cmUO9HlPQQtX61X1re9CQ1B6LSpANswF4UdUq57d+BK
         RCM/j+BP7cxdIc8Xp6f0SWyQv5iBrDVrJ8qCnOisVlXWhWv36xHBSIRmj652HFiCKqCT
         mnDg==
X-Gm-Message-State: AOAM530y7LzWCTI1BWkxLO3NUT5lN0mNlsf9qx+NrgARzhc8v3hQoPPR
        ilkSbaV7ZGTFwlzN3zORn5aogM123n7Y+qcCMP0Vxh6DaKRF7/gOb2CplISkYCS8LOlz9z0pY2/
        i707xHbMzDuYGWn0RDHHF
X-Received: by 2002:ac8:5e87:: with SMTP id r7mr1753332qtx.325.1623962737280;
        Thu, 17 Jun 2021 13:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+oHpsqIx+NBzTLes07czJPTW873K6oP8vENp+xLmoU04jdAkKJ4RFfNYLnjvR6dWKWFFv/g==
X-Received: by 2002:ac8:5e87:: with SMTP id r7mr1753310qtx.325.1623962737068;
        Thu, 17 Jun 2021 13:45:37 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id t196sm2477328qke.50.2021.06.17.13.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 13:45:36 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 3/5] cgroup/cpuset: Allow non-top parent partition root to
 distribute out all CPUs
To:     Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>
References: <20210603212416.25934-1-longman@redhat.com>
 <20210603212416.25934-4-longman@redhat.com>
 <YMplzNzg7mMCU4JJ@slm.duckdns.org>
Message-ID: <7f0a0f23-3fcd-a1a3-341a-2dbbde1f25ec@redhat.com>
Date:   Thu, 17 Jun 2021 16:45:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMplzNzg7mMCU4JJ@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/16/21 4:57 PM, Tejun Heo wrote:
> Hello,
>
> On Thu, Jun 03, 2021 at 05:24:14PM -0400, Waiman Long wrote:
>> @@ -2181,6 +2192,13 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
>>   	    (cpumask_empty(cs->cpus_allowed) || nodes_empty(cs->mems_allowed)))
>>   		goto out_unlock;
>>   
>> +	/*
>> +	 * On default hierarchy, task cannot be moved to a cpuset with empty
>> +	 * effective cpus.
>> +	 */
>> +	if (is_in_v2_mode() && cpumask_empty(cs->effective_cpus))
>> +		goto out_unlock;
>> +
> This is inconsistent with how other events which leave a root partition
> empty is handled. Woudln't it be more consistent to switch the parent to
> PRS_ERROR and behave accordingly but allow it to have valid child roots?

 From my point of view, PRS_ERROR is used when cpus are gone because of 
cpu hotplug (offline). It can be a temporary condition that will be 
corrected later on. I don't want to use PRS_ERROR for the particular 
case that the users have explicitly distributed out all the cpus to 
child partitions. I will clarify it in the next version and double check 
to make sure that this rule is consistently apply.

Thanks,
Longman

