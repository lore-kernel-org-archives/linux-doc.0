Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 695E87D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 08:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfE2Ixp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 04:53:45 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:37766 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfE2Ixo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 04:53:44 -0400
Received: by mail-it1-f194.google.com with SMTP id s16so2290222ita.2
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fk93ITL8R4mrLU9REN4UKK4IhmKV6EO0365BfuSaHXw=;
        b=iag1iqklG59C7CBe1Q1yLiAwrdIea1ur40jUv0F6T5dEfMY0jxy+j++u5JmUBuntoa
         EwUGR6EkVeDx7XcFiDHZsKB495YcnzJoAArBNdkNW4RU2DfJ77hULVO9OsQhthuc2j18
         R/bC8O07j3uVjmmzTeABEZZIjNCjaC95M+bimnrGjlhNPegpFdCacpo8SW5INIF0Isog
         hMAuYUUq10E3RD5FJL6QV5ovsTZePNTA0Z25SfUIKy1eCMeM7oWOZyAHr7X4gSVs6NRX
         KLhadZKjYWWkGnCpOLSTt6DCK+sMm5rQpAswy1Gn0wiuv4Tg2Tv6I1FZuLC3fEdSklSe
         zleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fk93ITL8R4mrLU9REN4UKK4IhmKV6EO0365BfuSaHXw=;
        b=K34PcGCJ5uVhNSUc4IhqY/ewcqYSCHdge57fCq1vkvkmniBTA4AtmDOQWaoRDxXM4H
         yy1v8TIru9bzaWmE3puVeuR8SP9Znfs8jwvPBqgJ+WT+AY0YuXSiZ/0Zn//JTa+k+l5M
         +m62MDcfdDNMmcqTJ9Qm/ZFS+zlvyJDymCXp0ig71A+8iRuwOMRBdyPiSMCCdKCxI1U0
         ogOu/68LOEYm/ErWHY0/g7Y9D/WPOcIVM8zd5Ob6Yy6Tq+rIqCpsg+dVLSMW4f0cOP2q
         kJbesQyi+Y4nXQ/koJd+JchEkc9/jlgPRmuXTxvL7zmuhUTlAB4IvgfzBwh7Uf53t67Z
         ErhQ==
X-Gm-Message-State: APjAAAUKUAcyDR76IIv6jg0GhEjSoW9OdolcX8qrntu81qIyPIJ/Od8p
        MVizms95/Xvwf2YOc/UxdCrm6tg7foofcZkPixk5Aw==
X-Google-Smtp-Source: APXvYqwRV1Ecj1ZeYKU14oETte/gMkEfiRo03ta+hp/7w0IznzXuOVxdCcfxGLTebV18JF/VozM9amvKpyRnIkPc1M4=
X-Received: by 2002:a24:91d2:: with SMTP id i201mr6764834ite.88.1559120023781;
 Wed, 29 May 2019 01:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190528163258.260144-1-elver@google.com> <20190528163258.260144-3-elver@google.com>
 <20190528165036.GC28492@lakrids.cambridge.arm.com>
In-Reply-To: <20190528165036.GC28492@lakrids.cambridge.arm.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 29 May 2019 10:53:32 +0200
Message-ID: <CACT4Y+bV0CczjRWgHQq3kvioLaaKgN+hnYEKCe5wkbdngrm+8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] asm-generic, x86: Add bitops instrumentation for KASAN
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 28, 2019 at 6:50 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, May 28, 2019 at 06:32:58PM +0200, Marco Elver wrote:
> > This adds a new header to asm-generic to allow optionally instrumenting
> > architecture-specific asm implementations of bitops.
> >
> > This change includes the required change for x86 as reference and
> > changes the kernel API doc to point to bitops-instrumented.h instead.
> > Rationale: the functions in x86's bitops.h are no longer the kernel API
> > functions, but instead the arch_ prefixed functions, which are then
> > instrumented via bitops-instrumented.h.
> >
> > Other architectures can similarly add support for asm implementations of
> > bitops.
> >
> > The documentation text has been copied/moved, and *no* changes to it
> > have been made in this patch.
> >
> > Tested: using lib/test_kasan with bitops tests (pre-requisite patch).
> >
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=198439
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  Documentation/core-api/kernel-api.rst     |   2 +-
> >  arch/x86/include/asm/bitops.h             | 210 ++++----------
> >  include/asm-generic/bitops-instrumented.h | 327 ++++++++++++++++++++++
> >  3 files changed, 380 insertions(+), 159 deletions(-)
> >  create mode 100644 include/asm-generic/bitops-instrumented.h
>
> [...]
>
> > +#if !defined(BITOPS_INSTRUMENT_RANGE)
> > +/*
> > + * This may be defined by an arch's bitops.h, in case bitops do not operate on
> > + * single bytes only. The default version here is conservative and assumes that
> > + * bitops operate only on the byte with the target bit.
> > + */
> > +#define BITOPS_INSTRUMENT_RANGE(addr, nr)                                  \
> > +     (const volatile char *)(addr) + ((nr) / BITS_PER_BYTE), 1
> > +#endif
>
> I was under the impression that logically, all the bitops operated on
> the entire long the bit happend to be contained in, so checking the
> entire long would make more sense to me.
>
> FWIW, arm64's atomic bit ops are all implemented atop of atomic_long_*
> functions, which are instrumented, and always checks at the granularity
> of a long. I haven't seen splats from that when fuzzing with Syzkaller.
>
> Are you seeing bugs without this?

bitops are not instrumented on x86 at all at the moment, so we have
not seen any splats. What we've seen are assorted crashes caused by
previous silent memory corruptions by incorrect bitops :)

Good point. If arm already does this, I guess we also need to check
whole long's.
