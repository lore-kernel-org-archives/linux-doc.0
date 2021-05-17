Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2A3C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 08:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A2960C3D
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 08:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235630AbhEQIT6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 04:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbhEQISp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 04:18:45 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4ACC061756
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 01:17:12 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso4844672otg.9
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PmvpOx9ImcKd9uOyOmqdYvw3qLQXhEw9JZJsnY9FJCE=;
        b=bWZZ/m47NenTQSUihlMG/OANaqesU4bGMRZx022+FRmx8mOHV7Ss5plQ3n6qK90QmY
         Esyp1BLDdazb58EsgxhA4j88DHvs2dFWzDwaFK++bBqXG2WggkGYoT6ifmxP7Yepb4h1
         cCg+Fm+yH0xcjW96yybhFWlAbZ8beqavqTRqtdoNt0Qo9NmXTy7kFGYgGe++VUYRSOv1
         X1d1Wt3ZPY94sjSxJjXcK2Y6iByJFGJl+9wIl5mMzwOrsNf1IR7E1enFImSMoA2RHhQ0
         NjzXjWibIl6foMXd/5Ky/7zBlmzUbQlTP5Y7K0Bi5lhc1ueWTIb0cEh6cw2W4cEmXNv7
         qU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PmvpOx9ImcKd9uOyOmqdYvw3qLQXhEw9JZJsnY9FJCE=;
        b=fn5h0nGyLTwbBiuyj2NJFSh4VoL1MFmPJCl9iSKj4p5RxHdWeZbxOxnGvPwb+CvrBy
         SN4rfuL3zTTXkLH13Uh4f6//zjVg8GicqgA3+hzKmAuUP9WiHC0iAl6mRuUD3rQt66ch
         sbvuHyMUm6rmCPSydEJ05lvY3ap5KIaXbi0TWJkx6uV1opoi/KhWFdLEKDOzfDp9se3f
         aNhPktrnIEmPvW++b/5RrfKl95uKKpuPyzJFeZJA42PBfCguY1r6g/locdo5iLpfBph1
         f0Si8l/5TpBD/KgYqvvNRvmvQbgAv1s8ufPBaxnRfna5v8HhgEyIDOWwx9fnOweIDlbY
         h3Iw==
X-Gm-Message-State: AOAM532o8Op8pRAfyj7mgwezQw1aZFw/SRYzjZeOxlRcFWQ45axVYZgD
        FR1/p3lqJEOpI+PogVW5I6h4WfFWuRI7/JQ/tOk=
X-Google-Smtp-Source: ABdhPJxy8BfVCI/XuU8R9Cwp6XyxUOFAcjnorDiIZbX7uUG1KVB93H8+2A5zWFZtODF4FudpsulSvQ5lUVHZZhBLsUI=
X-Received: by 2002:a05:6830:1e3b:: with SMTP id t27mr213898otr.243.1621239431987;
 Mon, 17 May 2021 01:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621062577.git.siyanteng@loongson.cn> <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
 <87f7bb59-cb85-de95-4e8d-72784686b9b9@gmail.com> <CAEensMydFLpmUaCHUYwQ7d_WR+HDbPboTdMAOA+H+FUqcaur_g@mail.gmail.com>
 <e371a1e6-d38d-f5fc-1ad6-1aee116da468@gmail.com>
In-Reply-To: <e371a1e6-d38d-f5fc-1ad6-1aee116da468@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 17 May 2021 16:17:01 +0800
Message-ID: <CAEensMxi4Vj24iSQ6GfrB9uG6OqxS4RCpRNr-Rd2j+5XKVsOGg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] docs/zh_CN: add core-api kernel-api.rst translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8817=E6=97=A5=E5=
=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=8811:21=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/17 =E4=B8=8A=E5=8D=889:55, yanteng si wrote:
> > Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8816=E6=97=
=A5=E5=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=8811:30=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> On 2021/5/15 =E4=B8=8B=E5=8D=884:10, Yanteng Si wrote:
> >>
> >>> +=E5=AE=89=E5=85=A8=E6=A1=86=E6=9E=B6
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +check the functions in security/security.c in kernel source code.
> >>> +   :internal:
> >>> +
> >>> +check the functions in security/inode.c in kernel source code.
> >>> +   :export:
> >>> +
> >>> +=E5=AE=A1=E8=AE=A1=E6=8E=A5=E5=8F=A3
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +check the functions in kernel/audit.c in kernel source code.
> >>> +   :export:
> >>> +
> >>> +check the functions in kernel/auditsc.c in kernel source code.
> >>> +   :internal:
> >>> +
> >>> +check the functions in kernel/auditfilter.c in kernel source code.
> >>> +   :internal:
> >>> +
> >>
> >> Too verbose w/o much useful info, Is the following better?
> >>
> >>   APIs in kernel code: kernel/audit.c, kernel/auitsc.c and kernel/audi=
tfilter.c
> >>
> >>   =E8=AF=A5 APIs =E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=
=A3=E7=A0=81=E4=B8=AD kernel/audit.c, kernel/auitsc.c and kernel/auditfilte=
r.c
> > It looks great, but in some cases, sentences that are too long have
> > some difficulty with a new line, and they are not neat after the new
> > line.
> > For example::
> >
> > =E8=BF=99=E4=BA=9B=E5=87=BD=E6=95=B0=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=
=85=E6=A0=B8=E4=BB=A3=E7=A0=81=E4=B8=AD include/asm-generic/bitops/instrume=
nted-atomic.h=EF=BC=8C
> > include/asm-generic/bitops/instrumented-non-atomic.h and
> > include/asm-generic/bitops/instrumented-lock.h
> > ...
> >
> > how about::
> >
> > =E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> >
> > kernel/audit.c
> > kernel/auitsc.c
> > kernel/auditfilter.c
> >
> > =E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> >
> > include/asm-generic/bitops/instrumented-atomic.h
> > include/asm-generic/bitops/instrumented-non-atomic.h
> > include/asm-generic/bitops/instrumented-lock.h
>
> Right split them into multiple lines looks better.
OK=EF=BC=81

Thanks,
 Yanteng
