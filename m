Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5729C49EAB
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 19:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2F09613EE
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 19:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhFXTix (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 15:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhFXTiw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jun 2021 15:38:52 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF57C061574
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 12:36:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id f13so9268549ljp.10
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DBxJ+5KzUAKH3jFhz3Iwj54r7FIMmamDMI5BPojMuJc=;
        b=dYwgZ9h27ndDmBg/0m6WgW1LArwbOWa26M1LqVXc1zXOs48DVQSrbhzbUHQNug9tkZ
         q3D/blHDOzdEPPo3bUbcejYyoWtIr90hLC1edUbfhTBynk7E/lW8P7SUK5oshAMiOmFX
         FeRaN/eolsikGjmZPU9y6AUewwJAliXCcfTymEfHi6vZeTmBr6Za33JjUQEKoIma9MIH
         60/9CviuXnS+3c4YVp9qGGcMQhNtn2lmtSgyFcUHq31vytlepnUZklgtNq/7dhZtrUUg
         hpgep8ai+pEDiiw3BFbc+F7+MngfSWxqoXsDHvEwoPx91W+DP0I0ZSb+JRDZjl/qFqfB
         BW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DBxJ+5KzUAKH3jFhz3Iwj54r7FIMmamDMI5BPojMuJc=;
        b=kjFK+aTi8vP05POo1e0xw2sGbgUw8FWszMtVddHyDilPRfcrX25mQGTbvHf5txf/fc
         lsipPM3rd1dRmwEUWu1yyqcq0JFS8NPxc9hS69a0rDANiV2BWSfB7kCUFJvjjLCDHMF5
         Wh2QFZIOnkIgMnKr12pNMAX0oKIC8WNlzsOiyler/mQrP2u91K3bHV19lxaebKW/ADLE
         DrKy3qiwM9ceZ0k0S41qs65kUh+evSqmi2EmK/tAYsMFgv/DLJRSf1/BWInSXWrK0P6Q
         HOw+P8LsVL9AM+8a9a7wztdkLSckt1bIxkfKXIAlVYFszSnJC6B6K0xYTd6rA48X9KS7
         0v6w==
X-Gm-Message-State: AOAM5303sJD78GT7r7VHD1FGVOjzq1mWKR+tKTWQEY8pNzQ5e1td0oJq
        CS1aCcKOOIePc1Yb8j2mJg3eN+vCKmCpbY/Liugs8A==
X-Google-Smtp-Source: ABdhPJzoUDYNMlMYAnSTK9W/UbT/cdGV/rjMVbZjtFi2SSd63uN2ZxNPWm3CGKEFKMm5AO4RdSLIU6HwJ2an34Rr8QQ=
X-Received: by 2002:a2e:92cc:: with SMTP id k12mr5168790ljh.116.1624563389245;
 Thu, 24 Jun 2021 12:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210621231822.2848305-1-ndesaulniers@google.com> <162442894704.2888450.8087873021886781652.b4-ty@chromium.org>
In-Reply-To: <162442894704.2888450.8087873021886781652.b4-ty@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 24 Jun 2021 12:36:18 -0700
Message-ID: <CAKwvOdkC4E5AvyrWzzN4q3xjceHZG3xQSjO6tp6vGK5Yc204YA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] no_profile fn attr and Kconfig for GCOV+PGO
To:     Kees Cook <keescook@chromium.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-arm-kernel@lists.infradead.org,
        Nathan Chancellor <nathan@kernel.org>,
        Fangrui Song <maskray@google.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Bill Wendling <wcw@google.com>, Arnd Bergmann <arnd@arndb.de>,
        johannes.berg@intel.com, clang-built-linux@googlegroups.com,
        Jonathan Corbet <corbet@lwn.net>,
        Martin Liska <mliska@suse.cz>,
        linux-toolchains@vger.kernel.org, x86@kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 22, 2021 at 11:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, 21 Jun 2021 16:18:19 -0700, Nick Desaulniers wrote:
> > The kernel has been using noinstr for correctness to politely request
> > that the compiler avoid adding various forms of instrumentation to
> > certain functions.
> >
> > GCOV and PGO can both instrument functions, yet the function attribute
> > to disable such instrumentation (no_profile_instrument_function) was not
> > being used to suppress such implementation. Also, clang only just
> > recently gained support for no_profile_instrument_function. GCC has
> > supported that since 7.1+.
> >
> > [...]
>
> Applied to for-next/clang/features, thanks!
>
> [1/3] compiler_attributes.h: define __no_profile, add to noinstr
>       https://git.kernel.org/kees/c/380d53c45ff2
> [2/3] compiler_attributes.h: cleanups for GCC 4.9+
>       https://git.kernel.org/kees/c/ae4d682dfd33
> [3/3] Kconfig: add ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
>       https://git.kernel.org/kees/c/51c2ee6d121c
>
> Note that I've tweaked the series slightly to move the PGO Kconfig change into
> the PGO patch.

Ok, LGTM.
-- 
Thanks,
~Nick Desaulniers
