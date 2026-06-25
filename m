Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D561862A;
	Thu, 25 Jun 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391841; cv=none; b=dOMtC9rU79UZieM6Ic3+XdJlSti7pzsld63138cYfDqopQPbPlP42BnzjzWU2RbS4W6O9ipXtik3rc1ORceXPfeOEJyO9vNAjYs0Ruu+jT/r5f4ZpjBompDh6cqApTNHtuivlnk2pp+cP6eTtH8+YABNYuoVC1d1gPk0bNkhLtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391841; c=relaxed/simple;
	bh=cERPu6ze89w/o2h8WPAkzp0R/j4fnrExKG7wP+TzPxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bA0WwD4Cv0uH5t98ALN6+Oxlhm73qoq0ad9m3DF1rAcveI3Qn6wn6/9PpPHnWvVf1XCbkNVo+yXpEhF2fCnXNQL/jDXk/QjmnRN9NczmIW1wf/87RbUOB6nhBJiS12/pESQ5hIgNEqwH4U7cQ/Bn/ls+LhgUEIGbAoIqZdzYuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WnAw0CHq; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WnAw0CHq"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mXPJ3185845;
	Thu, 25 Jun 2026 12:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Tk2rFk1o+eMGmjCn8
	/+7LkU/D3+740RvAC51rL4SsXY=; b=WnAw0CHqoVZqd1QeN8gmZjATr6eh+p06N
	ayomjxXQ4owcIVN/n8NXmcwFAeGZQTlO1B5C/xaWRXKrvh4x/I/VSq2k+tyFl5Ku
	cEOwKh1BrzHP64VGZXk1SllbgblSRxJrFPqlZfUJWxeLGbxoKjsHDQ4SoLsFrdNr
	vo4CN9ldFC2K00fMSYK4E96Y1DesV58SkkoH9A2dme0SOibvzXLwElaOZsShjPgf
	80LX1ONDw1bBYXSxzdYnUBEwJBe7pjyDrTUWeh8W6reHJYiQpdChKgZgHGQ21GuM
	MZgBEjFH2gajSXHg2aMXLOfJmZI1bBdB6m/Ybsiwj2kOETAdJfdUA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjhr1pd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCndu7003714;
	Thu, 25 Jun 2026 12:50:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex56qpckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCoGVJ31195752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:50:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 356C22004B;
	Thu, 25 Jun 2026 12:50:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68FFA20040;
	Thu, 25 Jun 2026 12:50:08 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:50:08 +0000 (GMT)
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
Subject: [PATCH v5 23/24] virt/steal_monitor: Add direction control
Date: Thu, 25 Jun 2026 18:16:47 +0530
Message-ID: <20260625124648.802832-24-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=I4VVgtgg c=1 sm=1 tr=0 ts=6a3d240d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=_v5trmpiMvKuf-VRmTkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX88UP6UZBA3ac
 pW4fQSAQQEDw0O5eL7aoqznPDvnsQ8Qq2d7B6iovcR4RddtQHgYWAiO2a66QbeXfKYSqbA8qvKU
 RFRLJjzzDycHuQMviQuHZumJpEEn0SJULhTpgM1Zsicm1xHeo9WBuMlJWDeFcD55ubFg+X2npGj
 NOb5C7sr6HfNizfga5scW3yw7MkFelCA8NDHZIZTex3/VjVZQhfVhRkLjIofCWIfq1vZMtL9J2U
 DAZQdslH92PbPucA4ddIE0LjHUVaKsQpg/sb07esgHNZP6OgF/OXbPlaFA11PbrhppE0rLeU1eR
 awphWaPM3QcCDxj8pscdBGTg0irRGZIls1h9nyS9fA8AU1gH+cvJ9wKXUPIrNf2Dd487xOulSq3
 SPDYtjD7pMojWSwncMRswqjX5C44IyjwTRgv4HhHgqzSWOOFqQPmNEo6eTBjiH7FLV2qHFhWBUU
 w0hF0nMWSnXbm8eUphw==
X-Proofpoint-GUID: 6J1t5O95YluinG2Wov_cFclKF4qPH1X2
X-Proofpoint-ORIG-GUID: b6hq1s2QPDsWr-SSas7qRvhw9MyTb31j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX4yI+FcRMbvL5
 lnc++kJspZlQckoOQXLPoTbqWHhdjgcBGXmAQU3eQtUGmuQ6lv9WzU78FX+R4d7t53SulZyeSxF
 kopf1irtSxNs90+SJyKR8/kYDx8I398=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250110

Cache the previous direction on steal time. So two consecutive values of
high values or low values are taken for decrease/increase of preferred
CPUs. This helps to avoid oscillations.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/sm_core.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 641488a5a3b5..f5b0e568eb32 100644
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
@@ -54,13 +60,23 @@ static void compute_preferred_cpus_work(struct work_struct *work)
 		      (delta_ns * get_num_cpus_steal_ratio());
 
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

