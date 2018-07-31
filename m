Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF5CA7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 16:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbeGaRuU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 13:50:20 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:45156 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbeGaRuR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jul 2018 13:50:17 -0400
Received: by mail-pl0-f68.google.com with SMTP id j8-v6so7367210pll.12
        for <linux-doc@vger.kernel.org>; Tue, 31 Jul 2018 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZG1+GrXHehi6qJK10k7idwFQ2rL3SWU7/hMPdsm4gPA=;
        b=htlmeyXjMf0WQ2ZklaAgnvll6vjsufkm6iWttBfDbphgFF98ZQSqEXIsPZ5yrufRg6
         kmzUdwcGXVkUQoQ3MTLE+JYcjOMyu4QhrjZsujWx4ITLzQU/IYzeHaOm+fg7f7YitEIX
         KhANoR4g47xXQ8n7dZOnVbnficp9t0rs6tKkjiKvTyHYmdCzJmZstj+nKxKtd8NmfVTT
         rRZnAIU3hQ/LrzXzhQyu//WAc/H30mMaE+xui6KDdCV+Vdlx9vhDixqUieiNjqrYUxsk
         PyM49xp3nJUMq5xjYsi3ess+xGjJuKatJLA9BlR1C5NpuiEHHIuDB5LgkXkda3tShhHg
         SJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ZG1+GrXHehi6qJK10k7idwFQ2rL3SWU7/hMPdsm4gPA=;
        b=C9Qh7hZZBIfMPIruI+Hgmu0CIemD4wr53ERk4hhB3wbkzMMnJyhYpY80ArEO6dgCw5
         BpP6y+rvkSX2myKgKQTUey65yf8tpXud5HZhPoO4flLg8OeDblVaPeFQ0I28XikwVT8C
         G3GHvjnY0VASd5o0lNc+7kP+qLl/MLXKNj8OdTEW8OvIS0oUhpKN2QDObqkKDUNooAaw
         j2Bs/ST3H6JhS4xpBrQvN7ovamAJsLRuhKSW7IIjhYnlLPMIlvJ1/60/rC6WqgiJ1Z+Q
         J5ueKAD4MycWrJWXp68UUUw3kSk01VJ+c+8k7AHvw3tUgU+g9wvFg8fXI2RzZ00VHg8F
         nsNQ==
X-Gm-Message-State: AOUpUlE52MIYjdtqlErGF/dNBwp/M54D1kfualPD0O+ZjLvTypuzeqtc
        cSvRv97mMrmpbfFSc5u2K5uVRupwnrW0Cb6x+F8O3w==
X-Google-Smtp-Source: AAOMgpefWauVE0VT+ZbsLcDB30ljjLb12nw3sHpAVO6egXGDMovYPGwwOflWZTDEgSn1deepqwVLcRVLGrEu7YuzlU8=
X-Received: by 2002:a17:902:ab95:: with SMTP id f21-v6mr20635636plr.264.1533053355559;
 Tue, 31 Jul 2018 09:09:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:ac14:0:0:0:0 with HTTP; Tue, 31 Jul 2018 09:08:54
 -0700 (PDT)
In-Reply-To: <b6b58786-85c9-e831-5571-58b5580c84ba@virtuozzo.com>
References: <cover.1530018818.git.andreyknvl@google.com> <a2a93370d43ec85b02abaf8d007a15b464212221.1530018818.git.andreyknvl@google.com>
 <09cb5553-d84a-0e62-5174-315c14b88833@arm.com> <CAAeHK+yC3XRPoTByhH1QPrX45pG3QY_2Q4gz=dfDgxfzu1Fyfw@mail.gmail.com>
 <8240d4f9-c8df-cfe9-119d-6e933f8b13df@virtuozzo.com> <CACT4Y+Y=61VwwETQP3FwAN16ompSNJOCyDCG6Ew1Bm5f_Fe1Lw@mail.gmail.com>
 <b6b58786-85c9-e831-5571-58b5580c84ba@virtuozzo.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 31 Jul 2018 18:08:54 +0200
Message-ID: <CACT4Y+aUs0YMTaQx4x9QiQsMjFNZ5gUFNuMkG_hneDPTb3Nu=Q@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] khwasan: add hooks implementation
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        vincenzo.frascino@arm.com, Alexander Potapenko <glider@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jann Horn <jannh@google.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Mark Brand <markbrand@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 31, 2018 at 6:04 PM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
>>>>>> @@ -325,18 +341,41 @@ void kasan_init_slab_obj(struct kmem_cache *cache,
>>>>>> const void *object)
>>>>>>     void *kasan_slab_alloc(struct kmem_cache *cache, void *object, gfp_t
>>>>>> flags)
>>>>>>   {
>>>>>> -       return kasan_kmalloc(cache, object, cache->object_size, flags);
>>>>>> +       object = kasan_kmalloc(cache, object, cache->object_size, flags);
>>>>>> +       if (IS_ENABLED(CONFIG_KASAN_HW) && unlikely(cache->ctor)) {
>>>>>> +               /*
>>>>>> +                * Cache constructor might use object's pointer value to
>>>>>> +                * initialize some of its fields.
>>>>>> +                */
>>>>>> +               cache->ctor(object);
>>>>>>
>>>>> This seams breaking the kmem_cache_create() contract: "The @ctor is run when
>>>>> new pages are allocated by the cache."
>>>>> (https://elixir.bootlin.com/linux/v3.7/source/mm/slab_common.c#L83)
>>>>>
>>>>> Since there might be preexisting code relying on it, this could lead to
>>>>> global side effects. Did you verify that this is not the case?
>>>>>
>>>>> Another concern is performance related if we consider this solution suitable
>>>>> for "near-production", since with the current implementation you call the
>>>>> ctor (where present) on an object multiple times and this ends up memsetting
>>>>> and repopulating the memory every time (i.e. inode.c: inode_init_once). Do
>>>>> you know what is the performance impact?
>>>>
>>>> We can assign tags to objects with constructors when a slab is
>>>> allocated and call constructors once as usual. The downside is that
>>>> such object would always have the same tag when it is reallocated, so
>>>> we won't catch use-after-frees.
>>>
>>> Actually you should do this for SLAB_TYPESAFE_BY_RCU slabs. Usually they are with ->ctors but there
>>> are few without constructors.
>>> We can't reinitialize or even retag them. The latter will definitely cause false-positive use-after-free reports.
>>
>> Somewhat offtopic, but I can't understand how SLAB_TYPESAFE_BY_RCU
>> slabs can be useful without ctors or at least memset(0). Objects in
>> such slabs need to be type-stable, but I can't understand how it's
>> possible to establish type stability without a ctor... Are these bugs?
>
> Yeah, I puzzled by this too. However, I think it's hard but possible to make it work, at least in theory.
> There must be an initializer, which consists of two parts:
> a) initilize objects fields
> b) expose object to the world (add it to list or something like that)
>
> (a) part must somehow to be ok to race with another cpu which might already use the object.
> (b) part must must use e.g. barriers to make sure that racy users will see previously inilized fields.
> Racy users must have parring barrier of course.
>
> But it sound fishy, and very easy to fuck up.


Agree on both fronts: theoretically possible but easy to fuck up. Even
if it works, complexity of the code should be brain damaging and there
are unlikely good reasons to just not be more explicit and use a ctor.


> I won't be surprised if every single one SLAB_TYPESAFE_BY_RCU user
> without ->ctor is bogus. It certainly would be better to convert those to use ->ctor.

I have another hypothesis: they are not bogus, just don't need
SLAB_TYPESAFE_BY_RCU :)


> Such caches seems used by networking subsystem in proto_register():
>
>                 prot->slab = kmem_cache_create_usercopy(prot->name,
>                                         prot->obj_size, 0,
>                                         SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT |
>                                         prot->slab_flags,
>                                         prot->useroffset, prot->usersize,
>                                         NULL);
>
> And certain protocols specify SLAB_TYPESAFE_BY_RCU in ->slab_flags, such as:
> llc_proto, smc_proto, smc_proto6, tcp_prot, tcpv6_prot, dccp_v6_prot, dccp_v4_prot.
>
>
> Also nf_conntrack_cachep, kernfs_node_cache, jbd2_journal_head_cache and i915_request cache.
>
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To post to this group, send email to kasan-dev@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/b6b58786-85c9-e831-5571-58b5580c84ba%40virtuozzo.com.
> For more options, visit https://groups.google.com/d/optout.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
