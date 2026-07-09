Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3253D88FA;
	Thu,  9 Jul 2026 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634297; cv=none; b=pNzHjj1IwQKtcLNYDyccgk0dxaqRfOt5y5uOKEFol54EpnRIZ9/TbTIpGBMMtv6FoGy9SkzGd2iTFpgwaA/laZsvBlqDKXCEyFz07fsV0a2ACMbd9TI+Hy2KXAmZBori8UofJLeLLPZJnHGhQCBIq8b1TmbteqyrSCJla4/VdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634297; c=relaxed/simple;
	bh=5FuEM5ziYslUFVdIrEkCvsDYz8S70mdYhf72H9GQm4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emG1/ZsWH1MHk+slHVT528gZi+QLgiZTgZe5sTeHtM4M3DhzyovZjDroztutgy0AouqLSXUJbXGaG5XXRxxekL/qf1jqxQ1DVzVItiSwxMckTN8L+bO+HuhXabNXIv6KrOICaQarHAN8/dv+hNVpTj9q7DEyi44m2lHIFKE0nM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=U1pfFOTt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="U1pfFOTt"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmV7C2860929;
	Thu, 9 Jul 2026 21:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e6hIre7nDfpHzeCg3
	aafExC1wzPYvqwUb7hkM4rMuw0=; b=U1pfFOTt8y7Z9JE7BX2sATsXjBEYjiCJo
	QBwt38Z3hemJfk5EcDo/hwn6J+6CEWHEpkqxHbObJF2KIYlTXCxHBUltNuO8Rsht
	TaTnygKtvXg/HqhV/F+xLOtqpzlL38AIttFrnmcJvPgQ7Ll6sD33NeA7j0yuLpcr
	si8kx4fLJCOXTnBI4GzT8Np247r2MWJuprmIKprsXYsT7+MGcPEcCbS7uVKvk3vl
	ieKMBGmUB6fiMDU08IV0H9jRaZDE7NMYOttIjb9grAhrsOGGuLE509trsof6h7XE
	M7Q/3R99kn0UGgjloOIN24GttYmLWzVB6Dj+hTMhCIAT/o7jy+w9w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fafh0935r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669Lo0lG004986;
	Thu, 9 Jul 2026 21:57:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0hq1ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669Lvn0042533170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E17272004B;
	Thu,  9 Jul 2026 21:57:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7810920040;
	Thu,  9 Jul 2026 21:57:41 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:41 +0000 (GMT)
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
Subject: [PATCH v7 06/12] sched/core: Push current task from non preferred CPU
Date: Fri, 10 Jul 2026 03:26:42 +0530
Message-ID: <20260709215648.1246821-7-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709215648.1246821-1-sshegde@linux.ibm.com>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a501963 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=cUlZA3h0E36_aS3HAx0A:9
X-Proofpoint-GUID: gcSqeJk5QKaHtS64tpS2JEFE5HWiYAM_
X-Proofpoint-ORIG-GUID: hmqVsHRsKPyWk_CSUNmRf6tMnDiDW5b_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX6ay9uRLf+EGI
 CLyI4Z9mAFbTKma1X9hojUVCLBp1/fcO2VjG4bZBUl0Ypcnj1N9jb3UNl0pkrCD5w6DgqwSLu/X
 TVvYCkR8MO3ODHjrgQHv20l6RxXfGNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX1VLUZV/9wSiq
 lNs9hOYE9Rki+G57GPyBzdIyvPUv4XSEThXCIygSOKEAvIVOJfATSZoZQ7mPYmP2kPfHoqysx/m
 8gVW1Eh7ZkSbC7Tz3f7SqmR6rjaW0o1DpRvay7N0pMnjDSna+hf2lqrthzhVBEHAm795ykmYeuA
 awuN7XysOXA3XERtE/Kj4YkWHW9icC29PDyFEOXyyMSrVu5sfK2GR4dS9SgPwiKEYzdfBAYIu3L
 8R2GI4OE4ioguRaqQ+QgLEYe+wNtaUqJSlatamsUExsm/n1f240Qf2/o+IncFBUam7QxiPqVkzV
 78OGXnoQvz/LHHSpnJtv2OufjH5VeweQxvonOYq2XJV5mnnpqzdD8UsHKvkmSkgsKd7E3NnmHEv
 ALP2IOVSC+wYjXT7/RV5lOkPtLx15bIfL4Ca3RX9bjkVh9U+h4zOpmyuPq5CDot9lU4tzC6DbKa
 wlk45lDCVz1VMrj5kFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

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
v6->v7:
- Moved is_migration_disabled
- removed fair class check 

 kernel/sched/core.c  | 78 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  8 +++++
 2 files changed, 86 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9e8eec4451b6..74c93a88bf84 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5774,6 +5774,9 @@ void sched_tick(void)
 	unsigned long hw_pressure;
 	u64 resched_latency;
 
+	if (!cpu_preferred(cpu))
+		sched_push_current_non_preferred_cpu(rq);
+
 	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
 		arch_scale_freq_tick();
 
@@ -11292,3 +11295,78 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+#ifdef CONFIG_PREFERRED_CPU
+static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
+
+static int sched_non_preferred_cpu_push_stop(void *arg)
+{
+	struct task_struct *p = arg;
+	struct rq *rq = this_rq();
+	struct rq_flags rf;
+	int cpu;
+
+	/* sanity checks and clear */
+	if (cpu_preferred(rq->cpu) || is_migration_disabled(p)) {
+		scoped_guard(rq_lock, rq)
+			rq->push_task_work_done = false;
+		put_task_struct(p);
+		return 0;
+	}
+
+	raw_spin_lock_irq(&p->pi_lock);
+
+	/* This could take rq lock. So call it before rq lock is taken */
+	cpu = select_fallback_rq(rq->cpu, p);
+	rq_lock(rq, &rf);
+	rq->push_task_work_done = false;
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
+ * Push the current task running on non-preferred CPU(npc).
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
+	/* Don't push the task if task's affinity doesn't allow */
+	if (!task_can_sched_on_preferred(rq->cpu, push_task))
+		return;
+
+	/* There is already a stopper thread. Don't race with it. */
+	if (rq->push_task_work_done)
+		return;
+
+	/* sched_tick runs with interrupts disabled. */
+	get_task_struct(push_task);
+
+	scoped_guard(rq_lock, rq)
+		rq->push_task_work_done = true;
+
+	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
+			    push_task, this_cpu_ptr(&npc_push_task_work));
+}
+#endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6de6366f2faa..80c02e2c09eb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1277,6 +1277,8 @@ struct rq {
 
 	struct list_head cfs_tasks;
 
+	bool			push_task_work_done;
+
 	struct sched_avg	avg_rt;
 	struct sched_avg	avg_dl;
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
@@ -4242,4 +4244,10 @@ static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
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

