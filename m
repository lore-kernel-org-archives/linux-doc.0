Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 769B07D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 21:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754012AbeF2VGU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 17:06:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46018 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753973AbeF2VGT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 17:06:19 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5TL5u6O022341
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 17:06:19 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2jwrruyvv8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 17:06:00 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Fri, 29 Jun 2018 22:05:18 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 29 Jun 2018 22:05:16 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w5TL5FxK38076450
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 29 Jun 2018 21:05:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EFD10AE058;
        Fri, 29 Jun 2018 22:05:05 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7206AAE057;
        Fri, 29 Jun 2018 22:05:04 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.207.81])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 29 Jun 2018 22:05:04 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Sat, 30 Jun 2018 00:05:12 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH v3 0/2] Documentation/sphinx: add kind of "nodocs" directive
Date:   Sat, 30 Jun 2018 00:05:09 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18062921-4275-0000-0000-000002937AE1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18062921-4276-0000-0000-0000379AED16
Message-Id: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-29_10:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=701 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1806290223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

These patches allow passing "-no-doc-sections" option to scripts/kernel-doc
from the sphinx generator.

This allows to avoid duplicated DOC: sections when "kernel-doc:" directive
is used without explicit selection of functions or function types. For
instance, [1] has "IDA description" and "idr synchronization" twice.

v3 changes:
* add description for empty "functions" directive to
Documentation/doc-guide/kernel-doc.rst
v2 changes:
* Use empty "functions" directive instead of "nodocs", as per Jani's suggestion

Mike Rapoport (2):
  Documentation/sphinx: allow "functions" with no parameters
  docs/idr: use empty "functions" directive

 Documentation/core-api/idr.rst         |  2 ++
 Documentation/doc-guide/kernel-doc.rst |  9 +++++++--
 Documentation/sphinx/kerneldoc.py      | 10 +++++++---
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
