Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567AAC43470
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 374AA61139
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236823AbhDARr0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbhDARmV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 13:42:21 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C441CC05BD3A
        for <linux-doc@vger.kernel.org>; Thu,  1 Apr 2021 06:11:36 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id s11so1470269pfm.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=76x3FoXIbtqhUZnPXKhf5cLFyKpaMGKuP5GmY8IH+pA=;
        b=F2e79FLovD2KnVQKyE3vHgivm/qi3HN9MjXDHiDypHh1X8jenha+NuFlAu9R5evIOw
         1L1QhCIiE8f3+w3+hBnizJGPjM/OtG8/f9NqybUknDLK2Fc4xJ16rmbr3LHuv/5yjLxr
         x1cXFIHMPxKH2Ri2dQ5AV4Q4M+cZv85MaqoSMJe/gsuRKgLiutLqPsuQKpwTNiBySMrA
         +ETsqZ5iKB5Ku2cGZNM8gk1mpYurT8znthj2bkPeWLz6SDltLnZH8awNl1WAxIIctjFf
         Hao+fNY2T+W5evQTkMu1HfUpkkpdN8TWaqcR8pW2DIfUrCstFhl/S0Z35nz9078L6TBa
         Dr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=76x3FoXIbtqhUZnPXKhf5cLFyKpaMGKuP5GmY8IH+pA=;
        b=h63vJQThRBcz1Jt5G8XEPcNrTvKKrzegIz9WwN1vJ849Bvg60HClYJAWgUmgX50jIr
         ijv+MAFK9PTz+RLXo5092FLVOw1FI+bN2IB3ABC2CLIGE233qy8pb8BaSyv9i1wn/zJE
         E8qxkXYSfJlRz7c2NNljGnNo26PeqaWrFnMeEEfMnvp3YB0y0g+lLzbkmmJTU3RQIFBY
         CX8JGbgjj8wEUSjyEtu4kCf7DUkmrd7SYo5/qkKDjNQMJGSIMdLrg2Zk41RqicrGVxvC
         H5VqU9Tc9oQ6Q6vIdEsbrEi5smkBIex3BanpIpJeNTSTGGBTaY8nWAkcX7xvHSmEHEB8
         NPLQ==
X-Gm-Message-State: AOAM532IPrTjJ4FKNoZdXdCDq3zKCA8V7LjCd1y2sTxuI9c7cGFRX1l8
        pCwTxtbtrtd3671mtK479YYHp8MQvAxi1hGGpFq5XlqRnDs=
X-Google-Smtp-Source: ABdhPJxNduQJEa0jLw0Pn6SeciED+Y/wQktCxdIwtDy6cfhWimug7Tu0mZxv7s4y1b10YuGzcef+PQSvDp3yeSQT4h8=
X-Received: by 2002:a63:d449:: with SMTP id i9mr7200122pgj.227.1617282696359;
 Thu, 01 Apr 2021 06:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617260163.git.bobwxc@email.cn> <62f16e84-d583-5cfd-8fb5-19217eccd19e@gmail.com>
In-Reply-To: <62f16e84-d583-5cfd-8fb5-19217eccd19e@gmail.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 1 Apr 2021 21:11:26 +0800
Message-ID: <CAMU9jJpMWhe30ZX3qtN-CVgJ0HoHw7w_GpdLB9qV6C707pC0Sg@mail.gmail.com>
Subject: Re: [PATCH 0/5] docs/zh_CN: Add translations in zh_CN/doc-guide/
To:     Alex Shi <seakeel@gmail.com>
Cc:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I see=EF=BC=81 :)

BTW, the following email addresses are mine.:

I send a patch with "siyanteng01@loongson.cn" (no mailing list subscription=
)
"siyanteng01@gmail.com" writes back (no subscribed to mailing list)
"sterlingteng@gmail.com" receives mail (subscribed to mailing list)

Thanks

Yanteng

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=9C=881=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:59=E5=86=99=E9=81=93=EF=BC=9A
>
> Cc Yanteng Si <siyanteng@loongson.cn>
>
> On 2021/4/1 =E4=B8=8B=E5=8D=883:05, Wu XiangCheng wrote:
> > Hi all,
> >
> > This set of patches add some translations in zh_CN/doc-guide/
> >
> > Thanks!
> >
> > base: next tree
> >   commit 3501c960dfda ("docs/zh_CN: Add translations in zh_CN/kernel-ha=
cking/")
> >
> > Wu XiangCheng (5):
> >   docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
> >   docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
> >   docs/zh_CN: Add translation zh_CN/doc-guide/sphinx.rst
> >   docs/zh_CN: Add two image example files
> >   docs/zh_CN: Add translation zh_CN/doc-guide/kernel-doc.rst
> >
> >  .../translations/zh_CN/doc-guide/hello.dot    |   3 +
> >  .../translations/zh_CN/doc-guide/index.rst    |  30 ++
> >  .../zh_CN/doc-guide/kernel-doc.rst            | 497 ++++++++++++++++++
> >  .../translations/zh_CN/doc-guide/sphinx.rst   | 415 +++++++++++++++
> >  .../zh_CN/doc-guide/svg_image.svg             |  10 +
> >  Documentation/translations/zh_CN/index.rst    |   1 +
> >  6 files changed, 956 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.do=
t
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rs=
t
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-d=
oc.rst
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.r=
st
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_imag=
e.svg
> >
