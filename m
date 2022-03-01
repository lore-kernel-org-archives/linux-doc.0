Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F70C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 19:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbiCAT52 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Mar 2022 14:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbiCAT5S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 14:57:18 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA29573077
        for <linux-doc@vger.kernel.org>; Tue,  1 Mar 2022 11:56:19 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b9so28752507lfv.7
        for <linux-doc@vger.kernel.org>; Tue, 01 Mar 2022 11:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMi6jfjPmOmbZli1oBeEnCLh26RC8er1sFN7ImcKi+o=;
        b=hquZMrM0xczMD9ZZ2fmNHpKRRvIiE7LGxeRQJjMZze98rNEK5Ra0HRlOcHxK1KVi4e
         FQBN2HtdkQyg3o4uLsn9EldD2THulu/j3z0J4c66DGvW7dy1eAyfhY+zPXLMelBK2NVs
         vFTKlgnUUtURZxAVCwYSSRSsE1DD1TOPa1gDQr3nPyXjuZyynXejfYtMrPNZv4qIlUpD
         asXGdBdEC/EqRmjLSKU9coJTyUmLsswdnWGR9v05EWG09syjtZNPsGSHcVR0+xDYzlUn
         xQ2tt273NyMVjhC6JJKYVK3HJjm31oXEOGz7C5tWg61kUtCoX5BnnE6UEYkhMFnA1EZr
         /tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMi6jfjPmOmbZli1oBeEnCLh26RC8er1sFN7ImcKi+o=;
        b=OOHxsa83ytXBMflTXDF/0GsvZDKZdDC2ISRvXt5UI6eRrr47E67QJktYOuJQEm7sGh
         9WJNfmaBUPS9OtDfMVTjWo8v4R3ydq9FEolyWh/EEaTbY6oxT7AJg9RQe/0b5KTCtWHA
         8OH4oDhyOSy6BMC4NCD2gVtWqxjft62UgZwNeFdAcZWCfuDYJ6R3RFLPPSCqwe0xHjTR
         wlSjjHAmDZqvAVxSHk2g+gff/l0W5H1qRCdX5I7W4At7EFyCoPiGbnLaeYH8YOwBDLVM
         JYm+5JtC5GrMEkHDLCY7hrZYUvJudA6+64hOuQkpd8Ia4LtqtZexSPgkxhYF2tp1a2j2
         oL7w==
X-Gm-Message-State: AOAM530AUX9eVM+vozuRz2jIsBox687vB8BQgpXKyTi0x1YK5HdrGRDU
        eygVDjrslJsx7oJcV89aMTeHP5aEc7PK3VSjRFbM8g==
X-Google-Smtp-Source: ABdhPJxHJ28ixWzc8Cw9z63iY2V3Qs825Z5wYOByAiHrKjX3T4RD+ppSjBBfmC8N5GLCMcFfzTk1/mPc6px+kJRbpbg=
X-Received: by 2002:a19:2d11:0:b0:445:65c7:5f1e with SMTP id
 k17-20020a192d11000000b0044565c75f1emr16420364lfj.184.1646164576477; Tue, 01
 Mar 2022 11:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
In-Reply-To: <20220301145233.3689119-3-arnd@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Mar 2022 11:56:05 -0800
Message-ID: <CAKwvOdnABhWN9-o0J0cN2epDJby=JX5BNGr6U_w4WiFZ7qbwig@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 1, 2022 at 6:52 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> As we change the C language standard for the kernel from gnu89 to
> gnu11, it makes sense to also update the version for user space
> compilation.
>
> Some users have older native compilers than what they use for
> kernel builds, so I considered using gnu99 as the default version
> for wider compatibility with gcc-4.6 and earlier.
>
> However, testing with older compilers showed that we already require
> HOSTCC version 5.1 as well because a lot of host tools include
> linux/compiler.h that uses __has_attribute():
>
>   CC      tools/objtool/exec-cmd.o
> In file included from tools/include/linux/compiler_types.h:36:0,
>                  from tools/include/linux/compiler.h:5,
>                  from exec-cmd.c:2:
> tools/include/linux/compiler-gcc.h:19:5: error: "__has_attribute" is not defined [-Werror=undef]
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 37ef6a555dcd..7c9be7f1ccd4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,7 @@ HOSTCXX     = g++
>  endif
>
>  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> -                           -O2 -fomit-frame-pointer -std=gnu89 \
> +                           -O2 -fomit-frame-pointer -std=gnu11 \
>                             -Wdeclaration-after-statement
>  export KBUILD_USERLDFLAGS :=
>
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
