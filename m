Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A5346795;
	Wed,  1 Jul 2026 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915569; cv=none; b=YfBgW9+++JPxhPMlezbDp+CnACThGcsCyDyOt1aZ0yIbPwoyAz75Ox7MarAYpG+UzqeDG4C+aAytg6FK8AJzvSLUV9Qb8mzg+hARBt4I2PynteZhJAsHL7SsDeHSopgglx87VcNqZliXoVOn10GJqTL1iLHci84dMdwjaenY/uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915569; c=relaxed/simple;
	bh=FjXnJsH0oRbxAOi0Ob/5IwGtWP16pNhXSYQ/kTSlxvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Px5TfEZ/UTowHTnb6p+T4LYmHSvhKjnKxaanxPWIabKpGXd1pYDitWgk0QlJJqeg7wyerdYKM9nJ6MrkO006Snjm+7Ypza3qhfxcZhiwiuGUw53OPVM6btmikbQXW88KxF93lphoGYamdix8q0MYTOelHicy6ICf8WtbTOKWhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SYgkrQPn; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SYgkrQPn"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AITpU551196;
	Wed, 1 Jul 2026 14:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=g1xTo8BUkzlnsY67W
	li70xxTHyHcc5kb7ULRW/bgwtc=; b=SYgkrQPn6aDEWeS7kf16EaWZNcxxy87I6
	RNTRFBdOExrsynMTICzmxkXTReynlK4M5Vu9+7+cjrwQUKLvmz02BdIT1q0aNajK
	T8TkkG0MtcqzbmdPppM7SZjCYjpPsTiiY7ExdreJEqB48g2WA4sxmwRPZJ8WlCMz
	b5UVvwi/kHukiMmB35IWa5D1WgOmXce5c8TUGKBZPjbVxWW4ElKEOidqL4VmbCH/
	4jgrTYC20a8EC3mq+T1aYsV4dkSbCTyha9bHrA09RAroRcpIVo8QsAVWulqZJTaj
	i5hloi9V0pMEahTQH5FPcdx3cjf8SNytr7il5yfYgTCm8EEP/djmw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5vy70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4gnh013591;
	Wed, 1 Jul 2026 14:19:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2suk7mt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EJKgR44106016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:19:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE84F2004D;
	Wed,  1 Jul 2026 14:19:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BAE220040;
	Wed,  1 Jul 2026 14:19:06 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:19:06 +0000 (GMT)
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
Subject: [PATCH v6 09/23] sched/core: Push current task from non preferred CPU
Date: Wed,  1 Jul 2026 19:46:40 +0530
Message-ID: <20260701141654.500125-10-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX1aaKIjPKOqVm
 hi9WWzzaHZovhRlyn8+xO049PUaK1kG8ldCj79xXwY+HtybyeiBWcrp6cbQkk1vTVMxA9hb6kcQ
 6x8Xw1McmvQyyGV5eM8+1AwcnY3Nw4K4g0TkChMHCqJcPM9+yaSfWqZ0bsXb8ZLNwavfnv6KKtt
 WQ1oHAj9KwrjMjU47SRNjYTKsqfgP+PpxFvH6ct+BrSIEmuGWpJ4mtHdsotKJR6yp7dynz/SAY3
 n9k4xvOOOGABwLo8fMEDDAmEDrIhQLC+volIjvD9PWpbKOo5SCRlMduuSoe56xH3UywdIKh4FlY
 tuEjzBLOfZpTXMJ5mfFGxQhKiJdPZI7/K0gcoL7oAJ2bPQjHTGAvf/oI+9CDH2fQOepUg7mEkUJ
 o4f+rFmq5GwQJD2v3US9WMQFH8oMasTrqm0WKwfATMSzbAUwAKAEMkQLPAkod5Y+NEKrD9EIBCM
 0VC6tMp4eMGoY90TYog==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a4521eb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=B96TaMBPDYXqJxwgLkMA:9
X-Proofpoint-ORIG-GUID: 985cEH-1rPPCJjVf0zwuNWpLRXV6gMAF
X-Proofpoint-GUID: BkC-4jVkSBL7OcvUMD8aa__XukQuhQ5_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX+wO9Q2qjFCJm
 aYOTut7/eJDtZKgtK7/TurJx4xAr6i5+E3LefLvv8s/sAuQ671xW/bvW64j/qSVXlHV/qtMNe+7
 XzkLof5Jl8jUsLqecKBuE1+TtSxCCOM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Actively push out task running on a non-preferred CPU. Since the task is
running on the CPU, need to stop the cpu and push the task out.
However, if the task is pinned only to non-preferred CPUs, it will continue
running there. This will help in maintaining the userspace affinities
unlike CPU hotplug or isolated cpusets.

Though code is similar to  __balance_push_cpu_stop and quite close to
push_cpu_stop, it is being kept separate as it provides a cleaner
implementation with CONFIG_PREFERRED_CPU.

Add push_task_work_done flag to protect work buffer.
Works only with FAIR class.

For now, only current running task is pushed out. This keeps the code
simpler. In future optimization maybe done to move all the queued
task on the rq.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c  | 87 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  8 ++++
 2 files changed, 95 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index aa4201bb8082..56905bac9525 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5797,6 +5797,9 @@ void sched_tick(void)
 	unsigned long hw_pressure;
 	u64 resched_latency;
 
+	if (!cpu_preferred(cpu))
+		sched_push_current_non_preferred_cpu(rq);
+
 	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
 		arch_scale_freq_tick();
 
@@ -11315,3 +11318,87 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+#ifdef CONFIG_PREFERRED_CPU
+/* npc - non preferred CPU */
+static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
+
+static int sched_non_preferred_cpu_push_stop(void *arg)
+{
+	struct task_struct *p = arg;
+	struct rq *rq = this_rq();
+	struct rq_flags rf;
+	int cpu;
+
+	/* sanity check and clear */
+	if (cpu_preferred(rq->cpu)) {
+		scoped_guard (rq_lock, rq)
+			rq->push_task_work_done = 0;
+		put_task_struct(p);
+		return 0;
+	}
+
+	raw_spin_lock_irq(&p->pi_lock);
+
+	/* This could take rq lock. So call it before rq lock is taken */
+	cpu = select_fallback_rq(rq->cpu, p);
+	rq_lock(rq, &rf);
+	rq->push_task_work_done = 0;
+	update_rq_clock(rq);
+
+	context_unsafe_alias(rq);
+
+	if (task_rq(p) == rq && task_on_rq_queued(p))
+		rq = __migrate_task(rq, &rf, p, cpu);
+
+	rq_unlock(rq, &rf);
+	raw_spin_unlock_irq(&p->pi_lock);
+	put_task_struct(p);
+
+	return 0;
+}
+
+/*
+ * Push the current task running on non-preferred CPU.
+ * Using this non preferred CPU will lead to more vCPU preemptions
+ * in the host. So it is better not to use this CPU.
+ *
+ * Since task is running, call a stopper to push the task out. This is
+ * similar to how task moves during hotplug. In select_fallback_rq a
+ * preferred CPU will be chosen and henceforth task shouldn't come back to
+ * this CPU again.
+ *
+ * Works for FAIR class only
+ *
+ * If task is affined only non-preferred CPUs, it can't be moved out
+ */
+void sched_push_current_non_preferred_cpu(struct rq *rq)
+{
+	struct task_struct *push_task = rq->curr;
+
+	/* Preferred feature works only for FAIR class */
+	if (push_task->sched_class != &fair_sched_class)
+		return;
+
+	if (kthread_is_per_cpu(push_task) ||
+	    is_migration_disabled(push_task))
+		return;
+
+	/* Don't push the task if it is affined only on non preferred CPUs */
+	if (!task_has_preferred_cpus(push_task))
+		return;
+
+	/* There is already a stopper thread for this. Dont race with it. */
+	if (rq->push_task_work_done == 1)
+		return;
+
+	/* sched_tick runs with interrupts disabled. */
+	get_task_struct(push_task);
+
+	scoped_guard (rq_lock, rq)
+		rq->push_task_work_done = 1;
+
+	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
+			    push_task, this_cpu_ptr(&npc_push_task_work));
+}
+#endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 36ae20310891..711fc8bd7ebc 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1277,6 +1277,8 @@ struct rq {
 
 	struct list_head cfs_tasks;
 
+	bool			push_task_work_done;
+
 	struct sched_avg	avg_rt;
 	struct sched_avg	avg_dl;
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
@@ -4239,4 +4241,10 @@ static inline bool task_has_preferred_cpus(struct task_struct *p)
 	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
 }
 
+#ifdef CONFIG_PREFERRED_CPU
+void sched_push_current_non_preferred_cpu(struct rq *rq);
+#else	/* !CONFIG_PREFERRED_CPU */
+static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
+#endif
+
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.47.3

