Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B536BC4363C
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 16:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DB7920758
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 16:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IwPpPrdN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388118AbgJBQKr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 12:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJBQKq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 12:10:46 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F27C0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 09:10:46 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g4so2224441edk.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TKrnU8OMrTP2HnfeDQ36W4jlkOILiDTjG4Jt9zQv/MU=;
        b=IwPpPrdNsnu5FlD1OobJFZzCKqafUWQ2s30+vLINDfRq3i2kHN3JPuk792i6I+hxFV
         ppJtNzpaq2Cyq6riihUjk4eQqNIMm2lNSgD8CghVcRL52lvCfcA//XhoaZmtkPagobKq
         HCOdykTKtGQhET9fzgpMmoZTDgMd4WrfE/JxVJQpF/4lFDcN7XepWB5YL/3Pf0auVNXk
         KZrJc6PPwixBYO+cxDLI3DeOJ3ahyyEk4BWSc2EKTkjlRoB+Hw0tLXJtech+Dexow3/q
         eghOfkOJigf4cnjYXMzGakOnokbBwexTzgZXEAEVFTpz1djWvjOhfbTp7zQs67XINkSU
         9qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TKrnU8OMrTP2HnfeDQ36W4jlkOILiDTjG4Jt9zQv/MU=;
        b=DdUOafFdMdO4XbDc3HkBRmlYrAY+a4XwMylLw3doq7qujSeE0lFolOMWaYUYH2Fhp5
         cvIShNWDdQsw7KuV+71rqm9N3bjCSswJoLEZXrAklE0bw1WTt3ssvT+vV+gy4w+FziFy
         VDKou33rc6PYTfT4mrPVgU5tdef88OeA5TJORuDSa4gcDCIUmVMyLDa6fb/LYS52Dr0l
         y5LEDbTsl7Ym+hRffsjc3RwPnjY+mgHGmLL70xE+c7+LSGO+FrYeFdBFlPo7ktSfOBKr
         U7Zb3+LSsmeRUfVsSJ8MetvzVeHsBJttaalFRKWPymOrDVN/iOWPllCkmmaj0qsCnaZ+
         7r9w==
X-Gm-Message-State: AOAM533K7bBZXMDjQXQdmVHpsjIFubUrzCL0o+8i2n/IpGpUd6CbPw08
        qiYvBxYEDdMMQjrLbsH+v/gxYYlHzYQN2P1Ljcr9ZQ==
X-Google-Smtp-Source: ABdhPJxLy7vg7Hji+HMyUSROdJEDLd+lE2ee6OVvCPRAEz3XaYpLc31KjN/VPPgbMoqSSYcuD6bOTMFH3k2TEj8w4JM=
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr3217947edb.259.1601655044643;
 Fri, 02 Oct 2020 09:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com> <20200929133814.2834621-4-elver@google.com>
 <CAG48ez1VNQo2HZSDDxUqtM4w63MmQsDc4SH0xLw92E6vXaPWrg@mail.gmail.com> <CANpmjNMcdM2MSL5J6ewChovxZbe-rKncU4LekQiXwKoVY0xDnQ@mail.gmail.com>
In-Reply-To: <CANpmjNMcdM2MSL5J6ewChovxZbe-rKncU4LekQiXwKoVY0xDnQ@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 2 Oct 2020 18:10:18 +0200
Message-ID: <CAG48ez37Mi+4rRY7v3P9uTgV+35oTT+dpb4Xe=V_Nb=pdMosbA@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] arm64, kfence: enable KFENCE for ARM64
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
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
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

On Fri, Oct 2, 2020 at 4:19 PM Marco Elver <elver@google.com> wrote:
>
> On Fri, 2 Oct 2020 at 08:48, Jann Horn <jannh@google.com> wrote:
> >
> > On Tue, Sep 29, 2020 at 3:38 PM Marco Elver <elver@google.com> wrote:
> > > Add architecture specific implementation details for KFENCE and enable
> > > KFENCE for the arm64 architecture. In particular, this implements the
> > > required interface in <asm/kfence.h>. Currently, the arm64 version does
> > > not yet use a statically allocated memory pool, at the cost of a pointer
> > > load for each is_kfence_address().
> > [...]
> > > diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
> > [...]
> > > +static inline bool arch_kfence_initialize_pool(void)
> > > +{
> > > +       const unsigned int num_pages = ilog2(roundup_pow_of_two(KFENCE_POOL_SIZE / PAGE_SIZE));
> > > +       struct page *pages = alloc_pages(GFP_KERNEL, num_pages);
> > > +
> > > +       if (!pages)
> > > +               return false;
> > > +
> > > +       __kfence_pool = page_address(pages);
> > > +       return true;
> > > +}
> >
> > If you're going to do "virt_to_page(meta->addr)->slab_cache = cache;"
> > on these pages in kfence_guarded_alloc(), and pass them into kfree(),
> > you'd better mark these pages as non-compound - something like
> > alloc_pages_exact() or split_page() may help. Otherwise, I think when
> > SLUB's kfree() does virt_to_head_page() right at the start, that will
> > return a pointer to the first page of the entire __kfence_pool, and
> > then when it loads page->slab_cache, it gets some random cache and
> > stuff blows up. Kinda surprising that you haven't run into that during
> > your testing, maybe I'm missing something...
>
> I added a WARN_ON() check in kfence_initialize_pool() to check if our
> pages are compound or not; they are not.
>
> In slub.c, __GFP_COMP is passed to alloc_pages(), which causes them to
> have a compound head I believe.

Aah, I mixed up high-order pages and compound pages. Sorry for the noise.
