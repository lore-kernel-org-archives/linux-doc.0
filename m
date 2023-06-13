Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB40C7EE29
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 08:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241557AbjFMIje (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 04:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241328AbjFMIjN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 04:39:13 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B516010FE
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 01:39:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso6343818e87.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645549; x=1689237549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx/OkkzdT993/9VYh83sQfBIaNxnQHq+kVpi06cUjP4=;
        b=pT813DeOnj7+8s/28XpjPTOuYE3pYu7pu7E7HrK9oIJN7fP+sHcVkVbr98TF/jk/w5
         ATspuAPBQ4m8kJ0W/H7wZTXqPndgmdgmn9p2kaqKfeVoeTwP3Mp/4gXYqlafyUixcScE
         MKIdkC7/WmKkLXX0a9ODj+a3ogD3Quzs00Ei9whEbKwKcFtEHUTHdrFpmxARPWElszJG
         k5477A5Y0cFkk2CSWKbnFM8oZtQB1dLpx5PBfZCggPDY+ObA5iwlRMQ6o72z4gFOd+B6
         p4hfq/NNDWtcOeS7frG1tvxO6/G8N3Lo0dgLM/QqNfW0FGRaqyy6QH0oympLjC4Mg/R3
         ydBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645549; x=1689237549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wx/OkkzdT993/9VYh83sQfBIaNxnQHq+kVpi06cUjP4=;
        b=VPZIeowo6ZMAk4oSS5Lb/3KPUdun37e6+QuBVZyKjPkRy8ubM01Mb4uqbr4nZRXYOL
         SkpEmRhli5oqp9ezBQGv0JoO9Tkn8c18VBzUIFsVz51bRQw1RVyLN3s9rCn44kxC9mnB
         0jcbUcBmkgJtwblfflFAOAZgRPLK1Wx6vh4yvtesQs/oqMiCVLTfQ4eGfQWQ+JwYnrIG
         WZmaQedCAgwKqozshv+piO6efdFWaQhP44iUeGpRXYW4wmJzb6uVopLCU43bf/MJUN/l
         ltaC2ZpRxdu1/Tn1Sp4qdrbGRYzUN1xCFtGVuKNIJdu247g1qZZHxUHRaDIzxsWqv+N6
         53hQ==
X-Gm-Message-State: AC+VfDwIooTIXGEdQ/+UzOVYFnYHbUioZ5Uryu2rDn2rpyzWrTk7akl5
        IvtF0t1U8fnGzbPT3+rKmu4yUg==
X-Google-Smtp-Source: ACHHUZ6oA5GIvFyfkOHrgdneWFieQUybGsuu4f9kgJjCtqnefDsy9AGXxua8YiQjIs9n0yYK6dlSJQ==
X-Received: by 2002:a19:6d1e:0:b0:4f1:496a:de8e with SMTP id i30-20020a196d1e000000b004f1496ade8emr4813607lfc.27.1686645548900;
        Tue, 13 Jun 2023 01:39:08 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004f626f19665sm1690987lfh.115.2023.06.13.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 01:39:08 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v4] Documentation/mm: Initial page table documentation
Date:   Tue, 13 Jun 2023 10:39:06 +0200
Message-Id: <20230613083906.757878-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is based on an earlier blog post at people.kernel.org,
it describes the concepts about page tables that were hardest
for me to grasp when dealing with them for the first time,
such as the prevalent three-letter acronyms pfn, pgd, p4d,
pud, pmd and pte.

I don't know if this is what people want, but it's what I would
have wanted.

I discussed at one point with Mike Rapoport to bring this into
the kernel documentation, so here is a small proposal.

Cc: Matthew Wilcox <willy@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Link: https://people.kernel.org/linusw/arm32-page-tables
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Singularis to pluralis fix pointed out by Jonathan Cameron
- Reword the origin story about hierarchical page tables a bit
  inspired by the input from Mike Rapoport.
ChangeLog v2->v3:
- Fix the page size example, also have examples for both 4K and
  16K pages since people will confront these.
- Add a section explaining a bit why we have hierarchical
  page tables at all.
ChangeLog v1->v2:
- Fixed speling mistakes
- Copyedit the paragraph on page frame numbers.
- Reverse the arrows in the page table hierarchy illustration.
- Reverse the order of description of the page hierarchy levels.
- Create a new section for folding
- Emphasize that architectures should try to be page hierarchy
  neutral
- Trying to better describe the fact that the lowest page table PTE
  is called like that for historical reasons.
---
 Documentation/mm/page_tables.rst | 149 +++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index 96939571d7bc..a5e202301e7b 100644
--- a/Documentation/mm/page_tables.rst
+++ b/Documentation/mm/page_tables.rst
@@ -3,3 +3,152 @@
 ===========
 Page Tables
 ===========
+
+Paged virtual memory was invented along with virtual memory as a concept in
+1962 on the Ferranti Atlas Computer which was the first computer with paged
+virtual memory. The feature migrated to newer computers and became a de facto
+feature of all Unix-like systems as time went by. In 1985 the feature was
+included in the Intel 80386, which was the CPU Linux 1.0 was developed on.
+
+Page tables map virtual addresses as seen by the CPU program counter into
+physical addresses as seen on the external memory bus.
+
+Linux defines page tables as a hierarchy which is currently five levels in
+height. The target architecture code for each supported architecture will then
+map this to the restrictions of the target hardware.
+
+The physical address corresponding to the virtual address is often referenced
+by the underlying physical page frame. The **page frame number** or **pfn**
+is the physical address of the page (as seen on the external memory bus)
+divided by `PAGE_SIZE`.
+
+Physical memory address 0 will be *pfn 0* and the highest pfn will be
+the last page of physical memory the external address bus of the CPU can
+address.
+
+With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
+address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x00002000
+and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs are
+at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3fffff.
+
+As you can see, with 4KB pages the page base address uses bits 12-31 of the
+address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
+`PAGE_SIZE` is usually defined in terms of the page shift as `(1 << PAGE_SHIFT)`
+
+Over time a deeper hierarchy has been developed in response to increasing memory
+sizes. When Linux was created, 4KB pages and a single page table called
+`swapper_pg_dir` with 1024 entries was used, covering 4MB which coincided with
+the fact that Torvald's first computer had 4MB of physical memory. Entries in
+this single table were referred to as *PTE*:s - page table entries.
+
+The software page table hierarchy reflects the fact that page table hardware has
+become hierarchical and that in turn is done to save page table memory and
+speed up mapping.
+
+One could of course imagine a single, linear page table with enormous amounts
+of entries, breaking down the whole memory into single pages. Such a page table
+would be very sparse, because large portions of the virtual memory usually
+remains unused. By using hierarchical page tables large holes in the virtual
+address space does not waste valuable page table memory, because it will suffice
+to mark large areas as unmapped at a higher level in the page table hierarchy.
+
+Additionally, on modern CPUs, a higher level page table entry can point directly
+to a physical memory range, which allows mapping a contiguous range of several
+megabytes or even gigabytes in a single high-level page table entry, taking
+shortcuts in mapping virtual memory to physical memory: there is no need to
+traverse deeper in the hierarchy when you find a large mapped range like this.
+
+The page table hierarchy has now developed into this::
+
+  +-----+
+  | PGD |
+  +-----+
+     |
+     |   +-----+
+     +-->| P4D |
+         +-----+
+            |
+            |   +-----+
+            +-->| PUD |
+                +-----+
+                   |
+                   |   +-----+
+                   +-->| PMD |
+                       +-----+
+                          |
+                          |   +-----+
+                          +-->| PTE |
+                              +-----+
+
+
+Symbols on the different levels of the page table hierarchy have the following
+meaning beginning from the bottom:
+
+- **pte**, `pte_t`, `pteval_t` = **Page Table Entry** - mentioned earlier.
+  The *pte* is an array of `PTRS_PER_PTE` elements of the `pteval_t` type, each
+  mapping a single page of virtual memory to a single page of physical memory.
+  The architecture defines the size and contents of `pteval_t`.
+
+  A typical example is that the `pteval_t` is a 32- or 64-bit value with the
+  upper bits being a **pfn** (page frame number), and the lower bits being some
+  architecture-specific bits such as memory protection.
+
+  The **entry** part of the name is a bit confusing because while in Linux 1.0
+  this did refer to a single page table entry in the single top level page
+  table, it was retrofitted to be an array of mapping elements when two-level
+  page tables were first introduced, so the *pte* is the lowermost page
+  *table*, not a page table *entry*.
+
+- **pmd**, `pmd_t`, `pmdval_t` = **Page Middle Directory**, the hierarchy right
+  above the *pte*, with `PTRS_PER_PMD` references to the *pte*:s.
+
+- **pud**, `pud_t`, `pudval_t` = **Page Upper Directory** was introduced after
+  the other levels to handle 4-level page tables. It is potentially unused,
+  or *folded* as we will discuss later.
+
+- **p4d**, `p4d_t`, `p4dval_t` = **Page Level 4 Directory** was introduced to
+  handle 5-level page tables after the *pud* was introduced. Now it was clear
+  that we needed to replace *pgd*, *pmd*, *pud* etc with a figure indicating the
+  directory level and that we cannot go on with ad hoc names any more. This
+  is only used on systems which actually have 5 levels of page tables, otherwise
+  it is folded.
+
+- **pgd**, `pgd_t`, `pgdval_t` = **Page Global Directory** - the Linux kernel
+  main page table handling the PGD for the kernel memory is still found in
+  `swapper_pg_dir`, but each userspace process in the system also has its own
+  memory context and thus its own *pgd*, found in `struct mm_struct` which
+  in turn is referenced to in each `struct task_struct`. So tasks have memory
+  context in the form of a `struct mm_struct` and this in turn has a
+  `struct pgt_t *pgd` pointer to the corresponding page global directory.
+
+To repeat: each level in the page table hierarchy is a *array of pointers*, so
+the **pgd** contains `PTRS_PER_PGD` pointers to the next level below, **p4d**
+contains `PTRS_PER_P4D` pointers to **pud** items and so on. The number of
+pointers on each level is architecture-defined.::
+
+        PMD
+  --> +-----+           PTE
+      | ptr |-------> +-----+
+      | ptr |-        | ptr |-------> PAGE
+      | ptr | \       | ptr |
+      | ptr |  \        ...
+      | ... |   \
+      | ptr |    \         PTE
+      +-----+     +----> +-----+
+                         | ptr |-------> PAGE
+                         | ptr |
+                           ...
+
+
+Page Table Folding
+==================
+
+If the architecture does not use all the page table levels, they can be *folded*
+which means skipped, and all operations performed on page tables will be
+compile-time augmented to just skip a level when accessing the next lower
+level.
+
+Page table handling code that wishes to be architecture-neutral, such as the
+virtual memory manager, will need to be written so that it traverses all of the
+currently five levels. This style should also be preferred for
+architecture-specific code, so as to be robust to future changes.
-- 
2.40.1

