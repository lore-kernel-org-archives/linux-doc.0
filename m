Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86511C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 07:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbhLIHUp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 02:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbhLIHUp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 02:20:45 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8815AC061746
        for <linux-doc@vger.kernel.org>; Wed,  8 Dec 2021 23:17:12 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bf8so7509304oib.6
        for <linux-doc@vger.kernel.org>; Wed, 08 Dec 2021 23:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9O8kyEMYjpXI20RUL49MU5JalAXtL4bPAMMJEeTe53s=;
        b=qP24wvjuAD9nxPRUwVIxeipowzI3wTCJZW0ApSick3wzodwkV6H9p4GenBJmnEiz7z
         RW76JthetJLk+V6glUMwJ1zIsXlOH55KWoCyo7OVe3j4PRKwPyYT4MP++VwAvzmxA0Di
         8rRTCjDo45r8UtkBbyDjBR5dBJpUbXQIVOJ9/GQeJUKgmqtwGjb4fYpWkQVVNqxWNcs8
         pBNIrgdEvMbViEGEJcw5+xC33z1fnmn09+/ILWJaNeyHkW91CCoejgiBhhscS9k1d5Xj
         4QlZLSJzcK903k6y5ZxzVQUB3nNVXvs3xymC8RTpbYKDJAJ7Y71J5pqOFuYmnla0BADZ
         bn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9O8kyEMYjpXI20RUL49MU5JalAXtL4bPAMMJEeTe53s=;
        b=4SgF02GmljyS9OOQB6/SAXJDqWfCu1wygS7yrsSt6V0Zp+NqyXYtnrfhaf/FcAx9Wi
         SJ5ivltjzhZCAZvfp+5vMAX72cmahYOluPT7WI7Trc8IbsFOSBkiQ6kKnsGqax4cOs23
         hhg5XvjXq+zGqT7RsDqN0E5DJSnSj/T9WppI8mCwAxgBIibBk/ZhTzqSCtc3Hw7ToG4l
         BHYiTA8exKNcgvD4XrrxMYJZlgjHHJq57J+m3h8/HxuA78fDa3j+Eur62+oD2Rax4qiZ
         HeYFZayUjf7C8N0nCmgcOwdV287sXH2kmldmqdPlIB/UQ2ozEz77blDPN6QtAS4aSO9H
         eOqQ==
X-Gm-Message-State: AOAM530o6LUJuSKjkYoTtobF0Om1wcppOh0LApxrzxXpb/2eQEpVKBFG
        H5k43hMJmimv9+3mzFqXlOS557zEgUAI/DcPfHNWdxI9VjQ=
X-Google-Smtp-Source: ABdhPJyLHhpnZMOtxzNZZvwVBBVcG6Gil7meXDO+ihVCTWCdP7Oys+yex9OeJ207tNFjKeptbNzpFD2cYmeMBx/lnMQ=
X-Received: by 2002:a05:6808:1709:: with SMTP id bc9mr4204284oib.130.1639034231978;
 Wed, 08 Dec 2021 23:17:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638706875.git.siyanteng@loongson.cn> <761f674199f426431c894c3a2eeda2e57ced925f.1638706875.git.siyanteng@loongson.cn>
 <87pmq9399y.fsf@meer.lwn.net>
In-Reply-To: <87pmq9399y.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 9 Dec 2021 15:17:00 +0800
Message-ID: <CAEensMzjgHL9XjL_7H5xbZQJnu=LCoi27Y8irsD8Q12Lr4bHEw@mail.gmail.com>
Subject: Re: [PATCH 04/11] docs/vm: delele three spaces from page_owner
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B412=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=8C 01:58=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > Fix warning as:
> >
> > linux-next/Documentation/vm/page_owner.rst:92: WARNING: Unexpected inde=
ntation.
> > linux-next/Documentation/vm/page_owner.rst:96: WARNING: Unexpected inde=
ntation.
> > linux-next/Documentation/vm/page_owner.rst:107: WARNING: Unexpected ind=
entation.
>
> A general comment: "fixed a warning" is almost never a useful changelog
> entry.  Instead, talk about what you fixed that was causing the warning;
> that, not the warning itself, is the real problem.
OK! get it.
>
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/vm/page_owner.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_ow=
ner.rst
> > index 9837fc8147dd..9a3af6aafa09 100644
> > --- a/Documentation/vm/page_owner.rst
> > +++ b/Documentation/vm/page_owner.rst
> > @@ -89,11 +89,11 @@ Usage
> >
> >       Page allocated via order XXX, ...
> >       PFN XXX ...
> > -      // Detailed stack
> > +     // Detailed stack
> >
> >       Page allocated via order XXX, ...
> >       PFN XXX ...
> > -      // Detailed stack
> > +     // Detailed stack
>
> I don't think this is the right fix; instead, this text should be in a
> literal block.
OK, Thanks!

Thanks,
Yanteng
