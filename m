Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8EE17D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Nov 2018 14:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbeK2Brs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Nov 2018 20:47:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36534 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727872AbeK2Brs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Nov 2018 20:47:48 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wASEcpQw110531
        for <linux-doc@vger.kernel.org>; Wed, 28 Nov 2018 09:45:53 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p1ugqvuhd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 28 Nov 2018 09:45:52 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Wed, 28 Nov 2018 14:45:50 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 28 Nov 2018 14:45:48 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wASEjlER8323376
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Nov 2018 14:45:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D98D9A4069;
        Wed, 28 Nov 2018 14:45:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8497EA405F;
        Wed, 28 Nov 2018 14:45:46 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.124])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 28 Nov 2018 14:45:46 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 28 Nov 2018 16:45:45 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] docs/core-api: make mm-api.rst more structured
Date:   Wed, 28 Nov 2018 16:45:44 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18112814-4275-0000-0000-000002E80C53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18112814-4276-0000-0000-000037F54D13
Message-Id: <1543416344-25543-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-28_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811280130
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The mm-api.rst covers variety of memory management APIs under "More Memory
Management Functions" section. The descriptions included there are in a
random order there are quite a few of them which makes the section too
long.

Regrouping the documentation by subject and splitting the long "More Memory
Management Functions" section into several smaller sections makes the
generated html more usable.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 Documentation/core-api/mm-api.rst | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 5ce1ec1..c81e754 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -49,8 +49,14 @@ The Slab Cache
 .. kernel-doc:: mm/util.c
    :functions: kfree_const kvmalloc_node kvfree
 
-More Memory Management Functions
-================================
+Virtually Contiguous Mappings
+=============================
+
+.. kernel-doc:: mm/vmalloc.c
+   :export:
+
+File Mapping and Page Cache
+===========================
 
 .. kernel-doc:: mm/readahead.c
    :export:
@@ -58,23 +64,28 @@ More Memory Management Functions
 .. kernel-doc:: mm/filemap.c
    :export:
 
-.. kernel-doc:: mm/memory.c
+.. kernel-doc:: mm/page-writeback.c
    :export:
 
-.. kernel-doc:: mm/vmalloc.c
+.. kernel-doc:: mm/truncate.c
    :export:
 
-.. kernel-doc:: mm/page_alloc.c
-   :internal:
+Memory pools
+============
 
 .. kernel-doc:: mm/mempool.c
    :export:
 
+DMA pools
+=========
+
 .. kernel-doc:: mm/dmapool.c
    :export:
 
-.. kernel-doc:: mm/page-writeback.c
-   :export:
+More Memory Management Functions
+================================
 
-.. kernel-doc:: mm/truncate.c
+.. kernel-doc:: mm/memory.c
    :export:
+
+.. kernel-doc:: mm/page_alloc.c
-- 
2.7.4

