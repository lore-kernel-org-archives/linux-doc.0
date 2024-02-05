Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685045946
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155527; cv=none; b=mqGiwpVdtNVXWJj9rv0mGONFDul9w6ddSZyrsTz199qXrS2w07Y+hSXq0Aw3s+nBTulINDmfaYWzSTL2iBudaKHLh+XtfPWk2eGKZj1Pdtz3ledSSi46uaomxT8cYRAIIw/hP/IVs8+EO9Luo6vd93FCs/HJ8vhp+dnCYz2BSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155527; c=relaxed/simple;
	bh=5abi+hHjPpLe4dBi5FGLbW/peZfjKucyXzSXy6wPOFE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EUPIcfG3fWs8xEX8X69dzDcmdEOWCMMzKP28rlGFieSr3Zt6tgNMX3iAvaBX9xSmbJS4BEGYM5UA5So7NcJWzmKIakUllwXkuI7bsBAhdJohxmtnmmFPOLG0G/Vnv2UevZKxFnKQUxe62cNI8wZ9Jq5gbFxblSh3xlFpuhrflas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RojTymHN; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RojTymHN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DW42G015941;
	Mon, 5 Feb 2024 17:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=skLo/ttlZUXioKElv/oqaftbSb4ASZzW5sEtk6C3n8w=;
 b=RojTymHNuZAkr9vHy2DJaDNXAegsrVAVs2xjKKLcBdQxcMf5MmEQPlQvv4gnA07AfZiI
 WuMSjS6enMOY4BMXqW4FgIjyeIta6r8o1q+kiOCiTo9r5ZCiDMDHJVnu1mOV189YESSx
 pQ4bU5W+6ghPvBaX+fmhUn5Bcgjiv1VcpV83ZQ9trXXnIJEXL//h6uKHAzSTLvYD7BHf
 QshNOk+aJ4wDNx6iA7bX6Sav39sxKf9WkEyEV2zDzfXwDL5yAdW1Ql6mqS3o7UIFXO47
 dDMJFrO9hSfmCJLZhRmZgoCTH0eX4lvo9AqHP4xX6pQgG/VzD5/lsWkvQsLDZQpAJOX/ Rg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1c32mppg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:52:01 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415HJjKv038547;
	Mon, 5 Feb 2024 17:52:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u2ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:52:00 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkj4033449;
	Mon, 5 Feb 2024 17:52:00 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-9;
	Mon, 05 Feb 2024 17:51:59 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 8/8] doc: kernel_{abi,feat}.py: warn about missing directory
Date: Mon,  5 Feb 2024 18:51:33 +0100
Message-Id: <20240205175133.774271-9-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: JX6W1aBjwfNisBotrFlaQOR3_XUe0G7n
X-Proofpoint-ORIG-GUID: JX6W1aBjwfNisBotrFlaQOR3_XUe0G7n

The underlying perl script get_feat.pl does not complain when you pass
nonexistent directories, and just produces empty/useless output:

    $ scripts/get_feat.pl rest --enable-fname --dir asdfasdf --arch arm64
    ====================================
    Feature status on arm64 architecture
    ====================================

    =========  =======  =======  ======  ===========
    Subsystem  Feature  Kconfig  Status  Description
    =========  =======  =======  ======  ===========
    =========  =======  =======  ======  ===========

Let's add an early sanity check and a warning if the check fails.

get_abi.pl doesn't have exactly the same issue as it actually produces
an error, but we can add the same check for consistency.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kernel_abi.py  | 7 ++++++-
 Documentation/sphinx/kernel_feat.py | 8 ++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 9eb7282cc941..52af2750e634 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -79,11 +79,16 @@ class KernelCmd(Directive):
 
         srctree = os.path.abspath(os.environ["srctree"])
 
+        dir_path = os.path.join(srctree, 'Documentation', self.arguments[0])
+        if not os.path.exists(dir_path):
+            logger.warning("path does not exist: '%s'", dir_path,
+                           location=(self.state.document.current_source, self.lineno))
+
         args = [
             os.path.join(srctree, 'scripts/get_abi.pl'),
             'rest',
             '--enable-lineno',
-            '--dir', os.path.join(srctree, 'Documentation', self.arguments[0]),
+            '--dir', dir_path,
         ]
 
         if 'rst' in self.options:
diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index f1c9e4a54964..e0bc6e03579c 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -79,12 +79,16 @@ class KernelFeat(Directive):
 
         srctree = os.path.abspath(os.environ["srctree"])
 
+        dir_path = os.path.join(srctree, 'Documentation', self.arguments[0])
+        if not os.path.exists(dir_path):
+            logger.warning("path does not exist: '%s'", dir_path,
+                           location=(self.state.document.current_source, self.lineno))
+
         args = [
             os.path.join(srctree, 'scripts/get_feat.pl'),
             'rest',
             '--enable-fname',
-            '--dir',
-            os.path.join(srctree, 'Documentation', self.arguments[0]),
+            '--dir', dir_path,
         ]
 
         if len(self.arguments) > 1:
-- 
2.34.1

