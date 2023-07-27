Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85598C04FE2
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbjG0PaS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjG0PaQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:16 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2C11BC1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uvTxkvmHBcqFK8eJQas9KOF2RbssOQGRGFH22MwP0ec=; b=GaZTOqVmO7ohus88Hy+YEOoBFj
        9VunljIlwIt1LNgu4WKn13WGbHNe12yKwNcLfqQmAyMPbBVA+7+2tslFvyN+OSaIwPDQwnFCtfIfp
        bXP+APuoBokPw/mPTYaEo/ARE0yWMNcq/1wRnbknM6gpBjsUlB/wM70Q1DgYwua2nccQ1kAiOMUgB
        b5+J1SfvLUqQP9Vu+jMPiLPXQR0k6gA/XjuRUParFIagUbuU+shuOo6q0rzWpOegCEDWgVKf83EHv
        mJVXxao8BMqXknSfcGiFwHGg5u8X93RPp4opPq3NCOKtdgWqruV30FhH/S+FfZHKL4PQQDrJSQstJ
        xYDN0mTg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40506 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wM-00062b-1n;
        Thu, 27 Jul 2023 16:30:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wM-001CX8-Mk; Thu, 27 Jul 2023 16:30:10 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 03/16] arm64: place kernel in its own L0 page table entry
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wM-001CX8-Mk@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:10 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel text replication needs to maintain separate per-node page
tables for the kernel text. In order to do this without affecting
other kernel memory mappings, placing the kernel such that it does
not share a L0 page table entry with any other mapping is desirable.

Prior to this commit, the layout without KASLR was:

+----------+
|  vmalloc |
+----------+
|  Kernel  |
+----------+ MODULES_END, VMALLOC_START, KIMAGE_VADDR =
|  Modules |                 MODULES_VADDR + MODULES_VSIZE
+----------+ MODULES_VADDR = _PAGE_END(VA_BITS_MIN)
| VA space |
+----------+ 0

This becomes:

+----------+
|  vmalloc |
+----------+ VMALLOC_START = MODULES_END + PGDIR_SIZE
|  Kernel  |
+----------+ MODULES_END, KIMAGE_VADDR = _PAGE_END(VA_BITS_MIN) +
|  Modules |    max(PGDIR_SIZE, MODULES_VSIZE)
+----------+ MODULES_VADDR = MODULES_END - MODULES_VSIZE
| VA space |
+----------+ 0

This assumes MODULES_VSIZE (128M) <= PGDIR_SIZE.

One side effect of this change is that KIMAGE_VADDR's definition now
includes PGDIR_SIZE (to leave room for the modules) but this is not
defined when asm/memory.h is included. This means KIMAGE_VADDR can
not be used in inline functions within this file, so we convert
kaslr_offset() and kaslr_enabled() to be macros instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/memory.h  | 28 +++++++++++++++++++++-------
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/arm64/kernel/kaslr.c        |  1 +
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index fde4186cc387..9410ec4e4207 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -43,9 +43,26 @@
 #define VA_BITS			(CONFIG_ARM64_VA_BITS)
 #define _PAGE_OFFSET(va)	(-(UL(1) << (va)))
 #define PAGE_OFFSET		(_PAGE_OFFSET(VA_BITS))
-#define KIMAGE_VADDR		(MODULES_END)
-#define MODULES_END		(MODULES_VADDR + MODULES_VSIZE)
-#define MODULES_VADDR		(_PAGE_END(VA_BITS_MIN))
+
+/*
+ * Setting KIMAGE_VADDR has got a lot harder, ideally we'd like to use
+ * min(PGDIR_SIZE, MODULES_VSIZE) but this can't work because this is used
+ * both in assembly as C, where it causes problems. min_t() solves the
+ * C problems but can't be used in assembly.
+ * CONFIG_ARM64_4K_PAGES, PGDIR_SIZE is 2M, 1G, 512G
+ * CONFIG_ARM64_16K_PAGES, PGDIR_SIZE is 32M, 64G or 128T
+ * CONFIG_ARM64_64K_PAGES, PGDIR_SIZE is 512M or 4T
+ */
+#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
+    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
+    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
+#define KIMAGE_OFFSET		MODULES_VSIZE
+#else
+#define KIMAGE_OFFSET		PGDIR_SIZE
+#endif
+#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + KIMAGE_OFFSET)
+#define MODULES_END		(KIMAGE_VADDR)
+#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
 #define MODULES_VSIZE		(SZ_2G)
 #define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
 #define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
@@ -199,10 +216,7 @@ extern u64			kimage_vaddr;
 /* the offset between the kernel virtual and physical mappings */
 extern u64			kimage_voffset;
 
-static inline unsigned long kaslr_offset(void)
-{
-	return kimage_vaddr - KIMAGE_VADDR;
-}
+#define kaslr_offset()	((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
 
 #ifdef CONFIG_RANDOMIZE_BASE
 void kaslr_init(void);
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0bd18de9fd97..cb526e69299d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -21,7 +21,7 @@
  * VMALLOC_END: extends to the available space below vmemmap, PCI I/O space
  *	and fixed mappings
  */
-#define VMALLOC_START		(MODULES_END)
+#define VMALLOC_START		(MODULES_END + PGDIR_SIZE)
 #define VMALLOC_END		(VMEMMAP_START - SZ_256M)
 
 #define vmemmap			((struct page *)VMEMMAP_START - (memstart_addr >> PAGE_SHIFT))
diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 94a269cd1f07..6ffea2ce1a11 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -9,6 +9,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/memory.h>
+#include <asm/pgtable.h>
 
 u16 __initdata memstart_offset_seed;
 
-- 
2.30.2

