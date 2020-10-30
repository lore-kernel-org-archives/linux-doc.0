Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362CFC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 13:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6E3A22210
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 13:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EcnjjxiP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgJ3NAX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 09:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3NAX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 09:00:23 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7677C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 06:00:22 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m22so5460047ots.4
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fvLoA2ACGsw9h6fUs2eRqYp5Vxv5mvJOqpZ7bS2dDQ=;
        b=EcnjjxiP6NX5FOHbnvNYmhlYHqWJtONYAPuq8+BRYNiuIp2YO2/sOS9Osbx/2Z8fds
         cavi4AMu92psgd64iFC5tpy/7TL45oFgxjicTtltEsKFVUt6JXV7p81kQyb3ejUqk/EZ
         BlY3uE1nOqTBTw7LncwS2dhHg3Wxa2kxCH5MYvtBdvp2960pONdBmb/43b2Jd5fu6jCL
         PI2m8wzHjpVcycrn2PKUUwJ4Jv4DGkEDw+gaz8pqzhGls/nj8/37bYUnvxGLUdJWy4Hl
         PEqSbyNGilparldS8VWKLveX96xtr9BDYwGalBxqK2owNxr2aqbxS0yZ5FG4yrq3UV7S
         AaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fvLoA2ACGsw9h6fUs2eRqYp5Vxv5mvJOqpZ7bS2dDQ=;
        b=V+QliHJUa+Dg5P2lYFTgu039Wolhz/qsWtU58Sb1UHUDMYm70NFOvPbV6svSdexn8E
         ax00wAKUmgLndOQuTbcjvFsDfSfORMiZYkBsZwGXJyT+PsTNPdu1BpZU0CjeyDa5eA3O
         HRbkVl3dGhRQH2JnhBWX9MZ/DWgpq68Qk07ZqdA3uT3Zp8Q7nNDY0itJSjpUg8mBQzJk
         Yd5/EKppOE9Ue6GkpwDeeQYcv2tudtMPxjYcqPB6LK7EkWco51BtxxcQOv6u7MuxlLgD
         3W9NEJmuQmhBiSEJ1m5K5lAbPf1lb0+emTC782QjGb7iQT8tdVtH0uagppcjgwcXbvSU
         lUsw==
X-Gm-Message-State: AOAM533dsej/uglQN6J+UZuko8ZKLBSdvcn/AJ0g77rFH4wum1LL+V5C
        kZEZe3227dczaha+qZsIITX9JWw/10SqUQcQMabXDg==
X-Google-Smtp-Source: ABdhPJxj4Rs5DNTy+vw/V05OM5YDz/tZETESyDNcoLpIRJD7NMZYysv3LfHiHlF2FEKmKL84lRszy3dIgD1ASah43lM=
X-Received: by 2002:a9d:34d:: with SMTP id 71mr1421371otv.251.1604062821578;
 Fri, 30 Oct 2020 06:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-3-elver@google.com>
 <CAG48ez1n7FrRA8Djq5685KcUJp1YgW0qijtBYNm2c9ZqQ1M4rw@mail.gmail.com>
In-Reply-To: <CAG48ez1n7FrRA8Djq5685KcUJp1YgW0qijtBYNm2c9ZqQ1M4rw@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 30 Oct 2020 14:00:09 +0100
Message-ID: <CANpmjNNBoiL2=JDD=vC5dB_TPW1Ybe5k7SqqhvUE2B7GmzRLyg@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] x86, kfence: enable KFENCE for x86
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

On Fri, 30 Oct 2020 at 03:49, Jann Horn <jannh@google.com> wrote:
> On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> > Add architecture specific implementation details for KFENCE and enable
> > KFENCE for the x86 architecture. In particular, this implements the
> > required interface in <asm/kfence.h> for setting up the pool and
> > providing helper functions for protecting and unprotecting pages.
> >
> > For x86, we need to ensure that the pool uses 4K pages, which is done
> > using the set_memory_4k() helper function.
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> [...]
> > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> [...]
> > @@ -725,6 +726,9 @@ no_context(struct pt_regs *regs, unsigned long error_code,
> >         if (IS_ENABLED(CONFIG_EFI))
> >                 efi_recover_from_page_fault(address);
> >
> > +       if (kfence_handle_page_fault(address))
> > +               return;
>
> We can also get to this point due to an attempt to execute a data
> page. That's very unlikely (given that the same thing would also crash
> if you tried to do it with normal heap memory, and KFENCE allocations
> are extremely rare); but we might want to try to avoid handling such
> faults as KFENCE faults, since KFENCE will assume that it has resolved
> the fault and retry execution of the faulting instruction. Once kernel
> protection keys are introduced, those might cause the same kind of
> trouble.
>
> So we might want to gate this on a check like "if ((error_code &
> X86_PF_PROT) == 0)" (meaning "only handle the fault if the fault was
> caused by no page being present", see enum x86_pf_error_code).

Good point. Will fix in v7.

> Unrelated sidenote: Since we're hooking after exception fixup
> handling, the debug-only KFENCE_STRESS_TEST_FAULTS can probably still
> cause some behavioral differences through spurious faults in places
> like copy_user_enhanced_fast_string (where the exception table entries
> are used even if the *kernel* pointer, not the user pointer, causes a
> fault). But since KFENCE_STRESS_TEST_FAULTS is exclusively for KFENCE
> development, the difference might not matter. And ordering them the
> other way around definitely isn't possible, because the kernel relies
> on being able to fixup OOB reads. So there probably isn't really
> anything we can do better here; it's just something to keep in mind.
> Maybe you can add a little warning to the help text for that Kconfig
> entry that warns people about this?

Thanks for pointing it out, but that option really is *only* to stress
kfence with concurrent allocations/frees/page faults. If anybody
enables this option for anything other than testing kfence, it's their
own fault. ;-)
I'll try to add a generic note to the Kconfig entry, but what you
mention here seems quite x86-specific.

Thanks,
-- Marco
