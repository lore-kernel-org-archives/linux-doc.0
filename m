Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B0BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 08:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiC1IUa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 04:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbiC1IUa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 04:20:30 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76173878F
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 01:18:49 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id m67so24676471ybm.4
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KN3NlsusYlj9N26C/gStdQpdQztLVqGqPSjH582Z8Is=;
        b=f5kPrf1YEYWTUjrAsXoZeVa0j1pbs4sWLIYYSY6jja5KKcAL3s/v2ZmB2QM0n8tpRR
         iosLmgDFstqYfSiG4mjWbR0WcHeOAvbhS6/3riyZBwu1/+VJBJVnTEZicvKBNiEpKCGe
         R5HN4G9b+BTDyGfRl3vXkmNQMHk/HAzrABiC9fitD5xdCwAR4V7+gyHqt/n1OgAGs6Pe
         sMKQIbUbdfbbM2QFJZSzkPOjb60W8ckBGiUj7CCarmBXg55rEKIb99I+C5au9VV9iw6u
         AanPrS6/QbzVoBvY1YMRHPS/69QxSLHiEApBgjfChES6P6U3D65m3Mao2TeaV1WUfwDp
         xwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KN3NlsusYlj9N26C/gStdQpdQztLVqGqPSjH582Z8Is=;
        b=ARc1v7B3wwQvu9ZdwO0SIfilzjF6k2/2gh92eX7X3ieH0POXLNMFoE9Y8peVwEKa/l
         kI76IHdyo2JnIMOMZI2WEdyC48b4NjMxOfZYAxYwLSiJnhcBDHAYTKDimpcUjZb5c8hk
         XKNUMPEgQsfAMp7f6GwAl0v/V2vx5+2Lnq5sTnWlNw+sRh5UyQnCdtU5kI09oM9VWo69
         A3+DAbHmIdfmfgkO78S02opv8rQkFLGRvcIN/socNKfPwf/HqSn+iNdSu98f81Col3rs
         QpNpoqWfUTKjufJt7KQKOx6R/M/Xm9NbX2iH/hD75RH0erzTC9clT1ThJ5ibehdXofki
         ooGg==
X-Gm-Message-State: AOAM5332KUuYijTFWPczw0iioL6B9xPaBvEuYbIM2H9JMGt3ag1swfd8
        kbHfC+SFabuQWiqw8ya3TEzFdJ8PH28sjlDCw2Q=
X-Google-Smtp-Source: ABdhPJxzL3G2+wl2PaQc7fUqNTocBeTYBfDvYidCI43v6oVIxCoczbdML1WPfTW8oO7NH/nWifWvuZELJ/cTv3SXbYg=
X-Received: by 2002:a25:6b0f:0:b0:633:d1a3:9dbf with SMTP id
 g15-20020a256b0f000000b00633d1a39dbfmr21972484ybc.216.1648455528918; Mon, 28
 Mar 2022 01:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <cffe009c8b94682200c46fb4d80313f603a65cb6.1647498763.git.siyanteng@loongson.cn>
 <CAJy-AmnCfb+TvFmYfXmTCYSWYQS_w7Q01pg7RQX2Ry3Q7Q7fwA@mail.gmail.com>
In-Reply-To: <CAJy-AmnCfb+TvFmYfXmTCYSWYQS_w7Q01pg7RQX2Ry3Q7Q7fwA@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 28 Mar 2022 16:18:25 +0800
Message-ID: <CAEensMwG7YcVxUQkkfHDkoO=6fUOQTjPkm7ut5HULYiHkLtjUA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] docs/zh_CN: add vm mmu_notifier translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2022=E5=B9=B43=E6=9C=8823=E6=97=A5=E5=
=91=A8=E4=B8=89 20:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Mar 17, 2022 at 2:51 PM Yanteng Si <siyanteng01@gmail.com> wrote:
> >
> > From: Yanteng Si <siyanteng01@gmail.com>
> >
> > Translate .../vm/mmu_notifier.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> > ---
> >  Documentation/translations/zh_CN/vm/index.rst |  3 +-
> >  .../translations/zh_CN/vm/mmu_notifier.rst    | 97 +++++++++++++++++++
> >  2 files changed, 98 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rs=
t
> >
> > diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentat=
ion/translations/zh_CN/vm/index.rst
> > index c1f517da81f4..1fb80aa7a08b 100644
> > --- a/Documentation/translations/zh_CN/vm/index.rst
> > +++ b/Documentation/translations/zh_CN/vm/index.rst
> > @@ -30,14 +30,13 @@ TODO:=E5=BE=85=E5=BC=95=E7=94=A8=E6=96=87=E6=A1=A3=
=E9=9B=86=E8=A2=AB=E7=BF=BB=E8=AF=91=E5=AE=8C=E6=AF=95=E5=90=8E=E8=AF=B7=E5=
=8F=8A=E6=97=B6=E4=BF=AE=E6=94=B9=E6=AD=A4=E5=A4=84=EF=BC=89
> >     frontswap
> >     hwpoison
> >     memory-model
> > +   mmu_notifier
> >
> >  TODOLIST:
> >  * arch_pgtable_helpers
> >  * free_page_reporting
> >  * hmm
> >  * hugetlbfs_reserv
> > -
> > -* mmu_notifier
> >  * numa
> >  * overcommit-accounting
> >  * page_migration
> > diff --git a/Documentation/translations/zh_CN/vm/mmu_notifier.rst b/Doc=
umentation/translations/zh_CN/vm/mmu_notifier.rst
> > new file mode 100644
> > index 000000000000..9a85d6acb249
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/vm/mmu_notifier.rst
> > @@ -0,0 +1,97 @@
> > +:Original: Documentation/vm/mmu_notifier.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> > +
> > +:=E6=A0=A1=E8=AF=91:
> > +
> > +
> > +
> > +=E4=BB=80=E4=B9=88=E6=97=B6=E5=80=99=E9=9C=80=E8=A6=81=E9=80=9A=E7=9F=
=A5=E5=86=85=E9=A1=B5=E8=A1=A8=E9=94=81=EF=BC=9F
>
> Is it better to translate as "=E4=BB=80=E4=B9=88=E6=97=B6=E5=80=99=E9=9C=
=80=E8=A6=81=E9=A1=B5=E8=A1=A8=E9=94=81=E5=86=85=E9=80=9A=E7=9F=A5"?
OK!,Thanks.

Thanks,
Yanteng
>
> Thanks
> Alex
