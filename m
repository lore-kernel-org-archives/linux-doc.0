Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D26C77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbjE3OEt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjE3OEs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:04:48 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E081F3
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=q8TUQt8YnxjlNGCvUsFaTTf2K7LNZ0RBLteg63TX/40=; b=fxnUJ+jpvl1w6yNYZrgBe7FvMd
        osL8PBkY7rkKKwaGUoU/V04vXCp+spzH2atkY9KzwuQ7uTCnTfpBDQtOykIa6jqrlTj2/u26f2zS0
        DViXmiVmmIy2rKwK4aUSUyjbmVp9Ob+2lNJia1dgatsm7UCpqurivOUyaJ1KkM1mAl/COG11DcEnm
        djQlVZEarSwSjRWl4s1E2PbfvVgzOTeesu/ao8TJszIsBeB9samBvhwHfg2EDN6dZ+P3tcfAy2hBJ
        L7wr6S7edKoYHt6UNm2+aUAO6urVMUckTPP+Omn24HCsnuJ1C+zRdp8J1NKewU8+xcT+DD0D8Hubu
        puIGra+Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50816 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zxt-0002q8-V1; Tue, 30 May 2023 15:04:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zxt-00A5Jz-CF; Tue, 30 May 2023 15:04:45 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 03/17] arm64: provide cpu_replace_ttbr1_phys()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zxt-00A5Jz-CF@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:04:45 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide a version of cpu_replace_ttbr1_phys() which operates using a
physical address rather than the virtual address of the page tables.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/mmu_context.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 56911691bef0..4aa6afc6f935 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -148,7 +148,7 @@ static inline void cpu_install_ttbr0(phys_addr_t ttbr0, unsigned long t0sz)
  * Atomically replaces the active TTBR1_EL1 PGD with a new VA-compatible PGD,
  * avoiding the possibility of conflicting TLB entries being allocated.
  */
-static inline void cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap)
+static inline void cpu_replace_ttbr1_phys(phys_addr_t pgd_phys, pgd_t *idmap)
 {
 	typedef void (ttbr_replace_func)(phys_addr_t);
 	extern ttbr_replace_func idmap_cpu_replace_ttbr1;
@@ -156,9 +156,10 @@ static inline void cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap)
 	unsigned long daif;
 
 	/* phys_to_ttbr() zeros lower 2 bits of ttbr with 52-bit PA */
-	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(pgdp));
+	phys_addr_t ttbr1 = phys_to_ttbr(pgd_phys);
 
-	if (system_supports_cnp() && !WARN_ON(pgdp != lm_alias(swapper_pg_dir))) {
+	if (system_supports_cnp() &&
+	    !WARN_ON(pgd_phys != virt_to_phys(lm_alias(swapper_pg_dir)))) {
 		/*
 		 * cpu_replace_ttbr1() is used when there's a boot CPU
 		 * up (i.e. cpufeature framework is not up yet) and
@@ -185,6 +186,11 @@ static inline void cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap)
 	cpu_uninstall_idmap();
 }
 
+static inline void __nocfi cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap)
+{
+	cpu_replace_ttbr1_phys(virt_to_phys(pgdp), idmap);
+}
+
 /*
  * It would be nice to return ASIDs back to the allocator, but unfortunately
  * that introduces a race with a generation rollover where we could erroneously
-- 
2.30.2

