Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEAF10791
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gXC58aNG"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96215E5;
	Sun, 22 Oct 2023 11:56:54 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39MIqJiG020178;
	Sun, 22 Oct 2023 18:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=I106z5ot45c65W56xsSM+3DAWUrZ35IO55AjQVQ3Hfs=;
 b=gXC58aNGjDHUGmaMjmD7i88xR3VTB/UFnpLMxyKecLq3HPXrIDog8ozEumIrvC/ZRSxB
 efexBG8bZyjywPKWfw4ASEl5JGVIRPK/Ye3MNnA6gzoC7gNWnfW8gJRcimMgViBtRH6k
 Jo8c2jCqpsd7/ioDnfXOTBdgGlfYozZfzr5sBosRZzUVjvPzKAk8ucJrtRqQtIlmp+tP
 bcvHY5Y7LcXibgdz1Q061jD1OiKSxPHbDfSJpl1cZADJJOZP/WrBMJvjcSOv3LSJgoNA
 DmbTFxiblqeekP3GWo7jM9SY615pz+8V6GXLxtwD8WYtOc/d7QPorF6TmR6hd2YDFgDr lw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv5e31ucb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 18:56:28 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39MHjUnk034611;
	Sun, 22 Oct 2023 18:56:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tv53378gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 18:56:27 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39MIuQHY031009;
	Sun, 22 Oct 2023 18:56:26 GMT
Received: from localhost.localdomain (dhcp-10-175-52-84.vpn.oracle.com [10.175.52.84])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tv53378ga-1;
	Sun, 22 Oct 2023 18:56:26 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Matthew Wilcox <willy@infradead.org>, Ira Weiny <ira.weiny@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Wu XiangCheng <bobwxc@email.cn>
Subject: [PATCH] mm: hugetlb_vmemmap: fix reference to nonexistent file
Date: Sun, 22 Oct 2023 20:56:19 +0200
Message-Id: <20231022185619.919397-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-22_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310220175
X-Proofpoint-GUID: hudc3pOUpqGQ3ogp1RYOPEjCJ-4MVBhl
X-Proofpoint-ORIG-GUID: hudc3pOUpqGQ3ogp1RYOPEjCJ-4MVBhl

The directory this file is in was renamed but the reference didn't
get updated. Fix it.

Fixes: ee65728e103b ("docs: rename Documentation/vm to Documentation/mm")
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Wu XiangCheng <bobwxc@email.cn>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 mm/hugetlb_vmemmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 25bd0e002431..b8fc23c8763f 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -16,7 +16,7 @@ void hugetlb_vmemmap_optimize(const struct hstate *h, struct page *head);
 
 /*
  * Reserve one vmemmap page, all vmemmap addresses are mapped to it. See
- * Documentation/vm/vmemmap_dedup.rst.
+ * Documentation/mm/vmemmap_dedup.rst.
  */
 #define HUGETLB_VMEMMAP_RESERVE_SIZE	PAGE_SIZE
 
-- 
2.34.1

