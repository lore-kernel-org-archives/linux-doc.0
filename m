Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEED33ADA0;
	Wed,  1 Jul 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915780; cv=none; b=juXp3XegGNNTtL/4J5xw1EWrZnUrKRgW8rT5/cuAVQDJABDXRNerKfVVX2DhPlKWd2ndFDfhh2YISoLVOnTRH7PQ88fj/eq9SuBHs+3rxYRlh1Ga4LeHmthBuYuNO4EJEZh9qI55qUtPHBZmzCCKHyWlCsWLmxS8ko+53LHdAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915780; c=relaxed/simple;
	bh=iWDTnrLQ0NxjQJ0i1mCESAut3Tji5wSVWZNE9A9j6oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9CwecO3eghMmaI2fusTVxszXmjDOQ7LDfK+4b2g9xOzHTmeLPzeBJToKSY5WHioGeCcFQO0iNdAyhd1MGJTMms6gs+81h3fvoW53CemIwDe+obaa8xNKYVIeMZaiIjxHIHXsxDFxCTGFEyy+Moxq4YZoo7UViKRv/U/3wY1BTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LeqJzbxT; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LeqJzbxT"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIT6W446525;
	Wed, 1 Jul 2026 14:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VyBv4T/zaZuRiVQQf
	rWokSYoMx2ZRuJ3MdV2xuD3ABE=; b=LeqJzbxTnstiUnXprodWIYO7SRYXnkoeu
	Wn7a6UkEqDwoY7ukOe72JloeefHZOx4ZP5z6m/OaPIwJzCL42mUc26fUzI+PmA2U
	7ftzk8DaA9ir/JI9ZTz/83DFy4PUNqJzpHwvCbVAL/cVLuJpXtxO4s95vl5HgSOD
	0TU4FlafjcwUiFngmLFfTuBU/H2RRU6rYxZfNgKaSHEGYrNhR7NdTkj7FtJq0oQD
	A8vzDUMS4XkMEYQedsXGgkR032vd6Zdbn+1D9+T5aFapkideQHvK2RKdXfscz1x3
	pigsXl2vfh8o5ZIyu7EP1Qa4SirECLbhlnrpLbJWx8HLI9eD5ZcPQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26mjvn92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJcAW004393;
	Wed, 1 Jul 2026 14:22:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2s7w7r7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EMb0X50528688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:22:37 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BE7720049;
	Wed,  1 Jul 2026 14:22:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20D8620040;
	Wed,  1 Jul 2026 14:22:24 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:22:23 +0000 (GMT)
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
Subject: [PATCH v6 23/23] virt/steal_monitor: Optimise decrease_preferred_cpus when all CPUs are housekeeping
Date: Wed,  1 Jul 2026 19:46:54 +0530
Message-ID: <20260701141654.500125-24-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX4YRc5h2G1V64
 fNo57rh2dWmvL3iOudHU5J/osGt/srW3ApZWIKjfBbmhgwp0fA0rWVel4pW3IyB6cta9k/kIasW
 gxB4FbQ67qQozUpcCBhjzpxPiVH4Z2cgaH/jCHrThzUJR0PIHU/FAUJaFCLsGHjikNiEEHlg6J+
 0XoBlkQs6aBSQMzCTaemWpLB4uZH2HE8bUxx/BEqE6+zLTh/yiaGuJf9SdmAipw/Jr9g7CBIbTt
 vWWHbq789icKNc3yTTqR/aQv+Li+5MRY+dumqTs0noDVlvD7N+CQaf3j6/ZztEco7/unZP60YnK
 +5UFAViza+Adun9yh7QDN52chk3hF+Gd0ZKy9meV3+5Hvk8rP0MYGP00w7OPvzf4ZoaYfn/ew+W
 BbBvY/iNTr84mc9/wajtLDgEjThnUB+xOu8UwpShtlRzjcu4ttpkYyUY/8bz78u29QErve6nB/M
 C2E005XP8XiWI1ZJtfQ==
X-Proofpoint-GUID: W00b64-U3U7z2oewd2Q8QsNxlhbgMnU4
X-Authority-Analysis: v=2.4 cv=Z8bc2nRA c=1 sm=1 tr=0 ts=6a4522b2 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=pxxH2g41VrjVBjaCuYAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX/FJxATNTE7FZ
 jIzOqBn7MJ6dEvxxN2E7lRPQtQFiOE+M2GSZwRm60PcF3owoaxL7cal+77C21id2uFhdUjmE3Xt
 HDn0rtAwBR4d6mLQ6Oi+Vf2hajgT58A=
X-Proofpoint-ORIG-GUID: FZxN_t2Nm65kYHmkBt0fgraPpZaL5rh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

In most of the configurations one wouldn't specify nohz_full= or
isolated= option. That makes all CPU are part of housekeeping domain.

Since decrease_preferred_cpus aims to find the last CPU which
doesn't belong to the first housekeeping core, that could be optimized
when all CPUs are housekeeping cores. Simply look at last CPU in
the preferred mask and check if it is housekeeping core or not.

Time taken for decrease_preferred_cpus on 480 CPU (60 Cores, SMT8):
Without optimization:  around 6us.
With optimization:  around 3us.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Optimize for the common case where nohz_full=<empty>

 drivers/virt/steal_monitor/defaults.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
index 70dcfb1ce4cb..5206a5f7af48 100644
--- a/drivers/virt/steal_monitor/defaults.c
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -53,7 +53,7 @@ unsigned int __weak get_num_cpus_steal_ratio(void)
 
 void __weak decrease_preferred_cpus(struct steal_monitor *ctx)
 {
-	int tmp_cpu, first_hk_cpu;
+	int tmp_cpu, first_hk_cpu, last_cpu;
 	const struct cpumask *first_hk_core;
 	int target_cpu = nr_cpu_ids;
 
@@ -62,14 +62,30 @@ void __weak decrease_preferred_cpus(struct steal_monitor *ctx)
 	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
 					 cpu_active_mask);
 
-	if (first_hk_cpu >= nr_cpu_ids)
+	last_cpu = cpumask_last(cpu_preferred_mask);
+
+	if (first_hk_cpu >= nr_cpu_ids || last_cpu >= nr_cpu_ids)
 		return;
 
 	first_hk_core = get_core_mask(first_hk_cpu);
 
-	/* Always leave first housekeeping core as preferred. */
-	for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
-		target_cpu = tmp_cpu;
+	/*
+	 * Always leave first housekeeping core as preferred.
+	 * In most configurations housekeeping core will be at beginning,
+	 * i.e there is no nohz_full= or isolcpus=.
+	 * Skip the loop in that case.
+	 */
+	if (!cpumask_test_cpu(last_cpu, first_hk_core)) {
+		target_cpu = last_cpu;
+	} else {
+		/*
+		 * Since one may specify nohz_full= for any set of CPUs,
+		 * Find the last CPU which doesn't belong to the
+		 * protected first housekeeping core.
+		 */
+		for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
+			target_cpu = tmp_cpu;
+	}
 
 	/* Only the first housekeeping core remains */
 	if (target_cpu >= nr_cpu_ids)
-- 
2.47.3

