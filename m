Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BC3B14D0;
	Thu,  9 Jul 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634352; cv=none; b=GWat192k770L2/ex2mQ68iJkRTlgr4eStmyYuwFH0k3yXJ0uH9uJgTITDk8z0cFDe5Omc5XxoZ7mzwAOxgvbTgF5EoT9QBz/HWm9VpIvDp+GEovNgWMOeqoLcN4y+oAChLrm8/hWy3WezKIBLXKnizJipGjEvIHCQuWSiEKojsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634352; c=relaxed/simple;
	bh=A1rW9nvTjdH5bXk5v/V4BQi5iDFpfCOkKg5YSAtvAi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9J10WqI2kpgP+HJLMIQtBGtBMpHeP5z9p27q40SHO4NbP4c7Ap6nLxwu5UzphkYP2XnSMbZ8ONYiEhDJHMRvQ9nuNS+hUWelkjKZtuJRmy0dwsVwjjNU6eKyr7EOPNMLPMOZaYylAl44JBbf7c8njT9n743l8wVdalsdJ6yEk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ca0QSswS; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ca0QSswS"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmV7H2860929;
	Thu, 9 Jul 2026 21:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qjBQrb+XYVyyUNuYw
	m6gSYY2MI6Cuh5D5tK7Iis8yoI=; b=Ca0QSswSPPZqG+oLsPQ8JPp0bQ9aKAm+M
	OiiSv0fdfq2J1wovzIgmBHeOy0aCPRayL5NPAiSRt+GvPYx38kokImki9aorgfo1
	4d1iHToW+06DgjA/YL9W02ynlQNBinl/4Wcu9NABc6NvprO8B1cXMXXHADeeQV2R
	FxziZUP3M1BHOOIX1YCC+s93KEzW49GTJnECXrD0clnlIXEsRqz2RZOYR0ZL227r
	gAA2f3eI+aQZUnTmMAhRTG09L7SLV9ZFg7s1xCFKhTXkls0ABspODGdoU90SKhWq
	mV1V59/apRA/BhckFmfFvZIzplw/agnxAypYtkfkDqLP0vfc4X9eA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fafh0937m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LnfaZ023369;
	Thu, 9 Jul 2026 21:58:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7eqgexfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LwSBx24969720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:58:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60CAB20049;
	Thu,  9 Jul 2026 21:58:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFD1720040;
	Thu,  9 Jul 2026 21:58:20 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:58:20 +0000 (GMT)
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
Subject: [PATCH v7 11/12] virt/steal_monitor: Act on steal time periodically and decide on preferred CPUs
Date: Fri, 10 Jul 2026 03:26:47 +0530
Message-ID: <20260709215648.1246821-12-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a50198a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=5Qv5l-8T5Df0war76qYA:9
X-Proofpoint-GUID: EglhBO0G2AkWkodFw_y3JVJDjNKzLc3_
X-Proofpoint-ORIG-GUID: bqd_C0qUZ53sCjpDWFlX4Bnccp6QveoV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX7vfxFjJev0wg
 UwjPKs1YQZR1wgOqfrOYRoiiLHCYDCRGT6F8Iu+7alRtMdbk1O1bxKf3NWmmZe8ptrBD0/ywePj
 C/Etp/D+uwVu9xLNiGGK4nOVZZkptxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXwaOA2H6/5RD4
 nc6s4f+skklD+LUfLXRzWhBLoyXsLvxCRlt9M7s4thpxxAH6YOiiv0qpotLjAoXJBZUVPao5emi
 bYcfKgGzImgATbuF70Z6PemGMm0kk0Fjsz7E9Xgh8zEohPJqzgd6v2OngUsjY2zMrD66/JGPF4l
 Jf9CG5AotsJTCOIQwHHEQBUFmk8S9ScfFzlm0wtmeD/njEVJevoWuMu63Ww8Rz0k8HKah5glM+9
 GxtP4qi2e0ndgR8is5l6sUtfz/OXBmUo6F2vw6CIqRrG8A1Hiknc0WHktkvGEX03Z669f+QuyeS
 +dJbX1iCGFlgKmbVP8kxBejeGZy2kNZ7p4q9OpAAUS8F71/HL09d+W+ynLPPeqv4ItODjt5C643
 PYaIFaFM1hbdszt/sJq2v68WpNJIiOLd503oJtrw5i9qHMHc7si9U5UKG7enBsSFHOUHZyEeb6J
 MHg3bG99qFmJqIAc8pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

schedule work at regular intervals. Interval is determined by
interval_ms parameter. schedule_delayed_work is used since interval_ms
is usually in order of milliseconds. Work need not happen instantly.

Periodic work function essentially does:
- Calculate the steal_ratio as below.

       steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())

  It is calculated to consider the fractional values of steal time.
  I.e 10 means 0.1% steal time. A few tricks such as divide by 10,000
  are used to avoid possible overflow.
- If steal value is higher than high threshold, call the method to reduce
  the preferred CPUs.
- If steal value is lower or equal to low threshold, call the method to
  increase the preferred CPUs.
- If the steal value is in between, no action is taken.
- Save the values for next delta calculations.
- Save the current direction of steal values to avoid oscillations.
  So two consecutive values of high values or low values are taken for
  decrease/increase of preferred CPUs.
- Ensure design checks are met.
  1. At least one core/CPU must be there in preferred mask.
  2. preferred CPUs is subset of active CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Merge two patches which did periodic work function.
- Misc checks for early firing, requeue work, math safety.

 drivers/virt/steal_monitor/sm_core.c | 76 +++++++++++++++++++++++++++-
 drivers/virt/steal_monitor/sm_core.h |  1 +
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 4a03c14337be..09a5c3a299c3 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -20,6 +20,12 @@ struct steal_monitor sm_core_ctx = {
 	.low_threshold = 200,	/* 2% */
 };
 
+enum sm_direction {
+	SM_DIR_INCREASE = -1,
+	SM_DIR_NONE	=  0,
+	SM_DIR_DECREASE	=  1,
+};
+
 static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
 {
 	unsigned int interval;
@@ -106,14 +112,82 @@ module_param_cb(low_threshold, &low_threshold_ops, &sm_core_ctx.low_threshold, 0
 MODULE_PARM_DESC(low_threshold,
 		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
 
+static void compute_preferred_cpus_work(struct work_struct *work)
+{
+	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
+	ktime_t now;
+
+	now = ktime_get();
+	delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));
+
+	if (unlikely(delta_ns < NSEC_PER_MSEC)) {
+		pr_err_ratelimited("steal_monitor: work scheduled too soon delta_ns: %llu\n",
+				   delta_ns);
+		goto requeue_work;
+	}
+
+	curr_steal = get_system_steal_time();
+	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
+		      curr_steal - sm_core_ctx.prev_steal : 0;
+
+	/* Update for next calculation */
+	sm_core_ctx.prev_steal = curr_steal;
+	sm_core_ctx.prev_time = now;
+
+	/*
+	 * steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())
+	 * To avoid possible overflow, divide the denominator early.
+	 * Note minimum interval is 10ms.
+	 */
+	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);
+	steal_ratio = div64_u64(delta_steal, delta_ns);
+
+	if (sm_core_ctx.prev_direction == SM_DIR_DECREASE &&
+	    steal_ratio > sm_core_ctx.high_threshold)
+		decrease_preferred_cpus(&sm_core_ctx);
+	if (sm_core_ctx.prev_direction == SM_DIR_INCREASE &&
+	    steal_ratio <= sm_core_ctx.low_threshold)
+		increase_preferred_cpus(&sm_core_ctx);
+
+	/*
+	 * mark the direction. Increasing the gap between hi and lo_threshold
+	 * helps to avoid ping-pongs.
+	 */
+	if (steal_ratio > sm_core_ctx.high_threshold)
+		sm_core_ctx.prev_direction = SM_DIR_DECREASE;
+	else if (steal_ratio <= sm_core_ctx.low_threshold)
+		sm_core_ctx.prev_direction = SM_DIR_INCREASE;
+	else
+		sm_core_ctx.prev_direction = SM_DIR_NONE;
+
+requeue_work:
+	/* maintain design constructs always */
+	WARN_ON_ONCE(cpumask_empty(cpu_preferred_mask));
+	WARN_ON_ONCE(!cpumask_subset(cpu_preferred_mask, cpu_active_mask));
+
+	/* Trigger for next sampling */
+	schedule_delayed_work(&sm_core_ctx.work,
+			      msecs_to_jiffies(sm_core_ctx.interval_ms));
+}
+
 static int __init steal_monitor_init(void)
 {
-	pr_info("steal_monitor is enabled\n");
+	pr_info("steal_monitor is enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
+		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
+
+	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
+	sm_core_ctx.prev_steal = get_system_steal_time();
+	sm_core_ctx.prev_time = ktime_get();
+
+	schedule_delayed_work(&sm_core_ctx.work,
+			      msecs_to_jiffies(sm_core_ctx.interval_ms));
+
 	return 0;
 }
 
 static void __exit steal_monitor_exit(void)
 {
+	cancel_delayed_work_sync(&sm_core_ctx.work);
 	guard(cpus_read_lock)();
 	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
 
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index ee68cd8b1944..7c7a9bced682 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -14,6 +14,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/topology.h>
 #include <linux/sched/isolation.h>
+#include <linux/math64.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
-- 
2.47.3

