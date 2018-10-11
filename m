Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 93E537D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 04:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbeJKMYK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 08:24:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38812 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726906AbeJKMX6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 08:23:58 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9B4vcTq064907
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 00:58:29 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2n1uuxg0mk-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 00:58:25 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 11 Oct 2018 05:58:24 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 11 Oct 2018 05:58:20 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w9B4wJaE1900816
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 11 Oct 2018 04:58:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C266C4204C;
        Thu, 11 Oct 2018 07:57:55 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 252D942045;
        Thu, 11 Oct 2018 07:57:54 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.207.69])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 11 Oct 2018 07:57:54 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Thu, 11 Oct 2018 07:58:17 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 0/2] docs: memory-hotplug: add details about locking internals 
Date:   Thu, 11 Oct 2018 07:58:15 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18101104-0008-0000-0000-0000027DE717
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18101104-0009-0000-0000-000021E72BA4
Message-Id: <1539233897-10207-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-10-11_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=689 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810110046
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

As discussed at [1], the latest updates to memory hotplug documentation are
causing a conflict between docs and mmotm trees.
These patches resolve the conflict.

[1] https://lkml.org/lkml/2018/10/8/227

David Hildenbrand (1):
  docs/core-api: memory-hotplug: add some details about locking internals

Mike Rapoport (1):
  docs/core-api: rename memory-hotplug-notifier to memory-hotplug

 Documentation/core-api/index.rst                   |   2 +-
 Documentation/core-api/memory-hotplug-notifier.rst |  84 --------------
 Documentation/core-api/memory-hotplug.rst          | 125 +++++++++++++++++++++
 3 files changed, 126 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/core-api/memory-hotplug-notifier.rst
 create mode 100644 Documentation/core-api/memory-hotplug.rst

-- 
2.7.4

