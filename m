Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 772167E6A6
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 06:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752319AbeEKGPJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 02:15:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49664 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750852AbeEKGPC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 May 2018 02:15:02 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4B698Dm114622
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 02:15:01 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hw41vv019-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 02:14:59 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Fri, 11 May 2018 07:14:57 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 11 May 2018 07:14:54 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4B6ErGj3211564;
        Fri, 11 May 2018 06:14:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0952042014;
        Fri, 11 May 2018 07:05:53 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A9FAD42011;
        Fri, 11 May 2018 07:05:52 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 11 May 2018 07:05:52 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC879A02D4;
        Fri, 11 May 2018 16:14:51 +1000 (AEST)
From:   "Alastair D'Silva" <alastair@au1.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mikey@neuling.org, vaibhav@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, malat@debian.org,
        felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        andrew.donnellan@au1.ibm.com, fbarrat@linux.vnet.ibm.com,
        corbet@lwn.net, "Alastair D'Silva" <alastair@d-silva.org>
Subject: [PATCH v5 1/7] powerpc: Add TIDR CPU feature for POWER9
Date:   Fri, 11 May 2018 16:12:57 +1000
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511061303.10728-1-alastair@au1.ibm.com>
References: <20180511061303.10728-1-alastair@au1.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18051106-0020-0000-0000-0000041C2466
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051106-0021-0000-0000-000042B12597
Message-Id: <20180511061303.10728-2-alastair@au1.ibm.com>
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-11_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805110057
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alastair D'Silva <alastair@d-silva.org>

This patch adds a CPU feature bit to show whether the CPU has
the TIDR register available, enabling as_notify/wait in userspace.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/include/asm/cputable.h | 3 ++-
 arch/powerpc/kernel/dt_cpu_ftrs.c   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 66fcab13c8b4..9c0a3083571b 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -215,6 +215,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_TM_HV_ASSIST		LONG_ASM_CONST(0x0000100000000000)
 #define CPU_FTR_P9_TM_XER_SO_BUG	LONG_ASM_CONST(0x0000200000000000)
 #define CPU_FTR_P9_TLBIE_BUG		LONG_ASM_CONST(0x0000400000000000)
+#define CPU_FTR_P9_TIDR			LONG_ASM_CONST(0x0000800000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -462,7 +463,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
-	    CPU_FTR_P9_TLBIE_BUG)
+	    CPU_FTR_P9_TLBIE_BUG | CPU_FTR_P9_TIDR)
 #define CPU_FTRS_POWER9_DD1 ((CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD1) & \
 			     (~CPU_FTR_SAO))
 #define CPU_FTRS_POWER9_DD2_0 CPU_FTRS_POWER9
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 8ab51f6ca03a..415555e5b69f 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -716,6 +716,7 @@ static __init void cpufeatures_cpu_quirks(void)
 	if ((version & 0xffff0000) == 0x004e0000) {
 		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_BUG;
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TIDR;
 	}
 
 	/*
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
