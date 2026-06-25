Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AF3E44F9;
	Thu, 25 Jun 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391830; cv=none; b=C+szTmJcrk4GTWhbaex4sm7gW36kzdbrT2BHZhXeqMKd5q4eoGqGN6P1lxZ1E/vDj45pJTRDgo88mBtMc8IZW6Dq3YQFqdpSQHwwC56aak/8jdB7vD0/oIS8x+by7U8x0UUZ9sSofIuxAlEbEZkud9T3KZsT+Pt2Gy2q82WVQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391830; c=relaxed/simple;
	bh=7qyHDspLrfesIY8O/pMwoHebG/Eu5tBqz8iPVUvhnBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pP4VDLcfRVhQ8mX8i+cnIxPXBTtVPP5qa8skOKmGZ7Ug1S0BMBGxMcKnl2QCjqJjMw+ivpsoIuTUABfmrgTZxQlPQuspGF/MymcBxIOAkJ0oXRePVO9dMtE8Py2jicSNJveoUffWrMFAIS/9qGiqk1C9oTnsL8wE+BpYclt6OuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WgaFCTmn; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WgaFCTmn"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3n11T2927727;
	Thu, 25 Jun 2026 12:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=S/u00zeA9Tecch/UG
	LiMwZ5mo9pt5HfxHL4rGN8L8wU=; b=WgaFCTmnbVG1/Kvz8UN74qmHmU3nxRrxg
	lvxoYrjV36JFkSD4wXgbGY9JqA8NYPkjzGIFyT9AegyuOZqC2Gl9sLUBxOl85U2m
	7yhthH2M4xzsq5E6+Ss/XqES740QSjVJPgiBwNZcgHm9uRjLTRIKXEyNhe4PS1dj
	fwTypVquHqaBHJ4PeYCzSNYknpi+puhV9Y7Dw+rcUrPjdPcXdCz0lsBOLgLB6ejc
	1/tt4M0ASKRergOZV8lcyT8fs3KN/yrwHqPTcftVaxReH4n2HSgiEJfCtwMC1NVO
	jhMEQxBsSnjbtjJOKDgpWSO4r/WWnkZXMmybL595ILT2gsufMdDHg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCnfPM029496;
	Thu, 25 Jun 2026 12:50:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex5jwp9tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCo8Mm49545500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:50:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFB4920043;
	Thu, 25 Jun 2026 12:50:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5346320040;
	Thu, 25 Jun 2026 12:50:00 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:50:00 +0000 (GMT)
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
Subject: [PATCH v5 22/24] virt/steal_monitor: Act on steal values at regular intervals
Date: Thu, 25 Jun 2026 18:16:46 +0530
Message-ID: <20260625124648.802832-23-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 6WvYsFH6SEFWoTJJJaoxu7yd6zALtNcl
X-Proofpoint-GUID: I9NIemXf19NNtTB5J0LYndKLtfiIVcwc
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d2405 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=FaF7mGpESULvgM3RsB4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX5ylpFu0o/hVA
 KqOSfIYH6aVxqKORWS8glgVej18GszGgr6a0s8TyT/jVHW+AFjoTqGf4304f0zHge4W2IzSIX3g
 eO7g5RrgCgcf2sXFJtoVKnmPDSMhMF2rUmBycWpWDgCvY3i7gqwBu7XI7uWJ0IhOU+VYlJ4jIvc
 g6ZXlWz0Au5sX4XPRYWmaaji9ehYH6brMzvnm+cOYFKsqjJIZz3atPFPRitfhHe+kRkH0DqqdlJ
 RqDOYBuNK8tdQ3+G3F25+azV+Cgb1VL1IwxBnoH4Jt3zB/895JfV07EhiqzoaHYWWuFci15ycPB
 bnDZClHa2I1kvkKpY31QheecobNeAtjSMvd8jpx3lwF04zPcCEbtbY+H7IdfSjS02HO2hB+oLFs
 BIQ8w9TFca9wol+OdGyMFhjcUNjD1TDDXkhF+RtJ4ajWPZZvYdbiqddJuyGrBpIUwtMghMpZ6j9
 3Mm8d15J0kECNWloVHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXw6LyVds0n8ob
 PVdLLu3EVVH69umL3WjxY6BhTb2SyfayPTGwCSJrbNq5Vav6zzf4XT3lRA6GAPbBpas/OHBPanH
 HyUpnjOwZh0IFW4GELrilxqsPYqaZ9U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

This is the steal_monitor core functionality done in periodic work

- Calculate the steal_ratio. It is multiplied by 100 to consider the
  fractional values of steal time. I.e 10 means 0.1% steal time.
- If steal value is higher than high threshold, call the method to reduce
  the preferred CPUs.
- If steal value is lower or equal to low threshold, call the method to
  increase the preferred CPUs.
- If the steal value is in between, no action is taken.
- Save the values for next delta calculations.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/sm_core.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index fac8f4d5dac7..641488a5a3b5 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -34,6 +34,33 @@ MODULE_PARM_DESC(low_threshold,
 
 static void compute_preferred_cpus_work(struct work_struct *work)
 {
+	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
+	ktime_t now;
+
+	curr_steal = get_system_steal_time();
+	now = ktime_get();
+
+	/* get the deltas */
+	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
+		      curr_steal - sm_core_ctx.prev_steal : 0;
+	delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time)), 1);
+
+	/* Update for next calculation */
+	sm_core_ctx.prev_steal = curr_steal;
+	sm_core_ctx.prev_time = now;
+
+	/* Multiply by 100 to consider the fractional values of steal time */
+	steal_ratio = (delta_steal * 100 * 100) /
+		      (delta_ns * get_num_cpus_steal_ratio());
+
+	/* If the steal time values are high, reduce preferred CPUs */
+	if (steal_ratio > sm_core_ctx.high_threshold)
+		decrease_preferred_cpus(&sm_core_ctx);
+
+	/* If the steal time values are low, increase preferred CPUs */
+	if (steal_ratio <= sm_core_ctx.low_threshold)
+		increase_preferred_cpus(&sm_core_ctx);
+
 	/* At least one core is kept as preferred */
 	WARN_ON(cpumask_empty(cpu_preferred_mask));
 
@@ -54,6 +81,8 @@ static int __init steal_monitor_init(void)
 		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
 
 	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
+	sm_core_ctx.prev_steal = get_system_steal_time();
+	sm_core_ctx.prev_time = ktime_get();
 
 	schedule_delayed_work(&sm_core_ctx.work,
 			      msecs_to_jiffies(sm_core_ctx.interval_ms));
-- 
2.47.3

