Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C088C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 19:07:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2908B60F21
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 19:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhHKTH0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 15:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33903 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230290AbhHKTH0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 15:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628708821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5QE/fAtzET4+bnEA1B+px7kFDrqIsaQmncafMGX56pg=;
        b=acGaNmFyQOUPi9V004SBa6Y7J0E2zAMjHPX2EUY3ISuppRIeUnNBPNbqi90J8qiXCY1zk+
        pVJmCyCefZR6P8GddJoEMfXWNbKMoDs+S+DJl2w7bQCfrJKUlXggzSAUb830md29DbRJmt
        1eaBs1vmHeJvRIwB9hoEON6JUg81pW4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-yG04YeW0NVaVHJmfh-VsSg-1; Wed, 11 Aug 2021 15:07:01 -0400
X-MC-Unique: yG04YeW0NVaVHJmfh-VsSg-1
Received: by mail-qk1-f198.google.com with SMTP id q11-20020a05620a05abb02903ca17a8eef8so1954976qkq.10
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 12:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5QE/fAtzET4+bnEA1B+px7kFDrqIsaQmncafMGX56pg=;
        b=WsjLwYTVkiLIgci/Yz6sfeib3TtE1H1kV9SutMUzP968WpdXktcgllh4JnWQsdISF4
         0WqsSBau/ZfD3jb6uSOxfpZqetuzJbtDWJhW6Pf7nJ+Q5FgHXXPZu+lV+EExSJqvbMyc
         NE4ZKu6uGgiL6/KrbrOIF/c4cXDgDprdsl0FzVbuxocysGIoGnf3kC43uYHqHHkO5Wiz
         EuvHn9g6jbfM8SrPADXj8t/OCTfnk9nxQUln2rVCjx9Ob6pVwF9BRVgFb+yaL3XK6pyF
         lRJNxuMvje8ukyyCRQhH6lx7s6qiCNI9sKMdgMk6eWtjPQUMpvOtbt2drkCUBNpqRUxF
         872g==
X-Gm-Message-State: AOAM531buXrkRnCPkEQFa/SRm/jGvSCUgZJsXY2/Fi9Y8qoAwKFXmuRi
        w2tX9e6hkb6nJs17283ZzSvbKGK6LuAbVb4osUezD5gpwGmAK1whYbaNr+oiWa6Y4odJ27dtauK
        1y99Kl+xIaVrCCg7d57TUR+C7By6i+eNu8CoKrOB2ETpZd/v9nRAyXJxoi18OMceegZ+R
X-Received: by 2002:a05:620a:d54:: with SMTP id o20mr546821qkl.326.1628708820004;
        Wed, 11 Aug 2021 12:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKHjAyXPoQ+oPzvXay29LjdH91msFnZE5INVFTZ7WTWz4fV05+iXY5Xx2XjtEEZI8g965sFQ==
X-Received: by 2002:a05:620a:d54:: with SMTP id o20mr546794qkl.326.1628708819787;
        Wed, 11 Aug 2021 12:06:59 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id b7sm57742qtj.72.2021.08.11.12.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 12:06:59 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] cgroup/cpuset: Enable memory migration for cpuset v2
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20210811163035.1977-1-longman@redhat.com>
 <YRQbdTgprUJyuis7@cmpxchg.org>
Message-ID: <b85cfcb5-9037-b92e-6513-871944995090@redhat.com>
Date:   Wed, 11 Aug 2021 15:06:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRQbdTgprUJyuis7@cmpxchg.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/11/21 2:48 PM, Johannes Weiner wrote:
> On Wed, Aug 11, 2021 at 12:30:35PM -0400, Waiman Long wrote:
>> When a user changes cpuset.cpus, each task in a v2 cpuset will be moved
>> to one of the new cpus if it is not there already. For memory, however,
>> they won't be migrated to the new nodes when cpuset.mems changes. This is
>> an inconsistency in behavior.
>>
>> In cpuset v1, there is a memory_migrate control file to enable such
>> behavior by setting the CS_MEMORY_MIGRATE flag. Make it the default
>> for cpuset v2 so that we have a consistent set of behavior for both
>> cpus and memory.
>>
>> There is certainly a cost to make memory migration the default, but it
>> is a one time cost that shouldn't really matter as long as cpuset.mems
>> isn't changed frequenty.  Update the cgroup-v2.rst file to document the
>> new behavior and recommend against changing cpuset.mems frequently.
>>
>> Since there won't be any concurrent access to the newly allocated cpuset
>> structure in cpuset_css_alloc(), we can use the cheaper non-atomic
>> __set_bit() instead of the more expensive atomic set_bit().
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst | 6 ++++++
>>   kernel/cgroup/cpuset.c                  | 6 +++++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 5c7377b5bd3e..47c832ad1322 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2056,6 +2056,12 @@ Cpuset Interface Files
>>   	The value of "cpuset.mems" stays constant until the next update
>>   	and won't be affected by any memory nodes hotplug events.
>>   
>> +	Setting a non-empty value to "cpuset.mems" causes memory of
>> +	tasks within the cgroup to be migrated to the designated nodes if
>> +	they are currently using memory outside of the designated nodes.
>> +	There is a cost for this migration.  So "cpuset.mems" shouldn't
>> +	be changed frequently.
> The migration skips over pages that are (temporarily) off the LRU for
> reclaim, compaction etc. so it can leave random pages behind.
>
> In practice it's probably fine, but it probably makes sense to say
> it's advisable to set this config once before the workload launches
> for best results, and not rely too much on changing things around
> post-hoc, due to cost you pointed out but also due to reliability.
>
> Otherwise no objection from me.
>
Thanks for the suggestion. Will update the patch to include additional 
wording about that.

Cheers,
Longman

