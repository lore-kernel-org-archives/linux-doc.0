Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C404DC41513
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjG0PaR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbjG0PaL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:11 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A74171D
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+0TeAiTNMzXFe/AzbLWZ/AnvsbUiDG4Bzu+mfiD7tNE=; b=aConhkK+g/sEV4UZbndv/kyXuB
        aW32ChzzcA2tg0chWBedtLobmHALSUVIRV9XVFOmers4/tFZvOHkLw37dZfPmUlIHu+kXNTLCykbn
        625/hBsxL3EDkg+kEDFHfKWlv1DkM5/4n64H9dsx/eDmcxe/qnBl0ti/Ki212400OvhexGMCYUjdi
        rLHWvB4dqG5kyqwXuiZ/RnAoVpibjRc0tDEGS9uf8AwrI82oaLwjlaPt69bQNG91eDQ5vh8Vk7qVg
        4zLHMrelZFTf8qtlV/Ex0GFite8/nmHQCr9BKG5wvVP/FvdgAcRPwXOhjR7aJ+JEixpouBW82sF/L
        lI7SwnZg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40498 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wH-00062Q-1K;
        Thu, 27 Jul 2023 16:30:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wH-001CWz-Hs; Thu, 27 Jul 2023 16:30:05 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 02/16] arm64: make clean_dcache_range_nopatch() visible
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wH-001CWz-Hs@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:05 +0100
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
index 8ff6610af496..ea3f4104771d 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -121,7 +121,7 @@ static noinstr void patch_alternative(struct alt_instr *alt,
  * accidentally call into the cache.S code, which is patched by us at
  * runtime.
  */
-static noinstr void clean_dcache_range_nopatch(u64 start, u64 end)
+noinstr void clean_dcache_range_nopatch(u64 start, u64 end)
 {
 	u64 cur, d_size, ctr_el0;
 
-- 
2.30.2

