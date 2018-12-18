Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43D3C7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 17:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbeLRR6V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Dec 2018 12:58:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35492 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbeLRR6V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Dec 2018 12:58:21 -0500
Received: by mail-wr1-f67.google.com with SMTP id 96so16873528wrb.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Dec 2018 09:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+iaDOFwJxyAR5yYGYbrgiGt+5bxiCLxPiRkz6B22bfo=;
        b=P0nyFp0hpST4Mrtm6m00SAJ/FkIpvcLUDNaMtzN1MZlHY5OX4H9KAE394OD002Zyd5
         lc010cbgWUQsEgdYYdrG9uN1wUsiiIEmMbwmkKLyl2erplMElduUS9xXe9yFZGCt53BI
         AfAURVkTNY+R3nWgZWhcbqObYBa+Uf+qDjSEJ5ZNXjA2Trpz/c8efxmkjMK7px6zzsIO
         EN4jLMlrXf4ypdQW3XUMf1gxYHliCjSdsxBW/Vsi9gumMMzzvBbxVvmHAy6vCJvEPeZR
         mfk4SWW6Gx7fiz1n4FDIX13fYWDCOWqXQ86x2MkRbtIK0ffQIWBmXHpi92rqpCU/E7Nz
         X6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+iaDOFwJxyAR5yYGYbrgiGt+5bxiCLxPiRkz6B22bfo=;
        b=VoEhFn2/EmslwfzvTWQBCbSE4o7kUBzyndlAgX05HGQ/idpGDTxiv4JUo+oibVPhQk
         NhCJPsuEZsD9PJy/qvSlzA+n4EMYXWHAqze1nPp0tlBGR5KH0fM0p5MZXqBB9YtTvN35
         e+Pm+RdMHH64LnyBn894CkeEgzKu68dBJoWKx4mrbEaIyuYSBPrKI3ua4FawBwYR9weZ
         Qn/lINroWWgETviWkgMa50+UsiJsbao5K+6cbwwMzIuRt2PxDHN241RCSaL2u9OsK3U6
         BhCYmcqVOLe36RcIeh6r+O5vlOXNO5/OPuCjYzIF1V3Rzz+8bNS2ELikoYv9pHa2Mp21
         4vUQ==
X-Gm-Message-State: AA+aEWaDqBlf75ZUAV/Ic+OLkRSD4DEJrHASKGgGaXvTkWLVw7acPZsN
        dDuwEuoIdcar0tzu55QRQvt99WctiEb/KpMk69cgMg==
X-Google-Smtp-Source: AFSGD/VJsQSOAk9gN5Ix0AnrVryKxds+U/SrRRYUcz/Bstf139OmUDZm8EEoBnplXoOVw86q3EeGrfndh2mrPFx/P8I=
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr15098610wru.291.1545155899310;
 Tue, 18 Dec 2018 09:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20181214171508.7791-1-surenb@google.com> <20181214171508.7791-7-surenb@google.com>
 <20181217162223.GD2218@hirez.programming.kicks-ass.net> <CAJuCfpHGsDnE-eAHY1QnX949stA3cvNA=078q1swqVnz95aJfg@mail.gmail.com>
 <20181218104622.GB15430@hirez.programming.kicks-ass.net> <20181218173000.GA4733@cmpxchg.org>
In-Reply-To: <20181218173000.GA4733@cmpxchg.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 18 Dec 2018 09:58:08 -0800
Message-ID: <CAJuCfpGQKQ9oVKdVeLNQHY2+2XTjLXb6VHDcJKAUCtSxvd68wQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] psi: introduce psi monitor
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com, axboe@kernel.dk,
        dennis@kernel.org, Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current design supports only whole percentages and if userspace needs
more granularity then it has to use usecs.
I agree that usecs cover % usecase and "threshold * win / 100" is
simple enough for userspace to calculate. I'm fine with changing to
usecs only.

On Tue, Dec 18, 2018 at 9:30 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Tue, Dec 18, 2018 at 11:46:22AM +0100, Peter Zijlstra wrote:
> > On Mon, Dec 17, 2018 at 05:21:05PM -0800, Suren Baghdasaryan wrote:
> > > On Mon, Dec 17, 2018 at 8:22 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > > > How well has this thing been fuzzed? Custom string parser, yay!
> > >
> > > Honestly, not much. Normal cases and some obvious corner cases. Will
> > > check if I can use some fuzzer to get more coverage or will write a
> > > script.
> > > I'm not thrilled about writing a custom parser, so if there is a
> > > better way to handle this please advise.
> >
> > The grammar seems fairly simple, something like:
> >
> >   some-full = "some" | "full" ;
> >   threshold-abs = integer ;
> >   threshold-pct = integer, { "%" } ;
> >   threshold = threshold-abs | threshold-pct ;
> >   window = integer ;
> >   trigger = some-full, space, threshold, space, window ;
> >
> > And that could even be expressed as two scanf formats:
> >
> >  "%4s %u%% %u" , "%4s %u %u"
> >
> > which then gets your something like:
> >
> >   char type[5];
> >
> >   if (sscanf(input, "%4s %u%% %u", &type, &pct, &window) == 3) {
> >       // do pct thing
> >   } else if (sscanf(intput, "%4s %u %u", &type, &thres, &window) == 3) {
> >       // do abs thing
> >   } else return -EFAIL;
> >
> >   if (!strcmp(type, "some")) {
> >       // some
> >   } else if (!strcmp(type, "full")) {
> >       // full
> >   } else return -EFAIL;
> >
> >   // do more
>
> We might want to drop the percentage notation.
>
> While it's somewhat convenient, it's also not unreasonable to ask
> userspace to do a simple "threshold * win / 100" themselves, and it
> would simplify the interface spec and the parser.
>
> Sure, psi outputs percentages, but only for fixed window sizes, so
> that actually saves us something, whereas this parser here needs to
> take a fractional anyway. The output is also in decimal notation,
> which is necessary for granularity. And I really don't think we want
> to add float parsing on top of this interface spec.
>
> So neither the convenience nor the symmetry argument are very
> compelling IMO. It might be better to just not go there.
