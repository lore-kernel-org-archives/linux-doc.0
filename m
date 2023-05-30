Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A6DC7EE2C
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbjE3OFh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjE3OFf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:35 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E00B2
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=35iZ/Ua8mvKVmClKBiJfRXLH3cOhYz9V553i5knsgVc=; b=KHCSuVDS8Gfeua7sdHLXHZGPRu
        iaeB/VaTYkzw+WBiyTdM7zs/FA+oe+MT3xiE61Lyp63ObPyTQYSc4r3DUvamVBKCSN/PHsCxecW6R
        7a43lfESGQO85ohcQj8Nctwtb9wdXoApxuRSn70r54f4xf/KSeZPLdnOM3KHhazNwR2oeeJo13oSP
        kNNLnFVHW3RcQsWbqvcTbV//Pn8R1eM5tx+vRIVDcE6P6ZPJ7xdHDMNy+fkGWT3jEH33/wAy7BqoY
        3lkZemmoZOMsKmxMREhVUtPDul8X0eelm/o/GNFiZ2pcWyx+mNlQ602keyKK2x9yin/EEfI+3j5kI
        Jvj8JqFA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47490 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zye-0002sL-3y; Tue, 30 May 2023 15:05:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyd-00A5LW-Gr; Tue, 30 May 2023 15:05:31 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 12/17] arm64: text replication: boot secondary CPUs with
 appropriate TTBR1
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyd-00A5LW-Gr@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:31 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Arrange for secondary CPUs to boot with TTBR1 pointing at the
appropriate per-node copy of the kernel page tables for the CPUs NUMA
node.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/smp.h    | 1 +
 arch/arm64/kernel/asm-offsets.c | 1 +
 arch/arm64/kernel/head.S        | 3 ++-
 arch/arm64/kernel/smp.c         | 3 +++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index f2d26235bfb4..9a4246141599 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -79,6 +79,7 @@ asmlinkage void secondary_start_kernel(void);
 struct secondary_data {
 	struct task_struct *task;
 	long status;
+	phys_addr_t ttbr1;
 };
 
 extern struct secondary_data secondary_data;
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 0996094b0d22..f3b8cf661de2 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -121,6 +121,7 @@ int main(void)
   DEFINE(IRQ_CPUSTAT_SOFTIRQ_PENDING, offsetof(irq_cpustat_t, __softirq_pending));
   BLANK();
   DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
+  DEFINE(CPU_BOOT_TTBR1,	offsetof(struct secondary_data, ttbr1));
   BLANK();
   DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
   DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index e92caebff46a..e66ee578f755 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -646,7 +646,8 @@ SYM_FUNC_START_LOCAL(secondary_startup)
 	ldr_l	x0, vabits_actual
 #endif
 	bl	__cpu_setup			// initialise processor
-	adrp	x1, swapper_pg_dir
+	adr_l	x1, secondary_data
+	ldr	x1, [x1, #CPU_BOOT_TTBR1]
 	adrp	x2, idmap_pg_dir
 	bl	__enable_mmu
 	ldr	x8, =__secondary_switched
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index d00d4cbb31b1..8b4cd4924abf 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -119,6 +119,9 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	 * page tables.
 	 */
 	secondary_data.task = idle;
+	secondary_data.ttbr1 = __swapper_pg_dir_node_phys(cpu_to_node(cpu));
+	dcache_clean_poc((uintptr_t)&secondary_data,
+			 (uintptr_t)&secondary_data + sizeof(secondary_data));
 	update_cpu_boot_status(CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
-- 
2.30.2

