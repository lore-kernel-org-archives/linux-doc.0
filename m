Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88AEC77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjE3OFl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbjE3OFk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:40 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21C2F3
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ygnjEx4v2MVO+CzvSSoDe24Bab7+pDTKqVVz0AOs2qk=; b=1BpMFUySZ4yqxhdlJ29sA4+s9l
        GF3ArZWXyOK2dfbEN10nrVpCEluzqroG9fCPR9COYdCPsjTl2ChU4IVhFIfmOEEX37+W3AnV6hrXo
        6o7oVOQKGLS2wwWbXpSrbRQUNq/nTkbtJUi5hpkXNom97w8ijiCNKrw15gjXsMmn0BJKaTmsuF8BA
        r2jnDrj/ik5MtU0EXaUs0fZ4GPhI829CGvnCnJIJASZcPMEQ+jpoDqVMKFaU2hd0G8uDH8U1BXREb
        BpACSYTFTA+Xn1yCfwAuQh+Kayf67B4tfTX5yUfybpKYPSUhrNrqAKoMai2nwmw0lwSVgtNvVnf+P
        D0sFsCbQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48782 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyj-0002sV-71; Tue, 30 May 2023 15:05:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyi-00A5Lg-Kq; Tue, 30 May 2023 15:05:36 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 13/17] arm64: text replication: update cnp support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyi-00A5Lg-Kq@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:36 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add changes for CNP (Common Not Private) support of kernel text
replication. Although text replication has only been tested on
dual-socket Ampere A1 systems, provided the different NUMA nodes
are not part of the same inner shareable domain, CNP should not
be a problem.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/mmu_context.h | 2 +-
 arch/arm64/kernel/cpufeature.c       | 2 +-
 arch/arm64/kernel/suspend.c          | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 4aa6afc6f935..c0e13dc73fd7 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -159,7 +159,7 @@ static inline void cpu_replace_ttbr1_phys(phys_addr_t pgd_phys, pgd_t *idmap)
 	phys_addr_t ttbr1 = phys_to_ttbr(pgd_phys);
 
 	if (system_supports_cnp() &&
-	    !WARN_ON(pgd_phys != virt_to_phys(lm_alias(swapper_pg_dir)))) {
+	    !WARN_ON(pgd_phys != swapper_pg_dir_node_phys())) {
 		/*
 		 * cpu_replace_ttbr1() is used when there's a boot CPU
 		 * up (i.e. cpufeature framework is not up yet) and
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7d7128c65161..fdb93b5b7d8e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3341,7 +3341,7 @@ subsys_initcall_sync(init_32bit_el0_mask);
 
 static void __maybe_unused cpu_enable_cnp(struct arm64_cpu_capabilities const *cap)
 {
-	cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir);
+	cpu_replace_ttbr1_phys(swapper_pg_dir_node_phys(), idmap_pg_dir);
 }
 
 /*
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index 0fbdf5fe64d8..49fa80bafd6d 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -55,7 +55,8 @@ void notrace __cpu_suspend_exit(void)
 
 	/* Restore CnP bit in TTBR1_EL1 */
 	if (system_supports_cnp())
-		cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir);
+		cpu_replace_ttbr1_phys(swapper_pg_dir_node_phys(),
+				       idmap_pg_dir);
 
 	/*
 	 * PSTATE was not saved over suspend/resume, re-enable any detected
-- 
2.30.2

