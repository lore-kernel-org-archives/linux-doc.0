Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624163D9DA9;
	Thu,  9 Jul 2026 21:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634288; cv=none; b=lz0LA2FRGaAHR5opPU6zXqPInIJbqvstgqy3lkwTiQqckdJn25v2dB8UDrk6i13pAUz+JHev0U5h/GXHEuzSf+ZV2X5HF8AFE/eQOirXLIzhCC9kgiS0X/w5mrhfesyso8M1Ialei1cLrE6XTK1WG7Gdgzr28W3i4LS/+cBgCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634288; c=relaxed/simple;
	bh=NWbI0r/dmFwxabkqeMwPF9EOoVP/C32fv37OB+oOQfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6VZT1AcOU3niKe/9MpfvBzWulRplmCW0ERE8BJsuSFZs6akSKz+5cDcIEDVvDmrokaOKuKLPfJJaLjyVjDCr8pwWODq2Ry4KxRqpdcw7alN9g05prmg/8WwpOLpZPRjG4I4sfKc3M9sXsa6YDaNg0xy7zzBTppLFubiImngu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oroSjBMR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oroSjBMR"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmQt11948553;
	Thu, 9 Jul 2026 21:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Z5LIXhkr2qby4wij+
	GHHrwloTcAinC+yt9iJ+us9hKk=; b=oroSjBMR+jxD4M1l9LHPqN+OlZiyxUDt/
	wTXqttEovNSRfsouFheWVsVojSzxJ49/iZ2uxv6ML7ickQ23+BvqE3YQx/9rX5VN
	e3XoqhKJDuDYA1VxZNGdhv/R7i5PyLrUBnBx/3Q4oCrBmvaN89za4rL+EN38Af/3
	KbYn/iCUBxMh+XSOSgadNc2q+UPBoJ4TpdUq0Wp9uOr4UAgy0KHe1BZAU6n6gHJ9
	hmyGdfi+AIFBNPvHd+trvvuXF9BsZ+RHWJG6IgBgDkVssRsWttTyybsIjUDIZSCT
	X3aXXgjcP76Lq1B7sr8BGHY+w4tmPHgbJlTsfRJah/Nr55BXA1D2g==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stt430n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LnhmX009382;
	Thu, 9 Jul 2026 21:57:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvwfavj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LvWJa24969686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD8F520049;
	Thu,  9 Jul 2026 21:57:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6738C20040;
	Thu,  9 Jul 2026 21:57:24 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:24 +0000 (GMT)
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
Subject: [PATCH v7 04/12] sched/core: Try to use a preferred CPU in is_cpu_allowed
Date: Fri, 10 Jul 2026 03:26:40 +0530
Message-ID: <20260709215648.1246821-5-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: IeIf3b7zfqDi1Kha2NNlPzQS1QOmINYu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXybwYkC7PRIeN
 mwv3ujX9yhgByPcLzQC7qT8r8f84vliAeSiiw7ilG7jVqzxh9uZiuHYDu2J2AiTz2/BuqJ7TEMH
 fJszJlAihJErGrFGhN1mILt5h/169GE=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a501952 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=7HQO46LoG9f-b4O6KL4A:9
X-Proofpoint-GUID: HERjhmlChec6RY1Cuhs70538ZVGDHgd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX5KFEaBIJg6JQ
 CTiHp++Z0TxYYFiic+6CrlJY4/HLADwDd8Wc4FbddU8nWQUI44HFBLH9ffWQJ9EybZsuiRygYoy
 rAVB6Vha7Lbiiycsy9glgzEhnU8He+FT+HnZKFYxaqro+ZhLb5NwKwUYHIKc0iMGowUin/N6mIQ
 rne0fUipQ61/8p7ZzO6btmk5BP1edyJY5dY6kUCuRHUdPtXDcRmUDYEFVcB+Rto2duPerWGfzP+
 18gSQa+XsI2s2wKzuGJwI6puzn/ScFeBFQD3o8yJ7YuoYGlYFozh77vk8JJTDgt/LKjs3CJtlvn
 0TZdhDxR6PwyDbTyIq8/3RwfGNFkjpjMeWbdwTIHxXII1Ax99Ex/Au6gi7F/doWQHhNzCt2Cxmu
 Zra5EVQyxKkjQfCP9vN5SEcarkp5x1iJtYX3QB7C3wJp0ytj6v7sGetuLG4o37LnVqns07I0UKb
 WJdIyod9QxWZmmbd82A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

When possible, choose a preferred CPUs to pick.

This is essential to maintain user affinities when preferred
CPUs change. A task pinned on non-preferred CPU should continue
to run there, since this is non-user triggered.

If CPU is non-preferred and task can run on other CPUs which are
currently preferred, then choose those other CPUs instead.
This is decided by checking cpus_ptr and cpu_preferred_mask
intersect or not. If yes, task has other preferred CPUs, it can
run there instead.

Overhead is minimal when CPU is preferred.

Push task mechanism uses stopper thread which going to call
select_fallback_rq and use this mechanism to pick only a preferred CPU.

This takes care of wakeup path for FAIR tasks too.
is_cpu_allowed is called to ensure wakeup happens on preferred CPUs.
With that, additional checks in available_idle_cpu is not necessary.

For majority of the cases this would still keep select_fallback_rq
as O(N). task_has_preferred_cpus which is O(N) is called only if
!cpu_preferred. Then task running there is expected to move out.
So subsequent it should run on preferred CPU. This becomes O(N**2)
only for tasks pinned only non preferred CPUs. That is rare case.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- restructured to keep the diff minimal.
- removed bulky comments.

 kernel/sched/core.c  | 12 ++++++++++--
 kernel/sched/sched.h | 12 ++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a45f7c308329..9e8eec4451b6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2509,8 +2509,12 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 		return cpu_online(cpu);
 
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
+	if (!(p->flags & PF_KTHREAD)) {
+		/* Try to use preferred CPU if task's affinity allows */
+		if (task_can_sched_on_preferred(cpu, p))
+			return false;
 		return cpu_active(cpu);
+	}
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2520,7 +2524,11 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
-	/* But are allowed during online. */
+	/* Try to keep unbound kthreads on a preferred CPU if possible. */
+	if (task_can_sched_on_preferred(cpu, p))
+		return false;
+
+	/* Otherwise, they are allowed to run on online CPU. */
 	return cpu_online(cpu);
 }
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 26ae13c86b69..6de6366f2faa 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4230,4 +4230,16 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
 
 #include "ext/ext.h"
 
+static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
+{
+	if (cpu_preferred(cpu))
+		return false;
+
+	/* Only FAIR tasks honor preferred CPU state */
+	if (unlikely(p->sched_class != &fair_sched_class))
+		return false;
+
+	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
+}
+
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.47.3

