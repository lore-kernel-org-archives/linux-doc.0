Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92ECC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 02:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiAKCza (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jan 2022 21:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbiAKCza (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jan 2022 21:55:30 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B71C061748
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:55:29 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id u25so61585942edf.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+Y28XxOTbwhPxzWhN6RbihwTYYfYJcoL9vjrnUr5zE=;
        b=dUok9tPThdjODcNE51pXamu5TwIzsdpaI5zTXGTRW4tg5ulv80Dh6+vkkiIFZ/PpyT
         FkFAgWhiQVPIXAOMWzUy1TGBrsE3Nu4l6kZFbOCJZ5CN61JWBAM6rkoXCl6at0rWQxhI
         PCR0gQqsIgknv2e3sVxB+FPFIdXxYloQtZRyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+Y28XxOTbwhPxzWhN6RbihwTYYfYJcoL9vjrnUr5zE=;
        b=g1M4WttWR1Q3y9ihrnZ4q66KK5Zmx7tBtVMPKKjG3UmzTW5t6bLC1rxdXHqOjd/OwV
         7grgJNQR9ZvjdXL9Zk9+nm5ogFx7z+0WaVfG89hSTp3cBNTQSC2GMg7rSwb9NFce7gZP
         PukXCQKH+1iqOhqEQclZF7EsFUXAU7yXx4p9kMGteUychmvejZBGwA8j49Bxm841lBuM
         Z+C2GDQoP5WAvr5Ue4SeYbKuOzGjWvouqzM4jd2kq7ZDebyEzNShQ5oFUKIgOxdRKahJ
         9v/fkB/5v/USVltyRlQLsHiZXjaaaxMf9NV5CvYbcJFLIoqcSPdH4AQyj+tBbdhQvlF2
         YABw==
X-Gm-Message-State: AOAM5309kqQ759hDDnHWUIDxD2NPUQzj5uqqsQO9nNbH4zlNbCqezMRz
        iQcLpt5ehu0Ob0MCVyHdJiMBvD3bdHakghMBoGk=
X-Google-Smtp-Source: ABdhPJwdzq460WaoxTjyXjeBllUqLGusSMUPcnhXPF2YYkH6noGsg/Hu7CSmHyfDocFx+Ym2B+izbg==
X-Received: by 2002:a05:6402:4490:: with SMTP id er16mr2357983edb.203.1641869727862;
        Mon, 10 Jan 2022 18:55:27 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id p25sm4392923edw.75.2022.01.10.18.55.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 18:55:27 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso582266wmj.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:55:26 -0800 (PST)
X-Received: by 2002:a7b:c305:: with SMTP id k5mr548893wmj.144.1641869726504;
 Mon, 10 Jan 2022 18:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20220111025138.1071848-1-surenb@google.com>
In-Reply-To: <20220111025138.1071848-1-surenb@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 10 Jan 2022 18:55:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=whxmsa7mnzwe-DV6m26teV32geB-n-aKbYHXNm1k4rVwg@mail.gmail.com>
Message-ID: <CAHk-=whxmsa7mnzwe-DV6m26teV32geB-n-aKbYHXNm1k4rVwg@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: Fix uaf issue when psi trigger is destroyed
 while being polled
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Eric Biggers <ebiggers@kernel.org>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
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
        Android Kernel Team <kernel-team@android.com>,
        syzbot <syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 10, 2022 at 6:51 PM Suren Baghdasaryan <surenb@google.com> wrote:
>
> Fix this by disallowing to redefine an existing psi trigger. If a write
> operation is used on a file descriptor with an already existing psi
> trigger, the operation will fail with EBUSY error.

Looks fine to me. Eric?

I assume I'll get it through the usual channels unless there are issues,

                Linus
