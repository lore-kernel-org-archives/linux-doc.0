Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 06EC97DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 08:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753168AbeDRIIK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 04:08:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53584 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752652AbeDRIIH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 04:08:07 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3I87EPb123105
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:06 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hdwb23vt3-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:06 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 18 Apr 2018 09:08:04 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 18 Apr 2018 09:08:00 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3I880lv51576976;
        Wed, 18 Apr 2018 08:08:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 268D24C04E;
        Wed, 18 Apr 2018 09:00:30 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 59D264C058;
        Wed, 18 Apr 2018 09:00:28 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.205.155])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 18 Apr 2018 09:00:28 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 18 Apr 2018 11:07:57 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 2/7] docs/vm: hugetlbpage: move section about kernel development to hugetlbfs_reserv
Date:   Wed, 18 Apr 2018 11:07:45 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18041808-0020-0000-0000-000004132F0F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041808-0021-0000-0000-000042A77388
Message-Id: <1524038870-413-3-git-send-email-rppt@linux.vnet.ibm.com>
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

The hugetlbpage describes hugetlbfs from the user perspective and newer
hugetlbfs_reserv document targets kernel developers. Hence the section
about hugetlbfs kernel development naturally belongs there.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/hugetlbfs_reserv.rst | 8 ++++++++
 Documentation/vm/hugetlbpage.rst      | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/vm/hugetlbfs_reserv.rst b/Documentation/vm/hugetlbfs_reserv.rst
index 36a87a2..9d20076 100644
--- a/Documentation/vm/hugetlbfs_reserv.rst
+++ b/Documentation/vm/hugetlbfs_reserv.rst
@@ -583,5 +583,13 @@ of cpusets or memory policy there is no guarantee that huge pages will be
 available on the required nodes.  This is true even if there are a sufficient
 number of global reservations.
 
+Hugetlbfs regression testing
+============================
 
+The most complete set of hugetlb tests are in the libhugetlbfs repository.
+If you modify any hugetlb related code, use the libhugetlbfs test suite
+to check for regressions.  In addition, if you add any new hugetlb
+functionality, please add appropriate tests to libhugetlbfs.
+
+--
 Mike Kravetz, 7 April 2017
diff --git a/Documentation/vm/hugetlbpage.rst b/Documentation/vm/hugetlbpage.rst
index 99ad5d9..2b374d1 100644
--- a/Documentation/vm/hugetlbpage.rst
+++ b/Documentation/vm/hugetlbpage.rst
@@ -379,11 +379,3 @@ The `libhugetlbfs`_  library provides a wide range of userspace tools
 to help with huge page usability, environment setup, and control.
 
 .. _libhugetlbfs: https://github.com/libhugetlbfs/libhugetlbfs
-
-Kernel development regression testing
-=====================================
-
-The most complete set of hugetlb tests are in the libhugetlbfs repository.
-If you modify any hugetlb related code, use the libhugetlbfs test suite
-to check for regressions.  In addition, if you add any new hugetlb
-functionality, please add appropriate tests to libhugetlbfs.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
