Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298FE3E172E;
	Thu, 25 Jun 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391748; cv=none; b=pUt/MS5ejDrKkJXI5HPah5AzGi2OpfQFbFV+/XpNNh3VY7AbJcMMWBEVTzh6IGCUOsT1F+2V8Whah5lz1r2mcLX1OpcjHU5OOkJB3J0KhOAo+GEDxVIEEGTBRzrJH1CIeEY9R5mMaKud4XJD7cS2iGX6qUjbiUplW38bqlD9660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391748; c=relaxed/simple;
	bh=DAdoOICV6cn1RX+ExqiMglpJnkUwq2wCtBsBbjUSCgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsEYeYuBjvSwUtutcacdveEXjFLIkLaia/4LPlhMXmsf4RbclZoBc3OYc0YAisfgrggfBPFSFQ75VKypLsTDDN0OW7swSVaqO/JEJWgv1VRYrt7xTxadVdDRUb3PTIhtrNXb5d2z/o+0U2KrGyz3Ba8PbRAfgAUe2S410Ng0COo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=I0nJtOLc; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="I0nJtOLc"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mlk62927520;
	Thu, 25 Jun 2026 12:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=n5iuYjAZLkOVkgu3v
	X72bqF9giXsp5n4GhzcaFKqvBA=; b=I0nJtOLcOTjtP39HYDl+gRxUd7Dv6Ch8k
	BvyrKLE0xadWzJQK8G9gkxKoDz7nodKJ1aUTwrXGb/ZomYFzfYldawoS2sPCNA7T
	fzH+0kL1t579qrmUbeXKAOPqbLX0IPj43lCizsODBkVZWMff5M2Cp/u/FWFaxZ1q
	X8JPAKUl0FvjPNge72y1cG8gEz3rxA6asvRqrefwl7npcYu9i8VMJJTHz17dnpNQ
	x61qGWNngY/R/sDwdBH1dbePph0yk3OWWAWNfo38ULLyyTwNCfLaJ66r5xFhiwPu
	DnmBMYAwoZAUlkjJ948MHIb0UuV9WR97mrvItl4JuRQIRmqBqrBkQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYcUp002255;
	Thu, 25 Jun 2026 12:48:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywuu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCmksm48628034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C4820043;
	Thu, 25 Jun 2026 12:48:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53FED20040;
	Thu, 25 Jun 2026 12:48:37 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:36 +0000 (GMT)
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
Subject: [PATCH v5 12/24] sched/debug: Add migration stats due to non preferred CPUs
Date: Thu, 25 Jun 2026 18:16:36 +0530
Message-ID: <20260625124648.802832-13-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: bqzwB4xBvzcMS_eiOryJxPrDp-n2dcPU
X-Proofpoint-GUID: CzgkQ6NGyMZC-CI0s5yiDnlwdMZvLgFt
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d23b3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=-i9lZGrASMRMKgkbeRgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX8O468ZyFnkKW
 3cUnMAk2NgM1oO1H0H4OCiLvlYOSjCbhJ6tBxVAwS6WFGmqBczOzPuU//xlnQIVLRE45TSNYXsi
 CR+Jig9h0+4MYgJ1CdBwrLvOaVcZssjlOEMVetPXdGLSEJM+hGvCPQPCpQosihGhdwARMBZZ7zk
 0dTxRKjK9N044yshX8xyniMzAP54jtLyaSt+mgG9EwiZGld5Zm9SSJ5ffWIz6rebMkxv2bqh/OF
 WTA/zTaDbmjtcQU1afbRlNNqS7TP2MdyfbgjdEDqbSuyFLgCeQRmC2mj6EIAHyG9x3vC5E2h95H
 kbgttebK1tU5l/DAoQQZANqcDODQA2MbvdI8NHuXU3p24hdUZTtjtmBdacSMIgJ7WIM4jas9tv1
 pZHEXanJMXTiZ9vRX2iruS59gXTQXytgEyxAX2aeaW9apbPekJfRRTbNTii/kGXkhrunKtek9RG
 +bBgq4AGctUNlOk6P7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX1GKHoKhNjU1H
 qRN7fHu+44QXQgSwnd8v/HyPcBM6tzktIoRSAqAA3zddZa/WqmfKeDc8VKkPuRnJjZkPQAr/VWy
 QpH3qLYu0nwInOlQKDk8hs5R9bGsd18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Add a new stat.
- nr_migrations_cpu_non_preferred: number of migrations happened since
  a CPU was marked as non preferred due to high steal time.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/sched.h | 1 +
 kernel/sched/core.c   | 4 +++-
 kernel/sched/debug.c  | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 27dbf676113e..32f4743326f8 100644
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
index 1e42078251d5..fdfefdca74dc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11336,8 +11336,10 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 
 	context_unsafe_alias(rq);
 
-	if (task_rq(p) == rq && task_on_rq_queued(p))
+	if (task_rq(p) == rq && task_on_rq_queued(p)) {
 		rq = __migrate_task(rq, &rf, p, cpu);
+		schedstat_inc(p->stats.nr_migrations_cpu_non_preferred);
+	}
 
 	rq_unlock(rq, &rf);
 	raw_spin_unlock_irq(&p->pi_lock);
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index f3a033b34ba0..106b448cafb6 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1363,6 +1363,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
 		P_SCHEDSTAT(nr_forced_migrations);
+		P_SCHEDSTAT(nr_migrations_cpu_non_preferred);
 		P_SCHEDSTAT(nr_wakeups);
 		P_SCHEDSTAT(nr_wakeups_sync);
 		P_SCHEDSTAT(nr_wakeups_migrate);
-- 
2.47.3

