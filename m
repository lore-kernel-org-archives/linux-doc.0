Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE7DC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 10:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D729221EB
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 10:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mCyFqjN1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgJ3Kuq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 06:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgJ3Kuq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 06:50:46 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E800CC0613CF
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 03:50:45 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id j7so6183238oie.12
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hvuWYo7Yuy4+Xoosva2YfT/B6vDa7o+k5TcZrFjzw2I=;
        b=mCyFqjN1bQQC8Hvkpi7xW/3dnxa3ThGOZg+0wqlUrAHvvhX8m/ncxpq7Pyp/dRRs3g
         4WEWXc3YTkQEmBo4hMY8pxvX5o+Gv/Ie9TXg7vKqqMwjs5D7KvUPpTYMZtWdx8246Vkw
         J6HR1GHDIFM02CVcqc8Kk+Y6oFzxFgYqMnr0GfrzLUtvoripkAXvu1boXzKL84jaqzZ0
         JLMFVm206/J5PjBOhMmilJ6+hEiScGTLGEKl7zMM1R9M2vfhOCCinAqTix2sr1UDctvr
         8/O6shRzAPdYkLPxVflRgSxCAY0CYhUvm76k9hSxcnPW4WCKFajDZSAKGSGrz5NSjsJN
         Ywlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hvuWYo7Yuy4+Xoosva2YfT/B6vDa7o+k5TcZrFjzw2I=;
        b=H+Z5Cy08M2v9Xmts4Qr3TH4B9qd7YbOBEg2+26G86Xggw7MBlWC3C8Z5aZKtXPWFrG
         mSmpS4hA9X5+yhsZfvM3sCG9ZHQ7Jh6QPcxB8IRRCcz6T15tYI5wucRuRasoZgNjLG1f
         /6erBdnNVN1RPe3hd+6ifIWg2cRD6RQqyhKDuWaDIMNq2zVmt0sj6uE1CAlED8tgiGlq
         KyV37Q/gO6ziIOvPbtxsrAgV+05ayhG1bUMCDIryFqzUtDb0ehjZG9bW3FUAwGcjPIfl
         81MoH287EDF0wLDRXrnVBSGqo6MYG6TUXBFMC6fB7mNc8GLhvBZhnKk3VvJYe9tVAjN4
         vdqA==
X-Gm-Message-State: AOAM531/dmeRANm81LgtA+zloHnjT8Ah7b5Ti6p1ms/sNmDyNTrtq8+g
        bVIDC/bSxLpW1UmS4Ftx+HIGvXtWezzZBnoFeOuTMw==
X-Google-Smtp-Source: ABdhPJw9y4ECaTHMdQAHz0FiGUzAKJL50sOGurP0au+ieUbVtdZIpyIHjQtwwPIJDX0B/6q9TBKmmH52j9NmaIeqdOQ=
X-Received: by 2002:aca:4f55:: with SMTP id d82mr1138528oib.172.1604055045058;
 Fri, 30 Oct 2020 03:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-9-elver@google.com>
 <CAG48ez071wf5kvBwpmRk9QiSDzDDN7zh17zEcZjPDWKUjbqosA@mail.gmail.com>
In-Reply-To: <CAG48ez071wf5kvBwpmRk9QiSDzDDN7zh17zEcZjPDWKUjbqosA@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 30 Oct 2020 11:50:32 +0100
Message-ID: <CANpmjNPDksUk1BLS9BuYrx4E3Lf+m2jWXn0yn7zO43c9PboAmw@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] kfence: add test suite
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
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
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

On Fri, 30 Oct 2020 at 03:50, Jann Horn <jannh@google.com> wrote:
>
> On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> > Add KFENCE test suite, testing various error detection scenarios. Makes
> > use of KUnit for test organization. Since KFENCE's interface to obtain
> > error reports is via the console, the test verifies that KFENCE outputs
> > expected reports to the console.
> [...]
> > diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
> [...]
> > +static void *test_alloc(struct kunit *test, size_t size, gfp_t gfp, enum allocation_policy policy)
> > +{
> > +       void *alloc;
> > +       unsigned long timeout, resched_after;
> [...]
> > +       /*
> > +        * 100x the sample interval should be more than enough to ensure we get
> > +        * a KFENCE allocation eventually.
> > +        */
> > +       timeout = jiffies + msecs_to_jiffies(100 * CONFIG_KFENCE_SAMPLE_INTERVAL);
> > +       /*
> > +        * Especially for non-preemption kernels, ensure the allocation-gate
> > +        * timer has time to catch up.
> > +        */
> > +       resched_after = jiffies + msecs_to_jiffies(CONFIG_KFENCE_SAMPLE_INTERVAL);
> > +       do {
> [...]
> > +               if (time_after(jiffies, resched_after))
> > +                       cond_resched();
>
> You probably meant to recalculate resched_after after the call to
> cond_resched()?

This is intentional. After @resched_after is reached, every failed
allocation attempt will result in a cond_resched(), because we know
the sample interval has elapsed and KFENCE should have kicked in. So
we just want to ensure the delayed work gets to run as soon as
possible, and just keep yielding.

Added a clarifying comment.

> > +       } while (time_before(jiffies, timeout));
> > +
> > +       KUNIT_ASSERT_TRUE_MSG(test, false, "failed to allocate from KFENCE");
> > +       return NULL; /* Unreachable. */
> > +}
> [...]
> > +/*
> > + * KFENCE is unable to detect an OOB if the allocation's alignment requirements
> > + * leave a gap between the object and the guard page. Specifically, an
> > + * allocation of e.g. 73 bytes is aligned on 8 and 128 bytes for SLUB or SLAB
> > + * respectively. Therefore it is impossible for the allocated object to adhere
> > + * to either of the page boundaries.
>
> Should this be "to the left page boundary" instead of "to either of
> the page boundaries"?

Thanks for spotting. I think it's "Therefore it is impossible for the
allocated object to contiguously line up with the right guard page."

> > + * However, we test that an access to memory beyond the gap result in KFENCE
>
> *results
>
>
>
> > + * detecting an OOB access.
> > + */
> > +static void test_kmalloc_aligned_oob_read(struct kunit *test)

Thanks, will address these for v7.
