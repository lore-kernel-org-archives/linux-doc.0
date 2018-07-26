Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D0517DF82
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 12:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730152AbeGZNjF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 09:39:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60898 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730075AbeGZNjF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jul 2018 09:39:05 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6QCInEZ088973
        for <linux-doc@vger.kernel.org>; Thu, 26 Jul 2018 08:22:29 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2kfbndqabp-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 26 Jul 2018 08:22:28 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Thu, 26 Jul 2018 13:22:21 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 26 Jul 2018 13:22:17 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w6QCMG9838600854
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Jul 2018 12:22:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 36346A405E;
        Thu, 26 Jul 2018 15:22:30 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B0707A4040;
        Thu, 26 Jul 2018 15:22:28 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.177])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 26 Jul 2018 15:22:28 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Thu, 26 Jul 2018 15:22:14 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH v2 5/7] docs/core-api: split memory management API to a separate file
Date:   Thu, 26 Jul 2018 15:22:00 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532607722-17079-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1532607722-17079-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18072612-0028-0000-0000-000002E08D41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18072612-0029-0000-0000-000023987EAD
Message-Id: <1532607722-17079-6-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-07-26_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807260129
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is basically copy-paste of the memory management section from
kernel-api.rst with some minor adjustments:

* The "User Space Memory Access" is moved to the beginning
* The get_user_pages_fast reference is now a part of "User Space Memory
  Access"
* And, of course, headings are adjusted with section being promoted to
  chapters

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/core-api/index.rst      |  1 +
 Documentation/core-api/kernel-api.rst | 54 ---------------------------------
 Documentation/core-api/mm-api.rst     | 57 +++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/core-api/mm-api.rst

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 989c97c..cdc2020 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -27,6 +27,7 @@ Core utilities
    errseq
    printk-formats
    circular-buffers
+   mm-api
    gfp_mask-from-fs-io
    timekeeping
 
diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 39f1460..3431337 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -159,60 +159,6 @@ UUID/GUID
 .. kernel-doc:: lib/uuid.c
    :export:
 
-Memory Management in Linux
-==========================
-
-The Slab Cache
---------------
-
-.. kernel-doc:: include/linux/slab.h
-   :internal:
-
-.. kernel-doc:: mm/slab.c
-   :export:
-
-.. kernel-doc:: mm/util.c
-   :functions: kfree_const kvmalloc_node kvfree get_user_pages_fast
-
-User Space Memory Access
-------------------------
-
-.. kernel-doc:: arch/x86/include/asm/uaccess.h
-   :internal:
-
-.. kernel-doc:: arch/x86/lib/usercopy_32.c
-   :export:
-
-More Memory Management Functions
---------------------------------
-
-.. kernel-doc:: mm/readahead.c
-   :export:
-
-.. kernel-doc:: mm/filemap.c
-   :export:
-
-.. kernel-doc:: mm/memory.c
-   :export:
-
-.. kernel-doc:: mm/vmalloc.c
-   :export:
-
-.. kernel-doc:: mm/page_alloc.c
-   :internal:
-
-.. kernel-doc:: mm/mempool.c
-   :export:
-
-.. kernel-doc:: mm/dmapool.c
-   :export:
-
-.. kernel-doc:: mm/page-writeback.c
-   :export:
-
-.. kernel-doc:: mm/truncate.c
-   :export:
-
 Kernel IPC facilities
 =====================
 
diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
new file mode 100644
index 0000000..b5913aa
--- /dev/null
+++ b/Documentation/core-api/mm-api.rst
@@ -0,0 +1,57 @@
+======================
+Memory Management APIs
+======================
+
+User Space Memory Access
+========================
+
+.. kernel-doc:: arch/x86/include/asm/uaccess.h
+   :internal:
+
+.. kernel-doc:: arch/x86/lib/usercopy_32.c
+   :export:
+
+.. kernel-doc:: mm/util.c
+   :functions: get_user_pages_fast
+
+The Slab Cache
+==============
+
+.. kernel-doc:: include/linux/slab.h
+   :internal:
+
+.. kernel-doc:: mm/slab.c
+   :export:
+
+.. kernel-doc:: mm/util.c
+   :functions: kfree_const kvmalloc_node kvfree
+
+More Memory Management Functions
+================================
+
+.. kernel-doc:: mm/readahead.c
+   :export:
+
+.. kernel-doc:: mm/filemap.c
+   :export:
+
+.. kernel-doc:: mm/memory.c
+   :export:
+
+.. kernel-doc:: mm/vmalloc.c
+   :export:
+
+.. kernel-doc:: mm/page_alloc.c
+   :internal:
+
+.. kernel-doc:: mm/mempool.c
+   :export:
+
+.. kernel-doc:: mm/dmapool.c
+   :export:
+
+.. kernel-doc:: mm/page-writeback.c
+   :export:
+
+.. kernel-doc:: mm/truncate.c
+   :export:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
