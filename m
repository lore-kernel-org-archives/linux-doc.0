Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6012CC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Dec 2021 06:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237698AbhLHGTx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Dec 2021 01:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237769AbhLHGTu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Dec 2021 01:19:50 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F64CC061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 22:16:19 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id b187so1642444iof.11
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 22:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AFRN6XDQ2DYYnNEeBXGSM5ibR47QjaXaRiB3IYOwevo=;
        b=hwNKLuMXZF3JFFfZMVMfk+YapVusgcM3R82B5uxYMyX3wYIj0ztM3yniBTfnv7KwAq
         cFjUojNoyQjL5/tXOmEj5Jb012aVNCxmNweP+cXxzr7Ph0XnxVGCpAyYuoHBup+bFYf1
         dS0VczDTFaf/LseSIWn/yemgHaZCXaRA1wvZfTHC/Sxez2z37q2oYe0mb4glhWu85OhL
         GbBIRtpJ8WqEWxV2elpB58bq3Xplb+XZxPMqD1OieS3Av5jgQuYBtQopwLdL6JCH7olL
         l7dkjBK6UP6Nsze/vW2UAx5WeD/GYvUYkSErwE0PYVIoV6T4mu7IlOLmAdIOtOLcwWcP
         wEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AFRN6XDQ2DYYnNEeBXGSM5ibR47QjaXaRiB3IYOwevo=;
        b=11Sw+h5/x5tyim96vHW6393f9fQWa9j+FlS3E+R3BB1cl6JZzToe3ScSi8/67mPo/i
         3SjoLjeqjtXlkblUGNpiSXGdih5yAZECEoHqqnuoR8ES3EB+0iCYM9+3ZuCDrUCKgptT
         IZA4kR1g8hYSlyzAPdqqfJFDHF8Smsb70ctZk8GTbOomkbCqOojS95pJMiO5g1j738xi
         1VuW8ZCQed4tIHoPqkOIymAW05i/zcpgZ5+W0hgf1ssQbw2IJWQVJ8FUQqBL0DGs3BX4
         S4X5x9Nlfxh5Z9efXPoK5/broH0yNT0SXkGWvQd6mEED4AnmgHM7QyWpZEQGRRh6kyci
         NPlg==
X-Gm-Message-State: AOAM530q0ktJNnJoNpzKbArxPqv6sH+rg4cGsPj+eAOeKi/h/naDnqqQ
        IiZzJifSjtvU6eJvO1iSGC1IeHtj5sX+CpMReE8=
X-Google-Smtp-Source: ABdhPJxyGmTBvB1tXDe7UT6LNzDTwSbzN5XIL02Ur4AYmqcvjZCvzqnU+wb7omK+Rooxqy+j2hpx+FvuQq169c+cT8s=
X-Received: by 2002:a02:6382:: with SMTP id j124mr55617477jac.64.1638944178310;
 Tue, 07 Dec 2021 22:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20211206090911.26487-1-tangyizhou@huawei.com> <20211206090911.26487-2-tangyizhou@huawei.com>
 <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
 <f01d3083-c1d6-54c1-fb5a-2d00b2357762@huawei.com> <CAJy-AmmdGQndsx3MDhYCgqawc-JRib7-YGm1oDit2hW1otbjuQ@mail.gmail.com>
 <87ee6o1mzf.fsf@meer.lwn.net> <CAJy-AmkmwxWcbn6AuT738RFng+aH87Ph7VW69X75nV4+ynQYvA@mail.gmail.com>
 <87bba6bf-1746-eed7-c5e3-619ae2a0cdb8@huawei.com> <CAEensMx2OwMNszCJpCCtahsC3CLdSP0KRq_jPDPeZAjKtmz6PQ@mail.gmail.com>
In-Reply-To: <CAEensMx2OwMNszCJpCCtahsC3CLdSP0KRq_jPDPeZAjKtmz6PQ@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 8 Dec 2021 14:15:42 +0800
Message-ID: <CAJy-AmmfSX14XgXgb5edvL1A40KeaUZ1wWYsfz=N43zdQrKuJg@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs/zh_CN: Add sched-capacity translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Tang Yizhou <tangyizhou@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        zhengbin13@huawei.com, Yeechou Tang <tangyeechou@gmail.com>,
        Feiyang Chen <chris.chenfeiyang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 8, 2021 at 12:55 PM yanteng si <siyanteng01@gmail.com> wrote:
>
> Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 12:35=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 2021/12/8 11:16, Alex Shi wrote:
> > > On Tue, Dec 7, 2021 at 10:57 PM Jonathan Corbet <corbet@lwn.net> wrot=
e:
> > >>
> > >> Alex Shi <seakeel@gmail.com> writes:
> > >>
> > >>> What the result of scripts/checkpatch.pl or make htmldocs say?
> > >>> Let's tame these tools and follow the regluar styles of kernel.
> > >>
> > >> checkpatch knows nothing about different languages, and "make htmldo=
cs"
> > >> doesn't do that sort of stylistic checking.
> > >
> > > Thanks for the info!
> > >
> > >>
> > >> I don't know enough (i.e. anything :) to have an opinion on the best
> > >> length for lines of Chinese text.  Surely there must be some convent=
ions
> > >> out there?
> > >
> > > The only reason I know is to remove extra spaces char in 'rendered
> > > documentation'
> > > which is generated by line break. For this purpose, 40 or 60 line cha=
rs limit
> > > can't fulfill it obviously.
> > >
> > > Yizhou's suggestion has no line break unless a punctuation hitted, so=
 the
> > > space will happen with the punctuation.   This makes the rendered doc=
ument look
> > > good, but will lead to toooo long and never alignment lines in the
> > > source document.
> > > It looks like we have no good way to resolve this issue by style
> > > change. Also the '60'
> > > number seems an arbitrary number? If we have to relief this problem f=
rom coding
> > > style change, why not follow the new rule after checkpatch's change:
> > > from 80 to 100,
> > > let's say about 50 Chinese chars plus breaking after a meaningful Chi=
nese word?
> >
> > Agreed.
> >
> > Now I prefer 50 Chinese chars plus breaking after a meaningful Chinese =
word.
> All guys:
>
> ref <https://stackoverflow.com/questions/8550112/prevent-browser-converti=
ng-n-between-lines-into-space-for-chinese-characters>

Nice finding!

>
> I have tested that firefox has no space problem. Looks like some
> browser issues, But I still think it's because rst didn't consider
> Chinese support when it was originally designed.
>
> I'm sure there are many ways to solve the space problem elegantly, but
> changing the document source code is definitely not one of them.

Right.

Just since checkpatch has changed, so let's move on...
And of cause, 40 chars width is also acceptable if someone like it.

Thanks
Alex
