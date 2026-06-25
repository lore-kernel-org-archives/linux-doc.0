Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63C3E274B;
	Thu, 25 Jun 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391702; cv=none; b=ASxR3Kk4QjDBZd7CN6onHVd44HRs/xMS2PrUSSwNgmZhBXmUZKEsg8iWjdkbZC/ks+UUC+CQccmrshJVoRb+GulXCwZxD+aWqYK0/n23Nr7BstRKVAqZXKefZYkSKSEAbTEtUrxzA3xLTggWQa9rAd9Fw28zn3/r+DA61MgaiBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391702; c=relaxed/simple;
	bh=UNeCi7QZD31lH2g2sYZvWXFVPZRZutRFR+7KqPrxmEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaCW29wKfUYI2ct3sFOPI5fwz7Y0COHSp8XRozBviEMKgYBGGUMN4vMJ5FpVUVn7Op+o2qrpS8A4nmdoE37iiuRAXfBQ2SU/G9PUSAUz/xQGxq3zn3XMd+cinXjEd7oLQRAM2AHHnWuI9kRGb+Jo4IbexsFujzMu0QPLeoWJKTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=T57EqHSW; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="T57EqHSW"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3no9h3188171;
	Thu, 25 Jun 2026 12:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=J8afneCwb2Xf5RBZA
	NbeycLIGjwxY9hxPrgMo+nm7W4=; b=T57EqHSWD4DncIpMGnbldVj29eD8p0pCo
	6pBXwyqcuWvkAeLckBd3UGZn8MX+AC99T8DIpkEW//0AG3TtnPruRl52ovUPGkX7
	GP5MCp61Yt3J9+FcNVL4km4aXwI9ip/bCmGfqlSiow21A7HamiK056DphK1R8cBW
	71CwHBMrc2JqO+p3KCt1SI9tIWNj1aG0/9gHn4ntkYj4B4+ficfwbtbjsL5fViSt
	42J2kY1THBnkfKW/nJXa3m8LAEnJqduwseBqPvzJBtIbq7rFlVrS6w2S5TD0D8DC
	EIEiGcHrom4ClAeNhkJlCfUYvFSXzSShm42uiiLU3VWHBDDdlOwCA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjhr1p50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYfQP014984;
	Thu, 25 Jun 2026 12:47:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66ke5q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PClt6G30605762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66BF820040;
	Thu, 25 Jun 2026 12:47:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FDF120043;
	Thu, 25 Jun 2026 12:47:47 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:47 +0000 (GMT)
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
Subject: [PATCH v5 06/24] sched/core: allow only preferred CPUs in is_cpu_allowed
Date: Thu, 25 Jun 2026 18:16:30 +0530
Message-ID: <20260625124648.802832-7-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=I4VVgtgg c=1 sm=1 tr=0 ts=6a3d2381 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=tJ8O8MnmjKt8Gn2Ac3kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX74l0DpHqX2D1
 Pou4d+HWbYD68kt1+/fHLkh2GyAC2oX0ZgCJdX11aAq1QIAuK8/kCHlYbMGc2s8fRB7xOZvPYfZ
 wqxmR1OimJjl4M8vu5PzNS3furVyPhTMNgImKTqDEd4Zf2AKYzPUvffyYWgzbJfT262VZtqIGaC
 2JmIlwdFCGrADnngh/IQVhTHZke/MEYl5TbAuyO+iFFVdOl2V1Or8PiurDFQSXL6qXqIxcp3nWN
 OCmj4/VPoxn5LTExet5EjB/yy+5NT6nxEXTHYn8Uy2q8mb8u66O4OtJ1SDlgUc7OMaJFAEJLYXv
 63bLzF/VOSS9DiEUDOKYZAa8A2ECFP2TSFnILnEyQHQT/45jyvRRd5HwxZ+eyWDO5t//DfHSoxR
 uwMN4OPJ6PFpGU6OSgg+UTvhL0TqG6MnttozM40b+DfqAT5kTwrKAVCcJCooz/heYrgpPbR71Ig
 39NfGXlk++ZywZ+ZHQA==
X-Proofpoint-GUID: nP92BTsie5ee7EJnAgrR-U8QZKE7UOP_
X-Proofpoint-ORIG-GUID: ACNlAgIdTq8ZWbnkgi1R9xn2nviQ65AH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX7AuZRh2KJXa8
 NXBWCtumGZbFAN0kt1rw4V0dlhY5M7NL2hxK6GeW8zmTQJ1ePOYaeAnqfmbogFR2vKuByM7KlIn
 1DZ0TSybEgBmiyuFvWeZnQyjqxuh+gY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250106

When possible, choose a preferred CPUs to pick.

Push task mechanism uses stopper thread which going to call
select_fallback_rq and use this mechanism to pick only a preferred CPU.

When task is affined only to non-preferred CPUs it should continue to
run there. Detect that by checking if cpus_ptr and cpu_preferred_mask
intersect or not.

Since is_cpu_allowed can be called directly or repeatedly in
select_fallback_rq, encode the info in task_struct->has_preferred_cpu_state
if the path is via select_fallback_rq or not.
This helps to avoid N**2 complexity for the rare cases.

Additional overhead of O(N) comes to is_cpu_allowed only when cpu is not
preferred. So in normal scenarios overhead is only a bit check.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Do simple encoding of -1,0,1 instead (K Prateek Nayak)
- Make it s8 (K Prateek Nayak)
- Update changelog to address sashiko concerns of overhead.

 include/linux/sched.h |  1 +
 kernel/sched/core.c   | 35 +++++++++++++++++++++++++++++++++--
 kernel/sched/sched.h  | 25 +++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index fc6ecb3869dd..27dbf676113e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1657,6 +1657,7 @@ struct task_struct {
 #ifdef CONFIG_UNWIND_USER
 	struct unwind_task_info		unwind_info;
 #endif
+	s8				has_preferred_cpu_state;
 
 	/* CPU-specific state of this task: */
 	struct thread_struct		thread;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9e16946c9d62..281715a6e88f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2500,6 +2500,8 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
  */
 static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 {
+	bool task_check_preferred_cpu;
+
 	/* When not in the task's cpumask, no point in looking further. */
 	if (!task_allowed_on_cpu(p, cpu))
 		return false;
@@ -2508,9 +2510,23 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
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
+	 */
+	task_check_preferred_cpu = !cpu_preferred(cpu) && task_has_preferred_cpus(p);
+
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
+	if (!(p->flags & PF_KTHREAD)) {
+		if (task_check_preferred_cpu)
+			return false;
 		return cpu_active(cpu);
+	}
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2520,6 +2536,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* Try on preferred CPU first if possible*/
+	if (task_check_preferred_cpu)
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
@@ -3549,6 +3569,14 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 	enum { cpuset, possible, fail } state = cpuset;
 	int dest_cpu;
 
+	/*
+	 * Cache the value whether task's affinity spans preferred CPUs.
+	 * This helps to avoid repeating the same for each CPU
+	 * later in the loop. Encode call to is_cpu_allowed coming
+	 * via select_fallback_rq.
+	 */
+	p->has_preferred_cpu_state = task_has_preferred_cpus(p) ? 1 : -1;
+
 	/*
 	 * If the node that the CPU is on has been offlined, cpu_to_node()
 	 * will return -1. There is no CPU on the node, and we should
@@ -3560,7 +3588,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 		/* Look for allowed, online CPU in same node. */
 		for_each_cpu(dest_cpu, nodemask) {
 			if (is_cpu_allowed(p, dest_cpu))
-				return dest_cpu;
+				goto clear_and_return;
 		}
 	}
 
@@ -3604,6 +3632,8 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 		}
 	}
 
+clear_and_return:
+	p->has_preferred_cpu_state = 0;
 	return dest_cpu;
 }
 
@@ -4612,6 +4642,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
 	init_numa_balancing(clone_flags, p);
 	p->wake_entry.u_flags = CSD_TYPE_TTWU;
 	p->migration_pending = NULL;
+	p->has_preferred_cpu_state = 0;
 	init_sched_mm(p);
 }
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c7c2dea65edd..5d009c2529b2 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4213,4 +4213,29 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
 
 #include "ext.h"
 
+/*
+ * has_preferred_cpu_state could have the value cached from
+ * select_fallback_rq. It is set/cleared while holding pi_lock
+ * and irq disabled.
+ *
+ *  1: Cached and preferred CPUs exists in task's affinity.
+ *  0: Not cached and need to evaluate.
+ * -1: Cached and preferred CPU doesn't exits task's affinity
+ *
+ * Only affects FAIR task.
+ */
+static inline bool task_has_preferred_cpus(struct task_struct *p)
+{
+	int cached;
+
+	/* Only FAIR tasks honor preferred CPU state */
+	if (unlikely(p->sched_class != &fair_sched_class))
+		return false;
+
+	cached = READ_ONCE(p->has_preferred_cpu_state);
+	if (cached)
+		return cached > 0;
+	else
+		return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
+}
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.47.3

