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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC2FC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 07:00:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25AE061131
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 07:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239358AbhIWHBr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 03:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239370AbhIWHBq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 03:01:46 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A75C061574
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 00:00:15 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso7206794otc.9
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qyIqLQ0RA2b8hOtMmFCMJ5h/LR3GfHnojokxnwRswnE=;
        b=e+dKq5la/8BvlIHw5uMVSVUVj7tsDmXa6Gpvr40S/FK5RsT9JFN7NXT2+0BTxG19me
         ARyWHctLN0wHeLuUK9VmH6MrgeUqGmxfPVNYluiJtJ1xfOclfJhOvqcxgMYKnkwqz9ZB
         wiIZvh8wOPttHqVbb+MKjIt2ChVGnn5zxedgsHFIErNSKfjaSCQ8GcD1BsmEIaM5i7Kj
         tta8l2hOTyOSo1gbQu5AZ7pVWcGpobhvqjYHHvdbuP40eFgo1NV3Sp3hAJDPtmQuujJa
         Inf+P3rlYdqi+jPYwmY+7Bd+JDguVUVKaV6/Fse3IHXdEmzc8J3MzbG7xVz+TfyVEPzy
         4Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qyIqLQ0RA2b8hOtMmFCMJ5h/LR3GfHnojokxnwRswnE=;
        b=rB/OHHDYZ0JnqWLvda+elZ8G4a5+d6D8vda+5Y7zkQ72n7I2MYn3pZZgpB03GpYend
         Bdz/t8/Lxmk8lBb+epY5cxW72ubh9L6RFzR+xRuNN9y44HZ9CAbL1ySAoSLvWBEIMWVW
         J9WV/jZit9cBjSMZBlt26itsZ9jLaQCd+qUzR7XA3+rTyzNPFeDIaIGxWQKCuWnscRja
         DLu64bgD5+EoaJHFQx2U25XjyDO8OANH19ctiurrPSWwlXcLRWzJ/XHWm2PPS89dqIrI
         XwczshqgQZL85E0IGl9JszN+dZJFW/5ZnZcY6nIf4nGWLOn4QDd5IeRHmyBWqMT11Y/U
         SvgQ==
X-Gm-Message-State: AOAM531zB2z/5AgvHaDDBHZp1FJVEDCMu+tXGwNK8wGhNqgpFk+dZOF6
        WhjYlG0wZS3SS+uFxW8XDuzVe1TWXO/cwWubujs=
X-Google-Smtp-Source: ABdhPJwNDx+AeniE1zZ/UhtC0Ga3JYxpu+QcaVrFsrCbYejfiBPGE1eOoDnamc9qEy5eqXZNNSFhchb2Oomg2Uaz6GM=
X-Received: by 2002:a9d:1408:: with SMTP id h8mr2966238oth.151.1632380415039;
 Thu, 23 Sep 2021 00:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631605791.git.siyanteng@loongson.cn> <05ea58c7abf27ae451f2f3274d8dd41e1f8bc11d.1631605791.git.siyanteng@loongson.cn>
 <CAJy-Amky_GfAgaXihcf2pKOxyW59V8=k92ytmAd4A5JXMs+NNA@mail.gmail.com>
In-Reply-To: <CAJy-Amky_GfAgaXihcf2pKOxyW59V8=k92ytmAd4A5JXMs+NNA@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 23 Sep 2021 15:00:04 +0800
Message-ID: <CAEensMzY4vh_iy2GZ4h32hN93pM_sbRdf_QNJVAfOtaihVgJmw@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/zh_CN: typo fix and improve translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=8823=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8812:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Sep 14, 2021 at 4:00 PM Yanteng Si <siyanteng01@gmail.com> wrote:
> >
> > - fix a typo.
> > - modify some word to improve zh_CN/process/5.Posting.rst.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/translations/zh_CN/process/5.Posting.rst | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/translations/zh_CN/process/5.Posting.rst b/D=
ocumentation/translations/zh_CN/process/5.Posting.rst
> > index b0c65614844d..ce62cf0d81c3 100644
> > --- a/Documentation/translations/zh_CN/process/5.Posting.rst
> > +++ b/Documentation/translations/zh_CN/process/5.Posting.rst
> > @@ -23,7 +23,7 @@
> >  :ref:`Documentation/translations/zh_CN/process/submitting-drivers.rst =
<cn_submittingdrivers>`
> >  =E5=92=8C :ref:`Documentation/translations/zh_CN/process/submit-checkl=
ist.rst <cn_submitchecklist>`=E3=80=82
> >
> > -=E4=BD=95=E6=97=B6=E9=82=AE=E5=AF=84
> > +=E4=BD=95=E6=97=B6=E5=8F=91=E9=80=81
> >  --------
>
> I notiecd most of morden email client is using 'send' instead of
> ancient 'post', guess that the reason for
> you to feel strange on the 'post'/=E9=82=AE=E5=AF=84=EF=BC=8C:) From the =
meaning translation,
> =E9=82=AE=E5=AF=84 is correct Chinese for 'post'.
> But for current custom, =E5=8F=91=E9=80=81 is better. So let's do a compr=
omise between
> of them, use '=E5=AF=84=E9=80=81' ?
>

great! I will send v2 in a moment.

Thanks,

Yanteng
