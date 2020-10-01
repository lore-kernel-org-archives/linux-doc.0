Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C78C47420
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 11:25:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C22120B1F
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 11:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QCZTFGmp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731940AbgJALZE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 07:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731931AbgJALZD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 07:25:03 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A5DC0613E2
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 04:25:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so5228444wrn.13
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2020 04:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIrqsNB2CCkv+5Up492E6RUjeUyfI0426YjKqnUmMhw=;
        b=QCZTFGmpea3i9RVr/67JK8ZN36dSLFeJjSgI6yS88Ca8rxeTc7ji8wthxQWMpuy6L5
         u38dUNAPrZ77ARjpb1ujurLSC6fur8w2OAkwLL02Za5S8+J4n9uwpZdfMlMOgj5kIS/x
         YH8nDHFCe4v3IU0+qrJygKqAgr+frNx0suL3E6RPhxO+uEp8EGRu3tKOOHOJAVwvjSnJ
         1khf7ghrPbRMUyZOLWNxZ8J2oV4KE7oaZDCSSE5t6aEdfcrbfOkDVUWOjiVSKQnB0cay
         kTucVLYQhI+hSkAC7BzKpjTg8tSYzuviz1LuY68gXQYPam7gwzl/XpH8Ue9QmTxNm6jZ
         BV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIrqsNB2CCkv+5Up492E6RUjeUyfI0426YjKqnUmMhw=;
        b=YcsU66/kk20TVsYV4qlFZumzQA9gwdtU0vb6eel5AyGBbscnGnfsNhRNmNPUlRHMC0
         VIdpljX1mNpvPc3ibVdUov6I/DTyfna+iNF6HdQMOTJOlVp/rjyqfJFyT8UzvDmSTmRG
         Ag6Dk0goHLX8LsmCDdl7Jy2oIHbouW8Rxuzix8gvaMbXagbUEmZlqNEEQM2A3k3vmjRs
         gKR0LQCx8/J4fx2BJTrIx48KFGdkgpyrLg1KT6scl8WWogoHxOaj93SomzR3Fn1D3rxW
         rskRfSuuJI0+FzG/PwXP+e+hCGvmpmmn+Zq1i0bWfRkaHqAS81W0emGzyjfzrNG4VvY5
         yO5w==
X-Gm-Message-State: AOAM533OSqkI4V/OFTTS1s94szF/oGM5CmUn1b4KRDuWylnClPBFqa4a
        matQjbbVTok6UBf7dLUeMtGzGp/q6Tbu9/LoZP8FBw==
X-Google-Smtp-Source: ABdhPJzGuN41NKZ9z4kTko7jROyZG/OJ7AHb1nE6sC1xk6wR5ZdnjF4TzEwMBHuBpFfZC3poYstIgrbkwtRyeClLy/A=
X-Received: by 2002:adf:f101:: with SMTP id r1mr8370892wro.314.1601551500540;
 Thu, 01 Oct 2020 04:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck> <CAG_fn=WXknUnNmyniy_UE7daivSNmy0Da2KzNmX4wcmXC2Z_Mg@mail.gmail.com>
 <20200929140226.GB53442@C02TD0UTHF1T.local>
In-Reply-To: <20200929140226.GB53442@C02TD0UTHF1T.local>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 1 Oct 2020 13:24:49 +0200
Message-ID: <CAG_fn=VOR-3LgmLY-T2Fy6K_VYFgCHK0Hv+Y-atrvrVZ4mQE=Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Will Deacon <will@kernel.org>, Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        Dmitriy Vyukov <dvyukov@google.com>,
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

Mark,

> If you need virt_to_page() to work, the address has to be part of the
> linear/direct map.
>
> If you need to find the struct page for something that's part of the
> kernel image you can use virt_to_page(lm_alias(x)).
>
> > Looks like filling page table entries (similarly to what's being done
> > in arch/arm64/mm/kasan_init.c) is not enough.
> > I thought maybe vmemmap_populate() would do the job, but it didn't
> > (virt_to_pfn() still returns invalid PFNs).
>
> As above, I think lm_alias() will solve the problem here. Please see
> that and CONFIG_DEBUG_VIRTUAL.

The approach you suggest works to some extent, but there are some caveats.

To reiterate, we are trying to allocate the pool (2Mb by default, but
users may want a bigger one, up to, say, 64 Mb) in a way that:
(1) The underlying page tables support 4K granularity.
(2) is_kfence_address() (checks that __kfence_pool <= addr <=
__kfence_pool + KFENCE_POOL_SIZE) does not reference memory
(3) For addresses belonging to that pool virt_addr_valid() is true
(SLAB/SLUB rely on that)

On x86 we achieve (2) by making our pool a .bss array, so that its
address is known statically. Aligning that array on 4K and calling
set_memory_4k() ensures that (1) is also fulfilled. (3) seems to just
happen automagically without any address translations.

Now, what we are seeing on arm64 is different.
My understanding (please correct me if I'm wrong) is that on arm64
only the memory range at 0xffff000000000000 has valid struct pages,
and the size of that range depends on the amount of memory on the
system.
This probably means we cannot just pick a fixed address for our pool
in that range, unless it is very close to 0xffff000000000000.

If we allocate the pool statically in the way x86 does (assuming we
somehow resolve (1)), we can apply lm_alias() to addresses returned by
the KFENCE allocator, making kmalloc() always return addresses from
the linear map and satisfying (3).
But in that case is_kfence_address() will also need to be updated to
compare the addresses to lm_alias(__kfence_pool), and this becomes
more heavyweight than just reading the address from memory.

So looks like it's still more preferable to allocate the pool
dynamically on ARM64, unless there's a clever trick to allocate a
fixed address in the linear map (DTS maybe?)

Thanks,
Alex
