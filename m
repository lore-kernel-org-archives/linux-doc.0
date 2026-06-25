Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6403E3153;
	Thu, 25 Jun 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391767; cv=none; b=S4IJNcEYzdzaFPocfyMnrkJArAFqNh29nSyrn8YFDAaoc80r5LBRqWqB9GA/OF02eq/NZPOvvi1ntpLp4kaKUg8j+f1vHx92jAeHQKs1XYLBu6oYMEo4cFUG4kOMaDwYKocTFZSgcLkKdJPZ/cAxltf+YbiW2ZjcFDdRTUVLADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391767; c=relaxed/simple;
	bh=rm+OCjCOkSQfc5dIZRlfYoOZ5EsVd540+7iCJUOs38g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uC7JOODyXYyfom+OG6xJS4QcuBnGPK3jtxuXzkAx6jLuHIUl07dGzwBWY6t5n1rIoq/ZwMOnctvIueHOBjf33J21/5t2h9HQENkXuy4U3KZwsfFrwkntv7KgycYmCMrjydbp0sjm4HtjbHdOeWEWm1aME/j8DjfUu9MBAhcECrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i6OWPZh4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i6OWPZh4"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3nwap2929853;
	Thu, 25 Jun 2026 12:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0qDIf8bY27ETZUudL
	spAd5/l7DNFTcwtwaZvDZMFIy0=; b=i6OWPZh4F4UDDveC6XDNRa5KJVQMD8e4a
	pNt2qt4PBFCIXczukFIS6y8Bfl51uHnVPuuk3BRSmWCbWcNMadHNJQEHGtaSbzwc
	Z2oiYDWuiWw0eipmtLx8Ir4jHdvgZo8b2ASlX0EIBQGiWhgFIkADnlWqL7D63R5e
	Jrls8unn7JvLMjr1ljJUPTydZkH5B1t2Xmd9XKeK32c9lRW0CuEyz8bHsdw52lRr
	yCEttSgDTXsyNjl6iD8st7OSRumidZJ1UNXuUqHRQRVO0hCuQ0mZhT6iVB6PATHH
	2854Jidcw1B9tmBDNSMMYSmnVC+xjmyEola+HLrxGUK/AOQvs5eCQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewh9gsgwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYlTB021705;
	Thu, 25 Jun 2026 12:49:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex6php3eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCn3ne40567104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E8CE20043;
	Thu, 25 Jun 2026 12:49:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80EFA20040;
	Thu, 25 Jun 2026 12:48:55 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:55 +0000 (GMT)
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
Subject: [PATCH v5 14/24] virt: Introduce steal monitor driver
Date: Thu, 25 Jun 2026 18:16:38 +0530
Message-ID: <20260625124648.802832-15-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Kyz0XCsqkC9XV_sGhuLCj9b5PZ8OnDgm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX1S2rHafiV7jv
 f0U1WM6z3J5cIoUXVKFJwbZ4k+uDcH5s72W6d8HknOAqEH3MPgo3zGwOto5Vv+kv2BE8XjWErBu
 YD1C0a7aJ5P5QNZzkfqvt1EIaRz9XBY=
X-Authority-Analysis: v=2.4 cv=c62bhx9l c=1 sm=1 tr=0 ts=6a3d23c4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=tbi7dcW0GDkor9mk7j8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX92sDwPO9R0ht
 gJTe8PUVACWxv9Visi/Q8ta/wCLLLKwLJdyncCEUkiXiRkGkVsnXum7n3wLKlnpThhEqtuo9QVK
 NRMcAYdkmDAtwRdR9cnw5hMYXp09M5S/cnSBgREnJMZxcksJp2EFBJ7IqFXdjkf3m4KokPg4YGv
 q7FrVrn+WLP8qr5R4Q7042rGfzqJOAGU0eblez5Wg330gNtT/BoM4haI+IfurGjrBxfjlf5Eoew
 mmijg38DHlN2806wlRx41Dj5PvpgAhLvdglwbZN+RBr17QwX5fqQPqQdTgUBaoRl0SvXZgpXoC/
 xbXuLqyTs2cWjmsF/eY86Uc41JQFu5oyyGLcyKqa/5zkHrwBO5QBSi+sySudeAVWRbDpScaDVo3
 upIgRkD2gG0un902d1JhPKY1fzZ3FKHeLpztMJawkd4vRudwckErMN+IZMtMgct1uTOf/NCh6+C
 7HZMfUD3iGCAp/1I7Xw==
X-Proofpoint-ORIG-GUID: 8xlgmguSaCcl8weWoUYPPDaD8YCcO1mG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Introduce a new driver in virt named steal_monitor. This driver
will compute the steal time and drive the policy decisions of preferred
CPU state.

More on it can be found in the Documentation/driver-api/steal-monitor.rst
This patch introduces the skeleton code.

There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
- If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
  loaded by default.
- If CONFIG_PREFERRED_CPU=n, module isn't compiled.

File layout of the driver is designed with having arch specific
files in the future.

- sm_core.c - contains main driver code. This includes the periodic
  work function and take action on steal time.
- defaults.c - contains the default implementation defined with __weak
  symbols.
- sm_core.h - header file which includes data structure.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- new patch

Please let me know if the placing is not right.

 drivers/virt/Makefile                |  1 +
 drivers/virt/steal_monitor/Makefile  | 14 ++++++++++++
 drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h | 11 ++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 drivers/virt/steal_monitor/Makefile
 create mode 100644 drivers/virt/steal_monitor/sm_core.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.h

diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..aff715cea42d 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -9,4 +9,5 @@ obj-y				+= vboxguest/
 
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
+obj-$(CONFIG_PREFERRED_CPU)	+= steal_monitor/
 obj-y				+= coco/
diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
new file mode 100644
index 000000000000..24cee55342ce
--- /dev/null
+++ b/drivers/virt/steal_monitor/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Steal time monitor to alter preferred CPU state.
+#
+# Arch can implement strong function definitions and override the
+# default by adding them in arch specific file. It must ensure
+# that preferred is always subset of active.
+#
+# It is always compiled as module if CONFIG_PREFERRED_CPU=y
+# One has to enable the module.
+#
+obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
+
+steal_monitor-y := sm_core.o
diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
new file mode 100644
index 000000000000..e320559c6576
--- /dev/null
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Steal time Monitor.
+ *
+ * Periodically compute steal time. Based on the thresholds either
+ * reduce/increase the preferred CPUs which can be made use
+ * by the workload to avoid vCPU preemption to an extent possible.
+ *
+ * Available as module with CONFIG_PREFERRED_CPU=y
+ *
+ * Copyright (C) 2026 IBM
+ * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+ */
+
+#include "sm_core.h"
+
+static int __init steal_monitor_init(void)
+{
+	pr_info("steal_monitor is enabled\n");
+	return 0;
+}
+
+static void __exit steal_monitor_exit(void)
+{
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
index 000000000000..684a258526e1
--- /dev/null
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __VIRT_STEAL_CORE_H
+#define __VIRT_STEAL_CORE_H
+
+#include <linux/types.h>
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+#endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

