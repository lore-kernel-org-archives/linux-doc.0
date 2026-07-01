Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614A344023;
	Wed,  1 Jul 2026 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915805; cv=none; b=CWCssIGp/1/sArrMMFrycjNUKfSlpFDKsQAR/5Sye3MlZxraH4K8lT2zF1J7aUBdzB9/tBN17PHIvnSkHC49+XaKY+gpM/dtzsqEikUfJQu7cC8dXXzHK0osjl6fCM8R1wsGT/jb3rpKUaLvh1GYZwA5gSebzJ9Y8dCFLG/7PXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915805; c=relaxed/simple;
	bh=Nf2wf3qMn6tzQprqjU6H7ip5gfOvrqTHOJ8LaxQbIdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVEvPay3UaBFNUJf7QMRtnJR8joDcfMEmvpJjt1BDFO4r7Kt4afOopFtIvnRys88LhtVt1mZtRVCUwlLHZr9ZIOzxpByd2k4pu/fDhDEzu/YOzrZbfC91aQW702QYcSeg+b/JexlJMpRZOZJAI9akJaEJV4pPe3YBp5/PPOB0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=acEXFbfR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="acEXFbfR"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIK0c494365;
	Wed, 1 Jul 2026 14:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6RNfaMMJUOhEx4GxW
	k3j8Zh6MUmBqR6JKsTEp1dTd58=; b=acEXFbfR7QMHEQkgD2fNEJD9+YLUDXxyG
	aCwAGZwMC4SljNIalIgtKQzpvaq0KngGljQLKaix9IW5r95jK00t7DPFBD8LmnpT
	puvQebdatDa5z+XiRuvGqC25bBJtZeBtn0BOCJLvjuRTT5HfVncPOgbvYAU8G4zF
	FzbgiAR+jhQah3UAoSa7mObO0wN/ZWo7FkMduaQVfydM9HAmfelg79aR2qr0dA2Z
	TmPLdzEmdR+bYArpsxwWzxT9l7WyJJ29ZsVQLluKhU0RsDpFtlH3irnsPlzP/POu
	x4CgQmXUkqZRw8ip/Vh19tgbqGW9TUrVy3CBntYXSzZzN64nMJHvg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26rf4hh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJb9t010057;
	Wed, 1 Jul 2026 14:22:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhyfdh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EMABI46924182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:22:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 099FE20049;
	Wed,  1 Jul 2026 14:22:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E472220040;
	Wed,  1 Jul 2026 14:21:56 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:21:56 +0000 (GMT)
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
Subject: [PATCH v6 21/23] virt/steal_monitor: Add direction control
Date: Wed,  1 Jul 2026 19:46:52 +0530
Message-ID: <20260701141654.500125-22-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a452297 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=_v5trmpiMvKuf-VRmTkA:9
X-Proofpoint-ORIG-GUID: v023rTD_snh8wzQFuuprIZgRx5V0sDuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX25Osvz64kISd
 isK8aKtX/7lhNX1u/jBVAEOGPeXFF6f8OklmoE76XzI7QJBxt4gIMsghI2AeVCWE8umGehWB+KO
 wrZUdLVIQPGFBdnJ7ZGFoXUJ+WIkhD1AuwSaprqM/YQRnhoBbevpKbcRsaxZCOiHHRNXCc9CaqW
 hKlGgBuLRp1IPTm3jlxjdLGS++XjjzCyGEKw7OoGXaV7p1DPR9o5eSSdiun/kljobRzON95XR9O
 5/yJVmA5LS51dCPMBhzFMOHpisq5v/zN+8+GDWAOeTi/FUI2q/AbWmCEtgfB/O6/3IdfbpQ4B+1
 SHtpyjbJoA1ied6l2eifVNUSmHJNxh4lk296HfpivY3RVnsfsAcUl8maeEfNBdI3F2/n/SvYmFL
 A57rxzq2A6lmP7OJ+vrc32VvannLM7RWJg/bfp+xMD8JfD0HkqQDEJYVRSTRPDAuBUjDrkFtTYR
 NUnj2OSR3u49QNLugcQ==
X-Proofpoint-GUID: 1NO0sV_M21SWjFDo9JgXd-JxcfrK_-R8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfXzGxs+6DTEpRx
 2pIYeUDdGWSFrqFMInyN6Pk0JbMw/o+CoTc15+MQOWXcw3CiYFGxIQoOsBzkmj5d+mIZX3Dn9nz
 DXxLzw/mguQcoXgyxT1vNr6PmdxdsfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Cache the previous direction on steal time. So two consecutive values of
high values or low values are taken for decrease/increase of preferred
CPUs. This helps to avoid oscillations.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 drivers/virt/steal_monitor/sm_core.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 7b7435f79b85..4810bad96818 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -20,6 +20,12 @@ struct steal_monitor sm_core_ctx = {
 	.low_threshold = 200,	/* 2% */
 };
 
+enum sm_direction {
+	SM_DIR_INCREASE = -1,
+	SM_DIR_NONE	=  0,
+	SM_DIR_DECREASE	=  1,
+};
+
 module_param_named(interval_ms, sm_core_ctx.interval_ms, uint, 0644);
 MODULE_PARM_DESC(interval_ms,
 		 "Sampling frequency for steal values in milliseconds (default: 1000)");
@@ -59,12 +65,22 @@ static void compute_preferred_cpus_work(struct work_struct *work)
 
 	steal_ratio = div64_u64(delta_steal, delta_ns);
 	/* If the steal time values are high, reduce preferred CPUs */
-	if (steal_ratio > sm_core_ctx.high_threshold)
+	if (sm_core_ctx.prev_direction == SM_DIR_DECREASE &&
+	    steal_ratio > sm_core_ctx.high_threshold)
 		decrease_preferred_cpus(&sm_core_ctx);
 	/* If the steal time values are low, increase preferred CPUs */
-	if (steal_ratio <= sm_core_ctx.low_threshold)
+	if (sm_core_ctx.prev_direction == SM_DIR_INCREASE &&
+	    steal_ratio <= sm_core_ctx.low_threshold)
 		increase_preferred_cpus(&sm_core_ctx);
 
+	/* mark the direction. This helps to avoid ping-pongs */
+	if (steal_ratio > sm_core_ctx.high_threshold)
+		sm_core_ctx.prev_direction = SM_DIR_DECREASE;
+	else if (steal_ratio <= sm_core_ctx.low_threshold)
+		sm_core_ctx.prev_direction = SM_DIR_INCREASE;
+	else
+		sm_core_ctx.prev_direction = SM_DIR_NONE;
+
 	/* At least one core is kept as preferred */
 	WARN_ON(cpumask_empty(cpu_preferred_mask));
 
-- 
2.47.3

