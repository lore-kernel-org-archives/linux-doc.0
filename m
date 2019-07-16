Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 988187D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 16:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388151AbfGPQ4r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 12:56:47 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40696 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbfGPQ4p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 12:56:45 -0400
Received: by mail-qt1-f193.google.com with SMTP id a15so20285224qtn.7
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2019 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JkgYB201+YgtZ67xz124QalImKwHhD6hCX1vEDo1XAU=;
        b=h5Lfrj4oD0WIqU6ygkd/Fq6YtgSA5kUklS4HcoiluHDChhEtO4DfF3FXAOHZoNSeCm
         Qhej/p8oi+GphDHnwLxKOaFOAJeBkg6l9mlc/+E4PJtYlKxvBn+HtZ4Ta4dpZVmxhbZX
         1K9RtH/Q50Ei12r27O9HiDA+aOe1WIV7OpE+Ur5ro2lt2huOfTy2h/vYCnccPex7x35l
         bxf3Hq39Q/gK7xyaA+Ok5qq5QKv5KwayqGxpnxBPP38fc9PySfALkm1xG8plhfjIY5au
         Ubi4eL+bANK8Z/oL4+ZVTiLwR63VOBupKwcL+wUi6xtjo6aMfBD77X+qKxDGAflTHmNX
         oCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkgYB201+YgtZ67xz124QalImKwHhD6hCX1vEDo1XAU=;
        b=C2EUc26cWiTxnZDUPKF3VKxtloEgCwiXRFGCIaJAXWZzlNXQV5zd/T0g4ft28c9hvM
         0oMk8gxvoDIMIbumSUoFN7MivveURctAA0TTowYZzJwQl8TNdBfhRPK+ylqrhL29dIZR
         Sadf/X8n3ur/PoaPRd90ZR0wfKnRwCm+nzyB+6NJWb7T6YcWeFtEpIhUlwF0kcTm0pxc
         VDMi+7cXXJSsaCBF/FA2J6oeJxcEMVVdfE1FuBNxIFHC2ZX6rk2eoE3vDirSZYSJyDQp
         k8w4I+FGgeHC/91exEpNjlGXxV3YcseyeM3LHDzFrJCS1B+by6QcX2Y1Lugm7MTYo2is
         vi7w==
X-Gm-Message-State: APjAAAUQXSTArLtZD69ZnTNbvay5v1yXdXzE/ZZ7NpMRqXVUbmppGgf4
        PlFvY5ykD7P7Wnbcp9O7Di0wwszP
X-Google-Smtp-Source: APXvYqwZZYB7JTSxjflHH6PzEmuWW65i2dKDOtRvxBkvqU4u3mcg8TDxomQhWhsJDugWob8iCPoiBw==
X-Received: by 2002:ac8:2b49:: with SMTP id 9mr24808489qtv.343.1563296204311;
        Tue, 16 Jul 2019 09:56:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id f20sm8519538qkh.15.2019.07.16.09.56.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 09:56:43 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC v1 1/4] arm64, mm: identity mapped page table
Date:   Tue, 16 Jul 2019 12:56:38 -0400
Message-Id: <20190716165641.6990-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190716165641.6990-1-pasha.tatashin@soleen.com>
References: <20190716165641.6990-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Created identiy mapped page table that maps 1 to 1 virtual to physical
addresses.

Similarly to x86, this table can be used in kasan, hibernate, and kexec.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 arch/arm64/include/asm/ident_map.h | 26 ++++++++
 arch/arm64/mm/Makefile             |  1 +
 arch/arm64/mm/ident_map.c          | 99 ++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/include/asm/ident_map.h
 create mode 100644 arch/arm64/mm/ident_map.c

diff --git a/arch/arm64/include/asm/ident_map.h b/arch/arm64/include/asm/ident_map.h
new file mode 100644
index 000000000000..1bb9fcd27368
--- /dev/null
+++ b/arch/arm64/include/asm/ident_map.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, Microsoft Corporation.
+ * Pavel Tatashin <patatash@linux.microsoft.com>
+ */
+
+#ifndef _ASM_IDENT_MAP_H
+#define _ASM_IDENT_MAP_H
+
+#include <linux/types.h>
+#include <asm/pgtable.h>
+
+struct ident_map_info {
+	void * (*alloc_pgt_page)(void *);	/* allocate a page  */
+	void *alloc_arg;			/* arg. for alloc_pgt_page */
+	unsigned long page_flags;		/* PMD or PUD flags */
+	unsigned long offset;			/* ident mapping offset */
+	bool pud_pages;				/* PUD level huge pages */
+};
+
+int ident_map_pgd_populate(struct ident_map_info *info,
+			   phys_addr_t pgd_page,
+			   phys_addr_t addr,
+			   phys_addr_t end);
+
+#endif /* _ASM_ARM64_IDENT_MAP_H */
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index 849c1df3d214..dfa5a074a360 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -5,6 +5,7 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   context.o proc.o pageattr.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_ARM64_PTDUMP_CORE)	+= dump.o
+obj-$(CONFIG_KEXEC_CORE)	+= ident_map.o
 obj-$(CONFIG_ARM64_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
 obj-$(CONFIG_NUMA)		+= numa.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
diff --git a/arch/arm64/mm/ident_map.c b/arch/arm64/mm/ident_map.c
new file mode 100644
index 000000000000..bcfff5e2573b
--- /dev/null
+++ b/arch/arm64/mm/ident_map.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, Microsoft Corporation.
+ * Pavel Tatashin <patatash@linux.microsoft.com>
+ */
+
+#include <asm/ident_map.h>
+#include <asm/pgalloc.h>
+
+/* Initialize PMD size huge entries in page table */
+static void ident_map_pmd_init(struct ident_map_info *info,
+			       phys_addr_t pmd_page, phys_addr_t addr,
+			       phys_addr_t end)
+{
+	const unsigned long flags = info->page_flags;
+	const unsigned long offset = info->offset;
+	pmd_t *pmdp = (pmd_t *)__va(pmd_page) + pmd_index(addr);
+
+	addr &= PMD_MASK;
+	for (; addr < end; addr += PMD_SIZE, pmdp++) {
+		set_pmd(pmdp, __pmd(__phys_to_pmd_val(addr - offset) | flags));
+	}
+}
+
+/* Initialize PUD size huge entries in page table */
+static void ident_map_pud_init(struct ident_map_info *info,
+			       phys_addr_t pud_page, phys_addr_t addr,
+			       phys_addr_t end)
+{
+	const unsigned long flags = info->page_flags;
+	const unsigned long offset = info->offset;
+	pud_t *pudp = (pud_t *)__va(pud_page) + pud_index(addr);
+
+	addr &= PUD_MASK;
+	for (; addr < end; addr += PUD_SIZE, pudp++) {
+		set_pud(pudp, __pud(__phys_to_pud_val(addr - offset) | flags));
+	}
+}
+
+/* Populate PUD level with PMD entries */
+static int ident_map_pud_populate(struct ident_map_info *info,
+				  phys_addr_t pud_page, phys_addr_t addr,
+				  phys_addr_t end)
+{
+	pud_t *pudp = (pud_t *)__va(pud_page) + pud_index(addr);
+	phys_addr_t pmd_page, next;
+
+	for (; addr < end; addr = next, pudp++) {
+		next = pud_addr_end(addr, end);
+		if (pud_none(*pudp)) {
+			void *pmd = info->alloc_pgt_page(info->alloc_arg);
+
+			if (!pmd)
+				return -ENOMEM;
+
+			clear_page(pmd);
+			__pud_populate(pudp, __pa(pmd), PUD_TYPE_TABLE);
+		}
+		pmd_page = __pud_to_phys(*pudp);
+		ident_map_pmd_init(info, pmd_page, addr, next);
+	}
+
+	return 0;
+}
+
+/* Populate identify mapped page table with physical range[addr, end) */
+int ident_map_pgd_populate(struct ident_map_info *info,
+			   phys_addr_t pgd_page, phys_addr_t addr,
+			   phys_addr_t end)
+{
+	const bool pud_pages = info->pud_pages;
+	pgd_t *pgdp = (pgd_t *)__va(pgd_page) + pgd_index(addr);
+	phys_addr_t pud_page, next;
+
+	for (; addr < end; addr = next, pgdp++) {
+		next = pgd_addr_end(addr, end);
+		if (pgd_none(*pgdp)) {
+			void *pud = info->alloc_pgt_page(info->alloc_arg);
+
+			if (!pud)
+				return -ENOMEM;
+
+			clear_page(pud);
+			__pgd_populate(pgdp, __pa(pud), PUD_TYPE_TABLE);
+		}
+		pud_page = __pgd_to_phys(*pgdp);
+		if (pud_pages) {
+			ident_map_pud_init(info, pud_page, addr, next);
+		} else {
+			int rv = ident_map_pud_populate(info, pud_page, addr,
+				 next);
+
+			if (rv)
+				return rv;
+		}
+	}
+
+	return 0;
+}
-- 
2.22.0

