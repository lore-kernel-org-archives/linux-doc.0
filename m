Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC394C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjG0Pah (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjG0Pag (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:36 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB991BC1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=H67bVYoLhWNzChiULPPa2CQcWOVHZM/oIAaPLDi7i9o=; b=zD9bi4qUtGRJwQel6yFqA04Ryc
        07ybJhD87QsbkPjjVvVlZkwyt+bDa34pxDlWNjyucitEMCHiVceCeqNUdaAQ6a5AAD25/zq/Gp6qn
        EE8LzKFEgBoVJCCrbn2J3bVml0sGl5TAcgLnA450dfdSZU+sNkt9qc3Fv7OcuOSn+Ini57joQ4HyQ
        x+vYU8BKOt0291qFiH9XWRaiFQ6An9K40OD0rx0raJIbb7dAiyIcHUM5MVIuC6d8fRZLQaeRHgebq
        VxGRtBSxgzLu0+VxyNjGhU9N3Rd/2Eco0LqBCULG8ZxoXS/PbQ/WnFqgjXE0JeT81JzZ19Pof1BXk
        Cg7/swEQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45326 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wh-00063K-0V;
        Thu, 27 Jul 2023 16:30:31 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wh-001CXX-9L; Thu, 27 Jul 2023 16:30:31 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 07/16] arm64: text replication: add node text patching
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wh-001CXX-9L@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:31 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for text patching on our replicated texts.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h  | 12 +++++++
 arch/arm64/kernel/alternative.c |  2 ++
 arch/arm64/kernel/patching.c    |  7 +++-
 arch/arm64/mm/ktext.c           | 58 +++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
index 1a5f7452a3bf..289e11289c06 100644
--- a/arch/arm64/include/asm/ktext.h
+++ b/arch/arm64/include/asm/ktext.h
@@ -5,9 +5,13 @@
 #ifndef ASM_KTEXT_H
 #define ASM_KTEXT_H
 
+#include <linux/kprobes.h>
+
 #ifdef CONFIG_REPLICATE_KTEXT
 
 void ktext_replication_init(void);
+void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn);
+void ktext_replication_patch_alternative(__le32 *src, int nr_inst);
 
 #else
 
@@ -15,6 +19,14 @@ static inline void ktext_replication_init(void)
 {
 }
 
+static inline void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn)
+{
+}
+
+static inline void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
+{
+}
+
 #endif
 
 #endif
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index ea3f4104771d..6f17e2b4e1c3 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -15,6 +15,7 @@
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
+#include <asm/ktext.h>
 #include <asm/module.h>
 #include <asm/sections.h>
 #include <asm/vdso.h>
@@ -174,6 +175,7 @@ static void __apply_alternatives(const struct alt_region *region,
 		alt_cb(alt, origptr, updptr, nr_inst);
 
 		if (!is_module) {
+			ktext_replication_patch_alternative(updptr, nr_inst);
 			clean_dcache_range_nopatch((u64)origptr,
 						   (u64)(origptr + nr_inst));
 		}
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index b4835f6d594b..627fff6ddda2 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -10,6 +10,7 @@
 #include <asm/fixmap.h>
 #include <asm/insn.h>
 #include <asm/kprobes.h>
+#include <asm/ktext.h>
 #include <asm/patching.h>
 #include <asm/sections.h>
 
@@ -115,9 +116,13 @@ int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
 		return -EINVAL;
 
 	ret = aarch64_insn_write(tp, insn);
-	if (ret == 0)
+	if (ret == 0) {
+		/* Also patch the other nodes */
+		ktext_replication_patch(tp, cpu_to_le32(insn));
+
 		caches_clean_inval_pou((uintptr_t)tp,
 				     (uintptr_t)tp + AARCH64_INSN_SIZE);
+	}
 
 	return ret;
 }
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 4c803b89fcfe..04b5ceddae4e 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -3,8 +3,10 @@
  * Copyright (C) 2022, Oracle and/or its affiliates.
  */
 
+#include <linux/kallsyms.h>
 #include <linux/kernel.h>
 #include <linux/memblock.h>
+#include <linux/mm.h>
 #include <linux/numa.h>
 #include <linux/pgtable.h>
 #include <linux/string.h>
@@ -15,6 +17,62 @@
 
 static void *kernel_texts[MAX_NUMNODES];
 
+void __kprobes ktext_replication_patch(u32 *tp, __le32 insn)
+{
+	unsigned long offset;
+	int nid, this_nid;
+	__le32 *p;
+
+	if (!is_kernel_text((unsigned long)tp))
+		return;
+
+	offset = (unsigned long)tp - (unsigned long)_stext;
+
+	this_nid = numa_node_id();
+	if (this_nid) {
+		/* The cache maintenance by aarch64_insn_patch_text_nosync()
+		 * will occur on this node. We need it to occur on node 0.
+		 */
+		p = (void *)lm_alias(_stext) + offset;
+		caches_clean_inval_pou((u64)p, (u64)p + AARCH64_INSN_SIZE);
+	}
+
+	for_each_node(nid) {
+		if (!kernel_texts[nid])
+			continue;
+
+		p = kernel_texts[nid] + offset;
+		WRITE_ONCE(*p, insn);
+		caches_clean_inval_pou((u64)p, (u64)p + AARCH64_INSN_SIZE);
+	}
+}
+
+/* Copy the patched alternative from the node0 image to the other
+ * modes. src is the node 0 linear-mapping address.
+ */
+void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
+{
+	unsigned long offset;
+	size_t size;
+	int nid;
+	__le32 *p;
+
+	offset = (unsigned long)src - (unsigned long)lm_alias(_stext);
+	if (offset >= _etext - _stext)
+		return;
+
+	size = AARCH64_INSN_SIZE * nr_inst;
+
+	for_each_node(nid) {
+		if (!kernel_texts[nid])
+			continue;
+
+		p = kernel_texts[nid] + offset;
+		memcpy(p, src, size);
+		clean_dcache_range_nopatch((u64)p, (u64)p + size);
+	}
+}
+
 /* Allocate memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
-- 
2.30.2

