Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047B529A9C9
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941034; cv=none; b=mtCtwDaLP1dFanQxlf6+W8U4uP+y5lLQg3r3gb6bwDy8jULBH7mloK2DD/JO6NbIqJWb6BDMBfQeZBoG9+ItUgXUY7PAI6EIxfKGE/pM4FMj8X/7MsQ5/FFyDa84eHmyMo0x61tWY23Q6w3MlPi10tmtOodEenXlDjx/A76M8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941034; c=relaxed/simple;
	bh=L8JBl46tQj2GAsdJIOnR0bzEZNqtdKwqi3HPNOgESs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qMBDPYmULJdHRNRLiKnNoiHC0Mj0xPHxzDPfUlKxo3TFJDtZy/zQzdq0oKdIyZ8CtX0DeO6FHwykKblnIPHuK3q407U4xHalZYSJ7zW7sb28B133IfNUPB+/4zEvx1czPFEllWx5AoLqaR0bP1IBUAhs+b8D/1UWK3oW4CN6NsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=REQiNT4a; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="REQiNT4a"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QACBid021006;
	Thu, 26 Jun 2025 12:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=oM5QN1bTA2ARqyZQ
	7oZ4Jl0G6EnqLHk+PBXlHsrYz0Y=; b=REQiNT4aSZqmk2iZqugn9bZAYP0J6dts
	sebRZqjuyDfABF9c752g2dRlR/HPW0QDZwy+ByPuhnAW3rKn0py2ytcPmhyuGtfh
	BlEbyLLD53twLz6IJsm7es6ZTue/fr9OufBqL7kvVNOt2D/jKeCdaPQ15sVdp9cY
	QnYnkw7j8D+CAU71Nbwa3zRZHg0F7fvDUcDs5HmjyGU8qQ2A6ydDreFFD+nC/XIK
	AmEme4JXiTBH1ZUcJo2XFNEeJo4kiNIWAWN659lvTS4YssqFPoHN5xtyTMU4hBum
	brEP8Yy3iu/Bu2toLKNESxEf+lHbcChcukcaVyylhO0b9DwKA5o/wg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1gfhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 12:30:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QBB5wE012826;
	Thu, 26 Jun 2025 12:30:24 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehvyx4rd-1;
	Thu, 26 Jun 2025 12:30:23 +0000
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 1/1] docs/memory-barriers.txt: Add wait_event_cmd() and wait_event_exclusive_cmd()
Date: Thu, 26 Jun 2025 14:30:22 +0200
Message-ID: <20250626123022.1525131-1-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506260105
X-Proofpoint-GUID: pFt81IQp1k7e3IuC3PSZ1YDFV3vJGt2m
X-Proofpoint-ORIG-GUID: pFt81IQp1k7e3IuC3PSZ1YDFV3vJGt2m
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685d3d60 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=M51BFTxLslgA:10 a=yPCof4ZbAAAA:8 a=eATuiTakoFPP2dfb7UwA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEwNSBTYWx0ZWRfX2dTrbffb9Per n0C2tJ58jegqD16Y5tpim0X3E6nPz/N0vahNYL5zRo1HLr6Ywr1/BsYjIgmaEe6qbPfqu53C71s YHNckRiioS4gaKFTgSUFf0QoE35A2bZbHmkUdwAGsAy8LMhDbD1gIXM48i11mjmrjXA1eGw+tzJ
 ry6swQ+dn1oce6uTOnp9Kk9hLYeGI6G7Bt6b/zfXxdE3FMwvVmOpuT7N0fkPz3VMBaCOa6RwWXo B9gm+6tmXHNXfk6Xu0pqR57dc6oP+qjf5CmzUmv7lVc/54xsjs2qB2Tzt6pdqQRGa0p+EJz3m9R UgVdHkS5zUEp3+5pqPo4zrVSoC8ouCaHgHhJbMJ7MrOigZrH83Ryt4uIwpreB8sOq9TXvPBLQpC
 rVIZ2DM4QtAdFV4j0Vgpvyy9KtN3IdX4TSb0elpecmW5w6qSO2dcusNy6EUXkUUjQM6+Pfj1

Add said functions to the documentation and relate them to userspace's
pthread_cond_wait(). The latter because when searching for
functionality comparable to pthread_cond_wait(), it is very hard to
find wait_event_cmd().

Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>
---
 Documentation/memory-barriers.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index 93d58d9a428b8..d721e9be5a4f5 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -2192,6 +2192,8 @@ interpolate the memory barrier in the right place:
 	wait_event_timeout();
 	wait_on_bit();
 	wait_on_bit_lock();
+	wait_event_cmd();
+	wait_event_exclusive_cmd();
 
 
 Secondly, code that performs a wake up normally follows something like this:
@@ -2296,6 +2298,15 @@ and the waker should do:
 	event_indicated = 1;
 	wake_up(&event_wait_queue);
 
+Note that the wait_event_cmd() and wait_event_exclusive_cmd() are the
+kernel's polymorphic implementation of userspace's
+pthread_cond_wait().
+
+Using wait_event_cmd() or wait_event_exclusive_cmd(), cmd1 is
+typically a lock-release call and cmd2 a lock-acquire call. The
+locking primitive can be chosen, contrary to pthread_cond_wait(),
+where the locking type is cast in stone and is a pthread_mutex_t.
+
 
 MISCELLANEOUS FUNCTIONS
 -----------------------
-- 
2.43.5

