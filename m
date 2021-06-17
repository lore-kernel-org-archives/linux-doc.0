Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91109C48BE5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 01:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F3B6613D5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 01:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFQB0d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 21:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhFQB0d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 21:26:33 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82FAC061574
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 18:24:25 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so4502691otu.6
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZreVtr+6FxqHh27TOQ/VW8rUHBjwOE/UdYYhQMemz6Q=;
        b=pSaXvQVSQJtJTlsuMDk1PqJMlSbtg0mKLzweuqMBEO6TvJ+wtagq8me54lmCAJQ19Z
         MnzBxf12Ze+4kH1/7FLYS/n4DqXO5BkHWQUbEqm0qA0TvdNBgAyObSFs4rl5cuXXgue2
         vjMNt+G4XvegZHEgD6/j5iXsyXf/cOGXJcpIIEUyYr4qkghtfzRaxSgk/hgkuCVTWSJQ
         aPwBv2wpjj6mVAFGQMFNbAK6i2jWetFybURL2nI3a5fKwiMXg4GrUshTICH+dBao3qdD
         rbbgj7vFsk7MVMvPYoJoZdBH6DjJ0xM1NpeUMt6mj7K8edN3qI1E5C5Wj8qm/SZxwPG6
         +xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZreVtr+6FxqHh27TOQ/VW8rUHBjwOE/UdYYhQMemz6Q=;
        b=kwn31vFAtWnLOVwEIDjetvmQr8pwxSoX/VlyZOUIXXi6UaGwTEjZfXYmOGCHgdZl4v
         ZZTUWlmSMz1N2pof9EyXUSLdMGlKzzrrWbbQiNJnJR9fOHchiWMMFmTIFcNQUlaDcuwF
         dOIP9uBwfcKAnJvGwmBeyXei8QrtJPO2joKWdIeuEPb1wHy1LoOYbJ9Tk2wk2SQkpfox
         GIxrleQXSLbUKO9c1TRYoSljsmRsT0yS2ubqGPUDflcFf3jcehG1Obxr1B1Z0u7DxCxL
         Z9xvdIWMBoXzBZwZ+JkA6zIrOCxqCPMxTk0i1jzdkqHphSkXzJ4+js68XupYNyd3mPqR
         pH/g==
X-Gm-Message-State: AOAM5321CcMXc09EWmskrEJdCHnYGrHdZjmPUUfQkIFAE3npLHfF32vL
        rF/I6a4OHMT2i6mjbKRRvPwt1+1W50fZr5bbJEQ=
X-Google-Smtp-Source: ABdhPJy1U9QsLiCYLrStOqzY0ookH2M3Yxck2UK/hS6jQeagUmG1qRvw04nLzlHo7mM5HfasYszvvP+A4LFz2PaHbu0=
X-Received: by 2002:a9d:1ea5:: with SMTP id n34mr2248512otn.340.1623893065111;
 Wed, 16 Jun 2021 18:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623740113.git.siyanteng@loongson.cn> <7fbb0d30a575c6c25c7c89951e66bd847021794a.1623740114.git.siyanteng@loongson.cn>
 <20210615114729.GA20806@bobwxc.top>
In-Reply-To: <20210615114729.GA20806@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 17 Jun 2021 09:24:17 +0800
Message-ID: <CAEensMwbc8evDpOoRdOo+RVQ84gjogCYip8cs0EfPS=Pe1bhCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs/zh_CN: add core api cpu_hotplug translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixd=EF=BC=81

Thanks,

Yanteng

Wu X.C. <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=E6=97=A5=E5=91=
=A8=E4=BA=8C =E4=B8=8B=E5=8D=887:47=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Yanteng,
>
> two small problem.
>
> On Tue, Jun 15, 2021 at 03:03:50PM +0800, Yanteng Si wrote:
> > Translate Documentation/core-api/cpu_hotplug.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/core-api/cpu_hotplug.rst            | 348 ++++++++++++++++++
> >  .../translations/zh_CN/core-api/index.rst     |   2 +-
> >  2 files changed, 349 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/core-api/cpu_hotpl=
ug.rst
> >
> > diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst =
b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> > new file mode 100644
> > index 000000000000..f4174ed3aeca
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> > @@ -0,0 +1,348 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/core-api/cpu_hotplug.rst
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > +=E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
>    ^
>    need a space at the beginning
>
> [...]
> > +CPU=E4=BD=8D=E5=9B=BE
> > +=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``cpu_possible_mask``
> > +  =E7=B3=BB=E7=BB=9F=E4=B8=AD=E5=8F=AF=E8=83=BD=E5=8F=AF=E7=94=A8CPU=
=E7=9A=84=E4=BD=8D=E5=9B=BE=E3=80=82=E8=BF=99=E6=98=AF=E7=94=A8=E6=9D=A5=E4=
=B8=BAper_cpu=E5=8F=98=E9=87=8F=E5=88=86=E9=85=8D=E4=B8=80=E4=BA=9B=E5=90=
=AF=E5=8A=A8=E6=97=B6=E7=9A=84=E5=86=85=E5=AD=98=EF=BC=8C=E8=BF=99=E4=BA=9B=
=E5=8F=98=E9=87=8F
> > +  =E4=B8=8D=E4=BC=9A=E9=9A=8F=E7=9D=80CPU=E7=9A=84=E5=8F=AF=E7=94=A8=
=E6=88=96=E7=A7=BB=E9=99=A4=E8=80=8C=E5=A2=9E=E5=8A=A0/=E5=87=8F=E5=B0=91=
=E3=80=82=E4=B8=80=E6=97=A6=E5=9C=A8=E5=90=AF=E5=8A=A8=E6=97=B6=E7=9A=84=E5=
=8F=91=E7=8E=B0=E9=98=B6=E6=AE=B5=E8=A2=AB=E8=AE=BE=E7=BD=AE=EF=BC=8C=E8=AF=
=A5=E5=9C=B0=E5=9B=BE=E5=B0=B1=E6=98=AF=E9=9D=99=E6=80=81
>                                                                          =
^^^^
> s/=E5=9C=B0=E5=9B=BE/=E6=98=A0=E5=B0=84/
>
> [...]
>
> Please fix them :)
> and
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
>
> Thanks,
>         Wu X.C.
