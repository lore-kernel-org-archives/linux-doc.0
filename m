Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8AD41779
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lZSYIBPo"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40AAGn8E026331;
	Wed, 10 Jan 2024 10:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=/KPd+ysuOswjegfJtPcwpF1BNCxiQG7Ws3smHNNGPAE=;
 b=lZSYIBPomjlLqnI6seuDziLS9e53mTG7/9W/AIAvihlyOmm1QEMu/M072jY/f1Tsysqc
 KAMF7RMi48syz0iK8XBoyTm4n/26NakzVmGGeQ2gK/w1KzJfs0n7Jmbzrm9DZLtx6sVA
 WaW5avofdtNXWNMfZt6UzNJV63R+TsVMLyKS/LNA2f+bU/xQLvNZ3GEb30Noa+JM71o4
 /Tibpf0jAN0iND+pZoOIuZkYPB98co4Ni8/Mx9D92015XjWrFdoXdcgsnCX1g9AujufZ
 XG0eFlOlsbAmMD2qzOmsT8xLiGw68XKxzoyMRN/LyWFwEprJckRE1W4bLKi4u3BhZ0Ni tg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vhk1srp5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 10:46:53 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40A90MZb006805;
	Wed, 10 Jan 2024 10:46:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfur56c0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 10:46:51 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40AAkptf007824;
	Wed, 10 Jan 2024 10:46:51 GMT
Received: from localhost.localdomain (dhcp-10-175-43-230.vpn.oracle.com [10.175.43.230])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3vfur56by3-1;
	Wed, 10 Jan 2024 10:46:51 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] Documentation: constrain alabaster package to older versions
Date: Wed, 10 Jan 2024 11:46:46 +0100
Message-Id: <20240110104646.3647600-1-vegard.nossum@oracle.com>
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
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_04,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401100088
X-Proofpoint-ORIG-GUID: MVxD7Az8PAToSFFvJQz39MrN7JjkAPIg
X-Proofpoint-GUID: MVxD7Az8PAToSFFvJQz39MrN7JjkAPIg

The 'alabaster' theme dropped support for Sphinx < v3.4:

    0.7.14 – 2024-01-08

    * Dropped support for Python 3.8 and earlier.
    * Dropped support for Sphinx 3.3 and earlier.
    [...]

(Source: https://alabaster.readthedocs.io/en/latest/changelog.html)

This manifests as an error when running 'make htmldocs' in a virtualenv
constructed from Documentation/sphinx/requirements.txt:

    Sphinx version error:
    The alabaster extension used by this project needs at least Sphinx v3.4; it therefore cannot be built with this version.

Raising the Sphinx version is not really a good option at this point,
since 3.x through 6.x have horrible performance regressions (7.x still
does, but not quite as bad).

Instead, constrain the 'alabaster' package to versions that still support
Sphinx 2.4.4.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/sphinx/requirements.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 335b53df35e2..6b0a981dcb2c 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,3 +1,5 @@
 # jinja2>=3.1 is not compatible with Sphinx<4.0
 jinja2<3.1
+# alabaster>=0.7.14 is not compatible with Sphinx<=3.3
+alabaster<0.7.14
 Sphinx==2.4.4
-- 
2.34.1

