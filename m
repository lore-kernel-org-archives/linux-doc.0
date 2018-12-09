Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D3B6D7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  9 Dec 2018 16:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbeLIQKB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 9 Dec 2018 11:10:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49182 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726256AbeLIQKB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Dec 2018 11:10:01 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB9G8qim143773
        for <linux-doc@vger.kernel.org>; Sun, 9 Dec 2018 11:10:00 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p8uyd8hmy-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sun, 09 Dec 2018 11:10:00 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sun, 9 Dec 2018 16:09:57 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 9 Dec 2018 16:09:55 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB9G9tip59834490
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 9 Dec 2018 16:09:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EB205A405C;
        Sun,  9 Dec 2018 16:09:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 77752A4054;
        Sun,  9 Dec 2018 16:09:53 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.213])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sun,  9 Dec 2018 16:09:53 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Sun, 09 Dec 2018 18:09:52 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] docs/networking: fix formatting of Intel drivers documentation
Date:   Sun,  9 Dec 2018 18:09:51 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 18120916-0020-0000-0000-000002F4A380
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120916-0021-0000-0000-00002144C0C7
Message-Id: <1544371791-31192-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-09_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=606 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812090149
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation of Intel drivers is missing the heading adornment for
document titles.

This causes the generated html to have TOC entries from these documents to
appear as top level TOC entries:

* Linux* Base Driver for Intel(R) Ethernet Network Connection
* Contents
* Identifying Your Adapter
* Command Line Parameters
  * AutoNeg
  * Duplex
  ...

Add overline heading adornment to document titles.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---

Another interesting thing is that many of these documents have very similar
or even identical titles.
It would be nice to include the adapter name in the titles to make them
distinguishable.

 Documentation/networking/e100.rst    | 1 +
 Documentation/networking/e1000.rst   | 1 +
 Documentation/networking/e1000e.rst  | 1 +
 Documentation/networking/fm10k.rst   | 1 +
 Documentation/networking/i40e.rst    | 1 +
 Documentation/networking/iavf.rst    | 1 +
 Documentation/networking/ice.rst     | 1 +
 Documentation/networking/igb.rst     | 1 +
 Documentation/networking/igbvf.rst   | 1 +
 Documentation/networking/ixgb.rst    | 1 +
 Documentation/networking/ixgbe.rst   | 1 +
 Documentation/networking/ixgbevf.rst | 1 +
 12 files changed, 12 insertions(+)

diff --git a/Documentation/networking/e100.rst b/Documentation/networking/e100.rst
index 5e2839b..2b9f488 100644
--- a/Documentation/networking/e100.rst
+++ b/Documentation/networking/e100.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+==============================================================
 Linux* Base Driver for the Intel(R) PRO/100 Family of Adapters
 ==============================================================
 
diff --git a/Documentation/networking/e1000.rst b/Documentation/networking/e1000.rst
index 6379d4d..956560b 100644
--- a/Documentation/networking/e1000.rst
+++ b/Documentation/networking/e1000.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+===========================================================
 Linux* Base Driver for Intel(R) Ethernet Network Connection
 ===========================================================
 
diff --git a/Documentation/networking/e1000e.rst b/Documentation/networking/e1000e.rst
index 33554e5..01999f0 100644
--- a/Documentation/networking/e1000e.rst
+++ b/Documentation/networking/e1000e.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+======================================================
 Linux* Driver for Intel(R) Ethernet Network Connection
 ======================================================
 
diff --git a/Documentation/networking/fm10k.rst b/Documentation/networking/fm10k.rst
index bf5e594..ac3269e 100644
--- a/Documentation/networking/fm10k.rst
+++ b/Documentation/networking/fm10k.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+==============================================================
 Linux* Base Driver for Intel(R) Ethernet Multi-host Controller
 ==============================================================
 
diff --git a/Documentation/networking/i40e.rst b/Documentation/networking/i40e.rst
index 0cc16c5..848fd38 100644
--- a/Documentation/networking/i40e.rst
+++ b/Documentation/networking/i40e.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+==================================================================
 Linux* Base Driver for the Intel(R) Ethernet Controller 700 Series
 ==================================================================
 
diff --git a/Documentation/networking/iavf.rst b/Documentation/networking/iavf.rst
index f8b42b6..2d0c3ba 100644
--- a/Documentation/networking/iavf.rst
+++ b/Documentation/networking/iavf.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+==================================================================
 Linux* Base Driver for Intel(R) Ethernet Adaptive Virtual Function
 ==================================================================
 
diff --git a/Documentation/networking/ice.rst b/Documentation/networking/ice.rst
index 4d118b8..c220aa2 100644
--- a/Documentation/networking/ice.rst
+++ b/Documentation/networking/ice.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+===================================================================
 Linux* Base Driver for the Intel(R) Ethernet Connection E800 Series
 ===================================================================
 
diff --git a/Documentation/networking/igb.rst b/Documentation/networking/igb.rst
index ba16b86..e8f99af 100644
--- a/Documentation/networking/igb.rst
+++ b/Documentation/networking/igb.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+===========================================================
 Linux* Base Driver for Intel(R) Ethernet Network Connection
 ===========================================================
 
diff --git a/Documentation/networking/igbvf.rst b/Documentation/networking/igbvf.rst
index a8a9ffa..9cddabe 100644
--- a/Documentation/networking/igbvf.rst
+++ b/Documentation/networking/igbvf.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+============================================================
 Linux* Base Virtual Function Driver for Intel(R) 1G Ethernet
 ============================================================
 
diff --git a/Documentation/networking/ixgb.rst b/Documentation/networking/ixgb.rst
index 8bd80e27..9450182 100644
--- a/Documentation/networking/ixgb.rst
+++ b/Documentation/networking/ixgb.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+=====================================================================
 Linux Base Driver for 10 Gigabit Intel(R) Ethernet Network Connection
 =====================================================================
 
diff --git a/Documentation/networking/ixgbe.rst b/Documentation/networking/ixgbe.rst
index 725fc69..255bfe1 100644
--- a/Documentation/networking/ixgbe.rst
+++ b/Documentation/networking/ixgbe.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+=============================================================================
 Linux* Base Driver for the Intel(R) Ethernet 10 Gigabit PCI Express Adapters
 =============================================================================
 
diff --git a/Documentation/networking/ixgbevf.rst b/Documentation/networking/ixgbevf.rst
index 56cde63..5d49773 100644
--- a/Documentation/networking/ixgbevf.rst
+++ b/Documentation/networking/ixgbevf.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0+
 
+=============================================================
 Linux* Base Virtual Function Driver for Intel(R) 10G Ethernet
 =============================================================
 
-- 
2.7.4

