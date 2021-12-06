Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A11C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 10:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239813AbhLFKus (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 05:50:48 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47424
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239581AbhLFKuq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 05:50:46 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2DA0D3F1D7
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638787637;
        bh=b2gB9kgbziNsEGldLluKkZRlwEDdrCHFdkBhlX9f0m4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=pE7TgXBmV7e7afuWAfmk6CdK/BcySZgA3ire1sl2aaIWYRsOdmo2vj8VZHCEXZ8hT
         ViFN9tyN6c1rIiLKsAlkDbF1NzT7CqYZnH3FDzPpK6OfchTunJ7URg2/HOkMguvr2J
         QPX8FW0Cpz/6QzNmfN8ruWdgliQmJABfg78+oajsyOKdT/B3kniH17loLgkAzQsSsu
         /uPes68r8ARt5UXxZX1dTT969sgvCUdIEl848KjPJytc+hOw23zTgDrQ5xbwAVNmDL
         aW0I0Ol/3DOC1ie4U9hK3mMn2Jy373/2fA6Py8V7Gs/eT7XkiRwfMQYBvFLDzIzxRA
         u12LiKRs53GHg==
Received: by mail-wr1-f70.google.com with SMTP id b1-20020a5d6341000000b001901ddd352eso1902743wrw.7
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 02:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b2gB9kgbziNsEGldLluKkZRlwEDdrCHFdkBhlX9f0m4=;
        b=1TfuwkDmPC0GUQW+peGSUOwVmZoZb1TLfZlmsaag3T5h5hmJqiMK2wMg07PjZCrEXC
         dEat6KvNmvQwmu/CPBaCk8iWqJ9mqA+35Ar0iy7Ad6wVCijgfouRkTZbPUF4lf7ujyHQ
         34DAOaNM0W8w/HieldMDsg/l4CQg//zEzkC8CagFRLfRIhrW/Z69XEM5Ma4GtPd46A5U
         r6Lmc6j5QnrRV3wrHepKl44E0dQF8Lga77fa6lshilDAlpYUvqNEZVjeR2bKPumDe7Mo
         7VxVa9wmLjZLnlWFI7vRluf+Z/3pnNEusmiYiSFIA3CiAVQFC3c9H7fcNMih10Ss3nMM
         x4+w==
X-Gm-Message-State: AOAM530nLIH5vxTUxaDu6+35reaXaoOlmaVwQOsiXUdUWCLSr78jk/6H
        U2oKOwINyVswTvi2yGrkdsjBbHUoT1YXSqGsOZVTimLC5A7BxWMuVQAzIsnyL/slqD8ZzM5AKNj
        hu4WhOlj8J8IiOZfRo7j9Cr5NWZj17OxgEu6Ubg==
X-Received: by 2002:a1c:488:: with SMTP id 130mr38244181wme.157.1638787636679;
        Mon, 06 Dec 2021 02:47:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWZaiohJDJ1lQrollH/HRqPnkkgWQVvVCi2sIDNd8r3nh+P2AJqc+yB6yDeZN9kdCc9VCG1w==
X-Received: by 2002:a1c:488:: with SMTP id 130mr38244150wme.157.1638787636435;
        Mon, 06 Dec 2021 02:47:16 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id u23sm11755158wru.21.2021.12.06.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 02:47:16 -0800 (PST)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <Atish.Patra@rivosinc.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        Mayuresh Chitale <mchitale@ventanamicro.com>,
        panqinglin2020@iscas.ac.cn, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
        linux-arch@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
Date:   Mon,  6 Dec 2021 11:46:44 +0100
Message-Id: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

* Please note notable changes in memory layouts and kasan population *

This patchset allows to have a single kernel for sv39 and sv48 without
being relocatable.

The idea comes from Arnd Bergmann who suggested to do the same as x86,
that is mapping the kernel to the end of the address space, which allows
the kernel to be linked at the same address for both sv39 and sv48 and
then does not require to be relocated at runtime.

This implements sv48 support at runtime. The kernel will try to
boot with 4-level page table and will fallback to 3-level if the HW does not
support it. Folding the 4th level into a 3-level page table has almost no
cost at runtime.

Note that kasan region had to be moved to the end of the address space
since its location must be known at compile-time and then be valid for
both sv39 and sv48 (and sv57 that is coming).

Tested on:
  - qemu rv64 sv39: OK
  - qemu rv64 sv48: OK
  - qemu rv64 sv39 + kasan: OK
  - qemu rv64 sv48 + kasan: OK
  - qemu rv32: OK

Changes in v3:
  - Fix SZ_1T, thanks to Atish
  - Fix warning create_pud_mapping, thanks to Atish
  - Fix k210 nommu build, thanks to Atish
  - Fix wrong rebase as noted by Samuel
  - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
  - * Move KASAN next to the kernel: virtual layouts changed and kasan population *

Changes in v2:
  - Rebase onto for-next
  - Fix KASAN
  - Fix stack canary
  - Get completely rid of MAXPHYSMEM configs
  - Add documentation

Alexandre Ghiti (13):
  riscv: Move KASAN mapping next to the kernel mapping
  riscv: Split early kasan mapping to prepare sv48 introduction
  riscv: Introduce functions to switch pt_ops
  riscv: Allow to dynamically define VA_BITS
  riscv: Get rid of MAXPHYSMEM configs
  asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
  riscv: Implement sv48 support
  riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
  riscv: Explicit comment about user virtual address space size
  riscv: Improve virtual kernel memory layout dump
  Documentation: riscv: Add sv48 description to VM layout
  riscv: Initialize thread pointer before calling C functions
  riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN

 Documentation/riscv/vm-layout.rst             |  48 ++-
 arch/riscv/Kconfig                            |  37 +-
 arch/riscv/configs/nommu_k210_defconfig       |   1 -
 .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
 arch/riscv/configs/nommu_virt_defconfig       |   1 -
 arch/riscv/include/asm/csr.h                  |   3 +-
 arch/riscv/include/asm/fixmap.h               |   1
 arch/riscv/include/asm/kasan.h                |  11 +-
 arch/riscv/include/asm/page.h                 |  20 +-
 arch/riscv/include/asm/pgalloc.h              |  40 ++
 arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
 arch/riscv/include/asm/pgtable.h              |  47 +-
 arch/riscv/include/asm/sparsemem.h            |   6 +-
 arch/riscv/kernel/cpu.c                       |  23 +-
 arch/riscv/kernel/head.S                      |   4 +-
 arch/riscv/mm/context.c                       |   4 +-
 arch/riscv/mm/init.c                          | 408 ++++++++++++++----
 arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
 drivers/firmware/efi/libstub/efi-stub.c       |   2
 drivers/pci/controller/pci-xgene.c            |   2 +-
 include/asm-generic/pgalloc.h                 |  24 +-
 include/linux/sizes.h                         |   1
 22 files changed, 833 insertions(+), 209 deletions(-)

--
2.32.0

