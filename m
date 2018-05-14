Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A392A7D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 08:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752464AbeENINx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 04:13:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40890 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752307AbeENINu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 04:13:50 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4E84HSa137072
        for <linux-doc@vger.kernel.org>; Mon, 14 May 2018 04:13:49 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hy5tgae3v-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 14 May 2018 04:13:49 -0400
Received: from localhost
        by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Mon, 14 May 2018 09:13:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 14 May 2018 09:13:44 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4E8Divp10158546;
        Mon, 14 May 2018 08:13:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 93BAD52041;
        Mon, 14 May 2018 08:03:55 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.81])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1B07D52043;
        Mon, 14 May 2018 08:03:54 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Mon, 14 May 2018 11:13:41 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 0/3] docs/vm: transhuge: split userspace bits to admin-guide/mm 
Date:   Mon, 14 May 2018 11:13:37 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18051408-0012-0000-0000-000005D652AE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051408-0013-0000-0000-000019536692
Message-Id: <1526285620-453-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-14_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805140085
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Here are minor updates to transparent hugepage docs. Except from minor
formatting and spelling updates, these patches re-arrange the transhuge.rst
so that userspace interface description will not be interleaved with the
implementation details and it would be possible to split the userspace
related bits to Documentation/admin-guide/mm, which is done by the third
patch.

Mike Rapoport (3):
  docs/vm: transhuge: change sections order
  docs/vm: transhuge: minor updates
  docs/vm: transhuge: split userspace bits to admin-guide/mm/transhuge

 Documentation/admin-guide/kernel-parameters.txt |   3 +-
 Documentation/admin-guide/mm/index.rst          |   1 +
 Documentation/admin-guide/mm/transhuge.rst      | 418 ++++++++++++++++++++++++
 Documentation/vm/transhuge.rst                  | 395 +---------------------
 4 files changed, 426 insertions(+), 391 deletions(-)
 create mode 100644 Documentation/admin-guide/mm/transhuge.rst

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
