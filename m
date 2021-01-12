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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BCDC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 04:17:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2943622D06
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 04:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbhALERA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 23:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbhALERA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 23:17:00 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58A3C061575
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 20:16:19 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id s6so403053qvn.6
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZLQB0HoAFDbLgZtKyyyamm3PU4EPScokzZw9QN2nNoM=;
        b=Wy53jHBNysDAt43Ylryyy/gdf056UyjZhINC9LfBavQorGNnXpcV+Ph11byae538rj
         WRBPNdZkMJeznduqt6pX9fh8y9fLShK9wdCE790rwDmP2PhxVd7cetcBxbBvQxX0WuLE
         Bqawq4bxsy6PSll+yeHPKibJ8gKBNsnTEx5OK9Tyf4zhaHamBJlP1foFuqnwWdzcJkNY
         f1vWe477ctsswZSuYDi8wAlO/WDSvowkv/zcIPsUHH4h3Sx/u5gKZNA41Ab6jbOetB2n
         4VO7+zZVW0YG5p2sFFNtPvsYED+UPIykvuFugAz5NfyZru6e1HPGubZ/81GcY+AZCfNN
         FN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZLQB0HoAFDbLgZtKyyyamm3PU4EPScokzZw9QN2nNoM=;
        b=Y6SFuFJgeRW5H+tLeohrXsyXNgqywCtOFMROQSyzukq/iU3G/1SdKrf0PiO78Bre4g
         pl5+GySafrzTaY/uGx78bf5lywDp0Dv5RAlIO50EbjqUMPNVlPp2EeEviQ5+QzIrnKh6
         E56RcIzlAD7fdVub5WIYLfQMYKY9+8xnSW/hsfpr/qJ7509byr0OPUIkAjX+J4iUhgtp
         Uon/OJvvUgoQ0AP7BwvUTOxieq0/uy/ZZCqSpUwnt3e7om/H5jxHkBlNsuUFstBjBUnL
         GmPt9TJwTESY9eRiW2sCm9afR3/2QnT9xVtELm8UOxqRHC8+RBoQyq05vgWi/sgMsKDn
         I+Hg==
X-Gm-Message-State: AOAM533mzXvzD0Nx1uR3E3G7rx8LWkpkN4oNM0mI1WUhVfKs9LCxHGjL
        6bTUAAI6R6hBnCztrEQvFGF3RBTbzl9q56zp57g=
X-Google-Smtp-Source: ABdhPJy0anp4VAa9P5y7FeB9AEkzb2zgAREVpQ8hdOjwcruaLVlF/vOjacW4FluZLuyD6sa73WdkMCyQfPIgOehNIT4=
X-Received: by 2002:a05:6214:58d:: with SMTP id bx13mr2856594qvb.61.1610424979077;
 Mon, 11 Jan 2021 20:16:19 -0800 (PST)
MIME-Version: 1.0
References: <20210111113401.2852455-1-siyanteng@loongson.cn> <20210111125724.689a7765@lwn.net>
In-Reply-To: <20210111125724.689a7765@lwn.net>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Tue, 12 Jan 2021 12:16:06 +0800
Message-ID: <CAMU9jJo63eyezstq9H=F5Nd1QFZ9S5gtT254QfG=3g9-x7diVQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] doc/zh_CN: add mips index.rst translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sorry, this is my fault, I forgot to add the version number to the
subject. I will correct it immediately. thank you!

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B41=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=883:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 11 Jan 2021 19:33:58 +0800
> Yanteng Si <siyanteng@loongson.cn> wrote:
>
> > This patch translates Documentation/mips/index.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/mips/index.rst
>
> So I am confused by all of this; I've received a few variants of this
> patch set; this one is not threaded properly. It looks like Alex reviewed
> some of the previous versions, but you don't have his Reviewed-by tags
> here.
>
> I will drop these; could you please straighten this all up and send me a
> version of the series that is ready to be merged?
>
> Thanks,
>
> jon
