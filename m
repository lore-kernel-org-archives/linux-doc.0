Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA9347D87A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 16 Aug 2018 13:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391573AbeHPQCk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 16 Aug 2018 12:02:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48138 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391552AbeHPQCY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Aug 2018 12:02:24 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w7GCxvB9088946
        for <linux-doc@vger.kernel.org>; Thu, 16 Aug 2018 09:03:55 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2kw6bxgfvk-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 16 Aug 2018 09:03:54 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Thu, 16 Aug 2018 14:03:51 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 16 Aug 2018 14:03:47 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w7GD3kgB36569294
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Aug 2018 13:03:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D16E4A4059;
        Thu, 16 Aug 2018 16:03:49 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 37959A405D;
        Thu, 16 Aug 2018 16:03:48 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.148])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 16 Aug 2018 16:03:48 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Thu, 16 Aug 2018 16:03:44 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Michal Hocko <mhocko@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH v2 2/3] docs: core-api/mm-api: add a lable for GFP flags section
Date:   Thu, 16 Aug 2018 16:03:37 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534424618-24713-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1534424618-24713-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18081613-0008-0000-0000-00000262B1A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081613-0009-0000-0000-000021CADD1F
Message-Id: <1534424618-24713-3-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-08-16_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=745 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808160137
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/core-api/mm-api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 46ae353..5ce1ec1 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -14,6 +14,8 @@ User Space Memory Access
 .. kernel-doc:: mm/util.c
    :functions: get_user_pages_fast
 
+.. _mm-api-gfp-flags:
+
 Memory Allocation Controls
 ==========================
 
-- 
2.7.4

