Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5715E7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 07:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754509AbeEHHCW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 03:02:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36368 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754380AbeEHHCU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 03:02:20 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w486woap006981
        for <linux-doc@vger.kernel.org>; Tue, 8 May 2018 03:02:19 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hu6dkj316-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 03:02:19 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 8 May 2018 08:02:18 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 8 May 2018 08:02:15 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4872F0E721168;
        Tue, 8 May 2018 07:02:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2CAEAAE058;
        Tue,  8 May 2018 07:51:44 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B6257AE057;
        Tue,  8 May 2018 07:51:42 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.166])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  8 May 2018 07:51:42 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Tue, 08 May 2018 10:02:13 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 0/3] docs/vm: move numa_memory_policy.rst to admin-guide/mm
Date:   Tue,  8 May 2018 10:02:07 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18050807-0008-0000-0000-000004F43B6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050807-0009-0000-0000-00001E887AF9
Message-Id: <1525762930-28163-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-08_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080069
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

These patches include minor formatting and spelling updates to
Documentation/vm/numa_memory_policy.rst and move this file to
Documentation/admin-guide/mm.

Mike Rapoport (3):
  docs/vm: numa_memory_policy: formatting and spelling updates
  docs/vm: numa_memory_policy: s/Linux memory policy/NUMA memory policy/
  docs/vm: move numa_memory_policy.rst to Documentation/admin-guide/mm

 Documentation/admin-guide/mm/hugetlbpage.rst       |  2 +-
 Documentation/admin-guide/mm/index.rst             |  1 +
 .../{vm => admin-guide/mm}/numa_memory_policy.rst  | 38 ++++++++++++++--------
 Documentation/filesystems/proc.txt                 |  2 +-
 Documentation/filesystems/tmpfs.txt                |  5 +--
 Documentation/vm/00-INDEX                          |  2 --
 Documentation/vm/index.rst                         |  1 -
 Documentation/vm/numa.rst                          |  2 +-
 8 files changed, 31 insertions(+), 22 deletions(-)
 rename Documentation/{vm => admin-guide/mm}/numa_memory_policy.rst (95%)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
