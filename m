Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801017993;
	Mon, 13 Jul 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946189; cv=none; b=fwAR6T3LqM7htY+n6YoFUc2ozY1vM3Fa9vYpbWJihAd3NGDxf3kxX75vJvuM63fLL2Q7atdiSfhIiUJCth1AV7XJimVtN79tKWEBh74zCCAfB0NUM9/9c7IS17wn5tC+zptqFfDb0wg53gDZHznvjHbDTTC2wmXgGM04Dl6/WJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946189; c=relaxed/simple;
	bh=hbHfMraj9Zu0XLWlOZ2AVI2IUd1K78ImETQ9jXUhcmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRza7Le4cEAFKKREZ40D6bRq2uP4mqzwxMsNfHbioYB143HR+sbF+Ez93v3iVvNetotEmKUsH5fJCUYi1pVhV6PNN9Rt4RB861d7z2mruLlDS4lSU+Onc0DrYKSF/cJRwEPRKT5XkY2+rkkJlPPWk2hhmI8gYysIxbAjiGElDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dkdd0YIa; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dkdd0YIa"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCD0IM2375227;
	Mon, 13 Jul 2026 12:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cFn1OW
	FObKu2t4u85IHFVhr6jxWOF09rwqr8oGI+DSA=; b=dkdd0YIai7TNzzQmpTpP1c
	ZNLK7eXdUPa/gjqwxWepNV6ecgfum7qDNSVyClv3aWbkdUBCSquzPCytMPTQAQF/
	R/SbEO5W/VtwBekc450XZ7Mg+7CXsLmUnfC1gbAp4Zb5keaALiyiMKAYHVejFmSY
	ZhccvtGVYVaewqXbUxEdZZR3tmiF/Y4uTHCNPVkk+KK6vS/q5fH5c5neW4wuuJx4
	ZN7pFdDair2+wO9JRPvFki7SZ+2KQ4IOWPvBKCFB0lU7X55QxaEzw5TQwxZ1x6mM
	/ptPZr7QHJ5Z5Wxs5Q/veMF+A65g38/ocEqErrKqKj/akl0UIUIJXBLxR+kSBVfA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbf2a07pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 12:36:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DCYcSM017768;
	Mon, 13 Jul 2026 12:36:05 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2cg5d7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 12:36:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66DCa1hJ39977422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 12:36:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C18C320040;
	Mon, 13 Jul 2026 12:36:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C66320043;
	Mon, 13 Jul 2026 12:35:52 +0000 (GMT)
Received: from [9.39.29.148] (unknown [9.39.29.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 12:35:51 +0000 (GMT)
Message-ID: <b584236d-40c4-424a-a32f-21cd4ddc674b@linux.ibm.com>
Date: Mon, 13 Jul 2026 18:05:50 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] sched/core: Push current task from non preferred
 CPU
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-7-sshegde@linux.ibm.com> <alF6AqiSWZBlF_c2@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alF6AqiSWZBlF_c2@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX7lTRTbU+ESDQ
 NfnaT3LNAsLyM3xNrzfliKFKttPIcljwulbzISalFKQqQButJ7ZJ5Yz+HkGQoOrblddrZP38XkL
 1on7/OjHMx9vjonMuZXIh5zDjTxTJuY=
X-Proofpoint-GUID: juNevJpVuFfkabp6IzVhBASJr_lo9_Hq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX01NAkTet8+0s
 9oYqxw1MKXcR3L6oX8/lKGwa34MHxaRBKsegADWv60iEbu8huLzNSbnanMVfmucoJOgXr7RW0dZ
 XA+fzfj6SzO2fU6ww9Yv2B0mMTKqAH0sOxzHKaUpZTKPpPrNpKClf15NmMCSTCKgh/rbCl+TT8R
 hIwCfkHNwSehjvE1A1AvZfbH9kguXXcrNNrvMTo+tfNI5P/NxBoH2elAosyyasVjXR6z3wIMJ2y
 bi4W2kpLqV+Wp/8F9COcuYC8qRMVgbtV+cmsWjbweLGFYbRRUiomH6sckCaJ82V8ZNdVUIjJ7Z+
 t/5b/TfThkcqenfCgSYPRMmwNqaEqS/fm/ZiADnriIteTDG1MVBEn7DTL25zVcIlGhxm0a9xOJg
 hzYQeKppKFB9aJS/SycxnQOSGFTXsw1mzyxen+BgzeiKnPMzS3YleCVQSrveQwfXZutoM8Rn2i2
 TrvlYumsTQzTjvrtw3A==
X-Proofpoint-ORIG-GUID: wPHLajThYDDo8umGSBhdl7BnNGZ64epj
X-Authority-Analysis: v=2.4 cv=PvajqQM3 c=1 sm=1 tr=0 ts=6a54dbb7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=8xdayRMsDemD69ekofUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127



On 7/11/26 4:32 AM, Yury Norov wrote:
> On Fri, Jul 10, 2026 at 03:26:42AM +0530, Shrikanth Hegde wrote:
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
>> v6->v7:
>> - Moved is_migration_disabled
>> - removed fair class check
>>
>>   kernel/sched/core.c  | 78 ++++++++++++++++++++++++++++++++++++++++++++
>>   kernel/sched/sched.h |  8 +++++
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 9e8eec4451b6..74c93a88bf84 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -5774,6 +5774,9 @@ void sched_tick(void)
>>   	unsigned long hw_pressure;
>>   	u64 resched_latency;
>>   
>> +	if (!cpu_preferred(cpu))
>> +		sched_push_current_non_preferred_cpu(rq);
>> +
>>   	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
>>   		arch_scale_freq_tick();
>>   
>> @@ -11292,3 +11295,78 @@ void sched_change_end(struct sched_change_ctx *ctx)
>>   		p->sched_class->prio_changed(rq, p, ctx->prio);
>>   	}
>>   }
>> +
>> +#ifdef CONFIG_PREFERRED_CPU
>> +static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
>> +
>> +static int sched_non_preferred_cpu_push_stop(void *arg)
>> +{
>> +	struct task_struct *p = arg;
>> +	struct rq *rq = this_rq();
>> +	struct rq_flags rf;
>> +	int cpu;
>> +
>> +	/* sanity checks and clear */
>> +	if (cpu_preferred(rq->cpu) || is_migration_disabled(p)) {
>> +		scoped_guard(rq_lock, rq)
>> +			rq->push_task_work_done = false;
>> +		put_task_struct(p);
>> +		return 0;
>> +	}
>> +
>> +	raw_spin_lock_irq(&p->pi_lock);
>> +
>> +	/* This could take rq lock. So call it before rq lock is taken */
>> +	cpu = select_fallback_rq(rq->cpu, p);
>> +	rq_lock(rq, &rf);
>> +	rq->push_task_work_done = false;
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
>> + * Push the current task running on non-preferred CPU(npc).
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
>> +	/* Don't push the task if task's affinity doesn't allow */
>> +	if (!task_can_sched_on_preferred(rq->cpu, push_task))
>> +		return;
> 
> Shouldn't you protect it with the rq lock against races with affinity or
> policy changes? The task_can_sched_on_preferred() checks p->sched_class
> and p->cpus_ptr.
> 

Likely yes. I did below. It has survived light testing so far.
i.e.
- Moved checks under rq lock held.
- There was a tiny window where task could have migrated.
   Moved it down further just before migrating.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 6ed61182b19f..eda080ab3427 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11311,7 +11311,7 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
         int cpu;
  
         /* sanity checks and clear */
-       if (cpu_preferred(rq->cpu) || is_migration_disabled(p)) {
+       if (cpu_preferred(rq->cpu)) {
                 scoped_guard(rq_lock, rq)
                         rq->push_task_work_done = false;
                 put_task_struct(p);
@@ -11328,7 +11328,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
  
         context_unsafe_alias(rq);
  
-       if (task_rq(p) == rq && task_on_rq_queued(p)) {
+       if (task_rq(p) == rq && task_on_rq_queued(p)
+           && !is_migration_disabled(p)) {
                 struct rq *dest_rq;
  
                 dest_rq = __migrate_task(rq, &rf, p, cpu);
@@ -11362,19 +11363,20 @@ void sched_push_current_non_preferred_cpu(struct rq *rq)
  {
         struct task_struct *push_task = rq->curr;
  
-       /* Don't push the task if task's affinity doesn't allow */
-       if (!task_can_sched_on_preferred(rq->cpu, push_task))
-               return;
+       scoped_guard(rq_lock, rq) {
+               /* Don't push the task if task's affinity doesn't allow */
+               if (!task_can_sched_on_preferred(rq->cpu, push_task))
+                       return;
  
-       /* There is already a stopper thread. Don't race with it. */
-       if (rq->push_task_work_done)
-               return;
+               /* There is already a stopper thread. Don't race with it. */
+               if (rq->push_task_work_done)
+                       return;
  
-       /* sched_tick runs with interrupts disabled. */
-       get_task_struct(push_task);
+               /* sched_tick runs with interrupts disabled. */
+               get_task_struct(push_task);
  
-       scoped_guard(rq_lock, rq)
                 rq->push_task_work_done = true;
+       }
  
         stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
                             push_task, this_cpu_ptr(&npc_push_task_work));


>> +
>> +	/* There is already a stopper thread. Don't race with it. */
>> +	if (rq->push_task_work_done)
>> +		return;
>> +
>> +	/* sched_tick runs with interrupts disabled. */
>> +	get_task_struct(push_task);
>> +
>> +	scoped_guard(rq_lock, rq)
>> +		rq->push_task_work_done = true;
>> +
>> +	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
>> +			    push_task, this_cpu_ptr(&npc_push_task_work));
>> +}
>> +#endif
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 6de6366f2faa..80c02e2c09eb 100644
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
>> @@ -4242,4 +4244,10 @@ static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
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

