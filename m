Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DEDC77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbjE3OF5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjE3OFz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:55 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF7B109
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=j73sK6spBSnIr1eNE6vGhJALNwM1f6fBM4G1hUkLttA=; b=unJutXRiCGHwGOdig5Y2+g+y4u
        cvzjOTL9NH/I5W6AWOt955Qzq8ypMcoEx4IXpoklX9piKIJXI6LbZ03RHWCiE2R4GkpSEoo0W1h3X
        UV6yhD8S78OkfEkLWm58o6rVV0tuoiIlztYe9bOGGcbwoJQ8kBxOA1dNIFx/bW/aUNEz9kxrRG+UM
        LK9fD/qX1I2S2JD/sPuXC2wl/kb7zzWFItH1hQrSkg+SEXmZ0Mu2NQlrN6D6NcO0cVZ48Kz3mU6Ee
        zinw5X2ub0Kz7CCdpxLBZhvC44T04cNSVHXR//ZYCBrBLE5qNQQbXhRzaft+0QorcFK8nNEUBSJnJ
        BjFMPWWw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48868 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyt-0002sp-CG; Tue, 30 May 2023 15:05:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zys-00A5Lw-QO; Tue, 30 May 2023 15:05:46 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 15/17] arm64: text replication: include most of read-only
 data as well
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zys-00A5Lw-QO@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:46 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Include as much of the read-only data in the replication as we can
without needing to move away from the generic RO_DATA() macro in
the linker script.

Unfortunately, the read-only data section is immedaitely followed
by the read-only after init data with no page alignment, which
means we can't have separate mappings for the read-only data
section and everything else. Changing that would mean replacing
the generic RO_DATA() macro which increases the maintenance burden.

however, this is likely not worth the effort as the majority of
read-only data will be covered.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c |  2 +-
 arch/arm64/mm/mmu.c   | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 11eba88fdd49..f64a649f06a4 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -101,7 +101,7 @@ void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 /* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
-	size_t size = _etext - _stext;
+	size_t size = __end_rodata - _stext;
 	int kidx = pgd_index((phys_addr_t)KERNEL_START);
 	int nid;
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2ba5cdfa28ce..5e4cb28f3e5f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -753,11 +753,26 @@ static pgprot_t __init kernel_text_pgprot(void)
 #ifdef CONFIG_REPLICATE_KTEXT
 void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
 {
+	phys_addr_t pa_ktext;
+	size_t ro_offset;
+	void *ro_end;
 	pgprot_t text_prot = kernel_text_pgprot();
 
-	create_kernel_mapping(pgdp, __pa(ktext), _stext, _etext, text_prot, 0);
-	create_kernel_mapping(pgdp, __pa_symbol(__start_rodata),
-			      __start_rodata, __inittext_begin,
+	pa_ktext = __pa(ktext);
+	ro_offset = __pa_symbol(__start_rodata) - __pa_symbol(_stext);
+	/*
+	 * We must not cover the read-only data after init, since this
+	 * is written to during boot, and thus must be shared between
+	 * the NUMA nodes.
+	 */
+	ro_end = PTR_ALIGN_DOWN((void *)__start_ro_after_init, PAGE_SIZE);
+
+	create_kernel_mapping(pgdp, pa_ktext, _stext, _etext, text_prot, 0);
+	create_kernel_mapping(pgdp, pa_ktext + ro_offset,
+			      __start_rodata, ro_end,
+			      PAGE_KERNEL, NO_CONT_MAPPINGS);
+	create_kernel_mapping(pgdp, __pa_symbol(ro_end),
+			      ro_end, __inittext_begin,
 			      PAGE_KERNEL, NO_CONT_MAPPINGS);
 	create_kernel_mapping(pgdp, __pa_symbol(__inittext_begin),
 			      __inittext_begin, __inittext_end,
-- 
2.30.2

