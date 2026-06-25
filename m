Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CB3E44F9;
	Thu, 25 Jun 2026 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391660; cv=none; b=ccgLcEAI0LCL10Ws9/3+yx1/SyVRmpWmAwtuCakzP+nvkZ5hsZDYfoXZZSYBWfZ6Kt9bZTwcX3oECsQ4yZ2EgxHt7tc1tBz7Qv7Ib+IetRu8rTYNqwqv9SSU15XCFzyTSuddbqVXy05cGcEsHD8/WNET/YZRz58Szp+E6MhJbVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391660; c=relaxed/simple;
	bh=6hTrZchiV5AJk/X26tuihcmTSWsvZP6h0yXZxNGNulg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuDB6HVbJiWh73xor/HKUwWlRfRd3VKezUlo+KcfXO8xWHx0qHc4cI6jpe4KnXFnG9bJWsMvqDgBakryZ7aNNHDsKOXG4Si0q0gVbseizXrnyfLa3VMuJeTwazlDEBjQsNCV4caDuk+KDHeD87W2a2ZMD9yXZ0L1mrcDIXIM8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=I4itWdBc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="I4itWdBc"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mV5r2977929;
	Thu, 25 Jun 2026 12:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=V9yyyP3QyUGpI4IyX
	A8YCjjiEfkcxW1/Z4BWKUgqHu4=; b=I4itWdBc5lUp9lynDj/77+amVnIWDTzMj
	CThhqUgtGYe/j8ON+tiU83daDiVILaM1Av8sZhIT3A7EJWciPS7/r4EWH2mY47CI
	zR5tcYbtvQzh6cR0GllzbZjIJzCvBO+ni2CIXo50Z2UEvgv4bAqbkYOBeLzEn3In
	hvTKNZzt6AJ7SwnGWghw9WzjnLt9DLaWhXsvd0SalW9io8dQXLDgRYh+28mmpSee
	IgMpKXCC3ZXN2fUXRJFcFFVpm/byukknEDLyoLyB3bMHws0G83JhfPHpUHwV6qkz
	Kb6T+fQhdTBqBFBy00B/fYWOs9/TirnSa0R0dqJbXUI7ZLEwC3nEw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjk4st0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:19 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYbxP002242;
	Thu, 25 Jun 2026 12:47:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywuph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PClEXe30409352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 598E320043;
	Thu, 25 Jun 2026 12:47:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D26220040;
	Thu, 25 Jun 2026 12:47:06 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:06 +0000 (GMT)
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
Subject: [PATCH v5 01/24] sched/debug: Remove unused schedstats
Date: Thu, 25 Jun 2026 18:16:25 +0530
Message-ID: <20260625124648.802832-2-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX6grs2PSN0PVL
 gjK6hIbOCzkbRlJKukHQRXvKYRAkdUy6WniKo8Xd5stHftlCV3stfV2PtXuOMTM7Xq7zejgAuy3
 oE/63DmraW10jGjkvXAyo/MqGWl+M+U=
X-Proofpoint-ORIG-GUID: wiUR34rn3ccF31_KaqRoJws0g3J6cwm-
X-Authority-Analysis: v=2.4 cv=Oph/DS/t c=1 sm=1 tr=0 ts=6a3d2357 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=zd2uoN0lAAAA:8 a=VnNF1IyMAAAA:8
 a=NlpiSR-wqh4DhfsiYFIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX6nbSezf0lv0v
 DPC5G6PTYAaj73WFEBta5+hRuxF2Gmlt/mXgVTiLIULPY7fJvyZOfqaZQOV85JOLn4w5q3oSYWo
 lV2DmlVfCToehLQ0B3Ycn8LXmi3Xnefy50TPhD7x9KEXGU3AJVLfUj5LQBFc147nzBW6GxLt6ZO
 EGpBnKOqRht4PZWFKOlKRiHb7co6FYPOesUclPqQ+Of9Wpo/7llTIVM22IbLtyTb1NvZTruwO6W
 acFNu8bs1rNSptMUM7UMUN5YhZqd/mBNzdEw1h42LPGc9T99W63jcOWlusKTEc/LuCO/rcUNpDD
 QCBS429ruzASP+3QboB+gW6jL7t2gh4BvtIy4uQziN9wWmGp0LN4gBHJxbIz/C7GOuPIinPxd2J
 d0GfCe/aU2REm5dcWLcGKbglv/ZpcodlqKmKIsTfguv44Lqy1lp3lnkDj9ClXFBO6okkSznMEw2
 I8tl7uTpuF/69jmuwSg==
X-Proofpoint-GUID: 30sYE5iGn7_SFrilXibtSKE6oDDZoMLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

nr_migrations_cold, nr_wakeups_passive and nr_wakeups_idle are not
being updated anywhere. So remove them.

These are per process stats. So updating sched stats version isn't
necessary.

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/sched.h | 3 ---
 kernel/sched/debug.c  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 35e6183ef615..fc6ecb3869dd 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -550,7 +550,6 @@ struct sched_statistics {
 	s64				exec_max;
 	u64				slice_max;
 
-	u64				nr_migrations_cold;
 	u64				nr_failed_migrations_affine;
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
@@ -563,8 +562,6 @@ struct sched_statistics {
 	u64				nr_wakeups_remote;
 	u64				nr_wakeups_affine;
 	u64				nr_wakeups_affine_attempts;
-	u64				nr_wakeups_passive;
-	u64				nr_wakeups_idle;
 
 #ifdef CONFIG_SCHED_CORE
 	u64				core_forceidle_sum;
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 40584b27ea0c..f3a033b34ba0 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1359,7 +1359,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(wait_count);
 		PN_SCHEDSTAT(iowait_sum);
 		P_SCHEDSTAT(iowait_count);
-		P_SCHEDSTAT(nr_migrations_cold);
 		P_SCHEDSTAT(nr_failed_migrations_affine);
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
@@ -1371,8 +1370,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_remote);
 		P_SCHEDSTAT(nr_wakeups_affine);
 		P_SCHEDSTAT(nr_wakeups_affine_attempts);
-		P_SCHEDSTAT(nr_wakeups_passive);
-		P_SCHEDSTAT(nr_wakeups_idle);
 
 		avg_atom = p->se.sum_exec_runtime;
 		if (nr_switches)
-- 
2.47.3

