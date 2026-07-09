Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C963D0934;
	Thu,  9 Jul 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634352; cv=none; b=Pu1zPAy7etnV2jRY5weREP5U7itJ5P2ZlHnoQXhx+To1y1Jaifhwyh9sALpLC7ielK3aAya0egzxQf10nAPjFd1p+wqdSYmGAot/iBPmkTcQtRlXSwyfuCzvy4J8xj0eC6CEh8Orc4fAOSGJeWPEhUkR72w97SYREtf4ArLzlz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634352; c=relaxed/simple;
	bh=6N7ZrbnIYkDoJhOJkvbxVBxELYr95uwplN8O9SL7Ig0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPlV5e+8JVNPXv6YhJ03WkerweSrWR5ULnOSl58Q5p4x4RVGcydvAFgKzOlM4YWhbOosDE+SrN6gIYCXn73xmyQU9DInhrLGX8U/VC6iMTcjJJQ8n9Rtg7wPqPL/dSBk937RaxNjNH7o0BP+zIs9H6hr+KYumYoGdCSi+GBJtGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HBUKeT86; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HBUKeT86"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmRtN1948570;
	Thu, 9 Jul 2026 21:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Kew6320C7IZg/NLhH
	NlzYM3cm8QOxIVQNxjjb7dOKGU=; b=HBUKeT86UUjogeWs6pkgtIDavZvh+xcVr
	Ty3qUfVd+3egOLr+GCXPSSTfTi1Jd9rVQKohlCrXcNs2avwvxXqN7OMFjLt5IQIk
	P0yrMYSu4Y1fhQt8G032fQ6i2FDH47AMiBnaJ/6uE05NmBARBU6Z3SYuuOapJxZk
	r/SeQq++PLBJBbVHXeCdzxApT67VJEe0xU1qyYkk9/VJ7zdyLlhCLyhNi5H/sNL9
	8XI/Lm5DSTTILdtnFVaP2uhC8+WJr4C8/YqjAchae9uPU+ho9auB2A+tq6lggxxA
	fSR8Hh4HnQxuPKRffe5MTUeEdBMCBR0R6UOo2Qe8BYK6a+Al18g3A==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stt432w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669Lno5r026733;
	Thu, 9 Jul 2026 21:58:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6yetuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LwaaD54854014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:58:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43FD32004B;
	Thu,  9 Jul 2026 21:58:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF95E20040;
	Thu,  9 Jul 2026 21:58:28 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:58:28 +0000 (GMT)
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
Subject: [PATCH v7 12/12] sched, virt/steal_monitor: Keep tick on for faster push on nohz_full CPU
Date: Fri, 10 Jul 2026 03:26:48 +0530
Message-ID: <20260709215648.1246821-13-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 0jABYfxwuXwWsN_DV7l1yWptIf7lARC1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX1ivTTJb88ddS
 CSXRusDdTQNwuN4lOqBoTWpqw9yL6wCTPZF6IvqL2N4sNdTYXS8a7P5Y6/E2kpmaeWyCg0C3OHH
 jmeZRobjXOBhwYwhTJ2V3LFkxBclBQ0=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a501992 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=KuZrSBSbCFBhYZNajfIA:9
X-Proofpoint-GUID: n9LCKQ78kdPvoZcTOe69GRsME-usl3HE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXy/JexvX1MVNq
 sJCYyf74ZITMUjaIAMECA75BrPAcTTZ/dOYcMQAsrHfms6aD0YQ0LrUq0Y107CKAzsWJIU1t8bo
 DPw8yL++/hkxAvfPtHViFoLXQ2/bwHa8ZWQDwbjohMOpJ7JUkpJ/Ax0iqR/OEYp1EhLDaDX8+ES
 cgkfNy2nCQJHbgAurnZtBLxyaslysIoLk/zYCPdDbCPX6qIR5Xoi9DHjWiD9ryVK8MfrjuErAof
 mfmbxsFxco/owrQ6B6/qPuR2jMJA7rVaiGB7D6Hi0gDUPCRxC8IQc3LvyfrEDOesminPG3pxJsT
 /O77h4pr4PSi0Ax1v+LRBX9LP/LzTiRhpBMZJNDXPIz7tHj/LtsCLAE0UK/vWKV04XgB+s2XahL
 Tif4HRLESzoAsE028ZGzHBF6SqDPzJ7tPOtwfLO1hueWD03yGB8kdopSF6+AY6VsI9qnj5nCysA
 71oKO7bOf1YF6eGa+zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

Enable tick on nohz full CPU when it is marked as non-preferred.
This helps to push the task out faster and in more predictable
manner on nohz_full CPUs.

Steal time handling code will call tick_nohz_dep_set_cpu with
TICK_DEP_BIT_SCHED. This helps to push the task out of nohz_full
faster as push task depends on tick.

If there is pinned task on non-preferred CPU, it may not stop the tick.
That is rare case. Even then, this preferred CPU state change can
happen only inside the guest. So even if guest stop the tick,
it may not necessary mean power saving since host disabling the
tick is what matters more.

sched_can_stop_tick flow doesn't change if cpu_preferred. On disabling
the feature, module ensure it restores the CPU as preferred.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Split into own patch as it is a optimization.

 drivers/virt/steal_monitor/defaults.c | 9 ++++++++-
 drivers/virt/steal_monitor/sm_core.h  | 1 +
 kernel/sched/core.c                   | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
index d4b016317554..1d6197eda5eb 100644
--- a/drivers/virt/steal_monitor/defaults.c
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -70,9 +70,16 @@ void decrease_preferred_cpus(struct steal_monitor *ctx)
 	if (target_cpu >= nr_cpu_ids)
 		return;
 
+	/*
+	 * set tick bit for nohz_full CPU to push the task out. Once the tasks
+	 * are pushed out, bit will be cleared if there are no tasks.
+	 */
 	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(target_cpu),
-			 cpu_preferred_mask)
+			 cpu_active_mask) {
 		set_cpu_preferred(tmp_cpu, false);
+		if (tick_nohz_full_cpu(tmp_cpu))
+			tick_nohz_dep_set_cpu(tmp_cpu, TICK_DEP_BIT_SCHED);
+	}
 }
 
 /*
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index 7c7a9bced682..bf3f82f3e0cb 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -15,6 +15,7 @@
 #include <linux/topology.h>
 #include <linux/sched/isolation.h>
 #include <linux/math64.h>
+#include <linux/tick.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1ca1eefbdaf9..6ed61182b19f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1473,6 +1473,10 @@ bool sched_can_stop_tick(struct rq *rq)
 			return false;
 	}
 
+	/* Keep the tick running until CFS tasks are pushed out */
+	if (!cpu_preferred(rq->cpu) && rq->cfs.h_nr_queued)
+		return false;
+
 	return true;
 }
 #endif /* CONFIG_NO_HZ_FULL */
-- 
2.47.3

