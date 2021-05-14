Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD27C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C48B961451
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhENJsz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 05:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhENJsy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 05:48:54 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DA5C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:47:42 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso25996774otg.9
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H0sw9PgWYZEA5+nFmT+DHOWqsEA0QrIszEzgbMErT7c=;
        b=e+PpD1M3mwUxsHCouIiXZl8B31ON4w3Uxs0+DqjSTT/SbD9iNPIlXUkDGKLJSD4sei
         bk7pBaJINpRaKuuTlSjCG80RACLW+W8KFtyNOQGJcN22fIgzbG+oHJhClf3IVnz0oiXz
         D6wa0VB8QNZIaaN7igtJyDJJvsI1VffsgPMZ9P6lL9CaR4ofGJ0TnWwxF+NbLzJJX/Fp
         Zgz3MyARNGYN31WmtOw6DBnztLV045p0/yb3lPVPex68dSQ4oG7tcZyrf9sfD9Z5aI1g
         to8pROeMkeiud6FzE7OR6vZRq7YRX8VGYxBh6XtmHBPoLCzjBNUuQ8C2+cUFGJT5oXWq
         Fz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H0sw9PgWYZEA5+nFmT+DHOWqsEA0QrIszEzgbMErT7c=;
        b=pey1BQkE2AAxnamwObdEwvJZhgaiF/XwWI1FR5hFrenpwlkFj/Y/AakaGxmMiAW0uV
         iwV3JD5Tqb1cWRJwLpf9SkzMnaJpuPeyFYn30SmXW4BwwzT28+Sk8OQNXl6erDyhPYIc
         8UuT8wkUnv0YyVnphQWn9ngypP/u8rJk8lZ0QKgiD6zQo5g2Xeb2hqZXbq37Kbdoa88L
         YXrfAZFVaH+EWy2C0m/oyO6ZjS9kXmbop5g9EEj8l2Y6KRuw8uljcNXTG8XqVOeExu76
         uMmrr3xPgg7I13ZpGiAtmDoTuIdn4csNfq2Ow5VkNyKGM6E/wILUK6HF1EItKrY4jSnD
         bRUw==
X-Gm-Message-State: AOAM531HK7Tl7Pmx8abYTIxKTDeEhkYP7CFq/Um6NGuGiouFHWZGFwon
        E08NSNTtouNJNGYFRbnhvXoJD9wOfwrwrUJhaTDMQ9A7GAg=
X-Google-Smtp-Source: ABdhPJww/rADtyNlUpW0dd6VDwoQJ+XpozSDk1cPCl0DndUflpx8tKV+D/Yg57ej5miDn84ypBsyF5PbwVeMzOWzoa4=
X-Received: by 2002:a9d:58c5:: with SMTP id s5mr40237403oth.243.1620985662122;
 Fri, 14 May 2021 02:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210512083341.914-1-siyanteng@loongson.cn> <87lf8i7jbj.fsf@meer.lwn.net>
 <87o8de61zz.fsf@meer.lwn.net> <4eb9f549-d734-a5d2-aa2a-e66d009a31e5@gmail.com>
 <CAEensMx6HxD5_Gv2Snd+OGOF0MNU4fsuB_z_pCDWyW8z+5SC=Q@mail.gmail.com> <c91e7f95-0c48-292c-d353-d2ca4ac62051@gmail.com>
In-Reply-To: <c91e7f95-0c48-292c-d353-d2ca4ac62051@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 14 May 2021 17:47:31 +0800
Message-ID: <CAEensMzfzYasxCjnwR9T7ULa6EW7NWB4Y=nnLP+HX8RLvxiNVQ@mail.gmail.com>
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
=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:30=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/14 =E4=B8=8B=E5=8D=885:09, yanteng si wrote:
> > Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8812:53=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> On 2021/5/14 =E4=B8=8A=E5=8D=8812:18, Jonathan Corbet wrote:
> >>>>> This patch translates Documentation/core-api/workqueue.rst into Chi=
nese.
> >>>>>
> >>>>>
> >>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> >>>>> Reviewed-by: Alex Shi <alexs@kenrel.org>
> >>>> I fixed that typo too - it appears to originate from Alex...:)
> >>
> >> Sorry for the typo.
> >>
> >>> Actually, I've dropped this back out; it creates vast numbers of
> >>> warnings:
> >>>
> >>>> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:3:=
 WARNING: Duplicate C declaration, also
> >>>> defined at translations/zh_CN/core-api/workqueue:3.
> >>> This will be the result of the ".. kernel-doc::" directives at the en=
d,
> >>> which create new definitions (within sphinx) for all the symbols pull=
ed
> >>> in.
> >>>
> >>> In the long term, we may want to try to find some sort of fix for thi=
s.
> >>> But we're really just recreating a bunch of (English-language)
> >>> documentation that's already rendered once; I'm not sure it makes any
> >>> real sense to do that.  So I would suggest that, for now, when you ar=
e
> >>> translating documents with kernel-doc directives, you should leave th=
ose
> >>> directives out.  Stick in a note directing readers to the original if
> >>> they want to see that material...
> >>>
> >>> Make sense?
> >>
> >> Yes, it is a reasonable solution for now.
> > OK, I will.
> > I will remove them and then direct the reader to the original
> > document. just like:
> >
> > .. note:: =E6=8A=B1=E6=AD=89=EF=BC=8C=E7=94=B1=E4=BA=8E=E5=8E=9F=E5=A7=
=8B=E6=96=87=E6=A1=A3=E5=9C=A8=E6=AD=A4=E5=A4=84=E4=BA=A4=E5=8F=89=E5=BC=95=
=E7=94=A8=E4=BA=86=E4=BB=A3=E7=A0=81=E4=B8=AD=E7=9A=84=E6=B3=A8=E9=87=8A=EF=
=BC=8C=E8=80=8C=E7=8E=B0=E5=9C=A8=E5=B9=B6=E4=B8=8D=E6=98=AF=E7=BF=BB=E8=AF=
=91=E8=BF=99=E4=BA=9B=E6=B3=A8=E9=87=8A=E7=9A=84=E5=A5=BD=E6=97=B6=E6=9C=BA=
=EF=BC=88=E5=B0=86=E4=BC=9A=E5=B8=A6=E6=9D=A5=E5=BE=88=E5=A4=9A=E7=BC=96=E8=
=AF=91=E8=AD=A6=E5=91=8A=EF=BC=89=EF=BC=8C=E6=89=80=E4=BB=A5=E8=AF=B7=E6=9A=
=82=E6=97=B6=E6=B5=8F=E8=A7=88=E8=8B=B1=E6=96=87=E6=96=87=E6=A1=A3=EF=BC=8C=
=E9=93=BE=E6=8E=A5=E5=9C=A8=E6=9C=AC=E6=96=87=E6=A1=A3=E9=A1=B6=E9=83=A8=E3=
=80=82
>
> Jon said just remove kernel-doc, not all line? If so, don't need above ex=
planation.
just like:

 +=E5=88=97=E8=A1=A8=E7=AE=A1=E7=90=86=E5=87=BD=E6=95=B0
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +
-+.. kernel-doc:: include/linux/list.h
+ include/linux/list.h
 +   :internal:
 +
 +=E5=9F=BA=E6=9C=AC=E7=9A=84C=E5=BA=93=E5=87=BD=E6=95=B0
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>_< ?

Thanks,

Yanteng
