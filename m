Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A468C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjG0Pae (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjG0Pac (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:32 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADB91FF2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kS6q0fvuI7d1aTJBBBQTVQRRjCIadUHAhNRNeZ4W2zs=; b=WRD0SkBZpN+XFnicJDX3+ZDD6L
        PFrIl2UBjYeskUrLB7Elnt51CIuMs0qtyzpmdXQ7ZnhTYBYZFlZk0gz01Nj2YkjLWOyJTDwuBf5+I
        CfjjIBllw0f5LV+O0h/VvFlClEc4wCy7HKEh0mginR7S6cZtjxMr612xCxSbQE7Ni6804AzgrJedP
        i2YgYobQwk1m9lu/xgn3GjE2I/oJ6yYGpG7P0W2vOsV9XXmrkzvLJI28OtQ/MC6SywIh3Dm/qhDYG
        b4X/gma9LThFGQwJ9nnXQwpra+X21kEqUt/fA+sRi9b/qC5xC+eDpNkYh8gA6pdl3Sl/mc9rmd5Ya
        MIYvQ+Aw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45314 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wb-000639-37;
        Thu, 27 Jul 2023 16:30:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wc-001CXQ-4h; Thu, 27 Jul 2023 16:30:26 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 06/16] arm64: text replication: copy initial kernel text
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wc-001CXQ-4h@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:26 +0100
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

