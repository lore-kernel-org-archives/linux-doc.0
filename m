Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886E3B8D70;
	Thu,  9 Jul 2026 21:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634311; cv=none; b=Fa54LpIZJD2MREAKw63v1YqdxSv8NFuc7CEnpYyJwDgaEPzqvYtsaoeB/DZ/LqxQcPSI7Hy9ZVKetUv45ODAobF1NrkxHFmnP3lv/ctXhVvjEWYNrBdsOlwZJfkAP0b2eNbST/bCuVFbqac/BZvDTlsTX1xTU1LWMfsoUY6udXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634311; c=relaxed/simple;
	bh=zFLhdkSPVX3cU4VHIO6/Eer3d57paTSo+val8cPIL48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g68Yx+aHLIFI1rKJ7BlMNrcg3AS5iXd4sWppOK6OQfmSqvGQ3yH+j+7bWUD2pvX/uKfRe3/Y/f8T1F8Pp7FDWzxVpWqwvZc42cn7vhsOes32iGpIV0G3ojJnrXNlKoFBR6i2pwDQdh3V4zTDCzS9Wal0lDtmlN+r4gbBIbBnze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MIEoDtGj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MIEoDtGj"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmVwx2623604;
	Thu, 9 Jul 2026 21:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=E0DRGKpNLJpZocoMz
	k0hqdz9z+ZjTk++q3UzPLMGXfU=; b=MIEoDtGjcXqV+9o/m29KJIoethDv4Ysko
	ot1Un77tJ3BRh1Hu32qnODVqaC2g3xZij6ZtGx3R9s9lHu1WBmhgokOqOlhidoSE
	dqPmi1ClmqtE6mdA0b4299WQ5GWp+hn9P/xCWb9UJgXUMUOOLr9EhZGay2zRKF3l
	0HWp2GrQoKmWL1kC8mYSFTRIlRuX2m4gcmp5Zsg9fDwk/tHb0n5WZ2SMaZAZynB3
	JICikkhwpL6oPR5lpA7WrnTypl6zEAZK2VK5gHz+GJbtguOCG/a1YZSV5fPxhby9
	ib3CxkT2W7Fw/HtO0nBe03FsC14TMbP995Yd0sFN03AXfHz0IFp6g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw53uh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669Lo4sL025750;
	Thu, 9 Jul 2026 21:58:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7dgkf4rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669Lvuj847579560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B830A20049;
	Thu,  9 Jul 2026 21:57:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C37420040;
	Thu,  9 Jul 2026 21:57:49 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:49 +0000 (GMT)
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
Subject: [PATCH v7 07/12] sched/debug: Add migration stats due to non preferred CPUs
Date: Fri, 10 Jul 2026 03:26:43 +0530
Message-ID: <20260709215648.1246821-8-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: KgVQvuIPTnqXkQramDLMYw8AeInfXGn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXw3i8RbQ5sGvB
 SIJnr1d74SQZtaFWm1sa/5srqlxZChKi0tznzygnNGOr1balIhq4yDhy6kNDb5Dt9Y00JuyLb0n
 YJ37J94Lo3OvCIS1iWkdlqBc1wuAh8RlJjDuAIfLSiMjRVqpx2OXlFQmemM34dGQ8s4+DzBK8m7
 EEnE9nqmJPp6vej/vd2Uj1E173gq8uWtSqC1elYGsZx8sfobSJMXlcSF4Vj7+yIxC+pBaRNhPWN
 AvpBNQD4R45vB07J7Vo7ld5X1VsL8l+43MrV3PhxQ+ObzlSgXfnrtvN2GDgXRSLPPENdalAZwZ7
 91PpO0XSYZ0U3NTlCr3kyZJSRIvlC2BYuPHLoUNE+YOlzZaEsjGqWpp0gN8KQc4nn3f6hmxVz8i
 THhV+O9Ro/xU86NbMqL7n0WkZmg/nCMwwUOPH8OrI3so0eb+jXz+z0R2rwUe0FWFUHov3Y5QF6o
 t3vwwnsEaloB20sjPgg==
X-Proofpoint-ORIG-GUID: KIDFo0dyc-nu05P1MddBxc3X_wGcH_b2
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a50196b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=-i9lZGrASMRMKgkbeRgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX9MTfo8hacsLR
 grdQjBQYK2IA3e+pnU7zLnD3L7UWW6jYI3A3Cf06w+d+jEg+zrboUxKDeWeythlOWjxnsKjGK6b
 i3DgEJUmJ/WBwkeQMuSddn9ygrh2P94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090218

Add a new stat,
- nr_migrations_cpu_non_preferred: number of migrations happened since
  a CPU was marked as non preferred due to high steal time.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Check if rq indeed changed or not before increment.

 include/linux/sched.h |  1 +
 kernel/sched/core.c   | 10 ++++++++--
 kernel/sched/debug.c  |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 968b18a7f470..37849d2f1dbd 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -554,6 +554,7 @@ struct sched_statistics {
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
 	u64				nr_forced_migrations;
+	u64				nr_migrations_cpu_non_preferred;
 
 	u64				nr_wakeups;
 	u64				nr_wakeups_sync;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 74c93a88bf84..1ca1eefbdaf9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11324,8 +11324,14 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 
 	context_unsafe_alias(rq);
 
-	if (task_rq(p) == rq && task_on_rq_queued(p))
-		rq = __migrate_task(rq, &rf, p, cpu);
+	if (task_rq(p) == rq && task_on_rq_queued(p)) {
+		struct rq *dest_rq;
+
+		dest_rq = __migrate_task(rq, &rf, p, cpu);
+		if (rq != dest_rq)
+			schedstat_inc(p->stats.nr_migrations_cpu_non_preferred);
+		rq = dest_rq;
+	}
 
 	rq_unlock(rq, &rf);
 	raw_spin_unlock_irq(&p->pi_lock);
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..5ebb2055e6d5 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1446,6 +1446,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
 		P_SCHEDSTAT(nr_forced_migrations);
+		P_SCHEDSTAT(nr_migrations_cpu_non_preferred);
 		P_SCHEDSTAT(nr_wakeups);
 		P_SCHEDSTAT(nr_wakeups_sync);
 		P_SCHEDSTAT(nr_wakeups_migrate);
-- 
2.47.3

