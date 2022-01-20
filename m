Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0E0C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jan 2022 07:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359000AbiATHbC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jan 2022 02:31:02 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44408
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229804AbiATHbC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jan 2022 02:31:02 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 51A3040037
        for <linux-doc@vger.kernel.org>; Thu, 20 Jan 2022 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642663856;
        bh=dCQXkZtZ/VwDrAN2uVWBP6tsU2v5k0SPHuefqy0UyIg=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=gfc8qzhGG4cAMfAfpN+tW9b5XcT3xgtfLkq34S0L3UH/pc+AbJVZVyEbw61ssOdVq
         kbF9WJoL7Rr1/yQVY3nxLPW/QFdKUaWoub1zeGh9w+WAGpc15yAwDJgisT6cNg1YIl
         aSpXIj1uCkv8movIP/WPJAFhiuERWoO4jqdLRMZFF6KtKTwWLXak05S490D6W5qIWS
         BxXoJGO68Nzm2yFOt+VbgAaqkDeXu5bYIR6u0Wpshnty7WWYcDmKR38yQ0+lP5vhFN
         6+pUgVskZTicJjC6SXuWs08jqNU0VrdTTmgaHTyfrKIm1fT9YB4XGYReuCpByqAHzh
         xg59UA+GP4SUg==
Received: by mail-ed1-f70.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso5054097edb.16
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 23:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCQXkZtZ/VwDrAN2uVWBP6tsU2v5k0SPHuefqy0UyIg=;
        b=sMIZUsceM2aTSNGJlI2dFvUx/JibNrZeJY6JuVdeZGTJGBFz1a34qftg+dZgZh/mr0
         LIh2J7CkfBGWKiCmfPZPvc8KOSgAKn4O6wKNKqlxhHiY2Y5D8jHOUwzeNIWpzSrQ1zWq
         3e+bHYnt+nuJH8HJQ7wFoebOtQjw4raP0TmB77U5ZOkGYOVPqh65FjjphClGvlX/UIV7
         pUtvoF5dGOCwP5MMCYgC93pWZxLblkJO/Oin9BClyvnXoXHnsNUES/BGtpoIeruZATEF
         tRwN49E9d7VFGBpBadwz4SwvXhqOu6rw5fVW1Kc/EH19R7W/N285SZcHY8eIakLWgIAh
         5E9A==
X-Gm-Message-State: AOAM530URpAnAdx82JykPYj+4lrWy5HdE+lK0cQfntGXCITTPzg98XeQ
        U6CvTj6r9IJfWnzS6ksdRAp2h4QJrQD+gHGIyrZxbV72O7J/eIMaYnWh8ZPFXtWB41yj19uODAv
        OXVUpskj7AX80Vwcow4QJVTE4/ytpc0wKrJM/SHO7KRbHhE9dLk84Nw==
X-Received: by 2002:a05:6402:268a:: with SMTP id w10mr35311106edd.10.1642663855555;
        Wed, 19 Jan 2022 23:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx4lfTfUx4Ph9cNei39h0hiDJe+PmE9RqL0dDaj6MBDX4YqPidVFEEVr4D9rAfOlQrUSsuyrh6JKI5CmG9NuI=
X-Received: by 2002:a05:6402:268a:: with SMTP id w10mr35311082edd.10.1642663855317;
 Wed, 19 Jan 2022 23:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com> <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
In-Reply-To: <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date:   Thu, 20 Jan 2022 08:30:43 +0100
Message-ID: <CA+zEjCuTSjOCmNExSN1jO50tsuXNzL9x6K6jWjG4+vVky5eWsw@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, zong.li@sifive.com, anup@brainfault.org,
        Atish.Patra@rivosinc.com, Christoph Hellwig <hch@lst.de>,
        ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
        dvyukov@google.com, ardb@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        keescook@chromium.org, guoren@linux.alibaba.com,
        heinrich.schuchardt@canonical.com, mchitale@ventanamicro.com,
        panqinglin2020@iscas.ac.cn, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 20, 2022 at 5:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
> > * Please note notable changes in memory layouts and kasan population *
> >
> > This patchset allows to have a single kernel for sv39 and sv48 without
> > being relocatable.
> >
> > The idea comes from Arnd Bergmann who suggested to do the same as x86,
> > that is mapping the kernel to the end of the address space, which allows
> > the kernel to be linked at the same address for both sv39 and sv48 and
> > then does not require to be relocated at runtime.
> >
> > This implements sv48 support at runtime. The kernel will try to
> > boot with 4-level page table and will fallback to 3-level if the HW does not
> > support it. Folding the 4th level into a 3-level page table has almost no
> > cost at runtime.
> >
> > Note that kasan region had to be moved to the end of the address space
> > since its location must be known at compile-time and then be valid for
> > both sv39 and sv48 (and sv57 that is coming).
> >
> > Tested on:
> >   - qemu rv64 sv39: OK
> >   - qemu rv64 sv48: OK
> >   - qemu rv64 sv39 + kasan: OK
> >   - qemu rv64 sv48 + kasan: OK
> >   - qemu rv32: OK
> >
> > Changes in v3:
> >   - Fix SZ_1T, thanks to Atish
> >   - Fix warning create_pud_mapping, thanks to Atish
> >   - Fix k210 nommu build, thanks to Atish
> >   - Fix wrong rebase as noted by Samuel
> >   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
> >   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
> >
> > Changes in v2:
> >   - Rebase onto for-next
> >   - Fix KASAN
> >   - Fix stack canary
> >   - Get completely rid of MAXPHYSMEM configs
> >   - Add documentation
> >
> > Alexandre Ghiti (13):
> >   riscv: Move KASAN mapping next to the kernel mapping
> >   riscv: Split early kasan mapping to prepare sv48 introduction
> >   riscv: Introduce functions to switch pt_ops
> >   riscv: Allow to dynamically define VA_BITS
> >   riscv: Get rid of MAXPHYSMEM configs
> >   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
> >   riscv: Implement sv48 support
> >   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
> >   riscv: Explicit comment about user virtual address space size
> >   riscv: Improve virtual kernel memory layout dump
> >   Documentation: riscv: Add sv48 description to VM layout
> >   riscv: Initialize thread pointer before calling C functions
> >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
> >
> >  Documentation/riscv/vm-layout.rst             |  48 ++-
> >  arch/riscv/Kconfig                            |  37 +-
> >  arch/riscv/configs/nommu_k210_defconfig       |   1 -
> >  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
> >  arch/riscv/configs/nommu_virt_defconfig       |   1 -
> >  arch/riscv/include/asm/csr.h                  |   3 +-
> >  arch/riscv/include/asm/fixmap.h               |   1
> >  arch/riscv/include/asm/kasan.h                |  11 +-
> >  arch/riscv/include/asm/page.h                 |  20 +-
> >  arch/riscv/include/asm/pgalloc.h              |  40 ++
> >  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
> >  arch/riscv/include/asm/pgtable.h              |  47 +-
> >  arch/riscv/include/asm/sparsemem.h            |   6 +-
> >  arch/riscv/kernel/cpu.c                       |  23 +-
> >  arch/riscv/kernel/head.S                      |   4 +-
> >  arch/riscv/mm/context.c                       |   4 +-
> >  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
> >  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
> >  drivers/firmware/efi/libstub/efi-stub.c       |   2
> >  drivers/pci/controller/pci-xgene.c            |   2 +-
> >  include/asm-generic/pgalloc.h                 |  24 +-
> >  include/linux/sizes.h                         |   1
> >  22 files changed, 833 insertions(+), 209 deletions(-)
>
> Sorry this took a while.  This is on for-next, with a bit of juggling: a
> handful of trivial fixes for configs that were failing to build/boot and
> some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so
> it'd be easier to backport.  This is bigger than something I'd normally like to
> take late in the cycle, but given there's a lot of cleanups, likely some fixes,
> and it looks like folks have been testing this I'm just going to go with it.
>

Yes yes yes! That's fantastic news :)

> Let me know if there's any issues with the merge, it was a bit hairy.
> Probably best to just send along a fixup patch at this point.

I'm going to take a look at that now, and I'll fix anything that comes
up quickly :)

Thanks!

Alex

>
> Thanks!
