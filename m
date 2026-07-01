Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A1D377EB8;
	Wed,  1 Jul 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925436; cv=none; b=ZiUBFUwksZ5jy1As9s6wLtCtXKrfbIRk3fhLywQ5w5Ghvko+kHPHmD5SKD7kdJuKYVwsaI0mTKDJbUKxrPUfpAWA9dPjbUDgLtBiWYuAWLxuwuuI/Fc6OaZ76DO4a2Y+8959M6ize3x65F1/wMYNp1ALROzg5SKOfrE5Qi+21L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925436; c=relaxed/simple;
	bh=twzr/tjOsKxewgP1WOe07ZxCedZch6EqhmsibNbiKhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qydwO0c2nhjvaj82v7tlLGwp8QIeMNffrumaiWVrVxTtbMr8n1v42i5ZGmCXXYskKZANyS8mjfmfUIr5hafgj5jShNcTCKFsz6puLqCLmBo6zz4eE5EEOUbG4pC0sCfDxiY+CI25/p76raI6hVQBBhSx5lJ/0fxGQ2P1AxmNd5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=e+biKwng; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="e+biKwng"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmZfg1398518;
	Wed, 1 Jul 2026 17:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nYxuOd
	lYc10Ll/l4loE/3F+Z2GOOQHVu11RPbB0TFYY=; b=e+biKwngsHY/cGVFIu4EN6
	Gf6kya9pH82gt9IuqJrPyxuISHNalO5w8+FisavEtQHiPoCoaOzoOP/vcrMu/Pby
	kbV+S4B7DKPg4th2rWS1CiK0KalEyJYRwh/NJ5ilj+iBP/zY3/K9MDjvlu6Mh6Xc
	CjaBey4i/JLOgTCC6VTVMjEIYWU/FzqYwPh0eshRkc2Q7R69cQUKgSqKXlem487J
	Uc/BFkxP8vj0KCLb+6nFTIf3Z8e0KAF7XeFEGPfPDNf8NrETHULrvvbS+m/pc17o
	xL6vRkkeWSE3e3YEjQYjI/pggIED9zogzFOruIU/R5VcFPRx+B4ewMY7pWpNTUdA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5wppu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 17:03:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661GpnZq029197;
	Wed, 1 Jul 2026 17:03:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqgf6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 17:03:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661H3QFJ41287988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 17:03:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A04DD2004E;
	Wed,  1 Jul 2026 17:03:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE8D620040;
	Wed,  1 Jul 2026 17:03:13 +0000 (GMT)
Received: from [9.67.14.28] (unknown [9.67.14.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 17:03:13 +0000 (GMT)
Message-ID: <688e4507-8740-4379-8a27-a11b32f2db9f@linux.ibm.com>
Date: Wed, 1 Jul 2026 22:33:12 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/23] sched/core: Push current task from non preferred
 CPU
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
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-10-sshegde@linux.ibm.com> <akVFULP9qV2NPy3k@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akVFULP9qV2NPy3k@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX/2JUlGRFfPYB
 fmyQQpG5f4P2xh5c1RV0qn8+NTUvhtWrgcJKoJzllIRysOwXkKu24pi8ZLzGuoWvEk/bLF/o0WP
 JY6D3FxDrFOFMJ/YMKfF/KzEGaNsRyWpZrsSNv8Ooj9cwVzd4kyaeZzlniaoRzTiv0cFbv2xA22
 hVDcsxirfQJSeJhJyJUGci4D2kqZn+JxCOeVBL5eRmT5nLRTBDVtOFUDZeo/oNVFqKbhPhkmW2o
 QmrHrK/q0GlRyx0ysnhLaCIYMUQA5G1verY1g9LVsLJ4ck15kyBd26tIl4hwmYVgOiaGwwYXDO8
 4Fe2rW6aqCOqqLrmu1m+nKDserJChBo5S+NG8ail2jO+ikD4zmqH8X09+iicD72k8HC7Rb2fx8B
 KSFbZ1pOJGiycYTBCybXdTFPshAbB872C3iUvZ44Xhqg8O9Hu5mmvPLoxEvubux8H+G2kc/Vldg
 3B7SPvlE9bVwasK6Ltw==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a454864 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=HIHRTP45pmy7FoGZfpgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZimjAyage3Z2HIVDuieRQuYgHK5dAbKr
X-Proofpoint-GUID: RjTo4RKkxf8Z3fJ2kKbfGCjTh3K5cnjU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX+wru0cOOenSu
 Ux4wKiYili9lW3zU1r1IOnva0i5Ln+NRWu6vkSYTWe3XQ3+uL4P3Ps3OqUQhhZb6SVo4Qf7FsGp
 o1QPhxToRR2fWIhztpgb6PEZpArc1hA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

Hi Yury,

On 7/1/26 10:20 PM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:40PM +0530, Shrikanth Hegde wrote:
>> Actively push out task running on a non-preferred CPU. Since the task is
>> running on the CPU, need to stop the cpu and push the task out.
>> However, if the task is pinned only to non-preferred CPUs, it will continue
>> running there. This will help in maintaining the userspace affinities
>> unlike CPU hotplug or isolated cpusets.
>>
>> Though code is similar to  __balance_push_cpu_stop and quite close to
>> push_cpu_stop, it is being kept separate as it provides a cleaner
>> implementation with CONFIG_PREFERRED_CPU.
>>
>> Add push_task_work_done flag to protect work buffer.
>> Works only with FAIR class.
>>
>> For now, only current running task is pushed out. This keeps the code
>> simpler. In future optimization maybe done to move all the queued
>> task on the rq.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   kernel/sched/core.c  | 87 ++++++++++++++++++++++++++++++++++++++++++++
>>   kernel/sched/sched.h |  8 ++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index aa4201bb8082..56905bac9525 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -5797,6 +5797,9 @@ void sched_tick(void)
>>   	unsigned long hw_pressure;
>>   	u64 resched_latency;
>>   
>> +	if (!cpu_preferred(cpu))
>> +		sched_push_current_non_preferred_cpu(rq);
>> +
>>   	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
>>   		arch_scale_freq_tick();
>>   
>> @@ -11315,3 +11318,87 @@ void sched_change_end(struct sched_change_ctx *ctx)
>>   		p->sched_class->prio_changed(rq, p, ctx->prio);
>>   	}
>>   }
>> +
>> +#ifdef CONFIG_PREFERRED_CPU
>> +/* npc - non preferred CPU */
>> +static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
>> +
>> +static int sched_non_preferred_cpu_push_stop(void *arg)
>> +{
>> +	struct task_struct *p = arg;
>> +	struct rq *rq = this_rq();
>> +	struct rq_flags rf;
>> +	int cpu;
>> +
>> +	/* sanity check and clear */
>> +	if (cpu_preferred(rq->cpu)) {
>> +		scoped_guard (rq_lock, rq)
> 
> No whitespace please:
> 
> $ git grep "scoped_guard" | wc -l
> 2153
> $ git grep "scoped_guard (" | wc -l
> 84
> 
>> +			rq->push_task_work_done = 0;
>> +		put_task_struct(p);
>> +		return 0;
>> +	}
>> +
>> +	raw_spin_lock_irq(&p->pi_lock);
>> +
>> +	/* This could take rq lock. So call it before rq lock is taken */
>> +	cpu = select_fallback_rq(rq->cpu, p);
>> +	rq_lock(rq, &rf);
>> +	rq->push_task_work_done = 0;
>> +	update_rq_clock(rq);
>> +
>> +	context_unsafe_alias(rq);
>> +
>> +	if (task_rq(p) == rq && task_on_rq_queued(p))
>> +		rq = __migrate_task(rq, &rf, p, cpu);
>> +
>> +	rq_unlock(rq, &rf);
>> +	raw_spin_unlock_irq(&p->pi_lock);
>> +	put_task_struct(p);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Push the current task running on non-preferred CPU.
>> + * Using this non preferred CPU will lead to more vCPU preemptions
>> + * in the host. So it is better not to use this CPU.
>> + *
>> + * Since task is running, call a stopper to push the task out. This is
>> + * similar to how task moves during hotplug. In select_fallback_rq a
>> + * preferred CPU will be chosen and henceforth task shouldn't come back to
>> + * this CPU again.
>> + *
>> + * Works for FAIR class only
>> + *
>> + * If task is affined only non-preferred CPUs, it can't be moved out
>> + */
>> +void sched_push_current_non_preferred_cpu(struct rq *rq)
>> +{
>> +	struct task_struct *push_task = rq->curr;
>> +
>> +	/* Preferred feature works only for FAIR class */
>> +	if (push_task->sched_class != &fair_sched_class)
>> +		return;
> 
> This is useless - task_has_preferred_cpus() checks that already.
> 

Yes. Thanks for catching that. Earlier versions of task_has_preferred_cpus
didn't have that check, so it was there.

Even kthread_is_per_cpu is not necessary as the cpumask_check
in task_has_preferred_cpus will return accordingly.

Let me re-order this.


>> +
>> +	if (kthread_is_per_cpu(push_task) ||
>> +	    is_migration_disabled(push_task))
>> +		return;
>> +
>> +	/* Don't push the task if it is affined only on non preferred CPUs */
>> +	if (!task_has_preferred_cpus(push_task))
>> +		return;
>> +
>> +	/* There is already a stopper thread for this. Dont race with it. */
>> +	if (rq->push_task_work_done == 1)
>> +		return;
>> +
>> +	/* sched_tick runs with interrupts disabled. */
>> +	get_task_struct(push_task);
>> +
>> +	scoped_guard (rq_lock, rq)
>> +		rq->push_task_work_done = 1;
>> +
>> +	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
>> +			    push_task, this_cpu_ptr(&npc_push_task_work));
>> +}
>> +#endif
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 36ae20310891..711fc8bd7ebc 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -1277,6 +1277,8 @@ struct rq {
>>   
>>   	struct list_head cfs_tasks;
>>   
>> +	bool			push_task_work_done;
>> +
>>   	struct sched_avg	avg_rt;
>>   	struct sched_avg	avg_dl;
>>   #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
>> @@ -4239,4 +4241,10 @@ static inline bool task_has_preferred_cpus(struct task_struct *p)
>>   	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
>>   }
>>   
>> +#ifdef CONFIG_PREFERRED_CPU
>> +void sched_push_current_non_preferred_cpu(struct rq *rq);
>> +#else	/* !CONFIG_PREFERRED_CPU */
>> +static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
>> +#endif
>> +
>>   #endif /* _KERNEL_SCHED_SCHED_H */
>> -- 
>> 2.47.3

