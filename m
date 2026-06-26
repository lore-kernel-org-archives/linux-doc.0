Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D73B8D40;
	Fri, 26 Jun 2026 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782499463; cv=none; b=pcWajhSp1xrdx3HrH5u4StiSJmyAAa1TLOdQKo2vsR4cCIa2kyBwp9njWpb8EBb7AOqXySn9sQAixPQ3UqMtPsKV39nYoImS6DF/CnKYXCvRBW0hED6tO2OoWV1IBi5qZvXxphArcWig33kd75v668++R7ti2URaS8zN1jTeu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782499463; c=relaxed/simple;
	bh=YUm2A1IXx0sqg3o6plG5pBFIRzDCOdBAezZA0e3XNrE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YClWcZZIgVmDoWrbrcywd7hIg3UrgDd4NflIlk0lb89KvsHyABTZP3r9CWYnyPihAWDpkQSkPpjkwIxRi6B42M0fA9HjflK7dL6U+MGs6BjZ2yuvVBFMK69YJAPC/hFEjaBn25lGZHrZEOTnifwPd1jXO79sWsHhq5asflsn7aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NI7raMAq; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NI7raMAq"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFnm9P3362392;
	Fri, 26 Jun 2026 18:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NkIAsV
	ihwbmXYh80pHOVnaIX5MejFTh07oTa52sPVCU=; b=NI7raMAqlCwTZkYi4W30ao
	aE8j0LLfWme8lfL2jQRdlQ67NpgXmLZcrmHnyViqzuHneIlopzl4YjSXnUns1Qs7
	cyaTpxV+6trAg2CDu+9KBI3WKy+ygkN+2BGhnFEnKPA4oFvyHzMxC/ErP31lOf0B
	UszNyI5N29oX8arp6iUbTtHm4SsEST7YfTimzNZ3szmlm1FhRymyk4FUkLsc/UFo
	Hitq9xeFJ+egdR8BKvqXiX3y41bHqXjjP1timeuZ/I6840gOv9emSWKaJGQSY6pK
	rJl/LkyTBfiVDjspGsmyhIUMkG2yZak/84O4tRc1F0sceML/vX1WruY14hiOTQDQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j8djw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 18:44:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QIJbkZ032038;
	Fri, 26 Jun 2026 18:44:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7w043wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 18:44:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QIhw1C48824792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 18:43:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49B0020043;
	Fri, 26 Jun 2026 18:43:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFCBF20040;
	Fri, 26 Jun 2026 18:43:50 +0000 (GMT)
Received: from [9.124.221.28] (unknown [9.124.221.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 18:43:50 +0000 (GMT)
Message-ID: <1ace8847-db42-49a8-8d0f-6eeead1c360f@linux.ibm.com>
Date: Sat, 27 Jun 2026 00:13:49 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/24] sched/core: allow only preferred CPUs in
 is_cpu_allowed
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
        tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-7-sshegde@linux.ibm.com> <aj55TIWls4HKYj5b@yury>
 <0a223931-5172-4ed5-a9f8-c2b316a0f6cc@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <0a223931-5172-4ed5-a9f8-c2b316a0f6cc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: gdTsIHbBhH8y5f_lu9F23Hpg4TXL1x0b
X-Proofpoint-GUID: vMQfvDbRYvULSRVP12_cDL3aeKS8zjFI
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3ec873 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=suLHstatZ_cHQj-LsVMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE1MiBTYWx0ZWRfX5XJkkRMBFkqE
 0+F1/aUAsbx6lDqOcthnsN8yVu39qBOGTiGss6kNhdPdOOOwiJGL+P92KPI3Gk7wrYW7JhXGw0J
 RPlYaUBGEVvG7d/8C+Q5BZlxEOg33VLPi3ZAy1wq0pBhE4K2bzZnNXV0f/PqjWTJhD6oaD9Hurw
 uvg6nDR6CZXwt9SeEOTwwI7Qzl5cGtGiEPWFRLkLyjHNUJSaPq08Fz866YbKJmp3FOc6MXYfMAx
 aZW920s5kdWjpH0vde0Aax3cDO1WMzOEJ+0pe4XjTpZfaB8K4x9fLV760t4QAzxNVOPDxwW3l+t
 TWJYJ3LK0WpStgIq7e7+4iJvnTQ4j6d1Ga09lXwy5ezoUkUEBTespEkQE0VqbjHo1TdzaVPRxKY
 UciAPWlf3onvFLULZeHijBvyznhkJeGUZspvoWORLDZa9meG7+mtYwKrH+GZq9zCxbkr9Aw1kp4
 XD0/mN0kbIXXHlthkAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE1MiBTYWx0ZWRfX0DvxDBm1jSNM
 HmyLIID6J74HeJ1CTsOsVSw4/0iKfzmXWh993V4Mt8Cax67+faeTT5gyem9DGCSXzg4vmnGK1uT
 Uz01E6TnRNg9fzeJnA0n/QWpBYTnA4I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260152

Hi Yury.

On 6/26/26 6:55 PM, Shrikanth Hegde wrote:
> Hi Yury. Thanks for going through the patches.
> 

[...]

>> So, you've got 3 options to declare the status: self-explaining enum,
>> self-explaining #defines, and this random numbers explained in
>> comment. The latter option is the worst to me.
> 
> ok. I will define the enums.
> 
>>
>> And you didn't provide any benchmark advocating this caching
>> optimization.


I did below to see. Made interval as 100ms.
Ran ./hackbench 30 process 30000 loops in both the VM at the same time.
Values are average of 5 runs.

With optimization:
13.6 seconds

Without optimization:
13.8 seconds

>>
>> Sorry, but NAK.
>>
> 
> If we move to local variable then this won;t be necessary,
> just enum's would be enough (I think). Let me go stare at it.

I have made it use the local variable instead. There maybe better names
for variable, put something quickly to check the idea.
Effectively this PATCH 6 becomes:

Does this seems better?
Please let me know your comments.

---

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9e16946c9d62..fafedd52611f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2498,8 +2498,10 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
   * Per-CPU kthreads are allowed to run on !active && online CPUs, see
   * __set_cpus_allowed_ptr() and select_fallback_rq().
   */
-static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
+static inline bool is_cpu_allowed(struct task_struct *p, int cpu, int cached)
  {
+       bool task_check_preferred_cpu;
+
         /* When not in the task's cpumask, no point in looking further. */
         if (!task_allowed_on_cpu(p, cpu))
                 return false;
@@ -2508,9 +2510,24 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
         if (is_migration_disabled(p))
                 return cpu_online(cpu);
  
+       /*
+        * This is essential to maintain user affinities when preferred
+        * CPUs change. A task pinned on non-preferred CPU should continue
+        * to run there, since this is non-user triggered.
+        *
+        * If CPU is non-preferred and task can run on other CPUs which are
+        * currently preferred, then choose those other CPUs instead.
+        * Overhead is minimal when CPU is preferred.
+        */
+       task_check_preferred_cpu = !cpu_preferred(cpu) &&
+                                  task_has_preferred_cpus(p, cached);
+
         /* Non kernel threads are not allowed during either online or offline. */
-       if (!(p->flags & PF_KTHREAD))
+       if (!(p->flags & PF_KTHREAD)) {
+               if (task_check_preferred_cpu)
+                       return false;
                 return cpu_active(cpu);
+       }
  
         /* KTHREAD_IS_PER_CPU is always allowed. */
         if (kthread_is_per_cpu(p))
@@ -2520,6 +2537,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
         if (cpu_dying(cpu))
                 return false;
  
+       /* Try on preferred CPU first if possible*/
+       if (task_check_preferred_cpu)
+               return false;
+
         /* But are allowed during online. */
         return cpu_online(cpu);
  }
@@ -2595,7 +2616,7 @@ static struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
         __must_hold(__rq_lockp(rq))
  {
         /* Affinity changed (again). */
-       if (!is_cpu_allowed(p, dest_cpu))
+       if (!is_cpu_allowed(p, dest_cpu, NO_CACHED_VAL))
                 return rq;
  
         rq = move_queued_task(rq, rf, p, dest_cpu);
@@ -3547,7 +3568,15 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
         int nid = cpu_to_node(cpu);
         const struct cpumask *nodemask = NULL;
         enum { cpuset, possible, fail } state = cpuset;
-       int dest_cpu;
+       int dest_cpu, has_preferred_cpu;
+
+       /*
+        * Cache the value whether task's affinity spans preferred CPUs.
+        * This helps to avoid repeating the same for each CPU
+        * later in the loop.
+        */
+       has_preferred_cpu = task_has_preferred_cpus(p, NO_CACHED_VAL) ?
+                           TASK_HAS_PREFERRED_CPUS : TASK_NO_PREFERRED_CPUS;
  
         /*
          * If the node that the CPU is on has been offlined, cpu_to_node()
@@ -3559,7 +3588,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
  
                 /* Look for allowed, online CPU in same node. */
                 for_each_cpu(dest_cpu, nodemask) {
-                       if (is_cpu_allowed(p, dest_cpu))
+                       if (is_cpu_allowed(p, dest_cpu, has_preferred_cpu))
                                 return dest_cpu;
                 }
         }
@@ -3567,7 +3596,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
         for (;;) {
                 /* Any allowed, online CPU? */
                 for_each_cpu(dest_cpu, p->cpus_ptr) {
-                       if (!is_cpu_allowed(p, dest_cpu))
+                       if (!is_cpu_allowed(p, dest_cpu, has_preferred_cpu))
                                 continue;
  
                         goto out;
@@ -3632,7 +3661,7 @@ int select_task_rq(struct task_struct *p, int cpu, int *wake_flags)
          * [ this allows ->select_task() to simply return task_cpu(p) and
          *   not worry about this generic constraint ]
          */
-       if (unlikely(!is_cpu_allowed(p, cpu)))
+       if (unlikely(!is_cpu_allowed(p, cpu, NO_CACHED_VAL)))
                 cpu = select_fallback_rq(task_cpu(p), p);
  
         return cpu;
@@ -6467,7 +6496,7 @@ static bool try_steal_cookie(int this, int that)
                 if (p == src->core_pick || p == src->curr)
                         goto next;
  
-               if (!is_cpu_allowed(p, this))
+               if (!is_cpu_allowed(p, this, NO_CACHED_VAL))
                         goto next;
  
                 if (p->core_occupation > dst->idle->core_occupation)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c7c2dea65edd..949c044702c1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4213,4 +4213,32 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
  
  #include "ext.h"
  
+enum task_preferred_cached {
+       TASK_NO_PREFERRED_CPUS = -1,
+       NO_CACHED_VAL,
+       TASK_HAS_PREFERRED_CPUS,
+};
+
+/*
+ * Value is cached when called via select_fallback_rq().
+ *
+ * TASK_NO_PREFERRED_CPUS : Cached and preferred CPUs exists in task's
+ *                          affinity.
+ * NO_CACHED_VAL:           Not cached and need to evaluate.
+ * TASK_HAS_PREFERRED_CPUS: Cached and preferred CPU doesn't exits
+ *                          task's affinity
+ *
+ * Only affects FAIR task.
+ */
+static inline bool task_has_preferred_cpus(struct task_struct *p, int cached)
+{
+       /* Only FAIR tasks honor preferred CPU state */
+       if (unlikely(p->sched_class != &fair_sched_class))
+               return false;
+
+       if (cached)
+               return cached > 0;
+       else
+               return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
+}
  #endif /* _KERNEL_SCHED_SCHED_H */

