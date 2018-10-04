Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 189927D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 22:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbeJEFGh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 01:06:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39422 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725758AbeJEFGh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 01:06:37 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w94MA55R058717
        for <linux-doc@vger.kernel.org>; Thu, 4 Oct 2018 18:11:10 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mwsx2bm2p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 04 Oct 2018 18:11:10 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Thu, 4 Oct 2018 23:11:08 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 4 Oct 2018 23:11:05 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w94MB4A765929348
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Oct 2018 22:11:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 527445204E;
        Fri,  5 Oct 2018 01:10:41 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.204.110])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id DCD6752051;
        Fri,  5 Oct 2018 01:10:39 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Fri, 05 Oct 2018 01:11:02 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 0/2] docs: ReSTify memory-hotplug description 
Date:   Fri,  5 Oct 2018 01:10:59 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18100422-0020-0000-0000-000002CFAB2F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18100422-0021-0000-0000-0000211DFC70
Message-Id: <1538691061-31289-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-10-04_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810040199
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Recently I've noticed that Documentation/memory-hotplug.txt is 
   1) mostly formatted
   2) in a wrong place

These patches split the memory-hotplug.txt to two parts: user/admin
interface and memory hotplug notifier API and place these parts in the
correct places, with some formatting changes.

Mike Rapoport (2):
  docs: move memory hotplug description into admin-guide/mm
  docs/vm: split memory hotplug notifier description to Documentation/core-api

 Documentation/admin-guide/mm/index.rst             |   1 +
 .../mm/memory-hotplug.rst}                         | 152 +++++----------------
 Documentation/core-api/index.rst                   |   2 +
 Documentation/core-api/memory-hotplug-notifier.rst |  84 ++++++++++++
 4 files changed, 122 insertions(+), 117 deletions(-)
 rename Documentation/{memory-hotplug.txt => admin-guide/mm/memory-hotplug.rst} (77%)
 create mode 100644 Documentation/core-api/memory-hotplug-notifier.rst

-- 
2.7.4

