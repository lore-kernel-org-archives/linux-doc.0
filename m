Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FFCC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 03:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244676AbiDADkm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Mar 2022 23:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244679AbiDADkl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 23:40:41 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9853734BB5
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 20:38:49 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id h63so1802042iof.12
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hJ9w0vjGF60hV1jwTCwkmqKMT8MPf1xtJXL++UES4qY=;
        b=sdZWMtzHnJv1VHTyDpKpYUwNhjIuI9a7tcXI/FgRTIIZ5ukpZ4YE1gzZ4NIwUJ/yLW
         ontK0twBtMRgMUAuB3XoVPBxkx1u8ljBY3neVZ/ZbKwoxvvOmtITTYduYFewRSwCrzgg
         9ZgIB9ihjVZADAfyBSTxCQxVJHg0wEwL+QsxHCNc5OYHJcDV1fFk4tAcv81F2UhtPley
         Hncdj/WWY39C2l70OUJY7Tby2YvHAG4c/hVHDFx4R78Dj60TZX/eDiMRa82AM73wK7wh
         xP5FKWMZLhlqm3Z4lOn+c0+dLNADzkK1dadFETFvblqC8MQuUarqI4R43OmYEFbg22nl
         MCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hJ9w0vjGF60hV1jwTCwkmqKMT8MPf1xtJXL++UES4qY=;
        b=uHDKq2BYOZLM9j8Fq2HhRnT6RzzausFQSlGosfq76H9K2qEolhh5WJIBVCMXBhx259
         IOPw/vWIsLHfIu+IYDGDo5H66UHqAoAt/tgHWDTYEoKgEpOSs2udcSjBed8/ZP1g7xEV
         L2fDoxB2RIH58YQ5ZVz9BLPEkHmMlNsLk5DrejQsSVdvmQebF/R2taFnS/H92jDvG838
         eaRlAWRdp8hMURrZHxm1TqhNasNS3OtiMwjUsQrxEbI8gROaWAzPjXxl7aXaoiwtA1aT
         UlOSWsaeGMPsS4ZGtVtSyYBhquYGmyy4AOtOazJuqSqCkYxg9Iyw6GuTX9yk1s7vKKV7
         1xWQ==
X-Gm-Message-State: AOAM531gy/u7NRNrGQhl+UGW2J+BYt4x5tHXuYuAdEHJsJWF341t0bel
        5NSyaKnCA7pT1a5lafW7DnR2GcS7hJ5CTjGAOff7zw==
X-Google-Smtp-Source: ABdhPJxeYgYAUsseH/rAMZM0rgUWfeHewSkxHQ10KcJClxBVFbO0qRkSJr/2Qjs1IEEJ5i8mMVQVP8aUF3NyPqW/K7E=
X-Received: by 2002:a05:6638:3012:b0:317:9a63:ecd3 with SMTP id
 r18-20020a056638301200b003179a63ecd3mr4934731jak.210.1648784329202; Thu, 31
 Mar 2022 20:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220331084151.2600229-1-yosryahmed@google.com> <20220331173350.1fe09370479a4a6f916b477d@linux-foundation.org>
In-Reply-To: <20220331173350.1fe09370479a4a6f916b477d@linux-foundation.org>
From:   Wei Xu <weixugc@google.com>
Date:   Thu, 31 Mar 2022 20:38:38 -0700
Message-ID: <CAAPL-u-_Da0qe7h_o70HCz4gPtjT8_bjx4rVNdgKZh3KNruzpA@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Yosry Ahmed <yosryahmed@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 31, 2022 at 5:33 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 31 Mar 2022 08:41:51 +0000 Yosry Ahmed <yosryahmed@google.com> wrote:
>
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -6355,6 +6355,38 @@ static ssize_t memory_oom_group_write(struct kernfs_open_file *of,
> >       return nbytes;
> >  }
> >
> > +static ssize_t memory_reclaim(struct kernfs_open_file *of, char *buf,
> > +                           size_t nbytes, loff_t off)
> > +{
> > +     struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
> > +     unsigned int nr_retries = MAX_RECLAIM_RETRIES;
> > +     unsigned long nr_to_reclaim, nr_reclaimed = 0;
> > +     int err;
> > +
> > +     buf = strstrip(buf);
> > +     err = page_counter_memparse(buf, "", &nr_to_reclaim);
> > +     if (err)
> > +             return err;
> > +
> > +     while (nr_reclaimed < nr_to_reclaim) {
> > +             unsigned long reclaimed;
> > +
> > +             if (signal_pending(current))
> > +                     break;
> > +
> > +             reclaimed = try_to_free_mem_cgroup_pages(memcg,
> > +                                             nr_to_reclaim - nr_reclaimed,
> > +                                             GFP_KERNEL, true);
> > +
> > +             if (!reclaimed && !nr_retries--)
> > +                     break;
> > +
> > +             nr_reclaimed += reclaimed;
> > +     }
>
> Is there any way in which this can be provoked into triggering the
> softlockup detector?

memory.reclaim is similar to memory.high w.r.t. reclaiming memory,
except that memory.reclaim is stateless, while the kernel remembers
the state set by memory.high.  So memory.reclaim should not bring in
any new risks of triggering soft lockup, if any.

> Is it optimal to do the MAX_RECLAIM_RETRIES loop in the kernel?
> Would additional flexibility be gained by letting userspace handle
> retrying?

I agree it is better to retry from the userspace.
