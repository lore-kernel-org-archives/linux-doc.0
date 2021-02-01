Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C5EC433E9
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 18:29:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D768664E2C
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 18:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhBAS3e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Feb 2021 13:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbhBAS26 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Feb 2021 13:28:58 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F5BC0613D6
        for <linux-doc@vger.kernel.org>; Mon,  1 Feb 2021 10:28:18 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id t29so12156852pfg.11
        for <linux-doc@vger.kernel.org>; Mon, 01 Feb 2021 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZpTMPQ2QiuaE7YgK9D97So9gGS45ZWVWJvJLwPy7gVE=;
        b=n7LNoaNuf95Q4NZEiOJJmi/AUUVJd8pv3Gq/pEbjwLx+2am/cNePL+YKe4qJwyyAvh
         RaXG4rMwHv/Ac+OyaYaZUKTj1CnrkVyujna3JevD7q0jOIkimyNMTN1RDXOD2LonqJik
         1AWFBndBZzdqO+wmI1yyhXRVSS62XmpNaPKYjRmdhlMKVQOmWw1utTN/Da3AbWqw6tlH
         hJU7D3tMF9rac5YfYnTugcrshG5E1BM9QP/RHLV96Wy8+JyXeHUAL47G4P0LUuMviSeN
         6wqCH7/Hl6QHAlXlLnV3BCzdRCU4nmPUTLF3YMXKtolEvIttx8LlzXsqwdG/07FtpfDL
         4dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZpTMPQ2QiuaE7YgK9D97So9gGS45ZWVWJvJLwPy7gVE=;
        b=Eu5zs/mHXGWm/3vKP/gAMu0DiF/W8bKb5ac6gYNNjBuzZ29n7LcQw/s1Q5qVYwasiv
         y1eP+DXr/AHkEsGyWXOz07OJoxRTOty+oork419dSCAqz4qswldKRZWCWW3dSPKBv9t3
         TPKgI9lEBlNvAP9Bz7nozhujcsy3Y1w7Dn1pOsbJ85FoVhwugL2IkFDITKKjqDE0Jz4k
         snCN74P1GFl3RF6Kpm79WOq9yW0qY/BFWOpScqhlM/7Omb3TnCgRTyhx6mBoWbOk799b
         YxdGVN+gfrlzIpjYoPGYypj1axryJt/aF7jl108hZhoXUF5w7D2D0s1tXwAMyGigWiQ6
         x4/A==
X-Gm-Message-State: AOAM533uw3djzTTh3P3kB4f0SjxzCftbmerBb/CxqnMVenwbpFryO90e
        VyRy/vPakranbZgO9GH9h23HTfhxwZZqgnEOXAAd6A==
X-Google-Smtp-Source: ABdhPJyj+nqwhsWtSMAc77QUN3iH+51wGBli74byxlse5q8S9UBykrdYICOgPFkVfNbslN7hddoFuUFiqOa1DDwNkcc=
X-Received: by 2002:a62:7896:0:b029:1b6:7319:52a7 with SMTP id
 t144-20020a6278960000b02901b6731952a7mr17982053pfc.30.1612204097451; Mon, 01
 Feb 2021 10:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20210201010819.655597-1-masahiroy@kernel.org>
In-Reply-To: <20210201010819.655597-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 1 Feb 2021 10:28:06 -0800
Message-ID: <CAKwvOdnECGDFe=n6ms0Aj7FB0sN7ktZyk4dyVvV0UTgPvpuWpA@mail.gmail.com>
Subject: Re: [PATCH] scripts: switch some more scripts explicitly to Python 3
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-spdx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 31, 2021 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> For the same reason as commit 51839e29cb59 ("scripts: switch explicitly
> to Python 3"), switch some more scripts, which I tested and confirmed
> working on Python 3.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch. It's time to move on from Python 2.

It looks like there's already a patch in -next for scripts/spdxcheck.py.
("spdxcheck.py: Use Python 3") by Bert Vermeulen.
https://lore.kernel.org/r/20210121085412.265400-1-bert@biot.com

What about:
scripts/tracing/draw_functrace.py
scripts/show_delta
scripts/jobserver-exec

Or do those need additional source level changes?

> ---
>
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  scripts/clang-tools/run-clang-tools.py      | 2 +-
>  scripts/spdxcheck.py                        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 19963708bcf8..8ddb5d099029 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Copyright (C) Google LLC, 2018
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index fa7655c7cec0..f754415af398 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Copyright (C) Google LLC, 2020
> diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
> index bc87200f9c7c..cbdb5c83c08f 100755
> --- a/scripts/spdxcheck.py
> +++ b/scripts/spdxcheck.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  # Copyright Thomas Gleixner <tglx@linutronix.de>
>
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
