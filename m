Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446923546E0;
	Wed,  1 Jul 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915696; cv=none; b=dAOmSZumxzx5i5nAbZNvHUbgtzzfO8iwNypr2PnvfINoncDxNg+0ys+gqbQQzUmOk/vsbze9p22g2WsBb1ghE6Ge9o+QLbcBL/Slpe/Uz5JzGUVuF4zN26ohtgjwB9QISvl3UtrLYZKJIr4HfHq/xKQElXl1xC7iRcriuNcj8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915696; c=relaxed/simple;
	bh=dupyJ6+iJNDSlCqLRWdKB9uVKbLGTEPAtbKs9RXK5VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMRrqOiJUOj0VEduXCeViQ/1E6vLPTo1gBelI6wxAnZv3KIbGTU5/rDE1jRxD3tG+Ncl5LlI0bDPtCF7q5UHTp9De0swCsrGpflWFLOlpXkDu/uRVsl0zGlyT4G2nngsF1aqBhd6eJzt7/l0XxfC1Lo4sg3O5RB7qizhhoPJxFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OEx8uMUM; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OEx8uMUM"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AILuT609110;
	Wed, 1 Jul 2026 14:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9zAPpoMyjx8dCDLlJ
	FhNKs1l97407iuNQDrRaRcglQQ=; b=OEx8uMUM+Rkx6wP43x9r0FDGQzptqZo1p
	0sYXX80lDZMXt+qav/fAVzxnJqAn4XClGqnTomzYjil/SC0wODnFCCLsVP4/38JG
	CDuWfZ5hXoYkBGB4qWPU5ey1Qs+eH546lYVR0SP+siXqQ/tbE2QZc8sZqI6hZOu/
	RWkPbLUPds3uPGxiZRc53/Y/EW3f8+tAYOo91PIwxuseCJhK1nLFw1FBHxKct+tW
	9rYWgKdask1WJMLbgtD9axuhdyMlyRxOBzrzfVsOtMNEzzLrejMtjItmYfdg1I4r
	cp35y0zBKkhLTQCUhJRvcwGmXptovpGhlWNxReYUagp7dIx08YzXw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe50gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJb9e010057;
	Wed, 1 Jul 2026 14:21:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhyfde6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661ELDeM49611138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:21:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7FF820040;
	Wed,  1 Jul 2026 14:21:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2936D20049;
	Wed,  1 Jul 2026 14:21:00 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:20:59 +0000 (GMT)
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
Subject: [PATCH v6 17/23] virt/steal_monitor: Provide default method to get systemwide steal time
Date: Wed,  1 Jul 2026 19:46:48 +0530
Message-ID: <20260701141654.500125-18-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: ButjWGXGaQQHW0CHXrs3KfkMWHMBUdMj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX7/81+Hgmup88
 Sn0MEEQrXiqesnSIMjHPTZJq7WYT++u3/K4Q1N2J7H648Xs1ItCMqV9yVhOhHXvoLTTstnaDwl7
 SAyUZ6uvz4B9RzJiEMHBI63wI4gbyVE=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a45225e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=DoIHamYKVnTfKYoLtxcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX87HbbV3KGUTs
 WPoCHwC/wFlvocLFjNgOf0/RV0vSaqI6AjI99v7qgbwW0Toh7kRyGpbBwCh1uHIVKbXKTYgJQGy
 PEk/pD8hm99feLdOPM+MtucDT3RbN/5IwLA6TqbFq3u5Bsfyhg4C2/j1BK460a5V7WXD7nqWS6B
 H8hJ+a+unFzo9mzU1EGbjtscEf9CFbmg2/Xv3N9E4u+3aRo2JJNsJ9WDTNs3VCwtL5QThkecQYQ
 LH/+q6zTz9TBdB8hviJsitoCLOmcCh2oLppyJZYIC9z1HXlwQjqgx55KWG34eIl5FRo+xBBZ7+L
 wtSugCNi4gmyBV7SsZ77J0R3ymvzvhLT4SRtkgQYkHMncDMXPC08yD+HDqriEkmC2ccQYgf/Yod
 VA1Yq/rsdIiUm/KFMrxwiyc40ISleUvdptWk7MQDye4Ir9vm46Xp2DV6ZYej/KCnSSpHY4QiB6k
 hR0/Lai4xCKWu0p9w9w==
X-Proofpoint-ORIG-GUID: 1th1UJd5-xuf_F-PK1cCxeTds3ALhfot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

steal monitor takes global view of steal time instead of individual
vCPU. For this collect overall steal values across all the vCPUs or
vCPUs of interest.

Default implementation chooses steal time across all active CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Add cpus_read_lock() for hotplug safety

 drivers/virt/steal_monitor/Makefile   |  2 +-
 drivers/virt/steal_monitor/defaults.c | 28 +++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h  |  3 +++
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virt/steal_monitor/defaults.c

diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
index 24cee55342ce..7c16f8cf9583 100644
--- a/drivers/virt/steal_monitor/Makefile
+++ b/drivers/virt/steal_monitor/Makefile
@@ -11,4 +11,4 @@
 #
 obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
 
-steal_monitor-y := sm_core.o
+steal_monitor-y := sm_core.o defaults.o
diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
new file mode 100644
index 000000000000..6681f9938f6a
--- /dev/null
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Base file contains the default implementations.
+ * These are defined as __weak so that arch may define
+ * strong symbols to override.
+ *
+ * Copyright (C) 2026 IBM
+ * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+ */
+#include "sm_core.h"
+
+/*
+ * Compute steal time of the full system.
+ *
+ * Default implementation returns steal time across all active CPUs
+ */
+
+u64 __weak get_system_steal_time(void)
+{
+	int tmp_cpu;
+	u64 total_steal = 0;
+
+	guard(cpus_read_lock)();
+	for_each_cpu(tmp_cpu, cpu_active_mask)
+		total_steal += kcpustat_cpu(tmp_cpu).cpustat[CPUTIME_STEAL];
+
+	return total_steal;
+}
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index ea06e83c228c..634c9f5a2610 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -11,6 +11,7 @@
 #include <linux/cpumask.h>
 #include <linux/workqueue.h>
 #include <linux/sched/isolation.h>
+#include <linux/kernel_stat.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
@@ -24,4 +25,6 @@ struct steal_monitor {
 
 extern struct steal_monitor sm_core_ctx;
 
+u64 get_system_steal_time(void);
+
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

