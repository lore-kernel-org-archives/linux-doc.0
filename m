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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D92BC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 03:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECAB72310D
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 03:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbhATDZz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 22:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbhATDZF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 22:25:05 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048B0C061575
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 19:24:22 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id c12so9857512qtv.5
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 19:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QZJBckEGSiTVViMeCjDvMNb5pFifAOq5+vTtgF7UwYo=;
        b=IQB6g+pwkl1+92qweUjzkbYDZQnaMQciEWeDJNLxa07UdHmt7wAVzT/DMpZQSjH47p
         JvjmEOXMOwS8gR+cMjfnRRNkNVlxqEAk6XVF2Ryr18ehy4mVJn13euHBAe+pNLkRi/W4
         BcyTrLX0vbxiOLke4P/AVrS3J4inNNnhp6t1K39FtshaJWX8Ri7B/kim32WlmKj7dnaZ
         zC/6bmALdgCmcX0EbctcqO6fVJ4zyaNSqUuKJX26Hdgw+V3LXXRyHlmha0zqHm0QrPKs
         U/UuCY7SEoN6FJ8CLKojQ/cYRCzuj1ES8RSiEHRhnFTzxtP9BPtEdSlbeEj6A+hm4409
         7akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QZJBckEGSiTVViMeCjDvMNb5pFifAOq5+vTtgF7UwYo=;
        b=do3q+tbumPXLFdD3D0ZZU8pCao4JEu0/RUKQsx23Ly18zAwj1bMdEjBAd5Z5pq5dvr
         qJ8Svoc8vb7OypCcJ4rmBApW4b2tfAjEIWfsdoF1JMV6jZW8Z+YywFOHNv8bpdq9zEpE
         2bEB/rlmUE105QGiKwa0P3QZLr4JK4dpiAkiGm6aEPYz0fIOtZFMhgEnLXtzCfQcOWzU
         8DQm95UcZiWlrHTqw2rdb0q8h8UwSN0YhH9Mljb7Wl2wevpSC7kF8nFh9/9CxK6dCO8V
         Yk23BzLN6kt9FXj+a3KDlTRrGt6XIdH5P97p3jFSVZLAmPYW6jljek7LjEH+k9XUU+SF
         73IQ==
X-Gm-Message-State: AOAM532HxTA94qlRw3fp1EdHjQEEshxud/F8L5/x/3rgEEPg8VxXRCNb
        F1E3NCTn0eDHtzSILGUbe0MrSK3lMsvh19QM8gw=
X-Google-Smtp-Source: ABdhPJwjfxT9GvKRTEUq7//0IdFQrY4dFYARzmflqm0nTAeqHqzAiQdSnBDqLOEEDhfCarn++hPDemnbRv5jFjOi6LE=
X-Received: by 2002:ac8:5159:: with SMTP id h25mr7413993qtn.199.1611113061313;
 Tue, 19 Jan 2021 19:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20210119074617.3109276-1-siyanteng@loongson.cn> <CAAhV-H6C+wWaSHe+zpsGJ=bGeRqsQK3aYJU3KTEB204dYMfHCw@mail.gmail.com>
In-Reply-To: <CAAhV-H6C+wWaSHe+zpsGJ=bGeRqsQK3aYJU3KTEB204dYMfHCw@mail.gmail.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 20 Jan 2021 11:24:10 +0800
Message-ID: <CAMU9jJpj=GxSUptHCXQ2GpoNOF=7Mcun4FaNM4ftLx7ZoH7VvA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: zh_CN: add mips index.rst translation
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Oh my god=EF=BC=81let me tell you a story=EF=BC=9AOnce there was a fool who=
 copied the
previous patch header just to be lazy...  T_T
I will modify it, Thank you!

Yanteng Si

Huacai Chen <chenhuacai@gmail.com> =E4=BA=8E2021=E5=B9=B41=E6=9C=8820=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=889:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi, Yanteng,
>
> What is "MIPS" in the title??
>
> Huacai
>
> On Tue, Jan 19, 2021 at 3:46 PM Yanteng Si <siyanteng@loongson.cn> wrote:
> >
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
> > --
> > 2.27.0
> >
