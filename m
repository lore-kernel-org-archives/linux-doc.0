Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B90C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 21:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7650561205
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 21:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbhDGVpE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 17:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhDGVpE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 17:45:04 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FA8C061762
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 14:44:54 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t22so6894495pgu.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 14:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t32TPFN7dNcai01TfPFUtOMBnlxLIFARiDUKaGnE5/w=;
        b=En0QuuXpjbv30VQDDu/QYB+aN5fxgnlMmq9zD16uWOEI1XHDszQUYXkUsH7Rpah4sc
         CgZwX4Qw6Q+VF3DyKS5NuEg3I0ytCnFHtTXWtkEp2qcQXdIN0S+xre7zXOUq1gS/AEC4
         Y0jV1OKpHFI9Zxuc8mlWGYdVzJLdg7Ehn/sT8QHFuJlNYac15Snd+OGlaFn3G61tSVd0
         JpRfi+cRUO808quk1L/9jfHZi7pgCZ0OiaY8c24ZiSPdEIgewMBfBG//imnHUcwTUB1Q
         um0fzy7BWxKnaoVWzGBFylq9/5YW1/gpeKMGy6yBl4dbNpCLp6hFXfhs4mVWOlWg4bPU
         pSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t32TPFN7dNcai01TfPFUtOMBnlxLIFARiDUKaGnE5/w=;
        b=KfjA8ZfzuoFqTj/7Ky+d8tTm02snNOzH4eHOK/oUV43JXMp0GTMJS6tWAxro5qoafc
         LOKRJIstPQGWFLpo1ZdwtjWu/wXewfnrNkBAMwDtQcCgyLBGuSvJ12xGysvoAlPv7+xx
         OAkd1UPIoqdx9FeeLJz/n4F2h6ma17z53qm1ezCbnF0ye61H9mODVS4+ppHv/8i+CeH2
         UMnqvStoof2q79bEAqCab25j/JSVoCgPLwN7WPnvb+RDVG4aVHuva1IWy+e7rTxLuB2q
         MRhOfXwcIAUK0qduhrxm2vHG9vYyLc1lqEEKfamGEn10bAcdLBplezAmBd+q4vUTcG/f
         Egvg==
X-Gm-Message-State: AOAM533O3noyHSW5DIJSwzhZwBtdH9VrVbkMwAaB0T/Q8xPGM+VUFT7+
        JaOtl2ooqNGGFqYYV2Ljz807hA2hNOFsKsHXqT6aWQ==
X-Google-Smtp-Source: ABdhPJy+4I5Xy/3IPd/QzagZHJ+it6rRdTkTc3ejhMPdYVn18bwP1T7CQ0C7ck1lIkbZ9RAa1CxgiAQCT1QWr0olVIQ=
X-Received: by 2002:a62:6451:0:b029:23f:6ea1:293f with SMTP id
 y78-20020a6264510000b029023f6ea1293fmr4670336pfb.53.1617831893704; Wed, 07
 Apr 2021 14:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <202104071419.AA35EEAF@keescook>
In-Reply-To: <202104071419.AA35EEAF@keescook>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Wed, 7 Apr 2021 14:44:41 -0700
Message-ID: <CAFP8O3LUGkxwxShp3cc_XwcLotp1aoKxH9E-tyWL+37+RBNbeg@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Kees Cook <keescook@chromium.org>, Bill Wendling <morbo@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 7, 2021 at 2:22 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Apr 07, 2021 at 02:17:04PM -0700, 'Bill Wendling' via Clang Built=
 Linux wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > profile, the kernel is instrumented with PGO counters, a representative
> > workload is run, and the raw profile data is collected from
> > /sys/kernel/debug/pgo/profraw.
> >
> > The raw profile data must be processed by clang's "llvm-profdata" tool
> > before it can be used during recompilation:
> >
> >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >   $ llvm-profdata merge --output=3Dvmlinux.profdata vmlinux.profraw
> >
> > Multiple raw profiles may be merged during this step.
> >
> > The data can now be used by the compiler:
> >
> >   $ make LLVM=3D1 KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata ...
> >
> > This initial submission is restricted to x86, as that's the platform we
> > know works. This restriction can be lifted once other platforms have
> > been verified to work with PGO.
> >
> > Note that this method of profiling the kernel is clang-native, unlike
> > the clang support in kernel/gcov.
> >
> > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimiz=
ation
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Bill Wendling <morbo@google.com>
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Fangrui Song <maskray@google.com>
>
> Thanks for sending this again! I'm looking forward to using it.

Yay. Quite excited about that:)

> Masahiro and Andrew, unless one of you would prefer to take this in your
> tree, I figure I can snag it to send to Linus.
>
> Anyone else have feedback?

I have carefully compared the implementation and the original
implementation in llvm-project/compiler-rt.
This looks great.
Also very happy about the cleaner include/asm-generic/vmlinux.lds.h now.

Just adding a note here for folks who may want to help test the
not-yet-common option LD_DEAD_CODE_DATA_ELIMINATION.
--gc-sections may not work perfectly with some advanced PGO features
before Clang 13 (not broken but probably just in an inferior state).
There were some upstream changes in this area recently and I think as
of my https://reviews.llvm.org/D97649 things should be perfect with GC
now.
This does not deserve any comment without more testing, though.

Thanks for already carrying my Reviewed-by tag.

> Thanks!
>
> -Kees
>
> --
> Kees Cook



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
