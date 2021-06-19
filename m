Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12A5C49361
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E4CF61164
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhFSGZ7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 02:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbhFSGZ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jun 2021 02:25:59 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B814C061760
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 23:23:47 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w1so79036oie.13
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 23:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g86XYumTkqevhSftkAkowJoLhtGajRxQu1ICRJSfKts=;
        b=AiAri9rbrByHK1bVXqA5i4n0sG+9/HzQeQlxk47cWkrzB91qDsqgXEWXwqRfR/qmI5
         O7J3kWdV9NTf2pj30dkdsnelW1snTjbKgAQbYOLuRWGRvaUWltWVMs1VzHVZPWluXyQi
         5aPlTiYluh+hpW27Q00Uhj9j6GhpPOJJLXr1wZhtNkUjEhGReif0cNTC1pNThtEcwjle
         3j3oMGbJVF0aUGKMYxSyHbmrO09K91xJfjwbNcMlItXJEM7EC7w04IzHUc37Q81vIPgs
         lytLMs+QRpzm9Jt+2bt5zhDWoABcGCs6z0Jls9mKdEJPpIc15MiOU0P36iLsuBrdpEOM
         QKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g86XYumTkqevhSftkAkowJoLhtGajRxQu1ICRJSfKts=;
        b=ZrEdQn4k+cu3EH6lzLUgDwZKH2Di8AbZiZam8aW1XP/6i1mj5hVaYAU1959VqeN/vT
         ljQVAspv/a25CWtQRI4/zzu7thhNSmUA/noWqem1lgSq27AvUZeDii8+0WMJ35gv8bRL
         L5VyH+nrFMyXgKfcu9xPeu4nDV+ppYHoIbP1pfoeFhjBVSmTFn888ffjkSjOwARYgVHS
         GrrhARzHW7WXjf1RqDSZhrsXEYz39mCTAVm60Nf+fBpYr5TLVX+kOzKuR00eT6bFMQ71
         hOvX0bEDfLJo2pHybxN1B3+Uv2sTeX6lu8Mc3DNb3DgyuDgJg4fvHvcrU+aYAezHLXtx
         REqA==
X-Gm-Message-State: AOAM530o+u6mQmfAOaXh7NAhQVDIDO0oq4yvcnbvOu04XAkqSUaqD49B
        TKh/GZZK8ZNC2c78uatWL3OGA5e1FNwlY4cBDg498GEy6QaPhA==
X-Google-Smtp-Source: ABdhPJzFUFNpegpIeES3PrgNs0oQAYXu9Zv+u3+jjIWrBmz2eX3sDR9vbpC4yUPQd/zVVMKtGRueFOAVUjoCXlPod9Y=
X-Received: by 2002:aca:ba06:: with SMTP id k6mr9924648oif.70.1624083815429;
 Fri, 18 Jun 2021 23:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com> <20210618233023.1360185-3-ndesaulniers@google.com>
In-Reply-To: <20210618233023.1360185-3-ndesaulniers@google.com>
From:   Marco Elver <elver@google.com>
Date:   Sat, 19 Jun 2021 08:23:23 +0200
Message-ID: <CANpmjNNK-iYXucjz7Degh1kJPF_Z_=8+2vNLtUW17x0UnfgtPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for
 GCOV and PGO
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 19 Jun 2021 at 01:30, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> We don't want compiler instrumentation to touch noinstr functions, which
> are annotated with the no_profile function attribute. Add a Kconfig test
> for this and make PGO and GCOV depend on it.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  init/Kconfig        | 3 +++
>  kernel/gcov/Kconfig | 1 +
>  kernel/pgo/Kconfig  | 3 ++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 1ea12c64e4c9..540f862b40c6 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -83,6 +83,9 @@ config TOOLS_SUPPORT_RELR
>  config CC_HAS_ASM_INLINE
>         def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
>
> +config CC_HAS_NO_PROFILE_FN_ATTR
> +       def_bool $(success,echo '__attribute__((no_profile)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> +
>  config CONSTRUCTORS
>         bool
>
> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> index 58f87a3092f3..19facd4289cd 100644
> --- a/kernel/gcov/Kconfig
> +++ b/kernel/gcov/Kconfig
> @@ -5,6 +5,7 @@ config GCOV_KERNEL
>         bool "Enable gcov-based kernel profiling"
>         depends on DEBUG_FS
>         depends on !CC_IS_CLANG || CLANG_VERSION >= 110000
> +       depends on !X86 || (X86 && CC_HAS_NO_PROFILE_FN_ATTR)

[+Cc Mark]

arm64 is also starting to rely on noinstr working properly.

This should probably be a 'select ARCH_HAS_GCOV_PROFILE_ALL if
CC_HAS_NO_PROFILE_FN_ATTR' in the relevant arch/../Kconfig.

Alternatively, using:
https://lkml.kernel.org/r/YMcssV/n5IBGv4f0@hirez.programming.kicks-ass.net

But I'd probably not overcomplicate things at this point and just use
ARCH_HAS_GCOV_PROFILE_ALL, because GCOV seems to be a) rarely used,
and b) if someone decides to selectively instrument stuff like entry
code, we can just say it's user error.


>         select CONSTRUCTORS
>         default n
>         help
> diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
> index d2053df1111c..26f75ac4c6c1 100644
> --- a/kernel/pgo/Kconfig
> +++ b/kernel/pgo/Kconfig
> @@ -8,7 +8,8 @@ config PGO_CLANG
>         bool "Enable clang's PGO-based kernel profiling"
>         depends on DEBUG_FS
>         depends on ARCH_SUPPORTS_PGO_CLANG
> -       depends on CC_IS_CLANG && CLANG_VERSION >= 120000
> +       depends on CC_IS_CLANG
> +       depends on CC_HAS_NO_PROFILE_FN_ATTR
>         help
>           This option enables clang's PGO (Profile Guided Optimization) based
>           code profiling to better optimize the kernel.
> --
> 2.32.0.288.g62a8d224e6-goog
>
