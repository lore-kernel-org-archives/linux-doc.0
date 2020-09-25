Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD94DC47420
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 18:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8736420878
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 18:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i45TaUrx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbgIYSw4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 14:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbgIYSw4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 14:52:56 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724CFC0613D3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 11:52:56 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so4055496pff.6
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 11:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgS7XDEsT9SMTtkEmVVEM4fmyQz20jTcKbyopJIbVnw=;
        b=i45TaUrxjWnjsCtpXFgjDDNUxvfhpASIJqWcjzD+jnQ+4XKmPLT8dYlHXa0G1ua5T3
         +bxWGE2GyWu6o5ZmPkCP3rn5jVAIdkjCaXm45P8lmPCQl1oUZeIkYNsGsIuIsvyI+GvM
         HId4R+rb4bosAqQnZBEv1OZVlpQTmnnhOGdeL2LRcac1fg/0ZrZKiBHZMEwbJ/S8UvTX
         SdwNNi9x+sm/yeJC7NuuPZHnSQHotIqPENQYFpKNirxSEcP8bWF0IzP82bAWnhpPW4WV
         1ZkMd453i1dNh4WRKPjDcjwmauPQsOkCXbqgaLYhpWFPbWF0za6aHKcWSCX20fLpuBP4
         HZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgS7XDEsT9SMTtkEmVVEM4fmyQz20jTcKbyopJIbVnw=;
        b=c/ewmw9RXu36Ht4qNSLCD/JwYYKypjqcx93PKwKsimzLhn0DG8Bby6elmITCgZlP/V
         tVmvk17TKaMx0gbjke+S0PzH2E+vvr2emtPXUa6EcuyBQzgbk64AbUdlf357FveAfcio
         EhvkjJjBmZ3TZC5SuoPgfsFslCc+nOUkhl7TCBwhIh5BljiF9dVAYCY+h/kwCG3Olb94
         BGZtWs+mx9ZmK23aaiuL7Q/UDve3XqM1DyBkS7ZKwSvIwDrQ6MuLHqELHwFWc8ufOoZX
         HrOzC2beHUw8KtkhmHy8MtNVo8y1w0gKnPpaEvu1i1Uyv0bMV1B2we7C47exNJqS/S18
         SkQA==
X-Gm-Message-State: AOAM533PKEMXJfz6roP67Wi9Sl7ImjifK1+M0kOJF2EOyXHI0KDYTIXJ
        uYtyqNHlwU9E67vv5vmg3yisg11YGA6+SrCixVQIpQ==
X-Google-Smtp-Source: ABdhPJy+MEhEaLmhJqtkWqku+8YPx5qhAdu39H1TNZDPwP4dsq+Y9vk7jXDi9d2KcOuNMczaA9kdzk4W0jK/+c1Xo0A=
X-Received: by 2002:a17:902:ed11:b029:d1:f385:f4e7 with SMTP id
 b17-20020a170902ed11b02900d1f385f4e7mr758865pld.56.1601059975629; Fri, 25 Sep
 2020 11:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200925152121.20527-1-f.fainelli@gmail.com>
In-Reply-To: <20200925152121.20527-1-f.fainelli@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 25 Sep 2020 11:52:44 -0700
Message-ID: <CAKwvOdmxkwA7NPSj-bSarurjWc7Vs2vzuT3PnaCJhA00pRWyYA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Fix clang target examples
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "open list:CLANG/LLVM BUILD SUPPORT" 
        <clang-built-linux@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 8:21 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> clang --target=<triple> is how we can specify a particular toolchain
> triple to be use, fix the two occurences in the documentation.

Ah right, my mistake.  It's either double dash+equals, or single
dash+space.  Thanks for the patch.  Masahiro, would you mind picking
this up?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/kbuild/llvm.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 334df758dce3..dae90c21aed3 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -39,10 +39,10 @@ which can help simplify cross compiling. ::
>         ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
>
>  ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
> -``CROSS_COMPILE`` is used to set a command line flag: ``--target <triple>``. For
> +``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
>  example: ::
>
> -       clang --target aarch64-linux-gnu foo.c
> +       clang --target=aarch64-linux-gnu foo.c
>
>  LLVM Utilities
>  --------------
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
