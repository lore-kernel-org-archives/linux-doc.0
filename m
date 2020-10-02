Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8776C35257
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 21:12:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 636F1206DD
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 21:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6RsUyuM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgJBVM3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 17:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJBVM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 17:12:27 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC50C0613E2
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 14:12:25 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so3191010wrp.8
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VgFFQ0f1iW52kXzjz/2eKYH+NB9j2SKHy/BefzscIIA=;
        b=H6RsUyuMsUzVcr/+kvYSyOwzsOChdE0kvu6Kic2NrIyFojHpZ39HwKFG3lBzpNWc+c
         MI0T4RINppbj+mlzVYS7CSut3noKljtmYTqjyLElUR/WE3r8ZMvsh+6e6he4TUGxNVDx
         dw3FJJ9kQBmQmtx085+v3Yn6/E/4UucaSM1FwMM3Tnx2aHIF9gu3FFfOof5rFz+p6CPD
         8RbzUqeGYfmj92xMFrrleR5hkwrDTHGA4Hr5Eo6yc0a9ULGNnxFVR2uLJ4kuuA1/K9xy
         kSoA6Uklg4FX9ag0h/biwJZzgq1Mkfb2DpbrnIbfCj7NZzeHfmSqkVuLxDjxrEimwXwd
         RvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VgFFQ0f1iW52kXzjz/2eKYH+NB9j2SKHy/BefzscIIA=;
        b=lPbV6lvW6SydKeVCPtys5ZEzriPqh9heVaik3WzAcyNoH2ViSgFFQp2X/AIEUeywC/
         mMK7xmMX2hmUuaVWi+Kh+oQk2PBx7ESZUYYa7DQ8IszHiGmf8Dn0mbgvy506hN66oK7o
         iI6tgboleeuHss7rjzh+aAqK2pFYqMGWmN1OZbHFF9HNo4hmc87/9cW0cD0YuBnGA4Hz
         u6ARwwrdT9fINx+kG3V5xwuSJn4OjItc+N0EKHUy5h1VOmyJNiExRL+p4Or0IhpxHz1Q
         +j3szhO4rqoMarjR82pgMEEcGR/trDIslqJ0J7a7l4WX5Ky1yK1Nv7iWSizY65aDL9if
         z60Q==
X-Gm-Message-State: AOAM533tfRvFCflfppCiH+fONTp0/GUnmTzCWzjzXchHy428dCZrMwo5
        XzUpBbT4whx0D/5VO0jQ3yVOqw==
X-Google-Smtp-Source: ABdhPJwC3ZL9zwYlfCPnbS1M5tmu4XL3L5/2AnTd4LijmY8/zRM+9UG8Mii+DOYgFt3gc7Koyh6KvQ==
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr5049675wrk.108.1601673143625;
        Fri, 02 Oct 2020 14:12:23 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id m10sm3051130wmc.9.2020.10.02.14.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 14:12:22 -0700 (PDT)
Date:   Fri, 2 Oct 2020 23:12:16 +0200
From:   Marco Elver <elver@google.com>
To:     Jann Horn <jannh@google.com>
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
        Linux-MM <linux-mm@kvack.org>, SeongJae Park <sjpark@amazon.de>
Subject: Re: [PATCH v4 01/11] mm: add Kernel Electric-Fence infrastructure
Message-ID: <20201002211216.GA1108095@elver.google.com>
References: <20200929133814.2834621-1-elver@google.com>
 <20200929133814.2834621-2-elver@google.com>
 <CAG48ez3+_K6YXoXgKBkB8AMeSQj++Mxi5u2OT--B+mJgE7Cyfg@mail.gmail.com>
 <20201002171959.GA986344@elver.google.com>
 <CAG48ez0D1+hStZaDOigwbqNqFHJAJtXK+8Nadeuiu1Byv+xp5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez0D1+hStZaDOigwbqNqFHJAJtXK+8Nadeuiu1Byv+xp5A@mail.gmail.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 02, 2020 at 09:31PM +0200, Jann Horn wrote:
[...]
> > >
> > > If !CONFIG_HAVE_ARCH_KFENCE_STATIC_POOL, this should probably always
> > > return false if __kfence_pool is NULL, right?
> >
> > That's another check; we don't want to make this more expensive.
> 
> Ah, right, I missed that this is the one piece of KFENCE that is
> actually really hot code until Dmitry pointed that out.
> 
> But actually, can't you reduce how hot this is for SLUB by moving
> is_kfence_address() down into the freeing slowpath? At the moment you
> use it in slab_free_freelist_hook(), which is in the super-hot
> fastpath, but you should be able to at least move it down into
> __slab_free()...
> 
> Actually, you already have hooked into __slab_free(), so can't you
> just get rid of the check in the slab_free_freelist_hook()?
> 
> Also, you could do the NULL *after* the range check said "true". That
> way the NULL check would be on the slowpath and have basically no
> performance impact.

True; let's try to do that then, and hope the few extra instructions do
not hurt us.

> > This should never receive a NULL, given the places it's used from, which
> > should only be allocator internals where we already know we have a
> > non-NULL object. If it did receive a NULL, I think something else is
> > wrong. Or did we miss a place where it can legally receive a NULL?
> 
> Well... not exactly "legally", but e.g. a kernel NULL deref (landing
> in kfence_handle_page_fault()) might get weird.
> 
> [...]
> > > > +         access, use-after-free, and invalid-free errors. KFENCE is designed
> > > > +         to have negligible cost to permit enabling it in production
> > > > +         environments.
> > > [...]
> > > > diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> > > [...]
> > > > +module_param_named(sample_interval, kfence_sample_interval, ulong, 0600);
> > >
> > > This is a writable module parameter, but if the sample interval was 0
> > > or a very large value, changing this value at runtime won't actually
> > > change the effective interval because the work item will never get
> > > kicked off again, right?
> >
> > When KFENCE has been enabled, setting this to 0 actually reschedules the
> > work immediately; we do not disable KFENCE once it has been enabled.
> 
> Those are weird semantics. One value should IMO unambiguously mean one
> thing, independent of when it was set. In particular, I think that if
> someone decides to read the current value of kfence_sample_interval
> through sysfs, and sees the value "0", that should not ambiguously
> mean "either kfence triggers all the time or it is completely off".
> 
> If you don't want to support runtime disabling, can you maybe make the
> handler refuse to write 0 if kfence has already been initialized?

I could live with 0 being rejected; will change it. (I personally had
used piping 0 at runtime to stress test, but perhaps if it's only devs
doing it we can just change the code for debugging/testing.)

> [...]
> > > > +#endif
> > > [...]
> > > > +/* Freelist with available objects. */
> > > > +static struct list_head kfence_freelist = LIST_HEAD_INIT(kfence_freelist);
> > > > +static DEFINE_RAW_SPINLOCK(kfence_freelist_lock); /* Lock protecting freelist. */
> > > [...]
> > > > +/* Gates the allocation, ensuring only one succeeds in a given period. */
> > > > +static atomic_t allocation_gate = ATOMIC_INIT(1);
> > >
> > > I don't think you need to initialize this to anything?
> > > toggle_allocation_gate() will set it to zero before enabling the
> > > static key, so I don't think anyone will ever see this value.
> >
> > Sure. But does it hurt anyone? At least this way we don't need to think
> > about yet another state that only exists on initialization; who knows
> > what we'll change in future.
> 
> Well, no, it doesn't hurt. But I see this as equivalent to writing code like:
> 
> int ret = 0;
> ret = -EINVAL;
> if (...)
>   return ret;
> 
> where a write can never have any effect because a second write will
> clobber the value before it can be read, which is IMO an antipattern.

Agree fully ^

Just being defensive with global states that can potentially be read for
other purposes before toggle_allocation_gate(); I think elsewhere you
e.g. suggested to use allocation_gate for the IPI optimization. It's
these types of changes that depend on our global states, where making
the initial state non-special just saves us trouble.

> But it admittedly is less clear here, so if you like it better your
> way, I don't really have a problem with that.
[...]
> [...]
> > > > +{
> > > > +       unsigned long addr;
> > > > +
> > > > +       lockdep_assert_held(&meta->lock);
> > > > +
> > > > +       for (addr = ALIGN_DOWN(meta->addr, PAGE_SIZE); addr < meta->addr; addr++) {
> > > > +               if (!fn((u8 *)addr))
> > > > +                       break;
> > > > +       }
> > > > +
> > > > +       for (addr = meta->addr + meta->size; addr < PAGE_ALIGN(meta->addr); addr++) {
> > >
> > > Hmm... if the object is on the left side (meaning meta->addr is
> > > page-aligned) and the padding is on the right side, won't
> > > PAGE_ALIGN(meta->addr)==meta->addr , and therefore none of the padding
> > > will be checked?
> >
> > No, you're thinking of ALIGN_DOWN. PAGE_ALIGN gives us the next page.
> 
> Hm, really? Let me go through those macros...
> 
> 
> #define __AC(X,Y) (X##Y)
> #define _AC(X,Y) __AC(X,Y)
> #define PAGE_SHIFT 12
> #define PAGE_SIZE (_AC(1,UL) << PAGE_SHIFT)
> 
> so:
> PAGE_SIZE == (1UL << 12) == 0x1000UL
> 
> #define __ALIGN_KERNEL_MASK(x, mask) (((x) + (mask)) & ~(mask))
> #define __ALIGN_KERNEL(x, a) __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
> #define ALIGN(x, a) __ALIGN_KERNEL((x), (a))
> 
> so (omitting casts):
> ALIGN(x, a) == ((x + (a - 1)) & ~(a - 1))
> 
> #define PAGE_ALIGN(addr) ALIGN(addr, PAGE_SIZE)
> 
> so (omitting casts):
> PAGE_ALIGN(addr) == ((addr + (0x1000UL - 1)) & ~(0x1000UL - 1))
>   == ((addr + 0xfffUL) & 0xfffffffffffff000UL)
> 
> meaning that if we e.g. pass in 0x5000, we get:
> 
> PAGE_ALIGN(0x5000) == ((0x5000 + 0xfffUL) & 0xfffffffffffff000UL)
>  == 0x5fffUL & 0xfffffffffffff000UL == 0x5000UL
> 
> So if the object is on the left side (meaning meta->addr is
> page-aligned), we won't check padding.
> 
> 
> ALIGN_DOWN rounds down, while PAGE_ALIGN rounds up, but both leave the
> value as-is if it is already page-aligned.

Ah, yes, sorry about that; I confused myself with the comment above PAGE_ALIGN.

We'll fix this. And add a test. :-)

Thanks,
-- Marco
