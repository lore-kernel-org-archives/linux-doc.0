Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE426C7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 13:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjFENqo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 09:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjFENqn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 09:46:43 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 66E83F4
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 06:46:41 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB22ED75;
        Mon,  5 Jun 2023 06:47:26 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.25.215])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CB4C3F663;
        Mon,  5 Jun 2023 06:46:39 -0700 (PDT)
Date:   Mon, 5 Jun 2023 14:46:37 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 00/17] arm64 kernel text replication
Message-ID: <ZH3nPd1KzORqLvkO@FVFF77S0Q05N>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
 <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 05, 2023 at 10:05:22AM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Are there any comments on this?

This is on my queue of things to review, but I haven't had the chance to give
more than a cursory look so far. I'm hoping to get to it in the next few days.

Thanks,
Mark.

> 
> Thanks.
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
