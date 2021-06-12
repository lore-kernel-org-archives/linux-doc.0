Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3284AC48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 22:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FA9D610C8
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 22:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhFLWvW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 18:51:22 -0400
Received: from mail-ej1-f47.google.com ([209.85.218.47]:33306 "EHLO
        mail-ej1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhFLWvU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 18:51:20 -0400
Received: by mail-ej1-f47.google.com with SMTP id g20so10124761ejt.0
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 15:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGHIR4/0sog9+QR1vgYyGt5rSfZQ7hXnNFmBCZsNQSk=;
        b=lC+cdrowzchkcKAaUtHdUnGc8rpJhhCfEju3TA2/o8CiBKiosvPMgP7QSG9rGrthF/
         P4iryOOKpvsyUr9nhZBqZ9D+MUsnU9NDUoTe6q6zdZXxIwv+V4JHcEL3g0h5zefAnYU9
         uYkSgVlKtdJKXQGQ9l87vB3tQ8+8f+kgXVfX0ai1cCuqMMPnBlH3afaR9oELkVHB6Cqi
         q+rQTncUITPSytCVm03VlE8vlSuYkexxAoq/c9uB6VB9hcdT6+DSFm16yTbgRiFjjgpt
         x0ZBpG90T+cZIoOzntShCWYcInf26H4HbWVJDVr+NuP53d7hggxvDIZkvzsAwcPn/e7N
         w/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGHIR4/0sog9+QR1vgYyGt5rSfZQ7hXnNFmBCZsNQSk=;
        b=L9jFtODFc5DOSuJj6KXhUBiUH7gVIoJ4BFJhHsRRi2HaymiRIJjw6/p5KSEpHp6PWo
         aktLeT1wP57EzD1XiSfYe2unjbBGlo3l22brMpTF8Ya5PZ1J1IPqaegaP8PTKtOxWa8M
         hO2dHSLQFJi9fnnv6uV6GLo8pgFifjgXNWwuJCDttxiy6BCUxlIPsep9kxpJTRER8uoo
         ExBspfYF9vx5EiKZh98m/lhFfjUqXcpF/C5Y/oSZBimvKg0ifa8PpdlbP2LYszsTX7AU
         sHgKwG+oGf7nafOBJd6uzxtBCzhW9pKkDEERM740oYOrIQowZbvWBWFrQiWqs06RNGZu
         lIfQ==
X-Gm-Message-State: AOAM533ExsfZkgwHeu2ZmQHkCcspzjDnhpZwBKXDEFynAmnFB4il+nwe
        dQtHMiXe72ZNcIp9QacZgknQSP77q/YBwdbaGiZT
X-Google-Smtp-Source: ABdhPJzRAcgO7wzp2G7V21pmftTy6/ICxCnXT86ZVVRZzFnksPSe2C772+v9xZAtsTx/BWDBcpYFkhMyzJ5BmZGcHno=
X-Received: by 2002:a17:906:7052:: with SMTP id r18mr9007489ejj.449.1623538087519;
 Sat, 12 Jun 2021 15:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net> <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net> <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net> <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
In-Reply-To: <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Sat, 12 Jun 2021 15:47:56 -0700
Message-ID: <CAGG=3QUFRM85bpyjdokO93=Nem_w7-784-_qihP1P_CJMOsdqg@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 12, 2021 at 1:56 PM Bill Wendling <morbo@google.com> wrote:
> On Sat, Jun 12, 2021 at 1:25 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Sat, Jun 12, 2021 at 12:10:03PM -0700, Bill Wendling wrote:
> > Yes it is, but is that sufficient in this case? It very much isn't for
> > KASAN, UBSAN, and a whole host of other instrumentation crud. They all
> > needed their own 'bugger-off' attributes.
> >
> Now, for the "nointr" issue. I'll see if we need an additional change for that.
>
The GCOV implementation disables profiling in those directories where
instrumentation would fail. We do the same. Both clang and gcc seem to
treat the no_instrument_function attribute similarly.

-bw
