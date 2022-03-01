Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64886C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 19:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbiCAT6t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Mar 2022 14:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbiCAT6r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 14:58:47 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0011D315
        for <linux-doc@vger.kernel.org>; Tue,  1 Mar 2022 11:57:54 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id l12so11462628ljh.12
        for <linux-doc@vger.kernel.org>; Tue, 01 Mar 2022 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bzivBYAw3ljLJy8xZdeQDlrkgf1wuIGHlMk0BwA07c0=;
        b=KEQ5BRHLV5QEz4CDHLQQB/SplTyDRt7A4lHNfxFHFB/hJZlUmDi2+nTSlwz/H2F/dx
         eimLKy1g993y+H0uoNs1fYev40Npxz0jCvsONiiotxfIzDl0yiFXH8E66Kww8Zi5JVt1
         riAOs1Ia1BdYL6FWl6MAGMOBI9gg8XlLRFJZCnfpCL7TGTzdoG2bEaWS8N8eSDGVV/ej
         Zd9+RTVAnK61wC4eiSnP3FMVMeXlnBN2TncLzIAxZ+y2DFpGcp9fepASwO8v+UbdT79E
         bzpFk/XEUzmbP+XJ8l47hH02UpAK4H+KPvM6mPZ5mdbg8zT4ERWVjVqIaDSA/SmcWYmz
         FUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bzivBYAw3ljLJy8xZdeQDlrkgf1wuIGHlMk0BwA07c0=;
        b=Xcw+eaIOEtiCbQrEeuPRXi5yrC2pRonjRZ7NouAqpSebLJcIvModASU0jOwAztW5Lg
         jTCWYBSiV96OL0YLZlUUl6arv4x9LbDLXmcLvTUkE97wyKB8hOoQbM0Oi2kJIF29WoPe
         jfPJp3Qxk0AZKktA7Am53MYUN7Rf3NkSVASEYD8wnnM+xgPuuourYzU/wQapfaSUH8w1
         h5XzrGkklQ0Sf1WetALHZ1BJCQEszbxVJ/OMTypWhUi692UXRNzrGZLMhUg7hJlSxrA4
         fi7lwPz3BUQrSrYFa8pEA4b+X/e388r/itz2gV8u8rRdGKDUIHwjrr/xvMWPzSipOpMA
         UAnQ==
X-Gm-Message-State: AOAM533RQeMrPMU/TYwVl24ofIwt4BD/rn2jWtpbEr+vu5UjM2xT2LpJ
        OQnJrCG3ocGQfe97tFXXPlofFh/K3MEhVai1fVUuhA==
X-Google-Smtp-Source: ABdhPJzbNisdyIa1wPYSz5jbLW4IKbU4cXZL3Jq42bKSP244kPlasEustkjm9b56aAk8bR8evyfq6NCB36MTaBtFvM0=
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id
 m26-20020a2e871a000000b002460ee21109mr17904085lji.165.1646164672468; Tue, 01
 Mar 2022 11:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
In-Reply-To: <20220301145233.3689119-2-arnd@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Mar 2022 11:57:41 -0800
Message-ID: <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 1, 2022 at 6:52 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Mark Rutland <mark.rutland@arm.com>
>
> In a subsequent patch we'll move the kernel from using `-std=3Dgnu89` to
> `-std=3Dgnu11`, permitting the use of additional C11 features such as
> for-loop initial declarations.
>
> One contentious aspect of C99 is that it permits mixed declarations and
> code, and for now at least, it seems preferable to enforce that
> declarations must come first.
>
> These warnings were already disabled in the kernel itself, but not
> for KBUILD_USERCFLAGS or the compat VDSO on arch/arm64, which uses
> a separate set of CFLAGS.
>
> This patch fixes an existing violation in modpost.c, which is not
> reported because of the missing flag in KBUILD_USERCFLAGS:
>
> | scripts/mod/modpost.c: In function =E2=80=98match=E2=80=99:
> | scripts/mod/modpost.c:837:3: warning: ISO C90 forbids mixed declaration=
s and code [-Wdeclaration-after-statement]
> |   837 |   const char *endp =3D p + strlen(p) - 1;
> |       |   ^~~~~
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> [arnd: don't add a duplicate flag to the default set, update changelog]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile                          | 3 ++-
>  arch/arm64/kernel/vdso32/Makefile | 1 +
>  scripts/mod/modpost.c             | 4 +++-
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 94fa9a849a7a..37ef6a555dcd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,8 @@ HOSTCXX     =3D g++
>  endif
>
>  export KBUILD_USERCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-protot=
ypes \
> -                             -O2 -fomit-frame-pointer -std=3Dgnu89
> +                           -O2 -fomit-frame-pointer -std=3Dgnu89 \
> +                           -Wdeclaration-after-statement
>  export KBUILD_USERLDFLAGS :=3D
>
>  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTC=
FLAGS)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index 9378ea055bf2..ed181bedbffc 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -68,6 +68,7 @@ VDSO_CFLAGS +=3D -Wall -Wundef -Wstrict-prototypes -Wno=
-trigraphs \
>                 -fno-strict-aliasing -fno-common \
>                 -Werror-implicit-function-declaration \
>                 -Wno-format-security \
> +               -Wdeclaration-after-statement \
>                 -std=3Dgnu11
>  VDSO_CFLAGS  +=3D -O2
>  # Some useful compiler-dependent flags from top-level Makefile
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6bfa33217914..fe693304b120 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -833,8 +833,10 @@ static int match(const char *sym, const char * const=
 pat[])
>  {
>         const char *p;
>         while (*pat) {
> +               const char *endp;
> +
>                 p =3D *pat++;
> -               const char *endp =3D p + strlen(p) - 1;
> +               endp =3D p + strlen(p) - 1;
>
>                 /* "*foo*" */
>                 if (*p =3D=3D '*' && *endp =3D=3D '*') {
> --
> 2.29.2
>


--=20
Thanks,
~Nick Desaulniers
