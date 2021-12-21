Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E50BC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 21 Dec 2021 15:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbhLUPqy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhLUPqy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 10:46:54 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05183C06173F
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 07:46:54 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id d21so12933525qkl.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 07:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wp/HeccXa9xnTA9O/FUGVCpEIiwdVnEDZtGGmdBcjUY=;
        b=YiSDTG779I8cLW6rhRB0yFATVSL1P9IPB+kFleWPODdnIr9LmHHJNricj9Yzvf5SiW
         h1jJfg3YuoibR8YlBFmLb0ugestSp4/kLe2TqRd5aZxX55zJCDhnqmQVH9Pg9VXODXBy
         EA2rn/44IZ4myCtSliYeH0eLCzZYJHFNNCjkb21DRh09G2foKG7o7QgssPFbPFOradyT
         xDxqlP+Gal58Y6IuTDSkpVu/NNW4P9/1pHSbrMRW63ANlaKtfciArBErBLWlUd20/u2O
         Af/lSDDyQ4+OJZ2w1iZOCM10P0xOWDURmLXhTlYL33rZhWiZXuwpjmw7VXyywaqq/EEt
         7o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wp/HeccXa9xnTA9O/FUGVCpEIiwdVnEDZtGGmdBcjUY=;
        b=2E0PhFWKX7kyBdBjWSc6eNDmholqVwCqxFblPrNWYLN/jf0caISf5yLSKrFNUpAhAB
         vUHS4M8OnJGLrteRj1lKcoiUYX7BPm6/6Cf5KCfr96/2H896A5bHWSyFeLJbrxI7JNWW
         fOHCWzuyWQh9zbDrlyrkFUkGAGbaMzlvZByCI+8hcaLXe8viJrV/71wJ+UjwzserjtT/
         BAnJrtMTVBhyRFpM+CzwBUm68BtthECytZylmIsiGlYphNS4IJvCzZdou3NeololowmZ
         hrU7VY3O5F9rVLoADJ+4/eeFS0Mi6A9OinfYIzhMAfVSv3w5QDr3RJVema+au/ufZja8
         AKZA==
X-Gm-Message-State: AOAM532eoq/TpFHyG89pFxDeFNGtN1p5iraup//NDF9Sr0VWUep+lcyu
        ecVWxQDknV8CHDj6H72FkjoEgg==
X-Google-Smtp-Source: ABdhPJzRe1rSX6L6kfzO5qYlXvQTw38d6ZvmTR80h9v01mVt4zM0d9lkFGV2fQx/Z9dZDortQdz1Vg==
X-Received: by 2002:a05:620a:28d1:: with SMTP id l17mr2398209qkp.525.1640101613100;
        Tue, 21 Dec 2021 07:46:53 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d20sm224588qtg.73.2021.12.21.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:46:52 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, rientjes@google.com, pjt@google.com,
        weixugc@google.com, gthelen@google.com, mingo@redhat.com,
        corbet@lwn.net, will@kernel.org, rppt@kernel.org,
        keescook@chromium.org, tglx@linutronix.de, peterz@infradead.org,
        masahiroy@kernel.org, samitolvanen@google.com,
        dave.hansen@linux.intel.com, x86@kernel.org, frederic@kernel.org,
        hpa@zytor.com, aneesh.kumar@linux.ibm.com, jirislaby@kernel.org,
        songmuchun@bytedance.com, qydwhotmail@gmail.com, hughd@google.com
Subject: [PATCH v3 0/4] page table check
Date:   Tue, 21 Dec 2021 15:46:46 +0000
Message-Id: <20211221154650.1047963-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pasha Tatashin <tatashin@google.com>

Changelog:
v3:
- Updated "mm: change page type prior to adding page table entry" to
  also include the other cases where we update page table prior to
  struct page. Thanks Hugh Dickins for this review comment.

v2:
- Fixed bug reported by Fushan Wen
  The root cause was that in do_swap_page() we first add page table entry
  and only later change its type to anon.
- Added EXPORT_SYMBOL() to functions which are called from set_pte_* type
  functions.
- Replaced DEFINE_STATIC_KEY_TRUE_RO with DEFINE_STATIC_KEY_TRUE to fix
  issue with module load/unload as reported and root caused by Jiri Slaby

v1:
- Added ptep_clear() to mm/debug_vm_pgtable.c (thanks Anshuman Khandual)
- Addressed documentation comments from Jonathan Corbet.

Ensure that some memory corruptions are prevented by checking at the
time of insertion of entries into user page tables that there is no
illegal sharing.

We have recently found a problem [1] that existed in kernel since 4.14.
The problem was caused by broken page ref count and led to memory
leaking from one process into another. The problem was accidentally
detected by studying a dump of one process and noticing that one page
contains memory that should not belong to this process.

There are some other page->_refcount related problems that were recently
fixed: [2], [3] which potentially could also lead to illegal sharing.

In addition to hardening refcount [4] itself, this work is an attempt to
prevent this class of memory corruption issues.

It uses a simple state machine that is independent from regular MM logic
to check for illegal sharing at time pages are inserted and removed
from page tables.

[1] https://lore.kernel.org/all/xr9335nxwc5y.fsf@gthelen2.svl.corp.google.com
[2] https://lore.kernel.org/all/1582661774-30925-2-git-send-email-akaher@vmware.com
[3] https://lore.kernel.org/all/20210622021423.154662-3-mike.kravetz@oracle.com
[4] https://lore.kernel.org/all/20211221150140.988298-1-pasha.tatashin@soleen.com

Previous versions:
v2: https://lore.kernel.org/all/20211204182314.1470076-1-pasha.tatashin@soleen.com
v1: https://lore.kernel.org/all/20211123214814.3756047-1-pasha.tatashin@soleen.com/
RFC: https://lore.kernel.org/all/20211116220038.116484-1-pasha.tatashin@soleen.com

Pasha Tatashin (4):
  mm: change page type prior to adding page table entry
  mm: ptep_clear() page table helper
  mm: page table check
  x86: mm: add x86_64 support for page table check

 Documentation/vm/arch_pgtable_helpers.rst |   6 +-
 Documentation/vm/index.rst                |   1 +
 Documentation/vm/page_table_check.rst     |  56 +++++
 MAINTAINERS                               |   9 +
 arch/Kconfig                              |   3 +
 arch/x86/Kconfig                          |   1 +
 arch/x86/include/asm/pgtable.h            |  29 ++-
 include/linux/page_table_check.h          | 147 ++++++++++++
 include/linux/pgtable.h                   |   8 +
 mm/Kconfig.debug                          |  24 ++
 mm/Makefile                               |   1 +
 mm/debug_vm_pgtable.c                     |   2 +-
 mm/hugetlb.c                              |   6 +-
 mm/khugepaged.c                           |  12 +-
 mm/memory.c                               |   9 +-
 mm/migrate.c                              |   5 +-
 mm/page_alloc.c                           |   4 +
 mm/page_ext.c                             |   4 +
 mm/page_table_check.c                     | 270 ++++++++++++++++++++++
 mm/swapfile.c                             |   4 +-
 20 files changed, 574 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/vm/page_table_check.rst
 create mode 100644 include/linux/page_table_check.h
 create mode 100644 mm/page_table_check.c

-- 
2.34.1.307.g9b7440fafd-goog

