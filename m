Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3A027D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 11 Nov 2018 09:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbeKKTMf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 11 Nov 2018 14:12:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51572 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727334AbeKKTMf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Nov 2018 14:12:35 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAB9Ie7L046045
        for <linux-doc@vger.kernel.org>; Sun, 11 Nov 2018 04:24:32 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2npd3u98jq-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sun, 11 Nov 2018 04:24:32 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sun, 11 Nov 2018 09:24:30 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 11 Nov 2018 09:24:27 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wAB9OQ4E8061328
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 11 Nov 2018 09:24:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B926BA405B;
        Sun, 11 Nov 2018 09:24:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3B0BEA4054;
        Sun, 11 Nov 2018 09:24:25 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.230])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sun, 11 Nov 2018 09:24:25 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Sun, 11 Nov 2018 11:24:24 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH v2] docs/admin-guide/mm/concepts.rst: grammar and style fixups
Date:   Sun, 11 Nov 2018 11:24:23 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18111109-0028-0000-0000-000003181894
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111109-0029-0000-0000-000023D4751A
Message-Id: <1541928263-5117-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-11_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811110091
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---

v2: address Matthew's feedback

 Documentation/admin-guide/mm/concepts.rst | 51 ++++++++++++++++---------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
index 291699c..c2531b1 100644
--- a/Documentation/admin-guide/mm/concepts.rst
+++ b/Documentation/admin-guide/mm/concepts.rst
@@ -4,13 +4,13 @@
 Concepts overview
 =================
 
-The memory management in Linux is complex system that evolved over the
-years and included more and more functionality to support variety of
+The memory management in Linux is a complex system that evolved over the
+years and included more and more functionality to support a variety of
 systems from MMU-less microcontrollers to supercomputers. The memory
-management for systems without MMU is called ``nommu`` and it
+management for systems without an MMU is called ``nommu`` and it
 definitely deserves a dedicated document, which hopefully will be
 eventually written. Yet, although some of the concepts are the same,
-here we assume that MMU is available and CPU can translate a virtual
+here we assume that an MMU is available and a CPU can translate a virtual
 address to a physical address.
 
 .. contents:: :local:
@@ -21,10 +21,10 @@ Virtual Memory Primer
 The physical memory in a computer system is a limited resource and
 even for systems that support memory hotplug there is a hard limit on
 the amount of memory that can be installed. The physical memory is not
-necessary contiguous, it might be accessible as a set of distinct
+necessarily contiguous; it might be accessible as a set of distinct
 address ranges. Besides, different CPU architectures, and even
-different implementations of the same architecture have different view
-how these address ranges defined.
+different implementations of the same architecture have different views
+of how these address ranges are defined.
 
 All this makes dealing directly with physical memory quite complex and
 to avoid this complexity a concept of virtual memory was developed.
@@ -48,8 +48,8 @@ appropriate kernel configuration option.
 
 Each physical memory page can be mapped as one or more virtual
 pages. These mappings are described by page tables that allow
-translation from virtual address used by programs to real address in
-the physical memory. The page tables organized hierarchically.
+translation from a virtual address used by programs to the physical
+memory address. The page tables are organized hierarchically.
 
 The tables at the lowest level of the hierarchy contain physical
 addresses of actual pages used by the software. The tables at higher
@@ -121,8 +121,8 @@ Nodes
 Many multi-processor machines are NUMA - Non-Uniform Memory Access -
 systems. In such systems the memory is arranged into banks that have
 different access latency depending on the "distance" from the
-processor. Each bank is referred as `node` and for each node Linux
-constructs an independent memory management subsystem. A node has it's
+processor. Each bank is referred to as a `node` and for each node Linux
+constructs an independent memory management subsystem. A node has its
 own set of zones, lists of free and used pages and various statistics
 counters. You can find more details about NUMA in
 :ref:`Documentation/vm/numa.rst <numa>` and in
@@ -149,9 +149,9 @@ for program's stack and heap or by explicit calls to mmap(2) system
 call. Usually, the anonymous mappings only define virtual memory areas
 that the program is allowed to access. The read accesses will result
 in creation of a page table entry that references a special physical
-page filled with zeroes. When the program performs a write, regular
+page filled with zeroes. When the program performs a write, a regular
 physical page will be allocated to hold the written data. The page
-will be marked dirty and if the kernel will decide to repurpose it,
+will be marked dirty and if the kernel decides to repurpose it,
 the dirty page will be swapped out.
 
 Reclaim
@@ -181,8 +181,8 @@ pressure.
 The process of freeing the reclaimable physical memory pages and
 repurposing them is called (surprise!) `reclaim`. Linux can reclaim
 pages either asynchronously or synchronously, depending on the state
-of the system. When system is not loaded, most of the memory is free
-and allocation request will be satisfied immediately from the free
+of the system. When the system is not loaded, most of the memory is free
+and allocation requests will be satisfied immediately from the free
 pages supply. As the load increases, the amount of the free pages goes
 down and when it reaches a certain threshold (high watermark), an
 allocation request will awaken the ``kswapd`` daemon. It will
@@ -190,7 +190,7 @@ asynchronously scan memory pages and either just free them if the data
 they contain is available elsewhere, or evict to the backing storage
 device (remember those dirty pages?). As memory usage increases even
 more and reaches another threshold - min watermark - an allocation
-will trigger the `direct reclaim`. In this case allocation is stalled
+will trigger `direct reclaim`. In this case allocation is stalled
 until enough memory pages are reclaimed to satisfy the request.
 
 Compaction
@@ -200,7 +200,7 @@ As the system runs, tasks allocate and free the memory and it becomes
 fragmented. Although with virtual memory it is possible to present
 scattered physical pages as virtually contiguous range, sometimes it is
 necessary to allocate large physically contiguous memory areas. Such
-need may arise, for instance, when a device driver requires large
+need may arise, for instance, when a device driver requires a large
 buffer for DMA, or when THP allocates a huge page. Memory `compaction`
 addresses the fragmentation issue. This mechanism moves occupied pages
 from the lower part of a memory zone to free pages in the upper part
@@ -208,15 +208,16 @@ of the zone. When a compaction scan is finished free pages are grouped
 together at the beginning of the zone and allocations of large
 physically contiguous areas become possible.
 
-Like reclaim, the compaction may happen asynchronously in ``kcompactd``
-daemon or synchronously as a result of memory allocation request.
+Like reclaim, the compaction may happen asynchronously in the ``kcompactd``
+daemon or synchronously as a result of a memory allocation request.
 
 OOM killer
 ==========
 
-It may happen, that on a loaded machine memory will be exhausted. When
-the kernel detects that the system runs out of memory (OOM) it invokes
-`OOM killer`. Its mission is simple: all it has to do is to select a
-task to sacrifice for the sake of the overall system health. The
-selected task is killed in a hope that after it exits enough memory
-will be freed to continue normal operation.
+It is possible that on a loaded machine memory will be exhausted and the
+kernel will be unable to reclaim enough memory to continue to operate. In
+order to save the rest of the system, it invokes the `OOM killer`.
+
+The `OOM killer` selects a task to sacrifice for the sake of the overall
+system health. The selected task is killed in a hope that after it exits
+enough memory will be freed to continue normal operation.
-- 
2.7.4

