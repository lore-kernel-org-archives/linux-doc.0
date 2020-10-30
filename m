Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F8C00A89
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D9A820756
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Msw/AdRy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgJ3PUA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgJ3PUA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 11:20:00 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF498C0613D5
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:19:46 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 9so6991027oir.5
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Od+UUSBMiEqFH2KlwfDgZow7v7NLfac8lHnjw8U4wHg=;
        b=Msw/AdRyc5nqCZQjTL62/j3DAPrGVm/qwHs2dRbaIBJuK+/frX27C5rJQ5k8W7I6Qs
         9j3/TqOiiYCnARGKa24Ac1lPztggkK0h9SNklfhqqPpwK8pONUpeHNAkYCM/hc/EOYpB
         bARGijsJ2eUveDGExQ3R7cb2KJ8RziSFXX6qMQdIkXAzsgEC/f6PCmc/SvBqaey74nnX
         ZoBLFHoiotr3hOSMqn2LTxiAYctu58P9xSQBTsHQ3DJhc9XIEwO7m7myKRHD29rrE8K9
         UyqdV7np7wugfiefBYXEG4dXmZcekmzP69/zLUhSANWfnmABr8xzI3guqJw9TvQJcurB
         r14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Od+UUSBMiEqFH2KlwfDgZow7v7NLfac8lHnjw8U4wHg=;
        b=hkuz2vQKkkaDjnyBd3DOpJy4A4JIuUT+Gm06/UHSwYkXW2TL4ftENBo90caiRlmhTQ
         ziuqRhGoDDAkE3o/USdMXjEaibOYWCocqJRum9rNKSF6lLhOqYm5r8/2TCyFr5qYJEv3
         UARU/rGcm/6hjuEHTDOqAFhtU5A0lWuJ+A8Aatfx56DZi6IT/VxWTQj9WWYbJHdcn5L+
         M7i7aqISoNt5HWVJIvUrEj2f6u5U5hYJn+Hf5XZTT5tezWl8KIVXG58ZM+00QNnv0Itm
         vmuctIi0aDTiFUKJWADoy3IfNam3yJ7joUHC5BnYVz6Zo77Ny1MnAk/uflmzJlWxmu++
         tGfg==
X-Gm-Message-State: AOAM533SJltnEupdpX/Tjq7jjgjVgCAkAaynIgSTdIG0OSEEMwH0kdcb
        wBHYTkw3wQvpEnq5HcqckyaUufHKl++P9mocrkMNaQ==
X-Google-Smtp-Source: ABdhPJwaDMBPSAvV/BhwOTbOOrTIc57OvUTldHxUnQO/NP/hqPklvwPxyUHr9DEfl0srWqfr3ZmYyytpffNXWuRPHTA=
X-Received: by 2002:aca:4f55:: with SMTP id d82mr1984254oib.172.1604071185897;
 Fri, 30 Oct 2020 08:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-7-elver@google.com>
 <CAG48ez0N5iKCmg-JEwZ2oKw3zUA=5EdsL0CMi6biwLbtqFXqCA@mail.gmail.com>
 <CANpmjNONPovgW6d4srQNQ-S-tiYCSxot7fmh=HDOdcRwO32z6A@mail.gmail.com> <CAG48ez30tzadrtJm_ShY8oGjnYpf3GDfcajm7S0xX6UxfTCQZw@mail.gmail.com>
In-Reply-To: <CAG48ez30tzadrtJm_ShY8oGjnYpf3GDfcajm7S0xX6UxfTCQZw@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 30 Oct 2020 16:19:34 +0100
Message-ID: <CANpmjNPoQkWuV0q3atamrAzyOxR9ZTpY43Ndg5+ko0KJhYt9sA@mail.gmail.com>
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

On Fri, 30 Oct 2020 at 16:09, Jann Horn <jannh@google.com> wrote:
>
> On Fri, Oct 30, 2020 at 2:46 PM Marco Elver <elver@google.com> wrote:
> > On Fri, 30 Oct 2020 at 03:50, Jann Horn <jannh@google.com> wrote:
> > > On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> > > > We make KFENCE compatible with KASAN for testing KFENCE itself. In
> > > > particular, KASAN helps to catch any potential corruptions to KFENCE
> > > > state, or other corruptions that may be a result of freepointer
> > > > corruptions in the main allocators.
> > > >
> > > > To indicate that the combination of the two is generally discouraged,
> > > > CONFIG_EXPERT=y should be set. It also gives us the nice property that
> > > > KFENCE will be build-tested by allyesconfig builds.
> > > >
> > > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > > Co-developed-by: Marco Elver <elver@google.com>
> > > > Signed-off-by: Marco Elver <elver@google.com>
> > > > Signed-off-by: Alexander Potapenko <glider@google.com>
> > >
> > > Reviewed-by: Jann Horn <jannh@google.com>
> >
> > Thanks!
> >
> > > with one nit:
> > >
> > > [...]
> > > > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > > [...]
> > > > @@ -141,6 +142,14 @@ void kasan_unpoison_shadow(const void *address, size_t size)
> > > >          */
> > > >         address = reset_tag(address);
> > > >
> > > > +       /*
> > > > +        * We may be called from SL*B internals, such as ksize(): with a size
> > > > +        * not a multiple of machine-word size, avoid poisoning the invalid
> > > > +        * portion of the word for KFENCE memory.
> > > > +        */
> > > > +       if (is_kfence_address(address))
> > > > +               return;
> > >
> > > It might be helpful if you could add a comment that explains that
> > > kasan_poison_object_data() does not need a similar guard because
> > > kasan_poison_object_data() is always paired with
> > > kasan_unpoison_object_data() - that threw me off a bit at first.
> >
> > Well, KFENCE objects should never be poisoned/unpoisoned because the
> > kasan_alloc and free hooks have a kfence guard, and none of the code
> > in sl*b.c that does kasan_{poison,unpoison}_object_data() should be
> > executed for KFENCE objects.
> >
> > But I just noticed that kernel/scs.c seems to kasan_poison and
> > unpoison objects, and keeps them poisoned for most of the object
> > lifetime.
>
> FWIW, I wouldn't be surprised if other parts of the kernel also ended
> up wanting to have in-object redzones eventually - e.g. inside skb
> buffers, which have a struct skb_shared_info at the end. AFAIU at the
> moment, KASAN can't catch small OOB accesses from these buffers
> because of the following structure.

Sure, and it might also become more interesting with MTE-based KASAN.

But, currently we recommend not to enable generic KASAN+KFENCE,
because it'd be redundant if the instrumentation price for generic (or
SW-tag) KASAN is already paid. The changes here are also mostly for
testing KFENCE itself.

That may change with MTE-based KASAN, however, which may have modes
where stack traces aren't collected and having KFENCE to get
actionable debug-info across a fleet of machines may still be wanted.
But that story is still evolving. The code here is only for the
generic and SW-tag based KASAN modes, and MTE will have its own
kasan_{un,}poison_shadow (afaik it's being renamed to
kasan_{un,}poison_memory) which works just fine with KFENCE AFAIK.

> > I think we better add a kfence guard to
> > kasan_poison_shadow() as well.
>
> Sounds good.
