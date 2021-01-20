Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2364C433E9
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 03:31:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9450A23121
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 03:31:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbhATDbW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 22:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbhATDbT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 22:31:19 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A2CC061575
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 19:30:38 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id dj6so1125906qvb.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 19:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CSOeaZyodXdFBT14EO9vXECxvzv1KuinOpOVirjXxmA=;
        b=gcuc2WAKaqS1UMz2QgJXCirs1FgwKX161AzroxI8mOlEn7tEfVHcWB5Hm5wsReI6WU
         uZXCl0FDm5Xf67Dwcxtb6mSdSSAe0lBD0Z1niPwXvMaPoDD7ZHTwKYGjJehcF0WbjATh
         e/WL37caRjM85NIL+1c9FWXaKPqY/Y6QbXML4OqPL2qgAqmodwAz6NhoXmyHQchTdXgw
         FgcPUiMDs7OyLJqA416Y+WvObhfTFO1efuwim8dZY8T05naSfJv4/a8ugcfY7Flq8HeQ
         CdDnJKLXtfps+ExEfECcB8UjAIcHILjTVaY3Bk9pu0enMoKHY/p/jPoZu37zKKZRFz7v
         gDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CSOeaZyodXdFBT14EO9vXECxvzv1KuinOpOVirjXxmA=;
        b=Y/csMk0jk0vrXmmesTZw6TMpqBgWzUnD93Hjao//pe1Stpw7BalBijLoUghxn/AYw5
         o2fmVmvniH9GKXH7IgzCkcTsAJeVKlgxh/7xbWX4vFEcYBmXBd3Tnc8J+drtajU8rEIZ
         2h2xprPj/LiiHtUUThWmpLu1GS6ZVmEjBaCYMlFB0hYXtg6Q/gwJbtHXTkrk1XctGepF
         Oe4po07BLY4QYWiUR8e2mc1/dHkBF1Mz9ODzJY2TAJcucsmVcoTYf4E82Pvkf7AXeuv2
         nyyWLkXGsiClV/nnPHEbZLdU8hyisl1BTK9IlXWkCgjskwjxizA0TSRRB5MgqInZUlyy
         W6bw==
X-Gm-Message-State: AOAM533W+a67tgTPKsHtpToS6/tUBr7k+1KAc65/tvP0r1ukf9YeZJ7t
        igQnlFDPo/HuT7jSJsIayYYukViXz7XPkjdVh5A=
X-Google-Smtp-Source: ABdhPJw9AYx3ljsS83TkUXhD4vwug3t7lRz0bOzBLKwMYBsGvzKmzDJdyb8wKerVRdTPFWAy1IrIsf/trLW0GMojdYY=
X-Received: by 2002:a0c:e90a:: with SMTP id a10mr7554786qvo.38.1611113437754;
 Tue, 19 Jan 2021 19:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20210119074617.3109276-1-siyanteng@loongson.cn> <5f3b32da-1b4a-23dc-ab50-7eed17b3196f@linux.alibaba.com>
In-Reply-To: <5f3b32da-1b4a-23dc-ab50-7eed17b3196f@linux.alibaba.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 20 Jan 2021 11:30:26 +0800
Message-ID: <CAMU9jJoGdLV6bkJyXfKFbR6LOikX_cOwPgfaB6eJ_GLfCZYiZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: zh_CN: add mips index.rst translation
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you!
I will modify it in v2=E3=80=82

Yanteng Si

Alex Shi <alex.shi@linux.alibaba.com> =E4=BA=8E2021=E5=B9=B41=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8811:13=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> =E5=9C=A8 2021/1/19 =E4=B8=8B=E5=8D=883:46, Yanteng Si =E5=86=99=E9=81=93=
:
> > This patch translates Documentation/iio/index.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../translations/zh_CN/iio/index.rst          | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/iio/index.rst
> >
> > diff --git a/Documentation/translations/zh_CN/iio/index.rst b/Documenta=
tion/translations/zh_CN/iio/index.rst
> > new file mode 100644
> > index 000000000000..88b6ba5f233b
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/iio/index.rst
> > @@ -0,0 +1,20 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: :doc:`../../../iio/index`
> > +:Translator: Yanteng Si <siyanteng@loongson.cn>
> > +
> > +.. _cn_index:
>
> the tag is unique in Docs, so you'd better use cn_iio_index
> here and also cn_mips_index for mips Chinese doc.
>
>
>
> > +
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +=E5=B7=A5=E4=B8=9A I/O
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. toctree::
> > +   :maxdepth: 1
> > +
> > +   iio_configfs
> > +
> > +   ep93xx_adc
>
> since your docs are not here now. this should be added after patches 2/3.
>
> Thanks
> Alex
>
> >
