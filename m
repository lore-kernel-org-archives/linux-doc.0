Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722B1428F
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oCcOtXyv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40B9iGNd002764;
	Thu, 11 Jan 2024 09:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=RklNWNueSwEoK9M1PrZpZl6IOU5DuUgcdOQaZ1pmGMw=;
 b=oCcOtXyvgdbWqtfoEOddEcbe6qkOqdSRxP2ZCvQnM6NPaRYuKnhB4fwmPeF5afCRRxx/
 oasrFPDXDNWmt3MvFg4dcmxipqJtYDrZLdOVjaV9LWu5kSOclWYV/WZRHblImm5FwZ6M
 ZDXCIisyP2Wx/2/kIuaJTuAQVBmvDMQozpNSD7+H/cwQ2PLf04AaSKlyYmO8+JMCp/54
 wNUSiRAR4ZQRUE60zecwCAbInOsKCENKd/dphRzxqxC0sREKyCQC8IWjrtfG1fRjjVAs
 bn1phdv2A9Ao/Wld1Q2atnES1To2EaKOPov71uYewPQzIpeEWQt4VUbGu00b+OakWG3n /g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vjcyh03pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 09:48:56 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40B8Z4qh006773;
	Thu, 11 Jan 2024 09:48:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfur6paej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 09:48:54 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40B9i15i022240;
	Thu, 11 Jan 2024 09:48:54 GMT
Received: from localhost.localdomain (dhcp-10-175-35-100.vpn.oracle.com [10.175.35.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3vfur6pa5r-1;
	Thu, 11 Jan 2024 09:48:54 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [RFC PATCH] docs: add blurb about target audience to maintainer-profile
Date: Thu, 11 Jan 2024 10:48:38 +0100
Message-Id: <20240111094838.3695697-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_04,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401110079
X-Proofpoint-GUID: s5zgNQw909HYNB1TnB6bfa3Tv5qYMQ7F
X-Proofpoint-ORIG-GUID: s5zgNQw909HYNB1TnB6bfa3Tv5qYMQ7F

It's good to be clear about who the intended target audience for any
given piece of documentation is, as this will help us put new text in
the correct place. Let's encourage submitters to state it explicitly
rather than relying on where they placed it in the directory hierarchy
as there isn't necessarily a one-to-one correspondence between them.

Target audience: documentation contributors and reviewers.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/doc-guide/maintainer-profile.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/doc-guide/maintainer-profile.rst b/Documentation/doc-guide/maintainer-profile.rst
index 755d39f0d407..db3636d0d71d 100644
--- a/Documentation/doc-guide/maintainer-profile.rst
+++ b/Documentation/doc-guide/maintainer-profile.rst
@@ -27,6 +27,13 @@ documentation and ensure that no new errors or warnings have been
 introduced.  Generating HTML documents and looking at the result will help
 to avoid unsightly misunderstandings about how things will be rendered.
 
+All new documentation (including additions to existing documents) should
+ideally justify who the intended target audience is somewhere in the
+changelog; this way, we ensure that the documentation ends up in the correct
+place.  Some possible categories are: kernel developers (experts or
+beginners), userspace programmers, end users and/or system administrators,
+and distributors.
+
 Key cycle dates
 ---------------
 
-- 
2.34.1

