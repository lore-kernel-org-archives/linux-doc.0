Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C37370AC9;
	Wed,  1 Jul 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924058; cv=none; b=g2HmV0IT1L6u+xrUJCoVbeHcRw2rQU7KgQfuKVTvEqMmPqcbi5/BQ/fVUPMX7kOGP6jtT9ZoEcjBMtHNYlYIINV2W7lxL3dSfp5LXLkJKOIoQ4YzQcOh2hsZ1DHLEEUNS7gGAY1qeSrgdyi/3s4s/+W/P5l5zry1Br7qpEDkojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924058; c=relaxed/simple;
	bh=qDaZ79QzTV+TxIrctGH+rGPiIKNkXLMVsi6+Zrg3AO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDKg6ZfKL2WEIfdiL4oCzkUiZJTv/PPi6SBDvaWKtFUsI7lLRRiojZTgCbPoEOc50bRbDlPrkRo+Iyzb1gh2j5qetiYF4JR5dMfjUA4WKA6xiT4dbK7c3b25E9zOGDAbpbamSOhM0YI0fRUck9mypzjDsjLRo+dFnR4hGDtOLFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TODQIgw8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TODQIgw8"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIMNw492293;
	Wed, 1 Jul 2026 16:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Gsnd40
	M4OscRLscMdcsmH4XCvj1ZWe3pWuGTXI7wcxI=; b=TODQIgw8FeydwSd1XupbKC
	8VlMndqjypv1fEBTGkyPLtWqQJWcqeCTvzMkwyw/V2mzGwzzPv809CeYcDtev5Sk
	p5hiND2/jxg+1UnMQGha4jy5B4gs/kC7Eh6wRM02YsAq73i9+sla0yBpOY3RyzWX
	psBs5aSRaNUabgYFC7gyB68W44ajlRfycPanQVPYIppHwYARdlhcXFx26oStcX2x
	W3IbA746sxKyoPFXAkhX1qLDec2WLLHbZ8kiIP9snIeJXYdJBhGeolCUQcLsHoll
	MfMWBYVzXVv23HJII1JvVpwK5SIkfBxw3zalPVLRTpw0N2KqqCTlrF+ILOYKetLg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qa590g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:40:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661GYbBf010739;
	Wed, 1 Jul 2026 16:40:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqgbyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:40:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661GeXwH11862280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 16:40:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B56F720040;
	Wed,  1 Jul 2026 16:40:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E20320043;
	Wed,  1 Jul 2026 16:40:20 +0000 (GMT)
Received: from [9.67.14.28] (unknown [9.67.14.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 16:40:19 +0000 (GMT)
Message-ID: <6106cdbd-914d-4a12-b62e-4155aba16496@linux.ibm.com>
Date: Wed, 1 Jul 2026 22:10:18 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/23] cpumask: Introduce cpu_preferred_mask
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
 <20260701141654.500125-4-sshegde@linux.ibm.com> <akUz3GlKrWQTZIWK@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akUz3GlKrWQTZIWK@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MyBTYWx0ZWRfX7YVBWvRGZVDn
 LpoiQlIN9HAD6mXW8YIqVZrChoAZttwOkHNhPpQDWMoLY1oTwlJci3WFiYYrfO0LwwDt+Qpc0VE
 p6nJw8fDfEEM1X9etpiY5AwqchbrxOm00QTZZtIQhgNs4WsEbZ4SJ46c1wncuGtlb60X2JCEu9v
 t5Yx+BAw7gLJVfghWIShWp43KD4MLYsv4bOsXlBRLmiw7xwa6wUQcAbpLudXvt+/aJmI6Dj0TFU
 YWfrelH8cvqX6ayIi0oQFA4+hsHqyxk5V8OzO7PRUfpvWojlbZEJxt6y5P4fH2zbxLPgmIB9hqx
 hHYJ1mKgANl2dpmzUKhp3vA+dyLUFrVklCjmiMcA2qiTvcHnB5PKscONrF8QGaEWlwaCOjjlele
 MR2GavXrYwrT6D0+lqTvB1vxQiHujiKqp9AvPTqBNljr6m2EdrCXY6FPEIlTgw+RUTIvA/JDXao
 Az0lRGrioBNvr9kAyow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MyBTYWx0ZWRfX5IJ5k3pJNaA2
 S4nVZYHTk4BRwno9xWzrLAsb+hBjwIDFOQd2zBasD+nSG9Lu0gy/vGcmN7w81pFbxbhFtVD+/8c
 fqEl9mR8kOZslEiRtasaeqXZ47UHpPQ=
X-Proofpoint-GUID: 6QyLorlMUps3YLDuSG57SVo1aCsune81
X-Proofpoint-ORIG-GUID: krnhWpI3DB7Fq2g_PCQLBoq5l3OLPUh1
X-Authority-Analysis: v=2.4 cv=WZ88rUhX c=1 sm=1 tr=0 ts=6a454307 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=ehMVQMUFNAdxFkrEatMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010173

Hi Yury, Thanks for taking a look at the patches.

On 7/1/26 9:05 PM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:34PM +0530, Shrikanth Hegde wrote:
>> Provide cpu_preferred_mask infrastructure. Define get/set macros
>> which could be used to get/set CPU state as preferred.
>>
>> Values are set/clear by the new driver called steal_monitor.
>> It periodically samples the steal time and decides preferred CPU state.
>>
>> A CPU is set to preferred when it becomes active. Later it may be
>> marked as non-preferred depending on steal time values with
>> steal_monitor being enabled.
>>
>> Always maintain design construct of preferred is subset of active.
>> i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible
>>
>> With PREFERRED_CPU=n, set is nop and get returns active state.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v5->v6:
>> - Make it nop for PREFERRED_CPU=n
>> - Make it EXPORT_SYMBOL_GPL
>>
>>   include/linux/cpumask.h | 27 ++++++++++++++++++++++++++-
>>   kernel/cpu.c            |  6 ++++++
>>   kernel/sched/core.c     |  5 +++++
>>   3 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
>> index d3cda0544954..c97271c063ce 100644
>> --- a/include/linux/cpumask.h
>> +++ b/include/linux/cpumask.h
>> @@ -122,12 +122,20 @@ extern struct cpumask __cpu_enabled_mask;
>>   extern struct cpumask __cpu_present_mask;
>>   extern struct cpumask __cpu_active_mask;
>>   extern struct cpumask __cpu_dying_mask;
>> +
>> +#ifdef CONFIG_PREFERRED_CPU
>> +extern struct cpumask __cpu_preferred_mask;
>> +#else
>> +#define __cpu_preferred_mask __cpu_active_mask
>> +#endif
>> +
>>   #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>>   #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
>>   #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>>   #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>>   #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>>   #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
>> +#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
>>   
>>   extern atomic_t __num_online_cpus;
>>   extern unsigned int __num_possible_cpus;
>> @@ -1164,6 +1172,13 @@ void init_cpu_possible(const struct cpumask *src);
>>   #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
>>   #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
>>   
>> +#ifdef CONFIG_PREFERRED_CPU
>> +#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
>> +#else
>> +/* Don't edit active state when the feature is off */
> 
> And that makes a random reader thinking like why in the world he mentions
> active state here?
> 
> Can you move this in commit message, or drop entirely?

Ok. I will drop it.

> 
>> +#define set_cpu_preferred(cpu, preferred) {}
>> +#endif
>> +
>>   void set_cpu_online(unsigned int cpu, bool online);
>>   void set_cpu_possible(unsigned int cpu, bool possible);
>>   
>> @@ -1258,7 +1273,12 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>>   	return cpumask_test_cpu(cpu, cpu_dying_mask);
>>   }
>>   
>> -#else
>> +static __always_inline bool cpu_preferred(unsigned int cpu)
>> +{
>> +	return cpumask_test_cpu(cpu, cpu_preferred_mask);
>> +}
>> +
>> +#else	/* NR_CPUS <= 1 */
> 
> NR_CPUS can't be less than 1, I guess.

Ah yes. It can't be 0 :-)
this can only be  /* NR_CPUS == 1 */.

Since that is self explanatory, I guess it is good to drop that
comment addition. I think i did it to abide by that #else comment style
which i saw elsewhere.

> 
>>   
>>   #define num_online_cpus()	1U
>>   #define num_possible_cpus()	1U
>> @@ -1296,6 +1316,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>>   	return false;
>>   }
>>   
>> +static __always_inline bool cpu_preferred(unsigned int cpu)
>> +{
>> +	return cpu == 0;
>> +}
>> +
>>   #endif /* NR_CPUS > 1 */
>>   
>>   #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>> index b3c8553d7bd6..376d297a6292 100644
>> --- a/kernel/cpu.c
>> +++ b/kernel/cpu.c
>> @@ -3103,6 +3103,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
>>   atomic_t __num_online_cpus __read_mostly;
>>   EXPORT_SYMBOL(__num_online_cpus);
>>   
>> +#ifdef CONFIG_PREFERRED_CPU
>> +struct cpumask __cpu_preferred_mask __read_mostly;
>> +EXPORT_SYMBOL_GPL(__cpu_preferred_mask);
>> +#endif
>> +
>>   void init_cpu_present(const struct cpumask *src)
>>   {
>>   	cpumask_copy(&__cpu_present_mask, src);
>> @@ -3160,6 +3165,7 @@ void __init boot_cpu_init(void)
>>   	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
>>   	set_cpu_online(cpu, true);
>>   	set_cpu_active(cpu, true);
>> +	set_cpu_preferred(cpu, true);
>>   	set_cpu_present(cpu, true);
>>   	set_cpu_possible(cpu, true);
>>   
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 2e7cde033a31..a45f7c308329 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -8690,6 +8690,9 @@ int sched_cpu_activate(unsigned int cpu)
>>   	 */
>>   	sched_set_rq_online(rq, cpu);
>>   
>> +	/* preferred is subset of active and follows its state */
>> +	set_cpu_preferred(cpu, true);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -8703,6 +8706,8 @@ int sched_cpu_deactivate(unsigned int cpu)
>>   	if (ret)
>>   		return ret;
>>   
>> +	set_cpu_preferred(cpu, false);
>> +
>>   	/*
>>   	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
>>   	 * load balancing when not active
>> -- 
>> 2.47.3

