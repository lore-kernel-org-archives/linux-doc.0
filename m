Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B0EC4363D
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 09:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3A2220796
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 09:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RD6Sa7SS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgJEJ3b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgJEJ3b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 05:29:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26135C0613A7
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 02:29:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v12so8032227wmh.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 02:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NkkZ0AZItfPzXXyiWUs3wdbhFkdEuozzWE5YN7fX2Ds=;
        b=RD6Sa7SS02XMmSEITYc+16rUxDLnGebQGiPycqS2AHIUGt1HKXcbyFJO2j0zhLR3ZV
         MYcG6n/KPVssa/d74T6uHaLPmzw2YIJ1RxZv5UH86MyTQlbgSGwcY3lCojdvHOvoyLYr
         3InQKiPVQXm4doK9Npsgmpq0pyMNNUx9LU9zwy/R4Ti81NIxZHdTsUYc32lFcxjUghCM
         zJUY/Iu5ON7FYBKZ9+lmmO5Sk7FYh54C7wOC7bqTUUXmPugywv4W1v8BMeNvxBdNZqK5
         TkRXl7IBaL10uym0Pw2B4bUGB1dniXKZJs8Nz3qozzlnsaxB/V2jYceXHMtovB6Oemp3
         S4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NkkZ0AZItfPzXXyiWUs3wdbhFkdEuozzWE5YN7fX2Ds=;
        b=MNOV7tfFV5swRHKhqaVrBFAHxqDjfUDUWfXfKzWRAt2bNPCr21tEIekbgENs+cLnMl
         Kgt0TSodJ0Ftnh/lbND9pANSYZK4DUD9edizVtGDBhjzPgUmwN5nKorGUy1XTv/96+MB
         vhf7JvMDTAWNVdTQZu6ObEg01lgSdbgeaMbLxeWbM7b4S61m7ZzcS5bmH7e8sx5r8Tyl
         ipg/paiiuyMaXHNvjHtC4kzcV25IxHGh4c2M4eRY6ox8cft5vTeKWNkEidaQbOEwnBnA
         nOmq/f3Avpa+eO8/xEDLqHJF3KnZgYjsWhTjfUioGc3FjGr0fuB3T5dk39dAxIkJDoM1
         rKKg==
X-Gm-Message-State: AOAM5312LYvJS8V47iBnWuWyB30a3gg1ITW03Q51OlTbsBcfBXNvD7pe
        YXxTE00kw08cv/Q72MunAiJ2EXpFaSofdi6q52sCpw==
X-Google-Smtp-Source: ABdhPJzdTHCSzPEmyky+jVTYpmIeNA4gwh4eafVoKki6ciFaZTe6pNy41Z81p02iQGgR8m4sm1feM4sG9bAxg7oIc+Q=
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr15306469wmj.112.1601890169505;
 Mon, 05 Oct 2020 02:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com> <20200929133814.2834621-6-elver@google.com>
 <CAG48ez3X4dqXAEa7NFf6Vm3kq6Rk+z0scWqK6TV6jTo5+Pu+aA@mail.gmail.com>
In-Reply-To: <CAG48ez3X4dqXAEa7NFf6Vm3kq6Rk+z0scWqK6TV6jTo5+Pu+aA@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 5 Oct 2020 11:29:18 +0200
Message-ID: <CAG_fn=Wsxd+7COTzkqg-h82EzZgHq_bAM+u3u2rMh6VOmVQTdg@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] mm, kfence: insert KFENCE hooks for SLUB
To:     Jann Horn <jannh@google.com>
Cc:     Marco Elver <elver@google.com>, Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 2, 2020 at 9:07 AM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Sep 29, 2020 at 3:38 PM Marco Elver <elver@google.com> wrote:
> > Inserts KFENCE hooks into the SLUB allocator.
> [...]
> > diff --git a/mm/slub.c b/mm/slub.c
> [...]
> > @@ -3290,8 +3314,14 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, =
gfp_t flags, size_t size,
> >         c =3D this_cpu_ptr(s->cpu_slab);
> >
> >         for (i =3D 0; i < size; i++) {
> > -               void *object =3D c->freelist;
> > +               void *object =3D kfence_alloc(s, s->object_size, flags)=
;
>
> kfence_alloc() will invoke ->ctor() callbacks if the current slab has
> them. Is it fine to invoke such callbacks from here, where we're in
> the middle of a section that disables interrupts to protect against
> concurrent freelist changes? If someone decides to be extra smart and
> uses a kmem_cache with a ->ctor that can allocate memory from the same
> kmem_cache, or something along those lines, this could lead to
> corruption of the SLUB freelist. But I'm not sure whether that can
> happen in practice.

From cache_init_objs_debug() in mm/slab.c:

                /*
                 * Constructors are not allowed to allocate memory from the=
 same
                 * cache which they are a constructor for.  Otherwise, dead=
lock.
                 * They must also be threaded.
                 */

So, no, it is not allowed to allocate from the same cache in the constructo=
r.


> Still, it might be nicer if you could code this to behave like a
> fastpath miss: Update c->tid, turn interrupts back on (___slab_alloc()
> will also do that if it has to call into the page allocator), then let
> kfence do the actual allocation in a more normal context, then turn
> interrupts back off and go on. If that's not too complicated?
>
> Maybe Christoph Lameter has opinions on whether this is necessary...
> it admittedly is fairly theoretical.
>
> > +               if (unlikely(object)) {
> > +                       p[i] =3D object;
> > +                       continue;
> > +               }
> > +
> > +               object =3D c->freelist;
> >                 if (unlikely(!object)) {
> >                         /*
> >                          * We may have removed an object from c->freeli=
st using



--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
