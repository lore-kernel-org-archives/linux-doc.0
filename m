Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBEAF7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 08:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753352AbeDRIIY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 04:08:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35708 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753333AbeDRIIU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 04:08:20 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3I86ru6016030
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:20 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hdwnfkr6n-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:19 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 18 Apr 2018 09:08:17 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 18 Apr 2018 09:08:13 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3I88DxY11796826;
        Wed, 18 Apr 2018 08:08:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 652B94C040;
        Wed, 18 Apr 2018 09:00:43 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8FAAA4C058;
        Wed, 18 Apr 2018 09:00:41 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.205.155])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 18 Apr 2018 09:00:41 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 18 Apr 2018 11:08:10 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 7/7] docs/admin-guide/mm: convert plain text cross references to hyperlinks
Date:   Wed, 18 Apr 2018 11:07:50 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18041808-0008-0000-0000-000004EC91CD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041808-0009-0000-0000-00001E809A84
Message-Id: <1524038870-413-8-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-18_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804180076
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/admin-guide/mm/hugetlbpage.rst        |  3 ++-
 Documentation/admin-guide/mm/idle_page_tracking.rst |  5 +++--
 Documentation/admin-guide/mm/pagemap.rst            | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 2b374d1..a8b0806 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -219,7 +219,8 @@ When adjusting the persistent hugepage count via ``nr_hugepages_mempolicy``, any
 memory policy mode--bind, preferred, local or interleave--may be used.  The
 resulting effect on persistent huge page allocation is as follows:
 
-#. Regardless of mempolicy mode [see Documentation/vm/numa_memory_policy.rst],
+#. Regardless of mempolicy mode [see
+   :ref:`Documentation/vm/numa_memory_policy.rst <numa_memory_policy>`],
    persistent huge pages will be distributed across the node or nodes
    specified in the mempolicy as if "interleave" had been specified.
    However, if a node in the policy does not contain sufficient contiguous
diff --git a/Documentation/admin-guide/mm/idle_page_tracking.rst b/Documentation/admin-guide/mm/idle_page_tracking.rst
index 92e3a25..6f7b7ca 100644
--- a/Documentation/admin-guide/mm/idle_page_tracking.rst
+++ b/Documentation/admin-guide/mm/idle_page_tracking.rst
@@ -65,8 +65,9 @@ workload one should:
     are not reclaimable, he or she can filter them out using
     ``/proc/kpageflags``.
 
-See Documentation/admin-guide/mm/pagemap.rst for more information about
-``/proc/pid/pagemap``, ``/proc/kpageflags``, and ``/proc/kpagecgroup``.
+See :ref:`Documentation/admin-guide/mm/pagemap.rst <pagemap>` for more
+information about ``/proc/pid/pagemap``, ``/proc/kpageflags``, and
+``/proc/kpagecgroup``.
 
 .. _impl_details:
 
diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index 053ca64..577af85 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -18,7 +18,8 @@ There are four components to pagemap:
     * Bits 0-54  page frame number (PFN) if present
     * Bits 0-4   swap type if swapped
     * Bits 5-54  swap offset if swapped
-    * Bit  55    pte is soft-dirty (see Documentation/admin-guide/mm/soft-dirty.rst)
+    * Bit  55    pte is soft-dirty (see
+      :ref:`Documentation/admin-guide/mm/soft-dirty.rst <soft_dirty>`)
     * Bit  56    page exclusively mapped (since 4.2)
     * Bits 57-60 zero
     * Bit  61    page is file-page or shared-anon (since 3.5)
@@ -97,9 +98,11 @@ Short descriptions to the page flags
     A compound page with order N consists of 2^N physically contiguous pages.
     A compound page with order 2 takes the form of "HTTT", where H donates its
     head page and T donates its tail page(s).  The major consumers of compound
-    pages are hugeTLB pages (Documentation/admin-guide/mm/hugetlbpage.rst), the SLUB etc.
-    memory allocators and various device drivers. However in this interface,
-    only huge/giga pages are made visible to end users.
+    pages are hugeTLB pages
+    (:ref:`Documentation/admin-guide/mm/hugetlbpage.rst <hugetlbpage>`),
+    the SLUB etc.  memory allocators and various device drivers.
+    However in this interface, only huge/giga pages are made visible
+    to end users.
 16 - COMPOUND_TAIL
     A compound page tail (see description above).
 17 - HUGE
@@ -118,9 +121,10 @@ Short descriptions to the page flags
     zero page for pfn_zero or huge_zero page
 25 - IDLE
     page has not been accessed since it was marked idle (see
-    Documentation/admin-guide/mm/idle_page_tracking.rst). Note that this flag may be
-    stale in case the page was accessed via a PTE. To make sure the flag
-    is up-to-date one has to read ``/sys/kernel/mm/page_idle/bitmap`` first.
+    :ref:`Documentation/admin-guide/mm/idle_page_tracking.rst <idle_page_tracking>`).
+    Note that this flag may be stale in case the page was accessed via
+    a PTE. To make sure the flag is up-to-date one has to read
+    ``/sys/kernel/mm/page_idle/bitmap`` first.
 
 IO related page flags
 ---------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
