Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE1C37D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 15:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbeKHAjc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 19:39:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40554 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726830AbeKHAjc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 19:39:32 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA7F00nc015900
        for <linux-doc@vger.kernel.org>; Wed, 7 Nov 2018 10:08:46 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nm2820nxm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 07 Nov 2018 10:08:45 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Wed, 7 Nov 2018 15:08:43 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 7 Nov 2018 15:08:41 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wA7F8e4V9568514
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Nov 2018 15:08:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1EDCCA4059;
        Wed,  7 Nov 2018 15:08:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BC1C7A4054;
        Wed,  7 Nov 2018 15:08:38 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.58])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  7 Nov 2018 15:08:38 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 07 Nov 2018 17:08:38 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] mm/gup: fix follow_page_mask kernel-doc comment
Date:   Wed,  7 Nov 2018 17:08:36 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18110715-0008-0000-0000-0000028EA63E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110715-0009-0000-0000-000021F8E645
Message-Id: <1541603316-27832-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-07_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=929 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811070135
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit df06b37ffe5a ("mm/gup: cache dev_pagemap while pinning pages")
modified the signature of follow_page_mask() function but left the
parameter description behind.

Update the description to make the code and comments agree again.

While on it, update formatting of the return value description to match
Documentation/doc-guide/kernel-doc.rst guidelines.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/gup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f76e77a..aa43620 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -385,11 +385,17 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
  * @vma: vm_area_struct mapping @address
  * @address: virtual address to look up
  * @flags: flags modifying lookup behaviour
- * @page_mask: on output, *page_mask is set according to the size of the page
+ * @ctx: contains dev_pagemap for %ZONE_DEVICE memory pinning and a
+ *       pointer to output page_mask
  *
  * @flags can have FOLL_ flags set, defined in <linux/mm.h>
  *
- * Returns the mapped (struct page *), %NULL if no mapping exists, or
+ * When getting pages from ZONE_DEVICE memory, the @ctx->pgmap caches
+ * the device's dev_pagemap metadata to avoid repeating expensive lookups.
+ *
+ * On output, the @ctx->page_mask is set according to the size of the page.
+ *
+ * Return: the mapped (struct page *), %NULL if no mapping exists, or
  * an error pointer if there is a mapping to something not represented
  * by a page descriptor (see also vm_normal_page()).
  */
-- 
2.7.4

