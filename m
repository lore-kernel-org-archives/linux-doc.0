Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C097D7DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 06:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756025AbeDXGkn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 02:40:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57600 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755943AbeDXGkl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 02:40:41 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3O6eB7d052061
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 02:40:41 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hhw8tnvb1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 02:40:40 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 24 Apr 2018 07:40:38 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 24 Apr 2018 07:40:34 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3O6eXfb7733538;
        Tue, 24 Apr 2018 06:40:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 46E125204D;
        Tue, 24 Apr 2018 06:31:13 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.99])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id B795B52049;
        Tue, 24 Apr 2018 06:31:11 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Tue, 24 Apr 2018 09:40:31 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 1/7] mm/ksm: docs: extend overview comment and make it "DOC:"
Date:   Tue, 24 Apr 2018 09:40:22 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18042406-0008-0000-0000-000004EE858A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042406-0009-0000-0000-00001E82ACCA
Message-Id: <1524552028-7017-2-git-send-email-rppt@linux.vnet.ibm.com>
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

The existing comment provides a good overview of KSM implementation. Let's
update it to reflect recent additions of "chain" and "dup" variants of the
stable tree nodes and mark it as "DOC:" for inclusion into the KSM
documentation.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 mm/ksm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 58c2741..54155b1 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -51,7 +51,9 @@
 #define DO_NUMA(x)	do { } while (0)
 #endif
 
-/*
+/**
+ * DOC: Overview
+ *
  * A few notes about the KSM scanning process,
  * to make it easier to understand the data structures below:
  *
@@ -67,6 +69,21 @@
  * this tree is fully assured to be working (except when pages are unmapped),
  * and therefore this tree is called the stable tree.
  *
+ * The stable tree node includes information required for reverse
+ * mapping from a KSM page to virtual addresses that map this page.
+ *
+ * In order to avoid large latencies of the rmap walks on KSM pages,
+ * KSM maintains two types of nodes in the stable tree:
+ *
+ * * the regular nodes that keep the reverse mapping structures in a
+ *   linked list
+ * * the "chains" that link nodes ("dups") that represent the same
+ *   write protected memory content, but each "dup" corresponds to a
+ *   different KSM page copy of that content
+ *
+ * Internally, the regular nodes, "dups" and "chains" are represented
+ * using the same :c:type:`struct stable_node` structure.
+ *
  * In addition to the stable tree, KSM uses a second data structure called the
  * unstable tree: this tree holds pointers to pages which have been found to
  * be "unchanged for a period of time".  The unstable tree sorts these pages
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
