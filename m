Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE932D8DDF;
	Mon, 13 Jul 2026 05:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783921777; cv=none; b=qOSi23AixcQX4aK7GKZ1VOuzpwnAGrtPCz71EpiyG85508I/vMT2b29zxN9fkJVBHqypY3S3UfSiQqOQ0P5y8EGJ1VPe+uVJ2BvUzwUFYVRAWXKccXHNasA6xRYsTosc7AQ+ZEru+C8cLQuGBpNL+pXpWM+J47YZiZqlrZkDFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783921777; c=relaxed/simple;
	bh=T24BVbBlCxhYVV7juo+oNJGtOYhmEPisTpUhnGFUY/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7OhCLUFU8ggwOHuukQG4CYjxOtHFv2CXVnpkp5lYR44J6oFOo0oQ5npTN+BbBzrTID3FAu8YMEUQ01tHFIYLjfrmCWv45hmAiFGVCnS/waal3oDzry1bx7i7JUKzv3l6MAXj4VX631v3kFNPcMBnATRRYc7BzqPZ/qq84VnXmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BI+VFrLC; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BI+VFrLC"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3EJtD1290334;
	Mon, 13 Jul 2026 05:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cP188D
	CEUX+91Gi8Gr/0nYuyqqBOxPvY8GleSBCxe+s=; b=BI+VFrLCeXpAI44Ru9RKUe
	0IRNVAilT7NzonSh1UDFFjhDE37JWyX7LaGcQPrMNG6LfaiNP3mBxOU3IT+fhuVS
	8PvC2Z4/LLRW7RixpDN1scCdu82dwRwIwag5zB5eZZNCwXCaQbZrQcqbSxpMQqTW
	DC2RQUPVItoU5OtTPoFsOj/QyPZezoXkL7SYs08nMhxpHtW32cCYtPtWgkxCOPsn
	6rcCmjyEZINUqhDHhYcXNN7R3O0BGLD9PPxd8SkAI7x/Caqo6r3KWuE0GyNB3Ork
	HrvBWrwaY5M9/22OOjT7LI499qYryZKp30v2W5jb9SQTZA+ycHKMF5uMDjV/uYTw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fber86uh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 05:49:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66D5YbeZ022400;
	Mon, 13 Jul 2026 05:49:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fc1nh45kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 05:49:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66D5nATK21365052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 05:49:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB3F82004E;
	Mon, 13 Jul 2026 05:49:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96A9B20040;
	Mon, 13 Jul 2026 05:49:00 +0000 (GMT)
Received: from [9.39.29.148] (unknown [9.39.29.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 05:49:00 +0000 (GMT)
Message-ID: <9da4fd45-0a0f-495d-8207-816ee88c5937@linux.ibm.com>
Date: Mon, 13 Jul 2026 11:18:59 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/12] virt/steal_monitor: Act on steal time
 periodically and decide on preferred CPUs
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
 <20260709215648.1246821-12-sshegde@linux.ibm.com> <alFX75dzgkMnDXAD@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alFX75dzgkMnDXAD@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1NyBTYWx0ZWRfXybhuSNqGU84t
 5MKl5RQUU0bWuDgIaQXmPbdRzsmrFWmo55IjN3luAsdmg8mEv+z5nzq/wbNcAZnLrTbXhqhFdkG
 YKcKaTOH6xXa5HMCQEscWXL0tCwVhnvl15v6OPnXVfTTWbiuVkNp06xZe5NwZUdWj9dOAzZh4bU
 aCBLpzyFsf2m6MjIF0Ws8pYh441YMZIZtAYylEI6t8W1s7F7oWWcDWarnC/L0rpVTeoJLfZajpj
 eNgmpbEF1adDOkC0v31gVAJH9nROnWerZisIApQxP4t/lv6c0kE8J+TrHjsgHvokqQuKK4Jax1H
 XvTwUyvHCcMgLSCfGV7uKhCopDHdFXY948EGLNozdm69FlXoNbRFVGcZo6svBWMS3nBFNsrKt3p
 2yONTbY9cW9E9dyWDEcNe8lxFBL2ZbEnTrAubbyvmxhqJqWUkEFh1OpOhptGDDvPCQvMeJWXzSm
 zItZidWHSS9X9cw+zHQ==
X-Proofpoint-ORIG-GUID: XsiY9Mt98LoK6Hf5Y2jXGGVbJDEGduvm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1NyBTYWx0ZWRfX+m4NN934xDA1
 UEScqF2rNmSix/HEQk0mD+xLjcT1KT9pbC4d96UEYbnw4uFBpYOalMMjLdQJTqlSts9xtLLojix
 JIQsTqZdL+dz4dn2flKtgGnf1RKScHM=
X-Authority-Analysis: v=2.4 cv=TpzWQjXh c=1 sm=1 tr=0 ts=6a547c5d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=1GShWzhfYtZKvYz12T8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: cIbiax1z5aeQ_yly_CpR3saPR916p9Fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130057



On 7/11/26 2:07 AM, Yury Norov wrote:
> On Fri, Jul 10, 2026 at 03:26:47AM +0530, Shrikanth Hegde wrote:
>> schedule work at regular intervals. Interval is determined by
>> interval_ms parameter. schedule_delayed_work is used since interval_ms
>> is usually in order of milliseconds. Work need not happen instantly.
>>
>> Periodic work function essentially does:
>> - Calculate the steal_ratio as below.
>>
>>         steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())
>>
>>    It is calculated to consider the fractional values of steal time.
>>    I.e 10 means 0.1% steal time. A few tricks such as divide by 10,000
>>    are used to avoid possible overflow.
>> - If steal value is higher than high threshold, call the method to reduce
>>    the preferred CPUs.
>> - If steal value is lower or equal to low threshold, call the method to
>>    increase the preferred CPUs.
>> - If the steal value is in between, no action is taken.
>> - Save the values for next delta calculations.
>> - Save the current direction of steal values to avoid oscillations.
>>    So two consecutive values of high values or low values are taken for
>>    decrease/increase of preferred CPUs.
>> - Ensure design checks are met.
>>    1. At least one core/CPU must be there in preferred mask.
>>    2. preferred CPUs is subset of active CPUs.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v6->v7:
>> - Merge two patches which did periodic work function.
>> - Misc checks for early firing, requeue work, math safety.
>>
>>   drivers/virt/steal_monitor/sm_core.c | 76 +++++++++++++++++++++++++++-
>>   drivers/virt/steal_monitor/sm_core.h |  1 +
>>   2 files changed, 76 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
>> index 4a03c14337be..09a5c3a299c3 100644
>> --- a/drivers/virt/steal_monitor/sm_core.c
>> +++ b/drivers/virt/steal_monitor/sm_core.c
>> @@ -20,6 +20,12 @@ struct steal_monitor sm_core_ctx = {
>>   	.low_threshold = 200,	/* 2% */
>>   };
>>   
>> +enum sm_direction {
>> +	SM_DIR_INCREASE = -1,
>> +	SM_DIR_NONE	=  0,
>> +	SM_DIR_DECREASE	=  1,
>> +};
>> +
>>   static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
>>   {
>>   	unsigned int interval;
>> @@ -106,14 +112,82 @@ module_param_cb(low_threshold, &low_threshold_ops, &sm_core_ctx.low_threshold, 0
>>   MODULE_PARM_DESC(low_threshold,
>>   		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
>>   
>> +static void compute_preferred_cpus_work(struct work_struct *work)
>> +{
>> +	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
>> +	ktime_t now;
>> +
>> +	now = ktime_get();
>> +	delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));
>> +
>> +	if (unlikely(delta_ns < NSEC_PER_MSEC)) {
>> +		pr_err_ratelimited("steal_monitor: work scheduled too soon delta_ns: %llu\n",
>> +				   delta_ns);
>> +		goto requeue_work;
>> +	}
>> +
>> +	curr_steal = get_system_steal_time();
>> +	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
>> +		      curr_steal - sm_core_ctx.prev_steal : 0;
>> +
>> +	/* Update for next calculation */
>> +	sm_core_ctx.prev_steal = curr_steal;
>> +	sm_core_ctx.prev_time = now;
>> +
>> +	/*
>> +	 * steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())
>> +	 * To avoid possible overflow, divide the denominator early.
>> +	 * Note minimum interval is 10ms.
>> +	 */
>> +	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);
>> +	steal_ratio = div64_u64(delta_steal, delta_ns);
>> +
>> +	if (sm_core_ctx.prev_direction == SM_DIR_DECREASE &&
>> +	    steal_ratio > sm_core_ctx.high_threshold)
>> +		decrease_preferred_cpus(&sm_core_ctx);
>> +	if (sm_core_ctx.prev_direction == SM_DIR_INCREASE &&
>> +	    steal_ratio <= sm_core_ctx.low_threshold)
>> +		increase_preferred_cpus(&sm_core_ctx);
> 
> I already said, I don't like this SM_DIR approach. If you want to
> avoid oscillations, just increase the gap. If it doesn't work, then we
> need to understand why.
> 

Ok. It was to avoid first simple, as it may have corner cases.
But yes, dropping it for now to keep things simple.

>> +
>> +	/*
>> +	 * mark the direction. Increasing the gap between hi and lo_threshold
>> +	 * helps to avoid ping-pongs.
>> +	 */
>> +	if (steal_ratio > sm_core_ctx.high_threshold)
>> +		sm_core_ctx.prev_direction = SM_DIR_DECREASE;
>> +	else if (steal_ratio <= sm_core_ctx.low_threshold)
>> +		sm_core_ctx.prev_direction = SM_DIR_INCREASE;
>> +	else
>> +		sm_core_ctx.prev_direction = SM_DIR_NONE;
>> +
>> +requeue_work:
>> +	/* maintain design constructs always */
>> +	WARN_ON_ONCE(cpumask_empty(cpu_preferred_mask));
>> +	WARN_ON_ONCE(!cpumask_subset(cpu_preferred_mask, cpu_active_mask));
> 
> cpu_read_lock here? And again, you should do something to restore
> integrity. WARN_ON is not enough. The simplest and safest thing you
> can do is to unload the driver. You definitely shouldn't schedule a
> new work against the broken cpu_preferred_mask.

How about not requeue the work if it broken. Add a pr_err and return.
That makes driver pretty much nop until rmmod.

         /* maintain design constructs always */
         if (cpumask_empty(cpu_preferred_mask)) {
                 pr_err("empty cpu_preferred_mask, stop steal_monitor work");
                 return;
         }

         if (!cpumask_subset(cpu_preferred_mask, cpu_active_mask)) {
                 pr_err("preferred: %*pbl is not a subset of active: %*pbl, stop steal_monitor work\n",
                        pr_cpuamsk_args(cpu_preferred_mask), pr_cpuamsk_args(cpu_active_mask));
		return;
	}

(Ignore whitespace mangling)

> 
>> +
>> +	/* Trigger for next sampling */
>> +	schedule_delayed_work(&sm_core_ctx.work,
>> +			      msecs_to_jiffies(sm_core_ctx.interval_ms));
>> +}
>> +
>>   static int __init steal_monitor_init(void)
>>   {
>> -	pr_info("steal_monitor is enabled\n");
>> +	pr_info("steal_monitor is enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
>> +		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
>> +
>> +	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
>> +	sm_core_ctx.prev_steal = get_system_steal_time();
>> +	sm_core_ctx.prev_time = ktime_get();
>> +
>> +	schedule_delayed_work(&sm_core_ctx.work,
>> +			      msecs_to_jiffies(sm_core_ctx.interval_ms));
>> +
>>   	return 0;
>>   }
>>   
>>   static void __exit steal_monitor_exit(void)
>>   {
>> +	cancel_delayed_work_sync(&sm_core_ctx.work);
> 
> cancel_delayed_work_sync() is not enough for a self-requeueing work.
> compute_preferred_cpus_work() always requeues itself. Module unload
> can return with delayed work armed against module text/data. Use
> disable_delayed_work_sync() or a stop flag checked before requeueing.

ok. I will make it disable_delayed_work_sync.
Thanks for catching that.
