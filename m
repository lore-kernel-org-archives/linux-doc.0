Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D780D7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 15:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732413AbeGaQoy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 12:44:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39041 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbeGaQox (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jul 2018 12:44:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id j8-v6so6244537pff.6
        for <linux-doc@vger.kernel.org>; Tue, 31 Jul 2018 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hxKwoqPx+1v6QE4Wii7+9bEFKhtnRYZZMZ0YRW09gbw=;
        b=G0AnkvIlSl+p3X1Kd4p4zsGfzPma6opgB7tPaIPB/12olRSkjplGAua8uKPCCe6Yw1
         jgFoJ4L2+gqX3N+qmRopgkfRzzxe9kWOgg4GcRGD7lLGfNjjoGEkpQnBaHvCN1H052l/
         Q5Q/iL933M/AGNUbxGYo85kn4EtTpZLADYQpUXpZqXRzvUo8mdFBGPcOtfOGqTTuuJcj
         L6jFczWCtRem96i4CYUJnjZPoVuzReLi9gYbpwiABPP2up717sqgF0h8utSoWf2SRKLo
         I8CMD1EiOZ6n+AtzVuRIcxKgjwyRwxe2MwDddT1jhlfuEhL5jyr0htxEPQ/bqvQJG3in
         +sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hxKwoqPx+1v6QE4Wii7+9bEFKhtnRYZZMZ0YRW09gbw=;
        b=G0RntxCdFK1q6bvLWrYVC1clqRBoGxjZEilsG5iJmvpcnetl7XJGP2loXAH3znqn6V
         asRkT2RxOY1Nrishd3U4g17PveVIzBjsYN6yayPUOlEy3zxzSOOKQa3wPWt4WFJP7CTS
         cQBFNkU1zqfePy0uVmk6rONNr9ARkezMG+Yqm8b5iGQWu9SxFNlGQB2JtSDlV4/87YOu
         Az0ldW9oFxR1WV+qKRm88oGNYpx669DgPpGlWtBLL59++FSEALm7tKGAiIaj6wd2cfR/
         tW/63Z1hjnKZqAM+fkPGOlq7nBftV0faP7ciiel15w7kG2VRiUUwdMQzWrN/uX2dryku
         9A2Q==
X-Gm-Message-State: AOUpUlHGvy2qVqWyvdC4NdfhZKaGo4ojKX8OdYPnlgWCMkcfe2Mp/1FB
        0RwCCXukf+OY6A6oYUU82r7mJt5AlvCUZTCdiuCT2Q==
X-Google-Smtp-Source: AAOMgpfX2rKg6qPDXuOihxkuXD/0MtFBCejAtISvp6kAyv1WiNpiBp6hkkWri1JqyfUluPUQCFADPSKwol7XdDeJckw=
X-Received: by 2002:a63:743:: with SMTP id 64-v6mr21432509pgh.216.1533049448980;
 Tue, 31 Jul 2018 08:04:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:ac14:0:0:0:0 with HTTP; Tue, 31 Jul 2018 08:03:48
 -0700 (PDT)
In-Reply-To: <8240d4f9-c8df-cfe9-119d-6e933f8b13df@virtuozzo.com>
References: <cover.1530018818.git.andreyknvl@google.com> <a2a93370d43ec85b02abaf8d007a15b464212221.1530018818.git.andreyknvl@google.com>
 <09cb5553-d84a-0e62-5174-315c14b88833@arm.com> <CAAeHK+yC3XRPoTByhH1QPrX45pG3QY_2Q4gz=dfDgxfzu1Fyfw@mail.gmail.com>
 <8240d4f9-c8df-cfe9-119d-6e933f8b13df@virtuozzo.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 31 Jul 2018 17:03:48 +0200
Message-ID: <CACT4Y+Y=61VwwETQP3FwAN16ompSNJOCyDCG6Ew1Bm5f_Fe1Lw@mail.gmail.com>
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

On Tue, Jul 31, 2018 at 4:50 PM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
>
>
> On 07/31/2018 04:05 PM, Andrey Konovalov wrote:
>> On Wed, Jul 25, 2018 at 3:44 PM, Vincenzo Frascino@Foss
>> <vincenzo.frascino@arm.com> wrote:
>>> On 06/26/2018 02:15 PM, Andrey Konovalov wrote:
>>>
>>>> @@ -325,18 +341,41 @@ void kasan_init_slab_obj(struct kmem_cache *cache,
>>>> const void *object)
>>>>     void *kasan_slab_alloc(struct kmem_cache *cache, void *object, gfp_t
>>>> flags)
>>>>   {
>>>> -       return kasan_kmalloc(cache, object, cache->object_size, flags);
>>>> +       object = kasan_kmalloc(cache, object, cache->object_size, flags);
>>>> +       if (IS_ENABLED(CONFIG_KASAN_HW) && unlikely(cache->ctor)) {
>>>> +               /*
>>>> +                * Cache constructor might use object's pointer value to
>>>> +                * initialize some of its fields.
>>>> +                */
>>>> +               cache->ctor(object);
>>>>
>>> This seams breaking the kmem_cache_create() contract: "The @ctor is run when
>>> new pages are allocated by the cache."
>>> (https://elixir.bootlin.com/linux/v3.7/source/mm/slab_common.c#L83)
>>>
>>> Since there might be preexisting code relying on it, this could lead to
>>> global side effects. Did you verify that this is not the case?
>>>
>>> Another concern is performance related if we consider this solution suitable
>>> for "near-production", since with the current implementation you call the
>>> ctor (where present) on an object multiple times and this ends up memsetting
>>> and repopulating the memory every time (i.e. inode.c: inode_init_once). Do
>>> you know what is the performance impact?
>>
>> We can assign tags to objects with constructors when a slab is
>> allocated and call constructors once as usual. The downside is that
>> such object would always have the same tag when it is reallocated, so
>> we won't catch use-after-frees.
>
> Actually you should do this for SLAB_TYPESAFE_BY_RCU slabs. Usually they are with ->ctors but there
> are few without constructors.
> We can't reinitialize or even retag them. The latter will definitely cause false-positive use-after-free reports.

Somewhat offtopic, but I can't understand how SLAB_TYPESAFE_BY_RCU
slabs can be useful without ctors or at least memset(0). Objects in
such slabs need to be type-stable, but I can't understand how it's
possible to establish type stability without a ctor... Are these bugs?
Or I am missing something subtle? What would be a canonical usage of
SLAB_TYPESAFE_BY_RCU slab without a ctor?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
