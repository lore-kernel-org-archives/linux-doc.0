Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D61862A;
	Thu, 25 Jun 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391742; cv=none; b=ljaREHnCrIQE1YYMu+NNkfjP64L2hQWNpLKCOVOP0JRDAn4qEdV7wduoYHfNDu7lmbEmRMaIdyVl7ZWHgKIkCULdRkqI/ZwUIO6JCd4+cbqSpzp3+cma+OojKF+nEi7isNb5uRvRGt9+bwldB/XmTqJG1SD9ns7rVRQ0MNI2ZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391742; c=relaxed/simple;
	bh=tDGPFgqkduTo2CVJ4ymeuTHysB1Fk9wIwI/ebSrS/RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsIAfIZYiyasgG6SFMV7mrsN2kLIGmoMUzA8t9FxA2BRRwjPBu2eZDUF4Y/mwEfT4lwprGCNJHWLi6svFYSi4d9OifjGtCcefVlmYbf0fg9R53QOGM6isLfUBLQ08MsNx7u14wxxe5sV62qxlriiHF0GCIDm/pOdbe+utt6RaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pWmi5USd; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pWmi5USd"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mNWl3040856;
	Thu, 25 Jun 2026 12:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=SE5Zv5kMksud/pG6d
	PVGgREr6qrqBhcLNMMGAw2vb2I=; b=pWmi5USdxjbn29TqVvR5ScvW/A1qZpgFm
	bx5j6zH8wggEKbTRBy6nM5xqcvl1L/T4CXncGfGs784ZG5XUuEu3Vle81xuYY7MJ
	NQny8cL7WWbvhtOPKyQ/kCTcNsUnSsljjr4BXZygC2M3XUjDpJwBemlgLt7Iz/O5
	1ljNgpf9MKtyvo+wdRbpEkMczBnVKnr9BsoOZR01tLZzhMlaSXlDTCQSgVV8Cc7v
	0yQiJFnadenNqI6J1ZnBQJ6DVRCTmTYxgdrR4Q6R1EHQOQLbBqatM2uPw+JTcWWG
	gdc7s54IctCcrSfDdp/h32ub0PfJKAtcimbgJFjBi5RulKwDhUjcg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3svxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYoc0014058;
	Thu, 25 Jun 2026 12:48:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex5jwp9p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCmaYs35914156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDE6020043;
	Thu, 25 Jun 2026 12:48:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEACF20040;
	Thu, 25 Jun 2026 12:48:28 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:28 +0000 (GMT)
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
Subject: [PATCH v5 11/24] sched/core: Push current task from non preferred CPU
Date: Thu, 25 Jun 2026 18:16:35 +0530
Message-ID: <20260625124648.802832-12-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3d23aa cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=-V1Il3ZtyC_IZvi6r-EA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX8U2YSbmA2GUw
 yP9Qy+REMKK98gtUIMgIJWV03yUrN4Nu7so8CJAzWlxcpgqEmLk3hLQH6/5vXMlAbnZ6iDjVQkA
 DfmCqCHn9Zhq1+/sIw41vOpUW1DwTl0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX51DUNtdVUiQB
 6m8eQQj6nrLo58qP9CHDGNyrOZHca/v1Y1YI0XBbpIoTzh8HQecF4tjs+L+b4T86iFNacqmto+W
 gFiPFKery8Mk4r9P4lAnTpCLnI1jlnRUHYtG+NhG/H8LXz/FzvDyz+VhEsT/3narQUbwkjY23Rl
 WaY+ePJo8l2nw0wrwLHRvpx0By3QIdukCiiHQFWm2ViuTlTZvbn0ZwHiVkt9GmjYwzPmnbvaodU
 /WyKVXh0Sg3yOzDrxNaRqHmmKMAlV0aPVMyX3z16RAmrNUGnC2QGHQbIUvEStDWEQ99gQwoKwZX
 mw2BWcBbLjyVWfSHuYqx5K8r2YIBQeKZ3smE4BV7M5iIeA6X+JYEFfBXokxuCjRBjlK4PyhtZhk
 A6joljbduCwg/NwAKQdxCbzEJSNYZL7nY0xfQ0OhhhdsOnaNoOBUDNNQkX6tIkuD9YVnV/hYwD+
 ujBsCUEYKFeVuTyAJpQ==
X-Proofpoint-ORIG-GUID: 1mt-OUFiFWJw5uSOJXlhdw8vi4QYYWPw
X-Proofpoint-GUID: tp26fRE1X10J1z1CrKD1bgcK2QpQk34-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Actively push out task running on a non-preferred CPU. Since the task is
running on the CPU, need to stop the cpu and push the task out.
However, if the task in pinned only to non-preferred CPUs, it will continue
running there. This will help in maintaining the userspace affinities
unlike CPU hotplug or isolated cpusets.

Though code is almost same as __balance_push_cpu_stop and quite close to
push_cpu_stop, it is being kept separate as it provides a cleaner
implementation w.r.t CONFIG_HOTPLUG_CPU.

Add push_task_work_done flag to protect work buffer.
Works only with FAIR class.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Move select_fallback_rq outside of rq_lock (Sashiko)
- Add context_unsafe_alias (K Prateek Nayak)
- Cleanup properly on early exit.

 kernel/sched/core.c  | 87 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  8 ++++
 2 files changed, 95 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c0391e7897f5..1e42078251d5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5794,6 +5794,9 @@ void sched_tick(void)
 	unsigned long hw_pressure;
 	u64 resched_latency;
 
+	if (!cpu_preferred(cpu))
+		sched_push_current_non_preferred_cpu(rq);
+
 	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
 		arch_scale_freq_tick();
 
@@ -11303,3 +11306,87 @@ void sched_change_end(struct sched_change_ctx *ctx)
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
+	/* Push only if it is FAIR class */
+	if (push_task->sched_class != &fair_sched_class)
+		return;
+
+	if (kthread_is_per_cpu(push_task) ||
+	    is_migration_disabled(push_task))
+		return;
+
+	/* Is there any preferred CPU in the affinity list */
+	if (!task_has_preferred_cpus(push_task))
+		return;
+
+	/* There is already a stopper thread for this. Dont race with it */
+	if (rq->push_task_work_done == 1)
+		return;
+
+	/* sched_tick runs with interrupts disabled. Don't disable again */
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
index 148fe6145f1a..316d3ccefc48 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1274,6 +1274,8 @@ struct rq {
 
 	struct list_head cfs_tasks;
 
+	bool			push_task_work_done;
+
 	struct sched_avg	avg_rt;
 	struct sched_avg	avg_dl;
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
@@ -4241,4 +4243,10 @@ static inline bool task_has_preferred_cpus(struct task_struct *p)
 	else
 		return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
 }
+
+#ifdef CONFIG_PREFERRED_CPU
+void sched_push_current_non_preferred_cpu(struct rq *rq);
+#else	/* !CONFIG_PREFERRED_CPU */
+static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
+#endif
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.47.3

