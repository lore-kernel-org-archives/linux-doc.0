Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259273D1CC3;
	Thu,  9 Jul 2026 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634312; cv=none; b=YgOMbBOGVI1jVQ8SBTQtTgs2Fr8IlDvZjwTrfdbUbJwVAveMw3nwJRD2fZWmDV/hcEbOQtpOaRwU9pdTVxKtShTXBNdrvoXeMTV85jzkNWmCN6ByW9adPzIYuB6BojCWGBrztEUCxLk9w9MBYMhlaW8+U0TGHktRkYsf9VJsm6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634312; c=relaxed/simple;
	bh=cqeeLotiTtCfeTtY8aF8borizaeDcl9SdeYG0zLOVsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isjfTZtnXKhZiewab09BOY5QlseOBdVwGJhEaB2U/8gO5aj87gwiRrZdb2D/8WllrxACcFG7qu+xKi/htVspVDdfFw8ai39Mbyrdopp4+x2E6Qp/LPyOAkT0VlqXzyNnDu4wXsaaE1fcfzVeMD7IGWoDpYHkKm+m5QYgQ2QUyw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZaUnifmO; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZaUnifmO"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmEWK2623271;
	Thu, 9 Jul 2026 21:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=nLkw0s4nm5l8ZnQJk
	/2jfWmhn4nb/j4siX6CAvElRFU=; b=ZaUnifmOWK4sws6ZvRUC/2IA9TtT/DS0w
	AUcuggvOhO932BnoJRbpZDE62nxSVe1ZQW9oXlCsF5Nf3MVv4krgxExoGolHkKLt
	4gOwwcjWON6y5tIqh5IM3zFuu6Pbrumk04G6TkO68pas8m68kT5z89AftmA6TIw8
	UeJ/oZuAqsJaWUggZiQmAgCnL8VB0OOoJuU5EqIGsVzZ0jXEMBSXrM/oBy8x0lfi
	AnWM65jYrKfeaEjWzDb4cF9GNossWsiviFTdR4h+av0J3xIo9E701HNiYQXE0wBA
	GKOzPyL16lSjMOPrZJeDbJeAd9DT5dwNkMpP4C83sXtz8x+MUL15A==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw53uhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LniI4026692;
	Thu, 9 Jul 2026 21:58:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6yett4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669Lw4nG55705898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:58:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE69320049;
	Thu,  9 Jul 2026 21:58:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26BD220040;
	Thu,  9 Jul 2026 21:57:57 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:56 +0000 (GMT)
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
Subject: [PATCH v7 08/12] virt: Introduce steal monitor driver
Date: Fri, 10 Jul 2026 03:26:44 +0530
Message-ID: <20260709215648.1246821-9-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: f4ENMviY4_DH3Mb9mUMF9Xt-93WjiX9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX5b82BdpbuwlA
 kL/GD2qVPtijGNQARqNB5xvtBNxzNERvWEyqLj9Myhceix7Que0RcfQgn7euM2ZTsCAWa7c6H2V
 yKhwu27qMdTm1EJQp3I/uu5M3quUtvw1OmSqcrP58WGQwkI8Cei+hdNLukcLMlSOSOrmKZtf0ys
 4KBqxz3IjkmqacJawfRz5nMI06VF9TYtFF3oBzE3LxiFP1oWHIHjtJp5ZrKuyrkx3ovakbGsCXG
 LLnElCt7nDmNKHl/6E4uUDMYsLnirmdh0oSPCFmgeDPew/j2zNAleYTXyT78qkTWMXogyBt2Sgd
 FiFy9jDSpFwf/flngGwEtkuaFU3M3E3+7dzfLHIA21WqYvhTtanQgdlE9E8XuMsFHiT7uXJkaGN
 Wo2EHCPJy12o3/8BaAm9r15WnHXSLj6Sw+6gvk2GTe7e/AkpdBCOdrcaIJKq9+BtRHKqUNtHKpl
 kkpaicataqkcyAHly4g==
X-Proofpoint-ORIG-GUID: MGSw-XuO8VWGF4Gh702qqkuvIoM_5E7E
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a501972 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=8b9GpE9nAAAA:8 a=9_GfHYRN2r2aEsRbcRkA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX+53lQ+WqoO/x
 LzVZnZqSsSAy1M352tt5mAC60yR9Xil1CM6mQJML4rZqMVrsA/qys03E7wwnfLAOqynXUnZ7+Tz
 MtoLpJUEz/mL2Zf/llmP1w7Ucn0Rjd0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090218

Introduce a new driver in virt named steal_monitor. This driver
will compute the steal time and drive the policy decisions of preferred
CPU state.

More on it can be found in the Documentation/driver-api/steal-monitor.rst

There is a new kconfig called STEAL_MONITOR. Having that driver is going
to select PREFERRED_CPU. This makes configs driven by user preference.
It is recommended to build it as module and let user load the module.

When the module is disabled, preferred is same as active.

File layout of the driver is designed with having arch specific
files in the future.

- sm_core.c - contains main driver code. This includes the periodic
  work function and take action on steal time.
- defaults.c - contains the functions used for handling steal values.
- sm_core.h - header file which includes data structure.

Main structure of steal monitor has,
- work: deferred periodic work function
- prev_steal, prev_time: To calculate the delta in periodic work.
- interval_ms, high_threshold, low_threshold: debug knobs of
  steal_monitor.
- prev_direction: Simple direction control to avoid oscillations.

While there, Add MAINTAINERS entry for this new driver.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Combined all introductory patches.
- Introduce STEAL_MONITOR which selects PREFERRED_CPU.
- Added MAINTAINERS entry.
- Yury, I have kept you as reviewer entry, Let me know if it needs to
  change.

 Documentation/driver-api/index.rst         |   1 +
 Documentation/driver-api/steal-monitor.rst | 111 +++++++++++++++++++++
 MAINTAINERS                                |   9 ++
 drivers/virt/Kconfig                       |   2 +
 drivers/virt/Makefile                      |   1 +
 drivers/virt/steal_monitor/Kconfig         |  18 ++++
 drivers/virt/steal_monitor/Makefile        |   6 ++
 drivers/virt/steal_monitor/sm_core.c       |  38 +++++++
 drivers/virt/steal_monitor/sm_core.h       |  27 +++++
 9 files changed, 213 insertions(+)
 create mode 100644 Documentation/driver-api/steal-monitor.rst
 create mode 100644 drivers/virt/steal_monitor/Kconfig
 create mode 100644 drivers/virt/steal_monitor/Makefile
 create mode 100644 drivers/virt/steal_monitor/sm_core.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.h

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index eaf7161ff957..ec12f396a5e6 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -138,6 +138,7 @@ Subsystem-specific APIs
    sm501
    soundwire/index
    spi
+   steal-monitor
    surface_aggregator/index
    switchtec
    sync_file
diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
new file mode 100644
index 000000000000..94f4aa1aaa7d
--- /dev/null
+++ b/Documentation/driver-api/steal-monitor.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+=============
+Steal Monitor
+=============
+
+:Author: Shrikanth Hegde
+
+Introduction
+============
+
+Steal monitor is a driver aimed at solving the Noisy Neighbour problem
+in virtualized environments. The performance of workload
+running in one VM gets affected significantly due to other VMs and
+combined they make slower forward progress.
+
+When there is overcommit of CPU resources, i.e. sum of virtual CPUs (vCPUs)
+of all VMs is greater than number of physical CPUs (pCPUs) and
+when all or many VMs have high utilization, hypervisor won't be able
+to satisfy the CPU requirement and has to context switch within or
+across VMs. I.e. the hypervisor needs to preempt one vCPU to run
+another. This is called vCPU preemption.
+This is more expensive compared to task context switch within a vCPU.
+
+In such cases it is better that combined vCPU ask from all VMs is reduced
+by not using some of the vCPUs. vCPUs where workload can be safely
+scheduled which won't increase any contention for pCPU are called as
+"Preferred CPUs".
+
+See more on "Preferred CPUs" in Documentation/scheduler/sched-arch.rst.
+
+This driver makes CONFIG_PREFERRED_CPU=y which enables the scheduler core
+infrastructure to move tasks to Preferred CPUs where possible.
+
+Core idea
+=========
+steal time is an indication available today in Guest which shows contention
+for underlying physical CPU. Use it as a hint in the guest to fold the
+workload to a reduced set of vCPUs. When there is contention, steal time
+will show up in all the guests. When each guest honors the hint and folds
+the workload to a smaller set of vCPUs (Preferred CPUs), it reduces the
+contention and thereby reduces vCPU preemption.
+This is achieved without any cross-guest communication.
+
+Steal monitor driver effectively does:
+
+1. Periodically computes steal time across the system.
+
+2. If steal time is greater than high threshold, reduce the number of
+   preferred CPUs by 1 core. Ensure at least one core is left always.
+   This avoids running into extreme cases.
+
+3. If steal time is lower or equal to low threshold, increase the
+   number of preferred CPUs by 1 core. If preferred is same as active,
+   nothing to be done.
+
+4. Ensure preferred CPUs is always subset of active CPUs.
+   On feature disable it is same as active CPUs.
+
+This feature works best only when all the VMs enable the feature as
+it is a co-operative scheme. If a specific VM doesn't enable this feature
+it may end up with more CPUs than others, still should lead to better
+performance when seen from system view.
+Those who enable this driver must ensure it is enabled in all VMs.
+
+Module Parameters
+=================
+interval_ms
+-----------
+How often steal monitor checks for steal time.
+Default: 1000 i.e 1 second. Value should be in between 10ms to 100sec.
+
+This controls how fast steal monitor driver reacts to changes to
+the contention of physical CPUs. Since it does a fair amount of
+work, setting too low will have overheads. Setting it too
+high might render it ineffective.
+
+low_threshold
+-------------
+lower threshold value in percentage * 100.
+Default: 200, i.e 2% steal is considered as low threshold.
+Can't be higher than high_threshold.
+
+This determines what values should be considered as nil/no steal values.
+When steal monitor see steal time is below or equal to this value, it
+will increase the preferred CPUs by 1 core. Having value as zero
+might cause oscillations.
+
+high_threshold
+--------------
+higher threshold value in percentage * 100
+Default: 500, i.e 5% steal is considered as high threshold.
+Can't be lower than low_threshold. Must be less than 10000.
+
+This determines what values should be considered as high steal values.
+When steal monitor sees steal time is higher than this value, it will
+reduce the preferred CPUs by 1 core.
+
+Notes
+=====
+Selecting this driver makes CONFIG_PREFERRED_CPU=y. That makes configs
+driven by user preference.
+
+It is recommended to build CONFIG_STEAL_MONITOR=m due ot below reasons:
+
+1. Doing periodic work has additional overheads. Enabling this driver
+   in systems where steal time cannot happen is of no use. There is no
+   benefit with additional overheads in such systems.
+
+2. This works well when all VMs work in co-operative manner. When an
+   administrative user enables it in one VM, he/she will likely enable
+   it all VMs.
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..6735f9dae530 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25914,6 +25914,15 @@ F:	rust/helpers/jump_label.c
 F:	rust/kernel/generated_arch_static_branch_asm.rs.S
 F:	rust/kernel/jump_label.rs
 
+STEAL TIME MONITOR DRIVER
+M:	Shrikanth Hegde <sshegde@linux.ibm.com>
+R:	Yury Norov <yury.norov@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
+F:	Documentation/driver-api/steal-monitor.rst
+F:	drivers/virt/steal_monitor/
+
 STI AUDIO (ASoC) DRIVERS
 M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
 L:	linux-sound@vger.kernel.org
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 52eb7e4ba71f..a52233b2502e 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
 
 source "drivers/virt/acrn/Kconfig"
 
+source "drivers/virt/steal_monitor/Kconfig"
+
 endif
 
 source "drivers/virt/coco/Kconfig"
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..b67fd8968ec3 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -9,4 +9,5 @@ obj-y				+= vboxguest/
 
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
+obj-$(CONFIG_STEAL_MONITOR)	+= steal_monitor/
 obj-y				+= coco/
diff --git a/drivers/virt/steal_monitor/Kconfig b/drivers/virt/steal_monitor/Kconfig
new file mode 100644
index 000000000000..c7d7599c30ce
--- /dev/null
+++ b/drivers/virt/steal_monitor/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config STEAL_MONITOR
+	tristate "Dynamic vCPU management based on steal time"
+	depends on PARAVIRT && SMP
+	select PREFERRED_CPU
+	default m
+	help
+	  This driver helps to reduce the steal time in paravirtualised
+	  environment, thereby reducing vCPU preemption. Reducing vCPU
+	  preemption provides improved lock holder preemption and reduces
+	  cost of vCPU preemption in the host.
+
+	  By default preferred CPUs will be same as active CPUs. Depending
+	  on the steal time when steal_monitor driver is enabled,
+	  preferred CPUs could become subset of active CPUs.
+
+	  It is recommended to build it as module and load the module
+	  to enable it.
diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
new file mode 100644
index 000000000000..bd7d120a79b5
--- /dev/null
+++ b/drivers/virt/steal_monitor/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Steal time monitor to alter preferred CPU state.
+obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
+
+steal_monitor-y := sm_core.o
diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
new file mode 100644
index 000000000000..180db424846c
--- /dev/null
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Steal time Monitor.
+ *
+ * Periodically compute steal time. Based on the thresholds either
+ * reduce/increase the preferred CPUs which can be used
+ * by the workload to avoid vCPU preemption to an extent possible.
+ *
+ * Available as module with CONFIG_STEAL_MONITOR=m
+ *
+ * Copyright (C) 2026 IBM
+ * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+ */
+
+#include "sm_core.h"
+
+struct steal_monitor sm_core_ctx;
+
+static int __init steal_monitor_init(void)
+{
+	pr_info("steal_monitor is enabled\n");
+	return 0;
+}
+
+static void __exit steal_monitor_exit(void)
+{
+	guard(cpus_read_lock)();
+	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
+
+	pr_info("steal_monitor is disabled\n");
+}
+
+module_init(steal_monitor_init);
+module_exit(steal_monitor_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("IBM Corporation");
+MODULE_DESCRIPTION("Virtualization Steal Time Monitor");
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
new file mode 100644
index 000000000000..8bbb606add99
--- /dev/null
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __VIRT_STEAL_CORE_H
+#define __VIRT_STEAL_CORE_H
+
+#include <linux/types.h>
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/cpuhplock.h>
+#include <linux/cpumask.h>
+#include <linux/workqueue.h>
+#include <linux/ktime.h>
+
+struct steal_monitor {
+	struct delayed_work	work;
+	u64			prev_steal;
+	int			prev_direction;
+	unsigned int		interval_ms;
+	unsigned int		high_threshold;
+	unsigned int		low_threshold;
+	ktime_t			prev_time;
+};
+
+extern struct steal_monitor sm_core_ctx;
+
+#endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

