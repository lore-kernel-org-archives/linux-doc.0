Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA130C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjG0Pa3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjG0Pa0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:26 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3B31FC9
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nyj2l8PY3qAzzBlei2fGIlbkY3GLY8pUVEJtHA0LwRE=; b=bVgJGDhGTIg5HdLjMLDsEtxgmv
        m3DvR2CYMo8YKaU+1N089+ohCZTsM9XponAqRuB5zRKUw+nvNie0fjBreSNKyyGDYVrkHgfk2fA+p
        0dRJxVeniunsHnyiGtCUc+Y9qHqTOYqGRBa3z1bGZPxWprHv8qtaOOFZOUfb2vkm6WafgAvJYnTIG
        QX/dGIM8FYiWJTFDVhy/pmnTaAIKXjxeOsHPMUUVrkXptOfaXdny0a4J8gzMrSReHggcFYDhv8Xo4
        4RYutcI8bwGwR+HHl35qIgAImZbjkM2pjS26YrTIqtktPa4AF84a8ce97paGka0wJ0BBryO5aFHD6
        7lxHSueg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49446 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wW-00062v-2i;
        Thu, 27 Jul 2023 16:30:20 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wW-001CXK-WB; Thu, 27 Jul 2023 16:30:21 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 05/16] arm64: text replication: add sanity checks
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wW-001CXK-WB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:20 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel text and modules must be in separate L0 page table entries.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 3a8d37c9abc4..901f159c65e6 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -3,6 +3,27 @@
  * Copyright (C) 2022, Oracle and/or its affiliates.
  */
 
+#include <linux/kernel.h>
+#include <linux/pgtable.h>
+
+#include <asm/ktext.h>
+#include <asm/memory.h>
+
 void __init ktext_replication_init(void)
 {
+	int kidx = pgd_index((phys_addr_t)KERNEL_START);
+
+	/*
+	 * If we've messed up and the kernel shares a L0 entry with the
+	 * module or vmalloc area, then don't even attempt to use text
+	 * replication.
+	 */
+	if (pgd_index(MODULES_VADDR) == kidx) {
+		pr_warn("Kernel is located in the same L0 index as modules - text replication disabled\n");
+		return;
+	}
+	if (pgd_index(VMALLOC_START) == kidx) {
+		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
+		return;
+	}
 }
-- 
2.30.2

