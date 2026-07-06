Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880A71632E7;
	Mon,  6 Jul 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329655; cv=none; b=EiyXg+cSRZHtuPkIzfuMOqqSNFCp7J2bEijrff8A8l4rjpgn7MZWVOzaWnrLkT1UqneXfvKa0Ko6m9QZEqHbN5eVLzh8Mn6yCJZZrRV1KCqk7CT1S43NhFcOWE5wi+jQGLr+WDc5ztYpjS9ri6nRqwCIcmtcRECYFRfJC/hsVis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329655; c=relaxed/simple;
	bh=PsUFjWrXxVq+TqYR9khBBZGiPPNvQ96xT+xb/Yjh8QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwd05Ua3bBHxSduXbQvWIX24wqgewRszHp+NXMxBDCPgeEtRVj6f5g/tVCHORiNLb4m2MP/jgN3vwgyQjT4mNbYWE+Bwy7JF35rIf0N0U0Vsd4EVE2tmMb/+/MT5QsP1vg/mHjnAd6KTbzi+XeIWHX9//v63gEGt88Sjoxk0tc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tgbFO8PO; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tgbFO8PO"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669IPT33133967;
	Mon, 6 Jul 2026 09:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=P1cXPx
	zUgBkYIj711vrqvXzK3mtv170zpjWBgBNAFqk=; b=tgbFO8POuL3/nCjJv2Wu5V
	dxlk1EVPcYzpxSuSkTno5ayoPOLh70n0PuadnYoMVV0aFR/cmA9Rnj3M/zXvxnV6
	M5I85zFZNlE8CsZGjZMaI0yJW0xg2wR57dQ8E8q8oYze0+8f+10JqEBk82Q8AfNu
	3j81R+EjI/xBTRoLx3QZrYb0burgMFtIzPpXBF+v8LMhJZB9gG6vufZZ1G7IScU7
	alwhB754UnLHNyTKtNOxtAajZsaiwNGmnVTiHSTIWB6bVZuUeGenqgAkQiTtSIvM
	1g5TvYlJN/QsJvEz9/xT5z4/D4tjiVYUG771J0AUopTANYt8axDHMYoTwMFOf78Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stsh64b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 09:20:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6669JkoU013193;
	Mon, 6 Jul 2026 09:20:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7dgjvx5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 09:20:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6669KSkH35324190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 09:20:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C60720040;
	Mon,  6 Jul 2026 09:20:28 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48C8820043;
	Mon,  6 Jul 2026 09:20:22 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 09:20:22 +0000 (GMT)
Message-ID: <929e1275-a568-45aa-909f-8ffcf859d7cb@linux.ibm.com>
Date: Mon, 6 Jul 2026 14:50:21 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] virt/steal_monitor: Provide default method to
 inc/dec preferred CPUs
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
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-19-sshegde@linux.ibm.com> <akglZQrZ0ghbwLth@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <akglZQrZ0ghbwLth@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Q7w8cLldR4yeXPPCiws3E87HlQUFGlZs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NCBTYWx0ZWRfXwgzHomdgEzzh
 QchXtSXOeS4hksZFqmt6I8dD1DAMAS4eB1D4V2kq2IBgT5rrdsU9MelRpEXTsriqK6iGMD4y3S3
 BivKEAlM1zAZMIqVSqmloavtd4DcSeM=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a4b7362 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=fR9Wyhvoc6gyoXbRuRgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gmrOwWHujn3h2hymjXN7YKs-kZ2Aj9aS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NCBTYWx0ZWRfX5A5zqwsTYxBA
 YmkPDSZqaJJJAj+4rr5gTEAZl2wKdFDdQyHzJRMikC54FnL51P72d9Chn6LCihbreYk0m4n9Mqv
 4nPgLTFKPqYoDRbLkdy4cKYqg6HeLaZzG27znZ+DBoAbxqBt3JiyCnMxdmh4dzJk5JxCsbbhQC+
 Kdd5E4Bho00f3HEEeqFZCdk5bBlDy2pZYwBfLLDzudxMMijk8QHQP5qxoHQklmRhDczI2rgXp1z
 lMdqDxp9cxhocYqGV7jOOyJATUx2vxr2EzaIaauWf6gnjnvjMxnMWWW+8dhz6iY90nUWE2nPqyZ
 CLDGqCNUhMhZt/usKKIV/gt/ji46P/vKKlEhJSh29up0tIMgvyMAD6iX5qWCyAbrQOFMs5XiPa2
 gQ1iLrdL3ilQzyELSaMv5anxAY1x4sEfudIYYIkFqVXyQyfwwBZywQuttw6KFhf637sZ6Ga2gPT
 iCV1DNIc6k4CG53FTMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060094

Hi Yury,

On 7/4/26 2:41 AM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:49PM +0530, Shrikanth Hegde wrote:
>> These methods will be used by the steal_monitor core in subsequent
>> patches. Default implementation are likely good enough for most archs.
>>
>> decrease_preferred_cpus() - Called when there is high steal time. It needs
>> to decide which CPUs to mark as non-preferred and set that state.
>> increase_preferred_cpus() - Called when there is low steal time. It needs
>> to decide which CPUs to mark as preferred and set that state.
>>
>> Default Implementations:
>> decrease_preferred_cpus()
>> - Get first housekeeping CPU and its core mask. Mark it as
>>    protected core. This helps to keep at least one core as preferred.
> 
> Is there any measurable difference to manage preferred CPUs per-core
> vs per-cpu? If not, I'd choose to per-cpu version as it's simpler.
> 

Yes, per-core is much better.
Since powerpc is SMT8 and phyp does core scheduling, taking on/off a full core makes a difference.

Even for other arch having it per core (SMT2 is being most common) it better IMO.
It allows to achieve the same level of packing without aggressive interval_ms.

>>    This is to be safe under non-normal cases.
>> - Find the last CPU outside of this protected core mask. (target CPU)
>>    This works for cases where one may specify nohz_full= for last set of
>>    CPUs as well.
> 
> And doesn't work for cases where one specifies nohz_full for the first
> set of CPUs. If you want to do it properly, you need two passes:
> 1. Search for preferred nohz_full candidates, and
> 2. If no such CPU found, search for any preferred CPU.
> 

It works, in that case protected core is one outside of nohz_full list.

I have tried on the system.
I have 480 CPUs. (60 cores SMT8) I see this happening.

If nohz_full=<0-239> protected core will be 240-247
(CPUs 240-479 are part of HK_TYPE_KERNEL_NOISE)
if nohz_full=<240-479> protected core is 0-7
(CPUs 0-239 are part of HK_TYPE_KERNEL_NOISE)

If i pass nohz_full=0-479, then i see below in dmesg.
Housekeeping: must include one present CPU, using boot CPU:0
cat nohz_full
1-479
In that case too, protected core is 0-7

>> - If no such CPU exits, then only housekeeping core remains. Bail out.
>> - Based on that target CPU, get its sibling and mark them as
>>    non-preferred. If they are nohz_full, enable the tick.
>>    push mechanism relies on sched_tick.
>>
>> increase_preferred_cpus()
>> - Get the first active non-preferred CPUs. This likely is the last
>>    set of CPUs being marked as non-preferred.
>> - If there is no such CPU, i.e preferred is same as active. Nothing
>>    todo further.
>> - If not, get the siblings of that core and mark them as preferred.
>>    Note that clearing the tick isn't needed as that would be handled via
>>    sched_can_stop_tick.
>>
>> Using core instead of individual CPUs give better numbers as SMT is
>> quite common and some hypervisor such as powerVM does core scheduling.
>>
>> Note: This doesn't do any NUMA splicing to keep the code simpler and
>> minimal overhead. current code expects CPUs spread unformly
>> across NUMA nodes.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v5->v6:
>> - Make it work for all cases when nohz_full= may be specified.
>>
>>   drivers/virt/steal_monitor/defaults.c | 74 +++++++++++++++++++++++++++
>>   drivers/virt/steal_monitor/sm_core.h  |  2 +
>>   2 files changed, 76 insertions(+)
>>
>> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
>> index 6681f9938f6a..4e2e5b233948 100644
>> --- a/drivers/virt/steal_monitor/defaults.c
>> +++ b/drivers/virt/steal_monitor/defaults.c
>> @@ -26,3 +26,77 @@ u64 __weak get_system_steal_time(void)
>>   
>>   	return total_steal;
>>   }
>> +
>> +/*
>> + * Default implementation of decrementing the preferred CPUs based on steal
>> + * time. This is simple logic and decrease the preferred CPUs by 1 core.
>> + * It takes out the last core in the active & preferred.
>> + *
>> + * Ensure at least one housekeeping core is always kept as preferred
>> + *
>> + * Could be overwritten by arch specific handling. Arch must ensure
>> + * preferred is always subset of active.
>> + */
>> +
>> +#define get_core_mask(cpu) topology_sibling_cpumask(cpu)
> 
> useless redefinition.

that was keep for loop under 80 chars. I can drop it.

> 
>> +
>> +void __weak decrease_preferred_cpus(struct steal_monitor *ctx)
>> +{
>> +	int tmp_cpu, first_hk_cpu;
>> +	const struct cpumask *first_hk_core;
>> +	int target_cpu = nr_cpu_ids;
>> +
>> +	guard(cpus_read_lock)();
>> +
>> +	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
>> +					 cpu_active_mask);
> 
> Why active mask? If you want to preserve a cpu in preferred mask,
> search the cpu_preferred_mask.
> 
> Can you explain why HK_TYPE_KERNEL_NOISE? Honestly, I don't
> understand the idea behind this logic.

HK_TYPE_KERNEL_NOISE logic is, kernel ensures atleast one CPU is always left and it
can't be hotplugged. So use that core for the protected core, as leaving atleast one
core as preferred is better.

Whole logic (this patch and Patch 23 is to ensure that) is leave that core as preferred.

For example, I have 480 CPUs. (60 cores SMT8)

If nohz_full=<0-239> protected core will be 240-247
(CPUs 240-479 are part of HK_TYPE_KERNEL_NOISE)

if nohz_full=<240-479> protected core is 0-7
(CPUs 0-239 are part of HK_TYPE_KERNEL_NOISE)


I see that happening with the patch series.

> 
>> +
>> +	if (first_hk_cpu >= nr_cpu_ids)
>> +		return;
>> +
>> +	first_hk_core = get_core_mask(first_hk_cpu);
>> +
>> +	/* Always leave first housekeeping core as preferred. */
>> +	for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
>> +		target_cpu = tmp_cpu;
>> +
>> +	/* Only the first housekeeping core remains */
>> +	if (target_cpu >= nr_cpu_ids)
>> +		return;
>> +
>> +	/*
>> +	 * set tick bit for nohz_full CPU to push the task out. Once the tasks
>> +	 * are pushed out, bit will be cleared if there are no tasks.
>> +	 */
>> +
>> +	for_each_cpu_and(tmp_cpu, get_core_mask(target_cpu), cpu_active_mask) {
> 
> Why active mask here? It should be preferred, I guess? If you traverse
> the active mask, you're at least doing an extra work by disabling the
> already disabled CPUs, and probably have some side effects by calling
> tick_nohz_dep_set_cpu() twice.

Ok. I think preferred is better here.

But active also shouldn't cause any issue i think, since target_cpu is expected
to be a preferred CPU. So there is no double disable.

If there is was hotplug done, then it won;t be there in active too.
It takes cpus_read_lock to be safe against hotplug happening in parallel.

> 
>> +		set_cpu_preferred(tmp_cpu, false);
>> +		if (tick_nohz_full_cpu(tmp_cpu))
>> +			tick_nohz_dep_set_cpu(tmp_cpu, TICK_DEP_BIT_SCHED);
>> +	}
>> +}
>> +
>> +/*
>> + * Default implementation of incrementing preferred CPUs based on steal
>> + * time. This is simple logic and increases the preferred CPUs by 1 core.
>> + * It adds the first core in active & !preferred
>> + *
>> + * Nothing to do if active == preferred
>> + *
>> + * Could be overwritten by arch specific handling. Arch must ensure
>> + * preferred is subset of active.
>> + */
>> +void __weak increase_preferred_cpus(struct steal_monitor *ctx)
>> +{
>> +	int first_cpu, tmp_cpu;
>> +
>> +	guard(cpus_read_lock)();
>> +
>> +	first_cpu = cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
>> +	/* All CPUs are preferred. Nothing to increase further */
>> +	if (first_cpu >= nr_cpu_ids)
>> +		return;
>> +
>> +	for_each_cpu_and(tmp_cpu, get_core_mask(first_cpu), cpu_active_mask)
> 
> Here I agree, it should be cpu_active_mask.

Yes.

> 
>> +		set_cpu_preferred(tmp_cpu, true);
>> +}
>> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
>> index 634c9f5a2610..030f6236c38e 100644
>> --- a/drivers/virt/steal_monitor/sm_core.h
>> +++ b/drivers/virt/steal_monitor/sm_core.h
>> @@ -26,5 +26,7 @@ struct steal_monitor {
>>   extern struct steal_monitor sm_core_ctx;
>>   
>>   u64 get_system_steal_time(void);
>> +void increase_preferred_cpus(struct steal_monitor *ctx);
>> +void decrease_preferred_cpus(struct steal_monitor *ctx);
>>   
>>   #endif /* __VIRT_STEAL_CORE_H */
>> -- 
>> 2.47.3

