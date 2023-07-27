Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3593FC001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjG0PbI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbjG0PbH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:31:07 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4521BC1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=81UKMmKbHgaP5z+oUfAHrIg9FFPRK2ZpDNlYVjo02BU=; b=ZIR+mSWXty2dSW7m4//S8LY+49
        KWFbm22igOPOliabVO/i4Hu5QB6vrKNnawQzehsxcsgdneiHvCqQCzaXQB/GJn+B8sm9IEA3SC/SQ
        5ya3ioSlbTV2NvfQ0g9zv2nG7dz12+fEqG/pC1E0RQAnl9yBDCyVepp6fdYQ0YLUnFxPVrhGOW9uo
        72aK+IkKvWbp2nIZHg1bMuF3rT+XT7dK0F1WXvF4/evnHLV4fg0D60E1J7eYNYC1JnhHDlLBY0BBr
        fo/TNkN6wrjJLwfYsfle4LtdUtkFCw//kmrx3Q8a5cFPodB/az2gGz/Kbhjc7eoNmwjNyU49Zk8p1
        mD1N6TbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43926 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2xC-000650-0R;
        Thu, 27 Jul 2023 16:31:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2xC-001CYA-7r; Thu, 27 Jul 2023 16:31:02 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 13/16] arm64: text replication: setup page tables for
 copied kernel
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2xC-001CYA-7r@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:31:02 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Setup page table entries in each non-boot NUMA node page table to
point at each node's own copy of the kernel text. This switches
each node to use its own unique copy of the kernel text.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h |  1 +
 arch/arm64/mm/ktext.c          |  8 +++++
 arch/arm64/mm/mmu.c            | 53 ++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
index 386f9812d3c1..6ece59ca90a2 100644
--- a/arch/arm64/include/asm/ktext.h
+++ b/arch/arm64/include/asm/ktext.h
@@ -16,6 +16,7 @@ void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn);
 void ktext_replication_patch_alternative(__le32 *src, int nr_inst);
 void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
 void ktext_replication_init_tramp(void);
+void create_kernel_nid_map(pgd_t *pgdp, void *ktext);
 
 #else
 
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 9efd21eb3308..6692759e78a8 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -136,6 +136,14 @@ void __init ktext_replication_init(void)
 
 		/* Copy initial swapper page directory */
 		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
+
+		/* Clear the kernel mapping */
+		memset(&pgtables[nid]->swapper_pg_dir[kidx], 0,
+		       sizeof(pgtables[nid]->swapper_pg_dir[kidx]));
+
+		/* Create kernel mapping pointing at our local copy */
+		create_kernel_nid_map(pgtables[nid]->swapper_pg_dir,
+				      kernel_texts[nid]);
 	}
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 4ffa2650afd6..fb9c476605d1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -640,6 +640,16 @@ void mark_rodata_ro(void)
 	debug_checkwx();
 }
 
+static void __init create_kernel_mapping(pgd_t *pgdp, phys_addr_t pa_start,
+					 void *va_start, void *va_end,
+					 pgprot_t prot, int flags)
+{
+	size_t size = va_end - va_start;
+
+	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size,
+			     prot, early_pgtable_alloc, flags);
+}
+
 static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 				      pgprot_t prot, struct vm_struct *vma,
 				      int flags, unsigned long vm_flags)
@@ -650,8 +660,7 @@ static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 	BUG_ON(!PAGE_ALIGNED(pa_start));
 	BUG_ON(!PAGE_ALIGNED(size));
 
-	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size, prot,
-			     early_pgtable_alloc, flags);
+	create_kernel_mapping(pgdp, pa_start, va_start, va_end, prot, flags);
 
 	if (!(vm_flags & VM_NO_GUARD))
 		size += PAGE_SIZE;
@@ -720,14 +729,8 @@ static bool arm64_early_this_cpu_has_bti(void)
 						    ID_AA64PFR1_EL1_BT_SHIFT);
 }
 
-/*
- * Create fine-grained mappings for the kernel.
- */
-static void __init map_kernel(pgd_t *pgdp)
+static pgprot_t __init kernel_text_pgprot(void)
 {
-	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
-				vmlinux_initdata, vmlinux_data;
-
 	/*
 	 * External debuggers may need to write directly to the text
 	 * mapping to install SW breakpoints. Allow this (only) when
@@ -743,6 +746,38 @@ static void __init map_kernel(pgd_t *pgdp)
 	if (arm64_early_this_cpu_has_bti())
 		text_prot = __pgprot_modify(text_prot, PTE_GP, PTE_GP);
 
+	return text_prot;
+}
+
+#ifdef CONFIG_REPLICATE_KTEXT
+void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
+{
+	pgprot_t text_prot = kernel_text_pgprot();
+
+	create_kernel_mapping(pgdp, __pa(ktext), _stext, _etext, text_prot, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(__start_rodata),
+			      __start_rodata, __inittext_begin,
+			      PAGE_KERNEL, NO_CONT_MAPPINGS);
+	create_kernel_mapping(pgdp, __pa_symbol(__inittext_begin),
+			      __inittext_begin, __inittext_end,
+			      text_prot, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(__initdata_begin),
+			      __initdata_begin, __initdata_end,
+			      PAGE_KERNEL, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(_data), _data, _end,
+			      PAGE_KERNEL, 0);
+}
+#endif
+
+/*
+ * Create fine-grained mappings for the kernel.
+ */
+static void __init map_kernel(pgd_t *pgdp)
+{
+	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
+				vmlinux_initdata, vmlinux_data;
+	pgprot_t text_prot = kernel_text_pgprot();
+
 	/*
 	 * Only rodata will be remapped with different permissions later on,
 	 * all other segments are allowed to use contiguous mappings.
-- 
2.30.2

