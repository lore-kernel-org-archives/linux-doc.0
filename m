Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43CD57D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 08:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752077AbeENIN4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 04:13:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49562 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752681AbeENINy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 04:13:54 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4E84I0I091262
        for <linux-doc@vger.kernel.org>; Mon, 14 May 2018 04:13:53 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hy53w424d-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 14 May 2018 04:13:53 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Mon, 14 May 2018 09:13:52 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 14 May 2018 09:13:48 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4E8Dmur8520122;
        Mon, 14 May 2018 08:13:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9A7D84C04A;
        Mon, 14 May 2018 09:05:41 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2EBA34C040;
        Mon, 14 May 2018 09:05:40 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.81])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 14 May 2018 09:05:40 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Mon, 14 May 2018 11:13:46 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 1/3] docs/vm: transhuge: change sections order
Date:   Mon, 14 May 2018 11:13:38 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526285620-453-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1526285620-453-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18051408-0008-0000-0000-000004F639B8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051408-0009-0000-0000-00001E8A96F7
Message-Id: <1526285620-453-2-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-14_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805140085
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

so that userspace interface and implementation description will be grouped
together

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/transhuge.rst | 82 +++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/Documentation/vm/transhuge.rst b/Documentation/vm/transhuge.rst
index 2c6867f..56d04cbb 100644
--- a/Documentation/vm/transhuge.rst
+++ b/Documentation/vm/transhuge.rst
@@ -38,31 +38,6 @@ are using hugepages but a significant speedup already happens if only
 one of the two is using hugepages just because of the fact the TLB
 miss is going to run faster.
 
-Design
-======
-
-- "graceful fallback": mm components which don't have transparent hugepage
-  knowledge fall back to breaking huge pmd mapping into table of ptes and,
-  if necessary, split a transparent hugepage. Therefore these components
-  can continue working on the regular pages or regular pte mappings.
-
-- if a hugepage allocation fails because of memory fragmentation,
-  regular pages should be gracefully allocated instead and mixed in
-  the same vma without any failure or significant delay and without
-  userland noticing
-
-- if some task quits and more hugepages become available (either
-  immediately in the buddy or through the VM), guest physical memory
-  backed by regular pages should be relocated on hugepages
-  automatically (with khugepaged)
-
-- it doesn't require memory reservation and in turn it uses hugepages
-  whenever possible (the only possible reservation here is kernelcore=
-  to avoid unmovable pages to fragment all the memory but such a tweak
-  is not specific to transparent hugepage support and it's a generic
-  feature that applies to all dynamic high order allocations in the
-  kernel)
-
 Transparent Hugepage Support maximizes the usefulness of free memory
 if compared to the reservation approach of hugetlbfs by allowing all
 unused memory to be used as cache or other movable (or even unmovable
@@ -401,6 +376,47 @@ tracer to record how long was spent in __alloc_pages_nodemask and
 using the mm_page_alloc tracepoint to identify which allocations were
 for huge pages.
 
+Optimizing the applications
+===========================
+
+To be guaranteed that the kernel will map a 2M page immediately in any
+memory region, the mmap region has to be hugepage naturally
+aligned. posix_memalign() can provide that guarantee.
+
+Hugetlbfs
+=========
+
+You can use hugetlbfs on a kernel that has transparent hugepage
+support enabled just fine as always. No difference can be noted in
+hugetlbfs other than there will be less overall fragmentation. All
+usual features belonging to hugetlbfs are preserved and
+unaffected. libhugetlbfs will also work fine as usual.
+
+Design principles
+=================
+
+- "graceful fallback": mm components which don't have transparent hugepage
+  knowledge fall back to breaking huge pmd mapping into table of ptes and,
+  if necessary, split a transparent hugepage. Therefore these components
+  can continue working on the regular pages or regular pte mappings.
+
+- if a hugepage allocation fails because of memory fragmentation,
+  regular pages should be gracefully allocated instead and mixed in
+  the same vma without any failure or significant delay and without
+  userland noticing
+
+- if some task quits and more hugepages become available (either
+  immediately in the buddy or through the VM), guest physical memory
+  backed by regular pages should be relocated on hugepages
+  automatically (with khugepaged)
+
+- it doesn't require memory reservation and in turn it uses hugepages
+  whenever possible (the only possible reservation here is kernelcore=
+  to avoid unmovable pages to fragment all the memory but such a tweak
+  is not specific to transparent hugepage support and it's a generic
+  feature that applies to all dynamic high order allocations in the
+  kernel)
+
 get_user_pages and follow_page
 ==============================
 
@@ -432,22 +448,6 @@ hugepages being returned (as it's not only checking the pfn of the
 page and pinning it during the copy but it pretends to migrate the
 memory in regular page sizes and with regular pte/pmd mappings).
 
-Optimizing the applications
-===========================
-
-To be guaranteed that the kernel will map a 2M page immediately in any
-memory region, the mmap region has to be hugepage naturally
-aligned. posix_memalign() can provide that guarantee.
-
-Hugetlbfs
-=========
-
-You can use hugetlbfs on a kernel that has transparent hugepage
-support enabled just fine as always. No difference can be noted in
-hugetlbfs other than there will be less overall fragmentation. All
-usual features belonging to hugetlbfs are preserved and
-unaffected. libhugetlbfs will also work fine as usual.
-
 Graceful fallback
 =================
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
