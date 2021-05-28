Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCA7C47089
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 02:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DA0B613B8
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 02:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235369AbhE1CoS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 22:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhE1CoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 22:44:17 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAA4C061574
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 19:42:43 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id j75so2848643oih.10
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 19:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EvsO9e32vLZJeRDc8t4S3SOF31LwJxfs9wzrjCzCnPE=;
        b=TgBuOMu6XVQQpRW08GlKr7tD87PgrQ2Kghdpwb96rts98+l3/f9kLDggpGgQLc1//r
         S643zZM6YuydIIqqe3TeflEB+79M9VAX3g94CERlHV8BKAt6NGQ8qoCSoeuohIIca2Y9
         0QY8EjdfQij1ij7J4C2NjK8ElfzW9x2LocFFy2r1MnBdtn6p9fsicmIMfUONI3ZkY75u
         QdgoAH5iim4hC7w+bA9p29CFsiWRy3pKSzGQYhTzy7BeNO8dHKnDV+EZA+nOQUo9xMxz
         bpPMJqh59fn3n6c1VY/s3Q19Pa9kaOQ0Hg19WgMm77RRDmIh2TFVSWNtZJCGqa1CIJJg
         ndIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EvsO9e32vLZJeRDc8t4S3SOF31LwJxfs9wzrjCzCnPE=;
        b=ftXNhqbtJDQURaoVKylbaEqGDlVWTHa4v3hUjjCaoXeCJqWBhxvEqyDTaJlPDaQLS2
         Gv46KHGVqHxlYszKoMGdRwx1I/MsWIm1ITUXJbcGJ5Hhr+7ZIdmCNshWD+3cW3UG53qD
         E0Y1RvGDrm0IhauGUMKS/xjM8/HOuvbtYZUWyJrZBpKKvRL890O79ndUl+UlIOwd4gqS
         vTcUegtawX61oinfaSG+dVt6K5TeZqql4hncwYMS62yjIrpECQ/M3kmCjar4jLmjp8E7
         7XisibZIXy9OJr5UR3GcUvTp4FqFR/yvDmHO8vIwCo4a/ktVUk/8qpoGaDp4w9PpVK2E
         dE1w==
X-Gm-Message-State: AOAM533g1r0yf9r8Q4969R+stp+ufn/G6osjkevVztJg4oqdpwSv6UIo
        rC+lnSz2ZOB+Zvt9Bq61CU+NWJQuHGB0CToW8CY=
X-Google-Smtp-Source: ABdhPJxSwFXCop6y8sKmrGbLSFngHU/YQjZf4IDWnTLwSgpWywVnVLg61F37vi91GygV8Ucyo2I5DFtAjyhgJsbfSXQ=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr4402675oic.103.1622169762368;
 Thu, 27 May 2021 19:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210521083908.3783492-1-siyanteng@loongson.cn> <87mtsg2lrk.fsf@meer.lwn.net>
In-Reply-To: <87mtsg2lrk.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 28 May 2021 10:42:31 +0800
Message-ID: <CAEensMw+fHpFeq76gv2bSKTq-MD36kG0QUdYacUhQkUZ_3Q8sw@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_CN: update Chinese translations
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B45=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:18=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > Two new commits were added to the original document:
> >
> > commit ddba35031db2ea89facc91c745e5ad55ba2e0e7f
> > commit 20bc8c1e972f29afcac85e524e430c11a6df5f58
> >
> > translate them into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/core-api/printk-formats.rst           | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
>
> I've applied these, but ... in the future, please use the canonical
> format for referring to other commits:
>
>   commit ddba35031db2 ("module: add printk formats to add module build ID=
 to stacktraces")
Okay, will do.

Thanks,

Yanteng
