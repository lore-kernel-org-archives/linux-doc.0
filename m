Return-Path: <SRS0=2AiA=CU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AB6C43461
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 17:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD4F4221E7
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 17:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T96RFKKM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgIKRUk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Sep 2020 13:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgIKNBU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Sep 2020 09:01:20 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796AFC061756
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 06:01:07 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g10so8235492otq.9
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ge/FjJXhyj8+NsSSsvCMLGtUiAk37fA1+cTelebZ4Go=;
        b=T96RFKKMbfGXmGKQW/wQkQusFFYQX5igqwU6L75Yeso5+r11VBgv0lztFH9rNbHlY3
         5B0LrTTcrBZveyQWzWcwQCKeRcyEas+n8CGz3zVLjk3BHBmngz6iniRoFzLHyeCEKgD0
         SfihZ41/sKpTvQWRFJLJgc9OiULTEBppsdBLOZxSHyOPU/g9QcvvDXQh4dY//h83F68D
         ESzkFo2LP1uYXPiZlMAQQce8uhNDJFIRPkcEU8JQ+J90kOfx32MrFwTnj/mS1FW0RD1e
         qGrx8cYDqjBlz9uoLUveNlE+9hLQk8moh/ndBUm2Yp5Ev3Kn7jiVpo/Fnwdz/WXss1W+
         TXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ge/FjJXhyj8+NsSSsvCMLGtUiAk37fA1+cTelebZ4Go=;
        b=uYUe4z9uMfMBjLSsqgvV3iM6gCud8VSsnuARHnLMci+6H+KGadAFfyZUeJ0xTHzT5s
         ktpCFgxsCchzY9Mn0dIl8Aom8DKSIE8OV3SaRw1xqAT9WX/X/GIwmZP2f5W/mxT2+tGU
         Aiu/n2wD/OJPsrpUyWETrowMDSldnU2+c/8nWwtYMcSTWLUo6yKBEqXGYrOPS8OuMAPn
         D5Ea+oDZEjtNQjsk/9TSbZwxclUw1aqJbI1KoD2yRZq1sStB1z1q/NR9u+8ODRAYSZHa
         2TtcN1hxfL295gcErWhb977q4zleoxBa6WLNCaBjkRHWmYJffw/Lrv2Ax0jaCC96h+nn
         xcNw==
X-Gm-Message-State: AOAM530pxu/bX7NCwN/Np+wgfKFX+y48MsrsdZTPcXZP7Ubptc/bM2oA
        yDXeLE1PpbugNMV6yhIBQdzXAaqfX853+TrvA605AQ==
X-Google-Smtp-Source: ABdhPJyvnEkxpzeJQj2l5oqacEmEr9jCCxehUw6cPnNOvxF93kxRylc4qW/tdBx2vsUZCsc/aeHXDTxenucOjpbTbWU=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr1038835otk.251.1599829266141;
 Fri, 11 Sep 2020 06:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-7-elver@google.com>
 <CACT4Y+b=Ph-fD_K5F_TNMp_dTNjD7GXGT=OXogrKc_HwH+HHwQ@mail.gmail.com>
In-Reply-To: <CACT4Y+b=Ph-fD_K5F_TNMp_dTNjD7GXGT=OXogrKc_HwH+HHwQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 11 Sep 2020 15:00:54 +0200
Message-ID: <CANpmjNMHHWjdLiWi+vhffcWq=UNFVGV7so6AggezcvnoOFHvKA@mail.gmail.com>
Subject: Re: [PATCH RFC 06/10] kfence, kasan: make KFENCE compatible with KASAN
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

On Fri, 11 Sep 2020 at 09:05, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Sep 7, 2020 at 3:41 PM Marco Elver <elver@google.com> wrote:
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
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > ---
> >  lib/Kconfig.kfence | 2 +-
> >  mm/kasan/common.c  | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> > index 7ac91162edb0..b080e49e15d4 100644
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
>
> Is this needed?
> At least in the slab patch I see that we do :
>
> if (kfence_free(objp)) {
>   kmemleak_free_recursive(objp, cachep->flags);
>   return;
> }
>
> before:
>
> /* Put the object into the quarantine, don't touch it for now. */ /*
> Put the object into the quarantine, don't touch it for now. */
> if (kasan_slab_free(cachep, objp, _RET_IP_)) if
> (kasan_slab_free(cachep, objp, _RET_IP_))
>   return; return;
>
>
> If it's not supposed to be triggered, it can make sense to replace
> with BUG/WARN.

It is required for SLUB. For SLAB, it seems it might not be necessary.
Making the check in kasan/common.c conditional on the allocator seems
ugly, so I propose we keep it there.

Thanks,
-- Marco
