Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B96C2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 18:08:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2635611AB
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 18:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhFNSKR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 14:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbhFNSKQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 14:10:16 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837F6C061574
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 11:08:13 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id l4so8863933ljg.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/XB3mh4kqA0R3Mq5xG+IQPk2u072QCh1Aa1N8SVimI=;
        b=gNoMBqwIekxVN4ZTQA2lb+R20pn6emj+cRv+063F8GUQEh+FfehSxGO7Xfa3xVcU3y
         JNiHA/bieZlQ0jgmetM3eerqFAtGCVDc8wlzQ3M/mwfNPBGiWljejiloap0qpolaWRwM
         zyFvn32ZAv4OTwgqbKcKUFRfB2w3GYsBl0Ohsk903f3S2aJ8ihqajen4jcWO3pTZeTl4
         m993LukbpLj1Ytei7kh8YWEerFqD3osLEVw7AF8D6GGia1vZCt8v8SzbH6rbqhKztVFJ
         7UMl8nAKNXJuvuZDmibTlloR0VSSNTu7UEsrHWjpM6yBK+GGIpZf5DhbG3UVlYNesjYH
         dONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/XB3mh4kqA0R3Mq5xG+IQPk2u072QCh1Aa1N8SVimI=;
        b=TZWyXHDLR1aXBOC6TE7ZvdgD0jarNLkbfbT2q3wU2/3urdcebgme5qRCt+14vyzjUa
         V2dNPEPG9wymSeZKum01E0ItSXGeZfuEr9qhlUL4r5L1j6tgSjgHEO2s2H85oZ2hY5Hw
         BWex430lstu3d5P4vLNEssG03QrrRbjorAJH8S+wwae9lIhFqxMdcmydu75o42prl9Sx
         jbLpsSso7U+6wqa7FdI8o+2hYcAxzoZAfkOCj/2uLd1rOpWlscJdYcAfV3eIe9XvfzDL
         H5pUwvuK3fyIjreRL4YSbx9e3VuTFsIfamotQQfLxTr5wPXB5VB+QJqKpTo2zaIvNllJ
         0Oew==
X-Gm-Message-State: AOAM531nwsDhCE0pKKQ4ld9A6emTFZ8pHW7ndvNN82Mni5jqoeYTACs5
        usth2Kyk1crYLrbD5MD7dzQG4t/bhOoxI8P0K1hRtw==
X-Google-Smtp-Source: ABdhPJxKUKdlT+gTIv6tps2+MYGOK2jI4OTbw6VDol/+bdJyGm1oEKl+AJBHsonScc4F4P1rTyqrJq3Fw4OFoMUrzZ0=
X-Received: by 2002:a05:651c:1111:: with SMTP id d17mr14547090ljo.116.1623694091627;
 Mon, 14 Jun 2021 11:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net> <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net> <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
 <202106140817.F584D2F@keescook> <20210614153545.GA68749@worktop.programming.kicks-ass.net>
 <202106140921.5E591BD@keescook>
In-Reply-To: <202106140921.5E591BD@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 14 Jun 2021 11:07:59 -0700
Message-ID: <CAKwvOdkiQCuWB7VrQ4T-OCdoNfqKhpLx_jtBQ_uyjVVwHSOc=A@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Marco Elver <elver@google.com>,
        Bill Wendling <morbo@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        oberpar@linux.vnet.ibm.com, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 14, 2021 at 9:23 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jun 14, 2021 at 05:35:45PM +0200, Peter Zijlstra wrote:
> > On Mon, Jun 14, 2021 at 08:26:01AM -0700, Kees Cook wrote:
> > > So, AFAICT, the original blocking issue ("PGO does not respect noinstr")
> > > is not actually an issue (noinstr contains notrace, which IS respected
> > > by PGO[2]), I think this is fine to move forward.
> >
> > It is *NOT*: https://godbolt.org/z/9c7xdvGd9
> >
> > Look at how both compilers generate instrumentation in the no_instr()
> > function.
>
> Well that's disappointing. I'll put this on hold until Clang can grow an
> appropriate attribute (or similar work-around). Thanks for catching
> that.

Cross referencing since these two threads are related.
https://lore.kernel.org/lkml/CAKwvOdmPTi93n2L0_yQkrzLdmpxzrOR7zggSzonyaw2PGshApw@mail.gmail.com/
-- 
Thanks,
~Nick Desaulniers
