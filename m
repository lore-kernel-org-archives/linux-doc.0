Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B54E07E22E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 08:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752270AbeDKIFp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 04:05:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43986 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752286AbeDKIE1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 04:04:27 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3B84MCI144740
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 04:04:27 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2h97gjy7e5-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 04:04:26 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
        Wed, 11 Apr 2018 09:03:48 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 11 Apr 2018 09:03:40 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3B83d1Q12583238;
        Wed, 11 Apr 2018 08:03:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0674E11C050;
        Wed, 11 Apr 2018 08:55:45 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0DB7F11C066;
        Wed, 11 Apr 2018 08:55:42 +0100 (BST)
Received: from nimbus.lab.toulouse-stg.fr.ibm.com (unknown [9.145.77.191])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 11 Apr 2018 08:55:41 +0100 (BST)
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
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Rientjes <rientjes@google.com>,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 0/2] move __HAVE_ARCH_PTE_SPECIAL in Kconfig
Date:   Wed, 11 Apr 2018 10:03:34 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18041108-0040-0000-0000-0000042CF182
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041108-0041-0000-0000-0000263103A4
Message-Id: <1523433816-14460-1-git-send-email-ldufour@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-11_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804110079
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The per architecture __HAVE_ARCH_PTE_SPECIAL is defined statically in the
per architecture header files. This doesn't allow to make other
configuration dependent on it.

The first patch of this series is replacing __HAVE_ARCH_PTE_SPECIAL by
CONFIG_ARCH_HAS_PTE_SPECIAL defined into the Kconfig files,
setting it automatically when architectures was already setting it in
header file.

The second patch is removing the odd define HAVE_PTE_SPECIAL which is a
duplicate of CONFIG_ARCH_HAS_PTE_SPECIAL.

There is no functional change introduced by this series.

--
Changes since v2:
 * remove __HAVE_ARCH_PTE_SPECIAL in arch/riscv/include/asm/pgtable-bits.h
 * use IS_ENABLED() instead of #ifdef blocks in patch 2

Laurent Dufour (2):
  mm: introduce ARCH_HAS_PTE_SPECIAL
  mm: remove odd HAVE_PTE_SPECIAL

 .../features/vm/pte_special/arch-support.txt          |  2 +-
 arch/arc/Kconfig                                      |  1 +
 arch/arc/include/asm/pgtable.h                        |  2 --
 arch/arm/Kconfig                                      |  1 +
 arch/arm/include/asm/pgtable-3level.h                 |  1 -
 arch/arm64/Kconfig                                    |  1 +
 arch/arm64/include/asm/pgtable.h                      |  2 --
 arch/powerpc/Kconfig                                  |  1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h          |  3 ---
 arch/powerpc/include/asm/pte-common.h                 |  3 ---
 arch/riscv/Kconfig                                    |  1 +
 arch/riscv/include/asm/pgtable-bits.h                 |  3 ---
 arch/s390/Kconfig                                     |  1 +
 arch/s390/include/asm/pgtable.h                       |  1 -
 arch/sh/Kconfig                                       |  1 +
 arch/sh/include/asm/pgtable.h                         |  2 --
 arch/sparc/Kconfig                                    |  1 +
 arch/sparc/include/asm/pgtable_64.h                   |  3 ---
 arch/x86/Kconfig                                      |  1 +
 arch/x86/include/asm/pgtable_types.h                  |  1 -
 include/linux/pfn_t.h                                 |  4 ++--
 mm/Kconfig                                            |  3 +++
 mm/gup.c                                              |  4 ++--
 mm/memory.c                                           | 19 ++++++++-----------
 24 files changed, 25 insertions(+), 37 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
