Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A843DDDBE;
	Thu, 25 Jun 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391788; cv=none; b=B6y5yPQEdpipodS/Cbfn6OsHmKGnJ14MNezYUT1S3a1f9lskvhHosz1dKfPt834YDX+ZBS/w97kIo4HGjPGMtAdRSXbxWo9gJMy7Bdgj5cthJ/LWpTODoI1qO+aGckQleKFZefJQ/sRvDABvTIJfhMOFk60qNsRTG04cPkr+rBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391788; c=relaxed/simple;
	bh=H50O3bW3qFEBFknJNTPuGBH8Z5OujvD1iBdGJ/M/E7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5TKn7cCZhioJuUxDGDA96pbabbJRnFRfUZmL3Sdve5ewrwrc2JsL/2rtqd6rOBgFOjMRpzNSU6ynbd6abcDGUCbaDMrZA01XkzeUIxQqiQg6T6AVfjL+Ydm3KKh0dX5uwrGNa6GCjiRH2sbTeHKNQkIfcI54CElvPovFpxFKLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=USQoXTxa; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="USQoXTxa"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3nUjV2928220;
	Thu, 25 Jun 2026 12:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=x83FNOYXFbIpym8rD
	nh2nWkJxY+cdibCirv2hUibSng=; b=USQoXTxamG8AD4w0KR/pPbOXOz1AAWs/F
	/p+3U6w/Eo19xbxaywqi6PbJESiQvSHJeCojxXMkb/zYDl9cNRQCnoWS4LPhSr2A
	QmExLARf6Ynl+2omeNmhS2L2uglcMlO/NLiHRHUfp1Ttp7upp4xzVrp1ygpPYFMD
	5FGdvMOWtlNl+HeztDnSusXe+IqtTT4rRfwSA1TUw3ii6ZvT78VDsm3qKt7gs8yX
	ZkHRm4PfaSKgkvxFP0cHALutBG8FuuhWIAqAf16X/nib6luOeBH06k3+IWszzujK
	DGauqxBeFxbyqjwnloC8ufIWI1ERJnrQ/SKYzn1nX9blyPCMJNFmw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:32 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYc8r013532;
	Thu, 25 Jun 2026 12:49:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex5jwp9rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnRmr27787926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:27 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E8DA20043;
	Thu, 25 Jun 2026 12:49:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA08E20040;
	Thu, 25 Jun 2026 12:49:19 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:19 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 17/24] virt/steal_monitor: Add control knobs for handling steal values
Date: Thu, 25 Jun 2026 18:16:41 +0530
Message-ID: <20260625124648.802832-18-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625124648.802832-1-sshegde@linux.ibm.com>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: wkyklMEWD7mt5_uxmscbU8iluFiTvN94
X-Proofpoint-GUID: S1Y7ljGmgOdYxLycoqsOcBx2bT82e9e_
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d23dc cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=vAp1KD8dDVSxnFMUFIYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXwh2ftGbZOO2u
 0mqXEh+kqfS2EL5ilq9eRFvAaErCYfiTfETuzY0lB7mkwdmkaNe0f4P7SzGqade8YiDTtzv7mZn
 KN2msEXs6Dow12MCd4tFfEn+7EHjfKDTOOh+Vx9JE1OmCmV5N+OwHF86/7kA3CtMOD1H7OwI5D5
 xnNK0pqoQam6bc7LoEgnXcGqPO6w0K12diGIUZvYMiXDIdYSKqP413IXpevO/nD2zSvbTMGzMEo
 e5lD3RleXkfiNrdZEjYGxFOSf0xQbQu6G6Q/5U+OjIiwtLDG/JoDMadJ7uIBFbBytOloamxsgNi
 PNPaAYaCseMKI5BDIg9TNSsb6qojMxhXKR62wljgDhHnCOkCFcMRefMZeBw/H2BLJBPbFy82+xL
 5s8z6cLsSc6o1nTCXRBWMwxwtNOQuXsnPTtleGCiSW61RjrVvZsU+nwr4U06hS4nNSRZ/j5Cg4f
 kIX7ZBkDPfETfVvN7GQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX3uHvjPWeneW1
 PRodzEFLER3Hi8bvOLVi24lE4TzbBwi2aiRaTGF3mlk/AwVrxFxzrjgiiD9dCo+XOfH0dVF0wC8
 pRPtz0eZMb7YXq8gLuOUd5egl24ac+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

These are the knobs to control the steal_monitor.

interval_ms:
How often steal monitor checks for steal time.
(Default: 1000 i.e 1 second)

This controls how fast steal monitor driver reacts to changes to
the contention of physical CPUs. Since it does fair amount of
work, setting too low will have overheads. If set to 0, on next
work it will be set to default.

low_threshold:
lower threshold value in percentage * 100.
(Default: 200, i.e 2% steal is considered as low threshold)

This determines what values should be considered as nil/no steal values.
When steal monitor see steal time is below or equal to this value, it
will increase the preferred CPUs by 1 core. Having value as zero
might cause too much oscillations.

high_threshold:
higher threshold value in percentage * 100
(Default: 500, i.e 5% steal is considered as high threshold)

This determines what values should be considered as high steal values.
When steal monitor sees steal time is higher than this value, it will
reduce the preferred CPUs by 1 core.

Also available at: Documentation/driver-api/steal-monitor.rst

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/sm_core.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 3feb686dd3c4..b95b37e37a16 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -14,7 +14,23 @@
 
 #include "sm_core.h"
 
-struct steal_monitor sm_core_ctx;
+struct steal_monitor sm_core_ctx = {
+	.interval_ms = 1000,	/* 1 second */
+	.high_threshold = 500,	/* 5% */
+	.low_threshold = 200,	/* 2% */
+};
+
+module_param_named(interval_ms, sm_core_ctx.interval_ms, uint, 0644);
+MODULE_PARM_DESC(interval_ms,
+		 "Sampling frequency for steal values in milliseconds (default: 1000)");
+
+module_param_named(high_threshold, sm_core_ctx.high_threshold, uint, 0644);
+MODULE_PARM_DESC(high_threshold,
+		 "High steal threshold (default: 500 i.e 5%)");
+
+module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0644);
+MODULE_PARM_DESC(low_threshold,
+		 "Low steal threshold (default: 200 i.e 2%)");
 
 static int __init steal_monitor_init(void)
 {
-- 
2.47.3

