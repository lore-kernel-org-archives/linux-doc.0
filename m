Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C909C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Dec 2021 06:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240363AbhLHGl1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Dec 2021 01:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235346AbhLHGlY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Dec 2021 01:41:24 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005E1C061746
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 22:37:52 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so3651241pjb.5
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jhX2mA8PJER5nqJjsvvjtKK0YtNKYJDU9YutC37q4TI=;
        b=fi665xDklYCMglBxxpuv6Iu/S08J5Va0ujFs1HqE31gS3oni9UxLSkI/ojj2wLym08
         8tNY6mB8rbfaUiWagkuG5Ovfn9bPHUUXW5Rbsl14ouFN3mFCP3r0rcEab0ApckGOkqOD
         km3cMFeAxJCTQ2/+kizqodnyQulgqoNeKNnw2q4VYOQv5/VrFAgRP3rQrKaQ52JdaWn7
         02VMtyuhXVFCXTHRfj4AaH6WxCuJxwfMVoGGyt9Qxiq2e3FOuU553F+O9Mt1kX5h4ruT
         mQh9sH2Ne3FMTal/xkeIvEdyr0mIyp/zA5BHxGg6JJDWJn2qNf2xFQN4eBtsZ1jb+h4r
         3xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jhX2mA8PJER5nqJjsvvjtKK0YtNKYJDU9YutC37q4TI=;
        b=XSWuJkk5C4Ribb9kabzc/K8NjOl51L2ge1StR9dvK7FQ5+nGZwPtLLIueY/7MMPBHl
         omA2Le+g7Ugz8CXFtuDwbPTB/AgBv/Hl4Q+zoAVURdXJNo2JyqHPK9c2aeOaJk5JzhHn
         ZcIdDeJCNVOeYkyOwtvhrv9F+y190ZYnWd53Di7Ve/20JRvFsrpj4v7lIor0MoOoh4+T
         Nt46GFjGm0QTH7EH8UVIDj4iI8WUK7ikpFO49lqwv4YJRu0MmSXeukrVsi8b5NvZ5waD
         mL197XILh1peTCI7jc4CZ6/dA4gfCdt2hTnEKqAVQfbQTZcFoobrnnVVJ6GuvV0CGQYz
         wARg==
X-Gm-Message-State: AOAM531cws2JI059/Z3hcam1Wh8oiIGPGcnrbhbcaFkaUsD+uZtSWUNv
        km7kyDRhZeUdxRQpI/JyduC+rKtrNKKYtcKDf2Y=
X-Google-Smtp-Source: ABdhPJykVQGkgdhrBCowT4jX6MrtkO/0noBvfcSgIsz/W6+1/naZPig59PgcA4n2EO2u7fOF3ecDjTEH6168n6IJynE=
X-Received: by 2002:a17:902:7284:b0:142:728b:46a6 with SMTP id
 d4-20020a170902728400b00142728b46a6mr57287173pll.45.1638945472526; Tue, 07
 Dec 2021 22:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20211206090911.26487-1-tangyizhou@huawei.com> <20211206090911.26487-2-tangyizhou@huawei.com>
 <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
 <f01d3083-c1d6-54c1-fb5a-2d00b2357762@huawei.com> <CAJy-AmmdGQndsx3MDhYCgqawc-JRib7-YGm1oDit2hW1otbjuQ@mail.gmail.com>
 <87ee6o1mzf.fsf@meer.lwn.net> <CAJy-AmkmwxWcbn6AuT738RFng+aH87Ph7VW69X75nV4+ynQYvA@mail.gmail.com>
 <87bba6bf-1746-eed7-c5e3-619ae2a0cdb8@huawei.com> <CAEensMx2OwMNszCJpCCtahsC3CLdSP0KRq_jPDPeZAjKtmz6PQ@mail.gmail.com>
In-Reply-To: <CAEensMx2OwMNszCJpCCtahsC3CLdSP0KRq_jPDPeZAjKtmz6PQ@mail.gmail.com>
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
Date:   Wed, 8 Dec 2021 14:37:41 +0800
Message-ID: <CACWXhK=swm2n3jq67ZdPaaZ26CzYYB9r4sipPE3eXc-9UqcMNg@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs/zh_CN: Add sched-capacity translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Tang Yizhou <tangyizhou@huawei.com>, Alex Shi <seakeel@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        zhengbin13@huawei.com, Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 8 Dec 2021 at 12:55, yanteng si <siyanteng01@gmail.com> wrote:
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
>

Hi, Alex, Yanteng, Tang,

According to the CSS3 Text draft, we could use the "white-space"
property. Shall we wait until most browsers support this feature
and change the rendering configuration of Chinese documents?

ref <https://www.w3.org/TR/css-text-3/#line-break-transform>

Thanks,
Feiyang

> I have tested that firefox has no space problem. Looks like some
> browser issues, But I still think it's because rst didn't consider
> Chinese support when it was originally designed.
>
> I'm sure there are many ways to solve the space problem elegantly, but
> changing the document source code is definitely not one of them.
>
> Thanks,
> Yanteng
> >
> > Thanks,
> > Tang
> >
> > >
> > > Thanks
> > > Alex
> > >
> > >>
> > >> Thanks,
> > >>
> > >> jon
> > > .
> > >
