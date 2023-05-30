Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D370C7EE23
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbjE3OFQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjE3OFO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:14 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53196B2
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AfVF8WKknrmFxQThJnNdxhv6A8Sxo2qqKBgvh/eDYqM=; b=KsYn4wY2z6nF+NCXFfg/6IlsbO
        ew46ZPNDy36Mfa8crNqECJZh1DdbHVeCmqNCf2UsBYcUewFqAv6/pXhM9ZITOR2oM8+FCt688TNwu
        o6G3YvBGy+u2TUHWHWw7bw3HX5muL8JKVkdJpLnWCRx2ExVdyo9ghcetUZp3yTDJVK2ZaXPNNsAux
        QSey23N5jJEhf1t3u3vGYMvz6uAi1DIm0MDjNhLSbk1h9MYVf6pLi6jN8ZiN7WVkMpK/FJZRMQZK1
        x0qSC7FpjDAPfYCPgiF4b4TPLBE//LQGFnvXvoSm25zn+Gi+DrBvrVUQqSFCzE5bhUPB/H1YGxonF
        XGt8jGow==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34652 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyJ-0002rI-L7; Tue, 30 May 2023 15:05:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyJ-00A5Kq-2X; Tue, 30 May 2023 15:05:11 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 08/17] arm64: text replication: add node text patching
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyJ-00A5Kq-2X@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:11 +0100
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
index df9a73458a85..6a897d1dda76 100644
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
index 4c803b89fcfe..80120b5fd29f 100644
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
+	if (WARN_ON_ONCE(offset >= _etext - _stext))
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

