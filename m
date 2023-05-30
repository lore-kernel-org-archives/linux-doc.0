Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919BDC77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjE3OEj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbjE3OEi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:04:38 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CF5C5
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ec+Kz+6HYn6Bv7Pf4i2WLVnJVgRzIVT2Uy7ccItK/SY=; b=ZGtLVJfQg8epRb1ukMdOtU6sOt
        Ec1I6qZt361VTaYDUdtYIZZR8LqqgBPTvnDkJgn8rjt+pDVjsiOOKSKPQmeD/sWQVR7GFGFdMQcJh
        wKhXPPS/6DUJbpwb7RCdGoO7H+yXviDLC7cf00WhxmpVIjTdiPVPd7FSYJ+Q5mlKCRJ67gxUR/0IB
        GlAJePHloFzkDvYbSNAEYK+DoQId7oXsTWvNQxSyqG9M9v+1IlDw/2fKy+rzQt9lLWrppuXJ8IWqB
        B2XmtwiNHExwW3kJY6aLMOzgMIWGBUFssnY+DWZuQl+Se0iroezOWCJkwDLanjQfk180SZ5DAlzXs
        wz78a34Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48830 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zxj-0002pm-QH; Tue, 30 May 2023 15:04:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zxj-00A5Jm-5k; Tue, 30 May 2023 15:04:35 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 01/17] arm64: consolidate rox page protection logic
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zxj-00A5Jm-5k@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:04:35 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Consolidate the arm64 decision making for the page protections used
for executable pages, used by both the trampoline code and the kernel
text mapping code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/mmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index af6bc8403ee4..4829abe017e9 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -663,12 +663,17 @@ static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 	vm_area_add_early(vma);
 }
 
+static pgprot_t kernel_exec_prot(void)
+{
+	return rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+}
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 static int __init map_entry_trampoline(void)
 {
 	int i;
 
-	pgprot_t prot = rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+	pgprot_t prot = kernel_exec_prot();
 	phys_addr_t pa_start = __pa_symbol(__entry_tramp_text_start);
 
 	/* The trampoline is always mapped and can therefore be global */
@@ -723,7 +728,7 @@ static void __init map_kernel(pgd_t *pgdp)
 	 * mapping to install SW breakpoints. Allow this (only) when
 	 * explicitly requested with rodata=off.
 	 */
-	pgprot_t text_prot = rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+	pgprot_t text_prot = kernel_exec_prot();
 
 	/*
 	 * If we have a CPU that supports BTI and a kernel built for
-- 
2.30.2

