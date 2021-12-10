Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639BAC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 01:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235508AbhLJBzG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 20:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235446AbhLJBzG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 20:55:06 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5684AC061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 17:51:32 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id be32so11278837oib.11
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 17:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N32V0wCXqmVDTPTFNOh8apQxHYMT0aCiSM0ggCYE2fU=;
        b=ZY9UoYvGhapuL5Vjk5rbElX0Rgt5hay3LdpCCMD4ubtkbL/8pYAmyVYDKvH6gryMuU
         KYOYjgZGEId1+/q5LDtCqIGRm+2Ha7xSS7v7bJ9ZAvlz0JCFBpNrnVxyMK33S72NIFLa
         B8fB7oNJ2RKgyzAou993TyFQ6Zvef4FvpfRp/AyzVj5d8NV766wv9nlTcq/sYp+f+yRT
         bZ6nrRaDna6qgUnLAwhDp8mz1LwWXFmrm3AyA+2iybXOX0k7KS4cYTtlFJyrtWINC5Mw
         BA/TAh5DbSadXHj/9fw+LR5hmIOFwvLIGUjTPeculTtscoKZFRoOXn4/K90liqlaURDy
         SM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N32V0wCXqmVDTPTFNOh8apQxHYMT0aCiSM0ggCYE2fU=;
        b=LXsNIZTy23mKu0GfYno5RmMB9qa1kNtAzNBlesJnf8Y9Ea/c6dOte+Iz1TVplV0n7Z
         3xXUueAm/kR7I3BATm9XOv5ZDWTUZ0Uca9jJyuza/rTT8csgHS7ovRBveWe76pCRSzQy
         14Bi6eAumiNTkimmZ7dzwee0+frKr8319Dj1qHxgAkWg5Y6rb8010Tt6OkE7GG5N1NFw
         ZyNGu5+RKyv6JusyoNFEVtPN1s/JmFDKTilpDs6KWDqvb7EtdSKg3pXOtRDW7z20UMlI
         wmCtXBURqur20m62nKh0UvogwwlaJ1/ulUx01wrF6pHBHrzfCkH/Hr3y/NdUtSGTYphN
         ZeZA==
X-Gm-Message-State: AOAM530CYrYTvFyXbE0cMkWSLwWBIrTysB4zIzpRT9szI4fU/JI9G73U
        4shs3QAVWGlgqQgPQOl9P9GUPe/a8ejmww2VyhI=
X-Google-Smtp-Source: ABdhPJwJRAIYH0oxtK03oyMvYzviVIM93QF9Cc3zFyGj9da5sDAL4l0PTncFcB3O065yb24cxQWfU0sbyv5QCeW1834=
X-Received: by 2002:a54:4701:: with SMTP id k1mr9955691oik.37.1639101091665;
 Thu, 09 Dec 2021 17:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20211209091133.558744-1-siyanteng@loongson.cn>
 <87y24tvnmo.fsf@meer.lwn.net> <20211210011758.0963cbb51a7d4752ccbfe957@kernel.org>
 <87pmq5vhmi.fsf@meer.lwn.net> <20211210090856.e68c25b94cc71581f2299d65@kernel.org>
In-Reply-To: <20211210090856.e68c25b94cc71581f2299d65@kernel.org>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 10 Dec 2021 09:51:20 +0800
Message-ID: <CAEensMx93g+fDaDNB5e6tgDzOtPxLi9dBrybDCw9K8yGn=RW3Q@mail.gmail.com>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, rostedt@goodmis.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Masami Hiramatsu <mhiramat@kernel.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8810=
=E6=97=A5=E5=91=A8=E4=BA=94 08:09=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 09 Dec 2021 09:59:49 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
>
> > Masami Hiramatsu <mhiramat@kernel.org> writes:
> >
> > > On Thu, 09 Dec 2021 07:50:07 -0700
> > > Jonathan Corbet <corbet@lwn.net> wrote:
> > >
> > >> I don't see that this is going to work either.  Is there any reason =
not
> > >> to just make the text read:
> > >>
> > >>    please read the event histogram document Documentation/trace/hist=
ogram.rst
> > >>
> > >> and let automarkup link it in?
> > >
> > > Hmm, I think we need the following change instead of this.
> > > (the label is not in this document, but in the target document.)
> > >
> > > diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/=
histogram.rst
> > > index 859fd1b76c63..ea722eae2810 100644
> > > --- a/Documentation/trace/histogram.rst
> > > +++ b/Documentation/trace/histogram.rst
> > > @@ -1,3 +1,5 @@
> > > +.. _histogram:
> > > +
> >
> > That would work, but it will have essentially the same effect as what I
> > suggested while adding extra markup.  I think we can leave the label ou=
t
> > and keep the plain-text a little cleaner.
>
> Indeed. If automarkup makes a link, we don't need the labels.
> BTW, it is nicer to brace it.
>
>     please read the event histogram document (Documentation/trace/histogr=
am.rst)
>
> Then, it will be
>
>     please read the event histogram document (Event Histograms)
>
>
> Yanteng, can you update this patch just putting the document file
> as above?
Will do!

Thanks,
Yanteng
