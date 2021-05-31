Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CBEC47080
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 12:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC99161263
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 12:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhEaMXr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 May 2021 08:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhEaMXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 08:23:46 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E559C061574
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 05:22:05 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id d21so12076652oic.11
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U61pEjUdvLqlQTUe1eM4ywP82Zv7sQg37AOJIphtWv4=;
        b=GDwSYJaak/pxGZlCXgb6rpo3Pin0m1k+R2WtOevBM26l14EZR1rNvCpZda3n1218ld
         5UBNJg2ofoptNSMV2dnKYNUFccn68R7DC1rd8TvmHh0FDg+FuBsdZ8H+WHnbX/UVOSSb
         FncvjvkeiGugrNmS4CT2nNEVg5CGsY7HN6D+Eca90Cmjc4mAkcA3bnZzeJlgOJrdkG9Y
         7Z4SUakGZgqDu9t792tH7RfMzMbKRL5FDjo/NLvdhfdvK9bOjlvSdGsK/AT1Q5m9LiQy
         9wK0e5adYvtMXH/fGsOuZjwjMgpocrskHYnaqd01eZGnCEPanYTU+qO2UjtbOXLfZz/p
         MPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U61pEjUdvLqlQTUe1eM4ywP82Zv7sQg37AOJIphtWv4=;
        b=IARr7KiuoQI9Kygew6GrPsczOpgz+LCY9dwBM8U9iiJuFkp7kO3/2xu6Pqd02B+hmL
         l2vhITMK1nHJdaZX9qhyGO1JhgkiGgFTCWESIAMm09Ps0g/d4/vBplUnHSHFClUVq3gE
         aA0tvv5eU9a4C4V5O7Eb47RUrClX4E5oEuwQU3Zuw3EkIPfpUXMbquUyj55SO8yQ4I5U
         OwK20poQI68o9eAnr0UGqtKIHrzyHxp1BHj4d0CBADmI3EMjyGAMNYuL1RZ0Gqj13miY
         E6O7yZhw2gMDjYzRodE+MW+ZW1qbBHYSutE9bHdHS3cxR37pLFQozYXBn3f9chgjz6o/
         Ftmg==
X-Gm-Message-State: AOAM532P50BZDKe/UtNZgw2IA2jTy/SAZkX8qcy0HRfKl5tlmEDsaCwH
        B1R3uRTmfSIi84NQiMXokHzvcRN3QDTNDDrNfgY=
X-Google-Smtp-Source: ABdhPJwkj/Nltv969LklmhbJRzpA/nrjBRmbYwQ7IBja/0HikddUAI8JYRv5iiXea/UGM+WCrbWGqmHFzujPtyuDFpQ=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr13740869oic.103.1622463724448;
 Mon, 31 May 2021 05:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210527043118.3835070-1-siyanteng@loongson.cn>
 <4fed765c-b2c0-5cb5-8d7a-5b3dec3cd3f0@gmail.com> <CAEensMyGHOQ6DMkU_WHByQJbAD8L+-M5uvj1AwVs+Dp=coYLQw@mail.gmail.com>
 <bd3b4235-b828-ce63-4cb2-f395c6190f29@gmail.com>
In-Reply-To: <bd3b4235-b828-ce63-4cb2-f395c6190f29@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 31 May 2021 20:21:53 +0800
Message-ID: <CAEensMxpN1o0wHfHMDMJGKaYFM_5ZEWbNxKpdLe+tesaHRM1zg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add core api cachetlb translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8831=E6=97=A5=E5=
=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:04=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/31 =E4=B8=8B=E5=8D=885:18, yanteng si wrote:
> > Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8831=E6=97=
=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=8811:11=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> On 2021/5/27 =E4=B8=8B=E5=8D=8812:31, Yanteng Si wrote:
> >>> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b=
/Documentation/translations/zh_CN/core-api/cachetlb.rst
> >>> new file mode 100644
> >>> index 000000000000..9568c15f4139
> >>> --- /dev/null
> >>> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> >>> @@ -0,0 +1,319 @@
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +Linux=E4=B8=8B=E7=9A=84=E7=BC=93=E5=AD=98=E5=92=8CTLB=E5=86=B2=E6=B4=
=97
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>
> >> Guys,
> >>
> >> I don't insist on the 'flush' translation, although it is used to be t=
ranslated
> >> as =E5=88=B7=E6=96=B0. I just never see it was translated as =E2=80=98=
=E5=86=B2=E6=B4=97=E2=80=99 in computer area.
> >>
> >> Any more comments or suggestions for this?
> > Dear Alex,
> >
> > I admit that "=E5=86=B2=E6=B4=97" doesn't sound very good. But,How to t=
ranslate
> > "refresh=EF=BC=88=E5=88=B7=E6=96=B0=EF=BC=89"?:-)
> >
> > The act of "flush" is to invalidate dirty data=EF=BC=8CThis is obviousl=
y not
> > consistent with the act of "refreshing", which is simply invalid.
> > "=E5=88=B7=E6=96=B0"  is actually two operations, i.e. brush off the ol=
d one and come
> > back to the new one.
> >
>
> This make sense, but would the word =E5=86=B2=E5=88=B7 better? A brand ne=
w word may take
> more time to be custom.
Okay, I will use =E2=80=9C=E5=88=B7=E6=96=B0=E2=80=9D.

Thanks,
Yanteng
>
>
> > BTW=EF=BC=9A
> > flush is ambiguous in the description of cache management because it
> > can mean both invalidation and write-back, while TLB only has an
> > invalidation operation here, so there is no ambiguity in using flush
> > here.
> >
> > Thanks,
> > Yanteng
> >
