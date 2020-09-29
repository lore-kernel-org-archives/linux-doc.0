Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE107C4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 14:51:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65EE821531
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 14:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wMGD4Vgc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730554AbgI2Ovm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 10:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730302AbgI2Ovl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 10:51:41 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984A8C0613D0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 07:51:41 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id q21so4685844ota.8
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wW+VJQgARCCUxTSXrTTMpTSAvZIEsqsjgDYoqUGhARg=;
        b=wMGD4VgcgbK4IxtOQtFKwIep4NE/Lks0XQ84z53sb9ztrBrhdOTixFBfNnnFmc2Mmp
         2HRGwfLla5AakIrCbRVmzawkLIflkdRyIs1CUm9Xww1+2xb4I17TEtNyIQdpfpPU1G5h
         qeYDoMGzWTg6XQ7p5H1nFebztaG3DFm6HtUk5e/0bb7mw9B6OmWARxPX3Gh2mUZrOiCU
         1Yj5QhpxD1O63S8fIDxlpq1YHEA6AZVVWwBSkpVJAg7Z5s/nJ4OCOjvOjtvVXKkedQWq
         VgWYHEeN/dpoT4xUm6hPg6iexodywLoB+SCcvUzZJs8ZWHAyLC6enNWDmQMm1PN6ysab
         pssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wW+VJQgARCCUxTSXrTTMpTSAvZIEsqsjgDYoqUGhARg=;
        b=SZMQRm4goQFx1z3Yvold9cHN9k/VPXucU/FSuxokYBLAkBYv+UBLPRZWutrfTPZiUH
         vDQAlytoCJSHO4UahZTd1krUxUUU9INqxr+4YwZfcr5G2HNRGLnhtZEwxO9gjPU1bJbc
         VZETz1elTFMkd+QYMpS4Fge6kQMbCoR2QMRctyKddpF6Yyb/sRh+XKxm1kChKMJcYCKc
         37JAIPrEesjCI7NtB6V7jm4j2y2nFVj3a400Q4XhtOddmlJjsa5CG1Q/x0miKSJbKW7j
         EiCXof8KY/sOvfnEvmlZCTIlAnptOeh/M2GEcbplLHL9TwVLn8cADZAqHplnv/ktrrYP
         BSrw==
X-Gm-Message-State: AOAM531Hu2a8UOvaR+rfR7xiezPD7V8zEdXYiVi/sfFXKly8sZeKhg98
        6NkG/Au0miKPmSl7ZOkJZJNj0jOPMhuw0gWQYFT0Ig==
X-Google-Smtp-Source: ABdhPJxroT9i54MN1iDT4wifYt9kExM7oIJmn8MlrbnOEJQnD//Y0CVF3kuXJabOEMsMGXWE3i3iimChMga6hnEclNE=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr2840881otk.251.1601391100711;
 Tue, 29 Sep 2020 07:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-2-elver@google.com>
 <20200929142411.GC53442@C02TD0UTHF1T.local>
In-Reply-To: <20200929142411.GC53442@C02TD0UTHF1T.local>
From:   Marco Elver <elver@google.com>
Date:   Tue, 29 Sep 2020 16:51:29 +0200
Message-ID: <CANpmjNNQGrpq+fBh4OypP9aK+-548vbCbKYiWQnSHESM0SLVzw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mm: add Kernel Electric-Fence infrastructure
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

On Tue, 29 Sep 2020 at 16:24, Mark Rutland <mark.rutland@arm.com> wrote:
[...]
>
> From other sub-threads it sounds like these addresses are not part of
> the linear/direct map. Having kmalloc return addresses outside of the
> linear map is going to break anything that relies on virt<->phys
> conversions, and is liable to make DMA corrupt memory. There were
> problems of that sort with VMAP_STACK, and this is why kvmalloc() is
> separate from kmalloc().
>
> Have you tested with CONFIG_DEBUG_VIRTUAL? I'd expect that to scream.
>
> I strongly suspect this isn't going to be safe unless you always use an
> in-place carevout from the linear map (which could be the linear alias
> of a static carevout).

That's an excellent point, thank you! Indeed, on arm64, a version with
naive static-pool screams with CONFIG_DEBUG_VIRTUAL.

We'll try to put together an arm64 version using a carveout as you suggest.

> [...]
>
> > +static __always_inline void *kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
> > +{
> > +     return static_branch_unlikely(&kfence_allocation_key) ? __kfence_alloc(s, size, flags) :
> > +                                                                   NULL;
> > +}
>
> Minor (unrelated) nit, but this would be easier to read as:
>
> static __always_inline void *kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
> {
>         if (static_branch_unlikely(&kfence_allocation_key))
>                 return __kfence_alloc(s, size, flags);
>         return NULL;
> }

Will fix for v5.

Thanks,
-- Marco
