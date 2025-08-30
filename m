Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1C10F2
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756573704; cv=none; b=bUt6Aj1dnKf7WvrNHejrCdRcT1FwEWRbdAi/1qB4O1+DIoQCb1zn1ZsQEll7+W+vPjjTH51K6vPAQQKjkftDl2w8oOm5DBcqXULSb+2/Wl62WOadRJ8Q4OdSTH81x+f10WLDhQeEWmGZ7vaptNx1ZmTQqo3vakB7ePABcndcqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756573704; c=relaxed/simple;
	bh=SwnNZ8jBcz4m4KsvL/tV5YH6L1PVzvzsq5eFjxp1G4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DDcE1pRk3OHJtpQcVp611rHZAmq/mVqhJtR/67DheHsEmhRQjbBfNKtul51gi38iXt+dO2egWtQP9jxwupsqhtHazQ3g0ukConR23wbmfXk235gdsihOPhmjDsu1zsEfMlD3nz+7mxBH7lTyF64Vc4eep8sBZAZj3Xc/eAN9els=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BjP9XSQL; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BjP9XSQL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57UCfnh5023937;
	Sat, 30 Aug 2025 17:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=gC/kboGsT0OoW+WO
	D2RbfXRpSWgnpAu0BFDFHX9kYUo=; b=BjP9XSQLTbJY8Pem7s10Hx32RiwVaXfx
	Yj4m1d32NCaHo3ZqdBnv+gg5c9TbSC14TxYb2AAEavAnMRkgZ7Eaa4M8HF/mfRlJ
	3IugvD4saGsVqsODDKQii/xSZ9a5DbPhg1oDIcM05CQuLxvANUQAYYfphgnU7IE5
	Rj9BqFQjNAsaZUO554bZK8Hi6xUUbVKqHGsnXu4v05W6jGcSN/yrNt0eKdnWxXYU
	GcVIjc5yLelbQdjMMwSyR8AhLE7gO66SS/G8nGMgz3c2nbCJpdU/EzoGEtm6GbYH
	zdsqyEpIwo7hv1mHu0zU3/Ys1B2RENp/CXfZnGlBK7I9VUvwF9zYog==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ussygdcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 17:08:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57UEJbTO032311;
	Sat, 30 Aug 2025 17:08:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd4h3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 17:08:13 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57UH8C8l026667;
	Sat, 30 Aug 2025 17:08:12 GMT
Received: from localhost.localdomain (dhcp-10-154-121-113.vpn.oracle.com [10.154.121.113])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrd4h3h-1;
	Sat, 30 Aug 2025 17:08:12 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] docs: sphinx: remove SPDX/copyright comments from HTML output
Date: Sat, 30 Aug 2025 19:08:08 +0200
Message-Id: <20250830170808.3911151-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508300180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX18sHrHQKbI3+
 kWa79VCcMLdvet9kk9Gzr5LQ2HagcCM6xwiVSagPv6+qmLyLCSC+0OduyCco8CnXayhBbQWlImO
 HetXNzlVxlITG2XnqFSjeXe8Sspw3JFb3edcU+wDeS/36yHXP9poxoYs6UlKcPhbupi/1UCpmrX
 +TFc+C7+Gd9L1kjIbObtWVfpR0HtU2sDMqqXTahEbsRWPB3a2Il5I08OgzjyVT4Jn2MlijnPRWq
 GZ5COhttim48KCMGEPgtUnfaL5t0ILj3HUmz3XlwCPDJEofEY08cTAsuB2C5Iq9C16m+4DbgLgC
 3w1ciR3+IJV//RtN69KoDRp1Og9ab0W15eDPSd+jhFmBNn9K2uzoT9PQONkOl3qp3IHVBmecxjx
 wnOjBWdGSvySA2cRHrh30nvyZkblrQ==
X-Authority-Analysis: v=2.4 cv=X/9SKHTe c=1 sm=1 tr=0 ts=68b32ffe b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=Du_SqIBOx8UMNTT-MFEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-ORIG-GUID: L025Ff8fczYiF-iC40KK5mE19gRS1K3x
X-Proofpoint-GUID: L025Ff8fczYiF-iC40KK5mE19gRS1K3x

Use Jinja2 comments instead of HTML comments for the SPDX and copyright
lines. This prevents them from appearing in the HTML output, which was
never the intention; the HTML output has its own copyright line at the
bottom of the document.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/templates/kernel-toc.html   | 3 ++-
 Documentation/sphinx/templates/translations.html | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
index 41f1efbe64bb2..b84969bd31c4f 100644
--- a/Documentation/sphinx/templates/kernel-toc.html
+++ b/Documentation/sphinx/templates/kernel-toc.html
@@ -1,4 +1,5 @@
-<!-- SPDX-License-Identifier: GPL-2.0 -->
+{# SPDX-License-Identifier: GPL-2.0 #}
+
 {# Create a local TOC the kernel way #}
 <p>
 <h3 class="kernel-toc-contents">Contents</h3>
diff --git a/Documentation/sphinx/templates/translations.html b/Documentation/sphinx/templates/translations.html
index 8df5d42d8dcd8..351586f419386 100644
--- a/Documentation/sphinx/templates/translations.html
+++ b/Documentation/sphinx/templates/translations.html
@@ -1,5 +1,5 @@
-<!-- SPDX-License-Identifier: GPL-2.0 -->
-<!-- Copyright © 2023, Oracle and/or its affiliates. -->
+{# SPDX-License-Identifier: GPL-2.0 #}
+{# Copyright © 2023, Oracle and/or its affiliates. #}
 
 {# Create a language menu for translations #}
 {% if languages|length > 0: %}
-- 
2.34.1

