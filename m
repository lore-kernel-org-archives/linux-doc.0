Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A8134A1
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481652; cv=none; b=q1f5XCfOwVnWD+qtWB6C6gLay4tMQTJ5Zd+Q7YtzIW9G1zJwHKuwDAUZ+MmxZx+EL1zs0W7lVS2P3t2Dv4w/OvdSCnQ3lQ5IeB1U0vgcpeCzaocJktQe7qcyja6f7LnXtfSXsIUEZ/kGNirG0CMpUwl3uOv8fpd8vYt3ChhL0Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481652; c=relaxed/simple;
	bh=S1lLI/ztJYdjj6PsWhpVTtwvz+9pT4BkDUg59AhiWSo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=QulsfMIpW7rv7dJ9FRt4hx7kGClskejp3aZ3B3UiCX5xDIGStZFIDo9M5PbV4pjbEf/BWJJ8mMDePH4vdln5m9qDQMaIvVDonEz93kTXTW9SuLDMgRb5chvWmF8gyF/dTsdvczy4G2tGKgV90Gtol1ogDH7cwhyX5rKERUh5c54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jTpE56Jx; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jTpE56Jx"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3606e69ec67so70555265ab.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481649; x=1706086449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ALncf7kJo8QfjKbVIvsc5Tt/XL2Ujc9rBHAZjdtPv8=;
        b=jTpE56Jx2txHSoen8J83EPTiHwnNkXpcaJULd/MW17SNpDVbbh/HFjMBmK3Cavm/Ur
         1avZSKqiMzu4thymhFmLeXABOA8JGGcx2nXLIZZupG+URBw+jLkL30/OJpp4D0oIB9NN
         ZtY1J0tXQIEPnnMGv2H1V2KJS8WmHxPIuADrV358swWLGY8ApgBVJqAF6d4hFLdPC9lK
         qdZk9E4+z6nAcZEc0KZaRgxkOSjOAWImg4D0b+5cQy2G63k8daaTqdduIf6c/+mwDdYu
         2XcY3kt6Xc1FS/MjSq8ZUkEUNHq7D7+89tDoFq6AY+UAGxJ2OOcwrXyoosmETjZwAfIk
         Gfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481649; x=1706086449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ALncf7kJo8QfjKbVIvsc5Tt/XL2Ujc9rBHAZjdtPv8=;
        b=IIy9JsPTu1Q1/qR03F1QEchACpq6aQTQDHUER+GLJP2qK3i+47fNg6xA7RZnl12DIX
         LELg+b9wNp3AJokKN+2ErnBcMUeFAkbpPePXcsgp5aD3LeZHuLKmzYUFlJBIkkKL46qM
         3CTcI3809zK1U5hPLRdag/AK3ggXf71zsw6iY87Ev76KyGITbBthkDEEGWymm0KLDucU
         A1tNOT2nfRwN7EbCfZScJBfXSQ33AAtlPStJZozlodeZ5qAYcB1FDgyVH4edaZt8fqzq
         inJmrU2ZM1pwq22Z/hm4hGgvkq0TyXaee6eIwxuPa3wvbZtkr9h/hSco1ttqtazgUQEX
         hO2Q==
X-Gm-Message-State: AOJu0Yx9cShFTjuC++3glBPSiZ5jY3+dFcxWzPp72TVLpcx90qmZ5duU
	5zvJC6Uz+6vllLkNTKte/wnn8P21kmiqkg==
X-Google-Smtp-Source: AGHT+IHosYF8IINX9J3hSOQYlOm60XH3NlHno2eo3spwY+po/eFsYkU7ojzG4viOCNHEFh2jikkSEA==
X-Received: by 2002:a92:d412:0:b0:361:953d:42fd with SMTP id q18-20020a92d412000000b00361953d42fdmr758816ilm.92.1705481648896;
        Wed, 17 Jan 2024 00:54:08 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:54:08 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	root <root@n144-101-220.byted.org>
Subject: [PATCH v3 00/19] arm64 kernel text replication
Date: Wed, 17 Jan 2024 16:53:38 +0800
Message-Id: <20240117085357.31693-1-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: root <root@n144-101-220.byted.org>

Many thanks to Russell King for his previous work on
arm64 kernel text replication.
https://lore.kernel.org/all/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk

After applying these patches, we tested that our business performance
increased by more than 5% and the NUMA node memory bandwidth was more
balanced.
I've recently been trying to make it work with different numbers of
page tables/page sizes, so updated this patch set to V3.

Patch overview:

Patch 1-16 is a patch set based on Russell King's previous arm64
kernel text replication, rebased on commit 052d534373b7.

The following three patches are new in v3:
patch 17 fixes compilation warning

patch 18 adapts arm64 kernel text replication to support more
page tables/page sizes, in addition to 16K page size and
4-level page tables.

patch 19 fixes the abnormal startup problem caused by module_alloc()
which may allocate an address larger than KIMAGE_VADDR when kernel text
replication is enabled.

[v2] https://lore.kernel.org/all/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk
[RFC] https://lore.kernel.org/all/ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk

Please correct me if I've made a mistake, thank you very much!

Original message below.

Problem
-------

NUMA systems have greater latency when accessing data and instructions
across nodes, which can lead to a reduction in performance on CPU cores
that mainly perform accesses beyond their local node.

Normally when an ARM64 system boots, the kernel will end up placed in
memory, and each CPU core will have to fetch instructions and data from
which ever NUMA node the kernel has been placed. This means that while
executing kernel code, CPUs local to that node will run faster than
CPUs in remote nodes.

The higher the latency to access remote NUMA node memory, the more the
kernel performance suffers on those nodes.

If there is a local copy of the kernel text in each node's RAM, and
each node runs the kernel using its local copy of the kernel text,
then it stands to reason that the kernel will run faster due to fewer
stalls while instructions are fetched from remote memory.

The question then arises how to achieve this.

Background
----------

An important issue to contend with is what happens when a thread
migrates between nodes. Essentially, the thread's state (including
instruction pointer) is saved to memory, and the scheduler on that CPU
loads some other thread's state and that CPU resumes executing that
new thread.

The CPU gaining the migrating thread loads the saved state, again
including the instruction pointer, and the gaining CPU resumes fetching
instructions at the virtual address where the original CPU left off.

The key point is that the virtual address is what matters here, and
this gives us a way to implement kernel text replication fairly easily.
At a practical level, all we need to do is to ensure that the virtual
addresses which contain the kernel text point to a local copy of the
that text.

This is exactly how this proposal of kernel text replication achieves
the replication. We can go a little bit further and include most of
the read-only data in this replication, as that will never be written
to by the kernel (and thus remains constant.)

Solution
--------

So, what we need to achieve is:

1. multiple identical copies of the kernel text (and read-only data)
2. point the virtual mappings to the appropriate copy of kernel text
   for the NUMA node.

(1) is fairly easy to achieve - we just need to allocate some memory
in the appropriate node and copy the parts of the kernel we want to
replicate. However, we also need to deal with ARM64's kernel patching.
There are two functions that patch the kernel text,
__apply_alternatives() and aarch64_insn_patch_text_nosync(). Both of
these need to to be modified to update all copies of the kernel text.

(2) is slightly harder.

Firstly, the aarch64 architecture has a very useful feature here - the
kernel page tables are entirely separate from the user page tables.
The hardware contains two page table pointers, one is used for user
mappings, the other is used for kernel mappings.

Therefore, we only have one page table to be concerned with: the table
which maps kernel space. We do not need to be concerned with each
user processes page table.

The approach taken here is to ensure that the kernel is located in an
area of kernel virtual address space covered by a level-0 page table
entry which is not shared with any other user. We can then maintain
separate per-node level-0 page tables for kernel space where the only
difference between them is this level-0 page table entry.

This gives a couple of benefits. Firstly, when updates to the level-0
page table happen (e.g. when establishing new mappings) these updates
can simply be copied to the other level-0 page tables provided it isn't
for the kernel image. Secondly, we don't need complexity at lower
levels of the page table code to figure out whether a level-1 or lower
update needs to be propagated to other nodes.

The level-0 page table entry for the kernel can then be used to point
at a node-unique set of level 1..N page tables to make the appropriate
copy of the kernel text (and read-only data) into kernel space, while
keeping the kernel read-write data shared between nodes.

Performance Analysis
--------------------

Needless to say, the performance results from kernel text replication
are workload specific, but appear to show a gain of between 6% and
17% for database-centric like workloads. When combined with userspace
awareness of NUMA, this can result in a gain of over 50%.

Problems
--------

There are a few areas that are a problem for kernel text replication:
1) As this series changes the kernel space virtual address space
   layout, it breaks KASAN - and I've zero knowledge of KASAN so I
   have no idea how to fix it. I would be grateful for input from
   KASAN folk for suggestions how to fix this.

2) KASLR can not be used with kernel text replication, since we need
   to place the kernel in its own L0 page table entry, not in vmalloc
   space. KASLR is disabled when support for kernel text replication
   is enabled.

3) Changing the kernel virtual address space layout also means that
   kaslr_offset() and kaslr_enabled() need to become macros rather
   than inline functions due to the use of PGDIR_SIZE in the
   calculation of KIMAGE_VADDR. Since asm/pgtable.h defines this
   constant, but asm/memory.h is included by asm/pgtable.h, having
   this symbol available would produce a circular include
   dependency, so I don't think there is any choice here.

4) read-only protection for replicated kernel images is not yet
   implemented.

Hao Jia (3):
  arm64: text replication: fix compilation warning
  arm64: text replication: support more page sizes and levels
  arm64: text replication: keep modules inside module region when
    REPLICATE_KTEXT is enabled

Russell King (Oracle) (16):
  arm64: provide cpu_replace_ttbr1_phys()
  arm64: make clean_dcache_range_nopatch() visible
  arm64: place kernel in its own L0 page table entry
  arm64: text replication: add init function
  arm64: text replication: add sanity checks
  arm64: text replication: copy initial kernel text
  arm64: text replication: add node text patching
  arm64: text replication: add node 0 page table definitions
  arm64: text replication: add swapper page directory helpers
  arm64: text replication: create per-node kernel page tables
  arm64: text replication: boot secondary CPUs with appropriate TTBR1
  arm64: text replication: update cnp support
  arm64: text replication: setup page tables for copied kernel
  arm64: text replication: include most of read-only data as well
  arm64: text replication: early kernel option to enable replication
  arm64: text replication: add Kconfig

 .../admin-guide/kernel-parameters.txt         |   5 +
 arch/arm64/Kconfig                            |  10 +-
 arch/arm64/include/asm/cacheflush.h           |   2 +
 arch/arm64/include/asm/ktext.h                |  45 ++++
 arch/arm64/include/asm/memory.h               |  36 ++-
 arch/arm64/include/asm/mmu_context.h          |  11 +-
 arch/arm64/include/asm/pgtable.h              |  31 ++-
 arch/arm64/include/asm/smp.h                  |   1 +
 arch/arm64/kernel/alternative.c               |   4 +-
 arch/arm64/kernel/asm-offsets.c               |   1 +
 arch/arm64/kernel/head.S                      |   3 +-
 arch/arm64/kernel/hibernate.c                 |   2 +-
 arch/arm64/kernel/kaslr.c                     |   1 +
 arch/arm64/kernel/module.c                    |  20 +-
 arch/arm64/kernel/patching.c                  |   7 +-
 arch/arm64/kernel/smp.c                       |   3 +
 arch/arm64/mm/Makefile                        |   2 +
 arch/arm64/mm/init.c                          |   3 +
 arch/arm64/mm/ktext.c                         | 213 ++++++++++++++++++
 arch/arm64/mm/mmu.c                           |  73 +++++-
 20 files changed, 446 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm64/include/asm/ktext.h
 create mode 100644 arch/arm64/mm/ktext.c

-- 
2.20.1

