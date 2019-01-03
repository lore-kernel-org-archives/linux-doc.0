Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B12977D8A3
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 18:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbfACSqh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 13:46:37 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39716 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfACSqc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Jan 2019 13:46:32 -0500
Received: by mail-pf1-f195.google.com with SMTP id r136so17066917pfc.6
        for <linux-doc@vger.kernel.org>; Thu, 03 Jan 2019 10:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgzV5dTndps76ADDi/niLj9jnEoksetg/kN5EQSE/zM=;
        b=GoUxsewUnTYsCM77AWfGlQfTgMINGlA35HpX38hrx1dskXw4mI65zWLT8zB5BYj6e8
         dWsAYaoSKabJNGNo9wQ7kiRDOy+0ey1nWiWJLIWcYQN0z+K9h3DYz2J59oKlX+nzSTTa
         aT57NflI4m5PdSfbXZIhK5emMEoGtqL0F3zjVt4kHv7srAa90A8KpUyo/X4pRSfnHe45
         mAT04CkeOtEEc/W2zJ2MdjjmkeoXPYwO94z4+bpJzerWLi7x1dNRRviz0FSvXA89Biog
         sYyO53jbmfC2HT0on1mg+NJMYZHuZQNJAPTRUv2ZWXjRpBcxKkAu8FFYEp88Z0s/Fqyd
         5EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MgzV5dTndps76ADDi/niLj9jnEoksetg/kN5EQSE/zM=;
        b=uj5EQbL8X8u0Ert/Z83zYT3xv3khHLuAC/gAkXPCp3rCAy94oY5oD9yWLbqjeCNMKj
         hxhvCKmUf8/roT/gjN5yYaZSVj+IVA/KdJZDN32uRelYqosIy440LJVEtnJPZGRK/7hC
         1N1K/64MUaG3OvEG5UzDpFJ3ocvlp3M9VM+dr3yCsETbm6u/gSMuf5Bspclv+c4hQdBW
         Aaijgd32zS6aAVu8MfLq+WTAMf5S6ZUu/YBoZ0yiDFPuIo9dPqNaZ13A89ZNKUomqN2v
         AGPy+8jXQuzQ0SRs/zrwSoeTG5+/GsDkT3BFRT9eJXhTYDYUWDLrwtuYx2TKJ69D6nOE
         h/mQ==
X-Gm-Message-State: AJcUukcwoP/7dzhSaMHMidM5hthEHXK+1bBZMLWnFM1y5aEF5zWxEFlK
        j1xnLgaU44T1GU0gNJvTmZhSrmoSD9/Mk+qXVUwwuw==
X-Google-Smtp-Source: ALg8bN5SinAEs0gYR2nS6mwrBbNs6CaZLdp3j4CHwOgZ9jildDr4wOzb2uxGWuD9JrGMv17tlykPD+ZozUjLDh+fs1c=
X-Received: by 2002:a65:560e:: with SMTP id l14mr18036989pgs.168.1546541191326;
 Thu, 03 Jan 2019 10:46:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546450432.git.andreyknvl@google.com> <b16c90197bb2c06c780e6e981c40345e03fda465.1546450432.git.andreyknvl@google.com>
 <20190102121436.5c2b72d1b0ec49affadc9692@linux-foundation.org>
In-Reply-To: <20190102121436.5c2b72d1b0ec49affadc9692@linux-foundation.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 3 Jan 2019 19:46:20 +0100
Message-ID: <CAAeHK+yE38g0dSbL7LiVPSgECgdcJ5w7+kwaiBaRYr5YkHtbjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kasan, arm64: use ARCH_SLAB_MINALIGN instead of
 manual aligning
To:     Andrew Morton <akpm@linux-foundation.org>
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
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Wed, Jan 2, 2019 at 9:14 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed,  2 Jan 2019 18:36:06 +0100 Andrey Konovalov <andreyknvl@google.com> wrote:
>
> > Instead of changing cache->align to be aligned to KASAN_SHADOW_SCALE_SIZE
> > in kasan_cache_create() we can reuse the ARCH_SLAB_MINALIGN macro.
> >
> > ...
> >
> > --- a/arch/arm64/include/asm/kasan.h
> > +++ b/arch/arm64/include/asm/kasan.h
> > @@ -36,6 +36,10 @@
> >  #define KASAN_SHADOW_OFFSET     (KASAN_SHADOW_END - (1ULL << \
> >                                       (64 - KASAN_SHADOW_SCALE_SHIFT)))
> >
> > +#ifdef CONFIG_KASAN_SW_TAGS
> > +#define ARCH_SLAB_MINALIGN   (1ULL << KASAN_SHADOW_SCALE_SHIFT)
> > +#endif
> > +
> >  void kasan_init(void);
> >  void kasan_copy_shadow(pgd_t *pgdir);
> >  asmlinkage void kasan_early_init(void);
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 11b45f7ae405..d87f913ab4e8 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -16,6 +16,7 @@
> >  #include <linux/overflow.h>
> >  #include <linux/types.h>
> >  #include <linux/workqueue.h>
> > +#include <linux/kasan.h>
> >
>
> This still seems unadvisable.  Like other architectures, arm defines
> ARCH_SLAB_MINALIGN in arch/arm/include/asm/cache.h.
> arch/arm/include/asm64/cache.h doesn't define ARCH_SLAB_MINALIGN
> afaict.
>
> If arch/arm/include/asm64/cache.h later gets a definition of
> ARCH_SLAB_MINALIGN then we again face the risk that different .c files
> will see different values of ARCH_SLAB_MINALIGN depending on which
> headers they include.
>
> So what to say about this?  The architecture's ARCH_SLAB_MINALIGN
> should be defined in the architecture's cache.h, end of story.  Not in
> slab.h, not in kasan.h.

Done in v3, thanks!

>
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To post to this group, send email to kasan-dev@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20190102121436.5c2b72d1b0ec49affadc9692%40linux-foundation.org.
> For more options, visit https://groups.google.com/d/optout.
