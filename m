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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5E2C4338F
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 06:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 020E961054
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 06:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhHAGJE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 02:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhHAGJE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 Aug 2021 02:09:04 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108A9C06175F
        for <linux-doc@vger.kernel.org>; Sat, 31 Jul 2021 23:08:56 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so3641988oth.7
        for <linux-doc@vger.kernel.org>; Sat, 31 Jul 2021 23:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cde+7Z4NwGo0F8BpO/AWYqx+WJjFwGEyx7seaaUB5EU=;
        b=hcSKZRb8Bjijs5SoiZXhJX6C+LAQWhxpA7ZoU7vvzwkYRWKsMYgZMZbL6igjTFDwSz
         6RubHJUZvSvP0eddjgSbZuEMyi5rV/g7sJDMR3vH+HqFiskfXXSdqXHncL4DClLQpYz6
         DNNIWS6jtwxXabFWVZ0XcrQ9urjAinXiOgNhRzMy/B++M5mXLmpd3LwV5HrL0zMjEUMH
         yujsaCxhhHt2ZgYHBqHzQkhWe0o6elBxVFGhfCbruGwR4j92l8X584Pzi72/5wRAmhel
         x/Po3XHd744/EDCLLKZUa8pbJ+9KxAM4iePfGoJsCEsfipTqAKe+x3/du24X4QkUSkRX
         jXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cde+7Z4NwGo0F8BpO/AWYqx+WJjFwGEyx7seaaUB5EU=;
        b=uO9xyGOLjeA9TVExmynSPPsv4y5kp57LyYYZ64ijzs8QNTYRKawK85NpbJV//tz19i
         324xXEzb8ksUZFvOg2QajqxdNLTbllGLRiyX6CyGOCZ3Q0kfPoCdxRhTJKA/1ssXJ8Tv
         UBgtq77xix2t+8GELF6/Wl1qAO5dc2MoHzULECRWBi7iLI+QUk9p8vyTEbJFlpXkm8L0
         MTH1EXPJjBgOMBgCsHHC75wKKfuu0ezWlFu6zn/92XDtg9+ITDIC+ZyH8rMnBSDyVfec
         n3nrg6PaWxcJZksC22BPHkPKvVIYeW/a30ndydEuFKw3ewLU0c22bZoIHF2jjRlu9s/g
         eDWQ==
X-Gm-Message-State: AOAM533N8murfWwEy1LLgwKThpHMSXFqoMRaDEBxlj3sKYYB4v9Z0vAQ
        +dTpnE6Ki+lQpMGfM7gpz/5jMgtP/BsazKCEcRE=
X-Google-Smtp-Source: ABdhPJxRkyq3eXekSxpZx9c7xD5nI2KzG/yi66va7dXhnONfYICz8IKClyTF4Q7kX1K1SQMFwARJSFNkLuLxb+hqnlI=
X-Received: by 2002:a9d:1ea5:: with SMTP id n34mr7542224otn.340.1627798135390;
 Sat, 31 Jul 2021 23:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624525360.git.siyanteng@loongson.cn> <630622fe95877503196f875e3cd1af57dc200d6d.1624525360.git.siyanteng@loongson.cn>
 <CAJy-AmmLYngaWCcBH=XE4NcccN9Z-nPz6yfM8RRnZg4BA67stw@mail.gmail.com>
In-Reply-To: <CAJy-AmmLYngaWCcBH=XE4NcccN9Z-nPz6yfM8RRnZg4BA67stw@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sun, 1 Aug 2021 14:08:36 +0800
Message-ID: <CAEensMwaZC22OKgL-PmvDSxWQ+cMgSdRXMGurxwzAvSu846G2w@mail.gmail.com>
Subject: Re: [PATCH 2/8] docs/zh_CN: add infiniband core_locking translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B48=E6=9C=881=E6=97=A5=E5=
=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=8811:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 24, 2021 at 5:05 PM Yanteng Si <siyanteng@loongson.cn> wrote:
> >
> > Translate Documentation/core-api/infiniband/core_locking.rst into Chine=
se.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/infiniband/core_locking.rst         | 114 ++++++++++++++++++
> >  .../translations/zh_CN/infiniband/index.rst   |   3 +-
> >  2 files changed, 116 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/infiniband/core_lo=
cking.rst
> >
> > diff --git a/Documentation/translations/zh_CN/infiniband/core_locking.r=
st b/Documentation/translations/zh_CN/infiniband/core_locking.rst
> > new file mode 100644
> > index 000000000000..567058246304
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/infiniband/core_locking.rst
> > @@ -0,0 +1,114 @@
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/core-api/infiniband/core_locking.rst
>
> I can't find the doc under core-api on next or upstream tree. Do I
> miss something?
OMG!
This is the carelessness of a lazy guy who is always thinking of
copying and pasting from somewhere else. T_T

:Original: Documentation/infiniband/core_locking.rst
>
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> > +
> > +:=E6=A0=A1=E8=AF=91:
> > +
> > + <sign>
> > +
> > +.. _cn_infiniband_core_locking:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=E6=97=A0=E7=BA=BF=E5=B8=A6=E5=AE=BD=E4=B8=AD=E9=97=B4=E5=B1=82=E9=94=
=81
>
> I didn't find the 'infiniband' is tranlated to Chinese as a brand. So
> maybe leave it in Enghlish?
OK!
>
> Others are fine for me.

I will sent next patch version  in evening!

Thank you your review!


Thanks,

Yanteng
