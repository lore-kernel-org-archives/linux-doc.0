Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6FAC4363D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 14:19:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23DF3208B6
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 14:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WbL9t9/X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJBOTA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOTA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 10:19:00 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E57C0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 07:19:00 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id z26so1344035oih.12
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYH/6hO5lgQzTOW7dEpfFVSSkr8P55YhoTlw55xP13w=;
        b=WbL9t9/X+2+U5VeNgqJ2mzYEVs8LZ8q8hjggo7N19g1Jfbf7P1wkvnp8roJdVEw2lS
         c3i+9tyC5AUycxhnZX3RIt4oznfraSi/7+MhXAFF62q39I2RYcbTn5QT7+m9u2tkqg6l
         t8CPQiS4CwE3/je84zeBM5/j7j3lEb16Ugt2aIYvU40jH0TI0PR5J1CBlhaYuqhraQ9S
         VNH44ZU9nil0inzWBzSBsDd31QGBA5Yoy3hYBsIdwpYvq+FTYKKD014ZVWSBoeXqJDuA
         xB8WY3nYSYtoHgpNv87LMV6Wm9qhKizfdSBX5z2jHJgzn6f3UzGseSKEQmzLzzorHWIt
         HJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYH/6hO5lgQzTOW7dEpfFVSSkr8P55YhoTlw55xP13w=;
        b=VTz8hHvXFFYGm4E5D375eShcyepvIdXHxZnvA2nkFPZZ/whoZAtqo2Lxj8UcVmXopO
         L6vDcxQUWM1/l7erfDQk3ltAdlFh1tWSny1B0IsMkkFkHRCTHhhToW5qz3nAxH9ia7OI
         /wvaDXJljDNbr/W/NxT0M0zDICQgFOabypZMdBVCB3BeFLfSw9WxDqBg2r3DYFA9w8j9
         u9OCstCAWMkMzkh3nqRYJ385LnxyFF/66mgCq/Q4m8or+maU8VYinfwCuaPOLasqUj33
         MoiezwVHfxzTs9SXIE0CctCftfjT1Ia1b1mXRR3GGKw0LhUYy0PuA/R1xrzadddzDkR/
         nwKA==
X-Gm-Message-State: AOAM532jkUgPAQD6OXvgMKLE50iEzDlkrmvF24G1mcxFnlJ5CY6El6BB
        zL8wWKKDWU2IlvfcEEyHunaLGvzZfTcKytW2xbD/rw==
X-Google-Smtp-Source: ABdhPJw5Vk1wThTWQ6piVA0iJPsTuINRFUfh4+KEWMJ5Uik/MuAwN5wnmzE+TbLezcePV0M0IStZFxXkagfJnjRDzgc=
X-Received: by 2002:aca:3d07:: with SMTP id k7mr1392880oia.172.1601648339445;
 Fri, 02 Oct 2020 07:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com> <20200929133814.2834621-4-elver@google.com>
 <CAG48ez1VNQo2HZSDDxUqtM4w63MmQsDc4SH0xLw92E6vXaPWrg@mail.gmail.com>
In-Reply-To: <CAG48ez1VNQo2HZSDDxUqtM4w63MmQsDc4SH0xLw92E6vXaPWrg@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 2 Oct 2020 16:18:48 +0200
Message-ID: <CANpmjNMcdM2MSL5J6ewChovxZbe-rKncU4LekQiXwKoVY0xDnQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] arm64, kfence: enable KFENCE for ARM64
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
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Oct 2020 at 08:48, Jann Horn <jannh@google.com> wrote:
>
> On Tue, Sep 29, 2020 at 3:38 PM Marco Elver <elver@google.com> wrote:
> > Add architecture specific implementation details for KFENCE and enable
> > KFENCE for the arm64 architecture. In particular, this implements the
> > required interface in <asm/kfence.h>. Currently, the arm64 version does
> > not yet use a statically allocated memory pool, at the cost of a pointer
> > load for each is_kfence_address().
> [...]
> > diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
> [...]
> > +static inline bool arch_kfence_initialize_pool(void)
> > +{
> > +       const unsigned int num_pages = ilog2(roundup_pow_of_two(KFENCE_POOL_SIZE / PAGE_SIZE));
> > +       struct page *pages = alloc_pages(GFP_KERNEL, num_pages);
> > +
> > +       if (!pages)
> > +               return false;
> > +
> > +       __kfence_pool = page_address(pages);
> > +       return true;
> > +}
>
> If you're going to do "virt_to_page(meta->addr)->slab_cache = cache;"
> on these pages in kfence_guarded_alloc(), and pass them into kfree(),
> you'd better mark these pages as non-compound - something like
> alloc_pages_exact() or split_page() may help. Otherwise, I think when
> SLUB's kfree() does virt_to_head_page() right at the start, that will
> return a pointer to the first page of the entire __kfence_pool, and
> then when it loads page->slab_cache, it gets some random cache and
> stuff blows up. Kinda surprising that you haven't run into that during
> your testing, maybe I'm missing something...

I added a WARN_ON() check in kfence_initialize_pool() to check if our
pages are compound or not; they are not.

In slub.c, __GFP_COMP is passed to alloc_pages(), which causes them to
have a compound head I believe.

> Also, this kinda feels like it should be the "generic" version of
> arch_kfence_initialize_pool() and live in mm/kfence/core.c ?

Done for v5.

Thanks,
-- Marco
