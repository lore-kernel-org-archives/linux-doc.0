Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9E3A3E86;
	Thu,  9 Apr 2026 23:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778154; cv=none; b=FQt7xXXIK5KuQ+SIjCl2gAD4tF8HX9kVwMQTWbKQAiYJ2c1uQ6aUok3nKh53xO6WczxqbGk8+92Lao0ZmiHRjMl3+4CDssv5BJKQOn+gBHFnB1+qkTFTcresP7yPQBeWSftHiMf9/t4vcLjBkrK3ohO185+77m8iUxJjCn5K77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778154; c=relaxed/simple;
	bh=6LE2SGDLrIT6nyl2YIlVKPZAxnHIfRa9brtD2uPo804=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XReWjlNPjv7Rwe0/j1O7jcXbySIBb2DNEFZL2KgkbDUdy49h9Bcb18grley6MGWyNZf5dW06JfCWJwZvzPazK7TksceoMzakR+caV/lV2OLuscllO3XXDImr8548yxNvwjc9L44Bs4hcZCCBzHmVZWJ+DA6Nt0KKZ/eq1ULI3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WNjqUa3/; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WNjqUa3/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JtbhH2413294;
	Thu, 9 Apr 2026 23:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=vAAQPrcpDFpgnoOmQKyoghYQbOEr5
	qFXKnrLuyiCEzs=; b=WNjqUa3/q48Q4vZVtx1vWH8dMFR2cgv7pl8j1Z6gQLXyG
	tfiPBbaxn0GpISNpnlbN961nhBCl0AyQ6wd6ymuCTcW0QXzp0OZW1B5i1VBf54Kf
	EFa8wue0MOk/3HSktrzkiU6v2benzr6AKBW4MNZjbW/otudg4+UHehNIaKiOOIqr
	RXiI1bPgrZSJT9+dOFQ0M3lhIf+g4k2Zt5Q/1qrg0nkukZihRF7c2QkyDekTuKiW
	vHYaGSYgt82uRVIIYn2werEUBVOzxiwNEG9gxk4oXwwiFSP9BwmauUrGEyYiYOLg
	ebo2vuN7SkdK4afWTfHer03jBc/EcQbQozNhPKxRg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqa8rts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:42:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 639LPAFW040031;
	Thu, 9 Apr 2026 23:42:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dcmnbj4q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:42:07 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 639Ng6Yl038323;
	Thu, 9 Apr 2026 23:42:06 GMT
Received: from brm-x62-16.us.oracle.com (brm-x62-16.us.oracle.com [10.80.150.37])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4dcmnbj4pp-1;
	Thu, 09 Apr 2026 23:42:06 +0000
From: Jane Chu <jane.chu@oracle.com>
To: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
        osalvador@suse.de
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@kernel.org,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
        skhan@linuxfoundation.org, hughd@google.com,
        baolin.wang@linux.alibaba.com, peterx@redhat.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] hugetlb: normalize exported interfaces to use base-page indices 
Date: Thu,  9 Apr 2026 17:41:51 -0600
Message-ID: <20260409234158.837786-1-jane.chu@oracle.com>
X-Mailer: git-send-email 2.43.5
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
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=549
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090218
X-Proofpoint-GUID: XsAdDgLcvcNrOLMiD3qE601d0TB1ZPv4
X-Proofpoint-ORIG-GUID: XsAdDgLcvcNrOLMiD3qE601d0TB1ZPv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIxOSBTYWx0ZWRfXx7eMuPBJMNUL
 mvHDvmxXTaOkc/WNuMscWFKeaQyKyvKIcurfTF7zNgHE0gGjt93KJ/yTvdK7xB2/CuHh3Sn2yB0
 DfmfmFQiQWKYGTokdW+mKm/TP2ohK0idPIrgiNT1W9LDVYwDSYAlZVS9kNMYREzQTf0z6RoVboG
 xUnbLDNpDge9EhH5ryoCJuXIkRHwxdnEkE5Mw6fhQqPxHJhbeD6xVL+JdqCVIDYH8/eGJ2UNk/S
 VPfS/DncccJlG3UQc7M1YP8/c3hyAef+oKc5dM33bh+xUSLA6iRUSZ7pZjtfvrV5HVPFWEX+O0R
 n9nW0lPByP91IhJpkkzlpU5u1/1WHcQGa6KD+MXIpHHw/cBHPOt82fKbskHrOjLwYdINrW0/etu
 Tb4bcBnnh0gSDvYkyfiUIG0fvIi1sRwQSGrnbBmdM7xEgevtlZ8S9HNhzqgGsBN0oB3wnjTwyza
 FjtrchqMtBWaN4EyfAA==
X-Authority-Analysis: v=2.4 cv=DLS/JSNb c=1 sm=1 tr=0 ts=69d8394f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8 a=wwRk9dV_MJEkmqr9MRkA:9

This series stems from a discussion with David. [1]
The series makes a small cleanup to a few hugetlb interfaces used
outside the subsystem by standardizing them on base-page indices.
Hopefully this makes the interface semantics a bit more coherent with
the rest of mm, while the internal hugetlb code continue to use hugepage
indices where that remains the more natural fit.

It is based off mm-stable, 3/30/2026, b2c31180b9d6.

[1] https://lore.kernel.org/linux-mm/9ec9edd1-0f4c-4da2-ae78-0e7b251a9e25@kernel.org/

Jane Chu (6):
  hugetlb: open-code hugetlb folio lookup index conversion
  hugetlb: remove the hugetlb_linear_page_index() helper
  hugetlb: make hugetlb_fault_mutex_hash() take PAGE_SIZE index
  hugetlb: drop vma_hugecache_offset() in favor of linear_page_index()
  hugetlb: make hugetlb_add_to_page_cache() use PAGE_SIZE-based index
  hugetlb: pass hugetlb reservation ranges in base-page indices

 Documentation/mm/hugetlbfs_reserv.rst |  12 +--
 fs/hugetlbfs/inode.c                  |  60 +++++++-------
 include/linux/hugetlb.h               |  31 +------
 mm/hugetlb.c                          | 112 ++++++++++++++------------
 mm/memfd.c                            |  18 +++--
 mm/userfaultfd.c                      |   6 +-
 6 files changed, 109 insertions(+), 130 deletions(-)

-- 
2.43.5

