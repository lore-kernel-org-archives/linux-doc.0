Return-Path: <SRS0=J8tN=EK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A66C2D0A3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 14:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE04B223AB
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 14:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vzJv83fM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgKDOYB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgKDOYA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Nov 2020 09:24:00 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C326AC061A4A
        for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2020 06:24:00 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id m17so1042747oie.4
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2020 06:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QR9P889TV6Fm+64MkqBDR3Qv0vkmxXCe4guOWfntHO8=;
        b=vzJv83fMFFUoT2sV52CFQ+1ZEHCw68cWjSWuUVH5eM87Dicq8EfGtuZtTZZnbnaAHd
         7U0EYmLE55esvbCscgNLIbOVPeNLSOQTvjOroXj69HUW92jqyJkbmPrhHsOvH4gKQfqr
         xnvXn+jbNVB5r9AL2pWKbwZr5ceqx9Snrm05aofLik3QQ0gSiLpM/281wXcTWu7o1xdR
         9R38+RsoWIYIR5//fgjSO4b/T7cmef/6Zb3ZSGgE95rpUnmQ0GM/CfgfSMaptUlxnJZP
         jwV8jQl2lh3dyF7LLBY7dvF3y1VjeJGnQgoepgZ4VjW2kHPkdHySKARqwAoCVgICXGG8
         Gyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QR9P889TV6Fm+64MkqBDR3Qv0vkmxXCe4guOWfntHO8=;
        b=md0jeWhcjePuzrCxozTL0aGSXLbEPgrKSKwIZRUSzn2W/JDvkbuf9lJFMvJtL86fCf
         s4nxVSYFk4IkLw6YnecVTw/vRw8NrAYTsXQA41MUK1Ljl7y1dCaM3jh1bMCLkjTwRwyQ
         zvmWddreu7UsNYxumhSonc1uQgIshFIs3NaBKuYPK4Zzb4TCGRbrGZojXdDt67a+vZaK
         H51QvphSIa4VDt3RDU+vuLyRvBEUNhy4fcN7zG4fHRyERHrLVARsnL2fqmzE99qMGU2K
         0JOURuuCqqj2UaceZI1B3wbRq/HJ/k0GZs1qBlSG2GJy9gM6RqjIJtH5ZpXQxr/gyIcf
         Li3A==
X-Gm-Message-State: AOAM531OczcXgxvo3ouXl8sbHEJeSaz2SFczD578Hp1BFtXoDI+a81SC
        2YmNfL3/iZ7nc7mYpdgVgw4PCHHpT3dKJiMTSvoXiA==
X-Google-Smtp-Source: ABdhPJycEzgB3bjUR4k0OoZFNu8mEdpOh55snmkjf+FCx7MOcdw5evF2B/ftw0zmhNYGTBUFtEs+2BGfaFd8d5vP+lQ=
X-Received: by 2002:aca:a988:: with SMTP id s130mr2710278oie.172.1604499839884;
 Wed, 04 Nov 2020 06:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com> <20201103175841.3495947-4-elver@google.com>
 <20201104130111.GA7577@C02TD0UTHF1T.local>
In-Reply-To: <20201104130111.GA7577@C02TD0UTHF1T.local>
From:   Marco Elver <elver@google.com>
Date:   Wed, 4 Nov 2020 15:23:48 +0100
Message-ID: <CANpmjNNyY+Myv12P-iou80LhQ0aG5UFudLbVWmRBcM3V=G540A@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] arm64, kfence: enable KFENCE for ARM64
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
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
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
        Kees Cook <keescook@chromium.org>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 4 Nov 2020 at 14:06, Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, Nov 03, 2020 at 06:58:35PM +0100, Marco Elver wrote:
> > Add architecture specific implementation details for KFENCE and enable
> > KFENCE for the arm64 architecture. In particular, this implements the
> > required interface in <asm/kfence.h>.
> >
> > KFENCE requires that attributes for pages from its memory pool can
> > individually be set. Therefore, force the entire linear map to be mapped
> > at page granularity. Doing so may result in extra memory allocated for
> > page tables in case rodata=full is not set; however, currently
> > CONFIG_RODATA_FULL_DEFAULT_ENABLED=y is the default, and the common case
> > is therefore not affected by this change.
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Co-developed-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Thanks for dilligently handling all the review feedback. This looks good
> to me now, so FWIW:
>
> Reviewed-by: Mark Rutland <mark.rutland@arm.com>

Thank you!

> There is one thing that I thing we should improve as a subsequent
> cleanup, but I don't think that should block this as-is.
>
> > +#define KFENCE_SKIP_ARCH_FAULT_HANDLER "el1_sync"
>
> IIUC, the core kfence code is using this to figure out where to trace
> from when there's a fault taken on an access to a protected page.

Correct.

> It would be better if the arch code passed the exception's pt_regs into
> the kfence fault handler, and the kfence began the trace began from
> there. That would also allow for dumping the exception registers which
> can help with debugging (e.g. figuring out how the address was derived
> when it's calculated from multiple source registers). That would also be
> a bit more robust to changes in an architectures' exception handling
> code.

Good idea, thanks. I guess there's no reason to not want to always
skip to instruction_pointer(regs)?
In which case I can prepare a patch to make this change. If this
should go into a v8, please let me know. But it'd be easier as a
subsequent patch as you say, given it'll be easier to review and these
patches are in -mm now.

Thanks,
-- Marco
