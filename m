Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD342C77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbjE3OFO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjE3OFK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:10 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45973C5
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kS6q0fvuI7d1aTJBBBQTVQRRjCIadUHAhNRNeZ4W2zs=; b=DSgQPv4FC+r+dieFeCN46fvkig
        tBs0AzAlBQU/QEhDQO/8tp/aP+rwE72PQ1TBiZvJ6h5YhZjhugRuDPIOHI7dyKUc46DUU/0hASyn7
        16CMxOlDmCDIzTbWVrkRZLWpUGDVeSkGnxxDScI0FQC8naUDFCm/EsrSPBwqX0QH7TC89fyYA0tq+
        w29fdhD2rxHCb+nZP6O8qQr4xdC05WL9NQwu7KBUCDtHrZgtiBXleFBm8Jj8iVUsrIc7Dd2meAvEo
        3yaMhIcY62XNOmM/LVycylPpIIynH6kBtwmtc1phU+Rd4vJUZnkFiW2DbAX5cHPZHpftcIbb5Rjcb
        EwSPn8gw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34648 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyE-0002r7-Hm; Tue, 30 May 2023 15:05:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyD-00A5Ki-VV; Tue, 30 May 2023 15:05:06 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 07/17] arm64: text replication: copy initial kernel text
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyD-00A5Ki-VV@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:05 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Allocate memory on the appropriate node for the per-node copies of the
kernel text, and copy the kernel text to that memory. Clean and
invalidate the caches to the point of unification so that the copied
text is correctly visible to the target node.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 901f159c65e6..4c803b89fcfe 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -4,14 +4,23 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/memblock.h>
+#include <linux/numa.h>
 #include <linux/pgtable.h>
+#include <linux/string.h>
 
+#include <asm/cacheflush.h>
 #include <asm/ktext.h>
 #include <asm/memory.h>
 
+static void *kernel_texts[MAX_NUMNODES];
+
+/* Allocate memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
+	size_t size = _etext - _stext;
 	int kidx = pgd_index((phys_addr_t)KERNEL_START);
+	int nid;
 
 	/*
 	 * If we've messed up and the kernel shares a L0 entry with the
@@ -26,4 +35,16 @@ void __init ktext_replication_init(void)
 		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
 		return;
 	}
+
+	for_each_node(nid) {
+		/* Nothing to do for node 0 */
+		if (!nid)
+			continue;
+
+		/* Allocate and copy initial kernel text for this node */
+		kernel_texts[nid] = memblock_alloc_node(size, PAGE_SIZE, nid);
+		memcpy(kernel_texts[nid], _stext, size);
+		caches_clean_inval_pou((u64)kernel_texts[nid],
+				       (u64)kernel_texts[nid] + size);
+	}
 }
-- 
2.30.2

