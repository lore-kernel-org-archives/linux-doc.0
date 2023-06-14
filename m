Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007FCEB64D9
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jun 2023 07:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbjFNHM3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jun 2023 03:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbjFNHM0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jun 2023 03:12:26 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB6719B7
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 00:12:25 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so533883276.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686726744; x=1689318744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWHbDUIB8U+qtgrSoFxR3VEwuBtSP2zu4dnUABc1wvE=;
        b=yAKVXLzwY5/bo3MapGalo/VmgpZhXPFzARCopGZQH1dIFiIRMsz2HLdGC384K+5VVs
         NmfxnOrpOCjHtsd4qE2m89xz2aPe5WKjQ8UALL80ptcTFn8W4XweIly80WPKALOJMko/
         /tzNsManeqVF/JCNKAEOaN6ztEClHDkpBNScnxionCtKtL1wqih/qcb7WXhhpJnl+yFp
         z5Z2IYSvPtRlh0YEkIIRl7MjX/D0LEA6qNP2IRZ4ahsY9E5mb/NJ4oXMo3EM3Qenc1ty
         dBCB6ojG/mC0Ueh8keldvhRzxfRWT4oKcUV2/qZOf/8jPg+uUDyBLgasv8A8O9Gxaotw
         tFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686726744; x=1689318744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWHbDUIB8U+qtgrSoFxR3VEwuBtSP2zu4dnUABc1wvE=;
        b=A+4uTcROEf1yTK7KZxTTbzsTp992ASZGnN29eaFkVAquc9qRDlNzB7SFn6VA7GCADb
         ig7xAvcmeRb6O8YUQVA0WSUf6VFqPe0OwnxbB3cTvWIlZ604cWMCKgC0zhgWi115aNNP
         z8r+AmXDj/nTGOXtER9gs+9QOv00KOEi0dgxIkaCt189mARq4FWkr31Cdock9AzruT/r
         z8GLbfED25QaDFVW1GKlXPSR0WwSoEG2y7hlwrTXcdkmupbUDMijktz8q66FuyMLuwJP
         cA3nbC3CiYWxt9Ck8s2Vw0dc/afnuAOP43j9on7zX2P6yRQ8S+b7WTAxvecpQI/Mrp8I
         U4Pw==
X-Gm-Message-State: AC+VfDzye/ut2+x0cuTz/05Tiqn5vRNx02mTD7D/+xEGY6enWyPybXYC
        Lc+sE/OKAkZMnhMynx8O5rRtettQnMKDUAiT4z6ykQ==
X-Google-Smtp-Source: ACHHUZ4Ay9jY6iCOsAGVFKmaIHQT6ZQsGm25F5VYaPHt8JoX8//CV2rAJFvPTBsVOOEJ4H52hEtVwe8Da5FE9B1phwI=
X-Received: by 2002:a25:4150:0:b0:bc5:16ba:aab2 with SMTP id
 o77-20020a254150000000b00bc516baaab2mr1132838yba.1.1686726744607; Wed, 14 Jun
 2023 00:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230613083906.757878-1-linus.walleij@linaro.org> <ZIiA+E3W2oWy9uuR@casper.infradead.org>
In-Reply-To: <ZIiA+E3W2oWy9uuR@casper.infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Jun 2023 09:12:13 +0200
Message-ID: <CACRpkdbtj8uedJDHiSgyVZGAPwn08Yhw4qgfOa=z7qbN10t+Mw@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation/mm: Initial page table documentation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 13, 2023 at 4:45=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
> On Tue, Jun 13, 2023 at 10:39:06AM +0200, Linus Walleij wrote:

> > +Paged virtual memory was invented along with virtual memory as a conce=
pt in
> > +1962 on the Ferranti Atlas Computer which was the first computer with =
paged
> > +virtual memory. The feature migrated to newer computers and became a d=
e facto
> > +feature of all Unix-like systems as time went by. In 1985 the feature =
was
> > +included in the Intel 80386, which was the CPU Linux 1.0 was developed=
 on.
>
> I still don't think the origin story is useful.  It's trivia and doesn't
> help someone understand what they need to know.

I think history is pretty important for understanding concepts, otherwise
they appear as not invented but emergent. However the question about
what is important and what is trivia is a question of professional technica=
l
writing. The documentation maintainer works with technical writing and
can decide the value of this.

> > +Page tables map virtual addresses as seen by the CPU program counter i=
nto
> > +physical addresses as seen on the external memory bus.
>
> This makes it sound like virtual addresses are only used for
> instructions.  I had better wording earlier, but there's no point in
> repeating it.  Just: I dissent.

You are right I should reword this to be about memory accesses, I
might have missed some of your feedback so I will go back and check
what you said.

> > +Linux defines page tables as a hierarchy which is currently five level=
s in
> > +height. The target architecture code for each supported architecture w=
ill then
> > +map this to the restrictions of the target hardware.
>
> The word "target" isn't adding any value in this paragraph.

Thanks dropping it.

I guess the word is a byproduct of doing too much cross compiling...

> Honestly, I don't like much about this document.  The writing is
> flabby and untargetted.

Please refarain from using this kind of unproffessional wording in your
professional communication. Be technical, precise and to the point and do
not use value statements.

> Much of my last review was ignored.  I'm just
> going to stop here since I have low confidence that any suggestions
> would be incorporated.

Your statement is incorrect. Your feedback is seen as valuable
and it is read, reacted on and incorporated.

I did rewrite the document thoroughly in reaction to your comments,
and in order so you feel respected I am going to illustrate.

You wrote:

> This reads backwards to me.  The index point in the hierarchy (what an
> unusual turn of phrase!) is surely the virtual address, since the
> hierarchy is indexed by virtual addresses.  If this paragraph is
> supposed to define what a pfn is, how about simply:
>
> The pfn of a page of memory is the physical address of the page divided
> by PAGE_SIZE

Which I took as a good suggestion, and the paragraph is rewritten
from this (which you criticized):

> +The physical address corresponding to the virtual address is commonly
> +defined by the index point in the hierarchy, and this is called a **page=
 frame
> +number** or **pfn**. The first entry on the top level to the first entry=
 in the
> +second and so on down the hierarchy will point out the virtual address f=
or the
> +physical memory address 0, which will be *pfn 0* and the highest pfn wil=
l be
> +the last page of physical memory the external address bus of the CPU can
> +address.

To this (current wording):

> The physical address corresponding to the virtual address is often refere=
nced
> by the underlying physical page frame. The **page frame number** or **pfn=
**
> is the physical address of the page (as seen on the external memory bus)
> divided by `PAGE_SIZE`.

Which obviously includes some of your wording (divided by PAGE_SIZE etc).
I also got review comments from other reviewers and that is reflected in th=
e
current wording.

You wrote:

> Your arrows are backwards.  The PTE doesn't point to the PMD; the PMD
> points to PTEs.

And this was changed to what you suggested, and it was a pretty
fundamental and important change.

You wrote:

> You have rather too many forward references in this description for my
> taste.  Start with the PTE, then the PMD, then  PUD, P4D, PGD.

And this was changed to exactly what you suggested.

You wrote:

> array, not list

And this was changed (everywhere) to what you suggested.

You wrote:

> I think a document like this that talks about page tables really needs to
> include a description of how some PMDs / PUDs / ... may not be pointers
> to lower levels, but direct pointers to the actual memory (ie THPs /
> hugetlb pages).

And the document now includes this (Mike Rapoport made the same
comment).

So your claim that "Much of my last review was ignored." is simply
incorrect. It was not ignored, rather it has thoroughly shaped the document=
.

Yours,
Linus Walleij
