Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE70F3ADB9B;
	Thu,  9 Jul 2026 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634325; cv=none; b=X06NKzJuxy83kdjiogPlDYm1dM9E8P9KBecW7N28TMvGVzR6YA+mjCbbTqtMhpuh5HXSczGDptM1eGgD7bWFEIqNdABOb7VG0P0l4fnahXYtet78Ag9RAZga5beC4CLwkaxbJBKulqJy7bNWM59ao3CP4p1UDZp8/1ReVWQbQGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634325; c=relaxed/simple;
	bh=lPKIIunauc+22JwQsBgazatC5pf240BbRDV2oiwmZ1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTXJUEcXxK+QyGSZej0jJf8k5yzjWYAI9XktR7XMOkvwrsjMc6GhfLM2QKtJ8qLegv48pP9Bu9OcNSHAGvATJ5ZucnRdCB2//V0MC4qFeMhaITMvLo7iOa9rHEMODnLPPCXRo1ukRh9ECphPETKlsBnna5qojMw9TZKI7zlOB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XOB0eBme; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XOB0eBme"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmC5H3366388;
	Thu, 9 Jul 2026 21:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jaGNQf4r4UwHg2DD/
	o4EtHSytKAB7A2KBOdvvCkJd1s=; b=XOB0eBmeyRj/UqskGjG4v7jT3SrfI4ZZ5
	QtUbvyxiVjeBtHXXi8SsHsmwCLgTUDYR4DMjaxgsCqWwwDcH2oNW6X5t0Uv3i/yZ
	iE7paewxGiyI7+hC6L8AA+ugOl1qNYTR1ZeXuDGsUzwJUxeyiv8xSY2bTwCgGUJd
	jR1MWrK/LriAdP39fiJ+2ZokZuV/UrnI+FDABQeqvdFScxEPstlOUstCo1ckZN2j
	Tn1ZwOMC8dksygQ2/IPUu/7KEmkPFs4bClg38Iwm1yFa2rBlm6D15kGf0B9rR/tj
	0eM2mkxbi0roR5pmXIDSPsema2A8h+CvfQZlKVE2jV3XhtXvODDRw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sur3jh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LnlIZ027269;
	Thu, 9 Jul 2026 21:58:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqfc10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LwKEJ49086922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:58:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CA3020049;
	Thu,  9 Jul 2026 21:58:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07FF120040;
	Thu,  9 Jul 2026 21:58:13 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:58:12 +0000 (GMT)
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
Subject: [PATCH v7 10/12] virt/steal_monitor: Provide functions for managing steal values
Date: Fri, 10 Jul 2026 03:26:46 +0530
Message-ID: <20260709215648.1246821-11-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX8UPxKIg/OUsQ
 2BqedrE0CfSCE4tFWl5N1yC8HEUSjj8dFMjvE4Np08SbsqOLOIck5OjjkaUIAofMk8rCVV5bPJu
 dVRvr6TddU3VlQPZHCkZ7siZ6Fcoicw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXxRCD1TZ4hV6r
 ns3pB5K8ih3Cud4hZ25IX5GwUOuwTYPR8+krObXrYxezMFc+QSdtAXmDckikvDoXt9EMhxaWXeh
 fLpVmn35gN25qBgXmaEEoCaHCuKdyhoXhvHFXNmzG79iD+rPTNd+uIzsnfXsWEonumsi+JmZag3
 JZt/lGK/jyi9LPZbQYO8RSRxdMGRRGBj6AdW5A5FroIyJlc0VfbY1S4VeGwemOnG+tYjZoHRm9Q
 H3wKzcrc29Ad10FfBhVSLsutjnq6KV59H9OHHZbdA1Kju1NzhoTUISmRwA0M60bG9YEZ6AvMcMN
 wAdtSuaBnnzrsEpkWjZYRpSxlluL7IR6Uv+NZGrbTbNgfCBCmLqGJoTKGp2aCg1y+xjbkLeRvOe
 kq2vugmMy6E52VSITNtOGZ67hAGjX/RMOKCXJ1MgIpMq4yMrYBYOA4cY5+RHqrH1FSuJCG+cac5
 R7lNyqvsmAsHa8MfQuA==
X-Proofpoint-GUID: T87sInxjTvdr8TU4NBilFKfrjXfXRQrx
X-Authority-Analysis: v=2.4 cv=Oot/DS/t c=1 sm=1 tr=0 ts=6a501982 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=8c403ZIb8ZqnBDh1lJ0A:9
X-Proofpoint-ORIG-GUID: kR4vRrWezKiyR2PPQRRoAJDue3ITuNOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090218

Provide functions which is going to be used in the periodic work
function to calculate and handle steal time values.

get_system_steal_time()
- steal monitor takes global view of steal time instead of individual
  vCPU. For this collect overall steal values across all the vCPUs or
  vCPUs of interest.
- Sum up steal time values across possible CPUs. This helps to keep it
  a monotonically increasing number and avoids spikes due to CPU
  hotplug.

decrease_preferred_cpus()
- Called when there is high steal time. It needs to decide which CPUs to
  mark as non-preferred and set that state.
- Get first housekeeping CPU and its core mask. Mark it as
  protected core. This helps to keep at least one core as preferred.
  kernel ensures at least one housekeeping CPU must stay active.
- Find the last CPU outside of this protected core mask. (target CPU)
- Based on that target CPU, get its sibling and mark them as
  non-preferred.

increase_preferred_cpus()
- Called when there is low steal time. It needs to decide which CPUs to
  mark as preferred and set that state.
- Get the first active non-preferred CPUs. This likely is the last
  set of CPUs being marked as non-preferred.
- get the siblings of that CPU and mark them as preferred.

get_num_cpus_steal_ratio()
- This method informs the steal_monitor core, how many CPUs it needs to
  consider for steal ratio calculations.
- Return number of possible CPUs as get_system_steal_time computes
  steal values across possible CPUs.

Notes:
1. Using core instead of individual CPUs performs better as SMT is
   quite common and some hypervisor such as powerVM does core scheduling.

2. This doesn't do any NUMA splicing to keep the code simpler and
   minimal overhead. Current code expects CPUs spread uniformly
   across NUMA nodes.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Combined patches which added helper functions.
- Use possible CPUs for steal value calculations. 

 drivers/virt/steal_monitor/Makefile   |   2 +-
 drivers/virt/steal_monitor/defaults.c | 100 ++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h  |   8 +++
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virt/steal_monitor/defaults.c

diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
index bd7d120a79b5..273a6dd59fea 100644
--- a/drivers/virt/steal_monitor/Makefile
+++ b/drivers/virt/steal_monitor/Makefile
@@ -3,4 +3,4 @@
 # Steal time monitor to alter preferred CPU state.
 obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
 
-steal_monitor-y := sm_core.o
+steal_monitor-y := sm_core.o defaults.o
diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
new file mode 100644
index 000000000000..d4b016317554
--- /dev/null
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Base file contains the default implementations.
+ *
+ * Copyright (C) 2026 IBM
+ * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+ */
+#include "sm_core.h"
+
+/*
+ * Returns steal time of the full system.
+ * Compute collective steal time across all possible CPUs.
+ */
+u64 get_system_steal_time(void)
+{
+	int cpu;
+	u64 total_steal = 0;
+
+	for_each_possible_cpu(cpu)
+		total_steal += kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
+
+	return total_steal;
+}
+
+/*
+ * Returns number of CPUs to consider for steal ratio.
+ * Return possible CPUs.
+ */
+unsigned int get_num_cpus_steal_ratio(void)
+{
+	return num_possible_cpus();
+}
+
+/*
+ * Take action to decrease preferred CPUs.
+ *
+ * Decrease the preferred CPUs by 1 core.
+ * Take out the last core in the active & preferred.
+ *
+ * Must ensure
+ * - least one housekeeping core is always kept as preferred
+ * - preferred is always subset of active.
+ */
+void decrease_preferred_cpus(struct steal_monitor *ctx)
+{
+	int tmp_cpu, first_hk_cpu, last_cpu;
+	const struct cpumask *first_hk_core;
+	int target_cpu = nr_cpu_ids;
+
+	guard(cpus_read_lock)();
+	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
+					 cpu_preferred_mask);
+	last_cpu = cpumask_last(cpu_preferred_mask);
+
+	if (first_hk_cpu >= nr_cpu_ids || last_cpu >= nr_cpu_ids)
+		return;
+
+	/* Always leave first housekeeping core as preferred. */
+	first_hk_core = topology_sibling_cpumask(first_hk_cpu);
+
+	/* Find the last CPU which doesn't belong to that first hk_core. */
+	if (!cpumask_test_cpu(last_cpu, first_hk_core)) {
+		target_cpu = last_cpu;
+	} else {
+		for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
+			target_cpu = tmp_cpu;
+	}
+
+	/* Only the first housekeeping core remains */
+	if (target_cpu >= nr_cpu_ids)
+		return;
+
+	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(target_cpu),
+			 cpu_preferred_mask)
+		set_cpu_preferred(tmp_cpu, false);
+}
+
+/*
+ * Take action to increase preferred CPUs.
+ *
+ * Increase the preferred CPUs by 1 core.
+ * Add the first core in active & !preferred
+ *
+ * Must ensure preferred is subset of active.
+ */
+void increase_preferred_cpus(struct steal_monitor *ctx)
+{
+	int first_cpu, tmp_cpu;
+
+	guard(cpus_read_lock)();
+	first_cpu = cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
+
+	/* All CPUs are preferred. Nothing to increase further */
+	if (first_cpu >= nr_cpu_ids)
+		return;
+
+	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(first_cpu),
+			 cpu_active_mask)
+		set_cpu_preferred(tmp_cpu, true);
+}
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index 8bbb606add99..ee68cd8b1944 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -11,6 +11,9 @@
 #include <linux/cpumask.h>
 #include <linux/workqueue.h>
 #include <linux/ktime.h>
+#include <linux/kernel_stat.h>
+#include <linux/topology.h>
+#include <linux/sched/isolation.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
@@ -24,4 +27,9 @@ struct steal_monitor {
 
 extern struct steal_monitor sm_core_ctx;
 
+u64 get_system_steal_time(void);
+unsigned int get_num_cpus_steal_ratio(void);
+void increase_preferred_cpus(struct steal_monitor *ctx);
+void decrease_preferred_cpus(struct steal_monitor *ctx);
+
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

