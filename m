Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAD0C47082
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 09:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE30060FF1
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 09:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhEaJUN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 May 2021 05:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhEaJUM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 05:20:12 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD93C061574
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 02:18:31 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c31-20020a056830349fb02903a5bfa6138bso3607408otu.7
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0wRq/tXyzbgmgneTcozbYxRgfMqDNXFJJGf+IbPc5Ac=;
        b=nv6wwudD2mrl8Gk+w2yIC5EgFu7znvtb7fT8r3MzCz16Lr+haN8p8G7Vpf6vXOsiMI
         z2V0XP0AmpP4eC8AhciiHmIyoIIqDJJ/bF13EKjwkJxPybWTGKxx7bXvUN2TzqQDl56F
         LbAzrjtthEEIgNhbOk0rRtfdDz2L1JYel92xz2YFr3GHrHb0wQ0+FK1pxuqomkdHYdLK
         5kVKFUFy1CWX9n7L9viyDUYLhY/mfPRzWH/CENGPcba1CmxUEgLVToy4u9aYU2+Frr+l
         RoHurOpDoCYczpIfaKXnoAuIojv/KkKx63RjOhMSPKR8+c9Cr3F7wvHsBLxu7Mtu2yQY
         X10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0wRq/tXyzbgmgneTcozbYxRgfMqDNXFJJGf+IbPc5Ac=;
        b=D3N82XmqS3FJ/dEn1ZlTwgdJ7rGpgFQhIO//vs2o8uRFZOCPCxAhUynrmGdBzmsI3H
         F0CfAhe89+A5Khedmvq7zPbr05zFlGcQ5u/oSNX+675o+iDw6yj+wQu9DmSeyMcCnLLu
         afCZy2ct+n0pAb30dzy/hbyVYLGVICIw8o1n6WHZsSlSBs7M2uXx1oHuVrhZkMiOyKbj
         ACfYorSs8INQKHZ+UFpPB5Y2R0bcwKSSdSVV8xLJjWAWcL+w0S9UXNlFLZfAi823GZ8O
         SzTCd34O4h9ATy4pA/6VjEDwYTzDrR6y2ijKmONms8lJgdjvOsaZvoR23yQ34BX2T1gM
         Mk7g==
X-Gm-Message-State: AOAM532smo5GaunKx+JS2ebCPH9tNfsnnA7GgCFc8fvVag4PIDH7HtXV
        2DFjzzjEKJak938fMR85tP2KvUQ77wxoTCMNQUs=
X-Google-Smtp-Source: ABdhPJz+fc4iqxhAbVzLbKipPtRRfz0pkkOz/kijD5flQyjDfn0c0VmlRqfNqM1NSQOdKy8T1QAIXbSdS9Z3XHxMX0o=
X-Received: by 2002:a05:6830:1e70:: with SMTP id m16mr16406125otr.340.1622452711056;
 Mon, 31 May 2021 02:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210527043118.3835070-1-siyanteng@loongson.cn> <4fed765c-b2c0-5cb5-8d7a-5b3dec3cd3f0@gmail.com>
In-Reply-To: <4fed765c-b2c0-5cb5-8d7a-5b3dec3cd3f0@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 31 May 2021 17:18:20 +0800
Message-ID: <CAEensMyGHOQ6DMkU_WHByQJbAD8L+-M5uvj1AwVs+Dp=coYLQw@mail.gmail.com>
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
=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=8811:11=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/27 =E4=B8=8B=E5=8D=8812:31, Yanteng Si wrote:
> > diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/D=
ocumentation/translations/zh_CN/core-api/cachetlb.rst
> > new file mode 100644
> > index 000000000000..9568c15f4139
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> > @@ -0,0 +1,319 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Linux=E4=B8=8B=E7=9A=84=E7=BC=93=E5=AD=98=E5=92=8CTLB=E5=86=B2=E6=B4=
=97
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
>
> Guys,
>
> I don't insist on the 'flush' translation, although it is used to be tran=
slated
> as =E5=88=B7=E6=96=B0. I just never see it was translated as =E2=80=98=E5=
=86=B2=E6=B4=97=E2=80=99 in computer area.
>
> Any more comments or suggestions for this?
Dear Alex,

I admit that "=E5=86=B2=E6=B4=97" doesn't sound very good. But,How to trans=
late
"refresh=EF=BC=88=E5=88=B7=E6=96=B0=EF=BC=89"?:-)

The act of "flush" is to invalidate dirty data=EF=BC=8CThis is obviously no=
t
consistent with the act of "refreshing", which is simply invalid.
"=E5=88=B7=E6=96=B0"  is actually two operations, i.e. brush off the old on=
e and come
back to the new one.

BTW=EF=BC=9A
flush is ambiguous in the description of cache management because it
can mean both invalidation and write-back, while TLB only has an
invalidation operation here, so there is no ambiguity in using flush
here.

Thanks,
Yanteng
