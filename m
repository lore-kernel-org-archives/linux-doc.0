Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F1AC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 19:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236078AbiAKTfR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jan 2022 14:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235731AbiAKTfQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 14:35:16 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51279C06173F
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 11:35:16 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id t24so428114edi.8
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 11:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=72nCaH0D5cVWOpCSRc18GR2eFwD5HF2lWhLZ438H8+E=;
        b=IbI2Ue6xwevdXzForB3sPC7JLpGCLW4aJaiaqGPQM519ZpN4Iw53D7dK6TEvItwJQM
         lU0w7yPNWbufVbo7aTy0WNF/06ot4HROv5RcW7EH+B/47POEIinAhzsJIzijm2pqH0rA
         32W/JrQJcTgkaHK2M1qJ6iERelYscbkX2JYhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=72nCaH0D5cVWOpCSRc18GR2eFwD5HF2lWhLZ438H8+E=;
        b=eIPAw/KWyZtFJfGIwqRerKiKp7Ky1YTM00VsRAy6AibAfkPuqiN24bEKHZN/GRCUcE
         MesS3qthDIHnqL0J3DJ1/6Wr3AMaXSDQwoJ6o9h0AfDLTMHv/QOGGYP2GvMtpK6LWA+s
         IwQTn7ejkppXAHn6V9PyXDcuu3NA6tlm9KR0reh7sQFGlYRrwlZq7FYvAZQH4DYbaRjL
         qwC0y2PXJFy2z/hh4dE76zd4fMOpN/TJALkD4CEwvrwNDYfj3GEvMYTmNkPNgO2q1jhf
         slVOONzybxuGZ4aRqDBde78ExrPaqj+yvW43dWNY0kS4wgi/OJEciqB2/z0v5V0MgJ1P
         ArNA==
X-Gm-Message-State: AOAM530ynjG0ZYs64oMwsBzGO7lY1rsf6eejvJYQSpA7k0DzHWNwTL4M
        GxxjcKaU123iLMT4sgLmj3c3Z0NQEqFblzGGMJY=
X-Google-Smtp-Source: ABdhPJyilc41GTRoX/HyaUgBoEJMnXTjjU1FGjW8/B87PXa88djb2eeK5ZHX0XZHOfc4LRdjJ2ga2Q==
X-Received: by 2002:a05:6402:518d:: with SMTP id q13mr5752544edd.377.1641929714743;
        Tue, 11 Jan 2022 11:35:14 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id 26sm3858054ejk.138.2022.01.11.11.35.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 11:35:12 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id h10so192745wrb.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 11:35:09 -0800 (PST)
X-Received: by 2002:adf:c74e:: with SMTP id b14mr5117431wrh.97.1641929709117;
 Tue, 11 Jan 2022 11:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20220111071212.1210124-1-surenb@google.com> <Yd3RClhoz24rrU04@sol.localdomain>
 <CAHk-=wgwb6pJjvHYmOMT-yp5RYvw0pbv810Wcxdm5S7dWc-s0g@mail.gmail.com> <CAJuCfpE3feNU=36qRUdCJsk41rxQBv1gRYy5R1dB1djMd0NLjg@mail.gmail.com>
In-Reply-To: <CAJuCfpE3feNU=36qRUdCJsk41rxQBv1gRYy5R1dB1djMd0NLjg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 11 Jan 2022 11:34:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9-9mFcoaD3rdHd+HKYpyTXkkE2iJkPoTTCrp-+sD=ew@mail.gmail.com>
Message-ID: <CAHk-=wj9-9mFcoaD3rdHd+HKYpyTXkkE2iJkPoTTCrp-+sD=ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] psi: Fix uaf issue when psi trigger is destroyed
 while being polled
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
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
        stable <stable@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        syzbot <syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 11:27 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> Thanks for the explanation!
> So, it sounds like the best (semantically correct) option I have here
> is smp_store_release() to set the pointer, and then smp_load_acquire()
> to read it. Is my understanding correct?

Yeah, that's the clearest one from a memory ordering standpoint, and
is generally also cheap.

                Linus
