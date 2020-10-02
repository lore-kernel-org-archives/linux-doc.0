Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F335C4363D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 07:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1A532072E
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 07:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGd6dHat"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgJBHHl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 03:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBHHi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 03:07:38 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF62C0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 00:07:38 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w1so606811edr.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ye/s+D4VgMKbfo7kHtFUxt4Yo6siN0GRSwJxDl1BL+I=;
        b=lGd6dHatt84jG23C4UbyRVcWWz0xn0Qrfij2A3wZfpYYjg9fPxAAd7grU5d8oUMsDT
         7i3mC0uZujFHrRo5Kn7Ud1Eqj+wbu56Oi9N9sZdoAI4yvulybbON8fDDp7ueDbYsAJu8
         K9HpYk48IbvvgxtQtjpQ+sDnTndH6h5h27ukC6sI3FlQpdE1xafysZbwQYl/d6AiQxhr
         3cSCz3a9HVxJDlpGlxlK5xpA4oiHDi+nGtJvd+rDTIi8z5xCrPthNReLCeCZyWYox62T
         AKraMFe1S6O12Elu7j8RB9iXjo4zADGodhyx0ZgiTER3GmnSP48NewOSn33riX4PKmTQ
         1COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ye/s+D4VgMKbfo7kHtFUxt4Yo6siN0GRSwJxDl1BL+I=;
        b=VPwtwYyrFblY/Z6UxlElSbV60iZDrHZm3rrL5CPIAc4Kmd4J3H9dRfvIIiwIp8HEo7
         gY3hPcB2oaRSLWPmaPHXOnRXS+kpy2WPEJ0vfkvvv3uhdFHqx43JnHRFUl2Pp0vLAD3f
         VbKiH1SIlcc2Bl6DXCn3mf94bl2rhHiXIecgoY/18eeRb3UhjFReVpG1IdTNWEIvfxpa
         Mru7XCChAopNumdWv//+iQZ/8R9v1gSuvyZGJf07oRdCxCWRquxBdBetkJu7moJKcpqY
         fLGr4jpv8nW7idbAGgtFX1+kV82R8iEx4iqKfywkgPj7bw/q+c9npTqZVcwuPLM5hsF8
         d5Jg==
X-Gm-Message-State: AOAM5314rpIcOMFGJZfySzchABTgLm7QV6xY8aPqfhEjkpQpEodxvy1B
        S1CoSZlmxidHCLANymaD10RkBaZjCnMjT8tGMwBbpw==
X-Google-Smtp-Source: ABdhPJzgVIGLadHTIUq/65YztskB32r0plXShVqth5zW5ceX8yhFiQj5pLoO1PgEF7cgm0dwaKz6WJ+SAn/4YSsANOY=
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr892264edb.259.1601622454831;
 Fri, 02 Oct 2020 00:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com> <20200929133814.2834621-6-elver@google.com>
In-Reply-To: <20200929133814.2834621-6-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 2 Oct 2020 09:07:08 +0200
Message-ID: <CAG48ez3X4dqXAEa7NFf6Vm3kq6Rk+z0scWqK6TV6jTo5+Pu+aA@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] mm, kfence: insert KFENCE hooks for SLUB
To:     Marco Elver <elver@google.com>, Christoph Lameter <cl@linux.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
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
        Ingo Molnar <mingo@redhat.com>, Jonathan.Cameron@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, sjpark@amazon.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 29, 2020 at 3:38 PM Marco Elver <elver@google.com> wrote:
> Inserts KFENCE hooks into the SLUB allocator.
[...]
> diff --git a/mm/slub.c b/mm/slub.c
[...]
> @@ -3290,8 +3314,14 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
>         c = this_cpu_ptr(s->cpu_slab);
>
>         for (i = 0; i < size; i++) {
> -               void *object = c->freelist;
> +               void *object = kfence_alloc(s, s->object_size, flags);

kfence_alloc() will invoke ->ctor() callbacks if the current slab has
them. Is it fine to invoke such callbacks from here, where we're in
the middle of a section that disables interrupts to protect against
concurrent freelist changes? If someone decides to be extra smart and
uses a kmem_cache with a ->ctor that can allocate memory from the same
kmem_cache, or something along those lines, this could lead to
corruption of the SLUB freelist. But I'm not sure whether that can
happen in practice.

Still, it might be nicer if you could code this to behave like a
fastpath miss: Update c->tid, turn interrupts back on (___slab_alloc()
will also do that if it has to call into the page allocator), then let
kfence do the actual allocation in a more normal context, then turn
interrupts back off and go on. If that's not too complicated?

Maybe Christoph Lameter has opinions on whether this is necessary...
it admittedly is fairly theoretical.

> +               if (unlikely(object)) {
> +                       p[i] = object;
> +                       continue;
> +               }
> +
> +               object = c->freelist;
>                 if (unlikely(!object)) {
>                         /*
>                          * We may have removed an object from c->freelist using
