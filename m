Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2A1DED42
	for <linux-doc@vger.kernel.org>; Fri,  5 Sep 2025 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083588; cv=none; b=Gu7k9alcmhK54/fdmBM7CA+APM8AdHCZPi+IRuO3+R969cOGbxDaaA9ypw1b5BRMalfJ7qL6UqeAoxBfOZzVYDADrHBZl/eqau5VVuRlyFKVE4jEDOqHHfVrY4PF4fHibf5A3PDsDS4RZxda2rmyuZRzs2+izdoS+dq3EeSntNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083588; c=relaxed/simple;
	bh=ebKEVaevJde6vHuuT/UtG5cuDDv80cunb2gHftbcnaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shuLJ2rgiZEVxAx5v5/xecUrTwTeotG3H/PomA5Q215V2O2IiyJSgGyqScBVa9R4JLhDo5OAL7ZZ5vL0nGRtmwHGfWqFT+S5ifSXK4FSzsWtOAnlcyKn+MMwEb/LEoCPq27CETVJJfBz4zi5tqXnaQfVOxXLOX5SwYvGdb/BTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZSo32ZIV; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZSo32ZIV"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585EOJxS003551;
	Fri, 5 Sep 2025 14:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=0lISpc25dDagOjrgdS+ZUPFWpk9By
	dvmZTuhEaF4qLE=; b=ZSo32ZIVqpGoTQbWEN57Pvu+Aca5ncneQWUBZZIZmXPnr
	Ct4FSn0XBKieFpQ3nMccyotKjRkNwt4RDpbNic6NohzUEuU9SoWMApRfr+4zLjPW
	Q4G0ic0fMvP2HuLlYGgpizpDbZLQGrVMPi7N8JKI9Qwzf/4k+OYDWbUMSod+yrp6
	j3RnQNbJ57ZpR8Ep06QbyI8RiUcN3xxteVAmnAJOAn8GdpkMquRD25HuzmgNoQ40
	1hBNLLwm7jzC18lfCcDF4K2fuUiFEbJB/ENjx9RE+DjBHT4AMdL0ZbgRiVzyw8kj
	pT4L41IlqdGuU0KFgtGNY0JaIRylMsIvQATkMkHhA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49002f07mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 14:46:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585DkuI2026253;
	Fri, 5 Sep 2025 14:46:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd3vn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 14:46:20 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 585EkKZY022015;
	Fri, 5 Sep 2025 14:46:20 GMT
Received: from localhost.localdomain (dhcp-10-154-122-46.vpn.oracle.com [10.154.122.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrd3vm5-1;
	Fri, 05 Sep 2025 14:46:19 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH v2 0/3] docs: new scripts to generate HTML redirects
Date: Fri,  5 Sep 2025 16:46:05 +0200
Message-Id: <20250905144608.577449-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050145
X-Proofpoint-ORIG-GUID: KkcQUTZN0EQiHfiP2-y7U-zB2suWYucD
X-Authority-Analysis: v=2.4 cv=c+urQQ9l c=1 sm=1 tr=0 ts=68baf7bd b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Roey6KB8dDJ0gliMeL4A:9 cc=ntf
 awl=host:13602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDEyNCBTYWx0ZWRfX/6vaGQzYV68J
 ZGKRR1qa6Q+oGr/szTFJWtF0iVHHBpo9WEinedW7nlpj+888GO0P0yi8K8Zk4sFvzwdkHucaCic
 TG+k42l9G/QPVEE8+3G1QFTdJPtsjruAfEL2Ik+dLiQjDfxTYTPGOlEDX6tMqsIv9VW/XXgSXU3
 JY/j8NTf9Hykeq4UiVNmuEpLJONpFR8BdQOnlApYY2mWKwpxbwzoH+vZvs+ULNhLAgl0glNAhao
 5i5pCzjpGaKUban5WP3dlFvgSnSEnYinx7AU8oD5SGUUPyFyR39MOV6zZXT7a4SzJsbOtf+rEb5
 IFwNcDyLopxbpkcXQ++YjoaKUnAknhJKyUZF4O3nd5kfqUwiG00MHd6frb01flLwOZnw5ebWF2B
 GYjgZF80i6u2VZ/f9LXlXtWdO3WJAA==
X-Proofpoint-GUID: KkcQUTZN0EQiHfiP2-y7U-zB2suWYucD

Hi,

When we rename an .rst file, that also changes the URL for the document
at https://docs.kernel.org/ and results in a 404, which can be anonying
for people who bookmark URLs and/or follow links from search engines
and old changelogs and emails.

In order to be able to fearlessly rename individual documentation files
and reorganize Documentation/, add two scripts:

- tools/docs/gen-renames.py : use git to figure out which .rst files
  have been renamed

- tools/docs/gen-redirects.py : actually generate .html stubs for the
  locations, redirecting to the new locations

The reason for splitting this into two is that trawling git history is
slightly slow (on the order of 20-30 seconds on my laptop) whereas just
generating the HTML files is very fast. This also allows us to cache
the historical renames in Documentation/.renames.txt or add manual
fixups as needed.

Changes since v1:

- cover letter
- move files from scripts/ -> tools/docs/
- add SPDX lines
- program doc strings + improved --help


Vegard

---

Vegard Nossum (3):
  docs: add tools/docs/gen-renames.py
  docs: add Documentation/.renames.txt
  docs: add tools/docs/gen-redirects.py

 Documentation/.renames.txt  | 1191 +++++++++++++++++++++++++++++++++++
 Documentation/Makefile      |    4 +
 Makefile                    |    5 +-
 tools/docs/gen-redirects.py |   54 ++
 tools/docs/gen-renames.py   |  130 ++++
 5 files changed, 1382 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/.renames.txt
 create mode 100755 tools/docs/gen-redirects.py
 create mode 100755 tools/docs/gen-renames.py

-- 
2.34.1

