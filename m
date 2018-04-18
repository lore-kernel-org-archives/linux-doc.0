Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5FD047DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 08:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752786AbeDRIIC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 04:08:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42646 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751180AbeDRIIA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 04:08:00 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3I85rEj136944
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:08:00 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hdwccv4y9-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 04:07:59 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 18 Apr 2018 09:07:58 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 18 Apr 2018 09:07:55 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3I87skB54722654;
        Wed, 18 Apr 2018 08:07:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 471DCAE059;
        Wed, 18 Apr 2018 08:57:44 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 70D78AE057;
        Wed, 18 Apr 2018 08:57:42 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.205.155])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 18 Apr 2018 08:57:42 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Wed, 18 Apr 2018 11:07:52 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 0/7]  docs/vm: start moving files do Documentation/admin-guide`
Date:   Wed, 18 Apr 2018 11:07:43 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18041808-0040-0000-0000-000004304172
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041808-0041-0000-0000-0000263450A3
Message-Id: <1524038870-413-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-18_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804180076
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

These pacthes begin categorizing memory management documentation.  The
documents that describe userspace APIs and do not overload the reader with
implementation details can be moved to Documentation/admin-guide, so let's
do it :)

Mike Rapoport (7):
  docs/vm: hugetlbpage: minor improvements
  docs/vm: hugetlbpage: move section about kernel development to
    hugetlbfs_reserv
  docs/vm: pagemap: formatting and spelling updates
  docs/vm: pagemap: change document title
  docs/admin-guide: introduce basic index for mm documentation
  docs/admin-guide/mm: start moving here files from Documentation/vm
  docs/admin-guide/mm: convert plain text cross references to hyperlinks

 Documentation/ABI/stable/sysfs-devices-node        |  2 +-
 .../ABI/testing/sysfs-kernel-mm-hugepages          |  2 +-
 Documentation/admin-guide/index.rst                |  1 +
 .../{vm => admin-guide/mm}/hugetlbpage.rst         | 28 +++++++--------
 .../{vm => admin-guide/mm}/idle_page_tracking.rst  |  5 +--
 Documentation/admin-guide/mm/index.rst             | 28 +++++++++++++++
 Documentation/{vm => admin-guide/mm}/pagemap.rst   | 40 ++++++++++++----------
 .../{vm => admin-guide/mm}/soft-dirty.rst          |  0
 .../{vm => admin-guide/mm}/userfaultfd.rst         |  0
 Documentation/filesystems/proc.txt                 |  6 ++--
 Documentation/sysctl/vm.txt                        |  4 +--
 Documentation/vm/00-INDEX                          | 10 ------
 Documentation/vm/hugetlbfs_reserv.rst              |  8 +++++
 Documentation/vm/hwpoison.rst                      |  2 +-
 Documentation/vm/index.rst                         |  5 ---
 fs/Kconfig                                         |  2 +-
 fs/proc/task_mmu.c                                 |  4 +--
 mm/Kconfig                                         |  5 +--
 18 files changed, 89 insertions(+), 63 deletions(-)
 rename Documentation/{vm => admin-guide/mm}/hugetlbpage.rst (95%)
 rename Documentation/{vm => admin-guide/mm}/idle_page_tracking.rst (96%)
 create mode 100644 Documentation/admin-guide/mm/index.rst
 rename Documentation/{vm => admin-guide/mm}/pagemap.rst (83%)
 rename Documentation/{vm => admin-guide/mm}/soft-dirty.rst (100%)
 rename Documentation/{vm => admin-guide/mm}/userfaultfd.rst (100%)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
