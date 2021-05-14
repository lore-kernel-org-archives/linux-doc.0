Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1C1C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:09:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB285613DF
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhENJKx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 05:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhENJKx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 05:10:53 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDE9C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:09:41 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id t4-20020a05683014c4b02902ed26dd7a60so15793509otq.7
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zVCHNU9croTm9+AFFA++qGI5Gme6Ic4s5L5cKzCmit0=;
        b=AIjRHlL38EfgXM2u1Lol82rvBfirO8moHdwLSv0eE6JRnAGQVkjXl2wsfvXYfeO5nN
         rGQQVrWvR8iZTt75Bjd17Dvzgv+Evs0EgYxVl2Bf/kCnHVht5h3JKOFOdLArOxQdN44d
         1gg8gJv3sncJa5iQ8R0DI8SRnmAT11UeN1aoCsBL3NkLC5NTCcM2mk8uODw9f9nQomuC
         hsum1pewhgTB321jEQ6iqrtWa/GWkCEA9MqZ2EPg8W+TKoMaQUBrKF7+L/xZSqztzSFX
         O18zBD3awl2WQ2mVk7lZfoehfH/IAFRh7zp6Els8E7dfLj/BejlZ2qxrfI3EV1tTS2J6
         Rg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zVCHNU9croTm9+AFFA++qGI5Gme6Ic4s5L5cKzCmit0=;
        b=EcF9iatJ0c27DQtBOUGlzIh0qke9UX6oKO9FabSpiUViRQqgZYOfUG5WPCoV6yAczL
         S+8vjnG7EpAnYzr1uRggswKCGIKfSIMIvkEfoRpd1hsIdrYTOt9dkeZT/nZJpJigWPAu
         5B/1ncvw4Iag2noq9/l5kOihoyvS+ZUbqXWrmwgvWy8zpQ5WQLmnTcYcNzVba2ejz1RV
         hHU2DBIQ60mzo7dwoWYQtemJQcyPJWpId/AMUPJW7CFIxEKv5HLdFZWO1YDWHX8riFP7
         nsZA7LIs8oGnTh8vcQZOXqVFvrXcJ2MkLZUsn5OxIB2M2DoRHqyBy5q+BtCqn3uaZIwd
         malg==
X-Gm-Message-State: AOAM5339LqohyoP8Lsg8zG7YnJOin/IwFybjwpJW2/rRlAQg95Mx140A
        e45HjNwXDVrPhTj36W16dp2Os0euQpdYwsmFVnA=
X-Google-Smtp-Source: ABdhPJyF+pM/xd0kKxGmaNBI9il0FAx9FjILULyrhhzuVPTTKN4y2e++p0SjPIiJGFPs+R7jSUJbbyHdl2SrKH2OcHU=
X-Received: by 2002:a9d:58c5:: with SMTP id s5mr40103562oth.243.1620983380841;
 Fri, 14 May 2021 02:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210512083341.914-1-siyanteng@loongson.cn> <87lf8i7jbj.fsf@meer.lwn.net>
 <87o8de61zz.fsf@meer.lwn.net> <4eb9f549-d734-a5d2-aa2a-e66d009a31e5@gmail.com>
In-Reply-To: <4eb9f549-d734-a5d2-aa2a-e66d009a31e5@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 14 May 2021 17:09:30 +0800
Message-ID: <CAEensMx6HxD5_Gv2Snd+OGOF0MNU4fsuB_z_pCDWyW8z+5SC=Q@mail.gmail.com>
Subject: Re: [PATCH v3] docs/zh_CN: add core-api workqueue.rst translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=A5=E5=
=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8812:53=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/14 =E4=B8=8A=E5=8D=8812:18, Jonathan Corbet wrote:
> >>> This patch translates Documentation/core-api/workqueue.rst into Chine=
se.
> >>>
> >>>
> >>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> >>> Reviewed-by: Alex Shi <alexs@kenrel.org>
> >> I fixed that typo too - it appears to originate from Alex...:)
>
> Sorry for the typo.
>
> > Actually, I've dropped this back out; it creates vast numbers of
> > warnings:
> >
> >> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:3: W=
ARNING: Duplicate C declaration, also
> >> defined at translations/zh_CN/core-api/workqueue:3.
> > This will be the result of the ".. kernel-doc::" directives at the end,
> > which create new definitions (within sphinx) for all the symbols pulled
> > in.
> >
> > In the long term, we may want to try to find some sort of fix for this.
> > But we're really just recreating a bunch of (English-language)
> > documentation that's already rendered once; I'm not sure it makes any
> > real sense to do that.  So I would suggest that, for now, when you are
> > translating documents with kernel-doc directives, you should leave thos=
e
> > directives out.  Stick in a note directing readers to the original if
> > they want to see that material...
> >
> > Make sense?
>
> Yes, it is a reasonable solution for now.
OK, I will.
I will remove them and then direct the reader to the original
document. just like:

.. note:: =E6=8A=B1=E6=AD=89=EF=BC=8C=E7=94=B1=E4=BA=8E=E5=8E=9F=E5=A7=8B=
=E6=96=87=E6=A1=A3=E5=9C=A8=E6=AD=A4=E5=A4=84=E4=BA=A4=E5=8F=89=E5=BC=95=E7=
=94=A8=E4=BA=86=E4=BB=A3=E7=A0=81=E4=B8=AD=E7=9A=84=E6=B3=A8=E9=87=8A=EF=BC=
=8C=E8=80=8C=E7=8E=B0=E5=9C=A8=E5=B9=B6=E4=B8=8D=E6=98=AF=E7=BF=BB=E8=AF=91=
=E8=BF=99=E4=BA=9B=E6=B3=A8=E9=87=8A=E7=9A=84=E5=A5=BD=E6=97=B6=E6=9C=BA=EF=
=BC=88=E5=B0=86=E4=BC=9A=E5=B8=A6=E6=9D=A5=E5=BE=88=E5=A4=9A=E7=BC=96=E8=AF=
=91=E8=AD=A6=E5=91=8A=EF=BC=89=EF=BC=8C=E6=89=80=E4=BB=A5=E8=AF=B7=E6=9A=82=
=E6=97=B6=E6=B5=8F=E8=A7=88=E8=8B=B1=E6=96=87=E6=96=87=E6=A1=A3=EF=BC=8C=E9=
=93=BE=E6=8E=A5=E5=9C=A8=E6=9C=AC=E6=96=87=E6=A1=A3=E9=A1=B6=E9=83=A8=E3=80=
=82


Thanks=EF=BC=8C
Yanteng
>
> Thanks
> Alex
> >
> > Thanks,
> >
> > jon
> >
