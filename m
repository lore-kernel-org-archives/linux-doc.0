Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A99EC433E9
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 17:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61A472311F
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 17:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbhALRhy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 12:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbhALRhx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 12:37:53 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81202C061794
        for <linux-doc@vger.kernel.org>; Tue, 12 Jan 2021 09:37:13 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id p12so2028322pju.5
        for <linux-doc@vger.kernel.org>; Tue, 12 Jan 2021 09:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmYwXjpSpSGJIaBI6nXMPcfre/G2OFN7SFzhgu7QxWw=;
        b=a2RPjzDNhO8HodYXLbDa3bberc83Qk9BDEkIp/TLIvN9CDQNWmkgfktCTAGNqUegMk
         M4OYxj1CNE+s9lezxe9nSsk/oHP0K6ZieMYbU/IP79dqY1Gdi3Obdu8WvUe8sx6IExWs
         4/D0P4EXagL2fgNP9DY3Ua9h4Me5MQT1dPAO/y2zwcwt8PvCLB18hSJjTEBLIdaCeLuY
         0n6VC/xTSY7jOuhSF++Syldf/QvI/zSrvQMRZcATD0oCp3CGIeb0shYFH8y67v4vnbKj
         oZ37YoGufFmaH50CBJiFMua8GLd1gknoMbC7dewfpS5aCmxjd4uA/oRcPZEHIeKkVRp3
         aSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmYwXjpSpSGJIaBI6nXMPcfre/G2OFN7SFzhgu7QxWw=;
        b=TIPQLXS+y9Ru2b5d1T+IC3JGJ0gA2go0MfAsG0YOMHILS319/FDyYPVtFHxYwbZtda
         SShsT3JdFxcMMN08fxkrv6HDjCI7Fd+xeezbh1+W2HUcN4dkmYGqeDj40qFXK7prTsuV
         6gwssWhBlLowyThR1uq1MOuMkrhWeDsNXDI5MNxK4QbOfhklwiNDRA1HxatX75w9Kgwp
         YfDbjwZ8eC/b6+aT5fp10N/gSdIYFdYA15kIirPn5O6gItqj+OA7rnTjYldpMMLqn5qY
         /5VxVGBOH5kkS6CLPDAVF6FCuf9vVi4uZFAdjdGXfDBrF5PbUWcBQSsP7gXCoTe+aWL6
         /dLA==
X-Gm-Message-State: AOAM533lgFBOJn2Bu7uRrSiB2KXL+4j7ZZSVCEPVUqIlR/MbFYmFoT6i
        cGooEtEFRL0Wh+zLauTn3tHiXrQ0FT924OS8T3gg6A==
X-Google-Smtp-Source: ABdhPJwAPFwDq9d2WMBQzi19UoUazjXQg5G5k4rgucgpkEDrok/VSE4U5iX7SMqqWm0KAqvZWQC4gzYEe3k/cn8/POI=
X-Received: by 2002:a17:90a:cb0b:: with SMTP id z11mr170236pjt.101.1610473032865;
 Tue, 12 Jan 2021 09:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210112051428.4175583-1-morbo@google.com>
In-Reply-To: <20210112051428.4175583-1-morbo@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 12 Jan 2021 09:37:01 -0800
Message-ID: <CAKwvOdk+NqhzC_4wFbQMJmLMQWoDSjQiRJyCGe5dsWkqK_NJJQ@mail.gmail.com>
Subject: Re: [PATCH v2] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 11, 2021 at 9:14 PM Bill Wendling <morbo@google.com> wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> profile, the kernel is instrumented with PGO counters, a representative
> workload is run, and the raw profile data is collected from
> /sys/kernel/debug/pgo/profraw.
>
> The raw profile data must be processed by clang's "llvm-profdata" tool
> before it can be used during recompilation:
>
>   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
>
> Multiple raw profiles may be merged during this step.
>
> The data can now be used by the compiler:
>
>   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
>
> This initial submission is restricted to x86, as that's the platform we

Please drop all changes to arch/* that are not to arch/x86/ then; we
can cross that bridge when we get to each arch. For example, there's
no point disabling PGO for architectures LLVM doesn't even have a
backend for.

> know works. This restriction can be lifted once other platforms have
> been verified to work with PGO.
>
> Note that this method of profiling the kernel is clang-native and isn't
> compatible with clang's gcov support in kernel/gcov.

Then the Kconfig option should depend on !GCOV so that they are
mutually exclusive and can't be selected together accidentally; such
as by bots doing randconfig tests.

<large snip>

> +static inline int inst_prof_popcount(unsigned long long value)
> +{
> +       value = value - ((value >> 1) & 0x5555555555555555ULL);
> +       value = (value & 0x3333333333333333ULL) +
> +               ((value >> 2) & 0x3333333333333333ULL);
> +       value = (value + (value >> 4)) & 0x0F0F0F0F0F0F0F0FULL;
> +
> +       return (int)((unsigned long long)(value * 0x0101010101010101ULL) >> 56);
> +}

The kernel has a portable popcnt implementation called hweight64 if
you #include <asm-generic/bitops/hweight.h>; does that work here?
https://en.wikipedia.org/wiki/Hamming_weight
-- 
Thanks,
~Nick Desaulniers
