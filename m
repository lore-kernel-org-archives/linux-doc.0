Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84152C55178
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E34D22242
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GJxiwN9x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgJ3PJZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgJ3PJZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 11:09:25 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05161C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:09:25 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l28so8269826lfp.10
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mk8TOBtLAUSh5UUmmftefVTpJAKNzTPUbZbR4xmTmm4=;
        b=GJxiwN9xabxRUEX1wI54H5lalSd1TYmvurtYqc/M2fA6V8U33bHNZ9KUnm+NrEFIZC
         Qrvcf8Oz1kmgZNU8G9hQ+3LL+ggO/PwDnFadE0BF68AW4sCZ0neyXtjFVi1hvLP2jw7o
         +tMXm8/POQ6ky6KAGphB5Uqn9dvqIRhiRBJegWSiGd9F0gAwKolszqsF6awnzU/IOT89
         CBp89samOLM2uSJ4eB+cN7lZ/Hqu00LAQlRIY8YNBjayjS3ZLFFpVYVGo12j6uLwDEpR
         lWIWKskV5OFyjvLzv+TFVnFJOmKD/NODIpy3k5jGGi34kLl4uTFGiR9+v0q/Kqcx+q0W
         QaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mk8TOBtLAUSh5UUmmftefVTpJAKNzTPUbZbR4xmTmm4=;
        b=Lb11O30BlsOSgyfm+CzNc6drBoeinoKDYlWoZ7YOQiLo6hPMhNlbYlS5XZGlQa5YwR
         OpUaZUwJYJojCtn4X1WXZszTD+lED+cFe8ipMexYT+xPOnbivLYca3r3jzF+6zoudIiU
         vzQ0y14GCux52R7AZULJ7MKAgCcIcZL5q517EXRajgEvI7d0qKcBLacjoLthOEBpFuZa
         eAgQQ2FY+LIFbK2rU3w0k4sorhDGX725x9q+RKrH/4YppXt0S38RZEGA7DWYlF3M4TlJ
         rp1xvwrQRDCgufSCNcVxOc1X0bIL7vW2sqJwEeqDH9FL5o/83iTTxSwHnM5SPQi8SmWi
         yiTw==
X-Gm-Message-State: AOAM530MQdyW727B626TrH+eNTq/WyHN3FnkhEl6NQJT3T3OroeFmhCX
        gzw1Ply0qJ3OR/kAbqXWsMaSroQL0hvhJsZNRU0JmA==
X-Google-Smtp-Source: ABdhPJwFpY6gAtBTRZBpckeKfkvLswlZHFXWkaX0WYhbn78B0G6kn/sPe6PzVY5TSbxBhNY24ss2alpqvzB69CmY910=
X-Received: by 2002:a05:6512:1182:: with SMTP id g2mr1077748lfr.198.1604070563207;
 Fri, 30 Oct 2020 08:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-7-elver@google.com>
 <CAG48ez0N5iKCmg-JEwZ2oKw3zUA=5EdsL0CMi6biwLbtqFXqCA@mail.gmail.com> <CANpmjNONPovgW6d4srQNQ-S-tiYCSxot7fmh=HDOdcRwO32z6A@mail.gmail.com>
In-Reply-To: <CANpmjNONPovgW6d4srQNQ-S-tiYCSxot7fmh=HDOdcRwO32z6A@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 16:08:56 +0100
Message-ID: <CAG48ez30tzadrtJm_ShY8oGjnYpf3GDfcajm7S0xX6UxfTCQZw@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] kfence, kasan: make KFENCE compatible with KASAN
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

On Fri, Oct 30, 2020 at 2:46 PM Marco Elver <elver@google.com> wrote:
> On Fri, 30 Oct 2020 at 03:50, Jann Horn <jannh@google.com> wrote:
> > On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> > > We make KFENCE compatible with KASAN for testing KFENCE itself. In
> > > particular, KASAN helps to catch any potential corruptions to KFENCE
> > > state, or other corruptions that may be a result of freepointer
> > > corruptions in the main allocators.
> > >
> > > To indicate that the combination of the two is generally discouraged,
> > > CONFIG_EXPERT=y should be set. It also gives us the nice property that
> > > KFENCE will be build-tested by allyesconfig builds.
> > >
> > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > Co-developed-by: Marco Elver <elver@google.com>
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> >
> > Reviewed-by: Jann Horn <jannh@google.com>
>
> Thanks!
>
> > with one nit:
> >
> > [...]
> > > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > [...]
> > > @@ -141,6 +142,14 @@ void kasan_unpoison_shadow(const void *address, size_t size)
> > >          */
> > >         address = reset_tag(address);
> > >
> > > +       /*
> > > +        * We may be called from SL*B internals, such as ksize(): with a size
> > > +        * not a multiple of machine-word size, avoid poisoning the invalid
> > > +        * portion of the word for KFENCE memory.
> > > +        */
> > > +       if (is_kfence_address(address))
> > > +               return;
> >
> > It might be helpful if you could add a comment that explains that
> > kasan_poison_object_data() does not need a similar guard because
> > kasan_poison_object_data() is always paired with
> > kasan_unpoison_object_data() - that threw me off a bit at first.
>
> Well, KFENCE objects should never be poisoned/unpoisoned because the
> kasan_alloc and free hooks have a kfence guard, and none of the code
> in sl*b.c that does kasan_{poison,unpoison}_object_data() should be
> executed for KFENCE objects.
>
> But I just noticed that kernel/scs.c seems to kasan_poison and
> unpoison objects, and keeps them poisoned for most of the object
> lifetime.

FWIW, I wouldn't be surprised if other parts of the kernel also ended
up wanting to have in-object redzones eventually - e.g. inside skb
buffers, which have a struct skb_shared_info at the end. AFAIU at the
moment, KASAN can't catch small OOB accesses from these buffers
because of the following structure.

> I think we better add a kfence guard to
> kasan_poison_shadow() as well.

Sounds good.
