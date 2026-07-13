Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492933403EA;
	Mon, 13 Jul 2026 05:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919638; cv=none; b=Yqor0Q8h/eO+3nYsj2yG7adGPsqfpW2w6qXoCtpxDOtSQLJzpodfxcbl5rYpjqK4pabqgiMMT7fETgGOFA7Kgf3tr+ohLbLjynLxb5hMoGqacKGOBo3OqIMV1iZwLfnMskKZcBf3xCT8sk4jxb97tfo2FvyhumhDR9Hz5ao4qFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919638; c=relaxed/simple;
	bh=ibt4hExZWH4PJEfxwYRCXC+7J3is7R3Lr1ha9wFRreE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRzLQD9LcnVXEVvj3mHgpAG3yXicuD/Ehg0FxYV8KeF6+EeaK+1Uzr/dOr48SGwhpb+OkaLoacpeU8OmsRLdllQyYE7ydh/XNwSFIuAN0iDC6LbPvsdhCKEqbOaLPgo8lEiGbEUvgfHxSGUvOqWEJyn/+kUdLQu0MZxEr8OUYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bDFFZD9o; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bDFFZD9o"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3C4V81284114;
	Mon, 13 Jul 2026 05:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=B01xc8
	keCX7IE5gawI64Q3IF8oQ5IlMBicqW37qSxK4=; b=bDFFZD9ohYRHgSsKiMMazz
	CxGW+te1qRTo98QLp5+YL21U/LA+d1RJYI5QRQ985suxp+HTE7QCauQannqehERJ
	wVCNw5MxBZWuKBqutw9XbGr5+iu3BxwqVHwfQEX/pXRUXaPjnz49Ph7bmUMMpwU+
	PAfkxUCDZhzNfTnR1uC7rOr+eyg5ljzHA2nqrMoRWEb4Fq2xHi/oxfcMCKABwUbZ
	H6Y3MBelL7Uk0Yj5TVXgdgi9csS2oolmUbD64nTL61c04tWu9Bm4pzXmajNYWOC2
	pre8WA63nqv3hFSXGINRIwTga3HPnjWtJhuXsUaf2mP6rkI5yn1uL7m6f/TdPpdg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fber86r1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 05:13:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66D54bMC012289;
	Mon, 13 Jul 2026 05:13:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2uxuupt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 05:13:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66D5DNdO41484772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 05:13:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D215120040;
	Mon, 13 Jul 2026 05:13:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66A6520043;
	Mon, 13 Jul 2026 05:13:16 +0000 (GMT)
Received: from [9.39.29.148] (unknown [9.39.29.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 05:13:16 +0000 (GMT)
Message-ID: <b4b7591c-8edd-4f45-9e03-37d7353ae5cf@linux.ibm.com>
Date: Mon, 13 Jul 2026 10:43:15 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] virt/steal_monitor: Provide functions for
 managing steal values
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
 <20260709215648.1246821-11-sshegde@linux.ibm.com> <alFPb9lUKCGTN8Ky@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <alFPb9lUKCGTN8Ky@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX7xWKFgVjgpO3
 h569/idDCRhuXpwW2ngG0VIt4rY3oEkPkdRXMZrw8HcGz0Erw+Z0xCk7fY4vnemkRq51UPrGLS9
 it9SDMGJlVNgpl4NHMztBza+YzuM/yaDhonMLrwDAGBjIOcFjF9xGMlJ5BrZTDw0AwpA8NMDVSC
 U4xQL+bjLrCPABIAOQl38vr0+VErnkIXq/TXgzyDPC4Xqpi3DrWUMhHwZZg/IqUh8z1S7QnKWoh
 QejQdW3xWPACcqoDRoYJ1KxD5CwBBVW9vvNxAMzZlJR0d5wHh52fNDYhW/uh96+uwiLD0MDgSbT
 ZKc7gI2NeiZYd6Y+Qom69ZMx9UPjevLw3VgmTCOe9T9MF++U5xszNsd0ePhbQfAjwDu0whXx+vj
 HogD4fdwAFnLR74BLMsTESxD0H8hHAgffwUFARFQTUES2c20jx4UK+iqnmsqPz0GDE4c+Hc2WTm
 dis06DTK9XDD1dgHkcQ==
X-Proofpoint-ORIG-GUID: 93knHtx3AKgIQSW4KkH1-I6AKP-hlTb6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfXzu/elTROKrVo
 zbj2f6EhsODVs2R7FFPP1qQExNskJGoCZFc5NtezvIKZWlLIAdxrJ8RDksXr9LxzakHs1aobemA
 PUB0njZoeafuwJAHrwc9DXaEGOVN1Gw=
X-Authority-Analysis: v=2.4 cv=TpzWQjXh c=1 sm=1 tr=0 ts=6a5473f9 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=BkcTNrE7F3diiN-CV6MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Z3yKs_UsnLyPPq0x0_1ih01Hw0g4pxNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130051

Hi Yury,

On 7/11/26 1:30 AM, Yury Norov wrote:
> On Fri, Jul 10, 2026 at 03:26:46AM +0530, Shrikanth Hegde wrote:
>> Provide functions which is going to be used in the periodic work
>> function to calculate and handle steal time values.
>>
>> get_system_steal_time()
>> - steal monitor takes global view of steal time instead of individual
>>    vCPU. For this collect overall steal values across all the vCPUs or
>>    vCPUs of interest.
>> - Sum up steal time values across possible CPUs. This helps to keep it
>>    a monotonically increasing number and avoids spikes due to CPU
>>    hotplug.
>>
>> decrease_preferred_cpus()
>> - Called when there is high steal time. It needs to decide which CPUs to
>>    mark as non-preferred and set that state.
>> - Get first housekeeping CPU and its core mask. Mark it as
>>    protected core. This helps to keep at least one core as preferred.
>>    kernel ensures at least one housekeeping CPU must stay active.
>> - Find the last CPU outside of this protected core mask. (target CPU)
>> - Based on that target CPU, get its sibling and mark them as
>>    non-preferred.
>>
>> increase_preferred_cpus()
>> - Called when there is low steal time. It needs to decide which CPUs to
>>    mark as preferred and set that state.
>> - Get the first active non-preferred CPUs. This likely is the last
>>    set of CPUs being marked as non-preferred.
>> - get the siblings of that CPU and mark them as preferred.
>>
>> get_num_cpus_steal_ratio()
>> - This method informs the steal_monitor core, how many CPUs it needs to
>>    consider for steal ratio calculations.
>> - Return number of possible CPUs as get_system_steal_time computes
>>    steal values across possible CPUs.
>>
>> Notes:
>> 1. Using core instead of individual CPUs performs better as SMT is
>>     quite common and some hypervisor such as powerVM does core scheduling.
>>
>> 2. This doesn't do any NUMA splicing to keep the code simpler and
>>     minimal overhead. Current code expects CPUs spread uniformly
>>     across NUMA nodes.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v6->v7:
>> - Combined patches which added helper functions.
>> - Use possible CPUs for steal value calculations.
>>
>>   drivers/virt/steal_monitor/Makefile   |   2 +-
>>   drivers/virt/steal_monitor/defaults.c | 100 ++++++++++++++++++++++++++
>>   drivers/virt/steal_monitor/sm_core.h  |   8 +++
> 
> What for do you split functionality into sm_core and default? There's
> no non-default implementation, right?
> 
> I'd just put everything in drivers/virt/steal_monitor.c. It would be
> ~300 LOCs file - quite bearable.

Ok. I will move it to sm_core.c

> 
>>   3 files changed, 109 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/virt/steal_monitor/defaults.c
>>
>> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
>> index bd7d120a79b5..273a6dd59fea 100644
>> --- a/drivers/virt/steal_monitor/Makefile
>> +++ b/drivers/virt/steal_monitor/Makefile
>> @@ -3,4 +3,4 @@
>>   # Steal time monitor to alter preferred CPU state.
>>   obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
>>   
>> -steal_monitor-y := sm_core.o
>> +steal_monitor-y := sm_core.o defaults.o
>> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
>> new file mode 100644
>> index 000000000000..d4b016317554
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/defaults.c
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Base file contains the default implementations.
>> + *
>> + * Copyright (C) 2026 IBM
>> + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
>> + */
>> +#include "sm_core.h"
>> +
>> +/*
>> + * Returns steal time of the full system.
>> + * Compute collective steal time across all possible CPUs.
>> + */
>> +u64 get_system_steal_time(void)
>> +{
>> +	int cpu;
>> +	u64 total_steal = 0;
>> +
>> +	for_each_possible_cpu(cpu)
>> +		total_steal += kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
>> +
>> +	return total_steal;
>> +}
>> +
>> +/*
>> + * Returns number of CPUs to consider for steal ratio.
>> + * Return possible CPUs.
>> + */
>> +unsigned int get_num_cpus_steal_ratio(void)
>> +{
>> +	return num_possible_cpus();
>> +}
>> +
>> +/*
>> + * Take action to decrease preferred CPUs.
>> + *
>> + * Decrease the preferred CPUs by 1 core.
>> + * Take out the last core in the active & preferred.
>> + *
>> + * Must ensure
>> + * - least one housekeeping core is always kept as preferred
>> + * - preferred is always subset of active.
>> + */
>> +void decrease_preferred_cpus(struct steal_monitor *ctx)
>> +{
>> +	int tmp_cpu, first_hk_cpu, last_cpu;
>> +	const struct cpumask *first_hk_core;
>> +	int target_cpu = nr_cpu_ids;
>> +
>> +	guard(cpus_read_lock)();
>> +	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
>> +					 cpu_preferred_mask);
> 
> Nit: you can return here if nothing found, and save on the 2nd
> traverse.

Ok.

I thought about initially, but since this almost never
happens i thought i will combine both.

> 
>> +	last_cpu = cpumask_last(cpu_preferred_mask);
>> +
>> +	if (first_hk_cpu >= nr_cpu_ids || last_cpu >= nr_cpu_ids)
>> +		return;
>> +
>> +	/* Always leave first housekeeping core as preferred. */
>> +	first_hk_core = topology_sibling_cpumask(first_hk_cpu);
>> +
>> +	/* Find the last CPU which doesn't belong to that first hk_core. */
>> +	if (!cpumask_test_cpu(last_cpu, first_hk_core)) {
>> +		target_cpu = last_cpu;
>> +	} else {
>> +		for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
>> +			target_cpu = tmp_cpu;
>> +	}
>> +
>> +	/* Only the first housekeeping core remains */
>> +	if (target_cpu >= nr_cpu_ids)
>> +		return;
>> +
>> +	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(target_cpu),
>> +			 cpu_preferred_mask)
>> +		set_cpu_preferred(tmp_cpu, false);
> 
> I think it should return status: if the function can't disable CPUs
> now, it would be a good hint for the caller that it would be useless
> to call it again.
> 
> You may keep status in struct steal_monitor like:
> 
>          if (steal_ratio > sm_core_ctx.high_threshold)  {
>                  if (sm_core_ctx->status | CANT_DECREASE) {
>                          pr_something();
>                  else
>                          sm_core_ctx->status = decrease();
> 
> It would be a good hint to user that he has the driver misconfigured,
> and save the driver extra work. Same for increase().
> 

I thought about the extra work in function, but doesn't happen too often IMO.

Also, it is specially not a misconfiguration for increase.
So i have kept it stateless for the below reason.

- Under typical operation of this driver, user will enable it once.
- Once enabled, user will use their VM as usual.
- Majority of the time the steal time will be less.
- workload are bursty in nature.
- Occasionally many VM will have high utilization and there will be steal time.
   This lasts for sometime.
- After workload completes, steal time goes low again.
- Cycle could repeat after extended low steal time duration.

So when the steal time is low, though driver is enabled, doesn't mean it
is mis-configured. Just that there is contention and driver has nothing to
do. So, adding print there could easily consume the console.

Similarly, there could situations, where decrease cannot happen though there is
high steal time, Though they are corner cases.

For example,
- one small/few VMs have not enabled the driver. steal time could be high, but this
   VM has already down to one core. It can't decrease any further.
- Though all VMs have enabled the feature, but task running is not FAIR class. Though
   steal time shows high.

Hitting only one core or all cores isn't necessarily a misconfiguration.
It is a possible behavior during severe contention or complete idle system.

we need to continuously monitor steal time so that it can expand/contract the
based on current situation. If we stop calling the functions, natural expand/contract
will not happen. There is no interrupt which arrives due to high/low steal time where
we can kick start the driver again. Also it is a difficult ask for user to keep enabling
or disabling the driver.

Since this can be called at minimal once in 10ms, I guess we can incur the additional
overheads to keep the logic simple and stateless. What do you think?

PS: I will remove that additional SM_DIR as you suggested in other reply. That keeps
it all stateless.

>> +}
>> +
>> +/*
>> + * Take action to increase preferred CPUs.
>> + *
>> + * Increase the preferred CPUs by 1 core.
>> + * Add the first core in active & !preferred
>> + *
>> + * Must ensure preferred is subset of active.
>> + */
>> +void increase_preferred_cpus(struct steal_monitor *ctx)
>> +{
>> +	int first_cpu, tmp_cpu;
>> +
>> +	guard(cpus_read_lock)();
>> +	first_cpu = cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
>> +
>> +	/* All CPUs are preferred. Nothing to increase further */
>> +	if (first_cpu >= nr_cpu_ids)
>> +		return;
>> +
>> +	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(first_cpu),
>> +			 cpu_active_mask)
>> +		set_cpu_preferred(tmp_cpu, true);
>> +}
>> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
>> index 8bbb606add99..ee68cd8b1944 100644
>> --- a/drivers/virt/steal_monitor/sm_core.h
>> +++ b/drivers/virt/steal_monitor/sm_core.h
>> @@ -11,6 +11,9 @@
>>   #include <linux/cpumask.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/ktime.h>
>> +#include <linux/kernel_stat.h>
>> +#include <linux/topology.h>
>> +#include <linux/sched/isolation.h>
>>   
>>   struct steal_monitor {
>>   	struct delayed_work	work;
>> @@ -24,4 +27,9 @@ struct steal_monitor {
>>   
>>   extern struct steal_monitor sm_core_ctx;
>>   
>> +u64 get_system_steal_time(void);
>> +unsigned int get_num_cpus_steal_ratio(void);
>> +void increase_preferred_cpus(struct steal_monitor *ctx);
>> +void decrease_preferred_cpus(struct steal_monitor *ctx);
>> +
>>   #endif /* __VIRT_STEAL_CORE_H */
>> -- 
>> 2.47.3

