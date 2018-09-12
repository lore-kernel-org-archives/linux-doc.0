Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 697E27D87A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 16:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbeILVls (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 17:41:48 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:37662 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbeILVls (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 17:41:48 -0400
Received: by mail-it0-f68.google.com with SMTP id h20-v6so3904177itf.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZT8CzlZT9rH8Vyz5ptHr1FY85SEOd/w6geL+EGPPC1g=;
        b=qsKe6Y3MMCX3Dl0OtsKPP6gVk0/Z895gKfui6FFHkNz7NyMXvWlsfERMGlQVzhEn2x
         KEtK0YiqSoq9KUy8roYhn4eHft258hH6jXKJ78QCft9BLu0dah9zfeyCG+dCLVgzGxFz
         L2EocPMpc/V+rmIiX2vtBSXaW8cMRgSaRx3urDmP+hnDOSxfVaJjACYXsx72YCLMl9ht
         v4tgz4y7GgC3eHeRtU/QV5znnv1n3TaNjBY12/EtDR1gpgED/5zhooHFncFhwzN+NIPM
         4T937JAzEd5N+T9eds34layIxEs0Hto49ire4cIOwTiqoSrfmAV8cGrsgkcB2giSMZs6
         ZwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ZT8CzlZT9rH8Vyz5ptHr1FY85SEOd/w6geL+EGPPC1g=;
        b=B0HqcMW1ch7+TcRMR3Q9ZnVURGun7rv1zcTTitJfyafWRjockJaLxGFkGAxWm8JkV5
         FmbVC2NWMN2uPsUwNuj9It/v7pKEh4ACb8uF1Z5u0RGPPeJ8dnW8NEEsdkbmE05agZv5
         42nhISvGUr9N8fMM8sZuIY5KtqAIcwvqSb88MfvcDAzxdX6xv2FuJ1sbaxte+0kmrBNB
         a7RrhaznptppZH+8NVPwVYa1GWkkXuTVi92XVqVnpco1JmQZgn/onQBLCunkDNDbqEde
         P6FUCad3M5QZ1MeCQuU6g0xFXsp5GzTnU7S8SN97NKjYBPI8NLrZ4PsSIXYoML3S5t7S
         HnMQ==
X-Gm-Message-State: APzg51BA3vU/eqVLWhGX1CT9aQiqDLvPIFKbHtr+zniqdzkBApu2zG9Q
        nzyuPxkstOPq+j4FiAaMcVdl90Wke2yM9fUzOW/8hg==
X-Google-Smtp-Source: ANB0VdaDKMIQO7l5DHcvs00Oi3bSOnpy/pKRgpQjs4QibKyA5N0ZuY2T6xiwdFUCWRrnQKLhrKFxU0EkZW7XearSfUI=
X-Received: by 2002:a24:140f:: with SMTP id 15-v6mr2833566itg.57.1536770188606;
 Wed, 12 Sep 2018 09:36:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:5942:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 09:36:08
 -0700 (PDT)
In-Reply-To: <95b5beb7ec13b7e998efe84c9a7a5c1fa49a9fe3.1535462971.git.andreyknvl@google.com>
References: <cover.1535462971.git.andreyknvl@google.com> <95b5beb7ec13b7e998efe84c9a7a5c1fa49a9fe3.1535462971.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 12 Sep 2018 18:36:08 +0200
Message-ID: <CACT4Y+awX48sFAYFCgx1Q-nJ=QrBhr08psMmHr+hDeCsQc0NRw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] khwasan: preassign tags to objects with ctors or SLAB_TYPESAFE_BY_RCU
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
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
        linux-sparse@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> An object constructor can initialize pointers within this objects based on
> the address of the object. Since the object address might be tagged, we
> need to assign a tag before calling constructor.
>
> The implemented approach is to assign tags to objects with constructors
> when a slab is allocated and call constructors once as usual. The
> downside is that such object would always have the same tag when it is
> reallocated, so we won't catch use-after-frees on it.
>
> Also pressign tags for objects from SLAB_TYPESAFE_BY_RCU caches, since
> they can be validy accessed after having been freed.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  mm/slab.c | 6 +++++-
>  mm/slub.c | 4 ++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/mm/slab.c b/mm/slab.c
> index 6fdca9ec2ea4..3b4227059f2e 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -403,7 +403,11 @@ static inline struct kmem_cache *virt_to_cache(const void *obj)
>  static inline void *index_to_obj(struct kmem_cache *cache, struct page *page,
>                                  unsigned int idx)
>  {
> -       return page->s_mem + cache->size * idx;
> +       void *obj;
> +
> +       obj = page->s_mem + cache->size * idx;
> +       obj = khwasan_preset_slab_tag(cache, idx, obj);
> +       return obj;
>  }
>
>  /*
> diff --git a/mm/slub.c b/mm/slub.c
> index 4206e1b616e7..086d6558a6b6 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1531,12 +1531,14 @@ static bool shuffle_freelist(struct kmem_cache *s, struct page *page)
>         /* First entry is used as the base of the freelist */
>         cur = next_freelist_entry(s, page, &pos, start, page_limit,
>                                 freelist_count);
> +       cur = khwasan_preset_slub_tag(s, cur);
>         page->freelist = cur;
>
>         for (idx = 1; idx < page->objects; idx++) {
>                 setup_object(s, page, cur);
>                 next = next_freelist_entry(s, page, &pos, start, page_limit,
>                         freelist_count);
> +               next = khwasan_preset_slub_tag(s, next);
>                 set_freepointer(s, cur, next);
>                 cur = next;
>         }
> @@ -1613,8 +1615,10 @@ static struct page *allocate_slab(struct kmem_cache *s, gfp_t flags, int node)
>         shuffle = shuffle_freelist(s, page);
>
>         if (!shuffle) {
> +               start = khwasan_preset_slub_tag(s, start);
>                 for_each_object_idx(p, idx, s, start, page->objects) {
>                         setup_object(s, page, p);
> +                       p = khwasan_preset_slub_tag(s, p);


As I commented in the previous patch, can't we do this in
kasan_init_slab_obj(), which should be called in all the right places
already?


>                         if (likely(idx < page->objects))
>                                 set_freepointer(s, p, p + s->size);
>                         else
> --
> 2.19.0.rc0.228.g281dcd1b4d0-goog
>
