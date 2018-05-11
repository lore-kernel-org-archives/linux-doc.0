Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 675757DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 06:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751462AbeEKGPA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 02:15:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44204 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750751AbeEKGO7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 May 2018 02:14:59 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4B69CFO011407
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 02:14:58 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hw1uggh2p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 02:14:58 -0400
Received: from localhost
        by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Fri, 11 May 2018 07:14:56 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 11 May 2018 07:14:54 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4B6Ers13080570;
        Fri, 11 May 2018 06:14:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A0F69A405D;
        Fri, 11 May 2018 07:06:30 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4D115A4040;
        Fri, 11 May 2018 07:06:30 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 11 May 2018 07:06:30 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C313AA0300;
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
Subject: [PATCH v5 2/7] powerpc: Use TIDR CPU feature to control TIDR allocation
Date:   Fri, 11 May 2018 16:12:58 +1000
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511061303.10728-1-alastair@au1.ibm.com>
References: <20180511061303.10728-1-alastair@au1.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18051106-0040-0000-0000-0000045860D5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051106-0041-0000-0000-000020FC73E7
Message-Id: <20180511061303.10728-3-alastair@au1.ibm.com>
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

Switch the use of TIDR on it's CPU feature, rather than assuming it
is available based on architecture.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/kernel/process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 1237f13fed51..3b00da47699b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1154,7 +1154,7 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 			mtspr(SPRN_TAR, new_thread->tar);
 	}
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300) &&
+	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
 	    old_thread->tidr != new_thread->tidr)
 		mtspr(SPRN_TIDR, new_thread->tidr);
 #endif
@@ -1570,7 +1570,7 @@ void clear_thread_tidr(struct task_struct *t)
 	if (!t->thread.tidr)
 		return;
 
-	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+	if (!cpu_has_feature(CPU_FTR_P9_TIDR)) {
 		WARN_ON_ONCE(1);
 		return;
 	}
@@ -1593,7 +1593,7 @@ int set_thread_tidr(struct task_struct *t)
 {
 	int rc;
 
-	if (!cpu_has_feature(CPU_FTR_ARCH_300))
+	if (!cpu_has_feature(CPU_FTR_P9_TIDR))
 		return -EINVAL;
 
 	if (t != current)
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
