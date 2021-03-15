Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB54FC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 08:03:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9240564E0F
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 08:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhCOIDF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 04:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhCOIDB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Mar 2021 04:03:01 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F314CC061574
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 01:03:00 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id by2so7338597qvb.11
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 01:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KtsjY55Jb9isqHKR/wLdGTjwveZYY37X0uZAq2FcZYY=;
        b=eNoy/sAslJPTHri/E+o0QZwDrPtp5NOMa8ZT43AYzyn9M/724X3DHly+M0a5mgryhd
         4qwz78vyTekpvZNSBFK3LU01NLj48shn3nx81ljZlxKUKp2b2Ksp2CnnYmfN8PrZuLJJ
         kptmCtiCa2oXV01CmLi7z4IaJgVOTPLkAWDxQmLrhNsmM3t7Zqkd3NqWin2cOr7rjV1T
         KDr+dALErEonApJW9a8n8oKXMK5K08ZVr71JQr1pEibDgAtQ2dGxh1462pBYcZJVLNjR
         kiXSEqgMxJtVrfnaDZrBCSyzKS4sLHBaxchB4F8yOXIck3qW1I0mLBW0S0Jn4WYqEKbf
         7eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KtsjY55Jb9isqHKR/wLdGTjwveZYY37X0uZAq2FcZYY=;
        b=toyFZIIW5zL4kDhkuqc+bgiFQi7v4c2lZtuJtop87XRGbxRlsy09nf/qM4n+2unZvX
         iw7QgWEfbXgjzOoaCMT9j452PzE7mCQUQDssNdqUYXRbLmHJ9/IpFcbuhTcZtEcaY1Vt
         UGeQnYQfL1jyumiZFNbBgiVKIZw2LjJHkhTD9ywNpxwXbrDU9xzQKbqTeaye7z5+caRg
         Sc1afxl/DFvQlpceOXdfg3/ygwH26C3oqbSRukfO2HKfzoU314sntn0S2yzz1JQuS9iu
         RKSTsufn7vgjOcRKbWc9HTRwWghilwMKRPgkRch5sSxcusVutHvbfKcmeakTXJx2NSu2
         70Qw==
X-Gm-Message-State: AOAM531CiEPUn+ItsR9PpwypVMw4xJWRnMPCYHcOYQCkuw4Tso7NUk2a
        n6PgM28lIfYp4iqhkHXAJBDfxrGGENVX20HjQaHbIw==
X-Google-Smtp-Source: ABdhPJxolqzie89TsnAUqA7foD8TQUwVbq1KgosF5icKUxGgcdKhUwUHD4zYwkAWxqxmTlqNzggxYbsFLnGS/5x4VHI=
X-Received: by 2002:ad4:50d0:: with SMTP id e16mr23756584qvq.37.1615795379822;
 Mon, 15 Mar 2021 01:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210211080716.80982-1-info@alexander-lochmann.de>
 <CACT4Y+YwRE=YNQYmQ=7RWde33830YOYr5pEAoYbrofY2JG43MA@mail.gmail.com> <01a9177f-bfd5-251a-758f-d3c68bafd0cf@alexander-lochmann.de>
In-Reply-To: <01a9177f-bfd5-251a-758f-d3c68bafd0cf@alexander-lochmann.de>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 15 Mar 2021 09:02:48 +0100
Message-ID: <CACT4Y+ZPX43ihuL0TCiCY-ZNa4RmfwuieLb1XUDJEa4tELsUsQ@mail.gmail.com>
Subject: Re: [PATCH] KCOV: Introduced tracing unique covered PCs
To:     Alexander Lochmann <info@alexander-lochmann.de>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Maciej Grochowski <maciej.grochowski@pm.me>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 14, 2021 at 10:29 PM Alexander Lochmann
<info@alexander-lochmann.de> wrote:
> On 12.02.21 13:54, Dmitry Vyukov wrote:
> >
> > I think we could make KCOV_IN_CTXSW sign bit and then express the check as:
> >
> > void foo2(unsigned mode) {
> >   if (((int)(mode & 0x8000000a)) > 0)
> >     foo();
> > }
> >
> > 0000000000000020 <foo2>:
> >   20: 81 e7 0a 00 00 80    and    $0x8000000a,%edi
> >   26: 7f 08                jg     30 <foo2+0x10>
> >   28: c3                    retq
> >
> So ((int)(mode & (KCOV_IN_CTXSW | needed_mode))) > 0?

Frankly I lost all context now. If it results in optimal code, then, yes.

> >>  }
> >>
> >>  static notrace unsigned long canonicalize_ip(unsigned long ip)
> >> @@ -191,18 +192,26 @@ void notrace __sanitizer_cov_trace_pc(void)
> >>         struct task_struct *t;
> >>         unsigned long *area;
> >>         unsigned long ip = canonicalize_ip(_RET_IP_);
> >> -       unsigned long pos;
> >> +       unsigned long pos, idx;
> >>
> >>         t = current;
> >> -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
> >> +       if (!check_kcov_mode(KCOV_MODE_TRACE_PC | KCOV_MODE_UNIQUE_PC, t))
> >>                 return;
> >>
> >>         area = t->kcov_area;
> >> -       /* The first 64-bit word is the number of subsequent PCs. */
> >> -       pos = READ_ONCE(area[0]) + 1;
> >> -       if (likely(pos < t->kcov_size)) {
> >> -               area[pos] = ip;
> >> -               WRITE_ONCE(area[0], pos);
> >> +       if (likely(t->kcov_mode == KCOV_MODE_TRACE_PC)) {
> >
> > Does this introduce an additional real of t->kcov_mode?
> > If yes, please reuse the value read in check_kcov_mode.
> Okay. How do I get that value from check_kcov_mode() to the caller?
> Shall I add an additional parameter to check_kcov_mode()?

Yes, I would try to add an additional pointer parameter for mode. I
think after inlining the compiler should be able to regestrize it.

> >> +               /* The first 64-bit word is the number of subsequent PCs. */
> >> +               pos = READ_ONCE(area[0]) + 1;
> >> +               if (likely(pos < t->kcov_size)) {
> >> +                       area[pos] = ip;
> >> +                       WRITE_ONCE(area[0], pos);
> >> +               }
> >> +       } else {
> >> +               idx = (ip - canonicalize_ip((unsigned long)&_stext)) / 4;
> >> +               pos = idx % BITS_PER_LONG;
> >> +               idx /= BITS_PER_LONG;
> >> +               if (likely(idx < t->kcov_size))
> >> +                       WRITE_ONCE(area[idx], READ_ONCE(area[idx]) | 1L << pos);
> >>         }
> >>  }
> >>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
> >> @@ -474,6 +483,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
> >>                 goto exit;
> >>         }
> >>         if (!kcov->area) {
> >> +               kcov_debug("mmap(): Allocating 0x%lx bytes\n", size);
> >>                 kcov->area = area;
> >>                 vma->vm_flags |= VM_DONTEXPAND;
> >>                 spin_unlock_irqrestore(&kcov->lock, flags);
> >> @@ -515,6 +525,8 @@ static int kcov_get_mode(unsigned long arg)
> >>  {
> >>         if (arg == KCOV_TRACE_PC)
> >>                 return KCOV_MODE_TRACE_PC;
> >> +       else if (arg == KCOV_UNIQUE_PC)
> >> +               return KCOV_MODE_UNIQUE_PC;
> >
> > As far as I understand, users can first do KCOV_INIT_UNIQUE and then
> > enable KCOV_TRACE_PC, or vice versa.
> > It looks somewhat strange. Is it intentional?
> I'll fix that.
> It's not possible to
> > specify buffer size for KCOV_INIT_UNIQUE, so most likely the buffer
> > will be either too large or too small for a trace.
> No, the buffer will be calculated by KCOV_INIT_UNIQUE based on the size
> of the text segment.

Yes, which will be either too large or too small for KCOV_TRACE_PC
enabled later.


> - Alex
>
> --
> Alexander Lochmann                PGP key: 0xBC3EF6FD
> Heiliger Weg 72                   phone:  +49.231.28053964
> D-44141 Dortmund                  mobile: +49.151.15738323
