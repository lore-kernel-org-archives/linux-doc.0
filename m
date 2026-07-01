Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DAF349CF0;
	Wed,  1 Jul 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915528; cv=none; b=TKFDCjSqTt9+iIQrEYD4bdjQi9Ryi9v5ZaUHLUAlSbjtcUygorcm42kyu0G/XeL3rrRFKp1ege+aS8i6knaehkWD5KruWH/ii3eRF75ddRTABxu7C5gVuQeISv+9ESAbo5EiUOLlcPKnCbD6yWUz5UOEIGiMff+r5TMoBWmIP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915528; c=relaxed/simple;
	bh=Pn/LJCe0cf9qMjbk6+chiIS+WdsTTMV1cwia7gDB4oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laOP+Mj4qAjtpVNOY0nD8hAYu66aycjoEBZ1baN/u0E3x5L5jhkuIGYtqsmhYREZDCaw5GT/0IUbRr82Ds2ev43sCNJxjYS0G54h6GQBI1YepbNIB9armnVx8ioy//AGZndSQoHen+CONYMf7g35ten05BZTrVDy6+sYUDMkPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SiR5OtF8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SiR5OtF8"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AISoS609490;
	Wed, 1 Jul 2026 14:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=KwqK2QT0ev56nKvPd
	Da9Th+Anwc2Bd1sxtQ80H19Ep0=; b=SiR5OtF8ySlQj3na25eGGCXkUwli08W9J
	UMX9Zep5nNp5avNxEBINk/MIScYVYYLixlS91oQ1c0RO1iYH6rELYZq5+tVvb7Zk
	PTyDOQVPEoBp/vzPX1oDjkWhrJz2pABp1xO0bW2zV9lgcu290tzjD8Bjv9tpz0tA
	LJyv2Ob5rYM2VGsT8QGTdyMH832hzPkPWXl0BUiDao7fe8CRdOwZvdWZ190J5asp
	galQARn8gvqMOkb6N0OWQLJ1MStUzvY1vtTrR22NU9huORPCGaXjDC3u+N1298xW
	+atWG24EoHbOrDORlMevKsSX+DZ4JJg9ChlkvgtBpe/55bPM0fesA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe5039-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4bYE012713;
	Wed, 1 Jul 2026 14:18:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfu78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EIOJM60031284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:18:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA08E20049;
	Wed,  1 Jul 2026 14:18:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D35A820040;
	Wed,  1 Jul 2026 14:18:10 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:18:10 +0000 (GMT)
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
Subject: [PATCH v6 05/23] sched/core: Try to use a preferred CPU in is_cpu_allowed
Date: Wed,  1 Jul 2026 19:46:36 +0530
Message-ID: <20260701141654.500125-6-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: RYo0NIPxYptNF_ScXOobapsvongkzO_5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX7xcMt39IhG6v
 /Zhu8v3hUcb3L8HQp7pDUvZ8Ye3bYOp3sNgGTxf686LwCOniM3NFEI0pKENTB/jetdiX+htWK9O
 kBZm5pDFdjF0FRAp7dTX+j/0fgCTnVA=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a4521b5 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=SercB68a9auuIbaRS8IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX2xDjRUXAmRXX
 0xsK2O468nrMa7yggma45Qw8PaAR8UmtaC//a6bIdoFiYeFxM7EhPBrA/48R6nKBbLCyYSWKw3m
 WAcbqMZIL565Qt9ebTEDp8t5kjvZcOkUKVVVJEZe4o+xHx2Xu3RvtGObPo8vqEj73I3IyE/1zmA
 NGIvfdtLeSHyZfuIZA1u06JENqmvs9XBPuAAUXrUP0Z+rFKVFcJUt5U8y11NS/OHVI8InhtV1aQ
 YDfdZxzWIQg0mgGAox1w0uX4doZpmfYlNobDS26nf7TV13f3USVBvotx96v1Ms1v/RrVEvSsrDY
 C+/cv2RPnF7N6O8FvA/7tka/hi9VqQizgRYwvwAoNj5tJuRqpHRkMMIeyQJOcI4oMABnkTefGDq
 sUO/GDseEXxvIvQTIBgqjHs8ftxeNgtyuFBwIb8kC3OLUzFJp6exJRhdnU2t8Au26hdD29uyd3p
 DPYc5bPY1Ir+os5Uh5A==
X-Proofpoint-ORIG-GUID: cjkyg1jiv5K0rwtFcmBcF9dnZ8QifspV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

When possible, choose a preferred CPUs to pick.

Push task mechanism uses stopper thread which going to call
select_fallback_rq and use this mechanism to pick only a preferred CPU.

When task is affined only to non-preferred CPUs it should continue to
run there. Detect that by checking if cpus_ptr and cpu_preferred_mask
intersect or not.

This takes care of wakeup path optimization for FAIR tasks.
is_cpu_allowed is called to ensure wakeup happens on preferred CPUs.
With that, additional checks in available_idle_cpu is not necessary.

Add a comment on rare case of O(N**2) in select_fallback_rq.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Drop optimization for select_fallback_rq
- Keep comment on N**2

 kernel/sched/core.c  | 29 ++++++++++++++++++++++++++++-
 kernel/sched/sched.h |  9 +++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a45f7c308329..1fb1c17e8387 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2500,6 +2500,8 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
  */
 static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 {
+	bool task_has_preferred_cpu;
+
 	/* When not in the task's cpumask, no point in looking further. */
 	if (!task_allowed_on_cpu(p, cpu))
 		return false;
@@ -2508,9 +2510,30 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (is_migration_disabled(p))
 		return cpu_online(cpu);
 
+	/*
+	 * This is essential to maintain user affinities when preferred
+	 * CPUs change. A task pinned on non-preferred CPU should continue
+	 * to run there, since this is non-user triggered.
+	 *
+	 * If CPU is non-preferred and task can run on other CPUs which are
+	 * currently preferred, then choose those other CPUs instead.
+	 * Overhead is minimal when CPU is preferred.
+	 *
+	 * For majority of the cases this would still keep select_fallback_rq
+	 * as O(N). task_has_preferred_cpus which is O(N) is called only if
+	 * !cpu_preferred. Then task running there is expected to move out.
+	 * So subsequent it should run on preferred CPU. This becomes O(N**2)
+	 * only for tasks pinned only non preferred CPUs. That is rare case.
+	 */
+	task_has_preferred_cpu = !cpu_preferred(cpu) &&
+				 task_has_preferred_cpus(p);
+
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
+	if (!(p->flags & PF_KTHREAD)) {
+		if (task_has_preferred_cpu)
+			return false;
 		return cpu_active(cpu);
+	}
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2520,6 +2543,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* Try on preferred CPU first if possible*/
+	if (task_has_preferred_cpu)
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 26ae13c86b69..36ae20310891 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4230,4 +4230,13 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
 
 #include "ext/ext.h"
 
+static inline bool task_has_preferred_cpus(struct task_struct *p)
+{
+	/* Only FAIR tasks honor preferred CPU state */
+	if (unlikely(p->sched_class != &fair_sched_class))
+		return false;
+
+	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
+}
+
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.47.3

