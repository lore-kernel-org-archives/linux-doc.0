Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83F1EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 15:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjFWPYh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 11:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbjFWPYg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 11:24:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D961AC
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 08:24:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 456D961A87
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA7BC433C9
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687533873;
        bh=KfXm6tTJhODS7gyQD8Ya8nQ2zJh7Xdkt7jfiwOjoihg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kEvlMREtimpQZ6kPESSSAlO8hVNOR936SMUObASI5ZfJPxdbG0AgnIyXX7tn/Ywa0
         49EtHsY9EVDBpPRrK954f9YHCRcf0lnnisU4QLFxXpurPfUFtMAGFKaPvacol0CSMY
         yhvAPRBExBm6QSM8t5zQfNim3oRmQ1CXiZQUFwg5rJZDZGIvTx3DKwFTmFj524vC//
         NBk/PwG4GpTs06qirCq9nNZQTRB8z0sEnCvmqPkCqDhsgMszVQIVu4gRvNgK0IuUj5
         xX96mR4ONJxDxVHWAMPLCCZMqUcG+GET1M02PpHTMNNZkwZSt/OEM77aLeJ9nj1VRk
         4HKG4zOAvFbZQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so1045713e87.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 08:24:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDwc7fP1GP8rUwCGPnd/+Koa5uhDnDeDLveBU3QgC51QZFdAZucd
        FolyVxfg+gp2ZQ3BiXKq8FKc4aTIfe2D6zjXvKw=
X-Google-Smtp-Source: ACHHUZ7K6D0oVUXViftTBY71FN3Y6erdX8EkLlUqMi8QERee21og7zh/yjM1zMMqbuc7Xz2au1VAqGQbITrefF6jgGg=
X-Received: by 2002:a05:6512:39ca:b0:4f9:6581:8b47 with SMTP id
 k10-20020a05651239ca00b004f965818b47mr3803839lfu.66.1687533871669; Fri, 23
 Jun 2023 08:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk> <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk>
In-Reply-To: <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 23 Jun 2023 17:24:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHn0oho_CZMSc5N1updfdZDq+3VAfzw8kZqzzpTSgkXew@mail.gmail.com>
Message-ID: <CAMj1kXHn0oho_CZMSc5N1updfdZDq+3VAfzw8kZqzzpTSgkXew@mail.gmail.com>
Subject: Re: [PATCH RFC 00/17] arm64 kernel text replication
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Quentin Perret <qperret@google.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

(cc Marc and Quentin)

On Mon, 5 Jun 2023 at 11:05, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Hi,
>
> Are there any comments on this?
>

Hi Russell,

I think the proposed approach is sound, but it is rather intrusive, as
you've pointed out already (wrt KASLR and KASAN etc). And once my LPA2
work gets merged (which uses root level -1 when booted on LPA2 capable
hardware, and level 0 otherwise), we'll have yet another combination
that is either fully incompatible, or cumbersome to support at the
very least.

I wonder if it would be worthwhile to explore an alternative approach,
using pKVM and the host stage2:

- all stage1 kernel mappings remain as they are, and the kernel code
running at EL1 has no awareness of the replication beyond being
involved in allocating the memory;
- host is booted in protected KVM mode, which means that the host
kernel executes under a stage 2 mapping;
- each NUMA node has its own set of stage 2 page tables, and maps the
kernel's code/rodata IPA range to a NUMA local PA range
- the kernel's code and rodata are mapped read-only in the primary
stage-2 mapping so updates trap to EL2, permitting the hypervisor to
replicate those update to all clones.

Note that pKVM retains the capabilities of ordinary KVM, so as long as
you boot at EL2, the only downside compared to your approach would be
the increased TLB footprint due to the stage 2 mappings for the host
kernel.

Marc, Quentin, Will: any thoughts?



>
> On Tue, May 30, 2023 at 03:04:01PM +0100, Russell King (Oracle) wrote:
> > Problem
> > -------
> >
> > NUMA systems have greater latency when accessing data and instructions
> > across nodes, which can lead to a reduction in performance on CPU cores
> > that mainly perform accesses beyond their local node.
> >
> > Normally when an ARM64 system boots, the kernel will end up placed in
> > memory, and each CPU core will have to fetch instructions and data from
> > which ever NUMA node the kernel has been placed. This means that while
> > executing kernel code, CPUs local to that node will run faster than
> > CPUs in remote nodes.
> >
> > The higher the latency to access remote NUMA node memory, the more the
> > kernel performance suffers on those nodes.
> >
> > If there is a local copy of the kernel text in each node's RAM, and
> > each node runs the kernel using its local copy of the kernel text,
> > then it stands to reason that the kernel will run faster due to fewer
> > stalls while instructions are fetched from remote memory.
> >
> > The question then arises how to achieve this.
> >
> > Background
> > ----------
> >
> > An important issue to contend with is what happens when a thread
> > migrates between nodes. Essentially, the thread's state (including
> > instruction pointer) is saved to memory, and the scheduler on that CPU
> > loads some other thread's state and that CPU resumes executing that
> > new thread.
> >
> > The CPU gaining the migrating thread loads the saved state, again
> > including the instruction pointer, and the gaining CPU resumes fetching
> > instructions at the virtual address where the original CPU left off.
> >
> > The key point is that the virtual address is what matters here, and
> > this gives us a way to implement kernel text replication fairly easily.
> > At a practical level, all we need to do is to ensure that the virtual
> > addresses which contain the kernel text point to a local copy of the
> > that text.
> >
> > This is exactly how this proposal of kernel text replication achieves
> > the replication. We can go a little bit further and include most of
> > the read-only data in this replication, as that will never be written
> > to by the kernel (and thus remains constant.)
> >
> > Solution
> > --------
> >
> > So, what we need to achieve is:
> >
> > 1. multiple identical copies of the kernel text (and read-only data)
> > 2. point the virtual mappings to the appropriate copy of kernel text
> >    for the NUMA node.
> >
> > (1) is fairly easy to achieve - we just need to allocate some memory
> > in the appropriate node and copy the parts of the kernel we want to
> > replicate. However, we also need to deal with ARM64's kernel patching.
> > There are two functions that patch the kernel text,
> > __apply_alternatives() and aarch64_insn_patch_text_nosync(). Both of
> > these need to to be modified to update all copies of the kernel text.
> >
> > (2) is slightly harder.
> >
> > Firstly, the aarch64 architecture has a very useful feature here - the
> > kernel page tables are entirely separate from the user page tables.
> > The hardware contains two page table pointers, one is used for user
> > mappings, the other is used for kernel mappings.
> >
> > Therefore, we only have one page table to be concerned with: the table
> > which maps kernel space. We do not need to be concerned with each
> > user processes page table.
> >
> > The approach taken here is to ensure that the kernel is located in an
> > area of kernel virtual address space covered by a level-0 page table
> > entry which is not shared with any other user. We can then maintain
> > separate per-node level-0 page tables for kernel space where the only
> > difference between them is this level-0 page table entry.
> >
> > This gives a couple of benefits. Firstly, when updates to the level-0
> > page table happen (e.g. when establishing new mappings) these updates
> > can simply be copied to the other level-0 page tables provided it isn't
> > for the kernel image. Secondly, we don't need complexity at lower
> > levels of the page table code to figure out whether a level-1 or lower
> > update needs to be propagated to other nodes.
> >
> > The level-0 page table entry for the kernel can then be used to point
> > at a node-unique set of level 1..N page tables to make the appropriate
> > copy of the kernel text (and read-only data) into kernel space, while
> > keeping the kernel read-write data shared between nodes.
> >
> > Performance Analysis
> > --------------------
> >
> > Needless to say, the performance results from kernel text replication
> > are workload specific, but appear to show a gain of between 6% and
> > 17% for database-centric like workloads. When combined with userspace
> > awareness of NUMA, this can result in a gain of over 50%.
> >
> > Problems
> > --------
> >
> > There are a few areas that are a problem for kernel text replication:
> > 1) As this series changes the kernel space virtual address space
> >    layout, it breaks KASAN - and I've zero knowledge of KASAN so I
> >    have no idea how to fix it. I would be grateful for input from
> >    KASAN folk for suggestions how to fix this.
> >
> > 2) KASLR can not be used with kernel text replication, since we need
> >    to place the kernel in its own L0 page table entry, not in vmalloc
> >    space. KASLR is disabled when support for kernel text replication
> >    is enabled.
> >
> > 3) Changing the kernel virtual address space layout also means that
> >    kaslr_offset() and kaslr_enabled() need to become macros rather
> >    than inline functions due to the use of PGDIR_SIZE in the
> >    calculation of KIMAGE_VADDR. Since asm/pgtable.h defines this
> >    constant, but asm/memory.h is included by asm/pgtable.h, having
> >    this symbol available would produce a circular include
> >    dependency, so I don't think there is any choice here.
> >
> > 4) read-only protection for replicated kernel images is not yet
> >    implemented.
> >
> > Patch overview:
> >
> > Patch 1 cleans up the rox page protection logic.
> > Patch 2 reoganises the kernel virtual address space layout (causing
> >   problems (1 and 3).
> > Patch 3 provides a version of cpu_replace_ttbr1 that takes physical
> >   addresses.
> > Patch 4 makes a needed cache flushing function visible.
> > Patch 5 through 16 are the guts of kernel text replication.
> > Patch 17 adds the Kconfig entry for it.
> >
> > Further patches not included in this set add a Kconfig for the default
> > state, a test module, and add code to verify the replicated kernel
> > text matches the node 0 text after the kernel has completed most of
> > its boot.
> >
> >  Documentation/admin-guide/kernel-parameters.txt |   5 +
> >  arch/arm64/Kconfig                              |  10 +-
> >  arch/arm64/include/asm/cacheflush.h             |   2 +
> >  arch/arm64/include/asm/ktext.h                  |  45 ++++++
> >  arch/arm64/include/asm/memory.h                 |  26 ++--
> >  arch/arm64/include/asm/mmu_context.h            |  12 +-
> >  arch/arm64/include/asm/pgtable.h                |  35 ++++-
> >  arch/arm64/include/asm/smp.h                    |   1 +
> >  arch/arm64/kernel/alternative.c                 |   4 +-
> >  arch/arm64/kernel/asm-offsets.c                 |   1 +
> >  arch/arm64/kernel/cpufeature.c                  |   2 +-
> >  arch/arm64/kernel/head.S                        |   3 +-
> >  arch/arm64/kernel/hibernate.c                   |   2 +-
> >  arch/arm64/kernel/patching.c                    |   7 +-
> >  arch/arm64/kernel/smp.c                         |   3 +
> >  arch/arm64/kernel/suspend.c                     |   3 +-
> >  arch/arm64/kernel/vmlinux.lds.S                 |   3 +
> >  arch/arm64/mm/Makefile                          |   2 +
> >  arch/arm64/mm/init.c                            |   3 +
> >  arch/arm64/mm/ktext.c                           | 198 ++++++++++++++++++++++++
> >  arch/arm64/mm/mmu.c                             |  85 ++++++++--
> >  21 files changed, 413 insertions(+), 39 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/ktext.h
> >  create mode 100644 arch/arm64/mm/ktext.c
> >
> >
> > --
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> >
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
