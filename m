Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623804503C
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155522; cv=none; b=CP4FcG9MGXSMu5o/1JwW4VOo5NdqoRBRrslIH9NSeGKNzenQRCF4h0XAwHbb9Cl0qPRyvp93hI3Ao1PJgp5OjBP6eZ0dXjfZnecGnD2MMT4ihZ8UVn7ARgzoIbyCsNTPyKJIruMFeqZNk9ak5UsWZBfbl2c4KaQB8fpvDQ214VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155522; c=relaxed/simple;
	bh=yODsSmPatH1E/LYPOTC3TxHlIHHM0ZyS+/oDf7s2pqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=erm4xC7tCkyfB7m8Do1YvclWJi7eVU+0aIidkqh7OiKjvMrRtoXbXe64Skte6xiGf58+PvdvkKiLDoZytixOTTcWD9CUM4B2RNBlgVU9mGD4Wlc2ALEjywU7mGZRCuac9koNm4MO6CWd2JuRababQYHIGIQE1ssi794EsGWJ7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g++sNd+l; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g++sNd+l"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DW96F024519;
	Mon, 5 Feb 2024 17:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=dbcOpgEVWwvFX1QlhNegAOEWAN5EglTHyBtXWlLtutU=;
 b=g++sNd+lhH+F+THZoE7ccs/T0P5DcpidmZezFIm8qngXXoRChYCR9ovKNCpvkFC6qC7j
 tbokCWzUaJzb9Y5BsIomCoGVzMDfMrhuh98iswO6A2i7CnCFOsspxlgYcqH7lrdTjvcE
 RLyfPI4x/y1LLhahHgVu2mjGcBNIYMTey/9Kj6Jrl2F45xjqoUGBN5saE/MJyB+SF777
 loSqKlr3Z2XmC/FzS1yUhseuZ+7f9ZDTjIP9MrIcycktKFvKFUAA80gQaHdlYUpeOrl5
 CM2C0FRSYP9a9RWGkAofGVqZDLuTeA0i7rQ5PBGOrwvmYVqK2WSlm/OliissvTYzb+8p hw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1dhdcpuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:54 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415HK9DX038382;
	Mon, 5 Feb 2024 17:51:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u264-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:54 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkiu033449;
	Mon, 5 Feb 2024 17:51:53 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-5;
	Mon, 05 Feb 2024 17:51:53 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 4/8] doc: kernel_feat.py: convert to sphinx.util.logging
Date: Mon,  5 Feb 2024 18:51:29 +0100
Message-Id: <20240205175133.774271-5-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205175133.774271-1-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_12,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050134
X-Proofpoint-GUID: jqoYaYEaQ6fMqY173cvqZ1PjpNNmXmB4
X-Proofpoint-ORIG-GUID: jqoYaYEaQ6fMqY173cvqZ1PjpNNmXmB4

As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
to 2.4.4"), we can use Sphinx's built-in logging facilities.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kernel_feat.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index 3493621d1a4e..f1c9e4a54964 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -41,10 +41,13 @@ from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 from docutils.utils.error_reporting import ErrorString
+from sphinx.util import logging
 from sphinx.util.docutils import switch_source_input
 
 __version__  = '1.0'
 
+logger = logging.getLogger(__name__)
+
 def setup(app):
 
     app.add_directive("kernel-feat", KernelFeat)
@@ -67,12 +70,6 @@ class KernelFeat(Directive):
         "debug"     : directives.flag
     }
 
-    def warn(self, message, **replace):
-        replace["fname"]   = self.state.document.current_source
-        replace["line_no"] = replace.get("line_no", self.lineno)
-        message = ("%(fname)s:%(line_no)s: [kernel-feat WARN] : " + message) % replace
-        self.state.document.settings.env.app.warn(message, prefix="")
-
     def run(self):
         doc = self.state.document
         if not doc.settings.file_insertion_enabled:
-- 
2.34.1

