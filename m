Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BBDC4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BCC21734
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lq57cMFj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbgI2NNo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbgI2NNn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:13:43 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135ABC061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:13:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so4592206wmi.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JTFDtrWAFNtSx+STL9ivxdzcSQCqNLxR2RvvS87FYs8=;
        b=Lq57cMFjJdsZitlNgytm7PsrAOH3c5fyYhhIrlpRYUvEz+9FkNlEgU3qVOAcJ0wuFW
         +xn3neApnxiN+gj66GSFdigtNadD1ZHNCZXv6sfa8RiQSsMF+f+o1kSNYXryQqzMasHX
         JT2aFyQzlCtJVcEDR2ut0tjnkOERq4fG8VuBM1ZPGHKWT0P+DWCh0/AvKZ9yWyZv76fE
         +OdQA9RlpxxFeDDERUSkYcdO0ltny8r91ypfnmSGwOja5+NxtDYhJSkAHbo7m9XlWxGG
         CMDIWJ0JlfEe51eyKpYc23+bWPe9XFUr+IGASvf+0qQZlj8kKWMYiJlvOiXFpznXleA5
         Iz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JTFDtrWAFNtSx+STL9ivxdzcSQCqNLxR2RvvS87FYs8=;
        b=IiML8l6dPUEnnwHvhiwdcrzqlc4YgUbd1F9sWV1OZoQrRi0+rwMhfnLEdzFkiFoLMH
         5/kTXu/6GJBj/wQnuDRUT7GfVwIOIsFtI9HNcInlyvHAF8JS1vuQQToIVuD6xsjI/Arf
         Q6LBWbGR+jBxgZBt4nnUWVjTTq4J56fB8E22kYKPXr6F9HQx/wE3IupK2Hu3LEN7CgOU
         3XeHODoeT80IKtrtn9EN/f8Mlim3Z29aDMojWLrg+ooQNBD2ck1+nhFPdARF2J0eZ/F3
         Ac/KtVx6lIA2aW/Y+0AOzvjTSp0n2N9iCjRugqHFF5merOk+OSAm5UcxtpFaAGwSP2hm
         B3Vw==
X-Gm-Message-State: AOAM531UjI7ElX47u1tkPR8CxxesyDyZUs69wGFYREViuwApMb/GLQ5v
        INrDSlwJgmBqa/4ecqqc7gcxgrxRfmZcZgPU5PDYkQ==
X-Google-Smtp-Source: ABdhPJzw/Zb4GAgOYha9l6GBhoHEbXOYGxJdrW488S4mgz+iiVYDyyZg9YqgYZzaKC9YtLUJm/IWtLrVjvkYqHlU+Hs=
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4247992wmk.29.1601385221422;
 Tue, 29 Sep 2020 06:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-7-elver@google.com>
 <CAAeHK+yMmGSTpwC1zPxaoBmXsfmmhuLJ3b2N3qUXUjO5U0tM3Q@mail.gmail.com>
In-Reply-To: <CAAeHK+yMmGSTpwC1zPxaoBmXsfmmhuLJ3b2N3qUXUjO5U0tM3Q@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Tue, 29 Sep 2020 15:13:30 +0200
Message-ID: <CAG_fn=VkLKE5OBFatheWGNGy7jcw8iuFqjqCARGu-uWOte6HOw@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] kfence, kasan: make KFENCE compatible with KASAN
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 29, 2020 at 2:21 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Mon, Sep 21, 2020 at 3:26 PM Marco Elver <elver@google.com> wrote:
> >
> > From: Alexander Potapenko <glider@google.com>
> >
> > We make KFENCE compatible with KASAN for testing KFENCE itself. In
> > particular, KASAN helps to catch any potential corruptions to KFENCE
> > state, or other corruptions that may be a result of freepointer
> > corruptions in the main allocators.
> >
> > To indicate that the combination of the two is generally discouraged,
> > CONFIG_EXPERT=y should be set. It also gives us the nice property that
> > KFENCE will be build-tested by allyesconfig builds.
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > ---
> >  lib/Kconfig.kfence | 2 +-
> >  mm/kasan/common.c  | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> > index 4c2ea1c722de..6825c1c07a10 100644
> > --- a/lib/Kconfig.kfence
> > +++ b/lib/Kconfig.kfence
> > @@ -10,7 +10,7 @@ config HAVE_ARCH_KFENCE_STATIC_POOL
> >
> >  menuconfig KFENCE
> >         bool "KFENCE: low-overhead sampling-based memory safety error detector"
> > -       depends on HAVE_ARCH_KFENCE && !KASAN && (SLAB || SLUB)
> > +       depends on HAVE_ARCH_KFENCE && (!KASAN || EXPERT) && (SLAB || SLUB)
> >         depends on JUMP_LABEL # To ensure performance, require jump labels
> >         select STACKTRACE
> >         help
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 950fd372a07e..f5c49f0fdeff 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/init.h>
> >  #include <linux/kasan.h>
> >  #include <linux/kernel.h>
> > +#include <linux/kfence.h>
> >  #include <linux/kmemleak.h>
> >  #include <linux/linkage.h>
> >  #include <linux/memblock.h>
> > @@ -396,6 +397,9 @@ static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
> >         tagged_object = object;
> >         object = reset_tag(object);
> >
> > +       if (is_kfence_address(object))
> > +               return false;
> > +
> >         if (unlikely(nearest_obj(cache, virt_to_head_page(object), object) !=
> >             object)) {
> >                 kasan_report_invalid_free(tagged_object, ip);
> > @@ -444,6 +448,9 @@ static void *__kasan_kmalloc(struct kmem_cache *cache, const void *object,
> >         if (unlikely(object == NULL))
> >                 return NULL;
> >
> > +       if (is_kfence_address(object))
> > +               return (void *)object;
> > +
> >         redzone_start = round_up((unsigned long)(object + size),
> >                                 KASAN_SHADOW_SCALE_SIZE);
> >         redzone_end = round_up((unsigned long)object + cache->object_size,
> > --
> > 2.28.0.681.g6f77f65b4e-goog
> >
>
> With KFENCE + KASAN both enabled we need to bail out in all KASAN
> hooks that get called from the allocator, right? Do I understand
> correctly that these two are the only ones that are called for
> KFENCE-allocated objects due to the way KFENCE is integrated into the
> allocator?

Yes, these two places were sufficient; we've checked that KFENCE and
KASAN work together.
