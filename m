Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929FCC76188
	for <linux-doc@archiver.kernel.org>; Wed,  5 Apr 2023 20:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjDEUsU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Apr 2023 16:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234058AbjDEUsS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 16:48:18 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1127DAD
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 13:48:02 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50240a3b7fcso859748a12.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Apr 2023 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680727680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gar2SeDIgd9oWPuJFUbMEAp6q8OZkPojCAqDAzQ9Ib8=;
        b=eD9znuZhuILxcgVJJecjtuePLidQ8BiBdA9QFon9SZpy/fGUFiBRz39EvdoB4bRYtD
         Ef3Lp0PnIV9u5HVChUC9BnCVD7BSr9K8brztFgIM+4m7o64rt8QXVgkLAysOeBNJxTGT
         7S4B7aB1uhpLVmH7+9k68YqumQMRiASrD3DXTLUjSFEsWRoh2oatilPzFmNX6fc7qv2z
         Hg841jEEV/8/I48Y6rzzNnqEeIJe391m/KlN92GYv7z2fX9eOF95eN6UOSWo74JuT6Iq
         JGFiILRN8+3K0C5oiC0NjYOiFdm9KXQOjvKKnGsL5W7qOwMPnAe6rBfwT2LREnsbIHGN
         Prxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gar2SeDIgd9oWPuJFUbMEAp6q8OZkPojCAqDAzQ9Ib8=;
        b=CpzwYuTsz1shAHmtFCnwiWnplDXAqCHrBZbuEIiTWc81raXo/7JX08t4ZRih2ajivo
         x8Zsyc3EJhyqj1A2lIwWhBwTX2Hhmxy6P/M5L18oaCrhgVMXR6y3qz2ofzUgPbbT4pub
         J1sNLSeMqquYJVMR/J0ESodcsZY2OT/eF/TS97Z6YDU2fp+fyEUe6lixSkqxzKU9xbyG
         +S+9yh+10e58Hx2MCpYvHPk1TXYno2YiDdQXrUYWDFkjdswROBfi/n1RrOwM2df+Ho1j
         hJ8M7SiOgr/ABE4biPBV53vzK4BCK/7LSeF5zoeMak8AkysKFu3mabmMl7kE/P1EX2zt
         XWXw==
X-Gm-Message-State: AAQBX9cw450XaWlxT3CrgKhl9LNY64VtQQfmDnNf2pPHW5AYKGJAaNep
        fyXe1Hlrro7S/XEMNiydwiZO1IPI6r+uBA8LBElM
X-Google-Smtp-Source: AKy350b/2tIT+e5QlFHEXhYsP01fC6fj0DfEQOEvWRjfflFPrhmacJNsGrlHJlO4vRKfn452es59o8bqrjpYSjzmRcE=
X-Received: by 2002:a50:9fc7:0:b0:4fa:123:3b32 with SMTP id
 c65-20020a509fc7000000b004fa01233b32mr1930469edf.7.1680727680545; Wed, 05 Apr
 2023 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org>
In-Reply-To: <20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org>
From:   Bill Wendling <morbo@google.com>
Date:   Wed, 5 Apr 2023 13:47:44 -0700
Message-ID: <CAGG=3QX65iJEtvMiSD2Ju18f0KfHsi2zPXAQDSh0ScqbCLv=Cg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a note about prebuilt kernel.org toolchains
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     ndesaulniers@google.com, masahiroy@kernel.org, corbet@lwn.net,
        arnd@arndb.de, keescook@chromium.org, trix@redhat.com,
        nicolas@fjasle.eu, llvm@lists.linux.dev, patches@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 5, 2023 at 1:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I recently started uploading prebuilt stable versions of LLVM to
> kernel.org, which should make building the kernel with LLVM more
> accessible to maintainers and developers. Link them in the LLVM
> documentation to make this more visible.
>
> Link: https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-3990=
X/
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Documentation/kbuild/llvm.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rs=
t
> index bfb51685073c..3e1f67b05ca6 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -171,6 +171,10 @@ Getting Help
>  Getting LLVM
>  -------------
>
> +We provide prebuilt stable versions of LLVM on `kernel.org <https://kern=
el.org/pub/tools/llvm/>`_.
> +Below are links that may be useful for building LLVM from source or proc=
urring

s/procurring/procuring/

Otherwise:

Reviewed-by: Bill Wendling <morbo@google.com>

-bw

> +it through a distribution's package manager.
> +
>  - https://releases.llvm.org/download.html
>  - https://github.com/llvm/llvm-project
>  - https://llvm.org/docs/GettingStarted.html
>
> ---
> base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
> change-id: 20230405-korg-llvm-tc-docs-84304e881bc5
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>
