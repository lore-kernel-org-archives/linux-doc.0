Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3CFC55179
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 18:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 968682224A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 18:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J7MAP7wf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757197AbgJ0SFm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 14:05:42 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:37935 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757204AbgJ0OQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Oct 2020 10:16:45 -0400
Received: by mail-qk1-f201.google.com with SMTP id q26so842739qki.5
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2020 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=R5deNKQtKH9EZ+lgyHLcLWPCg/4T3AT3F5cjxg8+c98=;
        b=J7MAP7wfDQOr4LWIH6tftHTKcUc6uD37PxJG1zcBDCOR+wXmeIb/33PMWYRR9a82kb
         kRDLUZVuPiX0zRmYCwWVdotzKoTBUN2iV7DjN16C0J79AosvEnGB4ymg9JOxU1LuIKRp
         edKXeUUzuhtn9P8Y6jVsM0fgcGwzjp1fEA2YbB4g7ettiykPLQICUVwCfyDl+56x6jSe
         XLArJTyJ8ATAwbvce1X+reiqMEwARsSt+FlvICpAV3FVYp0R5WBXwC4K/LQBrZUFld5G
         H08pwCYYTCfA4Ha/fZeG9Cm0fPDqnCoBhTLbBDAmPtiamV3slUe4MtmeGeNbKlzqmLcq
         jEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=R5deNKQtKH9EZ+lgyHLcLWPCg/4T3AT3F5cjxg8+c98=;
        b=UFXPQaxVQIXfnQmPze1IXHiebbfil7Rkz7jlI22EgDh81L0By9PxrlVZzoU2zxUpiN
         lMWWtfi53WJ2K0hdJ739eMQN56XWfgenkcY90cn65GoaRNSjYJ1LgQCnPs+mtdhZ1zQa
         RkDHC1V2+DddqtMlJQ8tOEoyP7Yus9qXcpyUb64/j3JOkQlY7ZL+5Eh2BZhIDkRZ0aKI
         jyb+3fpGJxzp0/PEpZZUbOBE6hNPkWGJhDK9EAXnGdp0WNTzqnH1hRoi7pmaN0iDqtV8
         k/q2ppakKAttu9iXeu1Ff3raJxlFRYs/Ze8Gw1Lg0bKGbxTpDtChJZaFwj0NzcVeL5A3
         D3BQ==
X-Gm-Message-State: AOAM530kynGr+vBGJsm1Yz2FBAJBAvDC6Nj4n3ryKw7EEdr8doROmOXS
        dPtoEbhbC9NkOYxI7tyC+ESnkDYdrw==
X-Google-Smtp-Source: ABdhPJxSALpoLfwMbAEPuqV8a9vrlcvle2XnYiDbr+XSlCQ/PGc9XERM1y0SVkiLGyd+y7VW8SWszXj0HA==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:ad4:54e9:: with SMTP id k9mr2692160qvx.60.1603808203591;
 Tue, 27 Oct 2020 07:16:43 -0700 (PDT)
Date:   Tue, 27 Oct 2020 15:16:00 +0100
In-Reply-To: <20201027141606.426816-1-elver@google.com>
Message-Id: <20201027141606.426816-4-elver@google.com>
Mime-Version: 1.0
References: <20201027141606.426816-1-elver@google.com>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
Subject: [PATCH v5 3/9] arm64, kfence: enable KFENCE for ARM64
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, joern@purestorage.com,
        keescook@chromium.org, mark.rutland@arm.com, penberg@kernel.org,
        peterz@infradead.org, sjpark@amazon.com, tglx@linutronix.de,
        vbabka@suse.cz, will@kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add architecture specific implementation details for KFENCE and enable
KFENCE for the arm64 architecture. In particular, this implements the
required interface in <asm/kfence.h>.

KFENCE requires that attributes for pages from its memory pool can
individually be set. Therefore, force the entire linear map to be mapped
at page granularity. Doing so may result in extra memory allocated for
page tables in case rodata=full is not set; however, currently
CONFIG_RODATA_FULL_DEFAULT_ENABLED=y is the default, and the common case
is therefore not affected by this change.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Co-developed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
v5:
* Move generic page allocation code to core.c [suggested by Jann Horn].
* Remove comment about HAVE_ARCH_KFENCE_STATIC_POOL, since we no longer
  support static pools.
* Force page granularity for the linear map [suggested by Mark Rutland].
---
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/kfence.h | 19 +++++++++++++++++++
 arch/arm64/mm/fault.c           |  4 ++++
 arch/arm64/mm/mmu.c             |  7 ++++++-
 4 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/kfence.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f858c352f72a..2f8b32dddd8b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -135,6 +135,7 @@ config ARM64
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
 	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
+	select HAVE_ARCH_KFENCE if (!ARM64_16K_PAGES && !ARM64_64K_PAGES)
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
new file mode 100644
index 000000000000..5ac0f599cc9a
--- /dev/null
+++ b/arch/arm64/include/asm/kfence.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_KFENCE_H
+#define __ASM_KFENCE_H
+
+#include <asm/cacheflush.h>
+
+#define KFENCE_SKIP_ARCH_FAULT_HANDLER "el1_sync"
+
+static inline bool arch_kfence_init_pool(void) { return true; }
+
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	set_memory_valid(addr, 1, !protect);
+
+	return true;
+}
+
+#endif /* __ASM_KFENCE_H */
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 94c99c1c19e3..ec8ed2943484 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/extable.h>
+#include <linux/kfence.h>
 #include <linux/signal.h>
 #include <linux/mm.h>
 #include <linux/hardirq.h>
@@ -312,6 +313,9 @@ static void __do_kernel_fault(unsigned long addr, unsigned int esr,
 	    "Ignoring spurious kernel translation fault at virtual address %016lx\n", addr))
 		return;
 
+	if (kfence_handle_page_fault(addr))
+		return;
+
 	if (is_el1_permission_fault(addr, esr, regs)) {
 		if (esr & ESR_ELx_WNR)
 			msg = "write to read-only memory";
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 1c0f3e02f731..86be6d1a78ab 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1449,7 +1449,12 @@ int arch_add_memory(int nid, u64 start, u64 size,
 {
 	int ret, flags = 0;
 
-	if (rodata_full || debug_pagealloc_enabled())
+	/*
+	 * KFENCE requires linear map to be mapped at page granularity, so that
+	 * it is possible to protect/unprotect single pages in the KFENCE pool.
+	 */
+	if (rodata_full || debug_pagealloc_enabled() ||
+	    IS_ENABLED(CONFIG_KFENCE))
 		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
-- 
2.29.0.rc2.309.g374f81d7ae-goog

