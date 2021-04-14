Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1159C43461
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A755F61154
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 19:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbhDNTph (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243437AbhDNTpg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 15:45:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0A4C061760
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:45:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x19so4740222lfa.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=catwv2q3GSgLTDfMsYUmKmCZSwshqzh+pHe6dS6qFq0=;
        b=QSP43wtvqaEpZcRARk7mnw6oGOWu/4ywNnl/aVkEAOC2K7s8WzvGjOeQ31KNa9gAzv
         Kwi4DqSQUP2RnnG596Y/A8JFnkJHEpUBMWLjMY+a11yRwc7I1t6lIfi35/Jgsk4ZVu7F
         xXR4Tg1KelOIvKHH456Hdflb01KVNQFjYFjuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=catwv2q3GSgLTDfMsYUmKmCZSwshqzh+pHe6dS6qFq0=;
        b=hcUkBla0cDbNgrLO3aC0g2VmMTaq6MegFlwKdCPUII8ty0M6H4JZ7ei+EEj8lz5jEB
         1gjDHuzQ1/KOtZ2TN5boHJCRxoYbbkGK2ULSQD56o7sO1JR5s+dDWhl8UxPvAM0a0KRS
         v0U2uq6V/DgDgvWKn+XlxsnQmWNwWT1aabNGvwWmdxHjZssK1uNaSyhCwWUo9IeBaPIt
         D/hVfzvmqBDiBV4xCNbCaNJXYnNniFojEZhsn+JzCZZVi1xpTl4YK2DSQykCu2U3W9MW
         shaBtOTRntOOn4eh+TVjGEqEy1P+HyTCnqVD4lnkaOqS/lahehp7aqJvun425vCFUg3q
         gjwg==
X-Gm-Message-State: AOAM530VpgfsI8VZfH1XbNUI07Eek5BzvLFeJ4J3jfThHjZiyqIFGth0
        meao1tOdmgyZft4B5PQtBXp+VWorbTPLzqLB
X-Google-Smtp-Source: ABdhPJwL6uwbeF62it7s95WZQFAh8NKxHZowm0Tqs8wELBF5rG32WEipgcy56JmEqPneDXVdWSMc0w==
X-Received: by 2002:ac2:5fa2:: with SMTP id s2mr27315076lfe.486.1618429511094;
        Wed, 14 Apr 2021 12:45:11 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id l7sm109500lje.30.2021.04.14.12.45.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id x20so4859857lfu.6
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
X-Received: by 2002:ac2:58fc:: with SMTP id v28mr26526183lfo.201.1618429509986;
 Wed, 14 Apr 2021 12:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:44:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
Message-ID: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 11:46 AM <ojeda@kernel.org> wrote:
>
> Some of you have noticed the past few weeks and months that
> a serious attempt to bring a second language to the kernel was
> being forged. We are finally here, with an RFC that adds support
> for Rust to the Linux kernel.

So I replied with my reactions to a couple of the individual patches,
but on the whole I don't hate it.

HOWEVER.

I do think that the "run-time failure panic" is a fundamental issue.

I may not understand the ramifications of when it can happen, so maybe
it's less of an issue than I think it is, but very fundamentally I
think that if some Rust allocation can cause a panic, this is simply
_fundamentally_ not acceptable.

Allocation failures in a driver or non-core code - and that is by
definition all of any new Rust code - can never EVER validly cause
panics. Same goes for "oh, some case I didn't test used 128-bit
integers or floating point".

So if the Rust compiler causes hidden allocations that cannot be
caught and returned as errors, then I seriously think that this whole
approach needs to be entirely NAK'ed, and the Rust infrastructure -
whether at the compiler level or in the kernel wrappers - needs more
work.

So if the panic was just some placeholder for things that _can_ be
caught, then I think that catching code absolutely needs to be
written, and not left as a to-do.

And if the panic situation is some fundamental "this is what the Rust
compiler does for internal allocation failures", then I think it needs
more than just kernel wrapper work - it needs the Rust compiler to be
*fixed*.

Because kernel code is different from random user-space system tools.
Running out of memory simply MUST NOT cause an abort.  It needs to
just result in an error return.

I don't know enough about how the out-of-memory situations would be
triggered and caught to actually know whether this is a fundamental
problem or not, so my reaction comes from ignorance, but basically the
rule has to be that there are absolutely zero run-time "panic()"
calls. Unsafe code has to either be caught at compile time, or it has
to be handled dynamically as just a regular error.

With the main point of Rust being safety, there is no way I will ever
accept "panic dynamically" (whether due to out-of-memory or due to
anything else - I also reacted to the "floating point use causes
dynamic panics") as a feature in the Rust model.

           Linus
