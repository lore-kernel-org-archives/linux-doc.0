Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D07E77DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 06:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755917AbeDXGkj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 02:40:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48370 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755910AbeDXGki (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 02:40:38 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3O6eaLW021258
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 02:40:38 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hhvy7egq3-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 02:40:37 -0400
Received: from localhost
        by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 24 Apr 2018 07:40:35 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 24 Apr 2018 07:40:31 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3O6eVIv4653362;
        Tue, 24 Apr 2018 06:40:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6868511C058;
        Tue, 24 Apr 2018 07:32:18 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D7CA211C052;
        Tue, 24 Apr 2018 07:32:16 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.99])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 24 Apr 2018 07:32:16 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Tue, 24 Apr 2018 09:40:29 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 0/7] docs/vm: update KSM documentation
Date:   Tue, 24 Apr 2018 09:40:21 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18042406-0012-0000-0000-000005CE122B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042406-0013-0000-0000-0000194A7FB6
Message-Id: <1524552028-7017-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-24_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804240067
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

These patches extend KSM documentation with high level design overview and
some details about reverse mappings and split the userspace interface
description to Documentation/admin-guide/mm.

The description of some KSM sysfs attributes is changed so that it won't
include implementation detail. The description of these implementation
details are moved to the new "Design" section.

The last patch in the series depends on the patchset that create
Documentation/admin-guide/mm [1], all the rest applies cleanly to the
current docs-next.

[1] https://lkml.org/lkml/2018/4/18/110

Mike Rapoport (7):
  mm/ksm: docs: extend overview comment and make it "DOC:"
  docs/vm: ksm: (mostly) formatting updates
  docs/vm: ksm: add "Design" section
  docs/vm: ksm: reshuffle text between "sysfs" and "design" sections
  docs/vm: ksm: update stable_node_chains_prune_millisecs description
  docs/vm: ksm: udpate description of stable_node_{dups,chains}
  docs/vm: ksm: split userspace interface to admin-guide/mm/ksm.rst

 Documentation/admin-guide/mm/index.rst |   1 +
 Documentation/admin-guide/mm/ksm.rst   | 189 ++++++++++++++++++++++++++
 Documentation/vm/ksm.rst               | 234 ++++++++++-----------------------
 mm/ksm.c                               |  19 ++-
 4 files changed, 277 insertions(+), 166 deletions(-)
 create mode 100644 Documentation/admin-guide/mm/ksm.rst

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
