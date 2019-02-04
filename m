Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97AB17D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Feb 2019 08:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfBDIrQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Feb 2019 03:47:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45056 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726242AbfBDIrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Feb 2019 03:47:16 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x148hdi0055130
        for <linux-doc@vger.kernel.org>; Mon, 4 Feb 2019 03:47:14 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qegg0c93p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 04 Feb 2019 03:47:14 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <kamalesh@linux.vnet.ibm.com>;
        Mon, 4 Feb 2019 08:47:13 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 4 Feb 2019 08:47:11 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x148lB1Z20906018
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Feb 2019 08:47:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E2A084C05C;
        Mon,  4 Feb 2019 08:47:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DE7CF4C040;
        Mon,  4 Feb 2019 08:47:09 +0000 (GMT)
Received: from JAVRIS.in.ibm.com (unknown [9.124.35.113])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  4 Feb 2019 08:47:09 +0000 (GMT)
From:   Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] static_keys.txt: Fix trivial spelling mistake
Date:   Mon,  4 Feb 2019 14:16:57 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19020408-4275-0000-0000-0000030A3006
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020408-4276-0000-0000-0000381830B4
Message-Id: <20190204084657.24347-1-kamalesh@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-02-04_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=915 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902040072
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the spelling of 'functionnality' -> 'functionality'.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
---
 Documentation/static-keys.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/static-keys.txt b/Documentation/static-keys.txt
index d68135560895..9803e14639bf 100644
--- a/Documentation/static-keys.txt
+++ b/Documentation/static-keys.txt
@@ -159,7 +159,7 @@ particularly the CPU hotplug lock (in order to avoid races against
 CPUs being brought in the kernel while the kernel is getting
 patched). Calling the static key API from within a hotplug notifier is
 thus a sure deadlock recipe. In order to still allow use of the
-functionnality, the following functions are provided:
+functionality, the following functions are provided:
 
 	static_key_enable_cpuslocked()
 	static_key_disable_cpuslocked()
-- 
2.20.1

