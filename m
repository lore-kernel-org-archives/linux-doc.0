Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68A9C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 15 Sep 2021 02:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF7A96115B
	for <linux-doc@archiver.kernel.org>; Wed, 15 Sep 2021 02:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234432AbhIOCZZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 22:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbhIOCZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 22:25:24 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F27C061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 19:24:06 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id 5so687078plo.5
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 19:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7eh5S1OMfT995HIEwzia5eaz9Eu9i8D/vKkCv202vVU=;
        b=RItsHYyxu9XmShy0nWTcWz4Tmh2ZjNidrSYYcqtUhPPGMnaWPpUMfFiBTl+tFcUWuA
         C8HqpUMo7VoPJtY4eaRPnuLNcJb7Cg6u2vXuHzDM8xuMcvUUXHaNadX/+lRv4xMFTSPB
         Wis1aAmBmN4wah0zBFkXc1dbucmne49B/RnBjHgEdmuenPMN/1ZhtarXgiwQz/yblf+H
         ZWTLoW3qeuB69HhOTg3mpRObWsrYNqrc/UxducsDgzj1mSsaoqhtcsepLBmIiCFi/llt
         6Y3UWqZ+T4tmobT1nyAoI1A4C8K2GdchUCUvUCVCoIs21UNRAqPquVRgRTdbBSmI27rK
         sGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7eh5S1OMfT995HIEwzia5eaz9Eu9i8D/vKkCv202vVU=;
        b=jU8nleIMhmYqBeh7EIClwuuNtFyBGs0c4kH7rRTMCZS2aGhsS6utbkCpnGdeHqpqVz
         keV/oJkrfeT/d7lcywYDHE+0pVTmUiKCgSSUGLOgsT6DdrCXRwmBloZj71RvS0p/bh7v
         Ca/3s2mWr3kMFb+dAv4IoVcmw4ByyJuJfi/Si/dvXz1dnuGynH+zo8rN/JlRtPXpctP2
         Zq8yjeSHekO1GMWVDLHygDcvb+CAkoMKIpysmwceR6/vfyvdkpsBYuFzjjpTRJV7C2vc
         UKPM6qXhIGZxXwYI6h3ZgvCFUUB0FV1eutIES69/Niaq9R+KAgCs7c+mtKMUIleossG7
         47ow==
X-Gm-Message-State: AOAM530k29QuANgPtt5+44XsY3f/0bc2mPF+Fh4NtKPNtI9AbEA/g6+9
        9D9/Q0fzQKnSJ2RDb5nl5Pq3nEKTCc2l0BfvSQU=
X-Google-Smtp-Source: ABdhPJzp6coNPaEr7oW18TsMCwZ4Y0QU1evY44tdl5xEi6B4T+5vBAyGqfXjO7HVsBofC0sgNSSGPU1NDyZOtXHdmvA=
X-Received: by 2002:a17:90a:3ec7:: with SMTP id k65mr5662223pjc.12.1631672646164;
 Tue, 14 Sep 2021 19:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630747462.git.siyanteng@loongson.cn> <87zgsedgem.fsf@meer.lwn.net>
In-Reply-To: <87zgsedgem.fsf@meer.lwn.net>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 15 Sep 2021 10:23:55 +0800
Message-ID: <CAMU9jJqYhvBCNQgzjVZwZrj5AKLiYJKDzffekg0VW5+WBtvgDQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] docs/zh_CN: add core-api Memory management translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng01@gmail.com>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B49=E6=9C=8815=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=884:58=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > v5:
> >
> > * resent to linux-doc list.
> >
> > v4:
> >
> > * pick Alex's Reviewed-by tag.
> > * Modified some words under Alex's advices.
> >
> > v3:
> >
> > * Modified some words under Jiaxun's advices.[PATCH 5/6]
> >
> > v2:
> >
> > * Modified some words under Alex's advices;Many thanks to alex for his =
review, which
> >     kept him busy until the early hours of the morning.Thank you!
> >
> > * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want =
me to do this, please let me know.
> >
> > Yanteng Si (6):
> >   docs/zh_CN: add core-api memory-allocation translation
> >   docs/zh_CN: add core-api unaligned-memory-access translation
> >   docs/zh_CN: add core-api mm-api translation
> >   docs/zh_CN: add core-api genalloc translation
> >   docs/zh_CN: add core-api boot-time-mm translation
> >   docs/zh_CN: add core-api gfp_mask-from-fs-io translation
> >
> >  .../zh_CN/core-api/boot-time-mm.rst           |  49 ++++
> >  .../translations/zh_CN/core-api/genalloc.rst  | 109 +++++++++
> >  .../zh_CN/core-api/gfp_mask-from-fs-io.rst    |  66 +++++
> >  .../translations/zh_CN/core-api/index.rst     |  14 +-
> >  .../zh_CN/core-api/memory-allocation.rst      | 138 +++++++++++
> >  .../translations/zh_CN/core-api/mm-api.rst    | 110 +++++++++
> >  .../core-api/unaligned-memory-access.rst      | 229 ++++++++++++++++++
> >  7 files changed, 710 insertions(+), 5 deletions(-)
> >  create mode 100644 Documentation/translations/zh_CN/core-api/boot-time=
-mm.rst
> >  create mode 100644 Documentation/translations/zh_CN/core-api/genalloc.=
rst
> >  create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-=
from-fs-io.rst
> >  create mode 100644 Documentation/translations/zh_CN/core-api/memory-al=
location.rst
> >  create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rs=
t
> >  create mode 100644 Documentation/translations/zh_CN/core-api/unaligned=
-memory-access.rst
>
> This set adds a new warning:
>
>   Documentation/translations/zh_CN/core-api/mm-api.rst:35: WARNING: dupli=
cate label mm-api-gfp-flags, other instance in /stuff/k/git/kernel/Document=
ation/core-api/mm-api.rst
>
> Please fix this and resubmit (and please always test the docs build
> before submitting patches!)
Dear jon

Sorry, this is my fault=E3=80=82
I test it every time, and strangely enough I don't get this warning,
but the tag is obviously unreasonable because the same tag already
exists in the original document.
I will fix it.

Thanks,

Yanteng
