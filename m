Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389531DDC8
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481758; cv=none; b=YBv9qFahM4k0uGNKFWId8Emlk09ZEeSopMBLbhrcnYKbcS96Gw/OL0nZMgPa+ZOB5Wfh++l30196fPZ/O7jyA8QirxaYb7UTdqJG0jCmFo62S1WE568QSjmXHSgQopb1yUmuiF+TUKop2jnCNcIrdHwsJ01RfJ/rtK36Gu6PRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481758; c=relaxed/simple;
	bh=pPc9zLY0CN37AQxkTpU+vYbgGfbWaF6Nps8ZBeJ3h8g=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=jF3lm94VImKcweupBHaTumn0Plc4cKkWcwvXVMe94Xhi+OwyW9fWy/lYLrDPeE72OZps1JW+V4KqgCFlrvd166g3nSPSI/gaCQ7p7CH/Bt4XQDkGQIBcfNNJ1JC0upc0TT9opTk0uf3oGbhE1uECV8n34vRfgIo3wj3Or3ZySXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=c5ncGtve; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="c5ncGtve"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-206b77b9f4bso4406035fac.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481756; x=1706086556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmUdly7faWDAVpax9lMeeQwpkb74i93jCKTOoGeEsOY=;
        b=c5ncGtve+e98UEdZCn2ltnD0cgYuD2R4zXap2pLIFjwQEIE1zL2WlJ/2Q87xFOdMAQ
         By1GRSRKrxVdIalPgn/WUkgDyuXy6qvhK1Y6y/ae2GjhtJUaRWwxcXrRPdD2tJJpy72L
         Rk87D1AY7ic8Rp5QNINsC9Nxw85t4OSLRqi/q5UUpwt0c+r+sYEb756Tv6sJb86dKNv7
         YJk0S2WRi5RrLX75t3N9Nb7dHX2T/bQeIZLzSiUEhC6vMMtDWN9jWxrVZcUaaMgZSJUc
         pEHGABA/ZaZc33QWshs/sGIQzMgppx6ilvfnahf/d88DsOLYtjmkX2MflnY2rf1jzd0p
         zszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481756; x=1706086556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmUdly7faWDAVpax9lMeeQwpkb74i93jCKTOoGeEsOY=;
        b=voljX8Kqj4ozWqxlC7D8uopOQDZ6281v324QNr0C+TQsdfQHmoXLlV6WIbPXJ3Ofpo
         EEY1KfLUhDLAmUxqYPAWIn4f36R9iYxRa7tTFLNlHU4JzOwuzmnh5FcFDbAXAriTL3Bi
         VZVei2QRPd8Csd3qqkj8OKwj4kr01qk2rVCyCbBEgiER4Bcerm1KL14HRv39nSwFZTUF
         lxrVLqwX7wzI78j/xvlrPBXHWckJzyyede3iEPQDRMUsQY7+DYON69LfRDBttlObLCA7
         z4+0s1uXR+2DGj/gssDTTOPTooum2FqsAbWy6i7dj18K4HXDsH4Xa9G/vqLzmR+eSu5u
         PFBQ==
X-Gm-Message-State: AOJu0YxFZ9tjs4uCG+7vQjSCFBVthlFF+twuEDOnTt5CRPda5wGShfOz
	YT6APF0eGpvYWWE48o98s0q1Pl0akal6gg==
X-Google-Smtp-Source: AGHT+IEZ2N/jTA0FYeB2Yy+Vx7ZVV3F+oCVoEOe6XGUbzaRfa00S/467/aLZyQRSxYmrA3YS+gCw3g==
X-Received: by 2002:a05:6871:60e:b0:204:31bf:89bb with SMTP id w14-20020a056871060e00b0020431bf89bbmr12996499oan.89.1705481756390;
        Wed, 17 Jan 2024 00:55:56 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:56 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 10/19] arm64: text replication: create per-node kernel page tables
Date: Wed, 17 Jan 2024 16:53:48 +0800
Message-Id: <20240117085357.31693-11-jiahao.os@bytedance.com>
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

Allocate the level 0 page tables for the per-node kernel text
replication, but copy all level 0 table entries from the NUMA node 0
table. Therefore, for the time being, each node's level 0 page tables
will contain identical entries, and thus other nodes will continue
to use the node 0 kernel text.

Since the level 0 page tables can be updated at runtime to add entries
for vmalloc and module space, propagate these updates to the other
swapper page tables. The exception is if we see an update for the
level 0 entry which points to the kernel mapping.

We also need to setup a copy of the trampoline page tables as well, as
the assembly code relies on the two page tables being a fixed offset
apart.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h | 12 ++++++++++
 arch/arm64/mm/ktext.c          | 42 +++++++++++++++++++++++++++++++++-
 arch/arm64/mm/mmu.c            |  5 ++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
index 289e11289c06..386f9812d3c1 100644
--- a/arch/arm64/include/asm/ktext.h
+++ b/arch/arm64/include/asm/ktext.h
@@ -7,11 +7,15 @@
 
 #include <linux/kprobes.h>
 
+#include <asm/pgtable-types.h>
+
 #ifdef CONFIG_REPLICATE_KTEXT
 
 void ktext_replication_init(void);
 void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn);
 void ktext_replication_patch_alternative(__le32 *src, int nr_inst);
+void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
+void ktext_replication_init_tramp(void);
 
 #else
 
@@ -27,6 +31,14 @@ static inline void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 {
 }
 
+static inline void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+{
+}
+
+static inline void ktext_replication_init_tramp(void)
+{
+}
+
 #endif
 
 #endif
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 7b9a1f1b12a1..9efd21eb3308 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -14,6 +14,7 @@
 #include <asm/cacheflush.h>
 #include <asm/ktext.h>
 #include <asm/memory.h>
+#include <asm/pgalloc.h>
 
 struct pgtables *pgtables[MAX_NUMNODES] = {
 	[0 ... MAX_NUMNODES - 1] = &pgtable_node0,
@@ -97,7 +98,7 @@ void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 	}
 }
 
-/* Allocate memory for the replicated kernel texts. */
+/* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
 	size_t size = _etext - _stext;
@@ -128,5 +129,44 @@ void __init ktext_replication_init(void)
 		memcpy(kernel_texts[nid], _stext, size);
 		caches_clean_inval_pou((u64)kernel_texts[nid],
 				       (u64)kernel_texts[nid] + size);
+
+		/* Allocate the pagetables for this node */
+		pgtables[nid] = memblock_alloc_node(sizeof(*pgtables[0]),
+						    PGD_SIZE, nid);
+
+		/* Copy initial swapper page directory */
+		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
+	}
+}
+
+void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+{
+	unsigned long idx = pgdp - swapper_pg_dir;
+	int nid;
+
+	if (WARN_ON_ONCE(idx >= PTRS_PER_PGD) ||
+	    WARN_ON_ONCE(idx == pgd_index((phys_addr_t)KERNEL_START)))
+		return;
+
+	for_each_node(nid) {
+		if (pgtables[nid]->swapper_pg_dir == swapper_pg_dir)
+			continue;
+
+		WRITE_ONCE(pgtables[nid]->swapper_pg_dir[idx], pgd);
+	}
+}
+
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+void __init ktext_replication_init_tramp(void)
+{
+	int nid;
+
+	for_each_node(nid) {
+		/* Nothing to do for node 0 */
+		if (pgtables[nid]->tramp_pg_dir == tramp_pg_dir)
+			continue;
+
+		memcpy(pgtables[nid]->tramp_pg_dir, tramp_pg_dir, PGD_SIZE);
 	}
 }
+#endif
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 1ac7467d34c9..f3ec38d9e232 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -31,6 +31,7 @@
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
+#include <asm/ktext.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <linux/sizes.h>
@@ -78,6 +79,7 @@ void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 	pgd_t *fixmap_pgdp;
 
 	spin_lock(&swapper_pgdir_lock);
+	ktext_replication_set_swapper_pgd(pgdp, pgd);
 	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
 	WRITE_ONCE(*fixmap_pgdp, pgd);
 	/*
@@ -695,6 +697,9 @@ static int __init map_entry_trampoline(void)
 		__set_fixmap(FIX_ENTRY_TRAMP_TEXT1 - i,
 			     pa_start + i * PAGE_SIZE, PAGE_KERNEL_RO);
 
+	/* Copy trampoline page tables to other numa nodes */
+	ktext_replication_init_tramp();
+
 	return 0;
 }
 core_initcall(map_entry_trampoline);
-- 
2.20.1

