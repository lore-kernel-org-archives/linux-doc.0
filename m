Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DDAC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 21:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238596AbhKWVva (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237764AbhKWVv1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Nov 2021 16:51:27 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94619C061574
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 13:48:18 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id i9so660520qki.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 13:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dctDXHNU1q9da31Tnsq1sIllSOHxeco7Fe+PBlmDzOE=;
        b=QRtEuFjW+azHFglL/vXbIoRpG2GcaT+OuFjnxiN/cr5tMZOTjkOaxjVqO9BQ2j2T0X
         bvu0kSu9mF8wvz3Wf8GlFhYFxm5YB//jzRPxIHRLdvFDS4NWBXVB8N/iYUTLRQ9yvt9y
         SaPlDSN03ju/2jSmgpd9BE+zEs5gzOHOHHI+zN84xM+BbXA5qLxituZiH7fmtKLHO7J+
         kpyCSiIGpmLr4liw0YTeuT1E5TeQ3WNdNiFNq9TigIC/hv76g+WE0UCwsXS4dEqq2389
         Lqc/PfRaYzHrx93V7f866V6SJ0rxvU3So9Qwxl4olCmYbn/Wn6FSj/QQ3n2rVH5Geec1
         rW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dctDXHNU1q9da31Tnsq1sIllSOHxeco7Fe+PBlmDzOE=;
        b=kj9vPjffylEjPr6HW7AxU/LFYF/3lkqnJTEBuK7VwX80DIe/yJsXwiyB0a3YpjG8pU
         RwxWQhzZHyv9a1H69c449xXtSLcfYhq5EjGs2YOUnPAwSJItiswwt71w2RM7ljM+G13D
         46Km792+mAJL6/0IHsyimMNuYzOIRejFZ3qfRRVqXeSTnsu6KCjzjy7rRKknTSEpLHDr
         eoayl9s+gir7iiQUiDBfsNTQy9TLQshDQfUZsbe0nzUPl0IrgjC7fK7y5jHW+gqOo254
         Wbf8uhbAh24rL+lYdgkrVYcfaC+Es5y4c+oC9frsmWg5q0oOJJ1OeKeQA0wzNs6vaPwN
         t8Cw==
X-Gm-Message-State: AOAM532NKBN0CJU7wOPir7MfkScKRRaBakM+aMR4TEUF7S5Jk0/wq5bn
        dkghlxhdW9eWOubbL75Faz1vAg==
X-Google-Smtp-Source: ABdhPJwc3RXJ+u83+624gMQXyt2/nbmXULhs3IPZTszA4FyZtBuKlkZRHtG4XO2yMdkMPBFiHZWUPQ==
X-Received: by 2002:a05:620a:4148:: with SMTP id k8mr687064qko.0.1637704097705;
        Tue, 23 Nov 2021 13:48:17 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i11sm7356912qko.116.2021.11.23.13.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:48:16 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, rientjes@google.com, pjt@google.com,
        weixugc@google.com, gthelen@google.com, mingo@redhat.com,
        corbet@lwn.net, will@kernel.org, rppt@kernel.org,
        keescook@chromium.org, tglx@linutronix.de, peterz@infradead.org,
        masahiroy@kernel.org, samitolvanen@google.com,
        dave.hansen@linux.intel.com, x86@kernel.org, frederic@kernel.org,
        hpa@zytor.com, aneesh.kumar@linux.ibm.com
Subject: [PATCH 0/3] page table check
Date:   Tue, 23 Nov 2021 21:48:11 +0000
Message-Id: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pasha Tatashin <tatashin@google.com>

Changelog:
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
[4] https://lore.kernel.org/all/20211026173822.502506-1-pasha.tatashin@soleen.com

Previous versions:
RFC: https://lore.kernel.org/all/20211116220038.116484-1-pasha.tatashin@soleen.com

Pasha Tatashin (3):
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
 mm/khugepaged.c                           |  12 +-
 mm/page_alloc.c                           |   4 +
 mm/page_ext.c                             |   4 +
 mm/page_table_check.c                     | 261 ++++++++++++++++++++++
 16 files changed, 553 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/vm/page_table_check.rst
 create mode 100644 include/linux/page_table_check.h
 create mode 100644 mm/page_table_check.c

-- 
2.34.0.rc2.393.gf8c9666880-goog

