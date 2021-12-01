Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8980BC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  1 Dec 2021 02:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhLACx6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Nov 2021 21:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346269AbhLACx6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 21:53:58 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D736DC061574
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 18:50:37 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so33090830otl.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 18:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UmNIvAXwWEHZ3NVPAvbbPfShwzXvnibiH1VJwlmayQw=;
        b=BslMhAih40GZFmxllfSvff1v5MeNh8uUxVg8y3ttYmy22YBSmSAXnIcG6MionZa4a0
         zYZhesh2aPnYj8TMUvkU5wBiAD5rwCkas/s3Me+Wn6xWLzqp8/raEI5ZhmgqKOnPMZqS
         wyLrc67ZAeKozakfuG05MRrdgcAhNUp+XuzGdD6Zg9NIMRbeNCC4y4qYAs9i2atG+UJ/
         Cs0MfW7uuWEHm2w8I6fLaLBvO2yn6KaTr5+Z8ocnxM3JaulwY1KtTkcv3g7x+aM+5sp8
         /0jxaLrVXxdQx0ZAW3FN7yozTzng3sXTnmW+vaDbO2wkdaZ3hrR+gDAjH34I7ro2Q27R
         3bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UmNIvAXwWEHZ3NVPAvbbPfShwzXvnibiH1VJwlmayQw=;
        b=Zm2O35b6WIFs8u/4HZDv9ZH/cNctprcPCRL7qISOVb0nhHZ/eewtKcw2yaj77zzqUX
         aSL54qyGPY/2MM/G3K56y9ki8kthManJvrvO6oY6itqBEyrPbNsjfOzFfP57FywPQ7QI
         4kYGtgRkxE9vxG1PSEdJkQuHLhwJIITpMeA4HiGgqciDEkRkVOa0wAKlOvdbcEsCZaGL
         IKVqnTcODTYP2u38QrXC/mAExEz5MFJILbq0Be9B6DBLD4G/xIchMeby7yKiGyeQ0rw0
         ua7VvEDWLTVVNY5r6GflwDHTheHF/whG5kSGh2kHREv+iA6YjSWbLpBtzEIyKtUGEpMr
         Ns+g==
X-Gm-Message-State: AOAM531/ujbodwgMfhr0qatKWWdRK2xXHI8ki13Wv1xs6FR51p2pTA/Y
        fi78qWQLhSL9F4D/smhyBZE3NcZHcTUKL4lRYJc=
X-Google-Smtp-Source: ABdhPJwSNJfTfuvNXtVjRT95oz/BoWzqPS7U+WMYEwajcVr6JgFVonJ7KIFUoN0so8b8260RrH73mDas5a8hlXPtrJo=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id s39mr3278882otu.151.1638327037113;
 Tue, 30 Nov 2021 18:50:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638154485.git.siyanteng@loongson.cn> <92dbb08d26e108b1677aa6cdb3f7a74a9733429b.1638154485.git.siyanteng@loongson.cn>
 <871r2yu0fm.fsf@meer.lwn.net>
In-Reply-To: <871r2yu0fm.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 1 Dec 2021 10:50:25 +0800
Message-ID: <CAEensMxV+aPjxLYOPU2wtYcacDVa5KEpoBOyHbwifEqmXUU42A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs/zh_CN: add scheduler sched-bwc translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Wu XiangCheng <bobwxc@email.cn>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B411=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=885:17=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > From: Yanteng Si <siyanteng01@gmail.com>
> >
> > Translate .../scheduler/sched-bwc.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> > ---
> >  .../translations/zh_CN/scheduler/index.rst    |   1 +
> >  .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
> >  2 files changed, 207 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bw=
c.rst
>
> One quick question:
>
> > diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Doc=
umentation/translations/zh_CN/scheduler/index.rst
> > index 797df3a9c66f..aba11e561ec3 100644
> > --- a/Documentation/translations/zh_CN/scheduler/index.rst
> > +++ b/Documentation/translations/zh_CN/scheduler/index.rst
> > @@ -21,6 +21,7 @@ Linux=E8=B0=83=E5=BA=A6=E5=99=A8
> >
> >      completion
> >      sched-arch
> > +    sched-bwc
> >
> >
> >  TODOList:
> > diff --git a/Documentation/translations/zh_CN/scheduler/sched-bwc.rst b=
/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> > new file mode 100644
> > index 000000000000..4fb18db54655
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> > @@ -0,0 +1,206 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/scheduler/sched-bwc.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> > +
> > +:=E6=A0=A1=E8=AF=91:
> > +
> > +
> > +
> > +.. _cn_scheduler_sched-bwc.rst:
>
> Is there a reason for adding all of these labels?  They are generally
> not used and just clutter up the documents.  I think I would prefer to
> not see them unless they are needed, but if there's a reason to have
> them that I'm not seeing ... ?
OK=EF=BC=81let's remove it.

Thanks,
Yanteng
>
> Otherwise this set seems about ready to go.
>
> Thanks,
>
> jon

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B411=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=885:17=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > From: Yanteng Si <siyanteng01@gmail.com>
> >
> > Translate .../scheduler/sched-bwc.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> > ---
> >  .../translations/zh_CN/scheduler/index.rst    |   1 +
> >  .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
> >  2 files changed, 207 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bw=
c.rst
>
> One quick question:
>
> > diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Doc=
umentation/translations/zh_CN/scheduler/index.rst
> > index 797df3a9c66f..aba11e561ec3 100644
> > --- a/Documentation/translations/zh_CN/scheduler/index.rst
> > +++ b/Documentation/translations/zh_CN/scheduler/index.rst
> > @@ -21,6 +21,7 @@ Linux=E8=B0=83=E5=BA=A6=E5=99=A8
> >
> >      completion
> >      sched-arch
> > +    sched-bwc
> >
> >
> >  TODOList:
> > diff --git a/Documentation/translations/zh_CN/scheduler/sched-bwc.rst b=
/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> > new file mode 100644
> > index 000000000000..4fb18db54655
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> > @@ -0,0 +1,206 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/scheduler/sched-bwc.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> > +
> > +:=E6=A0=A1=E8=AF=91:
> > +
> > +
> > +
> > +.. _cn_scheduler_sched-bwc.rst:
>
> Is there a reason for adding all of these labels?  They are generally
> not used and just clutter up the documents.  I think I would prefer to
> not see them unless they are needed, but if there's a reason to have
> them that I'm not seeing ... ?
>
> Otherwise this set seems about ready to go.
>
> Thanks,
>
> jon
