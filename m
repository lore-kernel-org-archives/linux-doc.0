Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D50C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 06:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C2E264EC4
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 06:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhBYGKZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 01:10:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12836 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233067AbhBYGKF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 01:10:05 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11P64BSS003479;
        Thu, 25 Feb 2021 01:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8dL06oBDHYCje9bYWS5Rem0wcTfIqAwbRpVgC9rQgPE=;
 b=K+4xpZJmW0/kHS/VEq0hPeJ16S6YptCVCAQmXpDw4gGCxPhODJNsXq86CBVLq6KViLjt
 Mc+XqdJT+a72R6Q4QA8tTAWrlzssfeiDdmtEpB9gGvqB6jCQKRCIapEiXH0a+0MPMrMG
 G2vHfgL57zo/BiWFdwDwhfDO2ZXyNXTnxxs5wEXAkLAuqghMGbo32nTxkK7mDqgT3NVg
 Jsvp7RhpcQv38IasbuDiEsV+pXBmSoGFsQ9iqJHEnPkgCveducPnUqZldg6h4Ba9cjLs
 nUjiv/8N1m/9KWLahCkSUs3FS+MkbHvUxAwAGf8akh94+vZxT9gNyPNSEN4BfGQiuuYQ HQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36wmfx0bja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Feb 2021 01:09:15 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11P679R5007495;
        Thu, 25 Feb 2021 06:09:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma04ams.nl.ibm.com with ESMTP id 36tt28c5sc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Feb 2021 06:09:13 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11P69BeE30409170
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Feb 2021 06:09:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4459EA4051;
        Thu, 25 Feb 2021 06:09:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A9CCFA404D;
        Thu, 25 Feb 2021 06:09:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 25 Feb 2021 06:09:10 +0000 (GMT)
Received: from intelligence.ibm.com (unknown [9.206.205.112])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 026F560242;
        Thu, 25 Feb 2021 17:09:07 +1100 (AEDT)
From:   Andrew Donnellan <ajd@linux.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-doc@vger.kernel.org, mchehab+huawei@kernel.org,
        corbet@lwn.net
Subject: [PATCH] docs: powerpc: Fix tables in syscall64-abi.rst
Date:   Thu, 25 Feb 2021 17:08:57 +1100
Message-Id: <20210225060857.16083-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-25_01:2021-02-24,2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 adultscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250052
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed
table") attempted to fix the formatting of tables in syscall64-abi.rst, but
inadvertently changed some register names.

Redo the tables with the correct register names, and while we're here,
clean things up to separate the registers into different rows and add
headings.

Fixes: 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed table")
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 Documentation/powerpc/syscall64-abi.rst | 51 ++++++++++++++++---------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/powerpc/syscall64-abi.rst
index cf9b2857c72a..dabee3729e5a 100644
--- a/Documentation/powerpc/syscall64-abi.rst
+++ b/Documentation/powerpc/syscall64-abi.rst
@@ -46,25 +46,38 @@ stack frame LR and CR save fields are not used.
 
 Register preservation rules
 ---------------------------
-Register preservation rules match the ELF ABI calling sequence with the
-following differences:
-
-+------------------------------------------------------------------------+
-|        For the sc instruction, differences with the ELF ABI		 |
-+--------------+--------------+------------------------------------------+
-| r0           | Volatile     | (System call number.)			 |
-| rr3          | Volatile     | (Parameter 1, and return value.)	 |
-| rr4-r8       | Volatile     | (Parameters 2-6.)			 |
-| rcr0         | Volatile     | (cr0.SO is the return error condition.)	 |
-| rcr1, cr5-7  | Nonvolatile  |						 |
-| rlr          | Nonvolatile  |						 |
-+--------------+--------------+------------------------------------------+
-|      For the scv 0 instruction, differences with the ELF ABI		 |
-+--------------+--------------+------------------------------------------+
-| r0           | Volatile     | (System call number.)			 |
-| r3           | Volatile     | (Parameter 1, and return value.)	 |
-| r4-r8        | Volatile     | (Parameters 2-6.)			 |
-+--------------+--------------+------------------------------------------+
+Register preservation rules match the ELF ABI calling sequence with some
+differences.
+
+For the sc instruction, the differences from the ELF ABI are as follows:
+
++--------------+--------------------+-----------------------------------------+
+| Register     | Preservation Rules | Purpose                                 |
++==============+====================+=========================================+
+| r0           | Volatile           | (System call number.)                   |
++--------------+--------------------+-----------------------------------------+
+| r3           | Volatile           | (Parameter 1, and return value.)        |
++--------------+--------------------+-----------------------------------------+
+| r4-r8        | Volatile           | (Parameters 2-6.)                       |
++--------------+--------------------+-----------------------------------------+
+| cr0          | Volatile           | (cr0.SO is the return error condition.) |
++--------------+--------------------+-----------------------------------------+
+| cr1, cr5-7   | Nonvolatile        |                                         |
++--------------+--------------------+-----------------------------------------+
+| lr           | Nonvolatile        |                                         |
++--------------+--------------------+-----------------------------------------+
+
+For the scv 0 instruction, the differences from the ELF ABI are as follows:
+
++--------------+--------------------+-----------------------------------------+
+| Register     | Preservation Rules | Purpose                                 |
++==============+====================+=========================================+
+| r0           | Volatile           | (System call number.)                   |
++--------------+--------------------+-----------------------------------------+
+| r3           | Volatile           | (Parameter 1, and return value.)        |
++--------------+--------------------+-----------------------------------------+
+| r4-r8        | Volatile           | (Parameters 2-6.)                       |
++--------------+--------------------+-----------------------------------------+
 
 All floating point and vector data registers as well as control and status
 registers are nonvolatile.
-- 
2.20.1

