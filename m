Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FD977E8B0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 06:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756174AbeDXGkw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 02:40:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54398 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755971AbeDXGkp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 02:40:45 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3O6d9RB037714
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 02:40:44 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hhvkwxb1n-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 02:40:44 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 24 Apr 2018 07:40:42 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 24 Apr 2018 07:40:40 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3O6eeGH66519140;
        Tue, 24 Apr 2018 06:40:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D896142049;
        Tue, 24 Apr 2018 07:32:03 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 54FDD42042;
        Tue, 24 Apr 2018 07:32:02 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.99])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 24 Apr 2018 07:32:02 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Tue, 24 Apr 2018 09:40:37 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 4/7] docs/vm: ksm: reshuffle text between "sysfs" and "design" sections
Date:   Tue, 24 Apr 2018 09:40:25 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18042406-0020-0000-0000-0000041527B1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042406-0021-0000-0000-000042A9885E
Message-Id: <1524552028-7017-5-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-24_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804240067
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The description of "max_page_sharing" sysfs attribute includes lots of
implementation details that more naturally belong in the "Design"
section.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/ksm.rst | 51 ++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/Documentation/vm/ksm.rst b/Documentation/vm/ksm.rst
index 0e5a085..00961b8 100644
--- a/Documentation/vm/ksm.rst
+++ b/Documentation/vm/ksm.rst
@@ -133,31 +133,21 @@ use_zero_pages
 
 max_page_sharing
         Maximum sharing allowed for each KSM page. This enforces a
-        deduplication limit to avoid the virtual memory rmap lists to
-        grow too large. The minimum value is 2 as a newly created KSM
-        page will have at least two sharers. The rmap walk has O(N)
-        complexity where N is the number of rmap_items (i.e. virtual
-        mappings) that are sharing the page, which is in turn capped
-        by ``max_page_sharing``. So this effectively spreads the linear
-        O(N) computational complexity from rmap walk context over
-        different KSM pages. The ksmd walk over the stable_node
-        "chains" is also O(N), but N is the number of stable_node
-        "dups", not the number of rmap_items, so it has not a
-        significant impact on ksmd performance. In practice the best
-        stable_node "dup" candidate will be kept and found at the head
-        of the "dups" list. The higher this value the faster KSM will
-        merge the memory (because there will be fewer stable_node dups
-        queued into the stable_node chain->hlist to check for pruning)
-        and the higher the deduplication factor will be, but the
-        slowest the worst case rmap walk could be for any given KSM
-        page. Slowing down the rmap_walk means there will be higher
+        deduplication limit to avoid high latency for virtual memory
+        operations that involve traversal of the virtual mappings that
+        share the KSM page. The minimum value is 2 as a newly created
+        KSM page will have at least two sharers. The higher this value
+        the faster KSM will merge the memory and the higher the
+        deduplication factor will be, but the slower the worst case
+        virtual mappings traversal could be for any given KSM
+        page. Slowing down this traversal means there will be higher
         latency for certain virtual memory operations happening during
         swapping, compaction, NUMA balancing and page migration, in
         turn decreasing responsiveness for the caller of those virtual
         memory operations. The scheduler latency of other tasks not
-        involved with the VM operations doing the rmap walk is not
-        affected by this parameter as the rmap walks are always
-        schedule friendly themselves.
+        involved with the VM operations doing the virtual mappings
+        traversal is not affected by this parameter as these
+        traversals are always schedule friendly themselves.
 
 stable_node_chains_prune_millisecs
         How frequently to walk the whole list of stable_node "dups"
@@ -240,6 +230,25 @@ if compared to an unlimited list of reverse mappings. It is still
 enforced that there cannot be KSM page content duplicates in the
 stable tree itself.
 
+The deduplication limit enforced by ``max_page_sharing`` is required
+to avoid the virtual memory rmap lists to grow too large. The rmap
+walk has O(N) complexity where N is the number of rmap_items
+(i.e. virtual mappings) that are sharing the page, which is in turn
+capped by ``max_page_sharing``. So this effectively spreads the linear
+O(N) computational complexity from rmap walk context over different
+KSM pages. The ksmd walk over the stable_node "chains" is also O(N),
+but N is the number of stable_node "dups", not the number of
+rmap_items, so it has not a significant impact on ksmd performance. In
+practice the best stable_node "dup" candidate will be kept and found
+at the head of the "dups" list.
+
+High values of ``max_page_sharing`` result in faster memory merging
+(because there will be fewer stable_node dups queued into the
+stable_node chain->hlist to check for pruning) and higher
+deduplication factor at the expense of slower worst case for rmap
+walks for any KSM page which can happen during swapping, compaction,
+NUMA balancing and page migration.
+
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
