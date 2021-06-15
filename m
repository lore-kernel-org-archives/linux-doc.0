Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16585C2B9F4
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 02:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5041613F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 02:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFOC4C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 22:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49494 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229609AbhFOC4C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 22:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623725638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QdYxDbQWiJKAKMyRdXqAnaZNwtk+EcbNLD508mdqaII=;
        b=SnRF/3WapR3gHUhk/TYsu52nKeEZgnGutfGZsSrfuGKIgJgA2HJ17okApRwUsIPxBHzu9i
        WrFYbkIQIfWhQJjV1vlbdEzSbi9GrH0JOdz8j3uwDptla0OwQnvKN1JvXffW3B7xS7zh3z
        z+3zGtN5X0UgTuvwmsCMeOrVM5uiAL0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-87rXkVKpObeEvlfTvm3EJg-1; Mon, 14 Jun 2021 22:53:56 -0400
X-MC-Unique: 87rXkVKpObeEvlfTvm3EJg-1
Received: by mail-qt1-f199.google.com with SMTP id z17-20020ac86b910000b0290244cba55754so8659476qts.19
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 19:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QdYxDbQWiJKAKMyRdXqAnaZNwtk+EcbNLD508mdqaII=;
        b=ZJB+2lTiQ2jKIqeRC79+wYc0hLxbgmObMJGNM5pNCzjD2YnugMj5JjyyImoSgIPAAk
         jw+PATcTok29664HsWTK/KkRiCFu1CPFX0m6Y18334jELfi9HlodgkzMCjoUEJsyWwVb
         34Fgo12xiagkl/eiOHp3jjc2V/CSaji3cjH/HrurnPiSnJt8/kRYe4z08KqELBc5OTpM
         cUQbvLqmNdOGRxSUYaNcXudn/b5WgmrrUwRqZk+t51Jz/3+pvCexszY5W93dh1jhjfdX
         ttaVmm7loN+mG5j3CxyYsOk3Qh2NQD3DtWx10YO2tFDgzFBXBcgXoelL9MQFTXlDdBOY
         zFjA==
X-Gm-Message-State: AOAM531om5TEwR+Rd5es5tDeEk3nvCIrOsDi+fip/gORomZSylHTrgI1
        +LykKB1hflA/nJhzXz5Pj5gHpuo6EyOQ+Iplovw+acJifLTuG3vpxV6AugwJPqwoJBLibO9J9TQ
        2JCJqMl4oik0G4QmRcjfp
X-Received: by 2002:a05:6214:d8e:: with SMTP id e14mr2632186qve.15.1623725636536;
        Mon, 14 Jun 2021 19:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR4D5lIHl7MJuKgEWLvfkxmSWyUHGOXkAt4S7/aewovmlU2fF1+6INdneT3NVj66tHWWQPJA==
X-Received: by 2002:a05:6214:d8e:: with SMTP id e14mr2632175qve.15.1623725636385;
        Mon, 14 Jun 2021 19:53:56 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id b10sm11457721qkh.45.2021.06.14.19.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 19:53:55 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/4] cgroup/cpuset: Allow cpuset to bound displayed cpu
 info
To:     Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>, x86@kernel.org,
        cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20210614152306.25668-1-longman@redhat.com>
 <YMe/cGV4JPbzFRk0@slm.duckdns.org>
Message-ID: <0e21f16d-d91b-7cec-d832-4c401a713b10@redhat.com>
Date:   Mon, 14 Jun 2021 22:53:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMe/cGV4JPbzFRk0@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/14/21 4:43 PM, Tejun Heo wrote:
> Hello,
>
> On Mon, Jun 14, 2021 at 11:23:02AM -0400, Waiman Long wrote:
>> The current container management system is able to create the illusion
>> that applications running within a container have limited resources and
>> devices available for their use. However, one thing that is hard to hide
>> is the number of CPUs available in the system. In fact, the container
>> developers are asking for the kernel to provide such capability.
>>
>> There are two places where cpu information are available for the
>> applications to see - /proc/cpuinfo and /sys/devices/system/cpu sysfs
>> directory.
>>
>> This patchset introduces a new sysctl parameter cpuset_bound_cpuinfo
>> which, when set, will limit the amount of information disclosed by
>> /proc/cpuinfo and /sys/devices/system/cpu.
> The goal of cgroup has never been masquerading system information so that
> applications can pretend that they own the whole system and the proposed
> solution requires application changes anyway. The information being provided
> is useful but please do so within the usual cgroup interface - e.g.
> cpuset.stat. The applications (or libraries) that want to determine its
> confined CPU availability can locate the file through /proc/self/cgroup.

Thanks for your comment. I understand your point making change via 
cgroup interface files. However, this is not what the customers are 
asking for. They are using tools that look at /proc/cpuinfo and the 
sysfs files. It is a much bigger effort to make all those tools look at 
a new cgroup file interface instead. It can be more efficiently done at 
the kernel level.

Anyway, I am OK if the consensus is that it is not a kernel problem and 
have to be handled in userspace.

BTW, do you have any comment on another cpuset patch that I sent a week 
earlier?

https://lore.kernel.org/lkml/20210603212416.25934-1-longman@redhat.com/

I am looking forward for your feedback.

Cheers,
Longman

