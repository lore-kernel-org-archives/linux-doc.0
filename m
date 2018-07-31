Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C2887D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 13:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732136AbeGaOqQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 10:46:16 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:50823 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731961AbeGaOqQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jul 2018 10:46:16 -0400
Received: by mail-it0-f67.google.com with SMTP id g191-v6so4353578ita.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Jul 2018 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=KDgx1wu0S4s/fsoNbAILQ44BQFWBJhQa9o5lBqBhbsA=;
        b=QOQWySiUBOrjacnJ/0qrKicp9QAp0C7Zv8NRMdXSFPVOgRPlbrS8gNd7RgL6qlUlIj
         6Edog2HkYgSwovUnsQr3R6tdcWaZ6CMZOERKw/bmb15/wFIaFCBcmj6z8jkHux9rq87W
         AO6JyepCVfczcxK4BUkGChYkwGL58YRhMTG+GCY7pJ6Mjz2DlxjNL3eFfJ4sbUys8Pid
         zWWu3yP+QTS79xD9lQ2WPYNGLpo7l0LCi07KWKX9D9Ha6LTnh2DoSh08tdRfYvYMjqmC
         iOr2p9fMlVTF0Qu6djS0WqVPm5Dohd9sSqUco6niSssdghIxeO6QOgh2PUlh4M5UVEHI
         vsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=KDgx1wu0S4s/fsoNbAILQ44BQFWBJhQa9o5lBqBhbsA=;
        b=GgZzYB5/r3L2IZKGR+bnZlZZZDmTEsFHyEr/5MvOwgvZLA1WN51j9KpvYTOeXn3Jvd
         UVA20q7EhHqHJyQmPTef8NsU5y0ZSgTVqKcCmrvXHUNrXfZgFt/TF7NQ/mCYvU/2OI6z
         1vXpYMLfiKpYykzieNPUcZp1re4FUGzScowq4ocb+OGsShojHRhSYzcEdXn8ww4JjTes
         /sNaqA0DamXBtVMBREWi26Uiv/buIAZQCgYPjhbz7yNioFzwMeunT0GAAWeRSqrq1rGZ
         Vj4B/R/hlWXxsaANm9IXhKzWuQ4W4Exj55pys+1UI9Td8xhf/VHm8UHXoQBLH08OmZs9
         JlwQ==
X-Gm-Message-State: AOUpUlEC7a0lxsL626HB9ok3RTaKavkT7S6nE15DMNCWcxwPRa1pRGYz
        e8RKc+lwR0BZcyZSZ24srj80bINKFldq6DhcTpXzuA==
X-Google-Smtp-Source: AAOMgpeZr80M/FmFnLuElEuAGYI8x7OAsEcGWQDEiBDQKUU5ihxSenWvbznd9FPrqYswVUCn6u4AzvDQ097Hlxvkuqc=
X-Received: by 2002:a24:db05:: with SMTP id c5-v6mr3119100itg.44.1533042360087;
 Tue, 31 Jul 2018 06:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:918c:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 06:05:59
 -0700 (PDT)
In-Reply-To: <09cb5553-d84a-0e62-5174-315c14b88833@arm.com>
References: <cover.1530018818.git.andreyknvl@google.com> <a2a93370d43ec85b02abaf8d007a15b464212221.1530018818.git.andreyknvl@google.com>
 <09cb5553-d84a-0e62-5174-315c14b88833@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 31 Jul 2018 15:05:59 +0200
Message-ID: <CAAeHK+yC3XRPoTByhH1QPrX45pG3QY_2Q4gz=dfDgxfzu1Fyfw@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] khwasan: add hooks implementation
To:     vincenzo.frascino@arm.com
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
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

On Wed, Jul 25, 2018 at 3:44 PM, Vincenzo Frascino@Foss
<vincenzo.frascino@arm.com> wrote:
> On 06/26/2018 02:15 PM, Andrey Konovalov wrote:
>
>> @@ -325,18 +341,41 @@ void kasan_init_slab_obj(struct kmem_cache *cache,
>> const void *object)
>>     void *kasan_slab_alloc(struct kmem_cache *cache, void *object, gfp_t
>> flags)
>>   {
>> -       return kasan_kmalloc(cache, object, cache->object_size, flags);
>> +       object = kasan_kmalloc(cache, object, cache->object_size, flags);
>> +       if (IS_ENABLED(CONFIG_KASAN_HW) && unlikely(cache->ctor)) {
>> +               /*
>> +                * Cache constructor might use object's pointer value to
>> +                * initialize some of its fields.
>> +                */
>> +               cache->ctor(object);
>>
> This seams breaking the kmem_cache_create() contract: "The @ctor is run when
> new pages are allocated by the cache."
> (https://elixir.bootlin.com/linux/v3.7/source/mm/slab_common.c#L83)
>
> Since there might be preexisting code relying on it, this could lead to
> global side effects. Did you verify that this is not the case?
>
> Another concern is performance related if we consider this solution suitable
> for "near-production", since with the current implementation you call the
> ctor (where present) on an object multiple times and this ends up memsetting
> and repopulating the memory every time (i.e. inode.c: inode_init_once). Do
> you know what is the performance impact?

We can assign tags to objects with constructors when a slab is
allocated and call constructors once as usual. The downside is that
such object would always have the same tag when it is reallocated, so
we won't catch use-after-frees. But that is probably something we'll
have to deal with if we're aiming for "near-production". I'll add this
change to v5, thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
