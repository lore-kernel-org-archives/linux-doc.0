Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD213ADB9B;
	Thu,  9 Jul 2026 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634262; cv=none; b=dUAQqNu7+ax+L8OJNwoXLq1brOirY5P+wPlOooszmot7TKyEFDYTXL7WEEIP0lQNC2bugpXGOStrCdJcXYfq7z8wTxLXOY2uK0ddy799ipaPa0KAaqMRvkYlvFUczY0+ZucUabgW9doFPTuyRvuZgX+3KFgTZwgMBBvAtphP91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634262; c=relaxed/simple;
	bh=pt/qjjJN7oBPGhUMuY2mEI+0X5rs1FuH6WFunRf3ErU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVWSwHF9ljkzmw1XxB+vlYGM+6yxmgl9Y3f6ZgD3ybDOtg0Pvko7eNdoQntyya53Q9zZhpOCqYluTunDIwZYHaXfmMspo2yFeOGLz1YJPHYjbCdPr3weyHTa2Bk+dGL2nWLCMpwmsZkDbs1ES/f35CKvH+nUut9eq4vbcTASpJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QYTm7Uz+; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QYTm7Uz+"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmfGa2623918;
	Thu, 9 Jul 2026 21:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=w8pYo4
	2D3JI7ruKDAnn2R33D+8xvdKTJ81MnYsZa5CQ=; b=QYTm7Uz+dBHBW8A8nmd+lq
	njmNiZQ3d3nuUYl4ZEe2bv699OLhSW/AoJOF6D8dIhQjvpCA/RJ+ZbvY88AQ7lsU
	f/aRubLAkPOwB1seMB9mP3DQD8SgBISsBtxq2cfph6LL5gop+JWVqeJRNDJdeyle
	S2pAXRnWuUnYpAgJR9hZPOAsDqAMpPAkxmLm3iluQZj8rkXwxmZcbnTRtfAwzNcN
	bwwfdGwEUyNQDTmjdWNg97oUZ+75UOLpZjrhwgaj+kjvezSHXWWsODIdU23/fgyM
	wc3uO2CiVeY0VB1lI4QolHe+wAkmEno/6gSNXL/D6bDDthMJ1IkvOV/g5hNMvGzg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw53uex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669Lnxst009465;
	Thu, 9 Jul 2026 21:57:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvwfauw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LvFNX50266382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70EBF20049;
	Thu,  9 Jul 2026 21:57:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ACB720040;
	Thu,  9 Jul 2026 21:57:08 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:07 +0000 (GMT)
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
Subject: [PATCH v7 02/12] cpumask: Introduce cpu_preferred_mask
Date: Fri, 10 Jul 2026 03:26:38 +0530
Message-ID: <20260709215648.1246821-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709215648.1246821-1-sshegde@linux.ibm.com>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2oUrFM7T8u0Qbrik64yN3UR-QAC9iOA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX5FyoDNrjgOrF
 4fmMOvZarA6rvDxulxAOOpaA+Jvw2zTHAYP4JOs3NOiRnclV3nxPssEWyoVVjS33fMcRD4xDLby
 wTM3FV0ZeJs5X0LVfC+lZmr8suf+ffR84svV1uS+WprbN+AY+vPFO+ytN5neDHMAtzenCQqMkPM
 oRUBc4PpufLdoTWowAmPII2VYwuVZZIjYJb7QU6wLo7OSuW+oqbHA4RMjdKEU11CbXGxSOvRq+H
 WdFkuHSWTJKp659qeTnErKUiQf1yeLyxyQB/glLQ27IsNHvsUKFTaxWiGH0on0UFMky8F5hW5HX
 1kn6eRFi0sG8RENuzJ5lLenai3bWEB3VBv5OWvkemOpaMqaSfxyNJKXUhp25DbfcIaqTcHOg1Hs
 zJtBXPtyXwP2FWlQgVFlYeYqWKAmS3Tor1rNW1Y1ftPmJnSxuIvJVuBs25ldyu/+nFzNerWe4nT
 p88bqBcJf/pSQVdNKSQ==
X-Proofpoint-ORIG-GUID: CJfhniZYsTlBmQ5neBIVdLTj2B-HfzXp
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a501941 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=NEAV23lmAAAA:8
 a=VnNF1IyMAAAA:8 a=9QGdkmv71c8RgJbqbJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX0PrZSwz+o8q6
 4wPu/oCrGZI0jzlJrvoMt7219d3KPD7++Ex7DrdD7UtFr2O1hZNKRoD6AHHeI/jGJ5ZDoUfDYVI
 gt4v420DUUAybwBuTz64QyzWh2xYs18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090218

Provide cpu_preferred_mask infrastructure. Define get/set macros
which could be used to get/set CPU state as preferred.

PREFERRED_CPU config will be selected by the driver which handles
steal time values. It is going to set/clear preferred CPU state.
This driver will be called steal_monitor and it is introduced in
subsequent patches. It periodically samples the steal time and
decides on preferred CPU state.

A CPU is set to preferred when it becomes active. Later it may be
marked as non-preferred depending on steal time values with
steal_monitor being enabled.

Always maintain design construct of preferred is subset of active.
i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible

With PREFERRED_CPU=n, ensure set_cpu_preferred is a nop and get
method returns the active state in that case.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- removed CONFIG_PREFERRED_CPU as user option.
- Use do { } while (0) for nop 

 include/linux/cpumask.h | 24 ++++++++++++++++++++++++
 kernel/Kconfig.preempt  |  3 +++
 kernel/cpu.c            |  6 ++++++
 kernel/sched/core.c     |  5 +++++
 4 files changed, 38 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index d3cda0544954..34d08a3d80e1 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -122,12 +122,20 @@ extern struct cpumask __cpu_enabled_mask;
 extern struct cpumask __cpu_present_mask;
 extern struct cpumask __cpu_active_mask;
 extern struct cpumask __cpu_dying_mask;
+
+#ifdef CONFIG_PREFERRED_CPU
+extern struct cpumask __cpu_preferred_mask;
+#else
+#define __cpu_preferred_mask __cpu_active_mask
+#endif
+
 #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
 #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
 #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
 #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
 #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
+#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
 
 extern atomic_t __num_online_cpus;
 extern unsigned int __num_possible_cpus;
@@ -1164,6 +1172,12 @@ void init_cpu_possible(const struct cpumask *src);
 #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
 #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
 
+#ifdef CONFIG_PREFERRED_CPU
+#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
+#else
+#define set_cpu_preferred(cpu, preferred) do { } while (0)
+#endif
+
 void set_cpu_online(unsigned int cpu, bool online);
 void set_cpu_possible(unsigned int cpu, bool possible);
 
@@ -1258,6 +1272,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return cpumask_test_cpu(cpu, cpu_dying_mask);
 }
 
+static __always_inline bool cpu_preferred(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_preferred_mask);
+}
+
 #else
 
 #define num_online_cpus()	1U
@@ -1296,6 +1315,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return false;
 }
 
+static __always_inline bool cpu_preferred(unsigned int cpu)
+{
+	return cpu == 0;
+}
+
 #endif /* NR_CPUS > 1 */
 
 #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 88c594c6d7fc..ed02e4431230 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -192,3 +192,6 @@ config SCHED_CLASS_EXT
 	  For more information:
 	    Documentation/scheduler/sched-ext.rst
 	    https://github.com/sched-ext/scx
+
+config PREFERRED_CPU
+	bool
diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..376d297a6292 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3103,6 +3103,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
 atomic_t __num_online_cpus __read_mostly;
 EXPORT_SYMBOL(__num_online_cpus);
 
+#ifdef CONFIG_PREFERRED_CPU
+struct cpumask __cpu_preferred_mask __read_mostly;
+EXPORT_SYMBOL_GPL(__cpu_preferred_mask);
+#endif
+
 void init_cpu_present(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_present_mask, src);
@@ -3160,6 +3165,7 @@ void __init boot_cpu_init(void)
 	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
 	set_cpu_online(cpu, true);
 	set_cpu_active(cpu, true);
+	set_cpu_preferred(cpu, true);
 	set_cpu_present(cpu, true);
 	set_cpu_possible(cpu, true);
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2e7cde033a31..a45f7c308329 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8690,6 +8690,9 @@ int sched_cpu_activate(unsigned int cpu)
 	 */
 	sched_set_rq_online(rq, cpu);
 
+	/* preferred is subset of active and follows its state */
+	set_cpu_preferred(cpu, true);
+
 	return 0;
 }
 
@@ -8703,6 +8706,8 @@ int sched_cpu_deactivate(unsigned int cpu)
 	if (ret)
 		return ret;
 
+	set_cpu_preferred(cpu, false);
+
 	/*
 	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
 	 * load balancing when not active
-- 
2.47.3

