Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492C1C432BE
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 01:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2193B61002
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 01:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhH1BPB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Aug 2021 21:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20990 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232864AbhH1BO6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Aug 2021 21:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630113248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nj7lN9b3OW9PxFPw9p3QaG1rQrZn9spoM1KJO1HMw1U=;
        b=iwuvvHSCSRklIJ+ZPpaJX7q4lzphJkIuOqrAAKbFkBWqGsrWFl+7UoWyVvzBW+cArC++nK
        N2Bmi6BEkkkvIMr6IyKskHCwBaREffUl0brkZyEEkvBuqLkaGJkZ3lzsvzvoVSJqu6toiJ
        2VvpBLQPmj/xfbsPiCkYDEIlFGJiYZ0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-Y-hTZtkzNnGO1gPEtUsasw-1; Fri, 27 Aug 2021 21:14:04 -0400
X-MC-Unique: Y-hTZtkzNnGO1gPEtUsasw-1
Received: by mail-qv1-f69.google.com with SMTP id h14-20020a0cffce000000b00372ea3f12a5so787541qvv.9
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 18:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nj7lN9b3OW9PxFPw9p3QaG1rQrZn9spoM1KJO1HMw1U=;
        b=nL4hYc3Tw2AWpHXYgs/TZYY3RJxqCex2VIZqfZNtNAhGr0XKV5NZgmc1SfelxFc4CL
         5tUWlkmatkHsqScfpsVWHz7t7mgo43Se04gRaDmmq7641q1MmJ9Hkyzn/NIA1Gn2SASC
         +52gEh32OspHR5t6LzhT+UXUi/tPl6obV1J9Ul5AMgCMCOAp943qXX7CYzh1lVM+PalQ
         VlOufxTqeKeD8BrSlSnD2PrwdD92NDgP+TcCWAsCcyomB+7HyIopeS3cBG2GbDgjB1Oq
         UHLCfXS9z/Pih1cHhnKBQUx+xIX5B9kRowUNQ6N6uu8LY5MxPl0+Fwa06nV0UjHQKWrt
         R0QA==
X-Gm-Message-State: AOAM5332FKOynsaZX571RP3rysI1uh553SvK++KL5f5/++rfmjACR0JB
        zUHN2O9/TgCMz6hHmkXhyQZv57r6X32GZYMXdAddFQyQwvG4mPR9Cc6hgaAiN3kzRkOyD4xEML1
        ZW4AInvEo8Z5XbmzHEOmd
X-Received: by 2002:a37:652:: with SMTP id 79mr12078382qkg.197.1630113244161;
        Fri, 27 Aug 2021 18:14:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykNQoi0T51RsUXHOgq9qN2JS1S6X7N+wT1bH2pmiiItHjdiaYmsBmA5yoKxviFq81ypmmOdA==
X-Received: by 2002:a37:652:: with SMTP id 79mr12078348qkg.197.1630113243925;
        Fri, 27 Aug 2021 18:14:03 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id 21sm6009570qkk.51.2021.08.27.18.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 18:14:02 -0700 (PDT)
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
 <d22ea3be-2429-5923-a80c-5af3b384def9@redhat.com>
 <YSlY0H/qeXQIGOfk@slm.duckdns.org>
 <392c3724-f583-c7fc-cfa1-a3f1665114c9@redhat.com>
 <YSl2yxEvnDrPxzUV@slm.duckdns.org>
Message-ID: <f1168ddc-cb67-ecfd-6644-4963c857a0a0@redhat.com>
Date:   Fri, 27 Aug 2021 21:14:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSl2yxEvnDrPxzUV@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/27/21 7:35 PM, Tejun Heo wrote:
> Hello,
>
> On Fri, Aug 27, 2021 at 06:50:10PM -0400, Waiman Long wrote:
>> The cpu exclusivity rule is due to the setting of CPU_EXCLUSIVE bit. This is
>> a pre-existing condition unless you want to change how the
>> cpuset.cpu_exclusive works.
>>
>> So the new rules will be:
>>
>> 1) The "cpuset.cpus" is not empty and the list of CPUs are exclusive.
> Empty cpu list can be considered an exclusive one.
It doesn't make sense to me to have a partition with no cpu configured 
at all. I very much prefer the users to set cpuset.cpus first before 
turning it into a partition.
>
>> 2) The parent cgroup is a partition root (can be an invalid one).
> Does this mean a partition parent can't stop being a partition if one or
> more of its children become partitions? If so, it violates the rule that a
> descendant shouldn't be able to restrict what its ancestors can do.

No. As I said in the documentation, transitioning from partition root to 
member is allowed. Against, it is illogical to allow a cpuset to become 
a potential partition if it parent is not even a partition root at all. 
In the case that the parent is reverted back to a member, the child 
partitions will stay invalid forever unless the parent become a valid 
partition again.

>
>> 3) The "cpuset.cpus" is a subset of the parent's cpuset.cpus.allowed.
> Why not just go by effective? This would mean that a parent can't withdraw
> CPUs from its allowed set once descendants are configured. Restrictions like
> this are fine when the entire hierarchy is configured by a single entity but
> become awkward when configurations are multi-tiered, automated and dynamic.

The original rule is to be based on effective cpus. However, to properly 
handle the case of allowing offlined cpus to be included in the 
partition, I have to change it to cpu_allowed instead. I can certainly 
change it back to effective if you prefer.

>
>> 4) No child cgroup with cpuset enabled.
> idk, maybe? I'm having a hard time seeing the point in adding these
> restrictions when the state transitions are asynchronous anyway. Would it
> help if we try to separate what's absoluately and technically necessary and
> what seems reasonable or high bar and try to justify why each of the latter
> should be added?

This rule is there mainly for ease of implementation. Otherwise, I need 
to add additional code to handle the conversion of child cpusets which 
can be rather complex and require a lot more debugging. This rule will 
no longer apply once the cpuset becomes a partition root.

Cheers,
Longman


