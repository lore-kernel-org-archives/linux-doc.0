Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4213A3A4507;
	Thu,  9 Apr 2026 23:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778161; cv=none; b=BbJt53jP6DOzMI8WPpRTocMIwWmR2daSJU3bEXery/8ROHdNeY7br7tk9FC8Fp/9vQRouRO2IzrBvTQTrP2QL384+oGykYBDeDyB06Wd0nV20hNAJXWv9Z2bg5L1Hr93f2hVBBCo5oTpv3vwdk7wQ/lMjvz6JckEq5NzyMo8Tlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778161; c=relaxed/simple;
	bh=i4hsM5bBkaWWTgsi1i+ZiDlxli70hRvaMpjP8NPi9hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caL6ebFIq9U4m7xBcTzgozxa9H3oB1Nk7TYkhQp/2x/yVgIFny4EVp06p8alO4WEP8WQpAiC2b/RX5V0eQQMyLrMC0g8LF9pG/xtetJWDwhUFrdq+nbSfPfj2PfDgvlUEPBjghh+XUlnGL1UQmxmPMA6BSqtxKeiNUrYmmG39is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AoWHHsun; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AoWHHsun"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JtbOH2622470;
	Thu, 9 Apr 2026 23:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=8bSdH
	7wFkyRhLWs186r5SR78aocqTaV/GzyoUPrXLjk=; b=AoWHHsun5ZXP6mgIdevJ2
	/x4Vay6xnXivohkycC9rUla+VY+cq6FcWLxpN5WhF/hP5qSK0dmQgzWYFM2Rm0d9
	Ri34VQknDfBVT6+me4aQPauPBs86CIjY+VsZi7F7GsmOonXlG+YbWzsd4artgYX9
	YzFMLVW9TzcnkjrLVFt4cU4+QhUQD8rs3aunRIOGiZ2jLIggn7aZ/fr9z95Yj18Y
	kf8fimjc+BHyP1DTlrC+WqWxtwxawwFKyyfctdQgKoacHfPyrqAE7ijVm71W5E9h
	69uhGlmcAyudylJms553npqpGKHVX5S+0p0UaPCdPZa7tk8hI27Y+lEwpo4N01WF
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqarraj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:42:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 639MIPEW040165;
	Thu, 9 Apr 2026 23:42:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmnbj4s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:42:12 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 639Ng6Yp038323;
	Thu, 9 Apr 2026 23:42:11 GMT
Received: from brm-x62-16.us.oracle.com (brm-x62-16.us.oracle.com [10.80.150.37])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4dcmnbj4pp-3;
	Thu, 09 Apr 2026 23:42:11 +0000
From: Jane Chu <jane.chu@oracle.com>
To: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
        osalvador@suse.de
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@kernel.org,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
        skhan@linuxfoundation.org, hughd@google.com,
        baolin.wang@linux.alibaba.com, peterx@redhat.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] hugetlb: remove the hugetlb_linear_page_index() helper
Date: Thu,  9 Apr 2026 17:41:53 -0600
Message-ID: <20260409234158.837786-3-jane.chu@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260409234158.837786-1-jane.chu@oracle.com>
References: <20260409234158.837786-1-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090218
X-Proofpoint-ORIG-GUID: YxPnX_y4GOJbFM-UZwzBQo-qk-_L2LKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIxOSBTYWx0ZWRfXw/6/hbDq4Zg+
 Hhgqe7uyoifxrd/JdXy93ZlJMmAxTYK3TXWPB5TrGjzSjyDOmKjoXInr9UkzVV13UIXh9pt/jMU
 7lTW+/+/fJ/qdtonakcpijzdOO7Dv05dLF18pB2PXo2ST2653U5VUqAzUAyIL2Osn2udnjk6Kg6
 XKZoeMhRwyZ7PjE8RXpbNV3YRa8F9Ly06ebv7jhYu0ZnzTV5j3dRX/ZB4DNhZOfEFjerjhwWwu/
 s8UxibS59sSyqinlveAP4CcJ+T0Oa8urLxBfQ2ymdFRWJAtiyLyQn9qszSowdegI7zsn8e7pAgG
 5sa/h2mFVTZiIFs9UObkVUIpJUqvwQ/JKl2txLr3ZQwMEd6LF21cCEmnYTx0jQQ1eubeiBc8F+d
 ssEwpXhfUgxDkJxlXHLLJozyQZZx5vV0BKwBzX32OLTbfnySkr2kANw6+vhU5Uitw7caflwi/Kl
 viqG6qBkuTiOUMiDZgg==
X-Authority-Analysis: v=2.4 cv=AsTeGu9P c=1 sm=1 tr=0 ts=69d83955 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=aC9wH1do4BV7vRM6I0AA:9
X-Proofpoint-GUID: YxPnX_y4GOJbFM-UZwzBQo-qk-_L2LKM

hugetlb_linear_page_index() is just linear_page_index() converted from
base-page units to hugetlb page units.

Open-code that conversion at its remaining call site in
mfill_atomic_hugetlb() and drop the helper.

No functional change intended.

Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 include/linux/hugetlb.h | 17 -----------------
 mm/userfaultfd.c        |  3 ++-
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index c64c6e5e50f5..71691a2b6855 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -792,23 +792,6 @@ static inline unsigned huge_page_shift(struct hstate *h)
 	return h->order + PAGE_SHIFT;
 }
 
-/**
- * hugetlb_linear_page_index() - linear_page_index() but in hugetlb
- *				 page size granularity.
- * @vma: the hugetlb VMA
- * @address: the virtual address within the VMA
- *
- * Return: the page offset within the mapping in huge page units.
- */
-static inline pgoff_t hugetlb_linear_page_index(struct vm_area_struct *vma,
-		unsigned long address)
-{
-	struct hstate *h = hstate_vma(vma);
-
-	return ((address - vma->vm_start) >> huge_page_shift(h)) +
-		(vma->vm_pgoff >> huge_page_order(h));
-}
-
 static inline bool order_is_gigantic(unsigned int order)
 {
 	return order > MAX_PAGE_ORDER;
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 2c565c7134b6..c053aa4389b6 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -573,7 +573,8 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		 * in the case of shared pmds.  fault mutex prevents
 		 * races with other faulting threads.
 		 */
-		idx = hugetlb_linear_page_index(dst_vma, dst_addr);
+		idx = linear_page_index(dst_vma, dst_addr);
+		idx >>= huge_page_order(hstate_vma(dst_vma));
 		mapping = dst_vma->vm_file->f_mapping;
 		hash = hugetlb_fault_mutex_hash(mapping, idx);
 		mutex_lock(&hugetlb_fault_mutex_table[hash]);
-- 
2.43.5

