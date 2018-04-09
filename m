Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 65C717E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751291AbeDIN5f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:57:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47926 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752178AbeDIN5c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 09:57:32 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w39Dueve077648
        for <linux-doc@vger.kernel.org>; Mon, 9 Apr 2018 09:57:31 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2h85tyaka0-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 09:57:28 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
        Mon, 9 Apr 2018 14:57:23 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 9 Apr 2018 14:57:15 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w39DvFYm10617220;
        Mon, 9 Apr 2018 13:57:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8E1EEAE051;
        Mon,  9 Apr 2018 14:47:13 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7E013AE057;
        Mon,  9 Apr 2018 14:47:11 +0100 (BST)
Received: from nimbus.lab.toulouse-stg.fr.ibm.com (unknown [9.145.186.179])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  9 Apr 2018 14:47:11 +0100 (BST)
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
Subject: [PATCH 1/3] mm: introduce ARCH_HAS_PTE_SPECIAL
Date:   Mon,  9 Apr 2018 15:57:07 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
References: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18040913-0008-0000-0000-000004E860A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040913-0009-0000-0000-00001E7B8549
Message-Id: <1523282229-20731-2-git-send-email-ldufour@linux.vnet.ibm.com>
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

Currently the PTE special supports is turned on in per architecture header
files. Most of the time, it is defined in arch/*/include/asm/pgtable.h
depending or not on some other per architecture static definition.

This patch introduce a new configuration variable to manage this directly
in the Kconfig files. It would later replace __HAVE_ARCH_PTE_SPECIAL.

Here notes for some architecture where the definition of
__HAVE_ARCH_PTE_SPECIAL is not obvious:

arm
 __HAVE_ARCH_PTE_SPECIAL which is currently defined in
arch/arm/include/asm/pgtable-3level.h which is included by
arch/arm/include/asm/pgtable.h when CONFIG_ARM_LPAE is set.
So select ARCH_HAS_PTE_SPECIAL if ARM_LPAE.

powerpc
__HAVE_ARCH_PTE_SPECIAL is defined in 2 files:
 - arch/powerpc/include/asm/book3s/64/pgtable.h
 - arch/powerpc/include/asm/pte-common.h
The first one is included if (PPC_BOOK3S & PPC64) while the second is
included in all the other cases.
So select ARCH_HAS_PTE_SPECIAL all the time.

sparc:
__HAVE_ARCH_PTE_SPECIAL is defined if defined(__sparc__) &&
defined(__arch64__) which are defined through the compiler in
sparc/Makefile if !SPARC32 which I assume to be if SPARC64.
So select ARCH_HAS_PTE_SPECIAL if SPARC64

Suggested-by: Jerome Glisse <jglisse@redhat.com>
Signed-off-by: Laurent Dufour <ldufour@linux.vnet.ibm.com>
---
 arch/arc/Kconfig     | 1 +
 arch/arm/Kconfig     | 1 +
 arch/arm64/Kconfig   | 1 +
 arch/powerpc/Kconfig | 1 +
 arch/riscv/Kconfig   | 1 +
 arch/s390/Kconfig    | 1 +
 arch/sh/Kconfig      | 1 +
 arch/sparc/Kconfig   | 1 +
 arch/x86/Kconfig     | 1 +
 mm/Kconfig           | 3 +++
 10 files changed, 12 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d76bf4a83740..8516e2b0239a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -44,6 +44,7 @@ config ARC
 	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZMA
+	select ARCH_HAS_PTE_SPECIAL
 
 config MIGHT_HAVE_PCI
 	bool
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1878083771af..a67973cb041c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -7,6 +7,7 @@ config ARM
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
+	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 276e96ceaf27..7ae3c09921fb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -17,6 +17,7 @@ config ARM64
 	select ARCH_HAS_GIGANTIC_PAGE if (MEMORY_ISOLATION && COMPACTION) || CMA
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SG_CHAIN
 	select ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c32a181a7cbb..f7415fe25c07 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -141,6 +141,7 @@ config PPC
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API                if PPC64
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE
 	select ARCH_HAS_SG_CHAIN
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 148865de1692..b0a8404bf684 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
+	select ARCH_HAS_PTE_SPECIAL
 
 config MMU
 	def_bool y
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 32a0d5b958bf..5f1f4997e7e9 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -72,6 +72,7 @@ config S390
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE if (MEMORY_ISOLATION && COMPACTION) || CMA
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SG_CHAIN
 	select ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 97fe29316476..a6c75b6806d2 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -50,6 +50,7 @@ config SUPERH
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_NMI
+	select ARCH_HAS_PTE_SPECIAL
 	help
 	  The SuperH is a RISC processor targeted for use in embedded systems
 	  and consumer electronics; it was also used in the Sega Dreamcast
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8767e45f1b2b..6b5a4f05dcb2 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -86,6 +86,7 @@ config SPARC64
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select GENERIC_TIME_VSYSCALL
 	select ARCH_CLOCKSOURCE_DATA
+	select ARCH_HAS_PTE_SPECIAL
 
 config ARCH_DEFCONFIG
 	string
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bf4ddea48e61..3f5fb25486bf 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -56,6 +56,7 @@ config X86
 	select ARCH_HAS_KCOV			if X86_64
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_PMEM_API		if X86_64
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_REFCOUNT
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
 	select ARCH_HAS_SET_MEMORY
diff --git a/mm/Kconfig b/mm/Kconfig
index bf9d6366bced..60ae67b83e62 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -757,3 +757,6 @@ config GUP_BENCHMARK
 	  performance of get_user_pages_fast().
 
 	  See tools/testing/selftests/vm/gup_benchmark.c
+
+config ARCH_HAS_PTE_SPECIAL
+	bool
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
