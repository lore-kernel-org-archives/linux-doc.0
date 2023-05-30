Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FCFC77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbjE3OFP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbjE3OEz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:04:55 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FD8F3
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1EnzjEtF1WYDn+TvglRvqTszcMqj93hsj/tUGVubobk=; b=iYWbHOiKblNGqcX2ob/VU4iK47
        bXycuM9Y1G4L1mnuZjhe5FNdcZpUsdYtA9rdStSvIqyQYG7nTK/saBzT+dWRLLqHtsUmtvBHmG2ey
        OdIFzLqvY+gQ2o6eddRD1ZcYhmge+22JTmY81k+kN86TKMTUmCM8BSSRNsUMPUeBeru2ebcNq8z/M
        oQJOdGe/tbIJTeI4z4RmK2YhScMSJNEhIC7ePMzHANwqh/6lBE7AEExJoVuqVJTmQdymC/RF9K3+g
        wAJ9P0iEujyKbpcoVzTjkZUjj0gR878PCdeY2ry6uDCmrspTdFYy5TZvHnLS5FUDc1eNBMMhNtZUb
        jhMdxrLQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50828 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zxz-0002qI-22; Tue, 30 May 2023 15:04:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zxy-00A5KE-Ft; Tue, 30 May 2023 15:04:50 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 04/17] arm64: make clean_dcache_range_nopatch() visible
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zxy-00A5KE-Ft@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:04:50 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we hook into the kernel text patching code, we will need to call
clean_dcache_range_nopatch() to ensure that the patching of the
replicated kernel text is properly visible to other CPUs. Make this
function available to the replication code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/cacheflush.h | 2 ++
 arch/arm64/kernel/alternative.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 37185e978aeb..ac9ad56d5212 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -104,6 +104,8 @@ static inline void flush_icache_range(unsigned long start, unsigned long end)
 }
 #define flush_icache_range flush_icache_range
 
+void clean_dcache_range_nopatch(u64 start, u64 end);
+
 /*
  * Copy user data from/to a page which is mapped into a different
  * processes address space.  Really, we want to allow our "user
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index d32d4ed5519b..df9a73458a85 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -121,7 +121,7 @@ static noinstr void patch_alternative(struct alt_instr *alt,
  * accidentally call into the cache.S code, which is patched by us at
  * runtime.
  */
-static void clean_dcache_range_nopatch(u64 start, u64 end)
+void clean_dcache_range_nopatch(u64 start, u64 end)
 {
 	u64 cur, d_size, ctr_el0;
 
-- 
2.30.2

