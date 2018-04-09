Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 00C0B7E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752236AbeDIN6R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:58:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57312 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752809AbeDIN5f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 09:57:35 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w39Du2qd003485
        for <linux-doc@vger.kernel.org>; Mon, 9 Apr 2018 09:57:35 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2h86je0npp-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 09:57:34 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
        Mon, 9 Apr 2018 14:57:31 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 9 Apr 2018 14:57:23 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w39DvNsw58065056;
        Mon, 9 Apr 2018 13:57:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 878BAAE055;
        Mon,  9 Apr 2018 14:47:21 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 857D2AE045;
        Mon,  9 Apr 2018 14:47:19 +0100 (BST)
Received: from nimbus.lab.toulouse-stg.fr.ibm.com (unknown [9.145.186.179])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  9 Apr 2018 14:47:19 +0100 (BST)
From:   Laurent Dufour <ldufour@linux.vnet.ibm.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        Jerome Glisse <jglisse@redhat.com>, mhocko@kernel.org,
        aneesh.kumar@linux.vnet.ibm.com, akpm@linux-foundation.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Albert Ou <albert@sifive.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH 3/3] mm: remove __HAVE_ARCH_PTE_SPECIAL
Date:   Mon,  9 Apr 2018 15:57:09 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
References: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18040913-0040-0000-0000-0000042C2797
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040913-0041-0000-0000-0000263032A2
Message-Id: <1523282229-20731-4-git-send-email-ldufour@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-09_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804090148
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is now replaced by Kconfig variable CONFIG_ARCH_HAS_PTE_SPECIAL.

Signed-off-by: Laurent Dufour <ldufour@linux.vnet.ibm.com>
---
 arch/arc/include/asm/pgtable.h               | 2 --
 arch/arm/include/asm/pgtable-3level.h        | 1 -
 arch/arm64/include/asm/pgtable.h             | 2 --
 arch/powerpc/include/asm/book3s/64/pgtable.h | 3 ---
 arch/powerpc/include/asm/pte-common.h        | 3 ---
 arch/s390/include/asm/pgtable.h              | 1 -
 arch/sh/include/asm/pgtable.h                | 2 --
 arch/sparc/include/asm/pgtable_64.h          | 3 ---
 arch/x86/include/asm/pgtable_types.h         | 1 -
 9 files changed, 18 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 08fe33830d4b..8ec5599a0957 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -320,8 +320,6 @@ PTE_BIT_FUNC(mkexec,	|= (_PAGE_EXECUTE));
 PTE_BIT_FUNC(mkspecial,	|= (_PAGE_SPECIAL));
 PTE_BIT_FUNC(mkhuge,	|= (_PAGE_HW_SZ));
 
-#define __HAVE_ARCH_PTE_SPECIAL
-
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 2a4836087358..6d50a11d7793 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -219,7 +219,6 @@ static inline pte_t pte_mkspecial(pte_t pte)
 	pte_val(pte) |= L_PTE_SPECIAL;
 	return pte;
 }
-#define	__HAVE_ARCH_PTE_SPECIAL
 
 #define pmd_write(pmd)		(pmd_isclear((pmd), L_PMD_SECT_RDONLY))
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7e2c27e63cd8..b96c8a186908 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -306,8 +306,6 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
 #define HPAGE_MASK		(~(HPAGE_SIZE - 1))
 #define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
 
-#define __HAVE_ARCH_PTE_SPECIAL
-
 static inline pte_t pgd_pte(pgd_t pgd)
 {
 	return __pte(pgd_val(pgd));
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index a6b9f1d74600..f12d148eccbe 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -338,9 +338,6 @@ extern unsigned long pci_io_base;
 /* Advertise special mapping type for AGP */
 #define HAVE_PAGE_AGP
 
-/* Advertise support for _PAGE_SPECIAL */
-#define __HAVE_ARCH_PTE_SPECIAL
-
 #ifndef __ASSEMBLY__
 
 /*
diff --git a/arch/powerpc/include/asm/pte-common.h b/arch/powerpc/include/asm/pte-common.h
index c4a72c7a8c83..03dfddb1f49a 100644
--- a/arch/powerpc/include/asm/pte-common.h
+++ b/arch/powerpc/include/asm/pte-common.h
@@ -216,9 +216,6 @@ static inline bool pte_user(pte_t pte)
 #define PAGE_AGP		(PAGE_KERNEL_NC)
 #define HAVE_PAGE_AGP
 
-/* Advertise support for _PAGE_SPECIAL */
-#define __HAVE_ARCH_PTE_SPECIAL
-
 #ifndef _PAGE_READ
 /* if not defined, we should not find _PAGE_WRITE too */
 #define _PAGE_READ 0
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 2d24d33bf188..9809694e1389 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -171,7 +171,6 @@ static inline int is_module_addr(void *addr)
 #define _PAGE_WRITE	0x020		/* SW pte write bit */
 #define _PAGE_SPECIAL	0x040		/* SW associated with special page */
 #define _PAGE_UNUSED	0x080		/* SW bit for pgste usage state */
-#define __HAVE_ARCH_PTE_SPECIAL
 
 #ifdef CONFIG_MEM_SOFT_DIRTY
 #define _PAGE_SOFT_DIRTY 0x002		/* SW pte soft dirty bit */
diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 89c513a982fc..f6abfe2bca93 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -156,8 +156,6 @@ extern void page_table_range_init(unsigned long start, unsigned long end,
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
-#define __HAVE_ARCH_PTE_SPECIAL
-
 #include <asm-generic/pgtable.h>
 
 #endif /* __ASM_SH_PGTABLE_H */
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 44d6ac47e035..1393a8ac596b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -117,9 +117,6 @@ bool kern_addr_valid(unsigned long addr);
 #define _PAGE_PMD_HUGE    _AC(0x0100000000000000,UL) /* Huge page            */
 #define _PAGE_PUD_HUGE    _PAGE_PMD_HUGE
 
-/* Advertise support for _PAGE_SPECIAL */
-#define __HAVE_ARCH_PTE_SPECIAL
-
 /* SUN4U pte bits... */
 #define _PAGE_SZ4MB_4U	  _AC(0x6000000000000000,UL) /* 4MB Page             */
 #define _PAGE_SZ512K_4U	  _AC(0x4000000000000000,UL) /* 512K Page            */
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index acfe755562a6..3e195728d7d1 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -65,7 +65,6 @@
 #define _PAGE_PKEY_BIT2	(_AT(pteval_t, 0))
 #define _PAGE_PKEY_BIT3	(_AT(pteval_t, 0))
 #endif
-#define __HAVE_ARCH_PTE_SPECIAL
 
 #define _PAGE_PKEY_MASK (_PAGE_PKEY_BIT0 | \
 			 _PAGE_PKEY_BIT1 | \
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
