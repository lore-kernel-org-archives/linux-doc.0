Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F0937D088
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 21:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbeJCEB7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 00:01:59 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35898 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbeJCEB6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 00:01:58 -0400
Received: by mail-pl1-f195.google.com with SMTP id p5-v6so2342565plk.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gc3s07iM3pQIvBZa1SHfGkYWxRjC4f+bG2P2S9qpooA=;
        b=Q4UURow2DV9n4jD288bZNvaxcGcHUXGbzvxvKTP07lEjNumF4Kwj5ZojjiHN4R4fvB
         jZw9C6KgFSlIrFRIwYAOeAhC9RsVi/od1XdBSkIkKLxIRXCJzy71usuZ0vtSvF3scoYv
         ma66au09gZmDoVRE/6KkegZZpRvUAHf3PJEmwoxOyZQGrKC4NEOyDYp1YeEZHBgRaBu2
         4hl730P/7aOrX+gcvCzid387wiULpXX6/fW/ybYFpEYJmjf6roNgPYcmC7a/PtRpiS6W
         0Kxe1WTmd6RJ3YpjDwhwwBlGxqNtuA7NJc8l/atFfIcCqhFTFFmPlDjogMUn/ZwlJb0a
         Ob2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gc3s07iM3pQIvBZa1SHfGkYWxRjC4f+bG2P2S9qpooA=;
        b=KOaZY7RXGHPs8eLOB0QArAH26YOvadWeMB2Z1I9/30DIwgEnsTK8mlH/tS2cb+DyXy
         mjks8ekiEvSsaym5NjkPZu+bGU5zqDqG3JG1xgXAgTdOHELOHqF5dLXsvc+245fMoiqh
         FE3xifesBgFceScTgiwbE0XYeNkL/769GUTr0dwL3ggvwAc3vnCN6RN/hrfyReeXULWH
         OPJiXaoTRGNYt3GL6GMxZVcPXAVLD+xaTEa6CVcUDyXh0RmzcX2FRZU+293OnLRTlVtv
         dsSzNfeEpebFd6o50aoTT/vwzhYlGp52c0Qa3z+J4Yo0AP3ocytTxaZmfh6fIgxcXnhc
         OMhw==
X-Gm-Message-State: ABuFfoj834a0VxUX8SY7bwW67SSoIeXxEtQ9Icv2uT8Q9dLQW1opFmhy
        bh5e1PT1TcgLvq/5nXiOGHqCyOsvKx7dNNFZT0n7Gg==
X-Google-Smtp-Source: ACcGV63JmM9OWttMlMGfF/1zeGIN8YDY9brbZ7TCqqi8/qKYWtjOouAiMK0EuMZy1d2B+54YRkr7D/DNLoZHYZ0skmw=
X-Received: by 2002:a17:902:b611:: with SMTP id b17-v6mr18446601pls.217.1538514999281;
 Tue, 02 Oct 2018 14:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72=rgT9cPWH64Tf_8gAU09EiH5FvGqFUdOjV=spVbM5m8Q@mail.gmail.com>
 <20181003071059.02b3fd6f@canb.auug.org.au>
In-Reply-To: <20181003071059.02b3fd6f@canb.auug.org.au>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 2 Oct 2018 14:16:27 -0700
Message-ID: <CAKwvOdmt4-jFv6d-ZVUH5OOvXSz38jpuNvQy-jtoSS3xEoh78A@mail.gmail.com>
Subject: Re: [GIT PULL linux-next] Add Compiler Attributes tree
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-next@vger.kernel.org, adilger.kernel@dilger.ca,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org,
        mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        sandipan@linux.vnet.ibm.com,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        paul.burton@mips.com, David Rientjes <rientjes@google.com>,
        Willy Tarreau <w@1wt.eu>, msebor@gmail.com, sparse@chrisli.org,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 2:11 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Miguel,
>
> On Tue, 2 Oct 2018 15:47:12 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > The Compiler Attributes series has been stable for 10+ days. To
> > increase testing before 4.20, I would to request it being picked up
> > for -next.
> >
> > The changes w.r.t. v5 in the LKML:
> >
> >   - Rebased on top of next-20180928, which required removing
>
> Unfortunately, trees/branches included in linux-next must be based on
> something stable (usually Linus' tree, but it could be another
> tree/branch that is included in linux-next that does not rebase).
> Linux-next itself rebases every day, so snything based on it would drag
> in a previous version of all the other trees :-(

I think of this like a branch that's force pushed to.  Can't base
other branches or trees off of it cause it's always moving/force
rewriting history.

>
> > aligned_largest, which was removed by 9503cd9cbaba
> > ("include/linux/compiler*.h: add version detection to
> > asm_volatile_goto").
>
> That commit is from Andrew's patch series which also rebases (usually
> at least every week), so you cannot depend on it.

Miguel, you should be able to drop that patch from your set then,
since Andrew's -mm tree flows into this -next tree as well, IIUC.
We'll take up that patch from there.

-- 
Thanks,
~Nick Desaulniers
