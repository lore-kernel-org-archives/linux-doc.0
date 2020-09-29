Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E1BC47420
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 15:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F47F20739
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 15:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C1AnuCCs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgI2PwN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbgI2PwN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 11:52:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB77C061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 08:52:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so5994581wrs.5
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=waqIMiy+b2Y1XhEMp7lwlO73kRIAH1OEaVKybD+u/ZQ=;
        b=C1AnuCCs/G/bgA/1YUmJNF1XFBujise6V07eyEJJbbGfWWHPX2GIlFrVyhXkrH37sQ
         4D4/krQiYT/p7pJRrz3xRrYYUbhyOjtPvSFnorNVoaXsLOa01N5SXKpDjsI5FndLnhRd
         8nK6h5qWp161tMRwNkkygqbTqyOdPiFESFKY1juuvWxIlXC/k38w8aUaMO24jxlGlnjt
         8E4fz28XrSpaprVTj00BiuGBXBkyXouN3n7UAFQy42yNhHXd8HqUbkpyNmUq8wON2nT6
         bR28M/YWkmC1hvdZjdZHvkiQbcWBAX5c7Y1P31soTuUXGQ6B3jh8O1vONpSzsyquRPi5
         O9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=waqIMiy+b2Y1XhEMp7lwlO73kRIAH1OEaVKybD+u/ZQ=;
        b=Dy12l+XVn9gf1BAfkTtiSZ4Bt5KvS6tfe5CRvY26Snwy7t6SkzkHvjxey3L0q0xnrl
         WOQ9c6Rbq25O5GgjpbM9lpXWfyNlcpoLUxkecIBz8n1VKHRo0IVOWNvKZa4CvSF4p+VW
         RY7OQ29QdO1swZYQmI4Ps/XyKLjTOYEk6o0OmBCaqHf8RTlpppB99MBBMgUH+BsGMYfI
         E6/BfLGjIboEXqILgEiCmwnesWl4YGjxRyZ0SFLDO+M7D5eEAupqrtgZjWu0ipd+n+kW
         ELMEpsjwgvj8zR1KkGAE0YrSB9oADWNWap3WuriLrNPihnzad4ocWmhNV5UoXkTEPK1E
         yBHQ==
X-Gm-Message-State: AOAM531mP6z1vdBNEOWaXa2sH+1TCK/9PbJNgbSSpS2Mh6Mmfb5qh4tU
        0vHDi/Dye+bGJ0pEGhFRdFFOLUgXbynM0pR9JeHL7g==
X-Google-Smtp-Source: ABdhPJyt0n3BFeP7541F+hN//hQOYJ9pNhiIXhLw+JPQvp3FfyuIQnsFqmqLKix89U+C2Ps2OK6T6XilQ90ujF0il+k=
X-Received: by 2002:adf:e312:: with SMTP id b18mr5418270wrj.372.1601394729790;
 Tue, 29 Sep 2020 08:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-2-elver@google.com>
 <20200929142411.GC53442@C02TD0UTHF1T.local>
In-Reply-To: <20200929142411.GC53442@C02TD0UTHF1T.local>
From:   Alexander Potapenko <glider@google.com>
Date:   Tue, 29 Sep 2020 17:51:58 +0200
Message-ID: <CAG_fn=UOJARteeqT_+1ORPEP9SB5HR3B3W8830rA9kjZLoN+Ww@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, sjpark@amazon.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 29, 2020 at 4:24 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Mon, Sep 21, 2020 at 03:26:02PM +0200, Marco Elver wrote:
> > From: Alexander Potapenko <glider@google.com>
> >
> > This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE is =
a
> > low-overhead sampling-based memory safety error detector of heap
> > use-after-free, invalid-free, and out-of-bounds access errors.
> >
> > KFENCE is designed to be enabled in production kernels, and has near
> > zero performance overhead. Compared to KASAN, KFENCE trades performance
> > for precision. The main motivation behind KFENCE's design, is that with
> > enough total uptime KFENCE will detect bugs in code paths not typically
> > exercised by non-production test workloads. One way to quickly achieve =
a
> > large enough total uptime is when the tool is deployed across a large
> > fleet of machines.
> >
> > KFENCE objects each reside on a dedicated page, at either the left or
> > right page boundaries. The pages to the left and right of the object
> > page are "guard pages", whose attributes are changed to a protected
> > state, and cause page faults on any attempted access to them. Such page
> > faults are then intercepted by KFENCE, which handles the fault
> > gracefully by reporting a memory access error. To detect out-of-bounds
> > writes to memory within the object's page itself, KFENCE also uses
> > pattern-based redzones. The following figure illustrates the page
> > layout:
> >
> >   ---+-----------+-----------+-----------+-----------+-----------+---
> >      | xxxxxxxxx | O :       | xxxxxxxxx |       : O | xxxxxxxxx |
> >      | xxxxxxxxx | B :       | xxxxxxxxx |       : B | xxxxxxxxx |
> >      | x GUARD x | J : RED-  | x GUARD x | RED-  : J | x GUARD x |
> >      | xxxxxxxxx | E :  ZONE | xxxxxxxxx |  ZONE : E | xxxxxxxxx |
> >      | xxxxxxxxx | C :       | xxxxxxxxx |       : C | xxxxxxxxx |
> >      | xxxxxxxxx | T :       | xxxxxxxxx |       : T | xxxxxxxxx |
> >   ---+-----------+-----------+-----------+-----------+-----------+---
> >
> > Guarded allocations are set up based on a sample interval (can be set
> > via kfence.sample_interval). After expiration of the sample interval, a
> > guarded allocation from the KFENCE object pool is returned to the main
> > allocator (SLAB or SLUB). At this point, the timer is reset, and the
> > next allocation is set up after the expiration of the interval.
>
> From other sub-threads it sounds like these addresses are not part of
> the linear/direct map.
For x86 these addresses belong to .bss, i.e. "kernel text mapping"
section, isn't that the linear map?
I also don't see lm_alias being used much outside arm64 code.

> Having kmalloc return addresses outside of the
> linear map is going to break anything that relies on virt<->phys
> conversions, and is liable to make DMA corrupt memory. There were
> problems of that sort with VMAP_STACK, and this is why kvmalloc() is
> separate from kmalloc().
>
> Have you tested with CONFIG_DEBUG_VIRTUAL? I'd expect that to scream.

Just checked - it doesn't scream on x86.

> I strongly suspect this isn't going to be safe unless you always use an
> in-place carevout from the linear map (which could be the linear alias
> of a static carevout).
>
> [...]
>
> > +static __always_inline void *kfence_alloc(struct kmem_cache *s, size_t=
 size, gfp_t flags)
> > +{
> > +     return static_branch_unlikely(&kfence_allocation_key) ? __kfence_=
alloc(s, size, flags) :
> > +                                                                   NUL=
L;
> > +}
>
> Minor (unrelated) nit, but this would be easier to read as:
>
> static __always_inline void *kfence_alloc(struct kmem_cache *s, size_t si=
ze, gfp_t flags)
> {
>         if (static_branch_unlikely(&kfence_allocation_key))
>                 return __kfence_alloc(s, size, flags);
>         return NULL;
> }
>
> Thanks,
> Mark.



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
