Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0981D7D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 11 Nov 2018 16:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbeKLCh4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 11 Nov 2018 21:37:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46186 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728773AbeKLCh4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Nov 2018 21:37:56 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wABGj629091999
        for <linux-doc@vger.kernel.org>; Sun, 11 Nov 2018 11:48:54 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2npdbnmnse-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sun, 11 Nov 2018 11:48:53 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sun, 11 Nov 2018 16:48:52 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 11 Nov 2018 16:48:49 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wABGmmwf39649358
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 11 Nov 2018 16:48:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4142452050;
        Sun, 11 Nov 2018 16:48:48 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.171])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id A35F45204E;
        Sun, 11 Nov 2018 16:48:46 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Sun, 11 Nov 2018 18:48:45 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] docs/mm: update kmalloc kernel-doc description
Date:   Sun, 11 Nov 2018 18:48:44 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18111116-0008-0000-0000-000002911A78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111116-0009-0000-0000-000021FB21C2
Message-Id: <1541954924-21471-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-11_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811110160
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add references to GFP documentation and the memory-allocation.rst and remove
GFP_USER, GFP_DMA and GFP_NOIO descriptions.

While on it slightly change the formatting so that the list of GFP flags
will be rendered as "description" in the generated html.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---

Probably this should go via the -mm tree as it touches include/linux/slab.h

 Documentation/core-api/memory-allocation.rst |  2 +
 include/linux/slab.h                         | 55 ++++++++++++++--------------
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index f8bb9aa..39f35eb 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -1,3 +1,5 @@
+.. _memory_allocation:
+
 =======================
 Memory Allocation Guide
 =======================
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 918f374..4a342eb 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -486,48 +486,47 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
  * kmalloc is the normal method of allocating memory
  * for objects smaller than page size in the kernel.
  *
- * The @flags argument may be one of:
+ * The @flags argument may be one of the GFP flags defined at
+ * include/linux/gfp.h and described at
+ * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
  *
- * %GFP_USER - Allocate memory on behalf of user.  May sleep.
+ * The recommended usage of the @flags is described at
+ * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
  *
- * %GFP_KERNEL - Allocate normal kernel ram.  May sleep.
+ * Below is a brief outline of the most useful GFP flags
  *
- * %GFP_ATOMIC - Allocation will not sleep.  May use emergency pools.
- *   For example, use this inside interrupt handlers.
+ * %GFP_KERNEL
+ *	Allocate normal kernel ram. May sleep.
  *
- * %GFP_HIGHUSER - Allocate pages from high memory.
+ * %GFP_NOWAIT
+ *	Allocation will not sleep.
  *
- * %GFP_NOIO - Do not do any I/O at all while trying to get memory.
+ * %GFP_ATOMIC
+ *	Allocation will not sleep.  May use emergency pools.
  *
- * %GFP_NOFS - Do not make any fs calls while trying to get memory.
- *
- * %GFP_NOWAIT - Allocation will not sleep.
- *
- * %__GFP_THISNODE - Allocate node-local memory only.
- *
- * %GFP_DMA - Allocation suitable for DMA.
- *   Should only be used for kmalloc() caches. Otherwise, use a
- *   slab created with SLAB_DMA.
+ * %GFP_HIGHUSER
+ *	Allocate memory from high memory on behalf of user.
  *
  * Also it is possible to set different flags by OR'ing
  * in one or more of the following additional @flags:
  *
- * %__GFP_HIGH - This allocation has high priority and may use emergency pools.
- *
- * %__GFP_NOFAIL - Indicate that this allocation is in no way allowed to fail
- *   (think twice before using).
+ * %__GFP_HIGH
+ *	This allocation has high priority and may use emergency pools.
  *
- * %__GFP_NORETRY - If memory is not immediately available,
- *   then give up at once.
+ * %__GFP_NOFAIL
+ *	Indicate that this allocation is in no way allowed to fail
+ *	(think twice before using).
  *
- * %__GFP_NOWARN - If allocation fails, don't issue any warnings.
+ * %__GFP_NORETRY
+ *	If memory is not immediately available,
+ *	then give up at once.
  *
- * %__GFP_RETRY_MAYFAIL - Try really hard to succeed the allocation but fail
- *   eventually.
+ * %__GFP_NOWARN
+ *	If allocation fails, don't issue any warnings.
  *
- * There are other flags available as well, but these are not intended
- * for general use, and so are not documented here. For a full list of
- * potential flags, always refer to linux/gfp.h.
+ * %__GFP_RETRY_MAYFAIL
+ *	Try really hard to succeed the allocation but fail
+ *	eventually.
  */
 static __always_inline void *kmalloc(size_t size, gfp_t flags)
 {
-- 
2.7.4

