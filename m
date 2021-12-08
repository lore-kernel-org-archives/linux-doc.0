Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA02C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Dec 2021 07:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbhLHHPi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Dec 2021 02:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240004AbhLHHPi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Dec 2021 02:15:38 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A97BC061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 23:12:07 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so1756893oto.13
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+YQ1n7ePMjBMmDW7mHsdOnpmqb+l1Az3AOeSRzCd7qc=;
        b=O4TH8dB0MvLP83IRPUpDnamZxOE9K6u/px0NJpUEUBrD0kg6uUP38BUCcLuIt8V3jG
         UDqV0fz33jsSCxhiYZVjH9SYWAysjIqtPN+NkKHkcBIAbLwg0WgQvpzoD12t7EWW4uN7
         U83JdU+P9isTuXTcCj+SRgzOJw9qtOf+50MoVwe+qBavG3lXvNCSGPtB38iuyWj16dsV
         tdk0rBY7+UrHEnd5KBdEy4HUFCUD2Z2fpbJuv3IGYw/WzohkCSTje3MsDd7Nd9cdkaWw
         cnYSyOwy9k4QJjvYYaQVrcVzueV3bpWQAPbLWgP64Lqci6s5T7ZEytVCsmcG0pkiLJl/
         7QBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+YQ1n7ePMjBMmDW7mHsdOnpmqb+l1Az3AOeSRzCd7qc=;
        b=26lYK+2LZe+m2BRYM0faN0NBbL+Te84vsTT5D1QMH6NFbHsi+jor8+bV72nzE53LTd
         4YzTTo7jUz37XmvETGxzvG+wrR9FIdOjJVHpIjKdy5y1EXChaeVeSoXTqkSFhfqIgLVM
         bbwHReB+y3U3RARWN3wRSTCd85IF0DzMxn7CzOGb6OSUINbfBAW2u3CqcvjYNxVOvjq9
         kqiiA4KNvz8eYM3us+Mrysm+q6lZEauzqsfxF+R8K95ytPbgtCofVQpZz8yl/9iOMEAy
         bakehzjqyh2yDfG/6YT8fBvHTeQFq4lt0BgWxWE8F9FWAF/srOp6MfCVLQNVruUHw2kd
         QRdA==
X-Gm-Message-State: AOAM532z93pvTqu6suxvYjXlD8S5aTX39ir246J0+Gulh9/eWhfe4SRR
        pdROhBX09v4aUb0hCDjL83ZWPXsyfR6YZvzqsP0BO6Bqrnmxl6wu
X-Google-Smtp-Source: ABdhPJxo6DWq/oRxp1/x0wrR+dJatlUepTAs6rIl4JesdveTpjNCRSD3brvDAT8w1bJ3GM9/JM91JQTzzIZXUaU1T+k=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id s39mr40055815otu.151.1638947525318;
 Tue, 07 Dec 2021 23:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20211206090911.26487-1-tangyizhou@huawei.com> <20211206090911.26487-2-tangyizhou@huawei.com>
 <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
 <f01d3083-c1d6-54c1-fb5a-2d00b2357762@huawei.com> <CAJy-AmmdGQndsx3MDhYCgqawc-JRib7-YGm1oDit2hW1otbjuQ@mail.gmail.com>
 <87ee6o1mzf.fsf@meer.lwn.net> <CAJy-AmkmwxWcbn6AuT738RFng+aH87Ph7VW69X75nV4+ynQYvA@mail.gmail.com>
 <87bba6bf-1746-eed7-c5e3-619ae2a0cdb8@huawei.com> <CAEensMx2OwMNszCJpCCtahsC3CLdSP0KRq_jPDPeZAjKtmz6PQ@mail.gmail.com>
 <CAJy-AmmfSX14XgXgb5edvL1A40KeaUZ1wWYsfz=N43zdQrKuJg@mail.gmail.com>
In-Reply-To: <CAJy-AmmfSX14XgXgb5edvL1A40KeaUZ1wWYsfz=N43zdQrKuJg@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 8 Dec 2021 15:11:53 +0800
Message-ID: <CAEensMwQoSRHn0kxa02fnjOi1+kOsi5=UJBSLHZqEndnknF4Qg@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs/zh_CN: Add sched-capacity translation
To:     Alex Shi <seakeel@gmail.com>
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

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=888=E6=97=A5=E5=
=91=A8=E4=B8=89 14:16=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Dec 8, 2021 at 12:55 PM yanteng si <siyanteng01@gmail.com> wrote:
> >
> > Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=888=
=E6=97=A5=E5=91=A8=E4=B8=89 12:35=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On 2021/12/8 11:16, Alex Shi wrote:
> > > > On Tue, Dec 7, 2021 at 10:57 PM Jonathan Corbet <corbet@lwn.net> wr=
ote:
> > > >>
> > > >> Alex Shi <seakeel@gmail.com> writes:
> > > >>
> > > >>> What the result of scripts/checkpatch.pl or make htmldocs say?
> > > >>> Let's tame these tools and follow the regluar styles of kernel.
> > > >>
> > > >> checkpatch knows nothing about different languages, and "make html=
docs"
> > > >> doesn't do that sort of stylistic checking.
> > > >
> > > > Thanks for the info!
> > > >
> > > >>
> > > >> I don't know enough (i.e. anything :) to have an opinion on the be=
st
> > > >> length for lines of Chinese text.  Surely there must be some conve=
ntions
> > > >> out there?
> > > >
> > > > The only reason I know is to remove extra spaces char in 'rendered
> > > > documentation'
> > > > which is generated by line break. For this purpose, 40 or 60 line c=
hars limit
> > > > can't fulfill it obviously.
> > > >
> > > > Yizhou's suggestion has no line break unless a punctuation hitted, =
so the
> > > > space will happen with the punctuation.   This makes the rendered d=
ocument look
> > > > good, but will lead to toooo long and never alignment lines in the
> > > > source document.
> > > > It looks like we have no good way to resolve this issue by style
> > > > change. Also the '60'
> > > > number seems an arbitrary number? If we have to relief this problem=
 from coding
> > > > style change, why not follow the new rule after checkpatch's change=
:
> > > > from 80 to 100,
> > > > let's say about 50 Chinese chars plus breaking after a meaningful C=
hinese word?
> > >
> > > Agreed.
> > >
> > > Now I prefer 50 Chinese chars plus breaking after a meaningful Chines=
e word.
> > All guys:
> >
> > ref <https://stackoverflow.com/questions/8550112/prevent-browser-conver=
ting-n-between-lines-into-space-for-chinese-characters>
>
> Nice finding!
>
> >
> > I have tested that firefox has no space problem. Looks like some
> > browser issues, But I still think it's because rst didn't consider
> > Chinese support when it was originally designed.
> >
> > I'm sure there are many ways to solve the space problem elegantly, but
> > changing the document source code is definitely not one of them.
>
> Right.
>
> Just since checkpatch has changed, so let's move on...
> And of cause, 40 chars width is also acceptable if someone like it.

OK! I agree with 50 chars.

We need to take care of the kernel developers who don't have a GUI,
and the doc developers who use vi. So I still insist that the Chinese
document should be as neat as the original one=EF=BC=88English doc).

Thanks,
Yanteng
