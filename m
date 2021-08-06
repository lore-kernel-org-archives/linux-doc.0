Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997F3C4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E76F60EE5
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbhHFCHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhHFCHN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 22:07:13 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515F8C061798
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 19:06:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g30so10629069lfv.4
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 19:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MTThtsS2PulzKu2RFpZ/OOrwQjSjEawOmIGpE5tzdyQ=;
        b=NZARrKmtH0YzzsjkCAgCLarHrNpCsiHb+oL8Buewc9WAq9Ip+skazs37BY9tzuqNTr
         VBxbSZgRz1QDKYUDdWFsQhJPkd8nF4ArbwhCGvqhxbAoBzkPuT6CoJhP+71vwPimgl8E
         5NVTXv6f2Fs/xhOL97QNWHH7JW7GHHnxPaA8/p9eewurmInWoOkoomyZN0xK6UuIlIXs
         +wY14NkFiP7JZs4YyXzb/Rr0cvfdSzVhq+id7Hx+p0saDsjoMjPkLVjl3YY33cs0s3DU
         nGk/MZba9QBSrWJv94sKY/fMRfGVZ3MsZrYmNMpszm9uosL0wzcGZleB++lv4SCSXlt7
         dNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MTThtsS2PulzKu2RFpZ/OOrwQjSjEawOmIGpE5tzdyQ=;
        b=jECSSlwIkwpIpZ9WcDwUW3/0M9pZ+0lyxqTLjxX2ejwZwk9Wb/GNQwMTI9lY3A7ziO
         UKQOqMufAopKAdQ1+PY/g/m0Sz1cDtVq3xxTyRHq96IeXTpyV/t7FZmsCWLah/iXr8G1
         A85tRs/JMpn2feU3hsS5aV66P2fIa3Itjgg3epcGfsKhomUxynxS8KWR7/L/LI8OOqby
         BdeuHCQoc7Q20hX45bbFjP4VgJ0ox5Dwnk7SO4q0JUiDPvlGkUcx53Btgvp+/PgR25Da
         d4ZeRLjYRLyyOiHCVwtGKFC4VD9mhFv8UjbzGdLVQhCMD0hbJ+Z4E+lCQ7jWovqY0TCP
         kKww==
X-Gm-Message-State: AOAM530Y8v9t+pLJotXo3shVUfmux4FpPayJtYxAhOWKtMFdF2qasfTk
        bhr2JqjInVg7q/+20OlMttw94bJM3Rwzz5dhUWc=
X-Google-Smtp-Source: ABdhPJxY+jKc3mtzQYpMejaUQzhVNEyQ6vUbxPJLiUahON+uEQc8PJ6iLLQLdYkZt20/a4aUig1Nel4mN49ZLLJdQzc=
X-Received: by 2002:ac2:4941:: with SMTP id o1mr6005580lfi.100.1628215615736;
 Thu, 05 Aug 2021 19:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <c270cb35409755903fff2b64de8f5dcc7b553e91.1627820210.git.siyanteng@loongson.cn>
 <CAJy-Am=UFh-KvUBK9gZ7eFbyY1pLYQrpboyHnDms0vVhVowBEw@mail.gmail.com>
In-Reply-To: <CAJy-Am=UFh-KvUBK9gZ7eFbyY1pLYQrpboyHnDms0vVhVowBEw@mail.gmail.com>
From:   Puyu Wang <realpuyuwang@gmail.com>
Date:   Fri, 6 Aug 2021 02:06:44 +0000
Message-ID: <CADQR0QjnXxYpcjwoOD__ubsa4317MWdp8NGj801Q70Umc8mxYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] docs/zh_CN: add infiniband index translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, chenweiguang82@126.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Puyu Wang <realpuyuwang@gmail.com>


On Wed, Aug 4, 2021 at 2:27 AM Alex Shi <seakeel@gmail.com> wrote:
>
> On Sun, Aug 1, 2021 at 8:25 PM Yanteng Si <siyanteng@loongson.cn> wrote:
> >
> > Translate Documentation/infiniband/index.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
>
> > ---
> >  Documentation/translations/zh_CN/index.rst    |  2 +-
> >  .../translations/zh_CN/infiniband/index.rst   | 40 +++++++++++++++++++
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/infiniband/index.r=
st
> >
> > diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation=
/translations/zh_CN/index.rst
> > index e0d51a167032..84d000245102 100644
> > --- a/Documentation/translations/zh_CN/index.rst
> > +++ b/Documentation/translations/zh_CN/index.rst
> > @@ -102,6 +102,7 @@ TODOList:
> >     iio/index
> >     sound/index
> >     filesystems/index
> > +   infiniband/index
> >
> >  TODOList:
> >
> > @@ -116,7 +117,6 @@ TODOList:
> >  * hid/index
> >  * i2c/index
> >  * isdn/index
> > -* infiniband/index
> >  * leds/index
> >  * netlabel/index
> >  * networking/index
> > diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Do=
cumentation/translations/zh_CN/infiniband/index.rst
> > new file mode 100644
> > index 000000000000..ebb1e20b7df4
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/infiniband/index.rst
> > @@ -0,0 +1,40 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/infiniband/index.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> > +
> > +:=E6=A0=A1=E8=AF=91:
> > +
> > + =E7=8E=8B=E6=99=AE=E5=AE=87 Puyu Wang <realpuyuwang@gmail.com>
> > + =E6=97=B6=E5=A5=8E=E4=BA=AE Alex Shi <alexs@kernel.org>
> > +
> > +.. _cn_infiniband_index:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +infiniband
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. toctree::
> > +   :maxdepth: 1
> > +
> > +TODOLIST:
> > +
> > +   core_locking
> > +   ipoib
> > +   opa_vnic
> > +   sysfs
> > +   tag_matching
> > +   user_mad
> > +   user_verbs
> > +
> > +.. only::  subproject and html
> > +
> > +   Indices
> > +   =3D=3D=3D=3D=3D=3D=3D
> > +
> > +   * :ref:`genindex`
> > --
> > 2.27.0
> >
