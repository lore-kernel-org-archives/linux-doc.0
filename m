Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23DBC4741F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63CF120782
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hvIenZ/1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgJ3Ctz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgJ3Ctz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:49:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF01C0613D2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:49:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 23so5334271ljv.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5VSV5EOvuuPrA9xNEsowWeAohxv+a7+9KVx3Owvda8=;
        b=hvIenZ/1jqtu8F4Mb0B2dqX3Djjzd9dPzPPm8fbk2Mwd/NiwUcIzSfqkEPHxiORqR4
         +aIvclP1ZbKKnv1jUCg3tzYc1GiM+hF5IUs+OyqfQTZGlXr41lEV7y2wJ1kdGO2BiXSB
         CKLDb8KGnWVabTZglW8tiyCFheuiAIuURPJ3/ELAuGlWcjQkQcVSyidXoFP60SqKgX3z
         tH+yqOICZSjxMeDIYwrUjgqaMnrV0SnB8jWmiQrNeNpYXJtm9WinMf3SuKfo3NvBCNlv
         9Mnu1Jv1KkGDPn/5sd9AUaPRKa0PB7F2Oy/sF9S4C1kUCxmLNOD4HhVn5Xig2k+O/kSY
         LxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5VSV5EOvuuPrA9xNEsowWeAohxv+a7+9KVx3Owvda8=;
        b=McSLpJIelCPSm8n3NVo+BE9+jUdTueDX3slp39UUCoV/1CyRZclcmXU/WDPtjfkGr+
         ihlNYDqGKSwnZxTk0IHYfufVIdlMynbLnvLra7C67c2c0BhCqTbKX+ZfUGX1+gmOrTVI
         7fiiwzq10V1tQvA8MLX8I9XvHLkgqovhBkWEn9OeYnbRD3AAeTfjZf1ECgsBwC2+8cb7
         eEifLs9N6g7bVdOcx1+Y3RcHEGyNT+kRUPuIrt/bEFlvEWiumjsXtK9ZnVm7GASkaw9D
         0nKQQcthhdzQKRzU7LKEtu7n/dOyWgamUy5ULoqZiKFop4nM2obxRpBfttLVHdZNoPk1
         n2qQ==
X-Gm-Message-State: AOAM533DIcUkLlLO1VthW57u1jxN4YG6TFUYXXvr9qE5X1ZXDgLQkMTV
        CPtE7WEfY8l2GP45U23QQFLGzeAf4JGMjMFNzRMB0A==
X-Google-Smtp-Source: ABdhPJy5BCp9b2onPlMEzZvXxzY2+7KT6JF4Piv/BGIOWQ/jH5h8osPXMpnQh5s0vTKqhfe/Bc0g9m3Dzk03z8KGets=
X-Received: by 2002:a2e:8816:: with SMTP id x22mr82450ljh.377.1604026192956;
 Thu, 29 Oct 2020 19:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-4-elver@google.com>
In-Reply-To: <20201029131649.182037-4-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:26 +0100
Message-ID: <CAG48ez11T4gXHkhgnM7eWc1EJQ5u7NQup4ADy75c1uUVPeWGSg@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] arm64, kfence: enable KFENCE for ARM64
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
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the arm64 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.
>
> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the entire linear map to be mapped
> at page granularity. Doing so may result in extra memory allocated for
> page tables in case rodata=full is not set; however, currently
> CONFIG_RODATA_FULL_DEFAULT_ENABLED=y is the default, and the common case
> is therefore not affected by this change.
[...]
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
[...]
> +       select HAVE_ARCH_KFENCE if (!ARM64_16K_PAGES && !ARM64_64K_PAGES)

"if ARM64_4K_PAGES"?

[...]
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
[...]
> @@ -312,6 +313,9 @@ static void __do_kernel_fault(unsigned long addr, unsigned int esr,
>             "Ignoring spurious kernel translation fault at virtual address %016lx\n", addr))
>                 return;
>
> +       if (kfence_handle_page_fault(addr))
> +               return;

As in the X86 case, we may want to ensure that this doesn't run for
permission faults, only for non-present pages. Maybe move this down
into the third branch of the "if" block below (neither permission
fault nor NULL deref)?



> +
>         if (is_el1_permission_fault(addr, esr, regs)) {
>                 if (esr & ESR_ELx_WNR)
>                         msg = "write to read-only memory";
