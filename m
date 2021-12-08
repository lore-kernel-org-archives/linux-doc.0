Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E8AC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Dec 2021 04:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239868AbhLHE6e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 23:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbhLHE6e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 23:58:34 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09B9C061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 20:55:02 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso1506891otj.11
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 20:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9oRWPunntnFafhzSn3YtCUNnNfPEqTk28cdkFaXerNk=;
        b=EtUC62w+N5gyJiSUtjODvW1a073RNXih7kbwtiC9X1x227H7hLGS6vDeNaJ3iv083A
         Nacw7WDdYTQjqJ3bGBf06TsQFxyfy1nQC7e8nyPq4ZmwgRVquC3xHk+Y2t+uH7nU4qyT
         LjKkFpzkGTjy+iBVHesda7Gg52ffbjvqsQGIxPCEsfV1a01N3pf8sK/8/ySMDuysISfg
         HBoA/4V+BLWMo5GK3b2I/XI50xVwLQ4E9ncqecBUnRviMXUaYRt07OTmhzYcw6sW5JD9
         h1qt1xYhJVeXFipuyEXjjRx34RyzWA/W0Sq1F9hYvN7bQbdZamJF8tLaWFhmaQ8qrx7E
         7wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9oRWPunntnFafhzSn3YtCUNnNfPEqTk28cdkFaXerNk=;
        b=XSFi+rPKpCr7u15JiGkt4Y83I1xHYths0EF2aognyGy+sUpNnIMj3+WMbVbBArMPEx
         AwgQZ7yLrCGlOW/Zq1x3OQNvkseOZXFyOO5cu2nX/qAGlxI/5rnYnBCk7yJCdhsrRCtq
         m9+7h3KUFWjQaSNopwLtHc1Y4xvYhTzm+7lrR8A1pz7KsGoaj49u6j85J4EKHDboWSwn
         gTGRq27d0YzMNiVGmGYWv+yxVf3uy5LFRTDl97tLe+dqRMbiPpZkZycyorZqSDRXdmQN
         RWMMI7fyi2eLI2ffSmkZNuYuSuyEvqnQXMbCIAk1cGj/wJ3Zh/SxrtQdPOqfZ/m/YiFg
         j8qw==
X-Gm-Message-State: AOAM530pA3Vw3m8LC9QtvuPKixD3QGclarfyxU18He+xUSnmOum14iFP
        ZunKQZe35LS+nkmlNdJ2/h5M31S3fYNPBA24cu4d0CrZ+SuxpINl/4g5Wg==
X-Google-Smtp-Source: ABdhPJyWq7bXkVwtceylokosy+fTImhDgEYKGUO0kkY08BJ/E+8bN+NbsPmcTuraUTODQd4sh49cUvxqSKucMZhy4kc=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id s39mr39702458otu.151.1638939302146;
 Tue, 07 Dec 2021 20:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20211206090911.26487-1-tangyizhou@huawei.com> <20211206090911.26487-2-tangyizhou@huawei.com>
 <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
 <f01d3083-c1d6-54c1-fb5a-2d00b2357762@huawei.com> <CAJy-AmmdGQndsx3MDhYCgqawc-JRib7-YGm1oDit2hW1otbjuQ@mail.gmail.com>
 <87ee6o1mzf.fsf@meer.lwn.net> <CAJy-AmkmwxWcbn6AuT738RFng+aH87Ph7VW69X75nV4+ynQYvA@mail.gmail.com>
 <87bba6bf-1746-eed7-c5e3-619ae2a0cdb8@huawei.com>
In-Reply-To: <87bba6bf-1746-eed7-c5e3-619ae2a0cdb8@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 8 Dec 2021 12:54:50 +0800
Message-ID: <CAEensMx2OwMNszCJpCCtahsC3CLdSP0KRq_jPDPeZAjKtmz6PQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs/zh_CN: Add sched-capacity translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
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

Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 12:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2021/12/8 11:16, Alex Shi wrote:
> > On Tue, Dec 7, 2021 at 10:57 PM Jonathan Corbet <corbet@lwn.net> wrote:
> >>
> >> Alex Shi <seakeel@gmail.com> writes:
> >>
> >>> What the result of scripts/checkpatch.pl or make htmldocs say?
> >>> Let's tame these tools and follow the regluar styles of kernel.
> >>
> >> checkpatch knows nothing about different languages, and "make htmldocs=
"
> >> doesn't do that sort of stylistic checking.
> >
> > Thanks for the info!
> >
> >>
> >> I don't know enough (i.e. anything :) to have an opinion on the best
> >> length for lines of Chinese text.  Surely there must be some conventio=
ns
> >> out there?
> >
> > The only reason I know is to remove extra spaces char in 'rendered
> > documentation'
> > which is generated by line break. For this purpose, 40 or 60 line chars=
 limit
> > can't fulfill it obviously.
> >
> > Yizhou's suggestion has no line break unless a punctuation hitted, so t=
he
> > space will happen with the punctuation.   This makes the rendered docum=
ent look
> > good, but will lead to toooo long and never alignment lines in the
> > source document.
> > It looks like we have no good way to resolve this issue by style
> > change. Also the '60'
> > number seems an arbitrary number? If we have to relief this problem fro=
m coding
> > style change, why not follow the new rule after checkpatch's change:
> > from 80 to 100,
> > let's say about 50 Chinese chars plus breaking after a meaningful Chine=
se word?
>
> Agreed.
>
> Now I prefer 50 Chinese chars plus breaking after a meaningful Chinese wo=
rd.
All guys:

ref <https://stackoverflow.com/questions/8550112/prevent-browser-converting=
-n-between-lines-into-space-for-chinese-characters>

I have tested that firefox has no space problem. Looks like some
browser issues, But I still think it's because rst didn't consider
Chinese support when it was originally designed.

I'm sure there are many ways to solve the space problem elegantly, but
changing the document source code is definitely not one of them.

Thanks,
Yanteng
>
> Thanks,
> Tang
>
> >
> > Thanks
> > Alex
> >
> >>
> >> Thanks,
> >>
> >> jon
> > .
> >
