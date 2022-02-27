Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4087C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 27 Feb 2022 22:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbiB0WpI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Feb 2022 17:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbiB0WpI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Feb 2022 17:45:08 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9A752E1F
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 14:44:30 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id bg10so21332129ejb.4
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 14:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8l4d/g0eKsVGAXwcSHou4m9texHyFwjSyXWV84L8X0=;
        b=aS+Cuu53E5xh6ezL4BQQcygkZ7taEG098ncxgu4s2QZu+Pf48uAsX8EMwnsNmZzs5O
         eo+kkcQwg/L9tnVyFaERl40XHOJRfEwQ+3p4bNjtTIEqFgNZTrhkUr5c7jHIQo0R2QlD
         6Z3HbL6vTEGo3aFlsNtdBL0CtUa6ZZQikH6w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8l4d/g0eKsVGAXwcSHou4m9texHyFwjSyXWV84L8X0=;
        b=aTSMgdxN/Ld0rF+Hf0opiVQFmij9XPTkrlYvCD8RwgQfnkk7fu7TfuNNdaYtsykCIo
         Pv7D8rKwX5zHyQiFs/lbAcJ5PotcbKravqHk/VQFUyN+delMGrxnbCzu1oVGIjmKDTuz
         b/qv7EnhKpGF/jnnySJasYbYov5Ds0qaqKytuZ9iwRjarcCGsOTW9AJOcQMcC6N0bWm4
         1OJKIEr4vUqr1l159Gke+XhHh4XCZJDRWE1owQCGDSbq1iaT7tgcZZJpyTYIQlB2A8Eb
         OhXpRRfsvTFupMdGkYA6JXS9yilCDZ6LXxibi0OiPNLDa82UXzWeN31s5zWmPgcZrCO8
         3jjw==
X-Gm-Message-State: AOAM53185GI2jlX5mBDfYZ1UklDtr31QoT7Qfjw93qPog+5IaPBDy1oc
        EJkgeqerl5e9nkZd578EbjcqC3Rq5NLk/vG44ZU=
X-Google-Smtp-Source: ABdhPJyDFW3ZidGxzwTqXP6LuvOmIhDaOYm6FkcsDy4itk7DJRKzjjtSOqcE91p00mMWGWd2zh/BCg==
X-Received: by 2002:a17:906:364d:b0:6cd:9109:cfd4 with SMTP id r13-20020a170906364d00b006cd9109cfd4mr13270777ejb.198.1646001869004;
        Sun, 27 Feb 2022 14:44:29 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id g13-20020a50bf4d000000b00410d407da2esm5259242edk.13.2022.02.27.14.44.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 14:44:28 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id j22so12631559wrb.13
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 14:44:28 -0800 (PST)
X-Received: by 2002:a2e:aaa2:0:b0:244:bf42:3e6e with SMTP id
 bj34-20020a2eaaa2000000b00244bf423e6emr12796324ljb.176.1646001378532; Sun, 27
 Feb 2022 14:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org>
In-Reply-To: <20220227215408.3180023-1-arnd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Feb 2022 14:36:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
Message-ID: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 27, 2022 at 1:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Since the differences between gnu99, gnu11 and gnu17 are fairly minimal
> and mainly impact warnings at the -Wpedantic level that the kernel
> never enables, the easiest way is to just leave out the -std=gnu89
> argument entirely, and rely on the compiler default language setting,
> which is gnu11 for gcc-5, and gnu1x/gnu17 for all other supported
> versions of gcc or clang.

Honestly, I'd rather keep the C version we support as some explicit
thing, instead of "whatever the installed compiler is".

Not only do I suspect that you can set it in gcc spec files (so the
standard version might actually be site-specific, not compiler version
specific), but particularly with clang, I'd like that "GNU extensions
enabled" to be explicit. Yes, maybe it's the default, but let's make
sure.

The C version level has traditionally had a lot of odd semantic
meaning details - you mention "inline", others have existed. So it's
not just the actual new features that some C version implements, it's
those kind of "same syntax, different meaning" issues. I really don't
think that's something we want in the kernel any more.

Been there, done that, and we did the explicit standards level for a reason.

It may be true that c99/c11/c17 are all very similar, and don't have
those issues. Or maybe they do.

And I don't want somebody with a newer compiler version to not notice
that he or she ended up using a c17 feature, just because _that_
compiler supported it, and then other people get build errors because
their compilers use gnu11 instead by default.

Put another way: I see absolutely no upside to allowing different
users using higher/lower versions of the standard. There are only
downsides.

If gnu11 is supported by gcc-5.1 and up, and all the relevant clang
versions, then let's just pick that.

And if there are any possible future advantages to gnu17 (or eventual
gnu2x versions), let's document those, so that we can say "once our
compiler version requirements go up sufficiently, we'll move to gnuXX
because we want to take advantage of YY".

Please?

                   Linus

                   Linus
