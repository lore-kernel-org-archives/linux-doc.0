Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC03445946
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155520; cv=none; b=jQxCyzEYptz6RowqL3rz8tksGRKilnyTMCQypc3qjTtJ09ntVz3ETxsbeKKpk2bLWk16pOBn1l4vxGFVxY0CjlLbuqVWT6VoTxAwYxBJr0Zpt9YwED7BbuQ7gyn/VlS7Oyn/H0iF2/xmZDf2+24e3MSxV0YkTVC9tervul3F29c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155520; c=relaxed/simple;
	bh=ATu3XZAJLABRfkfCqnkOKFhfgSRPwZcbbxfVlEhKDuc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ekso9fuSmuYnqBC0bYrv/HXpybzmM6EGN6iKH3jakJBdJvo9mHM8u6pVX5Kfv9xyFXcCYGeQm88zxzLlr1gkRxeYQKXF05nT/Fjbi0rGw5JpYV7Uc7/WPlMzbGz33xmK5ARfrqyBrhlH3Le4ZIHvT6vJsFZTPNZsqwm63y4OaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GzWFv1Tz; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GzWFv1Tz"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415DWSKk011089;
	Mon, 5 Feb 2024 17:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=vQsRt9EmJ05r6Du1kTBsSaQyexIy0pdj1GUP0QkmAUg=;
 b=GzWFv1TzKNjbdedTGdbig1m1mOZ3kPXIpODtYfBpdzkO/NkQ+ucq1s64jkh6jkQevc2w
 ENdPJKWJ+aTyKkxLiR2tHKcBDL/a5PGvIMoWg8pt6v3KD7XcIiyeZhrVJb11hCNhIK2B
 /A+Vcg3aQNrNdZYkDRucjAk2QSY4Fu7zkcn6K9XIbfXmiSORghTsWaYh9wPriNYPf+tf
 EPihxoqkSSoIPZPXc/eMDnHw6xGaUHfYve6uDdulaLnrSJVvrPe2SElumxlILnWOMpje
 qpl0L2nNK2IUMJtbt1Rp7n66vZ+dkulXFAvazlpfwcsRhjHoQGqcg/ykWOhyVUptWQyg hA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1dcbchtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 415Gx8qh038385;
	Mon, 5 Feb 2024 17:51:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx5u1y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Feb 2024 17:51:46 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415Hpkim033449;
	Mon, 5 Feb 2024 17:51:46 GMT
Received: from localhost.localdomain (dhcp-10-175-62-2.vpn.oracle.com [10.175.62.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx5u1vh-1;
	Mon, 05 Feb 2024 17:51:45 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH 0/8] Sphinx extension fix + logging/warning cleanups
Date: Mon,  5 Feb 2024 18:51:25 +0100
Message-Id: <20240205175133.774271-1-vegard.nossum@oracle.com>
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
 definitions=2024-02-05_12,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=489 bulkscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050134
X-Proofpoint-GUID: 6LowT3ZGvqh2a1CK-O71VOfbASt-ZfCX
X-Proofpoint-ORIG-GUID: 6LowT3ZGvqh2a1CK-O71VOfbASt-ZfCX

Hi,

The first patch in the series fixes the "UnboundLocalError: local
variable 'fname' referenced before assignment" error and should
probably go into v6.8 and then stable.

The rest are just cleanup/improvements, mainly the removal of
kernellog.py in favour of sphinx.util.logging, but also adding a
warning if you pass something strange to the kernel-abi:: or
kernel-feat:: directives.

The reason I'm sending these two things together is that there
is a very slight dependency on the very first patch.

I've tested on 2.4.4, 4.3.2, and 7.3.0+/b660154eaf71 by running
make cleandocs; make htmldocs. Figures, features, and ABI lists
looked fine to me.


Vegard

---

Vegard Nossum (8):
  docs: kernel_feat.py: fix build error for missing files
  docs: kernel_{abi,feat}.py: use doc.current_source
  doc: kernel_abi.py: convert to sphinx.util.logging
  doc: kernel_feat.py: convert to sphinx.util.logging
  doc: kerneldoc.py: convert to sphinx.util.logging
  doc: kfigure.py: convert to sphinx.util.logging
  doc: remove kernellog.py
  doc: kernel_{abi,feat}.py: warn about missing directory

 Documentation/sphinx/kernel_abi.py  | 15 +++++--
 Documentation/sphinx/kernel_feat.py | 19 +++++----
 Documentation/sphinx/kerneldoc.py   | 14 +++---
 Documentation/sphinx/kernellog.py   | 22 ----------
 Documentation/sphinx/kfigure.py     | 66 ++++++++++++++---------------
 5 files changed, 60 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/sphinx/kernellog.py

-- 
2.34.1

