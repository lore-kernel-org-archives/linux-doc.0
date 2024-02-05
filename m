Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF26F45946
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155522; cv=none; b=GvyG+lbDo1t5CNUstv+IfW6udQEXDqUARU1nJ1935a9rTxJOBWBJC3I6a9UomjWNbhOddg8qVOjVzXi2KlXLRUDvfMxIcUcCgPYsm5s+j7RdwpmTDlcdeqRAbYbQNriztSzzX51Wnpi8/UIl1NRthxEq72WbX5jij1IrE6gluM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155522; c=relaxed/simple;
	bh=rHMHFrrOWy8lMHqf7CFX106tCIIRDwW4LBpC1BWXQ3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4Quc+vjoxPS4sJ7tW++Bnn7IiQiDJJDB9SYN7sPDJGJp6MRRuCZ6S7ncbEUujg4gZ8BGgkpiOBDfZTsmju8XS+hTiAAw6J2Ge2xecFRRC6tnyf08+ch7vbsGBkgRJa4rUGSjDc/xWgzX9FVINWoqPqws/vfLZFtpgEG8xDYpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T9irTiFM; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T9irTiFM"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DWLdx011018;
	Mon, 5 Feb 2024 17:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=DD1ChG/KE+VaxrL0MLkBx8XGW7foPAs1bP/r41cj+3E=;
 b=T9irTiFMfdTKsqi7q0CYCP+MdLVbinA/zsynQAFxJjQtj04wuj79R++OMdJYhYEmizUx
 Xmu5R7SX2v3iIKh89pzhL7WL7H6SDeYA8fzSsMkkm2drmNQ0rNyLOJqBSxTFQtsKloG9
 AiTuqzQsujX/vioJ+oT2vGrDdlDkYOfYnuHvhXJda2/SWd1NNe6VGBjhhD0zpKBP0tFG
 Fa9oG6tNqu4MRye6FSbqzLFNFkrHC0K4EN4hA6wZvXmPvQddSDuuC60rAtBqyvO8araf
 nGBuNYP7tkW55Jlh7coENg7IpL7xGUJ8cCrQ+6al7qBA8Ec6aGvkKz/vVLzZA5DBnWjU OQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1dcbchtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:52 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415HO5Im038383;
	Mon, 5 Feb 2024 17:51:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u239-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:50 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkiq033449;
	Mon, 5 Feb 2024 17:51:50 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-3;
	Mon, 05 Feb 2024 17:51:50 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 2/8] docs: kernel_{abi,feat}.py: use doc.current_source
Date: Mon,  5 Feb 2024 18:51:27 +0100
Message-Id: <20240205175133.774271-3-vegard.nossum@oracle.com>
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
 mlxlogscore=768 bulkscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050134
X-Proofpoint-GUID: Ft6bUep0XOw7j2A0Zaiu5Sbjr1ywBpI-
X-Proofpoint-ORIG-GUID: Ft6bUep0XOw7j2A0Zaiu5Sbjr1ywBpI-

It probably doesn't matter a whole lot what we actually pass here,
but the .rst being processed seems most appropriate to me.

This presumably gets used by Shpinx to record/report where each line
of .rst source originates.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/kernel_abi.py  | 2 +-
 Documentation/sphinx/kernel_feat.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 5911bd0d7965..288f26097569 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -88,7 +88,7 @@ class KernelCmd(Directive):
             args.append('--rst-source')
 
         lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
-        nodeList = self.nestedParse(lines, self.arguments[0])
+        nodeList = self.nestedParse(lines, doc.current_source)
         return nodeList
 
     def nestedParse(self, lines, fname):
diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index 03ace5f01b5c..3493621d1a4e 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -109,7 +109,7 @@ class KernelFeat(Directive):
             else:
                 out_lines += line + "\n"
 
-        nodeList = self.nestedParse(out_lines, self.arguments[0])
+        nodeList = self.nestedParse(out_lines, doc.current_source)
         return nodeList
 
     def nestedParse(self, lines, fname):
-- 
2.34.1

