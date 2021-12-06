Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7AEC43217
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 10:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241217AbhLFKxv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 05:53:51 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47648
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241078AbhLFKxu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 05:53:50 -0500
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCEEB3F1FD
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638787820;
        bh=AamuRCUDtOeG1u1NXrTV8g0J3yQ8ijBKUVLSOIso31U=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SbqC6I/wHRc9zF/caGYex6nPjNy3q/4x7atXFMl8/m82LnWd4f3xikkhlqiuokx32
         dUDyIyzoxhZKTegy9ll/ydfyV2A6s+v4s0nUPLmJwPlSXwefcjro+ehuoeMeIBSU0F
         zgLMlXW7iAXhjrmjojLCJ7j+/Dqp92ha1CsierjwCiVPdFFk0sXAVmWN8BLUAYRW0y
         6Hb/WSisv90MOYv+UMaxdAgkHf3tAdu8MCl6/5Sp3XvNlXNqpm/DTs2nCbpZ38FLs5
         C9hC70QCjzG/BieSTLl2EAI76R0pa9/M6CrIHl17Qjr9ICOjD2tRmY7YwprNZ9BSuX
         D1BASt6bsxNsA==
Received: by mail-wr1-f72.google.com with SMTP id u4-20020a5d4684000000b0017c8c1de97dso1884051wrq.16
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 02:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AamuRCUDtOeG1u1NXrTV8g0J3yQ8ijBKUVLSOIso31U=;
        b=PlV4x/FCO9WfU6YdezH6zntUICqTrUJsSOEedQAFcH7KVG0NNQBjsitj3j2RQB29ls
         edyoMpd7T9lmqOGyt9b8WSYKfO/XcuXatErkwmpwyDQ4PAVCRHXZmt8jeyGX7ZM/KMbm
         hEKA/tsRDvw4VHYl+FZWmnoQ0EY8OQKL0OuvVYmpk4vnzviOrUU11n8yQQbKhcuM3HTw
         VprIGanfPSD0zMrPYGjZ0uxpSE/TRL80Z3El4ja6cJFcy4EPJBzijHQm5S7VaIShOyHg
         B/xS9MeqlCkuCbVLbijmkkP6rkJj+l2ZNDMpaAyFcqzfzcGODa1oHb7eIJX8sOW7IXwD
         DC0A==
X-Gm-Message-State: AOAM530w9BG+2tBCpZXlJandwUVBjVsrEFyixLnaq7irHNXyvS7s74oE
        SriuKXmV0rdSrTSwVLQXXWw3CcSw/SDyQe/gkqEbLrgfQjbo72imjrrO98yVpUTxw/T+erifLc6
        2RDrD4DCGVKtWeMUsueRO7z7gE5QpzHKFeRlONA==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id l14mr36985905wms.64.1638787820352;
        Mon, 06 Dec 2021 02:50:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxALIP8HpicmnY++XN1dNgeUaGcBdRgBM6p5oDSIMlTtJifsil7mmXshzdKlsFj3cPBOgFI3g==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id l14mr36985880wms.64.1638787820171;
        Mon, 06 Dec 2021 02:50:20 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id y7sm10770064wrw.55.2021.12.06.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 02:50:19 -0800 (PST)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <Atish.Patra@rivosinc.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        Mayuresh Chitale <mchitale@ventanamicro.com>,
        panqinglin2020@iscas.ac.cn, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
        linux-arch@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 03/13] riscv: Introduce functions to switch pt_ops
Date:   Mon,  6 Dec 2021 11:46:47 +0100
Message-Id: <20211206104657.433304-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This simply gathers the different pt_ops initialization in functions
where a comment was added to explain why the page table operations must
be changed along the boot process.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c | 74 ++++++++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5010eba52738..1552226fb6bd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -582,6 +582,52 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
 	dtb_early_pa = dtb_pa;
 }
 
+/*
+ * MMU is not enabled, the page tables are allocated directly using
+ * early_pmd/pud/p4d and the address returned is the physical one.
+ */
+void pt_ops_set_early(void)
+{
+	pt_ops.alloc_pte = alloc_pte_early;
+	pt_ops.get_pte_virt = get_pte_virt_early;
+#ifndef __PAGETABLE_PMD_FOLDED
+	pt_ops.alloc_pmd = alloc_pmd_early;
+	pt_ops.get_pmd_virt = get_pmd_virt_early;
+#endif
+}
+
+/*
+ * MMU is enabled but page table setup is not complete yet.
+ * fixmap page table alloc functions must be used as a means to temporarily
+ * map the allocated physical pages since the linear mapping does not exist yet.
+ *
+ * Note that this is called with MMU disabled, hence kernel_mapping_pa_to_va,
+ * but it will be used as described above.
+ */
+void pt_ops_set_fixmap(void)
+{
+	pt_ops.alloc_pte = kernel_mapping_pa_to_va((uintptr_t)alloc_pte_fixmap);
+	pt_ops.get_pte_virt = kernel_mapping_pa_to_va((uintptr_t)get_pte_virt_fixmap);
+#ifndef __PAGETABLE_PMD_FOLDED
+	pt_ops.alloc_pmd = kernel_mapping_pa_to_va((uintptr_t)alloc_pmd_fixmap);
+	pt_ops.get_pmd_virt = kernel_mapping_pa_to_va((uintptr_t)get_pmd_virt_fixmap);
+#endif
+}
+
+/*
+ * MMU is enabled and page table setup is complete, so from now, we can use
+ * generic page allocation functions to setup page table.
+ */
+void pt_ops_set_late(void)
+{
+	pt_ops.alloc_pte = alloc_pte_late;
+	pt_ops.get_pte_virt = get_pte_virt_late;
+#ifndef __PAGETABLE_PMD_FOLDED
+	pt_ops.alloc_pmd = alloc_pmd_late;
+	pt_ops.get_pmd_virt = get_pmd_virt_late;
+#endif
+}
+
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 	pmd_t __maybe_unused fix_bmap_spmd, fix_bmap_epmd;
@@ -626,12 +672,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
 #endif
 
-	pt_ops.alloc_pte = alloc_pte_early;
-	pt_ops.get_pte_virt = get_pte_virt_early;
-#ifndef __PAGETABLE_PMD_FOLDED
-	pt_ops.alloc_pmd = alloc_pmd_early;
-	pt_ops.get_pmd_virt = get_pmd_virt_early;
-#endif
+	pt_ops_set_early();
+
 	/* Setup early PGD for fixmap */
 	create_pgd_mapping(early_pg_dir, FIXADDR_START,
 			   (uintptr_t)fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
@@ -695,6 +737,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 		pr_warn("FIX_BTMAP_BEGIN:     %d\n", FIX_BTMAP_BEGIN);
 	}
 #endif
+
+	pt_ops_set_fixmap();
 }
 
 static void __init setup_vm_final(void)
@@ -703,16 +747,6 @@ static void __init setup_vm_final(void)
 	phys_addr_t pa, start, end;
 	u64 i;
 
-	/**
-	 * MMU is enabled at this point. But page table setup is not complete yet.
-	 * fixmap page table alloc functions should be used at this point
-	 */
-	pt_ops.alloc_pte = alloc_pte_fixmap;
-	pt_ops.get_pte_virt = get_pte_virt_fixmap;
-#ifndef __PAGETABLE_PMD_FOLDED
-	pt_ops.alloc_pmd = alloc_pmd_fixmap;
-	pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
-#endif
 	/* Setup swapper PGD for fixmap */
 	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
 			   __pa_symbol(fixmap_pgd_next),
@@ -754,13 +788,7 @@ static void __init setup_vm_final(void)
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
 	local_flush_tlb_all();
 
-	/* generic page allocation functions must be used to setup page table */
-	pt_ops.alloc_pte = alloc_pte_late;
-	pt_ops.get_pte_virt = get_pte_virt_late;
-#ifndef __PAGETABLE_PMD_FOLDED
-	pt_ops.alloc_pmd = alloc_pmd_late;
-	pt_ops.get_pmd_virt = get_pmd_virt_late;
-#endif
+	pt_ops_set_late();
 }
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.32.0

