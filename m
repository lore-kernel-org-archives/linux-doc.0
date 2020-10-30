Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2226C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 10:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 739C4223C6
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 10:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TfYtmrep"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgJ3K5G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 06:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgJ3K5G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 06:57:06 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311BFC0613D2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 03:57:06 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u127so6225301oib.6
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x083AjvGF0zQfoi/Zp4lR99mcm5WG8qTkAtv8ezIp6w=;
        b=TfYtmrepxSGkTOhnz89oz6fSDep8VfjQbMpR6CczHyYU+W2W7jTUmEowCn4QD/hVvq
         dsWCZauyXVabXaqJnvVyWA0PwsX0aWqKTQ7ckuvxEREHo2CGKGVQcZRnxqxutoHya7za
         6QPSPDYJmVISC6QxiRn1TMZpWFIqSBWHAMQRqRPj+wTPNmDukvtu9Vp56kZSAIBKkGLo
         6Z5VieLX+zzEXrsM7nqfyZXoq6B6+/cUtEh46djyIf/4EhucCioVM3q8c00a0RdHT3AD
         RcDiuqZCdNgmt5y+jqSaBseAoLg3/PpF7r96838wOeOEM2oPoa0HChKzDMv6jrZVVaaS
         sfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x083AjvGF0zQfoi/Zp4lR99mcm5WG8qTkAtv8ezIp6w=;
        b=gf6nFdk3mrSDAAikknK/D01QA681RNKJBIkysSOi3dYyVvN60qfwPsF/h/VQR/569C
         DDUKazDHzbhi4qKKWunF+/sXMQyF8tBJYogmsnRnpPeIyomUMtsf8yORz1uGxpJjaTim
         FoMiMi4ytiLfTlDkscDVzO5C7X9mFuvWdH3tmC+FBRb8R5gYU0V4PWl4YHrkUE3eA49b
         X9iUcXQijHy//FX6y7kOwnan+odOc/Eos4Z+TQsT0vi3t20lnmjzatY4mSyj8raVafXe
         /dK+qiIqsfulwyQLVKa0nFLe65yOcKjIsr8//TrXv0+zoCL9sTL2JavIuoR/jMgGOpCj
         WfCA==
X-Gm-Message-State: AOAM533S8meBSBzYNbsTdUV6AIgYwqHEXaVMoovDkHDJOv9PSV1mSix5
        FkIEnqynBSdCteas6EsNjDZFuMbD/jZhUWsmlpgWTg==
X-Google-Smtp-Source: ABdhPJz3C4ZPru/opHgaUXloKSf0xyz52fj93A1p3T9rYcAFfZuZf7nAa+ojQJj0KzgJdsGQpQt03lRixeBInl+1H40=
X-Received: by 2002:aca:4f55:: with SMTP id d82mr1153951oib.172.1604055425438;
 Fri, 30 Oct 2020 03:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <CAG48ez1xg0uRV6LqYOO-ibVqOO7jNRJGLVLrQfGW=s8TcbPGoQ@mail.gmail.com>
In-Reply-To: <CAG48ez1xg0uRV6LqYOO-ibVqOO7jNRJGLVLrQfGW=s8TcbPGoQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 30 Oct 2020 11:56:53 +0100
Message-ID: <CANpmjNOx=6ZRUC-Gkx=RqX4EPtuLe=AMshGSMcnd6a3=2iNtkQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] KFENCE: A low-overhead sampling-based memory
 safety error detector
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
> On Thu, Oct 29, 2020 at 2:16 PM Marco Elver <elver@google.com> wrote:
> > This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE is a
> > low-overhead sampling-based memory safety error detector of heap
> > use-after-free, invalid-free, and out-of-bounds access errors.  This
> > series enables KFENCE for the x86 and arm64 architectures, and adds
> > KFENCE hooks to the SLAB and SLUB allocators.
>
> I think this is getting close to a good state, just a couple minor issues left.

Thanks for your comments. We'll address all of them for v7.

> Now that the magic "embed the memory pool in the BSS section" stuff is
> gone, this series looks fairly straightforward.

Good to hear. :-)

Thanks,
-- Marco
