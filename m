Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A345947
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155524; cv=none; b=ZMzR/Jv5cvU0EQtF8XnQiB464TyNfKr5W3HtKURE3etW5srNEACs+djLy2kkFaT7draq6Mx4S6B4lvXynUQ/f4jScQeVfF9wh+EIEFEQdLm8HzDjTWy6K/E1bT2tbWGTkW9x6UVRJlUHrR2OvlvWWTpqraJr+vmucGhSG6USVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155524; c=relaxed/simple;
	bh=i/VgmI1osLsffg26SyDoWrhhKzcnuJuriSZxEPWUsF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otwlVJnh0cLwGD55a7n1hMLWxPdbf8cIxdYjxuI9v6Jia3lapp8fxSB60annouInYq1gwQVrT2lvoeTlyCWCRgBZ+ebtGcIVSCmJuXEP1m71G1mF6HPf2ONr3IxzEV49U6x9Ut4JIwMu2opXscKbaGG3aMVenVGJPwFklEWoQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ud6qpNkL; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ud6qpNkL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DW2f6015913;
	Mon, 5 Feb 2024 17:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=Ak60UqBy+Wf+zb1kZWKqlCuGpzk1WEkcadxQ24bE2Ds=;
 b=Ud6qpNkLujeo7ywpHixQN7Y6a1qGDsClqY31tMtfhQ6/YyHoTLt+wVOWkFNLSi1NF0HA
 5wBtx4zwyQY6Dk5dzyoaJYzlNy7dEEOKHNUFTGfg9xnTRvePTX099OKT7GhmfFokV6/P
 Zchr+fcKOU4458sv1DzQzOXm11AvZHBJDlvbdAaTEytdJez+21f/PPduHuOzT3w6LHlt
 oJ2IXENvhm0iAJBfjw5GT2g4Qhl4bJtK7hFZ3ptenzBm4otaGT4KQHCFMZD3PmXuNCfQ
 +ssM16K8IpA2dZ24b8L+/0KI84L+YY1k3783aFXF+LFZg7cS1rCxil3U9qtnJS3gX2WI 2A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1c32mpp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:52:00 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415HlpTf038318;
	Mon, 5 Feb 2024 17:51:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u2bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:59 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkj2033449;
	Mon, 5 Feb 2024 17:51:58 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-8;
	Mon, 05 Feb 2024 17:51:58 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 7/8] doc: remove kernellog.py
Date: Mon,  5 Feb 2024 18:51:32 +0100
Message-Id: <20240205175133.774271-8-vegard.nossum@oracle.com>
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
 mlxlogscore=911 bulkscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050134
X-Proofpoint-GUID: _9XSw9xbEdjAB0MRc_1soiZ5Sle6jZjW
X-Proofpoint-ORIG-GUID: _9XSw9xbEdjAB0MRc_1soiZ5Sle6jZjW

With the last kernellog users gone, we can remove this compatibility
layer.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kernellog.py | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 Documentation/sphinx/kernellog.py

diff --git a/Documentation/sphinx/kernellog.py b/Documentation/sphinx/kernellog.py
deleted file mode 100644
index 0bc00c138cad..000000000000
--- a/Documentation/sphinx/kernellog.py
+++ /dev/null
@@ -1,22 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Sphinx has deprecated its older logging interface, but the replacement
-# only goes back to 1.6.  So here's a wrapper layer to keep around for
-# as long as we support 1.4.
-#
-# We don't support 1.4 anymore, but we'll keep the wrappers around until
-# we change all the code to not use them anymore :)
-#
-import sphinx
-from sphinx.util import logging
-
-logger = logging.getLogger('kerneldoc')
-
-def warn(app, message):
-    logger.warning(message)
-
-def verbose(app, message):
-    logger.verbose(message)
-
-def info(app, message):
-    logger.info(message)
-- 
2.34.1

