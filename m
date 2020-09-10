Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D32C433E2
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 16:30:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3655920795
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 16:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7rj+8Qp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgIJQ3o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 12:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgIJQ16 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 12:27:58 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A93C0617BD
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 08:06:38 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e23so5612635otk.7
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2DiBsMVuHaQKweeTOQHLBykKJQg8tEScxOxVWMIr6f4=;
        b=d7rj+8QpSjUscxArZ7XYKcuFoi7B/GFxbmwxY/YeAJFpXkDE4GqonTwAilQRs3eHCr
         9wgqUUGp2M2uZqGrS8oyOuUHtC72NS+g+HPsaSoYo3tcxRVgrIlDea7prwP0aii0bjkR
         WJcgjPHMGb1+5uTKdiVpFY05RsxeiG/It4ZrCaBrC3jeXnxUb3JdE5uIwvrsGaNyS4x7
         Dq11bilXPZ9dpQgxS66wkRODkNr/rumXomg4AH7YlQffk8K2MBnEZSd4mbQm+F4nV39/
         Hyi0MLbwb0o8rTE3Z9b1JJf241U+CBVEHuof+AYwXeSrnN4RIb7n+OlXgrSBFjT/81j6
         ySxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DiBsMVuHaQKweeTOQHLBykKJQg8tEScxOxVWMIr6f4=;
        b=fVVIU7OHBYtJfLIYUONFZPOlWXX/W8Y6UIErNzoNTRIET2Ls3mdORrhqQNkkmP1lcF
         eVTTAam+CfRQlAYvOa20la7R+39DHKyqoWvG90Yo2HtWjbVGIGijzP4QH5V9ba6XUJPc
         yucrOtaztRnNFQ9XsJz3DjmSLv5LS7gQID0GfxEkHmcrSFxW/wyy9Ck0GHGvo/vqFmct
         U+VMjxs80uHbOAd2KkadG3h3qGi0wkAp4/s/SyIkS3hN2LH8m9vC9jrbyfsg7wMM9rhI
         u++XDxaVVfLVJ82DtNdW/sjt0HGZYAZb3y65/YcggBY7NappHnYZ95XC+D06v30slPHE
         kQaw==
X-Gm-Message-State: AOAM5315EKEMvjVex/07qiui5v4kA4+ES6FqJ22Bt2oKp+MJrV4/RXGq
        i3a0ypErfuQd8X9d5YLN6jqh6rD5WACW6d9CU3rHow==
X-Google-Smtp-Source: ABdhPJxdJ+UeiRt911/9A7d8J232d9N9212FdeXDAshArM9b5lcwP3AeLW4qnCw6pMgyGhpwo76X6VTJZQhXKQnltDA=
X-Received: by 2002:a9d:3da1:: with SMTP id l30mr4426034otc.233.1599750397232;
 Thu, 10 Sep 2020 08:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-2-elver@google.com>
 <CACT4Y+aBpeQYOWGrCoaJ=HAa0BsSekyL88kcLBTGwc--C+Ch0w@mail.gmail.com>
In-Reply-To: <CACT4Y+aBpeQYOWGrCoaJ=HAa0BsSekyL88kcLBTGwc--C+Ch0w@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 10 Sep 2020 17:06:25 +0200
Message-ID: <CANpmjNN7qAtnUmibwGJEnxd+UcjBM1WeocoLeW0SO24NW3SkVA@mail.gmail.com>
Subject: Re: [PATCH RFC 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Alexander Potapenko <glider@google.com>,
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

On Thu, 10 Sep 2020 at 16:58, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Sep 7, 2020 at 3:41 PM Marco Elver <elver@google.com> wrote:
> > +config KFENCE_NUM_OBJECTS
> > +       int "Number of guarded objects available"
> > +       default 255
> > +       range 1 65535
> > +       help
> > +         The number of guarded objects available. For each KFENCE object, 2
> > +         pages are required; with one containing the object and two adjacent
> > +         ones used as guard pages.
>
> Hi Marco,
>
> Wonder if you tested build/boot with KFENCE_NUM_OBJECTS=65535? Can a
> compiler create such a large object?

Indeed, I get a "ld: kernel image bigger than KERNEL_IMAGE_SIZE".
Let's lower it to something more reasonable.

The main reason to have the limit is to constrain random configs and
avoid the inevitable error reports.

> > +config KFENCE_FAULT_INJECTION
> > +       int "Fault injection for stress testing"
> > +       default 0
> > +       depends on EXPERT
> > +       help
> > +         The inverse probability with which to randomly protect KFENCE object
> > +         pages, resulting in spurious use-after-frees. The main purpose of
> > +         this option is to stress-test KFENCE with concurrent error reports
> > +         and allocations/frees. A value of 0 disables fault injection.
>
> I would name this differently. "FAULT_INJECTION" is already taken for
> a different thing, so it's a bit confusing.
> KFENCE_DEBUG_SOMETHING may be a better name.
> It would also be good to make it very clear in the short description
> that this is for testing of KFENCE itself. When I configure syzbot I
> routinely can't figure out if various DEBUG configs detect user
> errors, or enable additional unit tests, or something else.

Makes sense, we'll change the name.

> Maybe it should depend on DEBUG_KERNEL as well?

EXPERT selects DEBUG_KERNEL, so depending on DEBUG_KERNEL doesn't make sense.

> > +/*
> > + * Get the canary byte pattern for @addr. Use a pattern that varies based on the
> > + * lower 3 bits of the address, to detect memory corruptions with higher
> > + * probability, where similar constants are used.
> > + */
> > +#define KFENCE_CANARY_PATTERN(addr) ((u8)0xaa ^ (u8)((unsigned long)addr & 0x7))
>
> (addr) in macro body

Done for v2.

> > +       seq_con_printf(seq,
> > +                      "kfence-#%zd [0x" PTR_FMT "-0x" PTR_FMT
>
> PTR_FMT is only used in this file, should it be declared in report.c?

It's also used by the test.

> Please post example reports somewhere. It's hard to figure out all
> details of the reporting/formatting.

They can be seen in Documentation added later in the series (also
viewable here: https://github.com/google/kasan/blob/kfence/Documentation/dev-tools/kfence.rst)

Thank you!

-- Marco
