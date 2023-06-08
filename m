Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3FFC7EE2E
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 08:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbjFHIOD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbjFHIOC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 04:14:02 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD5C2695
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 01:14:01 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso403203276.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jun 2023 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686212041; x=1688804041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SozPjokJrntF/Oo8htMG+TXiphVXSJ/WTfbCCYukN6c=;
        b=cczgcKQXzuA+Fvo6OnlqL2crMtCvHHH2m4epR4C/qmv/FJnEnQgZ9c7M0fr/SJ2Mcb
         pgrz8YetWVEKEIpv16KT8QiVoAWjvKwObhX9M7BrOmJSC8moQlzQgGBZNEvIjZGw032K
         X36ylsSl+ZtzDyHf21dANfTvU1NOQuKVE5Q8HX6sAZ7ktF/yjuEy31sZY6Xx5RgCIakG
         RsLuOw8NpA2iTwczy1HJXcWFAmkN6FopOUUn9WI2c7UWvqZK/ngCc7m+KxTVTJbumaIS
         hdEw+oXYE1xY/UpIdbxS7ZnAw3NFQgAqG+Z3i+YEJSH2I0GRs+MKEhOYtSXZYx8e0Ch8
         9/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686212041; x=1688804041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SozPjokJrntF/Oo8htMG+TXiphVXSJ/WTfbCCYukN6c=;
        b=aVg/eL0AoDVK+Z5vJ3Y4GI9GODsFcCMU4bsoFpip0GoVxAWDB1z84xCmbZCLXNzfEH
         UvNmwv2chvn2yyteHZYUy1HHmEf5mc0F7lR28tZjsGm3d09jWN3vnk3mkdAwjsecbdPp
         WWMt4E4nZHQEd7DbIglCxsVKjuNlnFhgTdWYPxZPyGS8KqF326FeyH/vkGPeJkE2qK0k
         2DMFtpg5rarCI0PJ+GCInmwHZ2SxswOYpOpKe4kneq0i2vLK+QOpgoFUHm67VUGczizn
         akWJgOdFxEXtajnl3Kr55HS5uP4Nl8Ug8SQNAaC0cUsg8mKtdzcJNqslwTCV/r9KT8fC
         DuRQ==
X-Gm-Message-State: AC+VfDzgPjWqu80HvUPJbbBxsSn7TxiZZtTzY987WH6w7BSf7PpYF4Ql
        K73C2RI7HITsEx/MpFAn+kAasGt0Desof2yPrembnMo6gWPYKCmlrI8=
X-Google-Smtp-Source: ACHHUZ4lKcngg3cUQXYN/Nr+g2EBp9Mt4Nh/jGLDWz1HIvDz3G1mNWdigm3jaN8J2YmlfdP3a/WD3P4bbz0MXDF6EXQ=
X-Received: by 2002:a0d:c7c3:0:b0:54f:9cd0:990 with SMTP id
 j186-20020a0dc7c3000000b0054f9cd00990mr8755401ywd.18.1686212040844; Thu, 08
 Jun 2023 01:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230605221035.3681812-1-linus.walleij@linaro.org> <ZH6uolQWeyX9kb+j@casper.infradead.org>
In-Reply-To: <ZH6uolQWeyX9kb+j@casper.infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Jun 2023 10:13:49 +0200
Message-ID: <CACRpkdYPPLWW6P5wwEuXjM6ZL6k6fpq_G7my6jBRhz76426bcA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/mm: Initial page table documentation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

I fixes up most of the comments.

On Tue, Jun 6, 2023 at 5:57=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
> On Tue, Jun 06, 2023 at 12:10:35AM +0200, Linus Walleij wrote:

> > +- **pte**, `pte_t`, `pteval_t` =3D **Page Table Entry** - mentioned ea=
rlier.
> > +  The name is a bit confusing because while in Linux 1.0 this did refe=
r to a
> > +  single page table entry in the top level page table, it was retrofit=
ted
> > +  to be "what the level above points to". So when two-level page table=
s were
> > +  introduced, the *pte* became a list of pointers, which is why
> > +  `PTRS_PER_PTE` exists. This oxymoronic term can be mildly confusing.
>
> I don't think this is right.  PTRS_PER_PTE is how many pointers are in
> the PMD page table,

I don't get this. What does PTRS_PER_PMD mean then (and
then all the way up to PTRS_PER_PGD...)

> so it's how many pointers you can walk if you have a
> pte *.  Yes, it's complicated and confusing, but I don't think this
> explanation clears up any of that confusion.

I will try to reword it so this gets through.

> > +pointers*, so the **pgd** contains `PTRS_PER_PGD` pointers to the next=
 level
> > +below, **p4d** contains `PTRS_PER_P4D` pointers to **pud** items and s=
o on. The
> > +number of pointers on each level is architecture-defined. The most usu=
al layout
>
> I don't think it's helpful to say this.  It's really not that usual
> (maybe half of our architectures behave that way?)
>
> I think a document like this that talks about page tables really needs to
> include a description of how some PMDs / PUDs / ... may not be pointers
> to lower levels, but direct pointers to the actual memory (ie THPs /
> hugetlb pages).

I don't understand that stuff. I suggest you patch this into the document
when the basics are in place.

> Sorry to take a wrecking ball to this, I'm sure you worked hard on it.

Don't worry about that, I'm an academic, I just rewrite.

Yours,
Linus Walleij
