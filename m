Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC4A34C141;
	Wed,  1 Jul 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915669; cv=none; b=LAye1jQhQYJDp5sQ9k9ZGG1T+gblTwIw2tOGVxPkrrZQ+9YZjsY0Q3fJwQim4OFAXu7BOmLLNrVvWJdiAWwn3HrMZp0K4tlvXD+ls0CDGMEn0U0xkK4WY9/NUTcBXqrn77VEuXUL8tEH6lEjVpXTpqKXYHPAgRHpCDk6Aoaa0Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915669; c=relaxed/simple;
	bh=yqaqvXJizlNlqZ6iHL/IjtACppN6ziR4/ms0dr2cjVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIehMQ13sY9+oK8zb3oYcI47REhCwRp/Dw9xCm+tJtQEdCDwxxThUA7hQN22L3o2CZwmH2etP27cD2JRtIQKpb03gCiPc63McvnsSOEM/6mSc7UHosdpQbQZ0Swr6GsOC1qC78nvZKjNTdkvTKoFzztS0iEng2Q6HvPrnxSI4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Q6HQPMwt; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Q6HQPMwt"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AINEN494388;
	Wed, 1 Jul 2026 14:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=NBXCDUux7M6MhiOk/
	JNKqO3UAAAeONHtqdU/04XJdnM=; b=Q6HQPMwtfKxp2OO6pqC8z0VP971QllY9d
	LcoiL8Kb0tQTf7S+h2e4U/aKO/SnKNe2kPzidgvxNOF0l7hBXKo13g/mTd360478
	D+sR1hFI4RHouFvN45BuwHkYsugJzbwpHGL/hxg29HOYuOWnyiWARdsFC6mbmQtJ
	JL4fUDNMoHRBxVhxd+rt4iJq4EnwPXiGwLCpGe1VTowkSPDlk3RlYJr/kqtkv/Mg
	vnYrAQtQvLDOU/1soLtFLl6iRqRJTCAXlk4mod5jygVBBAgN5cxKoeAogPqxHgTP
	uEWBTbsiNo9YLB2BB1X8lmvoYoKX4b3mFtvUXgm45fAs7DO6+2SJA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26rf4hbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJlTU028018;
	Wed, 1 Jul 2026 14:20:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfue1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EKj1A48366016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:20:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BCF320040;
	Wed,  1 Jul 2026 14:20:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B5842004E;
	Wed,  1 Jul 2026 14:20:31 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:20:31 +0000 (GMT)
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
Subject: [PATCH v6 15/23] virt/steal_monitor: Add control knobs for handling steal values
Date: Wed,  1 Jul 2026 19:46:46 +0530
Message-ID: <20260701141654.500125-16-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701141654.500125-1-sshegde@linux.ibm.com>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a452242 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=vAp1KD8dDVSxnFMUFIYA:9
X-Proofpoint-ORIG-GUID: 5J7OzJsaIrM1CutuqjVbVJ8rAJ_qqLRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX9YlcNW218B4W
 l1K6AXo895RbPKA7z+ronDvSoQfAlrikrA2erbTCQKIP6babGxzNbm3rbpccPOmF9sJn+jjXn2f
 k/uik0M0UQeWZGDgz6VF5vEyQRDnuErJGHurAtkr7iPtK74OgH8ngjKvZdI4QiaULlkvY9/Rt5O
 /RFiAGJiRp8/Vf2ZoFHIaCOmDvxbnHUgaJtpHG8LTY3MFyCqIHTNs82LgHiJbuikIo+92PuRO1Z
 Glqfu4b8laPNnY5a83MuHpT+6b7v+EzovAFztvR5X4KG7pNqZzKZLHD03CLGh+sXwU27fyeb6uN
 8lhEbDFdATlhNeF400gNFQ1CIiikB6BO8ac/7+TDexjlnRLln8/7GKv20N9krnEu1WKMllAgZc4
 3d7HaM9eOAZiLoDpzQD2QpoFOGMbcN7li61543DscGfcK8VwqENcNpqJQc7QQpjC6tb9zTgbl06
 ul7n8xioKG1TaaFRJQw==
X-Proofpoint-GUID: a-Ql_zI-h-_p__8YMuHLyCC-Vl0cJKnk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX70yygiUz/65/
 ANS+fLZDtLgbKAYOkQlPAD/AHHIWu4+5aG5ShCg1TRqDzbP+czRGhpO/TmSC8XO+fRZmub4sBhv
 v7S2VzxvxM/H3Np99sQIE5sTWYSARoE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

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
 drivers/virt/steal_monitor/sm_core.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 92d5a0e3d8bf..1ba638224abb 100644
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

