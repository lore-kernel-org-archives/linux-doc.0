Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF67C04A6A
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjG0Pao (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjG0Pam (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:42 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6141BF2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IOBpLtQM2CaS7C/Ec+fNgQfrrd1kDqArSAg2kFIx4jc=; b=SwqvptSyYvmu105/RME6qd+8Wt
        c6TggVh2DC9x6UZzY47UvebgDy5Dfk33d/sT68snQM65KsuWW/lx3x716PHLiGsy1i2zoNqf930e8
        KbdrpXioGSMpmjWlh5aJL3FZNuu5XBf1u9VxKo06zX68DxqB8y36wC8hgAgTe+exet2hINICNwfAy
        FDFWE02TIQfpM/H+YVVtWWfCF5LfgCscoC4k2egF7lWe6GRv6IgpUHizlI+phnR3CwxSvcBShpI7r
        VBQ0PnImZ7ySSS8qWcoc47N4H4Mg8fH45g2mZPcVUeFxw+421LIEubIpWbqp864eK6alN4+taf4TF
        Y4Nj1ejA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43352 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wm-00063e-0x;
        Thu, 27 Jul 2023 16:30:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wm-001CXd-Ep; Thu, 27 Jul 2023 16:30:36 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 08/16] arm64: text replication: add node 0 page table
 definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wm-001CXd-Ep@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:36 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a struct definition for the level zero page table group (the
optional trampoline page tables, reserved page tables, and swapper page
tables).

Add a symbol and extern declaration for the node 0 page table group.

Add an array of pointers to per-node page tables, which will default to
using the node 0 page table group.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S  |  3 +++
 arch/arm64/mm/ktext.c            |  4 ++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index cb526e69299d..1e72067d1e9e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -615,6 +615,20 @@ extern pgd_t idmap_pg_dir[PTRS_PER_PGD];
 extern pgd_t tramp_pg_dir[PTRS_PER_PGD];
 extern pgd_t reserved_pg_dir[PTRS_PER_PGD];
 
+struct pgtables {
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+	pgd_t tramp_pg_dir[PTRS_PER_PGD];
+#endif
+	pgd_t reserved_pg_dir[PTRS_PER_PGD];
+	pgd_t swapper_pg_dir[PTRS_PER_PGD];
+};
+
+extern struct pgtables pgtable_node0;
+
+#ifdef CONFIG_REPLICATE_KTEXT
+extern struct pgtables *pgtables[MAX_NUMNODES];
+#endif
+
 extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
 
 static inline bool in_swapper_pgdir(void *addr)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 3cd7e76cc562..d3c7ed76adbf 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -212,6 +212,9 @@ SECTIONS
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
 
+	/* pgtable struct - covers the tramp, reserved and swapper pgdirs */
+	pgtable_node0 = .;
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 	tramp_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 04b5ceddae4e..48d7943d6907 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -15,6 +15,10 @@
 #include <asm/ktext.h>
 #include <asm/memory.h>
 
+struct pgtables *pgtables[MAX_NUMNODES] = {
+	[0 ... MAX_NUMNODES - 1] = &pgtable_node0,
+};
+
 static void *kernel_texts[MAX_NUMNODES];
 
 void __kprobes ktext_replication_patch(u32 *tp, __le32 insn)
-- 
2.30.2

