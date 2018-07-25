Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32E5E7DE7F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 11:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbeGYMho (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Jul 2018 08:37:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49506 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728926AbeGYMho (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jul 2018 08:37:44 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6PBP7Jf108851
        for <linux-doc@vger.kernel.org>; Wed, 25 Jul 2018 07:26:28 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2kepdcn39h-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 25 Jul 2018 07:26:28 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 25 Jul 2018 12:26:26 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 25 Jul 2018 12:26:23 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w6PBQMhd28835938
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Jul 2018 11:26:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8073C4C046;
        Wed, 25 Jul 2018 14:26:37 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 153364C059;
        Wed, 25 Jul 2018 14:26:36 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.110])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 25 Jul 2018 14:26:35 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 25 Jul 2018 14:26:20 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 4/7] docs/core-api: move *{str,mem}dup* to "String Manipulation"
Date:   Wed, 25 Jul 2018 14:26:07 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532517970-16409-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1532517970-16409-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18072511-0028-0000-0000-000002E001AD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18072511-0029-0000-0000-00002397ED3E
Message-Id: <1532517970-16409-5-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-07-25_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=942 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807250124
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The string and memory duplication routines fit better to the "String
Manipulation" section than to "The SLAB Cache".

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/core-api/kernel-api.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 25e9496..39f1460 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -39,6 +39,10 @@ String Manipulation
 .. kernel-doc:: lib/string.c
    :export:
 
+.. kernel-doc:: mm/util.c
+   :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
+               vmemdup_user strndup_user memdup_user_nul
+
 Basic Kernel Library Functions
 ==============================
 
@@ -168,7 +172,7 @@ The Slab Cache
    :export:
 
 .. kernel-doc:: mm/util.c
-   :export:
+   :functions: kfree_const kvmalloc_node kvfree get_user_pages_fast
 
 User Space Memory Access
 ------------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
