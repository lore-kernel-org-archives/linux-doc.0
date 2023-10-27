Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944414013
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="3OKBa59j"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AE41AC;
	Fri, 27 Oct 2023 01:18:59 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5iMtF005798;
	Fri, 27 Oct 2023 08:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=s1EbLkYdolk3yWS71XSb9v+3TTnjVXp+R3q9NNNtvvQ=;
 b=3OKBa59j+xlak04GwN1NyD43BlEjLWdsE2WlpECHTGajC/Q6itdC0XfU2wpFqSWlARsQ
 SXvwD/9G+Bg8fFZGLtcELqUyTD77+c6GcuE+1yR+mIMf7hAiZL2J5iIDMsrKXVZHtN0W
 MPtT4ousFNqY6OfdhjkFp/9a9F1W3xnrVfcWTgW9Edp4VYedNO46BEW2mJYnXj1ToZnj
 LDqBvho97u867V5fS1NDTTEAELkNpcnWXzjl8x3lTFsJyDukWwXwyOPvllXSkrXKUIZ/
 BWtSIWxD9RB3eXCjFHoc5oR+H2FWq9oxDTVOR5Geq0TPMBT87dXXix4lMIQb1lizdd3p 6g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tywtt0ymb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:51 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5u6Uk009204;
	Fri, 27 Oct 2023 08:18:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjeb8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:50 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9P028975;
	Fri, 27 Oct 2023 08:18:49 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-4;
	Fri, 27 Oct 2023 08:18:49 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH RFC 03/11] media: admin-guide: properly format ToC heading
Date: Fri, 27 Oct 2023 10:18:22 +0200
Message-Id: <20231027081830.195056-4-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027081830.195056-1-vegard.nossum@oracle.com>
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_06,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270071
X-Proofpoint-GUID: 5-XATpbd4sc33KQxbXKDaOC0NnJ8AWkl
X-Proofpoint-ORIG-GUID: 5-XATpbd4sc33KQxbXKDaOC0NnJ8AWkl

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/admin-guide/media/index.rst | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 43f4a292b245..be7e0e4482ca 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -20,16 +20,8 @@ Documentation/driver-api/media/index.rst
   - for driver development information and Kernel APIs used by
     media devices;
 
-The media subsystem
-===================
-
-.. only:: html
-
-    .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+	:caption: Table of Contents
 	:maxdepth: 2
 	:numbered:
 
-- 
2.34.1

