Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5C5C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 02:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhKWCkg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 21:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhKWCkf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 21:40:35 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C8FC061574
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 18:37:28 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id j2so18837299ybg.9
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 18:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nTPvXtzHv6HZ++mcRaXSOv1XKXnEa9rG+SSlC7lYWhE=;
        b=bHQq0Hd9I+/x8g1ZiZ0Z02M8FM3ZseM/4YkRg0DgwRAubOxI1F66GBSSnLposQ8q4Y
         ZM0VPxfaLVAhZuZw4o9hBxpIt8KQSF3bp39N5GJlruPuG9tmzZGTUvjFK39kInRaraMF
         7rwRsQKa4eu8zoZeZpq+NT+Wc6ZCWPxsHKnsf7Etw+JKv0aHa6BQ4gR3yjYGPvqRyD0r
         lsTm+CQQZ6wOPt5sNrS35Niz2aKBkxQ82ky0RbYVnCYKTNTMVM0rLM40UaLtTSNSxU1n
         VnqNWPUsrC9P9yN1kZh8AnqaIvybNdmzYY6Wm9B0BU9lYhN5bDHT5XVpKPD84TjCOUjU
         HrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nTPvXtzHv6HZ++mcRaXSOv1XKXnEa9rG+SSlC7lYWhE=;
        b=Xai+V7OQgmzZEXiXOQOcVEVZnL/8v8TLDFqYPEUaTd4wrI4m4WQ5JrirnGdQgnIPOY
         dHKQiH3++9HkGykKh2/cm9ZTyaZFUAVB/pYXKijsfOmaAcbLBiSxA2vMqmkVn0IKYE/K
         xrvqNnb+/7Rd5a9LA29oHGOAgmoO3U0ETKTbl0L8+Vekrn3j3P/KOdqRE80yYAyLPxaC
         oOWrwsO5Px4BHwHbIEO70BCIlXYc2wyZlJMBQ52nixQuzennHJNnbWJ+sGzspxPvNmC/
         dAaHtZ2x46UCp2Z1OX7InB3+6gWcZJozahskwB1AbDDFF+gzWXloMcff/YmTgN3v6Kch
         u/Zg==
X-Gm-Message-State: AOAM532NxNDCaeGRwtXAnlJuzyMPIrw3VWlWOGurwoOpQe2+8TcheURf
        bcER+fPN2f6fCxMb41oNOZAoY6FlPgFteEFQgaXWVw==
X-Google-Smtp-Source: ABdhPJyQuU6bla0tWR3Wxzlsd9NTbOuv/DnOYWhHE+zyUPIdWOhzHxoMxpfXFikXiLUYEMuzoAGwd/Vz1Gd5l2N773s=
X-Received: by 2002:a05:6902:1144:: with SMTP id p4mr2434493ybu.404.1637635047527;
 Mon, 22 Nov 2021 18:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20211123001020.4083653-1-almasrymina@google.com>
In-Reply-To: <20211123001020.4083653-1-almasrymina@google.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 23 Nov 2021 10:36:48 +0800
Message-ID: <CAMZfGtVe9oeqz-E2kquodD6JPvt=2qkpU4E0T6OgSu4_3PXQhA@mail.gmail.com>
Subject: Re: [PATCH v8] hugetlb: Add hugetlb.*.numa_stat file
To:     Mina Almasry <almasrymina@google.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>, Jue Wang <juew@google.com>,
        Yang Yao <ygyao@google.com>, Joanna Li <joannali@google.com>,
        Cannon Matthews <cannonmatthews@google.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Cgroups <cgroups@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 23, 2021 at 8:10 AM Mina Almasry <almasrymina@google.com> wrote=
:
>
> For hugetlb backed jobs/VMs it's critical to understand the numa
> information for the memory backing these jobs to deliver optimal
> performance.
>
> Currently this technically can be queried from /proc/self/numa_maps, but
> there are significant issues with that. Namely:
> 1. Memory can be mapped or unmapped.
> 2. numa_maps are per process and need to be aggregated across all
>    processes in the cgroup. For shared memory this is more involved as
>    the userspace needs to make sure it doesn't double count shared
>    mappings.
> 3. I believe querying numa_maps needs to hold the mmap_lock which adds
>    to the contention on this lock.
>
> For these reasons I propose simply adding hugetlb.*.numa_stat file,
> which shows the numa information of the cgroup similarly to
> memory.numa_stat.
>
> On cgroup-v2:
>    cat /sys/fs/cgroup/unified/test/hugetlb.2MB.numa_stat
>    total=3D2097152 N0=3D2097152 N1=3D0
>
> On cgroup-v1:
>    cat /sys/fs/cgroup/hugetlb/test/hugetlb.2MB.numa_stat
>    total=3D2097152 N0=3D2097152 N1=3D0
>    hierarichal_total=3D2097152 N0=3D2097152 N1=3D0
>
> This patch was tested manually by allocating hugetlb memory and querying
> the hugetlb.*.numa_stat file of the cgroup and its parents.
> =EF=BF=BC
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Miaohe Lin <linmiaohe@huawei.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Muchun Song <songmuchun@bytedance.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Jue Wang <juew@google.com>
> Cc: Yang Yao <ygyao@google.com>
> Cc: Joanna Li <joannali@google.com>
> Cc: Cannon Matthews <cannonmatthews@google.com>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
