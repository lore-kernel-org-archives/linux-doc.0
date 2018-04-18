Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A2DF7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 08:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753250AbeDRIOy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 04:14:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60626 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753156AbeDRIIJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 04:08:09 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3I86McY045981
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:08 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hdyhpf7g3-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:08 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 18 Apr 2018 09:08:06 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 18 Apr 2018 09:08:03 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3I882rf57278630;
        Wed, 18 Apr 2018 08:08:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E8E8DA4059;
        Wed, 18 Apr 2018 09:00:10 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1E297A405B;
        Wed, 18 Apr 2018 09:00:09 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.205.155])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 18 Apr 2018 09:00:09 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 18 Apr 2018 11:08:00 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 3/7] docs/vm: pagemap: formatting and spelling updates
Date:   Wed, 18 Apr 2018 11:07:46 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18041808-0008-0000-0000-000004EC91C4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041808-0009-0000-0000-00001E809A7C
Message-Id: <1524038870-413-4-git-send-email-rppt@linux.vnet.ibm.com>
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
 Documentation/vm/pagemap.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/vm/pagemap.rst b/Documentation/vm/pagemap.rst
index d54b4bf..9644bc0 100644
--- a/Documentation/vm/pagemap.rst
+++ b/Documentation/vm/pagemap.rst
@@ -13,7 +13,7 @@ There are four components to pagemap:
  * ``/proc/pid/pagemap``.  This file lets a userspace process find out which
    physical frame each virtual page is mapped to.  It contains one 64-bit
    value for each virtual page, containing the following data (from
-   fs/proc/task_mmu.c, above pagemap_read):
+   ``fs/proc/task_mmu.c``, above pagemap_read):
 
     * Bits 0-54  page frame number (PFN) if present
     * Bits 0-4   swap type if swapped
@@ -36,7 +36,7 @@ There are four components to pagemap:
    precisely which pages are mapped (or in swap) and comparing mapped
    pages between processes.
 
-   Efficient users of this interface will use /proc/pid/maps to
+   Efficient users of this interface will use ``/proc/pid/maps`` to
    determine which areas of memory are actually mapped and llseek to
    skip over unmapped regions.
 
@@ -79,11 +79,11 @@ There are four components to pagemap:
    memory cgroup each page is charged to, indexed by PFN. Only available when
    CONFIG_MEMCG is set.
 
-Short descriptions to the page flags:
-=====================================
+Short descriptions to the page flags
+====================================
 
 0 - LOCKED
-   page is being locked for exclusive access, eg. by undergoing read/write IO
+   page is being locked for exclusive access, e.g. by undergoing read/write IO
 7 - SLAB
    page is managed by the SLAB/SLOB/SLUB/SLQB kernel memory allocator
    When compound page is used, SLUB/SLQB will only set this flag on the head
@@ -132,7 +132,7 @@ IO related page flags
    ie. for file backed page: (in-memory data revision >= on-disk one)
 4 - DIRTY
    page has been written to, hence contains new data
-   ie. for file backed page: (in-memory data revision >  on-disk one)
+   i.e. for file backed page: (in-memory data revision >  on-disk one)
 8 - WRITEBACK
    page is being synced to disk
 
@@ -145,7 +145,7 @@ LRU related page flags
    page is in the active LRU list
 18 - UNEVICTABLE
    page is in the unevictable (non-)LRU list It is somehow pinned and
-   not a candidate for LRU page reclaims, eg. ramfs pages,
+   not a candidate for LRU page reclaims, e.g. ramfs pages,
    shmctl(SHM_LOCK) and mlock() memory segments
 2 - REFERENCED
    page has been referenced since last LRU list enqueue/requeue
@@ -156,7 +156,7 @@ LRU related page flags
 12 - ANON
    a memory mapped page that is not part of a file
 13 - SWAPCACHE
-   page is mapped to swap space, ie. has an associated swap entry
+   page is mapped to swap space, i.e. has an associated swap entry
 14 - SWAPBACKED
    page is backed by swap/RAM
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
