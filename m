Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E530DD1B;
	Mon,  2 Mar 2026 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482245; cv=none; b=R09LqyxxXWrzNYPrqRrOb5pjxPvQKf4gS+lKmHfgtU+HKGUNzosBczaGteLhxgwyKtCWimw8D7cKY03KO0bkteBouZkw2JSRRcg0R9Ycgf78iCGv/PPv8VyN15mqdVduuzyDqxWkjJYL/+xvLedA7uxVA+/GNOPeJSP+WRAyk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482245; c=relaxed/simple;
	bh=1o+RIUPN5P5P/51Qwr/+zw4ZvNWtltjcG0+jUw5RTow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7xSMF4eUusM+FNkvuA+YosHmm9MM74kvBi7OIO3RTeaU7v+aJL75YMzt6NB/HZ9nfF79Q3HbgIAwMDtQyKWBubkrhc0kNWQLWXPVzEmCgDBe2jdANUG7RiSxjC/ELsx1ljZ+UPUBXoLSYP1SGrQpC1m2QdOjmRqOEX2vhTSBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FXTMu1kA; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FXTMu1kA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IHmIF1634555;
	Mon, 2 Mar 2026 20:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=YXHDmRAJblDSr/w50pZwQvB4W3B++
	p0nNeeyprSaq/8=; b=FXTMu1kAfZ4RicZOUMGvxNl8da7oOgR8DbsDjhUPkNbvv
	yvYGASonEYFZbK4yJ0mY4cCcNiZeKFxncdobuT5V6jhuSFM8VbR+6du0UPFNawSP
	aaHLc5ZCiWoqwZCsgNTUzKgaWR8ZXGZQofPWHn5gE/HAM+zZ5idSUiVcdz1R15g2
	gIW0/pYCdKzGyWkSdmB+blF22zVodwQVP4Nb7TvtShkWb8sySy78nnWqFiFCSKuR
	A7xUKa7afzhSeWyG/FyKP5iQEtWuoVYQHDIALv/B9necioBoHjxvsm4ZHMi+z5HL
	jn2Hnsssj1JOsLG+I5WSP4La5A12EvyLMgtT6NqoA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cnfpj062d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 20:10:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 622I983t029717;
	Mon, 2 Mar 2026 20:10:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt9e0en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 20:10:23 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 622KAM7F009395;
	Mon, 2 Mar 2026 20:10:22 GMT
Received: from brm-x62-16.us.oracle.com (brm-x62-16.us.oracle.com [10.80.150.37])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ckpt9e0db-1;
	Mon, 02 Mar 2026 20:10:22 +0000
From: Jane Chu <jane.chu@oracle.com>
To: akpm@linux-foundation.org
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
        lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@kernel.org,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        skhan@linuxfoundation.org, corbet@lwn.net, hillf.zj@alibaba-inc.com,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fix a hugetlbfs reservation statement
Date: Mon,  2 Mar 2026 13:10:15 -0700
Message-ID: <20260302201015.1824798-1-jane.chu@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_04,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603020154
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE1NSBTYWx0ZWRfX/aRjviUkUNsS
 ubwvcAFlejuDW0gxuCKMqKHXv6qHw60BP3pyimBglmlcgu8qnPolrB4WKtuoiEunG1RPBJ+lBWn
 kbCunwB1Xq4niYZ+fnqNRw+aoEk2QYduNuoMuVvplWJWapvD4ekDdGAF5vxkx3HGWKcWfAK6+2u
 AC7K0cZ6Bjfp7uRMtNan49sNCz+A13qXnO463vZGFs5tPH85GnN07kXm2QxJLOPt0vztB1MvTIj
 TABxTkltFz+bkKYa0MgLV3y+OV9CGkzMA6FYYuNieNkCO525yF2pB1xCCdyo4Jb0BZYWEUZaDU9
 Bzkz1RQQ5I7jida80mIg+oOylmCtH88JIjIWT4NLy0LV6uXnjmmbIqxX7aPObrviG2Lef/afxKa
 cEUf+qzNLr/a8JvKaVuPuSxJ0O2QL+JMrQ3n5w/zgAEEG/VU6koBAfjXB8+4jVwu66mxUvaL34P
 XTfhiSNxtVfThD68tHQ==
X-Proofpoint-GUID: MxYdjxIQBqfr7kRa_UJU7v7ptt2NEbdO
X-Proofpoint-ORIG-GUID: MxYdjxIQBqfr7kRa_UJU7v7ptt2NEbdO
X-Authority-Analysis: v=2.4 cv=JPM2csKb c=1 sm=1 tr=0 ts=69a5eeb0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=A5wE46Q82j-DBPHovb4A:9
 a=FWFfLhjteEdX4JCrYqk8:22

Documentation/mm/hugetlbfs_reserv.rst has
	if (resv_needed <= (resv_huge_pages - free_huge_pages))
		resv_huge_pages += resv_needed;
which describes this code in gather_surplus_pages()
	needed = (h->resv_huge_pages + delta) - h->free_huge_pages;
	if (needed <= 0) {
		h->resv_huge_pages += delta;
		return 0;
	}
which means if there are enough free hugepages to account for the new
reservation, simply update the global reservation count without
further action.

But the description is backwards, it should be
	if (resv_needed <= (free_huge_pages - resv_huge_pages))
instead.

Fixes: 70bc0dc578b3f ("Documentation: vm, add hugetlbfs reservation overview")
Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 Documentation/mm/hugetlbfs_reserv.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/hugetlbfs_reserv.rst b/Documentation/mm/hugetlbfs_reserv.rst
index 4914fbf07966..a49115db18c7 100644
--- a/Documentation/mm/hugetlbfs_reserv.rst
+++ b/Documentation/mm/hugetlbfs_reserv.rst
@@ -155,7 +155,7 @@ are enough free huge pages to accommodate the reservation.  If there are,
 the global reservation count resv_huge_pages is adjusted something like the
 following::
 
-	if (resv_needed <= (resv_huge_pages - free_huge_pages))
+	if (resv_needed <= (free_huge_pages - resv_huge_pages)
 		resv_huge_pages += resv_needed;
 
 Note that the global lock hugetlb_lock is held when checking and adjusting
-- 
2.43.5

