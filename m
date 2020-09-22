Return-Path: <SRS0=bcQJ=C7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68DFC4741F
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 10:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DA4B239CF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 10:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="ZtgOaPqm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgIVKYs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Sep 2020 06:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgIVKYs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Sep 2020 06:24:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31BCC0613D0
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 03:24:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so13638652ljg.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g5wJkgiy/5FUVTvT1Ox6eVPIWc3NhBDnEL+aZwGUv7Y=;
        b=ZtgOaPqmXy1A+Gbcwyx2WDHIh7QWWMV6+7AyiGVfXG59CKMLwIW2QZN4PY2kq21Tza
         H/X+ct31ngIt+7wS3O7ROOUvcaUpup8Dbv+Ly1LggaWmUnBzAqLyYATz2WbmFpkmDrXm
         AMPTCfrdy03wZTWDdlin2/sp+zqfx0M6mqn28RqJ0HBH7rVGFbcCSyFQ++I3f+wfehPY
         52GRZKGV27KnUlbl9VCEdzjFVC8ApeVroVdRtAm9vN8YD9MQPMd1Vgii+dxp/L3CRb1K
         Z4w4OlZeGH4w6ZbCl6wnq9J76mbtLsbIyGD/DGC9SxxJFiYUYVf0zRrb09OdoNwYEM2e
         I+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g5wJkgiy/5FUVTvT1Ox6eVPIWc3NhBDnEL+aZwGUv7Y=;
        b=VKqRVkKryFl2c8IubXabe6nTXFwrp0r4Miw4V22IUduGj8ccjrrchIV+juWfNaw0DC
         B8QrlqfyLYw0+u8yNkpdbg7F2bz7lDDmZmLHpzK4kBHviOwEpDkSmgogvaTyUuCligJC
         Vq1w5OE4Pxs17yBywY6tTzSU45kNdqgBcH291AskZXj279AMU1DLMBm2WzQ6V15RbV/q
         Jof2iNfaqS4D5DDxBF7/aDnn4N70lEH7khIDhMo6eKeliSSiRgVzCaqQkxMHvRUEOXjO
         MmPyTnSRsM1/3ZZ/17XjG+cmt049d6iV7ZE2tc4T5uamdY2PZbmtAqrMgMJK5iymV5P2
         wvtA==
X-Gm-Message-State: AOAM531qB3qk9e+8QtxOJVMiq18YgskN/INglLJhi86gwSVLcaDO1ae6
        ZCai+/B7UlF32GAx7I6XK7/Xme0Q3/ahIVQpaGM33Q==
X-Google-Smtp-Source: ABdhPJxXgZA7Wz+QbkdSrznteFqsjG1l1yak8212eYOgy3YfDUn51qAkpOY4//6idh0NbD3pHLC0kbbYv+E8XlP7zWI=
X-Received: by 2002:a05:651c:1203:: with SMTP id i3mr1217853lja.382.1600770286046;
 Tue, 22 Sep 2020 03:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200921080255.15505-1-zangchunxin@bytedance.com>
 <20200921081200.GE12990@dhcp22.suse.cz> <CALOAHbDKvT58UFjxy770VDxO0VWABRYb7GVwgw+NiJp62mB06w@mail.gmail.com>
 <20200921110505.GH12990@dhcp22.suse.cz> <CAKRVAeN5U6S78jF1n8nCs5ioAdqvVn5f6GGTAnA93g_J0daOLw@mail.gmail.com>
 <20200922095136.GA9682@chrisdown.name>
In-Reply-To: <20200922095136.GA9682@chrisdown.name>
From:   Chunxin Zang <zangchunxin@bytedance.com>
Date:   Tue, 22 Sep 2020 18:24:35 +0800
Message-ID: <CAKRVAePisoOg8QBz11gPqzEoUdwPiJ-9Z9MyFE2LHzR-r+PseQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] mm/memcontrol: Add the drop_cache
 interface for cgroup v2
To:     Chris Down <chris@chrisdown.name>
Cc:     Michal Hocko <mhocko@suse.com>, Yafang Shao <laoar.shao@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>, kafai@fb.com,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
        Cgroups <cgroups@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 22, 2020 at 5:51 PM Chris Down <chris@chrisdown.name> wrote:
>
> Chunxin Zang writes:
> >My usecase is that there are two types of services in one server. They
> >have difference
> >priorities. Type_A has the highest priority, we need to ensure it's
> >schedule latency=E3=80=81I/O
> >latency=E3=80=81memory enough. Type_B has the lowest priority, we expect=
 it
> >will not affect
> >Type_A when executed.
> >So Type_A could use memory without any limit. Type_B could use memory
> >only when the
> >memory is absolutely sufficient. But we cannot estimate how much
> >memory Type_B should
> >use. Because everything is dynamic. So we can't set Type_B's memory.high=
.
> >
> >So we want to release the memory of Type_B when global memory is
> >insufficient in order
> >to ensure the quality of service of Type_A . In the past, we used the
> >'force_empty' interface
> >of cgroup v1.
>
> This sounds like a perfect use case for memory.low on Type_A, and it's pr=
etty
> much exactly what we invented it for. What's the problem with that?

But we cannot estimate how much memory Type_A uses at least.
For example:
total memory: 100G
At the beginning, Type_A was in an idle state, and it only used 10G of memo=
ry.
The load is very low. We want to run Type_B to avoid wasting machine resour=
ces.
When Type_B runs for a while, it used 80G of memory.
At this time Type_A is busy, it needs more memory.

Usually we will reclaim the memory of B first for Type_A . If not
enough, we will
kill Type_B.
