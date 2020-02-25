Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25246C35E0E
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 20:52:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF4892176D
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 20:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJBKheyS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgBYUw2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 15:52:28 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33718 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbgBYUw2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 15:52:28 -0500
Received: by mail-pj1-f67.google.com with SMTP id m7so1381786pjs.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 12:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAoYW3jtAWCjdGaJXCm1P0l2hukH5ekAbYDVhrn3FCI=;
        b=kJBKheySLFt0Q1njT7UpJ8+EDt27CVBBJHrvJ0UtSvuHFxIIjGi22GqBUgpH2nAHdI
         JY5jrCDf3PIG9COk+pwYByEiwkOKxIApV/ovtrc9wrCaKya9UoDMEVp3Rz9kOWYFJgZ6
         LFrubn4k0J3ci67mSNf1jdg3j0c2vRI3NMo0hVWrLh5JRtR2Ea45SlATQTxbUKChv5wX
         4xOYXRcY5SQJ59KF+n2sYezpKSTZ/7kWy6dPhVgzAu1h6Pl5XBxt8qUPbxgM379BZ/Oa
         /iM37C2zdp+gP8bAXtXgNbQc3SdKilus0OLnBjt0xT5I3zkOQcbj5sMbfKPzqlA7Sd0v
         mZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAoYW3jtAWCjdGaJXCm1P0l2hukH5ekAbYDVhrn3FCI=;
        b=YGNaSpe4JiS9rqEk1/5CE5Bo9qBzEcQH/YBYO6NS1WlSblm3XlqohKYwawyhIiFQ4w
         Wt11ufQDtcrk3aA2iva/vwZQpmE7ZIWVu5KrHSTzgoupQWoG6z74z0NxG0qAeHsUeQFY
         ONWKuuPbc7HpCU4MptcwOci63zFJBHVm8Vv+ZCV3bKOZ9WNxKpg0ULb/Bu67usmGnTj2
         /Jy1kz6WPpZCUPGEIU+Z/ikMJWUUjElLNahdCM07qwczM5X7a/wCcsy9V5v0itjcVY12
         TdawB1W6Dl5eH8w6W5vHEVG+kOnz8YTPl1VhVG85d71GX7e3OBkniozjcpMha4be9ou3
         bVzA==
X-Gm-Message-State: APjAAAVrzj0hBDFHADS/1dN43CqmyAiH6CGKnnBwNjYnO4sbAStTOgiH
        1egsyeqKsxuBlDbTm8gesn7v1Dtm1Gd+viqiJqm5Zg==
X-Google-Smtp-Source: APXvYqwmB04vyduuyJu/HEN0PY3Yi4sOxYmfQoRVMJPmSpkr6VIiN9TCWrQH4VKDHGWrnSeq/vTIXr42Ie5xms8bARw=
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr353457plo.179.1582663947479;
 Tue, 25 Feb 2020 12:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com> <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
In-Reply-To: <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 25 Feb 2020 12:52:16 -0800
Message-ID: <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Added to kbuild documentation. Provides more official info on building
> > kernels with Clang and LLVM than our wiki.
> >
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
>
>
> Perhaps, is it better to explicitly add it to MAINTAINERS?
>
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
>  B:     https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  S:     Supported
> +F:     Documentation/kbuild/llvm.rst
>  K:     \b(?i:clang|llvm)\b

I'm happy to leave it to the maintainers of Documentation/.  Otherwise
we have a file for which there is no MAINTAINER, which seems
ambiguous.

-- 
Thanks,
~Nick Desaulniers
