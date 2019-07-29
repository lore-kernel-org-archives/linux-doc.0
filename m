Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B1157D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Jul 2019 20:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbfG2ULZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Jul 2019 16:11:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34878 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729890AbfG2ULY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jul 2019 16:11:24 -0400
Received: by mail-wr1-f65.google.com with SMTP id y4so63223443wrm.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2019 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lBs2XH1stLT9RSq/8zHtTMENwlKXXKYro8AoKfkCRxU=;
        b=ESrg15vvIX2QliCdNOmD818metRcak3U4lgoyUOfJF5b5qpQcOFHk0C5rbPIKNw1qq
         1/YcdaNMcX/6zvstceGw4yvHU1Rf/KH+kAvcYEprQkif0v58fm2J4T4LKWE+ujWj8ACl
         /6Cn7fMp0R/3d3Q5rNzDwfnJ6yr6pFBaNu9F2uUh7KXxX0hA0Of4ytteaddwvPWjr2ai
         IHueRhtmbIcmgRtC4iBgos3HVH7sOSkTIh66bPU+d5V7kcxvFHzIMKQYVyEDKop8Cbvo
         mqpZn0O4GvhScLBcknDAPX3u/sNr6wdE8yeeZnp6BC2CP44/ofXvyC6F0UELTqafJhKM
         SJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lBs2XH1stLT9RSq/8zHtTMENwlKXXKYro8AoKfkCRxU=;
        b=ohYBXLIUXRYuWhqj60Xb6s42mbsd31sP0u+q62Hvo17D/pbJA0ew9Hm5fTNC8X2PiM
         3BfAS2F8yoXruvLNotz5s5lj3qglQqNkH2ZjzEQbuBxej/qWfvEZXnQtXDLpeOzZ3IUI
         Vp9ps7t3n5j5iGMUOfCkM3VnwuBHzkBKyuGv1HF00k/RtQDBWxhJTo+mpDWu4qx+RYlD
         Bq78pWziKD5dR5fLKnIyKk44mzMX2Oo6+0WgzAa1PY3pEu+H09UQCCyCafojLoT1m3ON
         wt9jY+Swh0TMoqC9VZ1iC7d0MlPUZRZ02QUIShyUjnSc7Jhu4atqIPssf29vMEFpjWKQ
         xHjw==
X-Gm-Message-State: APjAAAUqZ5meqIOy+grBPE5+i6T4/6DfFIctp/WB2WLKzIxwrtRi4CZp
        wDW3K8hfOUXCB8Ybk0AJPvYdPeM36QmVVgn2SyBX9w==
X-Google-Smtp-Source: APXvYqxFKlb66t4oKcBaMb48wYrx+/EeOSc5Ncb8ZjsZuiaefe638OkpcAYIjYItOQWGw5Iw4GJc21WafT9t8sruOeQ=
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr126611598wrs.93.1564431082241;
 Mon, 29 Jul 2019 13:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190729194205.212846-1-surenb@google.com> <20190729195614.GA31529@kroah.com>
In-Reply-To: <20190729195614.GA31529@kroah.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 29 Jul 2019 13:11:11 -0700
Message-ID: <CAJuCfpFRsmN0gim_4fXNouzOxZWSJO6xkpLzoGvbBUE8tMOECA@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: do not require setsched permission from the
 trigger creator
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     lizefan@huawei.com, Johannes Weiner <hannes@cmpxchg.org>,
        axboe@kernel.dk, Dennis Zhou <dennis@kernel.org>,
        Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>,
        Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 29, 2019 at 12:57 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 29, 2019 at 12:42:05PM -0700, Suren Baghdasaryan wrote:
> > When a process creates a new trigger by writing into /proc/pressure/*
> > files, permissions to write such a file should be used to determine whether
> > the process is allowed to do so or not. Current implementation would also
> > require such a process to have setsched capability. Setting of psi trigger
> > thread's scheduling policy is an implementation detail and should not be
> > exposed to the user level. Remove the permission check by using _nocheck
> > version of the function.
> >
> > Suggested-by: Nick Kralevich <nnk@google.com>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  kernel/sched/psi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> $ ./scripts/get_maintainer.pl --file kernel/sched/psi.c
> Ingo Molnar <mingo@redhat.com> (maintainer:SCHEDULER)
> Peter Zijlstra <peterz@infradead.org> (maintainer:SCHEDULER)
> linux-kernel@vger.kernel.org (open list:SCHEDULER)
>
>
> No where am I listed there, so why did you send this "To:" me?
>

Oh, sorry about that. Both Ingo and Peter are CC'ed directly. Should I
still resend?

> please fix up and resend.
>
> greg k-h
