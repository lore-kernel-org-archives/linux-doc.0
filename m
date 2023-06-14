Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789B4EB64DC
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jun 2023 07:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbjFNH0s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jun 2023 03:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbjFNHZ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jun 2023 03:25:57 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956C51707
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 00:25:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b341f83493so4417311fa.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686727551; x=1689319551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVgNzRD+Wae7kzaHXlPHfHd3wrtjqKMQNsjL35pHUpY=;
        b=soLiHRsRKz9cmp2V4JoPOYr7AswoeIcWimEOCaX4SmVsN09q3gveNtkVpIoJFGQ6G9
         CVU5PxySyDogZwLAJ7iVLyKogFt3WaGShVI1pQFeZ112FJxjwm9QKRNGiljZf9VQbg0q
         nfY4DedKKNwtVsFGUz1W/wzDX3g7/AIMTxUVhmqPgrpnvuo4MpaOyrSm8atuJ+5MBPAc
         i7RUBqpC8fzPPdYi4GEqoJm43RvXvxX55jLbTH3n+SkeU0WE2uV0ehAvHnv3qo345Zvr
         EzEA46LZqqtiKfKUZqmV6rFOqdh8ciOcWPFv7E5uGalYAQ9BHtWYfkIRnsr+utGkkh7Y
         IsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686727551; x=1689319551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVgNzRD+Wae7kzaHXlPHfHd3wrtjqKMQNsjL35pHUpY=;
        b=REIj5o58zG7EUbWlr2jkBTwbOViduBvi8GOGoZlZahnVI94CNcrQ0NNj2zUKbf9Wx7
         YQor+sYkigmgYpkwimm+mig1lRPmxiK0fRINE5VghGcVLWvIS4z+loIGyEeNQhaiLWux
         kSF8T+npiN0v30hKOSwPuPCHDWC6WsySrle9jmaeiPBoaeTvN9Qyorj7dlRB/GrdrZHT
         g5orAsBr0lkQKmX3UMlUZICaeqvSd24plfzbalgc7NaDpqsuz7ZwhJWd0767oeGHbzpn
         MhdrNjePoUIr7nnJUMmvdHdL+H9Bgpp/EVyTcHWtVTHUS1Mg9NpUemS8jcHsZg17FVvv
         6TxQ==
X-Gm-Message-State: AC+VfDxbDAfFH0W1d1T88EwfIVPRvbq8pL++hcNWVaqax48w3KVY/diH
        yDCbx38VrgysE7uvjUmEiOPd9vg1EKuZ2xFlhm8Kcg==
X-Google-Smtp-Source: ACHHUZ6SWTsMwMrHMIsQugjNmhXlprIQfVbdR4fp32iQG3fBUi3U7FXbKVDQyvQaxzf3D/pevf4/yw==
X-Received: by 2002:a05:651c:8c:b0:2b2:10e2:af1d with SMTP id 12-20020a05651c008c00b002b210e2af1dmr5519026ljq.10.1686727550614;
        Wed, 14 Jun 2023 00:25:50 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e9dd4000000b002b21089f747sm2454966ljj.89.2023.06.14.00.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 00:25:50 -0700 (PDT)
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
Subject: [PATCH v5] Documentation/mm: Initial page table documentation
Date:   Wed, 14 Jun 2023 09:25:48 +0200
Message-Id: <20230614072548.996940-1-linus.walleij@linaro.org>
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
have wanted. The wording, introduction, choice of initial subjects
and choice of style is mine.

I discussed at one point with Mike Rapoport to bring this into
the kernel documentation, so here is a small proposal.

The current form is augmented in response to feedback from
Mike Rapoport, Matthew Wilcox, Jonathan Cameron, Kuan-Ying Lee,
Randy Dunlap and Bagas Sanjaya.

Cc: Matthew Wilcox <willy@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Mike Rapoport <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Link: https://people.kernel.org/linusw/arm32-page-tables
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v4->v5:
- Drop the word "target" from the paragraph about virtual
  addresses as pointed out by Matthew Wilcox.
- Drop "program counter" mention in paragraph about physical and
  virtual addresses as pointed out by Matthew Wilcox.
- Update the changelog below to reflect who provided which
  feedback so everybode can see that their feedback is being
  taken into account.
- Collect Mike Rapoports Review tag.
ChangeLog v3->v4:
- Singularis to pluralis fix pointed out by Jonathan Cameron
- Reword the origin story about hierarchical page tables a bit
  inspired by the input from Mike Rapoport.
ChangeLog v2->v3:
- Fix the page size example, also have examples for both 4K and
  16K pages since people will confront these in response to
  feedback from Kuan-Ying Lee.
- Add a section explaining a bit why we have hierarchical
  page tables at all.
ChangeLog v1->v2:
- Fixed speling mistakes
- Copyedit the paragraph on page frame numbers in response
  to feedback from Matthew Wilcox.
- Reverse the arrows in the page table hierarchy illustration in
  response to feedback from Matthew Wilcox.
- Reverse the order of description of the page hierarchy levels in
  response to feedback from Matthew Wilcox.
- Create a new section for folding
- Emphasize that architectures should try to be page hierarchy
  neutral in response to feedback from Mike Rapoport.
- Trying to better describe the fact that the lowest page table PTE
  is called like that for historical reasons, in response to
  sevaral comments on earlier blog posts on the subject.
---
 Documentation/mm/page_tables.rst | 149 +++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index 96939571d7bc..7840c1891751 100644
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
+Page tables map virtual addresses as seen by the CPU into physical addresses
+as seen on the external memory bus.
+
+Linux defines page tables as a hierarchy which is currently five levels in
+height. The architecture code for each supported architecture will then
+map this to the restrictions of the hardware.
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

