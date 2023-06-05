Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFFBC77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 22:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbjFEWKo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 18:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjFEWKn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 18:10:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57082EC
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 15:10:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f6370ddd27so207324e87.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686003039; x=1688595039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZop+k5IUjk75zP/vJN8D1xAMrPhXH8EWG7W0gpYQRE=;
        b=d4p+v5dQA1fI3q5tJ77R/leYBk9f5LscurqNGVn3icA8lmbEKD8rjRM5HefdIw4n5y
         /43tjGjX86Lx8JuZoVrHnYuQSwqr8wJz6MC5k64WNHgiD6kGPFzq8Y0b4wTUC00URJx0
         +2AvahW93trIy4LNefdM5fu+G/DgZeyxdqtlf2iriYQwGg6vilgpcTw9d563L/2vA8OM
         5IhnP4cryGr/wkTiSvYdyzAHoRApha8x9nLcuN7vNSpI/c+qQc3NLghqKD5PoLCOEBYH
         nk+8v4t6c9NIHqWUS5fbkHf5RM+2BXdkX5Iufioq7DiXPzDwRV2nKwRMmrLsksKn2a8d
         EoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686003039; x=1688595039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZop+k5IUjk75zP/vJN8D1xAMrPhXH8EWG7W0gpYQRE=;
        b=N+IWaCXTD8l+87ll1qICu9WuBiHVoyyvAOI94+Fa7oGIN8fZk6IR9wdXHPfCCEJeLv
         2/sOyplxuzDmPYKOZtruAGSmJjxBOHj9DNbLJh+jCPHuDg+SfrGBM/DLWwldnauwQf39
         +upAW+sXIPM8WDKbAbBgjjc1w5rDeRXdaEWCgz9Z4e+j0iNG5sSe8UiNieLzsdj1w8/w
         Cle6R6ftgPydd8v6Zhw5pRalLkZaa/J5dgaZGjqOcx/Q5DlJaWmKrASE0rPiTWpFF4o3
         /2780/enP04WvT691b7WsL/Jxc3SGKpsIe0tZykd8kOGbE5EJRgS1T+VrV4q7Rgw0ex2
         VzDQ==
X-Gm-Message-State: AC+VfDzdLCr4sM5zIRURgXj33jpO0JxDrxHzPf37R6bZEaD120v96YaO
        LTkmef7xNyI9dSIr2op1xeySFjume4PjZdeCjeE=
X-Google-Smtp-Source: ACHHUZ6LaeQMzrIRDEPxh62JIAnVkhuAba9wD4UypASd97zC2BXohpayGuVC/9mdbKfTBJcafGXBIQ==
X-Received: by 2002:ac2:5202:0:b0:4f6:10e9:c507 with SMTP id a2-20020ac25202000000b004f610e9c507mr152914lfl.23.1686003039554;
        Mon, 05 Jun 2023 15:10:39 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id n7-20020a195507000000b004f1482d9db6sm1237843lfe.155.2023.06.05.15.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 15:10:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH] Documentation/mm: Initial page table documentation
Date:   Tue,  6 Jun 2023 00:10:35 +0200
Message-Id: <20230605221035.3681812-1-linus.walleij@linaro.org>
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

Cc: Mike Rapoport <rppt@kernel.org>
Link: https://people.kernel.org/linusw/arm32-page-tables
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/mm/page_tables.rst | 125 +++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index 96939571d7bc..a2e1671a0f1d 100644
--- a/Documentation/mm/page_tables.rst
+++ b/Documentation/mm/page_tables.rst
@@ -3,3 +3,128 @@
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
+The first computers with virtual memory had one single page table, but the
+increased size of physical memories demanded that the page tables be split in
+two hierarchical levels. This happens because a single page table cannot cover
+the desired amount of memory with the desired granualarity, such as a page size
+of 4KB.
+
+The physical address corresponding to the virtual address is commonly
+defined by the index point in the hierarchy, and this is called a **page frame
+number** or **pfn**. The first entry on the top level to the first entry in the
+second and so on down the hierarchy will point out the virtual address for the
+physical memory address 0, which will be *pfn 0* and the highest pfn will be
+the last page of physical memory the external address bus of the CPU can
+address.
+
+With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
+address 0x00000000, pfn 1 is at address 0x00004000, pfn 2 is at 0x00008000
+and so on until we reach pfn 0x3ffff at 0xffffc000.
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
+Over time the page table hierarchy has developed into this::
+
+  +-----+
+  | PGD |
+  +-----+
+     ^
+     |   +-----+
+     +---| P4D |
+         +-----+
+            ^
+            |   +-----+
+            +---| PUD |
+                +-----+
+                   ^
+                   |   +-----+
+                   +---| PMD |
+                       +-----+
+                          ^
+                          |   +-----+
+                          +---| PTE |
+                              +-----+
+
+
+Symbols on the different levels of the page table hierarchy have the following
+meaning:
+
+- **pgd**, `pgd_t`, `pgdval_t` = **Page Global Directory** - the Linux kernel
+  main page table handling the PGD for the kernel memory is still found in
+  `swapper_pg_dir`, but each userspace process in the system also has its own
+  memory context and thus its own *pgd*, found in `struct mm_struct` which
+  in turn is referenced to in each `struct task_struct`. So tasks have memory
+  context in the form of a `struct mm_struct` and this in turn has a
+  `struct pgt_t *pgd` pointer to the corresponding page global directory.
+
+- **p4d**, `p4d_t`, `p4dval_t` = **Page Level 4 Directory** was introduced to
+  handle 5-level page tables after the *pud* was introduced. Now it was clear
+  that we nee to replace *pgd*, *pmd*, *pud* etc with a figure indicating the
+  directory level and that we cannot go on with ad hoc names any more. This
+  is only used on systems which actually have 5 levels of page tables.
+
+- **pud**, `pud_t`, `pudval_t` = **Page Upper Directory** was introduced after
+  the other levels to handle 4-level page tables. Like *p4d*, it is potentially
+  unused.
+
+- **pmd**, `pmd_t`, `pmdval_t` = **Page Middle Directory**.
+
+- **pte**, `pte_t`, `pteval_t` = **Page Table Entry** - mentioned earlier.
+  The name is a bit confusing because while in Linux 1.0 this did refer to a
+  single page table entry in the top level page table, it was retrofitted
+  to be "what the level above points to". So when two-level page tables were
+  introduced, the *pte* became a list of pointers, which is why
+  `PTRS_PER_PTE` exists. This oxymoronic term can be mildly confusing.
+
+As already mentioned, each level in the page table hierarchy is a *list of
+pointers*, so the **pgd** contains `PTRS_PER_PGD` pointers to the next level
+below, **p4d** contains `PTRS_PER_P4D` pointers to **pud** items and so on. The
+number of pointers on each level is architecture-defined. The most usual layout
+is the `PAGE_SIZE` of the system divided by the number of bytes in a virtual
+address on the system so each page table level is exactly one page worth of
+pointers, which is usually what computer architects choose::
+
+    PMD
+  +-----+           PTE
+  | ptr |-------> +-----+
+  | ptr |-        | ptr |-------> PAGE
+  | ptr | \       | ptr |
+  | ptr |  \        ...
+  | ... |   \
+  | ptr |    \         PTE
+  +-----+     +----> +-----+
+                     | ptr |-------> PAGE
+                     | ptr |
+                       ...
+
+
+Each pointer in the lowest level of the page table hierarchy, i.e. each
+`pteval_t`-entry of the `PTRS_PER_PTE` entries in a `pte_t *`, will map exactly
+one `PAGE_SIZE`:d page of physical memory to exactly one page of virtual memory.
+
+The pte page table entries (pointers) on the lowest level of the hierarchy
+typically contain the high bits of a virtual address in its high bits, and in
+the lower bits it contains architecture-dependent control bits pertaining to
+the page.
+
+If the architecture does not use all the page table levels, they can be *folded*
+which means skipped, and all operations performed on page tables will be
+compile-time augmented to just skip a level when accessing the next lower
+level. Page table handling code that wish to be architecture-neutral, such as
+the virtual memory manager, will however need to be written so that it
+traverses all of the currently five levels.
-- 
2.40.1

