Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AEAC61DB3
	for <linux-doc@archiver.kernel.org>; Tue, 10 Jan 2023 19:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbjAJTJX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Jan 2023 14:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239877AbjAJTId (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jan 2023 14:08:33 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA19202E
        for <linux-doc@vger.kernel.org>; Tue, 10 Jan 2023 11:08:16 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4bf16baa865so165989407b3.13
        for <linux-doc@vger.kernel.org>; Tue, 10 Jan 2023 11:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eB6zDLr3jptFznjCY+cJ6LV+lGxSv6mlgWXUb4GRVLE=;
        b=kNneCXnUbGtaezFZly8EELiFvrMI8uCxra4hUNp5F8h55KzRcraX6HTcL/eoX2slxU
         5eIut2BW8V2KxE4ECFGrtM+afRxG/KTeduZVHs5S8WSaTnrTAKUpQ9LGjuGWxJrrW+Rb
         HL3W/mk5/ZWXlu153IFY6bWd5ku/c5DQ1P/WEPBZYa8NWqLe/FC6eZ+nVcj+NfNmapAJ
         hhVfZ0STKoz+rrAswTAQZmVDSFu+39MDK4KoXl6hbj290qVSa10/hwUiXT3+ysS6+4M+
         Fn8gtLHQRlRNe7nlS5w5XbzHPW/6rq2M3KUaxPGuT+9WamrHs6La624Sedcyvl8v1GSa
         pxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB6zDLr3jptFznjCY+cJ6LV+lGxSv6mlgWXUb4GRVLE=;
        b=Co7or2aaAWf3MmbeiuMDRcTAdxkwAkTFMNfkEFlmFSF7QYYcSA7PTeVjZ5s7mKjMdJ
         9COlgcu0TtAlFD/IW0ahwr0BeKAUlC+to9WgcFmxkHy7nHRocWAa/W9yOnjsqa/5SgWV
         hFf82Z3ijaL4WS7wtBYsq1/NP5FAKFEil+UbYp5or7tiK9eM0NJ5T1xzt8JXlKNAUbG5
         wZx+2zQSP8mom7f/Qng0JW8NLV4hwD9zrtCiTnVa1eSMc/ryYtYPrly+JcgVELTJBHh3
         OnEZIOW39nH+sPKhZJgvX5e8nUYpqJLCQzsL5s/dorNsm2oso8DuBdsa019mZuPNN6pG
         TMdA==
X-Gm-Message-State: AFqh2krd6E993X86MBmPzCvTRPnEhx77g7p04878SElQ1cvAQdbxVA5/
        LmHmzsx+cDxGf4hTqVdrH/sl3qPEwDAl+zzjK3GbGg==
X-Google-Smtp-Source: AMrXdXuWt8GL2cvwM/11siCYrRBKZLbeyNUoNJAwEvUjJQicN0t0jFrxPGHJ56q+FKvR1iOeW+XS0IBv7xTbyCMXxzs=
X-Received: by 2002:a05:690c:b88:b0:3e3:866c:a51b with SMTP id
 ck8-20020a05690c0b8800b003e3866ca51bmr218703ywb.439.1673377695560; Tue, 10
 Jan 2023 11:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com> <20230109213809.418135-2-tjmercier@google.com>
 <Y70oqxejnUqkJVPx@dhcp22.suse.cz>
In-Reply-To: <Y70oqxejnUqkJVPx@dhcp22.suse.cz>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Tue, 10 Jan 2023 11:08:04 -0800
Message-ID: <CABdmKX3hBX1O8fJ2Zz0ajL=f+tROqWe-Kzr7oPjs46qBYBXV1g@mail.gmail.com>
Subject: Re: [PATCH 1/4] memcg: Track exported dma-buffers
To:     Michal Hocko <mhocko@suse.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        daniel.vetter@ffwll.ch, android-mm@google.com, jstultz@google.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 10, 2023 at 12:58 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 21:38:04, T.J. Mercier wrote:
> > When a buffer is exported to userspace, use memcg to attribute the
> > buffer to the allocating cgroup until all buffer references are
> > released.
> >
> > Unlike the dmabuf sysfs stats implementation, this memcg accounting
> > avoids contention over the kernfs_rwsem incurred when creating or
> > removing nodes.
>
> I am not familiar with dmabuf infrastructure so please bear with me.
> AFAIU this patch adds a dmabuf specific counter to find out the amount
> of dmabuf memory used. But I do not see any actual charging implemented
> for that memory.
>
> I have looked at two random users of dma_buf_export cma_heap_allocate
> and it allocates pages to back the dmabuf (AFAIU) by cma_alloc
> which doesn't account to memcg, system_heap_allocate uses
> alloc_largest_available which relies on order_flags which doesn't seem
> to ever use __GFP_ACCOUNT.
>
> This would mean that the counter doesn't represent any actual memory
> reflected in the overall memory consumption of a memcg. I believe this
> is rather unexpected and confusing behavior. While some counters
> overlap and their sum would exceed the charged memory we do not have any
> that doesn't correspond to any memory (at least not for non-root memcgs).
>
> --
> Michal Hocko
> SUSE Labs

Thank you, that behavior is not intentional. I'm not looking at the
overall memcg charge yet otherwise I would have noticed this. I think
I understand what's needed for the charging part, but Shakeel
mentioned some additional work for "reclaim, OOM and charge context
and failure cases" on the cover letter which I need to look into.
