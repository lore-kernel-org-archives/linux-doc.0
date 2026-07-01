Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132843793C1;
	Wed,  1 Jul 2026 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924630; cv=none; b=pEMHIAUnVRGGbODt6BoaW0wF1MUFGA0JZRaR97Lfysg0MjlvIsJcCiaB0C5pvZrqwPlRVg+pfUqU1XRQ4ge3uQzGc17EeoHqP0Lptq4TtQLOmmiiHrP94EKY76+HO3kf4xFyPSWeRy24OskTOQ9A5ktsIXchqZnEUXlYdNKHZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924630; c=relaxed/simple;
	bh=gh5plY+WxASKr2+AhTsT1fDadsHLqdIkP509U2L9sT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tigjHKp2mzk81acCJaisdLkFGvk4lnfJLXnEFHQ4v9vCdrCbePnrLJUjSvizVUR17oUO5UeGWZLO0Hm0zrFBNS2VXThgOdoAYEivX3WSmRPpiD41JEkvISme9yOmsLg3X+I6JhB1axEwzeSClwt7bGDJWHHcEm4C+kbvv9cLyyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RpkNLMnM; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RpkNLMnM"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmpra1455829;
	Wed, 1 Jul 2026 16:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Bn2vUF
	QD9ZzGNZ5++6E5kPytVx/s7sPCXAECbL29t3c=; b=RpkNLMnMlgpKa0Dc2CQjR8
	jMRGrQDo2Hmgiw/OXydpn3waPybQFDt3FlZcJ4REfgtISxqKfzO3A6uAKoESd1Bq
	z9H5z+ixljz5/NqE3y0twZy0ruqA+72lPRXvBiA0oEK8PbWeNemzyE5OrfbihRjS
	MHL4f7jL7WoQrJPKa/PaM6+BsDNl7Yc1z/I0VRCwWA7dnS7hhnDAuGPgDU78Q4h3
	kswXI6ZQFCFvcV08nXQb7bGOAqCTliuDiYSVL0gH/R2U12EdjUI2H7cIA2Nqs+GG
	/VHC4szPssWvRPGYqVCUSdlM6odLS/ozxt5DqUH3x5YRerhpXSt7TIzcGaS8E2eA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe5p1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:50:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661GYfas015607;
	Wed, 1 Jul 2026 16:50:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2u2gg2a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:50:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661Go4f840108436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 16:50:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD7CF20043;
	Wed,  1 Jul 2026 16:50:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17EEB20040;
	Wed,  1 Jul 2026 16:49:52 +0000 (GMT)
Received: from [9.67.14.28] (unknown [9.67.14.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 16:49:51 +0000 (GMT)
Message-ID: <0b50873f-90aa-4b1c-913c-475c80fa21c8@linux.ibm.com>
Date: Wed, 1 Jul 2026 22:19:50 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/23] sched/core: Try to use a preferred CPU in
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
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-6-sshegde@linux.ibm.com> <akU7vr4cpAhPRFeL@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akU7vr4cpAhPRFeL@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -g6NenWMGHeeItdf2V-h-POD5JWNcu7v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX1+U1RmfjSAnF
 VqrEx1bm/TuWERdjvsaunlijXUzlb+r+0ZtRGRX3ooRV+xwHE7HoctSmyq+cT/j2uLNhbYOu+uH
 SROhPbOQfPZ2qPpVSZbb7IsQwVlPrMk=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a454542 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=CaffZ-6qSc-cPHz8f-YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX2+hthRcf9Ula
 ISCj70ybM9XbI+XMxfekyJ2cQcJ9gLGWgEPM+kvthyoN2qR+GpAb3w1ZGik4GoJkuPimlk1YPMG
 KF7m4oXqTz6pywI9pPVf3Mkxxb6/pOrAO9eNFitrEGzrO4oSHf7JQeV4e5CwHf7wWANIXCT/PAd
 TfEqzthHCOx7oZbXrzxzVotae3kOk+0ng6NoXaLf6XnTGofFgBEi2gfD+vB1puAzKnCH+qP+P+u
 MH2HtAhj5wMZOzWZopINyoc7IQCDwaIyOeXo5vA3TNbyqQu2oTvf6z5yfWnY1Z8r2qSHcf64PJJ
 nh8j1cuLrRTArLtNktSBB+uwbE/X915CHgjHwg4HwP7RwM/NgXJ9exbzyAJJkgDOx93eYx1W4FA
 MY/BHyXJMT4oJ8bLCRzwu/k48MyPqUPqcE4r24pEbYdlVorO98VSNHSIPw9fQnSnm91YSU2s+qS
 3B7Sm86PCFDw9L28Fqg==
X-Proofpoint-ORIG-GUID: CkkQf_4HOdHj5zA-HvnPfKWC0HzLnls-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

Hi Yury,

On 7/1/26 9:39 PM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:36PM +0530, Shrikanth Hegde wrote:
>> When possible, choose a preferred CPUs to pick.
>>
>> Push task mechanism uses stopper thread which going to call
>> select_fallback_rq and use this mechanism to pick only a preferred CPU.
>>
>> When task is affined only to non-preferred CPUs it should continue to
>> run there. Detect that by checking if cpus_ptr and cpu_preferred_mask
>> intersect or not.
>>
>> This takes care of wakeup path optimization for FAIR tasks.
>> is_cpu_allowed is called to ensure wakeup happens on preferred CPUs.
>> With that, additional checks in available_idle_cpu is not necessary.
>>
>> Add a comment on rare case of O(N**2) in select_fallback_rq.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v5->v6:
>> - Drop optimization for select_fallback_rq
>> - Keep comment on N**2
>>
>>   kernel/sched/core.c  | 29 ++++++++++++++++++++++++++++-
>>   kernel/sched/sched.h |  9 +++++++++
>>   2 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index a45f7c308329..1fb1c17e8387 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -2500,6 +2500,8 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
>>    */
>>   static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>   {
>> +	bool task_has_preferred_cpu;
>> +
>>   	/* When not in the task's cpumask, no point in looking further. */
>>   	if (!task_allowed_on_cpu(p, cpu))
>>   		return false;
>> @@ -2508,9 +2510,30 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
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
>> +	 *
>> +	 * For majority of the cases this would still keep select_fallback_rq
>> +	 * as O(N). task_has_preferred_cpus which is O(N) is called only if
>> +	 * !cpu_preferred. Then task running there is expected to move out.
>> +	 * So subsequent it should run on preferred CPU. This becomes O(N**2)
>> +	 * only for tasks pinned only non preferred CPUs. That is rare case.
>> +	 */
> 
> The is_cpu_allowed() is ~20 lines now, and your patch doubles that count.
> Can you keep this type of thoughts in commit message? 90% of setups
> will disable preferred CPUs, and I guess 99% of developers don't care.
> 
> This is the code, not a scientific paper, after all.
> 

Ok. I will update the comments and share updated one soon
as reply to this.

>> +	task_has_preferred_cpu = !cpu_preferred(cpu) &&
>> +				 task_has_preferred_cpus(p);
> 
> Maybe it's just me, but the name looks illogical. Because if
> 'cpu' is preferred, the task indeed has some preferred CPUs.
> 
> Maybe 'can_sched_on_preferred' or something like that?
> 

ok.

>> +
>>   	/* Non kernel threads are not allowed during either online or offline. */
>> -	if (!(p->flags & PF_KTHREAD))
>> +	if (!(p->flags & PF_KTHREAD)) {
>> +		if (task_has_preferred_cpu)
>> +			return false;
>>   		return cpu_active(cpu);
>> +	}
> 
> The comment on top of the block seems to be applicable to the 2nd
> return only, right?
> 

First return is for !kthread and second return is kthread.
It is applicable for both. (since kthreads are FAIR class)

But on that thought, do unbound kthreads run too often or
are they usually bound to a CPU? If it is later, we can even drop
that second return.

>>   
>>   	/* KTHREAD_IS_PER_CPU is always allowed. */
>>   	if (kthread_is_per_cpu(p))
>> @@ -2520,6 +2543,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>   	if (cpu_dying(cpu))
>>   		return false;
>>   
>> +	/* Try on preferred CPU first if possible*/
>> +	if (task_has_preferred_cpu)
>> +		return false;
> 
> Would it look better if you drop the comment and:
>          
>          if (need_sched_on_preferred)
>                  return false;
> 
>> +
>>   	/* But are allowed during online. */
> 
> This comment is the continuation of the cpu_dying() case. With your
> change it's not anymore, and it needs to be reworded.
> 
>>   	return cpu_online(cpu);
>>   }
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 26ae13c86b69..36ae20310891 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -4230,4 +4230,13 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
>>   
>>   #include "ext/ext.h"
>>   
>> +static inline bool task_has_preferred_cpus(struct task_struct *p)
>> +{
>> +	/* Only FAIR tasks honor preferred CPU state */
>> +	if (unlikely(p->sched_class != &fair_sched_class))
>> +		return false;
>> +
>> +	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
>> +}
>> +
>>   #endif /* _KERNEL_SCHED_SCHED_H */
>> -- 
>> 2.47.3

