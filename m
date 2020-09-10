Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D029C433E2
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 17:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30C40214F1
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 17:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJ2eDS6O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgIJROK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 13:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgIJRMB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 13:12:01 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB28C061573
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 10:11:53 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id cy2so3727520qvb.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8vk1P98X5wFislYUCmYAXFRXimxyGQmLmxtAeRXAYBI=;
        b=dJ2eDS6OYx+Rr1FutsvSR3n0fKpYmBxf+wOjWwihbER0Mw3BpAiGD3a1kT4fo1a656
         V80AfRGIV99omd5ddL5JXBPXJpatkmQWDKWjGcSi3nGAYjSpVDMG2pZu8Fkynp9EzdjX
         2/ZYKWFE1At3yPuYVv1KopWAn5xo8pS001kqzr2rly3W3jrkKbttTPtkG2EYUKUj4EGt
         MHWogp+BNZlsUeqAcYg4Aoal6ThfyH5NVr26hIbvK3Mt8XY3Y5C7MiXhyp78D251+52b
         C8d5kNgjGwTl6Xk71d0Q0zyx2a8aj5SlpPUBsKpl7rd0oX916/kxRsgG0UC0xMBgkc6E
         U4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8vk1P98X5wFislYUCmYAXFRXimxyGQmLmxtAeRXAYBI=;
        b=JqYbGyjqGQK2qGaNBUTEDnWXaueP6YjcF3FHLd+R5PopG/UZSx6DmRAOfQkzoWoSvQ
         Oa8scWQN+47aDfwE7PqIZVo9niraPNNipPqUmzpz3P54zSXlRHhwQ+8dXqvHfMJaLNt4
         QSRLJodea7h3dYUrWby8+eaouM1sCSi6fCouIpuLKUzKL++O4En7KV3bDEg6hvaiv921
         XooRFQNOtIeU2CHKIScH0Tgetehy0REjyJkfHihEnEKshBM5VxmNvr874AoF4orwezsf
         dEf7VZSosvB/3mcLcXtzMmCbP85x9xoJg+kO2uSwlu9mBQHV5V7hfgU8yj7iCLT68aiM
         OIeA==
X-Gm-Message-State: AOAM532f/7EenXihXR7F3inovUQyBr4dcVMR6g2sFGq0UbpYiNejvfBN
        B2Gmd21Ao4CmjJvWwZEVfA8V/5lxUvEPoM4ycm6PiA==
X-Google-Smtp-Source: ABdhPJxGU1FdqtWLYisiJfOMl6bKtcIBYvD7h4od2dwulxA+1a32srJ7nxaPEvQ9IFFnstG56C9dtYDNYTUhBbF+tSo=
X-Received: by 2002:a0c:f984:: with SMTP id t4mr9654083qvn.18.1599757912407;
 Thu, 10 Sep 2020 10:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-2-elver@google.com>
 <CACT4Y+bfp2ch2KbSMkUd3142aA4p2CiMOmdXrr0-muu6bQ5xXg@mail.gmail.com> <CAG_fn=W4es7jaTotDORt2SwspE4A804mdwAY1j4gcaSEKtRjiw@mail.gmail.com>
In-Reply-To: <CAG_fn=W4es7jaTotDORt2SwspE4A804mdwAY1j4gcaSEKtRjiw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 10 Sep 2020 19:11:41 +0200
Message-ID: <CACT4Y+awrz-j8y5Qc8OS9qkov4doMnw1V=obwp3MB_LTvaUFXw@mail.gmail.com>
Subject: Re: [PATCH RFC 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Alexander Potapenko <glider@google.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 10, 2020 at 6:19 PM Alexander Potapenko <glider@google.com> wrote:
>
> On Thu, Sep 10, 2020 at 5:43 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
>
> > > +       /* Calculate address for this allocation. */
> > > +       if (right)
> > > +               meta->addr += PAGE_SIZE - size;
> > > +       meta->addr = ALIGN_DOWN(meta->addr, cache->align);
> >
> > I would move this ALIGN_DOWN under the (right) if.
> > Do I understand it correctly that it will work, but we expect it to do
> > nothing for !right? If cache align is >PAGE_SIZE, nothing good will
> > happen anyway, right?
> > The previous 2 lines look like part of the same calculation -- "figure
> > out the addr for the right case".
>
> Yes, makes sense.
>
> > > +
> > > +       schedule_delayed_work(&kfence_timer, 0);
> > > +       WRITE_ONCE(kfence_enabled, true);
> >
> > Can toggle_allocation_gate run before we set kfence_enabled? If yes,
> > it can break. If not, it's still somewhat confusing.
>
> Correct, it should go after we enable KFENCE. We'll fix that in v2.
>
> > > +void __kfence_free(void *addr)
> > > +{
> > > +       struct kfence_metadata *meta = addr_to_metadata((unsigned long)addr);
> > > +
> > > +       if (unlikely(meta->cache->flags & SLAB_TYPESAFE_BY_RCU))
> >
> > This may deserve a comment as to why we apply rcu on object level
> > whereas SLAB_TYPESAFE_BY_RCU means slab level only.
>
> Sorry, what do you mean by "slab level"?
> SLAB_TYPESAFE_BY_RCU means we have to wait for possible RCU accesses
> in flight before freeing objects from that slab - that's basically
> what we are doing here below:

Exactly! You see it is confusing :)
SLAB_TYPESAFE_BY_RCU does not mean that. rcu-freeing only applies to
whole pages, that's what I mean by "slab level" (whole slabs are freed
by rcu).

> > > +               call_rcu(&meta->rcu_head, rcu_guarded_free);
> > > +       else
> > > +               kfence_guarded_free(addr, meta);
> > > +}
