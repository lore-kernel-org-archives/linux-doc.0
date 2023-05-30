Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C097C7EE23
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjE3OFV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbjE3OFU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:20 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB3DF1
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oXqFasuCpSAoOt6n7DWf+f+JsPewVatr28dIEL6imc4=; b=heK4WxHNpz8UDoxcu3VrZbIJbG
        s2jY/W0+7whvgUpps5quKdEyZw6t4+97sVhXvaE6ibpYgQccSi476pDHpAEF++nAFVMQ2gJN4eU1e
        QqexwGSK3h/yOw0GwdFlb1Dy2O5yoLJaVzqOitGLJFB/nr7WAF4hi70PwVdMdMRYpZKMhKa7wW/rl
        G4XaE8HO3be3G9P+oeLK6PxE+TzHeUFpxN0AfcDJGdJ5ZVjOhw35VvJEVDUAS8k5Kz9j0L0QFnWTg
        tEHtizxAhgYL27klRRq1w8Jvy6TkVjCsfhY41QIbSeERM5TJMtqbQ0YBiJnk6XiTV/02UJhZMnGka
        NjabiIcg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48808 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyO-0002rS-PY; Tue, 30 May 2023 15:05:16 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyO-00A5L2-5y; Tue, 30 May 2023 15:05:16 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 09/17] arm64: text replication: add node 0 page table
 definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyO-00A5L2-5y@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:16 +0100
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
index 80120b5fd29f..85fc97877d75 100644
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

