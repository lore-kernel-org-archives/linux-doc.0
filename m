Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AC0687D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Dec 2018 19:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbeLQTdz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Dec 2018 14:33:55 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41731 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387846AbeLQTdz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Dec 2018 14:33:55 -0500
Received: by mail-pf1-f193.google.com with SMTP id b7so6850930pfi.8
        for <linux-doc@vger.kernel.org>; Mon, 17 Dec 2018 11:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zqAJ7CpVrClj01fc/bQYKz6q7wMWGbGap3pF5MFiebg=;
        b=Vb6I7xDD+N84CKMrD7JqBKLThyRzVJstMpfI88sWi3C/amzPJqd++0eAjzjxfSGZ5p
         owoD9N9R8WxLP4KxFs670QbqMIUxys3LisKdvQQvPxDlpMliFOTnEFQQcf47kHzDZuIQ
         rERc8yBDh5MrMar07ymNZJvCxhAEKbYgH3GJqYmnBMcWQEg4r3NdJeEHc49AlzPM+U9F
         ln2jrtI/nxmIoBuaTB64cLW7lttBtPNESWQjnywIyeiO1IC0YaJcInXINJK4YTyrUT5k
         SKpUoB+RmGiwHonpgoXMWhSOjdhX8l4A0KPTOygwYVbEbsfq2kXKcJEDj4Ee9iYxXmeP
         x2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zqAJ7CpVrClj01fc/bQYKz6q7wMWGbGap3pF5MFiebg=;
        b=csaiRVxeoM8xB50Jn7JeuCoSZxP+2LjEP/xMG6/QwtHFHjaAcrE5i048LcJYyM70IQ
         7TwZBL+gMrBfpLjH6K7BRnZjvtmG4KYb3/Q41hQporyZWbS6NLMDvahODu3aTFzyJdkg
         QjQub6z5NueeqiMwgHEXZhDAAGRjdTVfvEO2HsXhzl8p8ihsvemIE1hJA1N1Wk937XlW
         UvBAAi/b8Upa+T20ea754ElC5j3djC426ySHWIo/i5mAZXM3wZBVi5tTTKEPVQcc5xFp
         Ez8MTgovGjy2ZOhdi1H37B/xXiZOEuuieevnCuUi1FHmD6KMRZuPhH5GTKMk9u8pwVSo
         h4rw==
X-Gm-Message-State: AA+aEWZuGOVFo6dgffi4FqSaSx1yqaoeltXNwkE96xydubeSPrSgQwII
        OCbKSkKy2VWfHHndUpRgW2Z/Nh9Mo4v7RMXQWRGm0Q==
X-Google-Smtp-Source: AFSGD/Xd0N9kSPdtbqHt/fg4ep3w/r7nr4OCd0w90Ake1b8L6P3PKf9tZwx1pfsuvpi4AzjAyra5gqpyLz3prTpDllI=
X-Received: by 2002:a63:7044:: with SMTP id a4mr12916378pgn.359.1545075233957;
 Mon, 17 Dec 2018 11:33:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1544099024.git.andreyknvl@google.com> <bda78069e3b8422039794050ddcb2d53d053ed41.1544099024.git.andreyknvl@google.com>
 <2bf7415e-2724-b3c3-9571-20c8b6d43b92@arm.com> <CAAeHK+xc6R_p26-tu--9W1L1PvUAFb70J23ByiEukKz3uVC3EQ@mail.gmail.com>
 <b99b331d-22ca-b9db-8677-4896c427ef10@arm.com>
In-Reply-To: <b99b331d-22ca-b9db-8677-4896c427ef10@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 17 Dec 2018 20:33:42 +0100
Message-ID: <CAAeHK+w2jppKbb26bBk6uP9ydZeHrtNc6b2CVv4xbvt6ecVooA@mail.gmail.com>
Subject: Re: [PATCH v13 19/25] kasan: add hooks implementation for tag-based mode
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
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
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vishwath Mohan <vishwath@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jann Horn <jannh@google.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Mark Brand <markbrand@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgenii Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 14, 2018 at 1:34 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> On 12/12/18 3:04 PM, Andrey Konovalov wrote:
> > On Tue, Dec 11, 2018 at 5:22 PM Vincenzo Frascino
> > <vincenzo.frascino@arm.com> wrote:
> >>
> >> Hi Andrey,
> >>
> >> On 06/12/2018 12:24, Andrey Konovalov wrote:
> >>> This commit adds tag-based KASAN specific hooks implementation and
> >>> adjusts common generic and tag-based KASAN ones.
> >>>
> >>> 1. When a new slab cache is created, tag-based KASAN rounds up the size of
> >>>    the objects in this cache to KASAN_SHADOW_SCALE_SIZE (== 16).
> >>>
> >>> 2. On each kmalloc tag-based KASAN generates a random tag, sets the shadow
> >>>    memory, that corresponds to this object to this tag, and embeds this
> >>>    tag value into the top byte of the returned pointer.
> >>>
> >>> 3. On each kfree tag-based KASAN poisons the shadow memory with a random
> >>>    tag to allow detection of use-after-free bugs.
> >>>
> >>> The rest of the logic of the hook implementation is very much similar to
> >>> the one provided by generic KASAN. Tag-based KASAN saves allocation and
> >>> free stack metadata to the slab object the same way generic KASAN does.
> >>>
> >>> Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> >>> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> >>> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> >>> ---
> >>>  mm/kasan/common.c | 116 ++++++++++++++++++++++++++++++++++++++--------
> >>>  mm/kasan/kasan.h  |   8 ++++
> >>>  mm/kasan/tags.c   |  48 +++++++++++++++++++
> >>>  3 files changed, 153 insertions(+), 19 deletions(-)
> >>>
> >>
> >>
> >> [...]
> >>
> >>> @@ -265,6 +290,8 @@ void kasan_cache_create(struct kmem_cache *cache, unsigned int *size,
> >>>               return;
> >>>       }
> >>>
> >>> +     cache->align = round_up(cache->align, KASAN_SHADOW_SCALE_SIZE);
> >>> +
> >>
> >> Did you consider to set ARCH_SLAB_MINALIGN instead of this round up?
> >
> > I didn't know about this macro. Looks like we can use it to do the
> > same thing. Do you think it's a better solution to redefine
> > ARCH_SLAB_MINALIGN to KASAN_SHADOW_SCALE_SIZE for arm64 when tag-based
> > KASAN is enabled instead of adjusting cache->align in
> > kasan_cache_create?
> >
>
> Yes, I think it is better because in this way we do not need to add extra code
> to do the rounding.
>
> Curiosity, did you try your patches with SLUB red zoning enabled?
> Since the area used for the Redzone is just after the payload, aligning the
> object_size independently from the allocator could have side effects, at least
> if I understand well how the mechanism works.
>
> Setting ARCH_SLAB_MINALIGN should avoid this as well.
>
> What do you think?

Sounds good to me.

Andrew, how should proceed with this? Send another fixup patch or
resend the whole series?

>
> >>
> >> --
> >> Regards,
> >> Vincenzo
> >>
> >> --
> >> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> >> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> >> To post to this group, send email to kasan-dev@googlegroups.com.
> >> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/2bf7415e-2724-b3c3-9571-20c8b6d43b92%40arm.com.
> >> For more options, visit https://groups.google.com/d/optout.
>
> --
> Regards,
> Vincenzo
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To post to this group, send email to kasan-dev@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/b99b331d-22ca-b9db-8677-4896c427ef10%40arm.com.
> For more options, visit https://groups.google.com/d/optout.
