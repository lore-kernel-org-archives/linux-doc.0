Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0964D7DF86
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 10:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932855AbeE2KN5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 06:13:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55808 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932819AbeE2KN4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 06:13:56 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4TADrYg130912
        for <linux-doc@vger.kernel.org>; Tue, 29 May 2018 06:13:55 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2j92htpcmv-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 29 May 2018 06:13:54 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 29 May 2018 11:13:45 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 29 May 2018 11:13:42 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4TADgKr24641782
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 May 2018 10:13:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5989311C04C;
        Tue, 29 May 2018 11:04:39 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0255F11C050;
        Tue, 29 May 2018 11:04:38 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.198])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 29 May 2018 11:04:37 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Tue, 29 May 2018 13:13:39 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH] docs/vm: move ksm and transhuge from "user" to "internals" section.
Date:   Tue, 29 May 2018 13:13:38 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18052910-0008-0000-0000-000004FC22D0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052910-0009-0000-0000-00001E903F53
Message-Id: <1527588818-7031-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-29_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805290118
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After the userspace interface description for KSM and THP was split to
Documentation/admin-guide/mm, the remaining parts belong to the section
describing MM internals.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
index 8e1cc66..c4ded22 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -13,8 +13,6 @@ various features of the Linux memory management
 .. toctree::
    :maxdepth: 1
 
-   ksm
-   transhuge
    swap_numa
    zswap
 
@@ -36,6 +34,7 @@ descriptions of data structures and algorithms.
    hmm
    hwpoison
    hugetlbfs_reserv
+   ksm
    mmu_notifier
    numa
    overcommit-accounting
@@ -45,6 +44,7 @@ descriptions of data structures and algorithms.
    remap_file_pages
    slub
    split_page_table_lock
+   transhuge
    unevictable-lru
    z3fold
    zsmalloc
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
