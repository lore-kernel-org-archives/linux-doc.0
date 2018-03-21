Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 414F87D0F4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 19:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753331AbeCUT2i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 15:28:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53074 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753465AbeCUTYr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 15:24:47 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2LJIYdo003744
        for <linux-doc@vger.kernel.org>; Wed, 21 Mar 2018 15:24:47 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2guw151f66-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 21 Mar 2018 15:24:46 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 21 Mar 2018 19:24:44 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 21 Mar 2018 19:24:39 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2LJOcPG66846772;
        Wed, 21 Mar 2018 19:24:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BBBAA42042;
        Wed, 21 Mar 2018 19:16:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 408EB4203F;
        Wed, 21 Mar 2018 19:16:42 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.27])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 21 Mar 2018 19:16:42 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 21 Mar 2018 21:24:34 +0200
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@linux-mips.org,
        linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 23/32] docs/vm: split_page_table_lock: convert to ReST format
Date:   Wed, 21 Mar 2018 21:22:39 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521660168-14372-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1521660168-14372-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18032119-0040-0000-0000-00000425821B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032119-0041-0000-0000-00002628877D
Message-Id: <1521660168-14372-24-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-21_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803210221
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/vm/split_page_table_lock | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/vm/split_page_table_lock b/Documentation/vm/split_page_table_lock
index 62842a8..889b00b 100644
--- a/Documentation/vm/split_page_table_lock
+++ b/Documentation/vm/split_page_table_lock
@@ -1,3 +1,6 @@
+.. _split_page_table_lock:
+
+=====================
 Split page table lock
 =====================
 
@@ -11,6 +14,7 @@ access to the table. At the moment we use split lock for PTE and PMD
 tables. Access to higher level tables protected by mm->page_table_lock.
 
 There are helpers to lock/unlock a table and other accessor functions:
+
  - pte_offset_map_lock()
 	maps pte and takes PTE table lock, returns pointer to the taken
 	lock;
@@ -34,12 +38,13 @@ Split page table lock for PMD tables is enabled, if it's enabled for PTE
 tables and the architecture supports it (see below).
 
 Hugetlb and split page table lock
----------------------------------
+=================================
 
 Hugetlb can support several page sizes. We use split lock only for PMD
 level, but not for PUD.
 
 Hugetlb-specific helpers:
+
  - huge_pte_lock()
 	takes pmd split lock for PMD_SIZE page, mm->page_table_lock
 	otherwise;
@@ -47,7 +52,7 @@ Hugetlb-specific helpers:
 	returns pointer to table lock;
 
 Support of split page table lock by an architecture
----------------------------------------------------
+===================================================
 
 There's no need in special enabling of PTE split page table lock:
 everything required is done by pgtable_page_ctor() and pgtable_page_dtor(),
@@ -73,7 +78,7 @@ NOTE: pgtable_page_ctor() and pgtable_pmd_page_ctor() can fail -- it must
 be handled properly.
 
 page->ptl
----------
+=========
 
 page->ptl is used to access split page table lock, where 'page' is struct
 page of page containing the table. It shares storage with page->private
@@ -81,6 +86,7 @@ page of page containing the table. It shares storage with page->private
 
 To avoid increasing size of struct page and have best performance, we use a
 trick:
+
  - if spinlock_t fits into long, we use page->ptr as spinlock, so we
    can avoid indirect access and save a cache line.
  - if size of spinlock_t is bigger then size of long, we use page->ptl as
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
