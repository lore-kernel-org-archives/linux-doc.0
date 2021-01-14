Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC21C43331
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 17:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70A1F23A58
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 17:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbhANRyi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 12:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727629AbhANRyh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 12:54:37 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2132DC061757
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 09:53:46 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q20so3795799pfu.8
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xfaedLmNvLX9iXMcjLIGfzS3Dnirkc2r8wJOKSFLYxk=;
        b=ZE7YhPIxnAH9wJH9MuGy59rsc1tN6Erf8CBdzJkGSZhX6hx9uAXE+UCZeP0qJKV7Zq
         SxGTztF16oB7m1rKMjWwLhgi7fetSqmJUuzLjWcVusufL4s+2zQKE9dEonorB9JMdl89
         QD6te7Ookv8gxjLQUH0ORn2RiDMf29EHEXgxCabyCB87N+MvDJBGt96tTlisRptCP+Q2
         kkVsak/EyDGDG7PwtG5NkRFBA6W/zagK1OeIKdBwor+df5J9shu48OUQanwDnnKI8wpM
         ERD3J3hpHgWZcP9TUMikiqWXDif0fb3S8ri/JcIEMzfN+lDKfqajY/o91QE5rKYp8GPL
         c5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfaedLmNvLX9iXMcjLIGfzS3Dnirkc2r8wJOKSFLYxk=;
        b=fSwAoDc0DyMjQdQJLKkW+NcHp2R3s4sDNFjO6LelGCQvoLEUm4dP9BGLfiMaGJL8Lb
         nQ2Lcym+0OgACRO+1cw9A6uQJZP0HYCdOwzEqbLBh17O0Uo5pMdVsZ3XKYF/3NYtqs4r
         yR9jNmHSRWv9ysLE+jWXJ1qwTTP0UXvPAbHpKhVR3sAk1C6gIzgFLPx8izuHxZdUmPOR
         6USs1Yo7lECw3GoRME2FJBnEIckmRi4d/i2J46WChWvru8+m/kr0cM0NjqR92oKPOjnP
         3PxAY8dAOStQbN8/qJsgyJDH8qb6z7p3xa45H7OlHer0zRxVKWHkDvMaCZmvZVWypQ8o
         c3Iw==
X-Gm-Message-State: AOAM530lafd3yJ4+Uhorv3q7NovApY7A5AUlFX/ec8HEMH5KMUzKuRdC
        oexvFN68bKCJf8UftYQitMJu4sbWKZDW/9AliUq/VA==
X-Google-Smtp-Source: ABdhPJyBUypb786yryp6blNciChZStI2I1CDCu88xcv+LslZfIragXD8PM08QyJtJO3hV9yIYpnsAwgnJGYyDZuEM30=
X-Received: by 2002:a63:1142:: with SMTP id 2mr8639411pgr.263.1610646825496;
 Thu, 14 Jan 2021 09:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com>
 <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com> <20210114073615.6b9add58@lwn.net>
In-Reply-To: <20210114073615.6b9add58@lwn.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 Jan 2021 09:53:34 -0800
Message-ID: <CAKwvOdmHsO-yqUuCFouy4jhDwLaL-5+K8JkJ0Jo5Q_UQEF_2rg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 14, 2021 at 6:36 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Wed, 13 Jan 2021 17:19:59 -0800
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > Patch looks fine, but `make -j htmldocs` seems to be taking forever
> > for me so I can't render it. Is this a known issue?
> >
> > $ make -j htmldocs
> >   SPHINX  htmldocs --> file:///android0/linux-next/Documentation/output
> > make[2]: Nothing to be done for 'html'.
> > WARNING: The kernel documentation build process
> >         support for Sphinx v3.0 and above is brand new. Be prepared for
> >         possible issues in the generated output.
>
> Sphinx 3.x is *way* slower to build the docs, alas.  One of many
> "improvements" we got with that change.

Oh, man, yeah. Noticeably.  I had sworn I had run `make htmldocs`
before.  Have you had a chance to report this regression upstream?
-- 
Thanks,
~Nick Desaulniers
