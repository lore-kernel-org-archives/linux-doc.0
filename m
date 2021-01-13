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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7EFC433E9
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 14:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7301523359
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 14:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbhAMOyY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 09:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbhAMOyX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 09:54:23 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC82C061575
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 06:53:42 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id t16so3410748ejf.13
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vsAi86/KrmZTjvXcjVZg7nC5dZvGk/3FRh+aPnvwLZI=;
        b=a57PJDVE93dzU7+Xmz0cvEYAostLC3RH0IpzIh4nBUfxgjWdjaQo3w1hPy8WNefE8s
         xqg/RgUri1BsNUJDhh0FwtsyEw55xrGiag6fmEJ2Y9a8P5JCP8lkrgnH5iAZm0zJ2exl
         gd0baMSORwK4O7vU0rbiRSC9oJhc/2Kf9cr5U0YCvz+6ezdbh0EnSfCCP14w6UMlY0Qw
         5W5f+cIJsWHuQfF0wsKK83uUP9nmoSXojvDjf03ywv4cMA7PIlVc6OrAKlHTuJtxqEhC
         TezaLLpJaV+Xz7GmEDnGf334NLCQ3tf+o/zc8Rc5QocQI//TEiB2xiZGZrkjV+DUPIVQ
         LZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vsAi86/KrmZTjvXcjVZg7nC5dZvGk/3FRh+aPnvwLZI=;
        b=PMjxT2HNgwkXpnYbgyV0x6GPdvElgUWGlyorbZ/AWDY6W7VL/XRAqDVk+sFC9ik0iJ
         RoUCouz3DQyrH6lSNu8dQxMNwfml7js6g9tBjRAvEu9oA1FaF5aj93plPxcpffZaltYN
         VWh2bMTmXMHSWtTffBWVrpK9mogYnAlWFFD3HH59RkzoNGJxA+QdM1n1mNIxbp1C6Ng6
         Fwfd8T1iNKSk2+oFm6a9pvdUEEub7thIy6ecejob1p0EjHwycNoxceGNvQ6WeUEAOgxh
         Husmfy8X6w7YycUu5hDIuKgSJUKwt69Q+SksNWcPJgYbGlxJ89ROZ9MGQwXXDBrZ6Ajz
         zXkw==
X-Gm-Message-State: AOAM531vZsFjNo/2vpD0mNcaey0QXre6gMR0UdfT2kPYyb9SY3rwLt4f
        URA+myIul2gZ1dKeW3sOFphjFLrMT2YJtsKt73I=
X-Google-Smtp-Source: ABdhPJwGXpJb7c4CGHYJk7JD87irtFPFMp6HNM/XsbE1eQtE61KwQtn/OcuwjWfEj+M6Zm/lbgQELVEpfFEVRX+So2M=
X-Received: by 2002:a17:906:704d:: with SMTP id r13mr1804647ejj.43.1610549621636;
 Wed, 13 Jan 2021 06:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20210112115259.217944-1-siyanteng@loongson.cn> <20210112080911.253e7e41@lwn.net>
In-Reply-To: <20210112080911.253e7e41@lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 13 Jan 2021 22:53:28 +0800
Message-ID: <CAEensMzVieSTNODLQAeaTsL2_FbD0V9pPBpi8KYrMAzP5k2ggA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] doc/zh_CN: add mips index.rst translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ok, thanks.

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B41=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8811:09=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 12 Jan 2021 19:52:56 +0800
> Yanteng Si <siyanteng@loongson.cn> wrote:
>
> > This patch translates Documentation/mips/index.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> > ---
> >  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/mips/index.rst
>
> OK, we're almost there.
>
> As Jiaxun Yang noted, this should have been v7 and it is good to include =
a
> cover letter with a patch series.
>
> One other thing: this adds the translated index.rst - referring to the
> other files - before those files exist.  That will break the docs build
> between this patch and the end of the series.  Not a huge deal, since I
> doubt many people spend much time bisecting docs builds, but it is still
> better to have everything building properly after each patch.
>
> None of these are big enough to require another round, so I have applied
> this series, thanks.
>
> jon
