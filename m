Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34A8C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 01:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhKWBYU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 20:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhKWBYT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 20:24:19 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7302BC06173E
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 17:21:12 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id z8so7640929ljz.9
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 17:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PZNVY9+03dEFejIwzLUj2PbaiVC1vy5FYIvkJizW4dQ=;
        b=CUvfp14TbL49LRiKzGVqTH2EYU63uY6IsAJcq5kvTwhdkLT5s1JIargoRqeM6fpkEm
         LFMO5UIM+oAVs07AlSdrpr5zZIJmQHqSz8d0xEHXO/6QkDzo2z7WN70mjVjOSjDPrQzj
         v3HALSn4twgfz2FdbNk6l4GBYfoaMWqi/YiSJ/Fu6tYQbVh5242dK3h+mJBxSnXlALUV
         uJO/eIlyVe5K1AjcEK8oqYVhOKsxWw0R5zowd15VsE7pqg/H2BnP7l9Twy/g6NY9H9HM
         TVNK7fFUbOP58/IGQeb+O9qHIHzn6fBXcmTk/GnDSf2zcFbrx8fsb+UEJrCrSF06DywY
         hIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PZNVY9+03dEFejIwzLUj2PbaiVC1vy5FYIvkJizW4dQ=;
        b=DQuUJUcDJqSOw+57jqzMjFLhowpKs0y4TVYQ+jWqHGOC4xGaX0l9NJ8FPjssubZymf
         Pm5FbOUVA0Og3GXvFpEH5ZZfVs/0lItXWXFHRah3eReUmBwVbyEDnWPPMIKvJxRZwTkp
         CZWq+tsmLf5XE8WMlIR7D26EmiUp1SFLIuBEPoLXvdBkajMp4uklDJ7/1sJs6qKpeYTQ
         hV1EJ9wRPhnaA5ZMZnV8hdT7hS2k/jeJS++Ce1gQI+xxkJTOSRlLw+hYb8Ts9h6Ba4ek
         4NiS1CznOIZEfOgAfNuBMR8jp+/c0lXTLtrdAA0twjAuWZUR4UOR+/cXkwe9rCngtPVf
         mx6w==
X-Gm-Message-State: AOAM531vcenzjQGHtIrORg3BPDLQ7Wo4xcMjJTi19JJdaopvdvUwYVbq
        vz2fISWMKw2JCMjaUIxSdicTMTYqA5UuwiMm8B1HeA==
X-Google-Smtp-Source: ABdhPJzdBbddli4+dHgpML9E8V8zH8wRcIUvFDly89JkVjxpJyrwxoG82YtIxjNz4+uZvgEakw7l+ou6zPMFsmdliKM=
X-Received: by 2002:a05:651c:545:: with SMTP id q5mr833343ljp.202.1637630470541;
 Mon, 22 Nov 2021 17:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20211123001020.4083653-1-almasrymina@google.com>
In-Reply-To: <20211123001020.4083653-1-almasrymina@google.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Mon, 22 Nov 2021 17:20:59 -0800
Message-ID: <CALvZod6gy6HNq5zmjwpOfG2K5RwCDnyBEPBr1wK8H6nk77UM9A@mail.gmail.com>
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
        Muchun Song <songmuchun@bytedance.com>,
        David Rientjes <rientjes@google.com>,
        Jue Wang <juew@google.com>, Yang Yao <ygyao@google.com>,
        Joanna Li <joannali@google.com>,
        Cannon Matthews <cannonmatthews@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 22, 2021 at 4:10 PM Mina Almasry <almasrymina@google.com> wrote=
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
>

Reviewed-by: Shakeel Butt <shakeelb@google.com>
