Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6220C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3815A2087D
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cI/RSXbZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgJ3CuK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgJ3CuK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:50:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6157C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y16so5387895ljk.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kiZ/FvhUKgnzktM7r0SIhiQ+o9jRSo0aasuFIIfF3Y4=;
        b=cI/RSXbZ3J08HVkL+vxrbM0y0ixEiW+UufDqi9EAkN5pqVxxegRDoJPui5zHfZ7qjJ
         W8J63y0QQOu8sjqOyYPK2vOVdbuWG8XtwGWniWLz3CsMmEp9olTucaQhSUiHdGohBk9s
         HCF02zZFCKFSvDrXYT3Jcd3/Dfg2xKE+Jo7v9WHylqDTi35IZRyIolZA3vpGaLIlo5SR
         8sbesLXWXbq5qxOr76b+jAy8CSLL9RIjyZiGrFk6bz02n2Fw/atjkAG3KwkVj8bq3LkC
         GCP/2Oop9izxkyn5RHaKefvSPajk5eXfdHcNgyE7zZ8gG7pjo7ejTNlbjHakBsLWi3SU
         8PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kiZ/FvhUKgnzktM7r0SIhiQ+o9jRSo0aasuFIIfF3Y4=;
        b=Tpxt+HeIYM0HsObR1xEwgEpJ2o8EagU4iNflhXtWY7T8IpL6yn3I0d7PIONquNXUk2
         uS+p3U9ZyXyFBGISMZA27+x/qLOG6Ta3b0CKRjihaXyhZ4q/KE8KsGCn95RvUxtxbZd8
         R/zeTT+GsjvW0vql9jloNG6TQBsyBJoZzp/oeHqQvS1HWPYS43JAZfXyvDy7EYboRQw9
         vjvhpgY/FnlHrqdnlmrirTJTefsWIDCSxSr2giwicd6tNujt+e/P7OilGfC2lYWiTb/0
         trBk9wEsQwU2xuuV89PjiIDPWGuFXVpySjKVoRxWEqfXeRm74CX063lst9tIGiFw9ttx
         Ju2g==
X-Gm-Message-State: AOAM531BQmYnbk7Mca/fUMZ/TH5fpR+Vc7Rc8lNWLHaEucSASfidnDLy
        LqpnFL2tCXZOrRbQxePKzXKN3+CB4okMZx28vsWJkg==
X-Google-Smtp-Source: ABdhPJzeJARslRAT+guaj4Ff3DrOlfqS+AGv0L6pZO5uH8AEy32OHFCAY9odVyg2ahuPLAqwrFcx0LUf5ahITqeZkLk=
X-Received: by 2002:a2e:9c84:: with SMTP id x4mr96553lji.326.1604026208097;
 Thu, 29 Oct 2020 19:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-6-elver@google.com>
In-Reply-To: <20201029131649.182037-6-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:41 +0100
Message-ID: <CAG48ez005N4SVKNXDL7k1C+JPiEbY7eTBJ+kL53N7g=bgWGAeQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] mm, kfence: insert KFENCE hooks for SLUB
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
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
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, joern@purestorage.com,
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> Inserts KFENCE hooks into the SLUB allocator.
>
> To pass the originally requested size to KFENCE, add an argument
> 'orig_size' to slab_alloc*(). The additional argument is required to
> preserve the requested original size for kmalloc() allocations, which
> uses size classes (e.g. an allocation of 272 bytes will return an object
> of size 512). Therefore, kmem_cache::size does not represent the
> kmalloc-caller's requested size, and we must introduce the argument
> 'orig_size' to propagate the originally requested size to KFENCE.
>
> Without the originally requested size, we would not be able to detect
> out-of-bounds accesses for objects placed at the end of a KFENCE object
> page if that object is not equal to the kmalloc-size class it was
> bucketed into.
>
> When KFENCE is disabled, there is no additional overhead, since
> slab_alloc*() functions are __always_inline.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Reviewed-by: Jann Horn <jannh@google.com>

if you fix one nit:

[...]
> diff --git a/mm/slub.c b/mm/slub.c
[...]
> @@ -2658,7 +2664,8 @@ static inline void *get_freelist(struct kmem_cache *s, struct page *page)
>   * already disabled (which is the case for bulk allocation).
>   */
>  static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
> -                         unsigned long addr, struct kmem_cache_cpu *c)
> +                         unsigned long addr, struct kmem_cache_cpu *c,
> +                         size_t orig_size)

orig_size is added as a new argument, but never used. (And if you
remove this argument, __slab_alloc will also not be using its
orig_size argument anymore.)



>  {
>         void *freelist;
>         struct page *page;
> @@ -2763,7 +2770,8 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>   * cpu changes by refetching the per cpu area pointer.
>   */
>  static void *__slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
> -                         unsigned long addr, struct kmem_cache_cpu *c)
> +                         unsigned long addr, struct kmem_cache_cpu *c,
> +                         size_t orig_size)
>  {
>         void *p;
>         unsigned long flags;
> @@ -2778,7 +2786,7 @@ static void *__slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>         c = this_cpu_ptr(s->cpu_slab);
>  #endif
>
> -       p = ___slab_alloc(s, gfpflags, node, addr, c);
> +       p = ___slab_alloc(s, gfpflags, node, addr, c, orig_size);
>         local_irq_restore(flags);
>         return p;
>  }
