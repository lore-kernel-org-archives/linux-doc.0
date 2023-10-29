Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9493F2115
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e63Xa7rV"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8489D3;
	Sun, 29 Oct 2023 00:42:40 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39T3xT8i003414;
	Sun, 29 Oct 2023 07:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=PMdEVcl6/GvDHVYX1nA2cwfMGMcgfamSby+ZO1H5Tjk=;
 b=e63Xa7rVDh+WJ+cw0iAJYX823XY4u5qy2WoH4992aRnkHXGUMqtr6sZsJMa1LWdbhTS6
 d49FFytdvxVSeLeZb9zhJMMSjj3RY6x1BxzFd0Ad5oYDnkU6I0Rx+b22CNgJ7vvVowbs
 Px14GEOWgsTVOl4PPgkU9lbRF/hXkWT5MwzV0a3VoD2Z3LrblZ9ag1a0TjgJeDKRynoh
 4okSDHWsRyyTRMhyZDcGEC8dbzvIU+Dq8iGci2cusKaxkY0U1FDGgC3LAGM1VmFTi44Z
 XXXWuyWg4FC+aOcYur/b4Jx5URHyI89g2j5o/L6PHHMsvkytUlDzCZHx7Rw/bdYTQ7ib yQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0rqds43u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Oct 2023 07:42:30 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39T5jHu5026184;
	Sun, 29 Oct 2023 07:42:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rr356nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Oct 2023 07:42:29 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39T7gTSO016992;
	Sun, 29 Oct 2023 07:42:29 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-56-223.vpn.oracle.com [10.175.56.223])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3u0rr356mr-1;
	Sun, 29 Oct 2023 07:42:28 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] Documentation: add tux logo
Date: Sun, 29 Oct 2023 08:42:07 +0100
Message-Id: <20231029074207.297663-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-28_24,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310290064
X-Proofpoint-ORIG-GUID: KdMG-1HdFgCN97PkVrEvOAN023ING-np
X-Proofpoint-GUID: KdMG-1HdFgCN97PkVrEvOAN023ING-np

We already have the logo, let's use it.

Testing: make htmldocs

Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/conf.py                  | 4 ++++
 Documentation/sphinx-static/custom.css | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index d4fdf6a3875a..20bd74edcca9 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -357,6 +357,10 @@ html_sidebars = { '**': ['searchbox.html', 'kernel-toc.html', 'sourcelink.html']
 if html_theme == 'alabaster':
     html_sidebars['**'].insert(0, 'about.html')
 
+# The name of an image file (relative to this directory) to place at the top
+# of the sidebar.
+html_logo = 'images/logo.svg'
+
 # Output file base name for HTML help builder.
 htmlhelp_basename = 'TheLinuxKerneldoc'
 
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 084a884f6fb7..56653f73d8f9 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -20,6 +20,12 @@ div.document {
     width: auto;
 }
 
+/* Size the logo appropriately */
+img.logo {
+    width: 104px;
+    margin-bottom: 20px;
+}
+
 /*
  * Parameters for the display of function prototypes and such included
  * from C source files.
-- 
2.34.1

