Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D96127E868
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752238AbeDIN6J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:58:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50528 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752235AbeDIN6H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 09:58:07 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w39DvtaK071023
        for <linux-doc@vger.kernel.org>; Mon, 9 Apr 2018 09:58:06 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2h86t97us7-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 09:58:02 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
        Mon, 9 Apr 2018 14:57:27 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 9 Apr 2018 14:57:20 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w39DvKTS14352778;
        Mon, 9 Apr 2018 13:57:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 52F49AE045;
        Mon,  9 Apr 2018 14:47:18 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B6EF7AE056;
        Mon,  9 Apr 2018 14:47:14 +0100 (BST)
Received: from nimbus.lab.toulouse-stg.fr.ibm.com (unknown [9.145.186.179])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  9 Apr 2018 14:47:14 +0100 (BST)
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
Subject: [PATCH 2/3] mm: replace __HAVE_ARCH_PTE_SPECIAL
Date:   Mon,  9 Apr 2018 15:57:08 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
References: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18040913-0008-0000-0000-000004E860A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040913-0009-0000-0000-00001E7B854B
Message-Id: <1523282229-20731-3-git-send-email-ldufour@linux.vnet.ibm.com>
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

Replace __HAVE_ARCH_PTE_SPECIAL by the new configuration variable
CONFIG_ARCH_HAS_PTE_SPECIAL.

Signed-off-by: Laurent Dufour <ldufour@linux.vnet.ibm.com>
---
 Documentation/features/vm/pte_special/arch-support.txt | 2 +-
 include/linux/pfn_t.h                                  | 4 ++--
 mm/gup.c                                               | 4 ++--
 mm/memory.c                                            | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
index 055004f467d2..cd05924ea875 100644
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ b/Documentation/features/vm/pte_special/arch-support.txt
@@ -1,6 +1,6 @@
 #
 # Feature name:          pte_special
-#         Kconfig:       __HAVE_ARCH_PTE_SPECIAL
+#         Kconfig:       ARCH_HAS_PTE_SPECIAL
 #         description:   arch supports the pte_special()/pte_mkspecial() VM APIs
 #
     -----------------------
diff --git a/include/linux/pfn_t.h b/include/linux/pfn_t.h
index a03c2642a87c..21713dc14ce2 100644
--- a/include/linux/pfn_t.h
+++ b/include/linux/pfn_t.h
@@ -122,7 +122,7 @@ pud_t pud_mkdevmap(pud_t pud);
 #endif
 #endif /* __HAVE_ARCH_PTE_DEVMAP */
 
-#ifdef __HAVE_ARCH_PTE_SPECIAL
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
 static inline bool pfn_t_special(pfn_t pfn)
 {
 	return (pfn.val & PFN_SPECIAL) == PFN_SPECIAL;
@@ -132,5 +132,5 @@ static inline bool pfn_t_special(pfn_t pfn)
 {
 	return false;
 }
-#endif /* __HAVE_ARCH_PTE_SPECIAL */
+#endif /* CONFIG_ARCH_HAS_PTE_SPECIAL */
 #endif /* _LINUX_PFN_T_H_ */
diff --git a/mm/gup.c b/mm/gup.c
index 2e2df7f3e92d..9e6a4f70deab 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1354,7 +1354,7 @@ static void undo_dev_pagemap(int *nr, int nr_start, struct page **pages)
 	}
 }
 
-#ifdef __HAVE_ARCH_PTE_SPECIAL
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
 static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 			 int write, struct page **pages, int *nr)
 {
@@ -1430,7 +1430,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 {
 	return 0;
 }
-#endif /* __HAVE_ARCH_PTE_SPECIAL */
+#endif /* CONFIG_ARCH_HAS_PTE_SPECIAL */
 
 #if defined(__HAVE_ARCH_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HUGEPAGE)
 static int __gup_device_huge(unsigned long pfn, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 1bb725631ded..6fc7b9edc18f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -817,7 +817,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  * PFNMAP mappings in order to support COWable mappings.
  *
  */
-#ifdef __HAVE_ARCH_PTE_SPECIAL
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
 # define HAVE_PTE_SPECIAL 1
 #else
 # define HAVE_PTE_SPECIAL 0
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
