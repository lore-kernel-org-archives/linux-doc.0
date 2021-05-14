Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D3BC433B4
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C53AA61406
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbhENJZm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 05:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhENJZk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 05:25:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAD5C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:24:27 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso25957289otg.9
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Srp63ws9aAvck9QUCE3K1CW2D8cD4xSOnQyhGHlXRo=;
        b=Em4C9wmMSA4socXuiSRDa/6rdDQYxgIsTm8hgOdLAwdg1gWKtygcvbBUddV/pj6hzl
         +7Tgh/abhOetqrxHmJXTC3FGDx/qAktufcq9sqsXxwFVUG+2t7vMojH0rHguqlKZ2X4L
         bH6Zj4na9XGeHTOeneS3hEXVDx/slqEP/+Lz7lZI4FlJRUoar/OTMUrMdCusMr6GezNL
         fF243ukbkfSAZPxJ2UlMZPtv5xXT/bZpaniHXMt6QHr9vfpznXL92VaII9s2Z3Bt191O
         EPLfZ44MAP8DJ24Cw6cEqMsq5/KCL7NCF7NCWeJVsjFjEemBjM9Nbjpqisn//GuazKRu
         K5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Srp63ws9aAvck9QUCE3K1CW2D8cD4xSOnQyhGHlXRo=;
        b=mAP2HOB0maH+cMgyYjnB82IiI8Vbr7zTnDz5Qv7MP4yRqU5fblfDns+pUOlYY0+jHd
         7K1WDzWs7Annczz1H4rd8SG2BwnPja4g1pOwIdMEdZxgeS9GxbzM+lfM6GKsna7daBrX
         4OFA9LVe1QSdjYof+0Oo3vtnPw5HH0sNCfoUW32n6D9swtbLe4KNik9QK1/CkAWXpLsr
         XKf7jS06tVbpF5YR68kEo2Y9vwhc35dxWr2ac+atvq2fl/Dk6U0t/44eDzreDisyt1r9
         YuwayPpZ+dFuUiPjNU6AV/OgVwWXeqbdCWjdj9RrX9UHlHqcXZBqvAemXWLI/7Utzloc
         Uk+w==
X-Gm-Message-State: AOAM533KQjYK+QO1SJuXZLpbtx+hvYEYAPbXjEGzl4VOdHFPYlAn++wB
        C4mt552GwhEqY71qxoy9isDhjtuYYR3/jOxdHcY=
X-Google-Smtp-Source: ABdhPJyZlrdCcGIx47W/snuw2I5NtYnuP7jyrV1ArAlEGYls+8y73R92ztfzCucor9wz9KAKeff7PYokR8lOh403xys=
X-Received: by 2002:a9d:1d45:: with SMTP id m63mr18017154otm.302.1620984267075;
 Fri, 14 May 2021 02:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620286208.git.siyanteng@loongson.cn> <87k0o261w8.fsf@meer.lwn.net>
In-Reply-To: <87k0o261w8.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 14 May 2021 17:24:16 +0800
Message-ID: <CAEensMwv8X68oiov8DBSAmzu7i6N-1GWCOHZSQc+Tjfp4Myu4w@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] docs/zh_CN add three core api docs
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B45=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > * As Matthew and Xiangcheng suggested:
> >
> >   call kernel-doc to generate related docs (0001 and 0002).Thanks!
> >
> >   I tested it on other computers (at least three) with no problem,
> >   But on my computers it prints 1000+ warnings, I tried to find the
> >   cause in the past few days but no clue.
> >   So, the two patches may print as follows:(maybe your computer won't p=
rint anything)
> >
> >   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:2=
35: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:2=
35.
> >   Declaration is '.. c:None:: struct list_head *prev'.
>
> This is the same problem I just talked about in my other message.  I
> really think we need to just leave the kernel-doc directives out of
> translations; we certainly don't want to add all those warnings.
OK! I will remove them and then direct the reader to the original document.
But the patch 1/3 has too many kernel-doc directives,  In order to
give the reader a good reading experience, I decided to remove
it.~>_<~

Thanks,

Yanteng
>
> Thanks,
>
> jon
