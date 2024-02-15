Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61412FF72
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004929; cv=none; b=eyPT+cPdNTqJP4gDaMaUTd03r359qzS7N350ZDY2KeKchTm953dq2vV3cZj1OEDgAxo311UUrP3zPgsAVQ7I+IaLN/rSErc8LVWFyDeGAW9I1dw2P5ECp2yDg+m0m/PDAIsbRxU9w3sRcxtFhS82k+R338QRYQPa+oDgYedkMlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004929; c=relaxed/simple;
	bh=ivlS7fWH4XaKxQsbaMLNokhd1p958//VKLpjQDabhyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iNFKeWgr4OxDWvkSdluRIt5BVbivaHUEpxz6/WFja277kQ8gsp+0iDYhcuAy7lbCpQSCMjjWbdA5To8200FNcrl6szbDDpVY09XLyIIxcE3+M7sYGDwqcOVl7/ZbMLIa9BllUHz+P0BMssE2RGWnGifOZxQlw75RsQVjTQRC2rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KCs7slC9; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KCs7slC9"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDBVxF013773;
	Thu, 15 Feb 2024 13:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=HwAJGcUB7j7daNzv3d01kSAtmeEn0S+YaIoEDEc/Bng=;
 b=KCs7slC9jraPJ9xP8oN0x4wQiKVb/M3zpvTwG0+7QyWQX/vkfdH/XSKuGs9LGvpvH2YZ
 kpk0gYjQiOIuJa4o30ETbo4nPvMgd0T3ljdRwYEo51NVwDkC/rpoy5HWKGKvBB0hZJcZ
 4jD5pkoaSYS6/6RyHf6X3DxC4Y20nXMeydVdLd3X9GVSPmlnUeH4hjmgxAheTdFxSzoC
 bGgp9DCemGZ8bpKRhaTJrD0ZNeN9K/r+h0zZxHku2m8+hZd52YTqrkpUuHyPffOysX69
 k+jeo6MmY2eyyUeFNfmi9YasKiapS1dVEKpjY+fVV66FOxfMXf2XkIv085leDYaQLSjz uA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w92s72587-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:46 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDgADm000793;
	Thu, 15 Feb 2024 13:48:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaj21p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:44 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDmgl0034749;
	Thu, 15 Feb 2024 13:48:43 GMT
Received: from localhost.localdomain (dhcp-10-175-53-231.vpn.oracle.com [10.175.53.231])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykaj1xg-2;
	Thu, 15 Feb 2024 13:48:43 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 1/5] scripts/kernel-doc: add modeline for vim users
Date: Thu, 15 Feb 2024 14:48:24 +0100
Message-Id: <20240215134828.1277109-2-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: LD93xOrClz5ZK7q6XKGALJ3JaY_Ktkmn
X-Proofpoint-ORIG-GUID: LD93xOrClz5ZK7q6XKGALJ3JaY_Ktkmn

Set 'softtabstop' to 4 spaces, which will hopefully help keep the
indentation in this file consistent going forwards.

This mirrors the modeline in scripts such as recordmcount.pl, ktest.pl,
and others.

Emacs seems to use 4 spaces to indent by default, so it doesn't require
anything special here.

No functional change.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/kernel-doc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index a9947080ead3..4dc5c3909d8c 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1,5 +1,6 @@
 #!/usr/bin/env perl
 # SPDX-License-Identifier: GPL-2.0
+# vim: softtabstop=4
 
 use warnings;
 use strict;
-- 
2.34.1

