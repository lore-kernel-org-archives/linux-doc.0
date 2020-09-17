Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676EFC2BBD1
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 09:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37EAC20838
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 09:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fGUjulhI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIQJsW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 05:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgIQJsV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Sep 2020 05:48:21 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88E4C061788
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2020 02:48:12 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so1359892wrn.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2020 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EWVAkK9HAhFT14dUOAujUtY5YcpFnxpT4fxJHTF5BOY=;
        b=fGUjulhIB5feEidxD8CbRMQRZtBkcY74CpaCtIFwTz/c1lHbmgF+RxHQ5QcBrM2Qhd
         zp4X9v27+fX0syFcIXLODdzacwIEGhav/TGHLIuv5Qn0HI9t73IOD3WqeHw02rdkgOl9
         TJXhDXq7erwEwkhNM3HQw/FM7wZpI4gQZGwsl6skPykaKrBpDYw4ixD7AO1mNaCGL46r
         txaIuynWbKRPbDWLpW0z4mLDszb2QOwKwXBlP5T05hVcaT1tOAQkVff8vgTwNIM1IN7H
         F9UCAGB/4LfqJk/b1VsVSHAGJkJPcGUYDf83zZKUw0VGNFpFBSRvSr3/VZ2xgg8qEfAx
         7diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EWVAkK9HAhFT14dUOAujUtY5YcpFnxpT4fxJHTF5BOY=;
        b=K7z0TuXCvudj9q4FMDtsL0sV/UbQOZfPpdeA1W2cbw0Qf9kUBnkd96+VnQOA3jwG8B
         pVkqcvKzSzDfvUPTpUApvtIKanovfG4SUmGMVJx3VCwHQd/Y8lgz1gVaupS+rMuUBNUb
         6lpdF2j61JMGAUJw1LeCb39stiW9nskypMh0/gxc1TW4b/LknGep55Ln8/zutNBstdw2
         9Z93/2mGT+t2ZjUn0OWmD5Xq481Z0MJebmpnoGxJbiBoDj9lsOEIjcKMgCJTjR7XQCl5
         OVwrVhW6+4u5vpuIfnd0b5gDh3I0drUqxunjdXUyFWV6Ic5+uvHdV4ALlEEqmzFP3TUR
         2HFQ==
X-Gm-Message-State: AOAM530NDj4JtWwONnwhEFpWNlUKFahvUVD3yIsLSuMTa/RIGGTwS74p
        7t0mkhSck7/E1TKz2XztLAML4uCxUmnP/4sWnAeGlA==
X-Google-Smtp-Source: ABdhPJy/tul2S9Qpkkmj30T/q+nw4Nil13riChRbngdSqqrHzeA52FzPYShdWqFhYLJV4ql+y6skJ50UXxp5Lg/gpKA=
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr30836644wrt.196.1600336091166;
 Thu, 17 Sep 2020 02:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200915132046.3332537-1-elver@google.com> <20200915132046.3332537-5-elver@google.com>
 <alpine.DEB.2.22.394.2009170935020.1492@www.lameter.com>
In-Reply-To: <alpine.DEB.2.22.394.2009170935020.1492@www.lameter.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 17 Sep 2020 11:47:59 +0200
Message-ID: <CAG_fn=XMc8NPZPFtUE=rdoR=XJH4F+TxZs-w5n4VuaWKTjcasw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] mm, kfence: insert KFENCE hooks for SLAB
To:     Christopher Lameter <cl@linux.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> >  static __always_inline void *
> > -slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid,
> > +slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid, si=
ze_t orig_size,
> >                  unsigned long caller)
> >  {
>
> The size of the object is available via a field in kmem_cache. And a
> pointer to the current kmem_cache is already passed to the function. Why
> is there a need to add an additional parameter?

That's because we want to do our best detecting bugs on
kmalloc-allocated objects.
kmalloc is using size classes, so e.g. when allocating 272 bytes the
object will be padded to 512.
As a result, placing that object at the end of the page won't really
help to detect out-of-bound accesses that are off by less than 270
bytes.

We probably need to better clarify this in the patch description.

--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
