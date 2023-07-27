Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92932C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbjG0PaX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjG0PaV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:21 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0C1171D
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0W65xWM7Ob4dljZQ3ePDRFaG7Y0QsYhjSpbvt2L/B28=; b=a9ntwDIYuJlV5/RFq2KFwonAZ6
        CNjzyu/7oJYgMvb/e49MK+k3UYihAZuRj/T1S5+YfAKbvcTZevMbbU4HreCpOlEbE06jAGtLvZ+hs
        CBisprgeaXHLt0PjocTpo4YTkfhiASSDmbLaOPvv769n2Zq0IoRdxJQE0BJNRkuMKrQiMiuTjPq9V
        DzC4PDZVCUh0Lturn3xTm7sLTIYn9d9jtoUbH7I7NkEl4pGYEi5VeRZfP3TmKnmfH8ENJO/x3BNi8
        yictd2h0ORdUN7G9UxHWNeDugUP8z6rWxLr/LSNYRXoydCv7IfWvg2nwQG4E8S005Hf/a2hpr3g3u
        x3fBBYfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49430 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wR-00062l-2E;
        Thu, 27 Jul 2023 16:30:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wR-001CXE-Ro; Thu, 27 Jul 2023 16:30:15 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 04/16] arm64: text replication: add init function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wR-001CXE-Ro@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:15 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A simple patch that adds an empty function for kernel text replication
initialisation and hooks it into the initialisation path.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h | 20 ++++++++++++++++++++
 arch/arm64/mm/Makefile         |  2 ++
 arch/arm64/mm/init.c           |  3 +++
 arch/arm64/mm/ktext.c          |  8 ++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/include/asm/ktext.h
 create mode 100644 arch/arm64/mm/ktext.c

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
new file mode 100644
index 000000000000..1a5f7452a3bf
--- /dev/null
+++ b/arch/arm64/include/asm/ktext.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022, Oracle and/or its affiliates.
+ */
+#ifndef ASM_KTEXT_H
+#define ASM_KTEXT_H
+
+#ifdef CONFIG_REPLICATE_KTEXT
+
+void ktext_replication_init(void);
+
+#else
+
+static inline void ktext_replication_init(void)
+{
+}
+
+#endif
+
+#endif
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index dbd1bc95967d..41e705027c57 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -14,3 +14,5 @@ KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
 KASAN_SANITIZE_kasan_init.o	:= n
+
+obj-$(CONFIG_REPLICATE_KTEXT)	+= ktext.o
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d31c3a9290c5..df90738fd6bb 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -36,6 +36,7 @@
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
+#include <asm/ktext.h>
 #include <asm/kvm_host.h>
 #include <asm/memory.h>
 #include <asm/numa.h>
@@ -425,6 +426,8 @@ void __init bootmem_init(void)
 
 	arch_numa_init();
 
+	ktext_replication_init();
+
 	/*
 	 * must be done after arch_numa_init() which calls numa_init() to
 	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
new file mode 100644
index 000000000000..3a8d37c9abc4
--- /dev/null
+++ b/arch/arm64/mm/ktext.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022, Oracle and/or its affiliates.
+ */
+
+void __init ktext_replication_init(void)
+{
+}
-- 
2.30.2

