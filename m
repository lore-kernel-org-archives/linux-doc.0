Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 765DE7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752510AbeCUPFk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:05:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50660 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752116AbeCUPFk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 11:05:40 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2LF3IUI092266
        for <linux-doc@vger.kernel.org>; Wed, 21 Mar 2018 11:05:39 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2gurdsmahy-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 21 Mar 2018 11:05:37 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 21 Mar 2018 15:05:29 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 21 Mar 2018 15:05:27 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2LF5QO918940142;
        Wed, 21 Mar 2018 15:05:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14BA211C04A;
        Wed, 21 Mar 2018 14:57:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BB9A711C05B;
        Wed, 21 Mar 2018 14:57:55 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.135])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 21 Mar 2018 14:57:55 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 21 Mar 2018 17:05:24 +0200
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH] docs/vm: update 00-INDEX
Date:   Wed, 21 Mar 2018 17:05:23 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18032115-0044-0000-0000-0000053E5E5E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032115-0045-0000-0000-0000287D62F0
Message-Id: <1521644723-19354-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-21_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803210179
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Several files were added to Documentation/vm without updates to 00-INDEX.
Fill in the missing documents

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/00-INDEX | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/vm/00-INDEX b/Documentation/vm/00-INDEX
index 11d3d8d..0278f2c 100644
--- a/Documentation/vm/00-INDEX
+++ b/Documentation/vm/00-INDEX
@@ -10,6 +10,8 @@ frontswap.txt
 	- Outline frontswap, part of the transcendent memory frontend.
 highmem.txt
 	- Outline of highmem and common issues.
+hmm.txt
+	- Documentation of heterogeneous memory management
 hugetlbpage.txt
 	- a brief summary of hugetlbpage support in the Linux kernel.
 hugetlbfs_reserv.txt
@@ -20,25 +22,41 @@ idle_page_tracking.txt
 	- description of the idle page tracking feature.
 ksm.txt
 	- how to use the Kernel Samepage Merging feature.
+mmu_notifier.txt
+	- a note about clearing pte/pmd and mmu notifications
 numa
 	- information about NUMA specific code in the Linux vm.
 numa_memory_policy.txt
 	- documentation of concepts and APIs of the 2.6 memory policy support.
 overcommit-accounting
 	- description of the Linux kernels overcommit handling modes.
+page_frags
+	- description of page fragments allocator
 page_migration
 	- description of page migration in NUMA systems.
 pagemap.txt
 	- pagemap, from the userspace perspective
+page_owner.txt
+	- tracking about who allocated each page
+remap_file_pages.txt
+	- a note about remap_file_pages() system call
 slub.txt
 	- a short users guide for SLUB.
 soft-dirty.txt
 	- short explanation for soft-dirty PTEs
 split_page_table_lock
 	- Separate per-table lock to improve scalability of the old page_table_lock.
+swap_numa.txt
+	- automatic binding of swap device to numa node
 transhuge.txt
 	- Transparent Hugepage Support, alternative way of using hugepages.
 unevictable-lru.txt
 	- Unevictable LRU infrastructure
+userfaultfd.txt
+	- description of userfaultfd system call
+z3fold.txt
+	- outline of z3fold allocator for storing compressed pages
+zsmalloc.txt
+	- outline of zsmalloc allocator for storing compressed pages
 zswap.txt
 	- Intro to compressed cache for swap pages
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
