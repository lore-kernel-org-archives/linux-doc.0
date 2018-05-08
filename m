Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E505F7E27F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 07:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754575AbeEHHD2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 03:03:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36686 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754495AbeEHHCW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 03:02:22 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w486wnJ4006832
        for <linux-doc@vger.kernel.org>; Tue, 8 May 2018 03:02:21 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hu6dkj32p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 03:02:21 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 8 May 2018 08:02:20 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 8 May 2018 08:02:17 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4872HaB33620070;
        Tue, 8 May 2018 07:02:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 623695204C;
        Tue,  8 May 2018 06:52:37 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.166])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id E25DC52043;
        Tue,  8 May 2018 06:52:35 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Tue, 08 May 2018 10:02:15 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 1/3] docs/vm: numa_memory_policy: formatting and spelling updates
Date:   Tue,  8 May 2018 10:02:08 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525762930-28163-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1525762930-28163-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18050807-0044-0000-0000-000005503AB1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050807-0045-0000-0000-000028917A0A
Message-Id: <1525762930-28163-2-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-08_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080069
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/numa_memory_policy.rst | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/vm/numa_memory_policy.rst b/Documentation/vm/numa_memory_policy.rst
index 8cd942c..ac0b396 100644
--- a/Documentation/vm/numa_memory_policy.rst
+++ b/Documentation/vm/numa_memory_policy.rst
@@ -44,14 +44,20 @@ System Default Policy
 	allocations.
 
 Task/Process Policy
-	this is an optional, per-task policy.  When defined for a specific task, this policy controls all page allocations made by or on behalf of the task that aren't controlled by a more specific scope. If a task does not define a task policy, then all page allocations that would have been controlled by the task policy "fall back" to the System Default Policy.
+	this is an optional, per-task policy.  When defined for a
+	specific task, this policy controls all page allocations made
+	by or on behalf of the task that aren't controlled by a more
+	specific scope. If a task does not define a task policy, then
+	all page allocations that would have been controlled by the
+	task policy "fall back" to the System Default Policy.
 
 	The task policy applies to the entire address space of a task. Thus,
 	it is inheritable, and indeed is inherited, across both fork()
 	[clone() w/o the CLONE_VM flag] and exec*().  This allows a parent task
 	to establish the task policy for a child task exec()'d from an
 	executable image that has no awareness of memory policy.  See the
-	MEMORY POLICY APIS section, below, for an overview of the system call
+	:ref:`Memory Policy APIs <memory_policy_apis>` section,
+	below, for an overview of the system call
 	that a task may use to set/change its task/process policy.
 
 	In a multi-threaded task, task policies apply only to the thread
@@ -70,12 +76,13 @@ Task/Process Policy
 VMA Policy
 	A "VMA" or "Virtual Memory Area" refers to a range of a task's
 	virtual address space.  A task may define a specific policy for a range
-	of its virtual address space.   See the MEMORY POLICIES APIS section,
+	of its virtual address space.   See the
+	:ref:`Memory Policy APIs <memory_policy_apis>` section,
 	below, for an overview of the mbind() system call used to set a VMA
 	policy.
 
 	A VMA policy will govern the allocation of pages that back
-	this region ofthe address space.  Any regions of the task's
+	this region of the address space.  Any regions of the task's
 	address space that don't have an explicit VMA policy will fall
 	back to the task policy, which may itself fall back to the
 	System Default Policy.
@@ -117,7 +124,7 @@ VMA Policy
 Shared Policy
 	Conceptually, shared policies apply to "memory objects" mapped
 	shared into one or more tasks' distinct address spaces.  An
-	application installs a shared policies the same way as VMA
+	application installs shared policies the same way as VMA
 	policies--using the mbind() system call specifying a range of
 	virtual addresses that map the shared object.  However, unlike
 	VMA policies, which can be considered to be an attribute of a
@@ -135,7 +142,7 @@ Shared Policy
 	Although hugetlbfs segments now support lazy allocation, their support
 	for shared policy has not been completed.
 
-	As mentioned above :ref:`VMA policies <vma_policy>`,
+	As mentioned above in :ref:`VMA policies <vma_policy>` section,
 	allocations of page cache pages for regular files mmap()ed
 	with MAP_SHARED ignore any VMA policy installed on the virtual
 	address range backed by the shared file mapping.  Rather,
@@ -245,7 +252,7 @@ MPOL_F_STATIC_NODES
 	the user should not be remapped if the task or VMA's set of allowed
 	nodes changes after the memory policy has been defined.
 
-	Without this flag, anytime a mempolicy is rebound because of a
+	Without this flag, any time a mempolicy is rebound because of a
 	change in the set of allowed nodes, the node (Preferred) or
 	nodemask (Bind, Interleave) is remapped to the new set of
 	allowed nodes.  This may result in nodes being used that were
@@ -389,7 +396,10 @@ follows:
    or by prefaulting the entire shared memory region into memory and locking
    it down.  However, this might not be appropriate for all applications.
 
+.. _memory_policy_apis:
+
 Memory Policy APIs
+==================
 
 Linux supports 3 system calls for controlling memory policy.  These APIS
 always affect only the calling task, the calling task's address space, or
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
