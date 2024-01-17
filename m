Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2F12B92
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481795; cv=none; b=n5fSc2zd+Dnnr6wbfcYFJYGP9vpfJZz6E2wYv0piNhIjDhVDCNcU5TUnDDpp/LiIDWxwekJM4uUQKA1zxPmnG8IStjq45mxGyt45zzKhlaXvp4uif78nx5iEQoLJHTWtdLLzJrc8EKYhPW7F8wNqiutMot8GxjCNzmCtSFfzy2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481795; c=relaxed/simple;
	bh=RBMN6gycGY9lnyxiVrPcihFOzWyfo67cQa+3BcEnKAo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=is+4a9VXR9LyayaNrf0IZhRlcaIADM4QTZqMdZCj4r3nFesBQKX2AhMrb7M6v4ihecHyvAoeGgTANdSXFlxyUEIR6g+3thnoWxMrVSGgIA9EpHbCqQktjB8BpHMQCxO/MGrDRLSqbHw70QRS/RA8WbMkMwODGWqMCqAatecbA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=chGcZsyd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="chGcZsyd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so9447707b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481793; x=1706086593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeVIsUwz0xhmx4PwCYA3XG4J6POs/6O3SdhA3D6aHaM=;
        b=chGcZsydlXshOxs+4I5BEERuOwx8YLCljigZF961zZ1kb9FMYkKOaVi3mf2ZhJv5DV
         khu7M++jGgK2Dw7q6PnX8D3nSjHX35wosrTLYZLyj/m3KLv1YqUaJuNnxEXrT16oMmeL
         p1FDujEMv5QAZyC8OTDkRyKrZ3Z3RYnv9lyC0IyqllONimJ5kqly8KGg4yFNtu9yJ4+n
         7E+zm4d+FeCtce6U6LQZ6B/5R7eSZrhDTM+HUab/riJtPVl8m/elXIwwQrk2kNwyh2XV
         Til0zj8vAaQTef75dsRNBWwVCZf+WCHZGIUYCKMcITwu5Yx4+B5iPfTQWIE++h8t12eK
         hKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481793; x=1706086593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeVIsUwz0xhmx4PwCYA3XG4J6POs/6O3SdhA3D6aHaM=;
        b=kXdKoL3XNUNrE2o96EbFMWBEfUuvmGH3KhLreJjTQwnJKyKW/0tN/tbrVDFTSjsalc
         UlPeMj41aUk/+BDFhIkN6oINRpLTB/FVn5FKwtzn6L9sjpsoD+jsM89Bu50aj5OsB5Hf
         UFqqUBy+nnw5k2Z6luMHNibEi7Jr/T2UeU2THIj400V8FEkONXVU57eOxvFXWiOwkYZH
         LmWL/TUiscAqNQDsk7Z3VXtXzkZV5SDaw74iix6GmP4zfWYdQq57MKU7GAcUWl0uY0N9
         F4fkwXzMKP+GdX9N76DOwISrxaPg55sKweQAxAZxzSuvcKKk9qkXJmQApu1LeOFIWdpg
         XaPQ==
X-Gm-Message-State: AOJu0YwMHOkGEB7yuCmIdfyenIsXaqkoP+K4jZp89c2rPJviwFtKySTo
	XlY/0MP7UL0FDio0rY4wYv3SCkiFMT37oA==
X-Google-Smtp-Source: AGHT+IHMtl06pbS2B2PIhLFMCMZjsMWESaCYz5ip39MWmPcGO74pb+8iEpVQu6LmhwcUyF128nij0A==
X-Received: by 2002:a05:6a00:1254:b0:6da:23d7:3786 with SMTP id u20-20020a056a00125400b006da23d73786mr11028287pfi.21.1705481793012;
        Wed, 17 Jan 2024 00:56:33 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:32 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao.os@bytedance.com>
Subject: [PATCH v3 18/19] arm64: text replication: support more page sizes and levels
Date: Wed, 17 Jan 2024 16:53:56 +0800
Message-Id: <20240117085357.31693-19-jiahao.os@bytedance.com>
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

Previously, the page table group variable (pgtables) of each node
pointed to pgtable_node0 by default. This method only worked properly
in the configuration of 4K page szie and 4-level page table. Because
in this configuration, the offset between the member variables of
struct pgtables is exactly equal to the offset between *_pg_dir defined
in vmlinux.lds.S. But this won't work for other page sizes configurations.

Therefore, we modify the member variables of struct pgtables to pointer
variables and point to the global *_pg_dir defined in vmlinux.lds.S by
default, which will no longer rely on offset equality. The member variables
of struct pgtables will be allocated memory separately and reassigned in
ktext_replication_init(). This will allow us to support more page sizes
and page level configurations.

In addition, the kernel text size is not always smaller than PGDIR_SIZE
(for example, PGDIR_SIZE is 32M when 16K page size and 2-level page table
are configured). The kernel text may need to occupy more than one L0 page
table entry. So we need to clean up the pgdir entry of kernel mapping in
a loop in ktext_replication_init().

But we still cannot support the configuration of 16K page size and 4-level
page table. In this configuration, PGDIR_SIZE is 128T, because it is too large
to allow the kernel text to exclusively occupy at least one L0 page table entry.

Signed-off-by: Hao Jia <jiahao.os@bytedance.com>
---
 arch/arm64/include/asm/pgtable.h | 12 +++-----
 arch/arm64/kernel/vmlinux.lds.S  |  3 --
 arch/arm64/mm/ktext.c            | 53 ++++++++++++++++++++------------
 3 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 62a9d3e11fe1..e0b428e780c7 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -21,7 +21,7 @@
  * VMALLOC_END: extends to the available space below vmemmap, PCI I/O space
  *	and fixed mappings
  */
-#define VMALLOC_START		(MODULES_END + PGDIR_SIZE)
+#define VMALLOC_START		(MODULES_END + KIMAGE_OFFSET)
 #define VMALLOC_END		(VMEMMAP_START - SZ_256M)
 
 #define vmemmap			((struct page *)VMEMMAP_START - (memstart_addr >> PAGE_SHIFT))
@@ -625,17 +625,13 @@ extern pgd_t reserved_pg_dir[PTRS_PER_PGD];
 
 struct pgtables {
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-	pgd_t tramp_pg_dir[PTRS_PER_PGD];
+	pgd_t *tramp_pg_dir;
 #endif
-	pgd_t reserved_pg_dir[PTRS_PER_PGD];
-	pgd_t swapper_pg_dir[PTRS_PER_PGD];
+	pgd_t *reserved_pg_dir;
+	pgd_t *swapper_pg_dir;
 };
 
-extern struct pgtables pgtable_node0;
-
 #ifdef CONFIG_REPLICATE_KTEXT
-extern struct pgtables *pgtables[MAX_NUMNODES];
-
 pgd_t *swapper_pg_dir_node(void);
 phys_addr_t __swapper_pg_dir_node_phys(int nid);
 phys_addr_t swapper_pg_dir_node_phys(void);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index d3c7ed76adbf..3cd7e76cc562 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -212,9 +212,6 @@ SECTIONS
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
 
-	/* pgtable struct - covers the tramp, reserved and swapper pgdirs */
-	pgtable_node0 = .;
-
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 	tramp_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 3dde6e1d99d7..e50828189824 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -16,15 +16,21 @@
 #include <asm/memory.h>
 #include <asm/pgalloc.h>
 
-struct pgtables *pgtables[MAX_NUMNODES] = {
-	[0 ... MAX_NUMNODES - 1] = &pgtable_node0,
+static struct pgtables pgtables[MAX_NUMNODES] = {
+	[0 ... MAX_NUMNODES - 1] = {
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+		tramp_pg_dir,
+#endif
+		reserved_pg_dir,
+		swapper_pg_dir
+	},
 };
 
 static void *kernel_texts[MAX_NUMNODES];
 
 static pgd_t *__swapper_pg_dir_node(int nid)
 {
-	return pgtables[nid]->swapper_pg_dir;
+	return pgtables[nid].swapper_pg_dir;
 }
 
 pgd_t *swapper_pg_dir_node(void)
@@ -116,20 +122,21 @@ early_param("ktext", parse_ktext);
 /* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
+	int kidx_base = pgd_index((phys_addr_t)KERNEL_START);
+	int kidx_end = pgd_index((phys_addr_t)KERNEL_END);
 	size_t size = __end_rodata - _stext;
-	int kidx = pgd_index((phys_addr_t)KERNEL_START);
-	int nid;
+	int nid, i;
 
 	/*
 	 * If we've messed up and the kernel shares a L0 entry with the
 	 * module or vmalloc area, then don't even attempt to use text
 	 * replication.
 	 */
-	if (pgd_index(MODULES_VADDR) == kidx) {
+	if (pgd_index(MODULES_VADDR) == kidx_base) {
 		pr_warn("Kernel is located in the same L0 index as modules - text replication disabled\n");
 		return;
 	}
-	if (pgd_index(VMALLOC_START) == kidx) {
+	if (pgd_index(VMALLOC_START) == kidx_end) {
 		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
 		return;
 	}
@@ -149,36 +156,44 @@ void __init ktext_replication_init(void)
 				       (u64)kernel_texts[nid] + size);
 
 		/* Allocate the pagetables for this node */
-		pgtables[nid] = memblock_alloc_node(sizeof(*pgtables[0]),
-						    PGD_SIZE, nid);
-
+		pgtables[nid].swapper_pg_dir = memblock_alloc_node(sizeof(swapper_pg_dir),
+									PGD_SIZE, nid);
+		pgtables[nid].reserved_pg_dir = memblock_alloc_node(sizeof(reserved_pg_dir),
+									PGD_SIZE, nid);
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+		pgtables[nid].tramp_pg_dir = memblock_alloc_node(sizeof(tramp_pg_dir),
+									PGD_SIZE, nid);
+#endif
 		/* Copy initial swapper page directory */
-		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
+		memcpy(pgtables[nid].swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
 
 		/* Clear the kernel mapping */
-		memset(&pgtables[nid]->swapper_pg_dir[kidx], 0,
-		       sizeof(pgtables[nid]->swapper_pg_dir[kidx]));
+		for (i = kidx_base; i <= kidx_end; i++)
+			memset(&pgtables[nid].swapper_pg_dir[i], 0,
+			       sizeof(pgtables[nid].swapper_pg_dir[i]));
 
 		/* Create kernel mapping pointing at our local copy */
-		create_kernel_nid_map(pgtables[nid]->swapper_pg_dir,
+		create_kernel_nid_map(pgtables[nid].swapper_pg_dir,
 				      kernel_texts[nid]);
 	}
 }
 
 void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 {
+	int kidx_base = pgd_index((phys_addr_t)KERNEL_START);
+	int kidx_end = pgd_index((phys_addr_t)KERNEL_END);
 	unsigned long idx = pgdp - swapper_pg_dir;
 	int nid;
 
 	if (WARN_ON_ONCE(idx >= PTRS_PER_PGD) ||
-	    WARN_ON_ONCE(idx == pgd_index((phys_addr_t)KERNEL_START)))
+	    WARN_ON_ONCE(idx >= kidx_base && idx <= kidx_end))
 		return;
 
 	for_each_node(nid) {
-		if (pgtables[nid]->swapper_pg_dir == swapper_pg_dir)
+		if (pgtables[nid].swapper_pg_dir == swapper_pg_dir)
 			continue;
 
-		WRITE_ONCE(pgtables[nid]->swapper_pg_dir[idx], pgd);
+		WRITE_ONCE(pgtables[nid].swapper_pg_dir[idx], pgd);
 	}
 }
 
@@ -189,10 +204,10 @@ void __init ktext_replication_init_tramp(void)
 
 	for_each_node(nid) {
 		/* Nothing to do for node 0 */
-		if (pgtables[nid]->tramp_pg_dir == tramp_pg_dir)
+		if (!nid)
 			continue;
 
-		memcpy(pgtables[nid]->tramp_pg_dir, tramp_pg_dir, PGD_SIZE);
+		memcpy(pgtables[nid].tramp_pg_dir, tramp_pg_dir, PGD_SIZE);
 	}
 }
 #endif
-- 
2.20.1

