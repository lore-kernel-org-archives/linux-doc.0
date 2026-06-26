Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7A3DB335;
	Fri, 26 Jun 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480380; cv=none; b=Stbt6kol3zvZqYJ+jcVzk2ykXYlM6cJM1OXksQqi6CsVuZturB/NUzPG2NC2BC52ldT/GRnRilCvbcPXNvL0jfb5BnatwdN51daR+NQDMV3GNHMzsQsTRfSSc+d5lmJif6eouCP2Z7O9wYWC+KNOHmX4zoJKeJEftUilQy7/Vxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480380; c=relaxed/simple;
	bh=RSeiyYmzbfzGCs0mZQcadNV1qxHvUgr5gbgLMCpJ3Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWAjiD25P4NGUWiL7tzC8E7SaM8NluOu6lt38t2FOd2UvJAyU9U/R58yj3bl+eFRt4PwWFYUiJVUDJ+RY9L3/O80h68ucTpdqHizqdSC6E18JiC7JZnC4Gd6RfYHtJNPhyhCr9nsoAqhP0IXXUg3QiPyMBVwzr5c7UKz+3skgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AZvsLgmq; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AZvsLgmq"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAIaCl2761357;
	Fri, 26 Jun 2026 13:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R3tMJX
	f2SYEvFW4TuxCLOwFm/2R+StZZhyNPCODn5yo=; b=AZvsLgmqUp69/mQPs3ZyvQ
	QSRFlDEyt+sKAon0/2YWcnKfeNq6g9STg0vlk7rUR3RZt8DYNg046ej7SOlxLU6K
	MsYLPi3VEyDSbrq7qxJJOL+Ss7JQBL1t6hNcipNCf06lU1zIFfifE4gDyeQS+Xpj
	aW1fSQaWOzoySHB9hQYDr+ERUxaDXijeyaGaJmLbDWv119kVMxnuEE6+lVqzY/fK
	4oT4jXGEVhUxkqG3siypMtcxaveDaPNfflikLNV6fZrcbh7V2RzeWd6yJ/AbXyVu
	VmiSjUyvKbOUF84rtV7MLv8um3ZExQk9f7GMFqwStHr8N6AsbJStNx55SwAfmHQw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3ya4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:25:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QDJgAi027592;
	Fri, 26 Jun 2026 13:25:48 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66kk97d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:25:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QDPiYQ43712938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:25:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C7E92004F;
	Fri, 26 Jun 2026 13:25:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 840B22004B;
	Fri, 26 Jun 2026 13:25:37 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:25:37 +0000 (GMT)
Message-ID: <0a223931-5172-4ed5-a9f8-c2b316a0f6cc@linux.ibm.com>
Date: Fri, 26 Jun 2026 18:55:36 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/24] sched/core: allow only preferred CPUs in
 is_cpu_allowed
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
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aj55TIWls4HKYj5b@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3e7dde cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=Uar9qs1gPAmQdHZrbLMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX6yAR8Gr+1s1U
 tDZ6TV9lGj7sDROd1eelAUKDIouwzVw83K47Uz+P8wmc79LIWSDSYENJ6OBlErb9hGRRIVJVQQK
 8bWAmfxBHpXj60KdVkCxndsoifJBIGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX9pDyNAAM8EWp
 /WFs8v3ucCgyQhMnLU8OHChWWd2A5HyW+geP2m7Ly8Eljh7f34Tw7fZLAd2KPT31CC/QSsSIKcL
 q40Md8xZ6ZEE3PatDGmbIhn3T58MomUpxM1a2kRx8Wzr0AKouFHbhAEyJHBP92MJsy9Y0cQB61s
 TXXhnP9HDMUvzo6fSTkMU8Ut+8oaL4+otR45mpJnLtWaNUCfdfqJTB7LicSMDPqXLcxTNGV2PYv
 gp9APTFmYqtVH9XEvteWJzhMQP7dW1WodMacjGFJ58q/6YDgBntBAQJ310ig0Q8uoz8ZbUUiSuJ
 L2c1OQ7OMDZmkQFZoe7RKOY5LeffNfhSvoqBqc8VikS0g/ttauCgyKPM6SfmhTtejfaUqxl3jce
 G42UfzUTvgZOJMqIXoEepqa0IBvUHfXZEb9sGogQU9B0iwfddfFxR2EvFNQ920Gu2C+WTU5ieZu
 +sG0wKV+Gy3Af8UVMFQ==
X-Proofpoint-ORIG-GUID: sqKQnRKtWiTvguEvtzRglq4qmlcf4JhE
X-Proofpoint-GUID: 8ey_P4hnXg9NZCTTkN_afqhZoVefsEMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260109

Hi Yury. Thanks for going through the patches.

On 6/26/26 6:36 PM, Yury Norov wrote:
> On Thu, Jun 25, 2026 at 06:16:30PM +0530, Shrikanth Hegde wrote:
>> When possible, choose a preferred CPUs to pick.
>>
>> Push task mechanism uses stopper thread which going to call
>> select_fallback_rq and use this mechanism to pick only a preferred CPU.
>>
>> When task is affined only to non-preferred CPUs it should continue to
>> run there. Detect that by checking if cpus_ptr and cpu_preferred_mask
>> intersect or not.
>>
>> Since is_cpu_allowed can be called directly or repeatedly in
>> select_fallback_rq, encode the info in task_struct->has_preferred_cpu_state
>> if the path is via select_fallback_rq or not.
>> This helps to avoid N**2 complexity for the rare cases.
>>
>> Additional overhead of O(N) comes to is_cpu_allowed only when cpu is not
>> preferred. So in normal scenarios overhead is only a bit check.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v4->v5:
>> - Do simple encoding of -1,0,1 instead (K Prateek Nayak)
>> - Make it s8 (K Prateek Nayak)
>> - Update changelog to address sashiko concerns of overhead.
>>
>>   include/linux/sched.h |  1 +
>>   kernel/sched/core.c   | 35 +++++++++++++++++++++++++++++++++--
>>   kernel/sched/sched.h  | 25 +++++++++++++++++++++++++
>>   3 files changed, 59 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index fc6ecb3869dd..27dbf676113e 100644

>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1657,6 +1657,7 @@ struct task_struct {
>>   #ifdef CONFIG_UNWIND_USER
>>   	struct unwind_task_info		unwind_info;
>>   #endif
>> +	s8				has_preferred_cpu_state;
> 
> Why not protected with the config?

Ok. I will add, i thought it would mean too many ifdefs due to usage in
the below function.

> 
> It looks like you didn't ever ran pahole on it. Maybe it's worth to
> try now?

I did, This is what i saw in powerpc. It did fit in the available cacheline.

	struct bpf_net_context *   bpf_net_context;      /*  4736     8 */
	struct llist_head          kretprobe_instances;  /*  4744     8 */
	struct llist_head          rethooks;             /*  4752     8 */
	union rv_task_monitor      rv[2];                /*  4760    16 */
	s8                         has_preferred_cpu_state; /*  4776     1 */

	/* XXX 7 bytes hole, try to pack */

	struct thread_struct       thread;               /*  4784  2864 */


> 
>>   	/* CPU-specific state of this task: */
>>   	struct thread_struct		thread;
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 9e16946c9d62..281715a6e88f 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -2500,6 +2500,8 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
>>    */
>>   static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>   {
>> +	bool task_check_preferred_cpu;
>> +
>>   	/* When not in the task's cpumask, no point in looking further. */
>>   	if (!task_allowed_on_cpu(p, cpu))
>>   		return false;
>> @@ -2508,9 +2510,23 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>   	if (is_migration_disabled(p))
>>   		return cpu_online(cpu);
>>   
>> +	/*
>> +	 * This is essential to maintain user affinities when preferred
>> +	 * CPUs change. A task pinned on non-preferred CPU should continue
>> +	 * to run there, since this is non-user triggered.
>> +	 *
>> +	 * If CPU is non-preferred and task can run on other CPUs which are
>> +	 * currently preferred, then choose those other CPUs instead.
>> +	 * Overhead is minimal when CPU is preferred.
>> +	 */
>> +	task_check_preferred_cpu = !cpu_preferred(cpu) && task_has_preferred_cpus(p);
>> +
>>   	/* Non kernel threads are not allowed during either online or offline. */
>> -	if (!(p->flags & PF_KTHREAD))
>> +	if (!(p->flags & PF_KTHREAD)) {
>> +		if (task_check_preferred_cpu)
>> +			return false;
>>   		return cpu_active(cpu);
>> +	}
>>   
>>   	/* KTHREAD_IS_PER_CPU is always allowed. */
>>   	if (kthread_is_per_cpu(p))
>> @@ -2520,6 +2536,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>   	if (cpu_dying(cpu))
>>   		return false;
>>   
>> +	/* Try on preferred CPU first if possible*/
>> +	if (task_check_preferred_cpu)
>> +		return false;
>> +
>>   	/* But are allowed during online. */
>>   	return cpu_online(cpu);
>>   }
>> @@ -3549,6 +3569,14 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>>   	enum { cpuset, possible, fail } state = cpuset;
>>   	int dest_cpu;
>>   
>> +	/*
>> +	 * Cache the value whether task's affinity spans preferred CPUs.
>> +	 * This helps to avoid repeating the same for each CPU
>> +	 * later in the loop. Encode call to is_cpu_allowed coming
>> +	 * via select_fallback_rq.
>> +	 */
>> +	p->has_preferred_cpu_state = task_has_preferred_cpus(p) ? 1 : -1;
>> +
>>   	/*
>>   	 * If the node that the CPU is on has been offlined, cpu_to_node()
>>   	 * will return -1. There is no CPU on the node, and we should
>> @@ -3560,7 +3588,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>>   		/* Look for allowed, online CPU in same node. */
>>   		for_each_cpu(dest_cpu, nodemask) {
>>   			if (is_cpu_allowed(p, dest_cpu))
>> -				return dest_cpu;
>> +				goto clear_and_return;
>>   		}
>>   	}
>>   
>> @@ -3604,6 +3632,8 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>>   		}
>>   	}
>>   
>> +clear_and_return:
>> +	p->has_preferred_cpu_state = 0;
> 
> Sadly, you've ignored my comments from the previous round. Let me repeat
> it once again:
> 
> This ->has_preferred_cpu_state is always zero out of the scope of the
> function. It means, it's a local variable, and should not belong to
> the task_struct.

Ok. Making it as another variable is better. I will make change accordingly.

> 
>>   	return dest_cpu;
>>   }
>>   
>> @@ -4612,6 +4642,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>>   	init_numa_balancing(clone_flags, p);
>>   	p->wake_entry.u_flags = CSD_TYPE_TTWU;
>>   	p->migration_pending = NULL;
>> +	p->has_preferred_cpu_state = 0;
>>   	init_sched_mm(p);
>>   }
>>   
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index c7c2dea65edd..5d009c2529b2 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -4213,4 +4213,29 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
>>   
>>   #include "ext.h"
>>   
>> +/*
>> + * has_preferred_cpu_state could have the value cached from
>> + * select_fallback_rq. It is set/cleared while holding pi_lock
>> + * and irq disabled.
>> + *
>> + *  1: Cached and preferred CPUs exists in task's affinity.
>> + *  0: Not cached and need to evaluate.
>> + * -1: Cached and preferred CPU doesn't exits task's affinity
> 
> So, you've got 3 options to declare the status: self-explaining enum,
> self-explaining #defines, and this random numbers explained in
> comment. The latter option is the worst to me.

ok. I will define the enums.

> 
> And you didn't provide any benchmark advocating this caching
> optimization.
> 
> Sorry, but NAK.
> 

If we move to local variable then this won;t be necessary,
just enum's would be enough (I think). Let me go stare at it.
