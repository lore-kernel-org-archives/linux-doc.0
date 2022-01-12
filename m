Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B38EC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jan 2022 18:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355981AbiALSEO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 13:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356007AbiALSDy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 13:03:54 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193C0C061748
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 10:03:54 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id u21so13197102edd.5
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 10:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DhSCFec3TdzZgoMmjiOtfrqEeP0ETxz+5Dx8yofaKqk=;
        b=ACYcmQYX22hOF9eHsSpz63wI3cG/WXMRlzAlN2whKAaJhPR9GPIxx9qzxyuqNMjA+7
         rZivP0MyhKT2m5OXVlrJzc4KyBRcDy7L36J2mi7wYToYCPNHQweiy7y/QtQh9y37tYtS
         Q95EMM11LnVKXAhQsE7YRBQZnsA8tqq/mJJvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhSCFec3TdzZgoMmjiOtfrqEeP0ETxz+5Dx8yofaKqk=;
        b=KQHkLGDMH0+bxS09cu7k0uIHZVFEWNgPvJy8bMJ8YI8HEdFUeTdjafUQjgMza/frXp
         3nMjrAGjYgBs515gd9TBK6L77JdOwjcqdUZJEmDi4UaWbEmTjQWbJv5WwtMWfMG+UQKu
         l/euj1GtubFeuynNLtJH52rzS0EQ7LkrRyp7D2KeRBwnF6P0z1eTyvm7hojTpn7xf2p+
         Z3+uFcpMincsglxJOvE4qUS+KvxaqgZ2hSHLAlXEayzGTvYLg0q6A0W3Xke+fdHwj9MQ
         AFFfU1itQuMod2gsXx6m2vX4L6V7rEBddC4MI8lPGRcCRH2IonjMVJE2PVSgrs0+kg5c
         tNUQ==
X-Gm-Message-State: AOAM5307dzXy7TOfoR/I8X/sfQiv4UazGootZEHJAQU17VCIUJGn8nMy
        vB5NozM4phit8xfYlPBSRifVonJdanq5jvWu3iE=
X-Google-Smtp-Source: ABdhPJwxgM+7U9JRyX/u4kYauRAzJ/TzIYqnxFofx3HUZO0IaioVYJ1MXJv4HR6JCRqePeSMRjyD8Q==
X-Received: by 2002:aa7:df13:: with SMTP id c19mr727736edy.233.1642010631514;
        Wed, 12 Jan 2022 10:03:51 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id qb30sm139911ejc.119.2022.01.12.10.03.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 10:03:51 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id q141-20020a1ca793000000b00347b48dfb53so2149529wme.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 10:03:50 -0800 (PST)
X-Received: by 2002:a05:600c:4f13:: with SMTP id l19mr7775750wmq.152.1642010629913;
 Wed, 12 Jan 2022 10:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20220111232309.1786347-1-surenb@google.com> <Yd6niK1gzKc5lIJ8@hirez.programming.kicks-ass.net>
In-Reply-To: <Yd6niK1gzKc5lIJ8@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 12 Jan 2022 10:03:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiNQD6o-REKoZv_5cHWrGmsT_KgduYCsLdLqbdHWUKcdw@mail.gmail.com>
Message-ID: <CAHk-=wiNQD6o-REKoZv_5cHWrGmsT_KgduYCsLdLqbdHWUKcdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] psi: Fix uaf issue when psi trigger is destroyed
 while being polled
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Eric Biggers <ebiggers@kernel.org>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cgroups <cgroups@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        syzbot <syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 12, 2022 at 2:04 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Thanks, I'll go stick this in sched/urgent unless Linus picks it up
> himself.

I'll let it go through the proper channels, it's not like a few days
or whatever will make a difference.

               Linus
