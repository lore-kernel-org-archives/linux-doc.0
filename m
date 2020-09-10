Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB806C2D0E1
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 20:53:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75DC0214F1
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 20:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uBOlTGMa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgIJUwe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 16:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730853AbgIJO6V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 10:58:21 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546D4C061756
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 07:58:08 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e7so5029376qtj.11
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psWYZztgZCmOanZbN0KVSKVg8aC+fzD9jcmxhuC+NNI=;
        b=uBOlTGMa94CWWF6b+8C6NaJQaNcmte0pvB20fB/uVnBUUG8bvWgUMpgmpjaAvmfxr7
         AOtJ+KbVmezhukeZRCHFU6HqC8v/EauaFyhX9aa15oWd0ENqKLPrc8KSgg30BLwgc/yj
         AapZ46xO0EI3jLRHYfn/B5QbXVDv9AKyvij0LRF3yZomuokQyFfGZCZuGmBYRJuT/lH+
         cweg8VGv/ZI014+jDzWXQPJjA4oi3ZWbNm4yvus4D8czoI73PkA8zOT/lsnuJ0Or7lM6
         Vv8DYVqjz6dYkI89w1eFdCBIcEOC0NR9mZBsy2hRME9X71MtGhDIwU80FS74v9831tWA
         E5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psWYZztgZCmOanZbN0KVSKVg8aC+fzD9jcmxhuC+NNI=;
        b=jtVnuLVsxuUiZPhAWLdjaOxZnG0OSfsKpKf1CcVu+WcY+3wbuMijFe+pCnIeB5L9vi
         6srNcbUpslHm9+2woW3i0VVN2ZipayZTVh1f7UVYdbKeco4wOuWKMtpXR8xpvysxTq6y
         ASuj1j/Kubd88vMwwZHa4J7YswyK/BdA9+HBaR1UwYFdnP+/mynQaiMB9HOuLV/NP52z
         K9LXMvhQnjVc+O3rt+OG1/Pm/VovzXhx7WonEJ3nmYixAYBd3Fz4YgMmjZw0/kxTregF
         Um98pzy8NR8cZcowyN/GFf7aDrEay9MoHNZXaup+SEXZBDqu0FLEoML4iQN05o73ZYgV
         4sKQ==
X-Gm-Message-State: AOAM53058mEBagV708KTDbObkovplDyzv5WD9w7ecl+OzyPrRUmQnd1+
        UHI8znnR+ytc6BMX+Ql3ldk3mzQ90a+CgfFgG1Sy7w==
X-Google-Smtp-Source: ABdhPJyXKZK4qpETW5dxMgNJ4lmga0bIB3HhLdqOmOK7G/KhIAL9x+/iQr16cfal7ToieRC4QB+fxYBPp6QW6lBF30g=
X-Received: by 2002:ac8:5215:: with SMTP id r21mr8150267qtn.257.1599749886066;
 Thu, 10 Sep 2020 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-2-elver@google.com>
In-Reply-To: <20200907134055.2878499-2-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 10 Sep 2020 16:57:54 +0200
Message-ID: <CACT4Y+aBpeQYOWGrCoaJ=HAa0BsSekyL88kcLBTGwc--C+Ch0w@mail.gmail.com>
Subject: Re: [PATCH RFC 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Marco Elver <elver@google.com>
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

On Mon, Sep 7, 2020 at 3:41 PM Marco Elver <elver@google.com> wrote:
> +config KFENCE_NUM_OBJECTS
> +       int "Number of guarded objects available"
> +       default 255
> +       range 1 65535
> +       help
> +         The number of guarded objects available. For each KFENCE object, 2
> +         pages are required; with one containing the object and two adjacent
> +         ones used as guard pages.

Hi Marco,

Wonder if you tested build/boot with KFENCE_NUM_OBJECTS=65535? Can a
compiler create such a large object?


> +config KFENCE_FAULT_INJECTION
> +       int "Fault injection for stress testing"
> +       default 0
> +       depends on EXPERT
> +       help
> +         The inverse probability with which to randomly protect KFENCE object
> +         pages, resulting in spurious use-after-frees. The main purpose of
> +         this option is to stress-test KFENCE with concurrent error reports
> +         and allocations/frees. A value of 0 disables fault injection.

I would name this differently. "FAULT_INJECTION" is already taken for
a different thing, so it's a bit confusing.
KFENCE_DEBUG_SOMETHING may be a better name.
It would also be good to make it very clear in the short description
that this is for testing of KFENCE itself. When I configure syzbot I
routinely can't figure out if various DEBUG configs detect user
errors, or enable additional unit tests, or something else.
Maybe it should depend on DEBUG_KERNEL as well?

> +/*
> + * Get the canary byte pattern for @addr. Use a pattern that varies based on the
> + * lower 3 bits of the address, to detect memory corruptions with higher
> + * probability, where similar constants are used.
> + */
> +#define KFENCE_CANARY_PATTERN(addr) ((u8)0xaa ^ (u8)((unsigned long)addr & 0x7))

(addr) in macro body

> +       seq_con_printf(seq,
> +                      "kfence-#%zd [0x" PTR_FMT "-0x" PTR_FMT

PTR_FMT is only used in this file, should it be declared in report.c?

Please post example reports somewhere. It's hard to figure out all
details of the reporting/formatting.
