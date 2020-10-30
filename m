Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F458C4741F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C98722087E
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iW5ihpg+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgJ3CuX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgJ3CuW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:50:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C364C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:22 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 23so5335082ljv.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eoeNB3Dm2STEtOexs69p6fZG9+pIZ5Rd4jeKPI0aVt4=;
        b=iW5ihpg+JZ2/yUGtXbJNyGMMZriSOPNnlB3GV0zM6Mtiktse/EwhBGbcQZZZH+ocfG
         NIT3WX1VqpVPxzoCFCmcm/hhAjRxrvU8gEV93fe18PhNgE9efkKNdPSP8gfmcdtWBm1N
         OQ7Z0YYCFk04/U1vmuBGnc+qG8/Xvq/lsaJisf8R/NdH5ptqdSzdU7GtM5g0B/XxZDGA
         T6jCTxwdy4DPM0lyH2V7LTXTzDAkoXeOz8/h6SQSRRkYvUoQI9+aWZPlx3ktWrQWzZKI
         kpcS4PF3e5vY/XCoaUzT2Pkgy/aTXlK2UX9nqYk1u+GlsEirxu4Ku5nYzo9Cd4kuqBpi
         ESfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eoeNB3Dm2STEtOexs69p6fZG9+pIZ5Rd4jeKPI0aVt4=;
        b=Z1AZdDZhcRYM/JE3hOlxpKmXbqdWZzQEkC6jSgPfuR1FqZ8rk+NZ1jhe+1RjLKLs4K
         99dB2RtsDV/PiVWbS8W3v3WFnR3UvFwMYsEo9w3Lnj2yOx7IMe+FgUwMYUWbEkP39/Fo
         QCWg/08nmx8sqohb+8NyDfdzqqH0FhPiJPv6D6wguyXkZxaiOfgrRI+QPW33SVzNTX5r
         NKPj8FxnngUmz9SDc7TPkJtPz2vwtPPNXUZaTiVGc/4HHewTJnLcuDyv4DE+uI66I4YL
         KOzgxxHBuWDNTiDbEv+zt9O3GQ5OJWft/onjlJ48xgHcP3kHxSYz7HpfLB76hRoyBHdJ
         lgzQ==
X-Gm-Message-State: AOAM530W59cv3PFITtH9fvdgJMEc8mvbJIl+36BshJe9qs5T9+uKK9xx
        i4l6UVB9wMx8RSCvH6lmKfrcPpD6mdz8dhJggASxFw==
X-Google-Smtp-Source: ABdhPJzeE3oggLRKXmuhnJNQcjEqRcQBQF55b9TKu2lm5R+dh/rb0VPrh3CNfN76ySyQwy3jzXL4HMhNES1XqkD5gAQ=
X-Received: by 2002:a2e:b888:: with SMTP id r8mr99590ljp.138.1604026220407;
 Thu, 29 Oct 2020 19:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-8-elver@google.com>
In-Reply-To: <20201029131649.182037-8-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:53 +0100
Message-ID: <CAG48ez2ak7mWSSJJ3Zxd+cK1c5uZVqeF2zZ9HLtmXEoiG5=m-Q@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] kfence, Documentation: add KFENCE documentation
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
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, joern@purestorage.com,
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

On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> Add KFENCE documentation in dev-tools/kfence.rst, and add to index.
[...]
> +The KFENCE memory pool is of fixed size, and if the pool is exhausted, no
> +further KFENCE allocations occur. With ``CONFIG_KFENCE_NUM_OBJECTS`` (default
> +255), the number of available guarded objects can be controlled. Each object
> +requires 2 pages, one for the object itself and the other one used as a guard
> +page; object pages are interleaved with guard pages, and every object page is
> +therefore surrounded by two guard pages.
> +
> +The total memory dedicated to the KFENCE memory pool can be computed as::
> +
> +    ( #objects + 1 ) * 2 * PAGE_SIZE

Plus memory overhead from shattered hugepages. With the default object
count, on x86, we allocate 2MiB of memory pool, but if we have to
shatter a 2MiB hugepage for that, we may cause the allocation of one
extra page table, or 4KiB. Of course that's pretty much negligible.
But on arm64 it's worse, because there we have to disable hugepages in
the linear map completely. So on a device with 4GiB memory, we might
end up with something on the order of 4GiB/2MiB * 0x1000 bytes = 8MiB
of extra L1 page tables that wouldn't have been needed otherwise -
significantly more than the default memory pool size.

If the memory overhead is documented, this detail should probably be
documented, too.

> +Using the default config, and assuming a page size of 4 KiB, results in
> +dedicating 2 MiB to the KFENCE memory pool.
[...]
> +For such errors, the address where the corruption as well as the invalidly

nit: "the address where the corruption occurred" or "the address of
the corruption"

> +written bytes (offset from the address) are shown; in this representation, '.'
> +denote untouched bytes. In the example above ``0xac`` is the value written to
> +the invalid address at offset 0, and the remaining '.' denote that no following
> +bytes have been touched. Note that, real values are only shown for
> +``CONFIG_DEBUG_KERNEL=y`` builds; to avoid information disclosure for non-debug
> +builds, '!' is used instead to denote invalidly written bytes.
[...]
> +KFENCE objects each reside on a dedicated page, at either the left or right
> +page boundaries selected at random. The pages to the left and right of the
> +object page are "guard pages", whose attributes are changed to a protected
> +state, and cause page faults on any attempted access. Such page faults are then
> +intercepted by KFENCE, which handles the fault gracefully by reporting an
> +out-of-bounds access.

... and marking the page as accessible so that the faulting code can
continue (wrongly) executing.


[...]
> +Interface
> +---------
> +
> +The following describes the functions which are used by allocators as well page

nit: "as well as"?



> +handling code to set up and deal with KFENCE allocations.
