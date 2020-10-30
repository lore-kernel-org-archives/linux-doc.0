Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3F8C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 13:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD222206CB
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 13:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ADogkMye"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgJ3NrB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 09:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgJ3NrA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 09:47:00 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C276C0613D2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 06:46:53 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id s21so6738649oij.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L9KsQ649Ydk+F62S7OnKir8xMXm76fswU9q4GRYaxwA=;
        b=ADogkMyeqzMi65mLW89eeqxIGlmWBYfTZ3bx3nTmGY2wkQ6ew8sNjqD3uCULVKqUBx
         onwBT2ZjgdJeC+Ep0EzvoTvRnAW+7Iiyz/5yg7sD3QireG2CCRHS4HyyFb0a9sVm4Gkx
         oK82pyK24ABm86duxNdYoH4hRNUNuqmxLkaaFdx57gQBJ1bVnIgROlYmlYkkJWUifom+
         jVyfyKxvVyc1QRuPHf7ZI42FxPpsi/MDAFg5vR+O2aNlLtDCXRhTiwTAI53bIKW7tEOt
         sxaK6rXBYliu3y15wi8dcdrb3eape6+JDJFEJWvX3eZs2nbse3syqEqt/L1LVuSMUunF
         HVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9KsQ649Ydk+F62S7OnKir8xMXm76fswU9q4GRYaxwA=;
        b=o4W7HEoYb0DGtV7JsjUGRIIlu6qwUBfI8zju4R3z1yVAPCxt+iNkc3/P4QNMHRQPvz
         lspE8h0zm0rBOxgUP0XPLirTJYun7GVPc6ncJoWSqwslPFWHeggd4s9sVPHg2OP1vqOX
         09dE6Ae0rrrFsZwdJgiyU8lNK+hjsfZM2TkEwGHcjJjmlzipoczHRzDA0bLAb6o/Qvwz
         9O6bg2ayOXhfYBRV+oQlVQfmlApFbBsmwhlkY5QkjCTNrtr3la5H/XsqNOVI5jC4nI0g
         TAiwJ+/7Wr5XBkVsL5QhIvXK77JY6HTc77xfQGRiVVHuuEuvAxx5pyKcySBfCaEc05Xj
         liPw==
X-Gm-Message-State: AOAM533ukAkmcS1c2xV16U6CCMwaeHLmQ7m/2kuGZpXlYQJ/KEP7q8bH
        nfhj6hOzkcGIZJVNZF5RZUBnL4NFFzwJQWlHS0Ph/w==
X-Google-Smtp-Source: ABdhPJxtllrD/ti+v3NOGXiV4JmOCXFOuYxncPEQf23c9uErySYb6wPEvDGJEVT3VNX7Kda0gfhJ/kKTgntzgs7XD78=
X-Received: by 2002:a54:4812:: with SMTP id j18mr1740133oij.70.1604065612340;
 Fri, 30 Oct 2020 06:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-7-elver@google.com>
 <CAG48ez0N5iKCmg-JEwZ2oKw3zUA=5EdsL0CMi6biwLbtqFXqCA@mail.gmail.com>
In-Reply-To: <CAG48ez0N5iKCmg-JEwZ2oKw3zUA=5EdsL0CMi6biwLbtqFXqCA@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 30 Oct 2020 14:46:40 +0100
Message-ID: <CANpmjNONPovgW6d4srQNQ-S-tiYCSxot7fmh=HDOdcRwO32z6A@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] kfence, kasan: make KFENCE compatible with KASAN
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
>
> Reviewed-by: Jann Horn <jannh@google.com>

Thanks!

> with one nit:
>
> [...]
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> [...]
> > @@ -141,6 +142,14 @@ void kasan_unpoison_shadow(const void *address, size_t size)
> >          */
> >         address = reset_tag(address);
> >
> > +       /*
> > +        * We may be called from SL*B internals, such as ksize(): with a size
> > +        * not a multiple of machine-word size, avoid poisoning the invalid
> > +        * portion of the word for KFENCE memory.
> > +        */
> > +       if (is_kfence_address(address))
> > +               return;
>
> It might be helpful if you could add a comment that explains that
> kasan_poison_object_data() does not need a similar guard because
> kasan_poison_object_data() is always paired with
> kasan_unpoison_object_data() - that threw me off a bit at first.

Well, KFENCE objects should never be poisoned/unpoisoned because the
kasan_alloc and free hooks have a kfence guard, and none of the code
in sl*b.c that does kasan_{poison,unpoison}_object_data() should be
executed for KFENCE objects.

But I just noticed that kernel/scs.c seems to kasan_poison and
unpoison objects, and keeps them poisoned for most of the object
lifetime. I think we better add a kfence guard to
kasan_poison_shadow() as well.

Thanks,
-- Marco
