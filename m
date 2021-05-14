Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7A9C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 14:48:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBF7761458
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 14:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhENOuC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 10:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbhENOuC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 10:50:02 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D491CC061574
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 07:48:50 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id j75so28615853oih.10
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eOVFm8rbU133KQfhF//WLp4L9JCF7FKKRj+3pypkYD8=;
        b=Loa2bCKsT0INkTEv4Eo+Jpu0zXXi/6YZbfpphvojmTQyiPdeWikuGQnz/WWfwn8sTE
         FNVavTX0lTe8UDjbms+JpnntPkBNQUAm5eUeNjm6KNxgSAF4LvCMu14CBsUG6CvXjij1
         xdPAN3MCrxY2FtEd3Kghb7iZUL2vhdv/JXHtP9qo2p6HGuZf9TKTj98A0ROkomPQdX/w
         tPus+cIu+dVcAGiqY26LjC+o3PgCPdbQl4/PtNi2ZoSqSnCuVLXxyBALkxVBNy++1Xv6
         jcj6f+qTLY52IosA0Klvh/KhzEj/X0UnkV/5vxOdTBx9O/5NDjdrkCBT2g/Suuz8qEuP
         yamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eOVFm8rbU133KQfhF//WLp4L9JCF7FKKRj+3pypkYD8=;
        b=JpqY79kzCdGmxBQZg5vBHsKUj9gnr+C+oSsqIHxC8q9DJ+TcfyIegpdcfPNpy6skqz
         lnIIcQQYO84vCMipmIQ9xTQ1brpmpumDXm/oBcoel3M3Jel+Fl15F9jz8oxsZFvxsz37
         R7tt4fcYLDRHqMB94L3mYEnS2IeyRJ/cHt6h9HRTv1n/NdOoSKTiarrTSs73HCqVrDdR
         AYZAuVo66IxdvqccsWy+2MGIj6QYSJoNZGT07ewwdK8GjXWwsO+IwS1c9wGeGhQRl+vV
         N0ZuGO8LfFVreGe88Bt79TYOKLuKHbSTks7CBfJ7fsQJTg/jT1yQAQRYTXHJcKJlxEfd
         BUug==
X-Gm-Message-State: AOAM5301wZ0ufRU+zTymMpyNQ+Y/0xFU5ogwXBeefRZFDhfVV7Km3ilo
        ulhgmjBx3TI7vsJWCKonIP5Ad8FAybTX3wNLrsjnBxFD
X-Google-Smtp-Source: ABdhPJxwhRs6je7i5NzcHymh3Y2bZzJUQu1+XfXb54BPRdv4gACLLoi/9De3A5fVBfuToiT54R1RCob4b11uEfXWIQU=
X-Received: by 2002:aca:5783:: with SMTP id l125mr34966379oib.130.1621003730258;
 Fri, 14 May 2021 07:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210512083341.914-1-siyanteng@loongson.cn> <87lf8i7jbj.fsf@meer.lwn.net>
 <87o8de61zz.fsf@meer.lwn.net> <4eb9f549-d734-a5d2-aa2a-e66d009a31e5@gmail.com>
 <CAEensMx6HxD5_Gv2Snd+OGOF0MNU4fsuB_z_pCDWyW8z+5SC=Q@mail.gmail.com>
 <c91e7f95-0c48-292c-d353-d2ca4ac62051@gmail.com> <CAEensMzfzYasxCjnwR9T7ULa6EW7NWB4Y=nnLP+HX8RLvxiNVQ@mail.gmail.com>
 <6e364571-b1ea-26d6-8b7e-246a24ac07ab@gmail.com>
In-Reply-To: <6e364571-b1ea-26d6-8b7e-246a24ac07ab@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 14 May 2021 22:48:39 +0800
Message-ID: <CAEensMzL31Lq2NTVC74hfQyPy+7mTd=74p5Kkamf4LZ_GAieLA@mail.gmail.com>
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
=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:40=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/14 =E4=B8=8B=E5=8D=885:47, yanteng si wrote:
> > Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:30=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> On 2021/5/14 =E4=B8=8B=E5=8D=885:09, yanteng si wrote:
> >>> Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8812:53=E5=86=99=E9=81=93=EF=BC=9A
> >>>>
> >>>>
> >>>>
> >>>> On 2021/5/14 =E4=B8=8A=E5=8D=8812:18, Jonathan Corbet wrote:
> >>>>>>> This patch translates Documentation/core-api/workqueue.rst into C=
hinese.
> >>>>>>>
> >>>>>>>
> >>>>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> >>>>>>> Reviewed-by: Alex Shi <alexs@kenrel.org>
> >>>>>> I fixed that typo too - it appears to originate from Alex...:)
> >>>>
> >>>> Sorry for the typo.
> >>>>
> >>>>> Actually, I've dropped this back out; it creates vast numbers of
> >>>>> warnings:
> >>>>>
> >>>>>> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:=
3: WARNING: Duplicate C declaration, also
> >>>>>> defined at translations/zh_CN/core-api/workqueue:3.
> >>>>> This will be the result of the ".. kernel-doc::" directives at the =
end,
> >>>>> which create new definitions (within sphinx) for all the symbols pu=
lled
> >>>>> in.
> >>>>>
> >>>>> In the long term, we may want to try to find some sort of fix for t=
his.
> >>>>> But we're really just recreating a bunch of (English-language)
> >>>>> documentation that's already rendered once; I'm not sure it makes a=
ny
> >>>>> real sense to do that.  So I would suggest that, for now, when you =
are
> >>>>> translating documents with kernel-doc directives, you should leave =
those
> >>>>> directives out.  Stick in a note directing readers to the original =
if
> >>>>> they want to see that material...
> >>>>>
> >>>>> Make sense?
> >>>>
> >>>> Yes, it is a reasonable solution for now.
> >>> OK, I will.
> >>> I will remove them and then direct the reader to the original
> >>> document. just like:
> >>>
> >>> .. note:: =E6=8A=B1=E6=AD=89=EF=BC=8C=E7=94=B1=E4=BA=8E=E5=8E=9F=E5=
=A7=8B=E6=96=87=E6=A1=A3=E5=9C=A8=E6=AD=A4=E5=A4=84=E4=BA=A4=E5=8F=89=E5=BC=
=95=E7=94=A8=E4=BA=86=E4=BB=A3=E7=A0=81=E4=B8=AD=E7=9A=84=E6=B3=A8=E9=87=8A=
=EF=BC=8C=E8=80=8C=E7=8E=B0=E5=9C=A8=E5=B9=B6=E4=B8=8D=E6=98=AF=E7=BF=BB=E8=
=AF=91=E8=BF=99=E4=BA=9B=E6=B3=A8=E9=87=8A=E7=9A=84=E5=A5=BD=E6=97=B6=E6=9C=
=BA=EF=BC=88=E5=B0=86=E4=BC=9A=E5=B8=A6=E6=9D=A5=E5=BE=88=E5=A4=9A=E7=BC=96=
=E8=AF=91=E8=AD=A6=E5=91=8A=EF=BC=89=EF=BC=8C=E6=89=80=E4=BB=A5=E8=AF=B7=E6=
=9A=82=E6=97=B6=E6=B5=8F=E8=A7=88=E8=8B=B1=E6=96=87=E6=96=87=E6=A1=A3=EF=BC=
=8C=E9=93=BE=E6=8E=A5=E5=9C=A8=E6=9C=AC=E6=96=87=E6=A1=A3=E9=A1=B6=E9=83=A8=
=E3=80=82
> >>
> >> Jon said just remove kernel-doc, not all line? If so, don't need above=
 explanation.
> > just like:
> >
> >  +=E5=88=97=E8=A1=A8=E7=AE=A1=E7=90=86=E5=87=BD=E6=95=B0
> >  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  +
> > -+.. kernel-doc:: include/linux/list.h
> > + include/linux/list.h
>
> I prefer sth like in this line, does this look fine?
>
>   + check the functions in include/linux/list.h in kernel source code.
Yes, it's fine!

Thanks,
Yanteng
>
> >  +   :internal:
> >  +
> >  +=E5=9F=BA=E6=9C=AC=E7=9A=84C=E5=BA=93=E5=87=BD=E6=95=B0
> >  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> _< ?
> >
> > Thanks,
> >
> > Yanteng
> >
