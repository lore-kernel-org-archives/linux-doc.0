Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71B517DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 15:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754397AbeDJP0G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 11:26:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39008 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754085AbeDJP0F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 11:26:05 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3AFMSTd004158
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 11:26:04 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2h8w119n7w-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 11:26:04 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
        Tue, 10 Apr 2018 16:26:02 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 10 Apr 2018 16:25:53 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3AFPqsf57475112;
        Tue, 10 Apr 2018 15:25:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7C65A52047;
        Tue, 10 Apr 2018 15:16:51 +0100 (BST)
Received: from nimbus.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.33])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 64C1E52043;
        Tue, 10 Apr 2018 15:16:50 +0100 (BST)
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
        David Rientjes <rientjes@google.com>
Subject: [PATCH v2 0/2] move __HAVE_ARCH_PTE_SPECIAL in Kconfig
Date:   Tue, 10 Apr 2018 17:25:49 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18041015-0020-0000-0000-000004103EF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041015-0021-0000-0000-000042A464BD
Message-Id: <1523373951-10981-1-git-send-email-ldufour@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-10_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804100148
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

Laurent Dufour (2):
  mm: introduce ARCH_HAS_PTE_SPECIAL
  mm: remove odd HAVE_PTE_SPECIAL

 .../features/vm/pte_special/arch-support.txt       |  2 +-
 arch/arc/Kconfig                                   |  1 +
 arch/arc/include/asm/pgtable.h                     |  2 --
 arch/arm/Kconfig                                   |  1 +
 arch/arm/include/asm/pgtable-3level.h              |  1 -
 arch/arm64/Kconfig                                 |  1 +
 arch/arm64/include/asm/pgtable.h                   |  2 --
 arch/powerpc/Kconfig                               |  1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h       |  3 ---
 arch/powerpc/include/asm/pte-common.h              |  3 ---
 arch/riscv/Kconfig                                 |  1 +
 arch/s390/Kconfig                                  |  1 +
 arch/s390/include/asm/pgtable.h                    |  1 -
 arch/sh/Kconfig                                    |  1 +
 arch/sh/include/asm/pgtable.h                      |  2 --
 arch/sparc/Kconfig                                 |  1 +
 arch/sparc/include/asm/pgtable_64.h                |  3 ---
 arch/x86/Kconfig                                   |  1 +
 arch/x86/include/asm/pgtable_types.h               |  1 -
 include/linux/pfn_t.h                              |  4 ++--
 mm/Kconfig                                         |  3 +++
 mm/gup.c                                           |  4 ++--
 mm/memory.c                                        | 23 ++++++++++------------
 23 files changed, 27 insertions(+), 36 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
