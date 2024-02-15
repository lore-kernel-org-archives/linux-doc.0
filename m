Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A5131736
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004937; cv=none; b=pGM712A6biKkVruauuPIPSIB1nCBGw3NKmc1ZvCayTWcnmqQONVxNx2gbdT+vY+nICuQqiPG0B8zonGMG0woGnWB3BTUixVtmeZKidaG/ci+cX7+/zQ1eFTDSFh+XPXqCdqr+0alferAQvWKqYoOVGGOdT/7RFN1VNznDWdzyBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004937; c=relaxed/simple;
	bh=2rqBj9d4SYrz3APuPjKugv8jIOnEfGvmAftel3BVTZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l//ssxkR9OIbRGbPrVrPmiRFtQy5oLwr79CDtNzqLcIJttJNNmilkELGzCbW479l0/8Ws/SBzYoMKfpLcw0mRu5iFYjXNTWARY6ZHe51EOelDvsFL6sW6dxhhQath5G+4XxmsYVR0DdxtaQUsz0Il4ceLpgDLYttYI3UeAqOZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KpZAvF6u; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KpZAvF6u"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDB4PR017908;
	Thu, 15 Feb 2024 13:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=t/bpb57UCPU4e82uzUNc5WdclO4w+re1xYdGIn1H8OI=;
 b=KpZAvF6u+wSQdW6xYGqhAbqql4zFoExmiwu1UUsVlKEXheGZ/Hke+Uu2951B2GBEULqJ
 vrFvDLNJXDYxAS3dEcbFdmH85cb3zQVvvibDXJVv9TM0VEAYRXX454MTs52ZFbfAS1ns
 YReEMGW3Zd5Rs0Ye93aryuZN68qC1Vwwa75mY7QVZCvkh++uZMXxc+0J2pNdIDMIfad8
 mq0+ljeZBuZgNbK7WDt875Q52kfv3Y8GEt9c4XaHuEXLPn+Ao+CzQHj08+k5ltt8snGu
 QwTA+0LhmybA+yZ/IPumtiNCir4d4NydSF6K5QBhK3MjSuzyOtVyY+vSY1MIdhw88iQx Zw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w91f02edw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:51 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDaZWs000865;
	Thu, 15 Feb 2024 13:48:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaj26v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:50 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDmgl8034749;
	Thu, 15 Feb 2024 13:48:49 GMT
Received: from localhost.localdomain (dhcp-10-175-53-231.vpn.oracle.com [10.175.53.231])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykaj1xg-6;
	Thu, 15 Feb 2024 13:48:49 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 5/5] doc: kerneldoc.py: fix indentation
Date: Thu, 15 Feb 2024 14:48:28 +0100
Message-Id: <20240215134828.1277109-6-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215134828.1277109-1-vegard.nossum@oracle.com>
References: <20240215134828.1277109-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150111
X-Proofpoint-ORIG-GUID: _GxQnA_ur0LKuqhHGclZmO6jqawrxi4n
X-Proofpoint-GUID: _GxQnA_ur0LKuqhHGclZmO6jqawrxi4n

kerneldoc.py is mostly indented with 4 spaces (like PEP8 suggests);
replace the last remaining tabs for consistency.

No functional change.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kerneldoc.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 7acf09963daa..ec1ddfff1863 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -61,9 +61,9 @@ class KernelDocDirective(Directive):
         env = self.state.document.settings.env
         cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
 
-	# Pass the version string to kernel-doc, as it needs to use a different
-	# dialect, depending what the C domain supports for each specific
-	# Sphinx versions
+        # Pass the version string to kernel-doc, as it needs to use a different
+        # dialect, depending what the C domain supports for each specific
+        # Sphinx versions
         cmd += ['-sphinx-version', sphinx.__version__]
 
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
-- 
2.34.1

