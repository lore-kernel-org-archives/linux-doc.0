Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE828DC4;
	Tue, 30 Jun 2026 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800806; cv=none; b=AC9WUEU98HzI56mvWEWWxD5jtYPwvxUcV8IWWY5tWdx68pz4LDmXLEnWBlDyC1jpcJyWWmyUTS+ZfnEOnrihVDCythGCtgmtqiuYUoD0qWDUv73kc+asQjAAPFYIz4VWUsdS//qrdd20ZxKphzO7888p0ZnvBlitRl4Q8yp+ROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800806; c=relaxed/simple;
	bh=7/24jukL3vY1Ti8ARpb0x3kPvFruTrkwOzHbMqhh3KY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z4gPYHaPBWdnS7JwYCIvZZiHhaoJIgPg0gNUeFCG3fyIgzBGUoHWa6ICZvj30TZ8YWIQZ4MiBSPFi/Fd8px3DxKfi5+wdyskKW4H1F9NBOpDnDmycMchrARfWEPWmMq2sN+F4AXj99cD9Db5IR29Cu0MTVdwjaOhVBoGwYt7RoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kP0DU5et; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kP0DU5et"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5mGSQ1137140;
	Tue, 30 Jun 2026 06:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0ek1bq
	w0Kwti1cwrttVU+TvVRCSyDQLnQzSgUG3xG3g=; b=kP0DU5etUY9ET3UbdjoX18
	GTiZfNKeqZ2UgAED6ITyDekXK7moOarBDJHM4X3P0/dtcBgk4/44OYnCF2hViOfB
	CMZpytlJNBox9EEMIdgAIplZ42DfBtLF31uUkQWh5VoOi4gIrmnZtg5Nc5ZAsRVF
	lhoxXIoR3Tae8DsW9c/QBlUL7kYclwqZtkXpWlmtsKTUGis1v7DXLwn5MQ1Ii7WJ
	HJ21Cr/OJkDG9IXCo6DBnHhLktO8CQ99k6wDvSph1hMA8Rfp31EYmej0mLszTBvk
	P1+4HOg2JrCOARiPHfY3emuuICK2r0rxgxDUICdECPeDkCL6f4KL4iEIyJrBCrNQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5n4ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 06:26:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U6Jc7a020181;
	Tue, 30 Jun 2026 06:26:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2suk0thp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 06:26:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65U6QE7n55116194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jun 2026 06:26:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37CBE20043;
	Tue, 30 Jun 2026 06:26:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F75420040;
	Tue, 30 Jun 2026 06:26:01 +0000 (GMT)
Received: from [9.67.16.104] (unknown [9.67.16.104])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Jun 2026 06:26:01 +0000 (GMT)
Message-ID: <b91782dc-cde0-4291-949d-0cc804c1f477@linux.ibm.com>
Date: Tue, 30 Jun 2026 11:55:59 +0530
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
To: Yury Norov <yury.norov@gmail.com>, kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-7-sshegde@linux.ibm.com> <aj55TIWls4HKYj5b@yury>
 <0a223931-5172-4ed5-a9f8-c2b316a0f6cc@linux.ibm.com>
 <1ace8847-db42-49a8-8d0f-6eeead1c360f@linux.ibm.com> <akHv_4l0izJb6TgZ@yury>
 <e6570eac-e675-4b9b-8d1b-516965cd2207@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <e6570eac-e675-4b9b-8d1b-516965cd2207@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX1p3gUs34uo9o
 +7NAURvGw0XiFxdoivzMjNjipYo9dPw6PmhaWZmBiiCZpIKy7HK0HRcebQfEw/Ae2goKmen+CF+
 1zFEgKbmLYhg7n/QgRJy84oyvw2KzJgyefOjxlGATnH6BjdlZl/5WH0/wzbJoJ7WXO/I+guNNzz
 VtObN+gVlWqqeeJVseTtsRc/pktSeTA1UcncpVShKDBymEPnibJaXZjUzfifOva1Zbhgi0gGc3u
 7gBU+qZj8OVUs/1oFtmuMQraMLAdcJQkMM67pQJhIusPZ0+gg7jm19FuDvGUouo4fjrv1iv+nUj
 qsKSJBe9GzE3v4z5UvyME27Ro2fesZezlLChxv/jdjGx9NR9KDnq+HWc7JRf02tZhUxqBcwSCWT
 Jr18HEo2rettHEJnHGHxLNCtjhZj4YVJ6Umta820H7b12PCW2GkQP6Rr23IJmDyLcyUhIKW/ZEs
 kYUn6jg5wWhcIjLYrMQ==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a43618c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=GsIA1Zr5c6QkJihlXVMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AbIom81uk21UFWeTm9i5EIQy86dQD60I
X-Proofpoint-GUID: HcH_1eICOEtDrdevMpO13axuPQy_OwA5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX7MJk7vWkppDr
 8/Degc5pbfEJAN0ztillTKFLR44vwKLV23mu6BRu1Zm8CLuRsYRYbcHAtA1h9DCe3bPOUlHIn4f
 F7SfyMFm5rJLXbKpKiC5CReV6vjI9Bk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300051

Hi Yury, Prateek,

On 6/29/26 9:44 AM, Shrikanth Hegde wrote:
> Hi Yury.
> 

>> Just as said on previous round. Please order your series such that the
>> core logic goes first, and all sorts of complications, like this
>> optimization, are appended at the end.
> 
> Ok. I will split it up into two patches.
> 
> One without any optimization but with comment explaining the rare case 
> of N**2.
> Second one at the end of the series, with a patch do the optimization.
> 
>>
>>> ---
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 9e16946c9d62..fafedd52611f 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -2498,8 +2498,10 @@ static inline bool rq_has_pinned_tasks(struct 
>>> rq *rq)
>>>    * Per-CPU kthreads are allowed to run on !active && online CPUs, see
>>>    * __set_cpus_allowed_ptr() and select_fallback_rq().
>>>    */
>>> -static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>> +static inline bool is_cpu_allowed(struct task_struct *p, int cpu, 
>>> int cached)
>>>   {
>>> +       bool task_check_preferred_cpu;
>>> +
>>>          /* When not in the task's cpumask, no point in looking 
>>> further. */
>>>          if (!task_allowed_on_cpu(p, cpu))
>>>                  return false;
>>> @@ -2508,9 +2510,24 @@ static inline bool is_cpu_allowed(struct 
>>> task_struct *p, int cpu)
>>>          if (is_migration_disabled(p))
>>>                  return cpu_online(cpu);
>>> +       /*
>>> +        * This is essential to maintain user affinities when preferred
>>> +        * CPUs change. A task pinned on non-preferred CPU should 
>>> continue
>>> +        * to run there, since this is non-user triggered.
>>> +        *
>>> +        * If CPU is non-preferred and task can run on other CPUs 
>>> which are
>>> +        * currently preferred, then choose those other CPUs instead.
>>> +        * Overhead is minimal when CPU is preferred.
>>> +        */
>>> +       task_check_preferred_cpu = !cpu_preferred(cpu) &&
>>> +                                  task_has_preferred_cpus(p, cached);
>>> +
>>>          /* Non kernel threads are not allowed during either online 
>>> or offline. */
>>> -       if (!(p->flags & PF_KTHREAD))
>>> +       if (!(p->flags & PF_KTHREAD)) {
>>> +               if (task_check_preferred_cpu)
>>> +                       return false;
>>>                  return cpu_active(cpu);
>>> +       }
>>>          /* KTHREAD_IS_PER_CPU is always allowed. */
>>>          if (kthread_is_per_cpu(p))
>>> @@ -2520,6 +2537,10 @@ static inline bool is_cpu_allowed(struct 
>>> task_struct *p, int cpu)
>>>          if (cpu_dying(cpu))
>>>                  return false;
>>> +       /* Try on preferred CPU first if possible*/
>>> +       if (task_check_preferred_cpu)
>>> +               return false;
>>> +
>>>          /* But are allowed during online. */
>>>          return cpu_online(cpu);
>>>   }
>>> @@ -2595,7 +2616,7 @@ static struct rq *__migrate_task(struct rq *rq, 
>>> struct rq_flags *rf,
>>>          __must_hold(__rq_lockp(rq))
>>>   {
>>>          /* Affinity changed (again). */
>>> -       if (!is_cpu_allowed(p, dest_cpu))
>>> +       if (!is_cpu_allowed(p, dest_cpu, NO_CACHED_VAL))
>>>                  return rq;
>>
>> This thing I really dislike. The unrelated code should not be
>> affected. You can make it less visually invasive with:
>>          #define is_cpu_allowed(p, cpu) __is_cpu_allowed(p, cpu, 
>> NO_CACHED_VAL)
>>
>> Please reconsider your code to have the changes better localized.
>>
>> Thanks,
>> Yury
>>
> 
> That was typed out too fast. I did refactor something like that later.
> But i will split this into twp patches as said above.
> 
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9e16946c9d62..a1b21c21aa9c 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2498,8 +2498,11 @@ static inline bool rq_has_pinned_tasks(struct rq 
> *rq)
>    * Per-CPU kthreads are allowed to run on !active && online CPUs, see
>    * __set_cpus_allowed_ptr() and select_fallback_rq().
>    */
> -static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
> +static inline bool __is_cpu_allowed(struct task_struct *p, int cpu,
> +                                   int pref_state)
>   {
> +       bool task_check_preferred_cpu;
> +
>          /* When not in the task's cpumask, no point in looking further. */
>          if (!task_allowed_on_cpu(p, cpu))
>                  return false;
> @@ -2508,9 +2511,24 @@ static inline bool is_cpu_allowed(struct 
> task_struct *p, int cpu)
>          if (is_migration_disabled(p))
>                  return cpu_online(cpu);
> 
> +       /*
> +        * This is essential to maintain user affinities when preferred
> +        * CPUs change. A task pinned on non-preferred CPU should continue
> +        * to run there, since this is non-user triggered.
> +        *
> +        * If CPU is non-preferred and task can run on other CPUs which are
> +        * currently preferred, then choose those other CPUs instead.
> +        * Overhead is minimal when CPU is preferred.
> +        */
> +       task_check_preferred_cpu = !cpu_preferred(cpu) &&
> +                                  task_has_preferred_cpus(p, pref_state);
> +
>          /* Non kernel threads are not allowed during either online or 
> offline. */
> -       if (!(p->flags & PF_KTHREAD))
> +       if (!(p->flags & PF_KTHREAD)) {
> +               if (task_check_preferred_cpu)
> +                       return false;
>                  return cpu_active(cpu);
> +       }
> 
>          /* KTHREAD_IS_PER_CPU is always allowed. */
>          if (kthread_is_per_cpu(p))
> @@ -2520,10 +2538,19 @@ static inline bool is_cpu_allowed(struct 
> task_struct *p, int cpu)
>          if (cpu_dying(cpu))
>                  return false;
> 
> +       /* Try on preferred CPU first if possible*/
> +       if (task_check_preferred_cpu)
> +               return false;
> +
>          /* But are allowed during online. */
>          return cpu_online(cpu);
>   }
> 
> +static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
> +{
> +       return __is_cpu_allowed(p, cpu, PREFERRED_CPU_UNKNOWN);
> +}
> +
>   /*
>    * This is how migration works:
>    *
> @@ -3547,7 +3574,15 @@ static int select_fallback_rq(int cpu, struct 
> task_struct *p)
>          int nid = cpu_to_node(cpu);
>          const struct cpumask *nodemask = NULL;
>          enum { cpuset, possible, fail } state = cpuset;
> -       int dest_cpu;
> +       int dest_cpu, pref_state;
> +
> +       /*
> +        * Cache the value whether task's affinity spans preferred CPUs.
> +        * This helps to avoid repeating the same for each CPU
> +        * later in the loop.
> +        */
> +       pref_state = task_has_preferred_cpus(p, PREFERRED_CPU_UNKNOWN) ?
> +                       PREFERRED_CPU_EXISTS : PREFERRED_CPU_NONE;
> 
>          /*
>           * If the node that the CPU is on has been offlined, cpu_to_node()
> @@ -3559,7 +3594,7 @@ static int select_fallback_rq(int cpu, struct 
> task_struct *p)
> 
>                  /* Look for allowed, online CPU in same node. */
>                  for_each_cpu(dest_cpu, nodemask) {
> -                       if (is_cpu_allowed(p, dest_cpu))
> +                       if (__is_cpu_allowed(p, dest_cpu, pref_state))
>                                  return dest_cpu;
>                  }
>          }
> @@ -3567,7 +3602,7 @@ static int select_fallback_rq(int cpu, struct 
> task_struct *p)
>          for (;;) {
>                  /* Any allowed, online CPU? */
>                  for_each_cpu(dest_cpu, p->cpus_ptr) {
> -                       if (!is_cpu_allowed(p, dest_cpu))
> +                       if (!__is_cpu_allowed(p, dest_cpu, pref_state))
>                                  continue;
> 
>                          goto out;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c7c2dea65edd..6a352d235503 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -4213,4 +4213,33 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
> 
>   #include "ext.h"
> 
> +/*
> + * PREFERRED_CPU_UNKNOWN: Unknown and need to evaluate.
> + * PREFERRED_CPU_NONE  : Known and No preferred CPUs exists in task's 
> affinity.
> + * PREFERRED_CPU_EXISTS: Known and preferred CPU exists in task's 
> affinity.
> + */
> +
> +enum task_preferred_cached {
> +       PREFERRED_CPU_UNKNOWN,
> +       PREFERRED_CPU_NONE,
> +       PREFERRED_CPU_EXISTS,
> +};
> +
> +/*
> + * Value is known when called via select_fallback_rq(). This helps to
> + * avoid calling cpumask_intersects repeatedly in the loop.
> + *
> + * Only affects FAIR task.
> + */
> +static inline bool task_has_preferred_cpus(struct task_struct *p, int 
> pref_state)
> +{
> +       /* Only FAIR tasks honor preferred CPU state */
> +       if (unlikely(p->sched_class != &fair_sched_class))
> +               return false;
> +
> +       if (pref_state != PREFERRED_CPU_UNKNOWN)
> +               return pref_state == PREFERRED_CPU_EXISTS;
> +
> +       return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> +}
>   #endif /* _KERNEL_SCHED_SCHED_H */
> 

I was thinking caching the value can cause affinity to be reset,
because there is no protection of mask change within the loop of
select_fallback_rq. So i did some testing, and
I hit a case in practice with 10ms as interval with explicit
affinities on overlapping preferred and non-preferred CPUs and hotplugging
specific CPUs. caching exposes this race

Lets say task affined to 464-479 and preferred mask is 0-471 (472-479 is non preferred)

CPU468                                                     CPU0
select_fallback_rq
   - pref_state = PREFERRED_CPU_EXISTS
	(Now preferred_mask becomes 0-463, but             (Changes preferred to 0-463)
          before any further call to is_cpu_allowed
          is made)
   - is_cpu_allowed tries to find a preferred
     CPU since cached state says one exists.
   - is_cpu_allowed is called twice (once on nodemask,
     and once on p->cpus_ptr) but cached state remains the
     same.
   - no CPU found, fallback to reset to possible CPUs.


Without cached state, there is evaluation on each !preferred CPU
and such race isn;t possible between two calls. So chance of race
is extremely rare if non-existent.
I couldn't hit the same race in any permutations I tried.

Even if we take task was affined to only one CPU and mask changed between &&.
!cpu_preferred(cpu) && task_has_preferred_cpus(p);

Two cases.
Case 1: cpu was marked as preferred and after && it got removed from preferred_mask.
In that case task may end up on non-preferred CPU and it gets pushed out if possible.
No reset of its affinity.

Case 2: cpu was non-preferred and now it became preferred after && Now cpumask_intersects
will be true true and task_has_preferred_cpus is true as well, but this CPU will be skipped.
But second call in select_fallback_rq will ensure it returns the since cpu_preferred check
will succeed. Since select_fallback_rq is called on task_cpu(p) where it previously ran,
first check may fail due to race, but second one can't since evaluation between the two can't
be more than 1ms.

* So I will drop this optimization of caching the state for now *
