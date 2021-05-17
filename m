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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C2FC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 12:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 717376100C
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 12:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbhEQM4D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 08:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhEQM4D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 08:56:03 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B575C061573
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 05:54:45 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id v22so6378228oic.2
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u8iFaaZnvgw1dxheO/sqZ16SmUC0mMT/WVV4/IGppck=;
        b=RDE4G5hROSYq+J0UezepLb9fUGvyzBJm2GIyr2y1QbJ2PM3jTsCP4j+XGd3cYLiivX
         I+1xXe2P2HRcODu/C7usR5q8HWooifHVIGQH6q2r4+4kG0ibFfsZ5P3xF91gbaO8sUkL
         ZnaDL3SWT/stZv1tc2p+xK7yy6936kD56jklR+ZuXMeD9diFbkXYFlKPg0TK455Tk711
         H2Vfid6Pr60EaMQAuTWsL23QcYR3gRzs6WxyE39BqCq8D39FPcfKDsBi9lQ4aJukL8ix
         Q7OvNKvAjKN3AcOoHn9QcjXzsqP6dvQogPX+tVC2iWmTVwAI7fQZ7ATR3BnQT+ik1gLg
         IIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u8iFaaZnvgw1dxheO/sqZ16SmUC0mMT/WVV4/IGppck=;
        b=IPnxrpfg8fVxScxDlRqXXQm/m/5vCXv2VIhQ6YV+W82UrtqUp81RKjPWfVVbNM11vg
         l4BhTvCBuxjU72nuB6O1lx4kLBBKSnKq+U1/lnQ0lBECu13TeSyibeKL98MbYTKe61lI
         EbzHEF2/dwWRpwsvfHRIBi+5xx4qWkJMPClI9CJu6pSBOKHbetDhmnenq0XGA/201Dd0
         gJTtAlX1QAd+cRn3i5WwWDToSwaswBkQXIon4TIydDRQivU76e9jWmNVPZpJ4lYmbIxM
         zBDAq0ts8XoDSX/aZcG8YhsS469HiQHeU6TiU42Ffh4DCR7oQuoGtXTjl9IuKVgEsM1+
         o0rA==
X-Gm-Message-State: AOAM533qAMBd46B5GBy6plMb61GWtGGSSblsEB8ZDMuWnug51/fug9Pq
        wbQlk+nBYp3IzCqbq6nYrfg+e7DN9t6wXiP+jhQ=
X-Google-Smtp-Source: ABdhPJysPXdUrMU3rkjrZHQPl5CQS02T1RcgmOoPhTUrdeCr1iEh2KCOIxmj8rn0SrrmoIHrz3zYNIA0gLJljZGtOk8=
X-Received: by 2002:aca:5783:: with SMTP id l125mr43567480oib.130.1621256084608;
 Mon, 17 May 2021 05:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210517095605.3234438-1-siyanteng@loongson.cn> <20210517121339.GA15899@bobwxc.top>
In-Reply-To: <20210517121339.GA15899@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 17 May 2021 20:54:34 +0800
Message-ID: <CAEensMwdnf8qF+tta0DoQPp8svRH4QHpsuLAw-0qvUZMgBXFqg@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: add core api kobject translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu X.C. <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B45=E6=9C=8817=E6=97=A5=E5=91=
=A8=E4=B8=80 =E4=B8=8B=E5=8D=888:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, May 17, 2021 at 05:56:05PM +0800, Yanteng Si wrote:
> > v2:
> >
> > Modified some words under Xiangcheng Wu's advices.
> > Thanks for his review!
> > https://lore.kernel.org/linux-doc/CAEensMw+PPjwS4p7k39xouww0hz8D2LZG67N=
m1hq9vSrRmFqJw@mail.gmail.com/T/#t
> >
> > v1:
> >
>
> Please write Changelog under three dashes(---), or the commit message
OK=EF=BC=81I will.
Thank you for your review!

Thanks,
Yanteng
> will become:
>
> commit 5a7b5d7ebdb1b6859db90da953c976b887740a7c
> Author: Yanteng Si <siyanteng@loongson.cn>
> Date:   Mon May 17 17:56:05 2021 +0800
>
>     docs/zh_CN: add core api kobject translation
>
>     v2:
>
>     Modified some words under Xiangcheng Wu's advices.
>     Thanks for his review!
>     https://lore.kernel.org/linux-doc/CAEensMw+PPjwS4p7k39xouww0hz8D2LZG6=
7Nm1hq9vSrRmFqJw@mail.gmail.com/T/#t
>
>     v1:
>
>     * This patch translates Documentation/core-api/kobject.rst into Chine=
se.
>
>     Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>
>
>
> > * This patch translates Documentation/core-api/kobject.rst into Chinese=
.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>
> All others,
>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
>
> Thanks
>
> > ---
> >  .../translations/zh_CN/core-api/index.rst     |   6 +-
> >  .../translations/zh_CN/core-api/kobject.rst   | 378 ++++++++++++++++++
> >  2 files changed, 383 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/core-api/kobject.r=
st
> >
> > diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docu=
mentation/translations/zh_CN/core-api/index.rst
> > index f1fa71e45c77..b4cfb4adfcc3 100644
> > --- a/Documentation/translations/zh_CN/core-api/index.rst
> > +++ b/Documentation/translations/zh_CN/core-api/index.rst
> > @@ -32,9 +32,13 @@ Todolist:
> >
