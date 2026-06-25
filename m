Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804E63E172A;
	Thu, 25 Jun 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391806; cv=none; b=PRe+d0So1fG4+qOimGDUvXwTf7XPc/O5junAiLwPwYbpsDOEf1xUUO4d81gxX8GZfNleijA3jdMW5ym/MquIJSNpZeyZGms+yxXrEI5Y+4Xs2x+tANV2YlutUBFu02pb/wWU5oKCxm51K2uTh2RjQhIf2ZQkgkJplJ7OUQBb2+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391806; c=relaxed/simple;
	bh=beJCNGuHmBSdIkU9wnHIMXIwoYlfSM3bXYXM2fEIUC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umPbq4HLtBd+o6PiN2tAmqeDk68D5gAH+ar6eZqAzTDERZKgwZ7VDldwEbfJT/cFOg2jY9MQI4hKbwKT83M2mg4CFRytwRh5eYj/W/AHqcEzHAyvTKxoZW1JXQUIUJijPw3M0DZXqSoFgsSBWSPiKS5x/LM0mpBr77gMkudZf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qG9hCcKd; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qG9hCcKd"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3n26t2890171;
	Thu, 25 Jun 2026 12:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5yg028Tlw2O6fq3hN
	bBHpZOQIzg5eY4W6QHRugQrGa0=; b=qG9hCcKdorOrT+MLgLTIFkTS3UvITOdh+
	/cn7eNq4xtAis0H0x7rxdmmiEhy4tYjt6FqZefbxRsLZIuwGrOMi3cKn8YtGfz3W
	92JAKGlmKxzQLrvzs5pdY+t/GSfj/9maXKkJ18aBzHE5xVayw8tFwWwGZqQulsyf
	vc3ZbwpDa8OMej4XRm6a3BYnLOUZLmqiwnAXFisl/aHrqwQkluC2DG/1tkAi1U/C
	OFGjNAxXnhy8o8qb8DpA6cHUzt1I98mm8LPKQ6G6tzCYBwGGmx2jAx7NbA+WYaAU
	4C9sAE7cIwQxVibpmXXQGJfVKIxeLUWSveZPfDcbH6WICXPlQKdFw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjgt1cu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCnexV003719;
	Thu, 25 Jun 2026 12:49:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex56qpcht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:47 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnhki16187752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3769820043;
	Thu, 25 Jun 2026 12:49:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA8BA20040;
	Thu, 25 Jun 2026 12:49:35 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:35 +0000 (GMT)
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
Subject: [PATCH v5 19/24] virt/steal_monitor: Provide default method to get systemwide steal time
Date: Thu, 25 Jun 2026 18:16:43 +0530
Message-ID: <20260625124648.802832-20-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX9pvOmhDCw66T
 JPGZ1j4ExxNdZARbZKV6Y2tbDwvYIcxm2U7toWsJH5e/asojj/7YHvYhFf1jhABQWdYg/N25s85
 pCnonGm4QgyTpGY1PdFho29VpuK65vU5m3bBHh8jomydcv7tvFwBvUsBOWmrLv0CjOVUauOn32m
 qBlF6Tb6t7x+Aaq0gjwu9lRu5OrnGbC/diD5S08FJaF5wfki8/tapd6LOTeNKS4bkRmO13yIptZ
 HkWUpe6lvKl8Z9m4yUnAEFat2uxO1QgBN2/jv3ChNTuWs8WTWkYrVI5ScDGCe3wHjXPG8jwFnCW
 EedmoNVMseumr7+6jqdzAuuNTJqmQzq9pJW2Cn8YdZaQ/yeWmQfD7p2Pez9fjVerQAGCZ2dgQV8
 wjyTgJTu46lyWsl6EjeSu9uYqXzB6ZgPH9XDh/stai5Ow0O74LgCV6MWot0zSQTrNN8MFREtRTq
 LVr3aqn26x2PmFDTh3Q==
X-Proofpoint-GUID: i7CLaC5ctnu3dR0FUS5VMhRmW5ZbCPh-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX3NSZxsO51I9Q
 8d2ozcj4GmzKUJGsTC85onvPA4mtJxBkU9/IbcZIxbImMfd6j2P4896cMPiA4atzk/so1MFx5H7
 pyN/gRDG9ks5cOdHQckJYon+sCxYZPQ=
X-Authority-Analysis: v=2.4 cv=I/lVgtgg c=1 sm=1 tr=0 ts=6a3d23ec cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=9L0ZHhdhMRvobD8z1-oA:9
X-Proofpoint-ORIG-GUID: bMp3t-QnvZKhni-f1zc1jfT6EbX_tzyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

steal monitor takes global view of steal time instead of individual
vCPU. For this collect overall steal values across all the vCPUs or
vCPUs of interest.

Default implementation chooses steal time across all active CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- new patch

 drivers/virt/steal_monitor/Makefile   |  2 +-
 drivers/virt/steal_monitor/defaults.c | 27 +++++++++++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h  |  2 ++
 3 files changed, 30 insertions(+), 1 deletion(-)
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
index 000000000000..17f57afacbe6
--- /dev/null
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -0,0 +1,27 @@
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
+	for_each_cpu(tmp_cpu, cpu_active_mask)
+		total_steal += kcpustat_cpu(tmp_cpu).cpustat[CPUTIME_STEAL];
+
+	return total_steal;
+}
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index d50138ad8c42..e09745a2b813 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/cpumask.h>
 #include <linux/workqueue.h>
+#include <linux/kernel_stat.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
@@ -22,4 +23,5 @@ struct steal_monitor {
 
 extern struct steal_monitor sm_core_ctx;
 
+u64 get_system_steal_time(void);
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

