Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0516DC4741F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 982EE21531
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bSfQ00UY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgI2Nsj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbgI2Nsj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:48:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323AAC0613D0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:48:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b17so2693761pji.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPm4tw86pN2WUua3zyIf+UMu5higdStDKbiJez1ULJI=;
        b=bSfQ00UYm4VoJlquAI7V6jVEQo4rLlwg3aERyFQwm5d2bcD2RuSliJPcyonBtdq/ZN
         VvtPxIglw3bP70TwMysOCQigvfrpJG5cVvoGzuxUOz7ebd0+R2+WOVxDLfja2EdFIw86
         oHju9/tu+hGRSe9XSlz1mv37TYzGHHLo4MOIeW6BT9yq9OAOppmMVmVdbr59zPAquJ0Q
         zIkQ3Jje0wj7eyMksGfm8fCOIsbSb8gjJJqa/fCHSQ1EYhDH+S9HIJvVGKkVpicjB299
         UPjQVRx2K+46bs+6lG7chdR0y5VBQTLqBCRUr0knfqDC/5w+scyhixQ/3URhOBW5mDq2
         naWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPm4tw86pN2WUua3zyIf+UMu5higdStDKbiJez1ULJI=;
        b=pGRK1+PTFYCuriVMlJxW1mavIvMKcx9UqIhroVXxNvGGsx8vvNkTmgNvHLlxZaopCw
         L5hbOzrMJGsYnTDJ1b+Z+OUQXkRk4TcPxPd6uqC/+RT5zz2cce9XuKdfAWNztXLDVhLZ
         AV12UEnvvFabiI+R+ptUDNeV49qQsgOcyEZ8jfsMBN/wWSWuCrnXkAMxEZiBYr6WzLYX
         ihcaA2/FEXi6s4yUO5ykc+4bnabHNLE9nc2QDUKYNN4NO+nqo8damB/NABrFoZkzgdXu
         nc5n2NEq0a5QyEOw8r34O9A532zy5DSt9ulElHo8mgoKPDbuOxEWjOIxIlvtVYodXhjH
         EInw==
X-Gm-Message-State: AOAM533kjHx/0O+SF23hdllXc0CSfQOpBXz2tl93ZCLQ1vHc95uK3Z1l
        JzkdN4TRFHK0zzWD3myqNBWakVbIcYieu1cEebAXxw==
X-Google-Smtp-Source: ABdhPJw47F0+7jUDxETZXpy6HGkN76Pw3ijxd4TL/rithtPlxyOge6EdgdmYyxt2sw1OTCcxptDiCw/No4O/AUpJpcs=
X-Received: by 2002:a17:90a:81:: with SMTP id a1mr3910753pja.136.1601387318512;
 Tue, 29 Sep 2020 06:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-2-elver@google.com>
 <CAAeHK+zYP6xhAEcv75zdSt03V2wAOTed6vNBYReV_U7EsRmUBw@mail.gmail.com> <20200929131135.GA2822082@elver.google.com>
In-Reply-To: <20200929131135.GA2822082@elver.google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 29 Sep 2020 15:48:27 +0200
Message-ID: <CAAeHK+y0aPAZ8zheD5vWFDR-9YCTR251i0F1pZ9QfXuiaW0r8w@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
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
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, sjpark@amazon.com,
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

On Tue, Sep 29, 2020 at 3:11 PM Marco Elver <elver@google.com> wrote:
>
> On Tue, Sep 29, 2020 at 02:42PM +0200, Andrey Konovalov wrote:
> [...]
> > > +        */
> > > +       index = (addr - (unsigned long)__kfence_pool) / (PAGE_SIZE * 2) - 1;
> >
> > Why do we subtract 1 here? We do have the metadata entry reserved for something?
>
> Above the declaration of __kfence_pool it says:
>
>         * We allocate an even number of pages, as it simplifies calculations to map
>         * address to metadata indices; effectively, the very first page serves as an
>         * extended guard page, but otherwise has no special purpose.
>
> Hopefully that clarifies the `- 1` here.

So there are two guard pages at the beginning and only then a page
that holds an object?
