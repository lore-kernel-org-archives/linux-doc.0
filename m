Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F02C77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjE3OEp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbjE3OEo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:04:44 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCF3F9
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ViMJ9zzDgjHP4eU7T/dKOV8UztyaowPjfrn2rFyO8M0=; b=mVvgb3RckzKwUTqA1nfK2mRhje
        z0ghxwtw9PP3bVenM+VRFaM531Ter4eLNHI6HVD2lEgHnW7b5NqO9l3Bc3y1YLT7Q2SufT1zOufJg
        29qIUJyU4ddNhzGuiMhjzZmOld8RhGynhIG1TDjzNc5WPZ2TDnohuuyGjxVQR/Ca1IO5hLrre5PoT
        c4X8VR8G4MbiCRGCOWwAtku/kD8FEdmnslnV+WqAXeiKW5Rbxj42SZlB0m12wu5brKVUwXQToI5Ce
        TEr8kPMNvGKT+eegCuJg9YDWxnyXpzkzv8oTAPNOAZk0ae/roSBRYJXGAsIpIiLxCQkr6XU2+QcMk
        vgF4nCjw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48834 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zxo-0002py-RT; Tue, 30 May 2023 15:04:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zxo-00A5Js-9E; Tue, 30 May 2023 15:04:40 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 02/17] arm64: place kernel in its own L0 page table entry
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zxo-00A5Js-9E@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:04:40 +0100
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
+----------+ MODULES_END, KIMAGE_VADDR = _PAGE_END(VA_BITS_MIN) + PGDIR_SIZE
|  Modules |
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
 arch/arm64/include/asm/memory.h  | 26 ++++++++++----------------
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/arm64/mm/mmu.c              |  3 ++-
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index c735afdf639b..089f556b7387 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -43,9 +43,9 @@
 #define VA_BITS			(CONFIG_ARM64_VA_BITS)
 #define _PAGE_OFFSET(va)	(-(UL(1) << (va)))
 #define PAGE_OFFSET		(_PAGE_OFFSET(VA_BITS))
-#define KIMAGE_VADDR		(MODULES_END)
-#define MODULES_END		(MODULES_VADDR + MODULES_VSIZE)
-#define MODULES_VADDR		(_PAGE_END(VA_BITS_MIN))
+#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + PGDIR_SIZE)
+#define MODULES_END		(KIMAGE_VADDR)
+#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
 #define MODULES_VSIZE		(SZ_128M)
 #define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
 #define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
@@ -199,20 +199,14 @@ extern u64			kimage_vaddr;
 /* the offset between the kernel virtual and physical mappings */
 extern u64			kimage_voffset;
 
-static inline unsigned long kaslr_offset(void)
-{
-	return kimage_vaddr - KIMAGE_VADDR;
-}
+#define kaslr_offset()	((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
 
-static inline bool kaslr_enabled(void)
-{
-	/*
-	 * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
-	 * placement of the image rather than from the seed, so a displacement
-	 * of less than MIN_KIMG_ALIGN means that no seed was provided.
-	 */
-	return kaslr_offset() >= MIN_KIMG_ALIGN;
-}
+/*
+ * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
+ * placement of the image rather than from the seed, so a displacement
+ * of less than MIN_KIMG_ALIGN means that no seed was provided.
+ */
+#define kaslr_enabled()	(kaslr_offset() >= MIN_KIMG_ALIGN)
 
 /*
  * Allow all memory at the discovery stage. We will clip it later.
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
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 4829abe017e9..baf74d0c43c9 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -478,7 +478,8 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 				phys_addr_t size, pgprot_t prot)
 {
-	if ((virt >= PAGE_END) && (virt < VMALLOC_START)) {
+	if ((virt >= PAGE_END) && (virt < VMALLOC_START) &&
+	    !is_kernel(virt)) {
 		pr_warn("BUG: not updating mapping for %pa at 0x%016lx - outside kernel range\n",
 			&phys, virt);
 		return;
-- 
2.30.2

