Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C9CC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 17:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67A28611F2
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 17:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhJTRw7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 13:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbhJTRw5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 13:52:57 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0766C061753
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 10:50:42 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t9so137061lfd.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IFvyJDv7zWHNgpVy4rL7we9/QbUTjFwP2DzX3TA0tiQ=;
        b=DxXrG20AfYyTWbuMUYzNfwR4ma6dWiFGO0KjGKjLqVUYkWc3DGlA7gExcJhltON98Q
         iCOl7ShLDxT6gW3S/iaxj1F4KrUBb9e17xdURrxubqYpnaDf5fqI+klbo/6SpeMVbaxj
         bVO5N1ypo4BJgVzIhZmV7S+lvG+ppRftQ74TP0w7xkCYNdCPabymX9EBoVJgU+AiJdnX
         73rfLrfIuuMZZa7dbpcIoqZmbjgOPkSZh/tq0Pqn9LQQD0c50F18mXQtmzKwXTaIrbI4
         VLerFWmUTLJfn1+7KKosGH7U2IvcsnC2m3gcHYqoEbu8bW+mpmpUd0FUhndHkvD2mYx+
         E4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFvyJDv7zWHNgpVy4rL7we9/QbUTjFwP2DzX3TA0tiQ=;
        b=mYIWQKtnBOfELgZyAYlCiHBzEOjcPkC9WXeCC3yoGEgaWzAlndcYc3jN1sNkWIIOsP
         I8V7vWf96Y4a8Cc4ETp1hW/ptzEP7haul+Em9QvUBx6TBnNfWS1OV7TNTHarDKba4F8t
         Ke8sGgGVpaKlKd9NjBQ3ZV1fS6X3heS7/24fjWHZYkw6AMNY8nYeaGmCB5VUnNLdKBtM
         TVd+uyxjKrzNQhH51WzOlNSLLqp81NAjOXjG8klTZGP3VflsMcaq5mwLew2P9oc9vJfX
         zKqgk4igu9we/n0A0VJe9TrXvBnnDPSefO5cgMoM+hczYGZVbrRJYfnCszxrpuAaarhh
         m3uw==
X-Gm-Message-State: AOAM531eRFc8JL5l3oFecsz8+939FsdSvwL7gxnoo1oKPo0V5n/HjHoM
        wD8g5l980wdN/SrR6teqQXhf/Z+/LMEueoprEJFT1Q==
X-Google-Smtp-Source: ABdhPJwPFGMtZow5DrrM1QQEhKH4UgBAhO+q3OhbDbIA+NCFfvXVoE6xurM+6DQNbeaHKSEmyE1T/I8F3ayNnhS04hg=
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr643276lfu.489.1634752240690;
 Wed, 20 Oct 2021 10:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-1-keescook@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 20 Oct 2021 10:50:29 -0700
Message-ID: <CAKwvOdnH4JG1Qt3scCVYGMT+iyfYKna4wyuODXZqURVfe+DZVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
To:     Kees Cook <keescook@chromium.org>
Cc:     Dan Li <ashimida@linux.alibaba.com>, ardb@kernel.org,
        ojeda@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 20, 2021 at 10:35 AM Kees Cook <keescook@chromium.org> wrote:
>
> Hi,
>
> GCC plugins should only exist when some compiler feature needs to be
> proven but does not exist in either GCC nor Clang. For example, if a
> desired feature is already in Clang, it should be added to GCC upstream.
> Document this explicitly.
>
> I'll put this in -next unless there are objections. :)

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Thanks!
>
> -Kees
>
>
> Kees Cook (2):
>   gcc-plugins: Explicitly document purpose and deprecation schedule
>   gcc-plugins: Remove cyc_complexity
>
>  Documentation/kbuild/gcc-plugins.rst        | 28 ++++++++-
>  scripts/Makefile.gcc-plugins                |  2 -
>  scripts/gcc-plugins/Kconfig                 | 20 +-----
>  scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
>  security/Kconfig.hardening                  |  9 ++-
>  5 files changed, 34 insertions(+), 94 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
>
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
