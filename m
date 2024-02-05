Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C24503E
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155522; cv=none; b=ozsbbIvDKbRNQ6+i70DcyXvlIfZPutc4lUy3IrCaDGRuCZ1/ViIrt+mgctalt2GF5CNLmfYy7aQVvDuB2ctI3eLYlsf/dYbtFAxxC+tjnFB7FFvx7dq0nJji2K+ZIuV5DWgezUVxGHY8wJ3nWX9MQ5PRGicJGVknw9h0PdGJHIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155522; c=relaxed/simple;
	bh=4Gp8SxPOY1umxg26W33eHB4JiPGatK2Jfn077mCKI60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eL8x/X82cqG53MOcF6yC/Vb2aKJJl0A/HFbTLT1e0xSk6K18zL6rCXttY3l3mnnYiEMED12YB8+Rh3F44yFOjHBjELJod6tMowkI+0TSDM8HHtQy2Wb8Pea3KflgCex+RPTWzsK1+Cm70+2tkGKru/WAip9s5GhouUMVnr0olSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m7vYPMQh; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m7vYPMQh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DWHW9017611;
	Mon, 5 Feb 2024 17:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=JlkL2Xu6YkrsCSTeD6CNOdR+rW8q3806KIwi0YElvKM=;
 b=m7vYPMQhdc/c6mAw/kesM6+YrZDZI4wqH5Vs5y9WG7SJpzPP34p/LF0/FRpd9URQbpSB
 3waqdodvZOPwoyWfrMnEXTzEdAPplDbQyMWmvCtmA9VQmV+XYZDUN5FvAVpOWuGE9EdN
 JxJevkxZ5MFo9RScYpoLq5cqxp+RplM0MGTrk5PGaAOkDdJePYwSjkqi40aMe3XQsxKY
 uzzh9mhmy4gvZ5USL/ecdSusQqMB1oQWeeH0rB8jwVXm9hxIefnbwG9ckHxQO3xY5RaY
 337vh7kPDXyL7lLX3OjdVX1ScxrjQLoTMUcBRmpVbh2KMTIs+VVFKLEtCh3bRQJvMqvx DQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1bwemmrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:52 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415HJjKm038547;
	Mon, 5 Feb 2024 17:51:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u24p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:52 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkis033449;
	Mon, 5 Feb 2024 17:51:51 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-4;
	Mon, 05 Feb 2024 17:51:51 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 3/8] doc: kernel_abi.py: convert to sphinx.util.logging
Date: Mon,  5 Feb 2024 18:51:28 +0100
Message-Id: <20240205175133.774271-4-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: mUQXQ5kNfo7fpr8ALTVOI8ayaTUG2qie
X-Proofpoint-GUID: mUQXQ5kNfo7fpr8ALTVOI8ayaTUG2qie

As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
to 2.4.4"), we can use Sphinx's built-in logging facilities.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kernel_abi.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 288f26097569..9eb7282cc941 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -37,16 +37,18 @@ import os
 import subprocess
 import sys
 import re
-import kernellog
 
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 from docutils.utils.error_reporting import ErrorString
+from sphinx.util import logging
 from sphinx.util.docutils import switch_source_input
 
 __version__  = '1.0'
 
+logger = logging.getLogger(__name__)
+
 def setup(app):
 
     app.add_directive("kernel-abi", KernelCmd)
@@ -129,7 +131,7 @@ class KernelCmd(Directive):
             else:
                 content.append(line, f, ln)
 
-        kernellog.info(self.state.document.settings.env.app, "%s: parsed %i lines" % (fname, n))
+        logger.info("%s: parsed %i lines", fname, n)
 
         if content:
             self.do_parse(content, node)
-- 
2.34.1

