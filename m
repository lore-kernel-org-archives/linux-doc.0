Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD04C7EE25
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 12:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbjFHMzm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 08:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbjFHMzl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 08:55:41 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B271FE9
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 05:55:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f642a24568so700810e87.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jun 2023 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228904; x=1688820904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trvWVUDZReNcYjy0l2pWlGFM1PM8luEJlHY87CTMeWA=;
        b=bdrjEFaM1ooCIEeSESpAKKUYcmOG7lzc3twZknOsUOpy5BRsmPzO3/b6tEJ+fKqk/z
         DWM9sBnDcbtS3p2xbRNifD45rmDFNlkhMX9r0TVMnthuAp/qaoZXUySZh2qTDNndUBHe
         3U5ctFegvDL3qmvxsHhLl6PZ9qnyz3h7wj3SQLHD+KjEnW9GyAUkkRy+sFV3QrBe4QHO
         hJjWJgcJ6z277CD4HgpdYiM9PcEG4LWgiKVybDaChpe6KMojGx8Nd5ZLZD0Rh31S8Yee
         JJLjBI4C0pTU1hiMWbqJgVYxWuEqOBjmWaiKGxsWT916eYjwQEuNNMEednzgLcD+pVVz
         bxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228904; x=1688820904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trvWVUDZReNcYjy0l2pWlGFM1PM8luEJlHY87CTMeWA=;
        b=VXbR/NSXUciB/ipB4yfdMCkn8ws9KtJfURLflToYEDr3+AYZB8on9riY82G3q0wPQH
         dR9xKI9XnBrzR4xnFcXbvIIfMpWhnwZMzcxlsvBVK04XClFZk8tSfE3cp1rnTZKVTjyl
         2zFt8+kZbVJlneqKCNgqZUDQtApur6mzZ+fG+u4ja7Sf0s/SycdxZFIX6eAFF9kY2lL6
         GOpphbWEIJVbIkgwlxO7wd1LYnPsaAQKzKkSkl6yDeMSt3ttO8gFInqbzBN3Na58RHCB
         XAgBSB0WSjjtiOqXPpJOcqES+YYYZZ5a8tfW3OU6kq/evSPyRjiZrtjlIt/3NjiLLrz7
         hZBQ==
X-Gm-Message-State: AC+VfDxPxhK2If931XisFMrSSX2i5l28vx80twBsX+yXwkjcyccCualT
        sD++KeR25rRfDlWPnfW5zkVG1Q==
X-Google-Smtp-Source: ACHHUZ4fM7JuXEiYVqO1ZJGZUnzXqo1a4EyzsVRrPOIh8RgX6PvAgfsPML+ziOFKC7vtDrHSv1UO8w==
X-Received: by 2002:a19:f504:0:b0:4f6:1f5a:60d6 with SMTP id j4-20020a19f504000000b004f61f5a60d6mr2900047lfb.44.1686228904639;
        Thu, 08 Jun 2023 05:55:04 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id j13-20020ac253ad000000b004f0049433adsm175777lfh.307.2023.06.08.05.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:55:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3] Documentation/mm: Initial page table documentation
Date:   Thu,  8 Jun 2023 14:55:01 +0200
Message-Id: <20230608125501.3960093-1-linus.walleij@linaro.org>
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
Link: https://people.kernel.org/linusw/arm32-page-tables
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 Documentation/mm/page_tables.rst | 142 +++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index 96939571d7bc..13c196bc48a1 100644
--- a/Documentation/mm/page_tables.rst
+++ b/Documentation/mm/page_tables.rst
@@ -3,3 +3,145 @@
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
+this single table was referred to as *PTE*:s - page table entries.
+
+The hierarchy reflects the fact that page table hardware has become hierarchical
+and that in turn is done to save page table memory: one could of course imagine
+a single page table with hundreds of kilobytes of entries, but in practice,
+the hardware needs some help to traverse the memory where the page table is
+stored, and large parts of the memory space is often empty, leading to
+an unnecessarily large and sparse page table. For this reason page tables are
+hierarchical, using parts of the virtual address to branch off at each level.
+By marking a page table entry on a certain level invalid, the corresponding
+range of the virtual address space is left unmapped.
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

