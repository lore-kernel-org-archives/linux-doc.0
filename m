Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E012FF88
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004942; cv=none; b=OrDTDLb+n5qcO6abT9nwlsCQRgMNOKgmfMnUOffkm/9ugIALHL2xClxcyODnKblZlk+wqbnlBczokNI+v5abgNzHsUPI4uEs7b1ZWBK6gz2o42A353MLoc4iPB6+l5xYai2VQCtMSmfBtiBWh82EeZkwpJYUenNEp3ci1CaJaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004942; c=relaxed/simple;
	bh=Md6RVhlS0iWi1cGE2ZsgaGqnGhfokAvbxfxUXDn/daY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s/so8BkDQDKgHBVyEZRphdaqBRvwlvEiEJaQ1G66e2vH11ETs7T5AVXwtQkgRjCqz70tLv7D1W7rFPMvWhXT4RBDzUiSF5XTdfGyvSIZ5iT8x98tSG3XZir7rwBFEYVylQoYBxs9e/FUhe0axkKL9No7O5zW5a518Z2fMUU0yEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AHmU6yxK; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AHmU6yxK"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDLVKP017595;
	Thu, 15 Feb 2024 13:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=o3JhddfBRwZUGO/NtDEoXC+KAVHotJ3D6J9pJGDO6eY=;
 b=AHmU6yxKkKOpT6ZgtdeF2BmZ2Cc/apMcReZX38psmTHmd+72wXu77rJ3Gx8L8jn8p4Yz
 fmedpthUiGU3lwgWKh6/v42cs6wuQFDcjBVpUVZ+vwzGsl+Dm57NvLXtQFErUukrrp8N
 BnxSINxlJmpdZF0aTDBdw/aCWVJvcTbC7t1UCjZVo1n45xYPzFE4Xg2fw2OVQpgpASsk
 w35/NoYFb/Z0lIPggMTtAXE07/dwES16gCra1Yb2yI2XB+AQWGkjg3zNZVGHpkjiQGBq
 o/6WGla0Rw+o4AguIaiyrA+OGJz9QtPippB2Jq38bRmngchAZOwco/iy9flznfoQan7z fg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w91f02ed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:58 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDaZWl000865;
	Thu, 15 Feb 2024 13:48:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5ykaj20x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:48:43 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDmgkw034749;
	Thu, 15 Feb 2024 13:48:42 GMT
Received: from localhost.localdomain (dhcp-10-175-53-231.vpn.oracle.com [10.175.53.231])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w5ykaj1xg-1;
	Thu, 15 Feb 2024 13:48:42 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 0/5] Some kernel-doc-related cleanups
Date: Thu, 15 Feb 2024 14:48:23 +0100
Message-Id: <20240215134828.1277109-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: ZfVECW2CAtzhiE2A8bvyFj7PCi_7ZnfR
X-Proofpoint-GUID: ZfVECW2CAtzhiE2A8bvyFj7PCi_7ZnfR

Hi,

The main bit of this is readability cleanups in output_function_rst();
this should make it a lot easier to understand how the function
signature interacts with other elements in various cases
(macro/function/typedef/pre-3.x vs. 3.x sphinx) and formatting.

This whole series is functionally a no-op; scripts/kernel-doc output
should be byte-for-byte identical. I've verified this to the best of
my abilities with both pre-3.x and 3.x formats.

As a bonus, scripts/kernel-doc actually shrinks by 2 lines overall
(admittedly not much, but hey! Not bad for a readability cleanup).

This applies on top of the scripts/kernel-doc reindent patch.


Vegard


Vegard Nossum (5):
  scripts/kernel-doc: add modeline for vim users
  scripts/kernel-doc: simplify function printing
  scripts/kernel-doc: separate out function signature
  scripts/kernel-doc: simplify signature printing
  doc: kerneldoc.py: fix indentation

 Documentation/sphinx/kerneldoc.py |  6 +--
 scripts/kernel-doc                | 80 +++++++++++++++----------------
 2 files changed, 42 insertions(+), 44 deletions(-)

-- 
2.34.1

