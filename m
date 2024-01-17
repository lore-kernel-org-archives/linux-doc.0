Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7550D1DA35
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481745; cv=none; b=Zeqeb91p4QWvSR+L5EnncMPUf1ZZmrbqGfvDe43I0HHLXE2NCh6Q7CXTKisNAXV1GGIQkUmurfsM250RLCsuB9A/FvSo//zVQ2rO9JAEkGybhyyUtRAn5P5G67UroAfRHnkAk7qAo62HbfvXq2wzFFnmsxFOJQ8Nq+bxPz1QHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481745; c=relaxed/simple;
	bh=S5o4RKNBG/vpvA15QbuIqDr3LD0OyzmHQNOlvqoBd2I=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=WlWmARELPzkwywAbX951C/raKoC4A3q8qme+ro/Pa+XCZVMIy4vHvKVoWwQhOcWOaASIs7rPKSt+RF7iQX3+ah0LYJyr6YPfCwslgOCTfaziOg7RvmU3HjrC/qF+/9OwiP38PUEFaden1Okogz8tAIZAhuLCfz3FggYx59We5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BgZweipy; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BgZweipy"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5990d6ade7eso1033314eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481742; x=1706086542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQNP2RBAOiN2WNJ2pt+0D4jsMt+q3mGtcVBnp8dGOZs=;
        b=BgZweipyg/JtpYhW06htepAqaqu+2gXoZqecn5Pha1RsIcHDEfQe31Se3kjbXgTice
         g4aB8Q91nJ84q+vZuNCe7HPuU9VdHxIw9eyhSkiS+2MbTBoFrp9DSZtxHL8HbowD0tT8
         S9xVrAAB6/FUK8GUfG0r7CkQtkFMliEH/UiFb4F+rRNBMwKtuFf6pEJSIF5sDNKB7y4Z
         SEku7if9Lrs+rSC9Hj68S8ft88OlMtxXjcbD43nahp6td67Yl1fhaCpQefCdraQ5jXRV
         7sOz2Dn1Hc4P31KU1UnHw3hYwLW24QLKmzt3aUXbNDg41UVaaz6y7Tz0ps5KFL6KjLgi
         IRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481742; x=1706086542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQNP2RBAOiN2WNJ2pt+0D4jsMt+q3mGtcVBnp8dGOZs=;
        b=sxVhGZcvr8aqtgJzUNaJJxVZhM5jsJoYuIh9IzjiCfv/RpvcxX5o5WQAzxKHTcG1zl
         d7tlMVceguYSfcjRmvG9cjFe+eoTUrZ12CI/X3TRRwWl60yWMOPWIjS6VAOTYSwTNaLa
         3cKuJp/k7E5W4/3jlZAj2nrOBdRfyIT84eIzb45DTYs+ykMaN4/xv94U2SfiN7h4Trdk
         XH1QcjdVUJjAoFTzbIt9cY5eWl3HvFCc9ES+MEwTLMub+fZx97+JU86sM1LY+DW8k8ow
         qrQ3edKG962pn8Nqw/f27yFgYDlkRF/KofOzV7rMfb+DLOxxuMhQNId6Q98HXB55hphK
         tlAw==
X-Gm-Message-State: AOJu0Yxi4bZwG2sxZ0lsg1XOrQdALrquw/ttlR3gMQkf248q9vnZoUIs
	XWzVYLOswERrbLHD8gnlwjBTpra5IPiruQ==
X-Google-Smtp-Source: AGHT+IF7PwgwTvNXiq1RR+dGpbVxnPLpvOn7QI+F6vtWbkx3k9iDmyEAyFdOWfn5INGaLAnJaO5z0Q==
X-Received: by 2002:a4a:9d14:0:b0:598:7aec:474e with SMTP id w20-20020a4a9d14000000b005987aec474emr4373501ooj.19.1705481742541;
        Wed, 17 Jan 2024 00:55:42 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:42 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 07/19] arm64: text replication: add node text patching
Date: Wed, 17 Jan 2024 16:53:45 +0800
Message-Id: <20240117085357.31693-8-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

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
2.20.1

