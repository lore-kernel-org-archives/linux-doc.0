Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7A3AEF27;
	Tue,  7 Jul 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408597; cv=none; b=RdHWxzyej60NLzKfYYtT2g5F47oD8dge/96jqsoB2AF9ier33sj9EQSSZ97iRIiTukcfDjLN3ylFKI7Z1gENZxb5Tph197PMSoywf7NjwQ4G+BtPteBGmim+WEkmqpioVgL14lGFEQv/vNSXj21DTR7V2sjN4jeijsKvc8LIzOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408597; c=relaxed/simple;
	bh=P/nNMOZtlx5UwsCO6zfYhKwpyOg/CrcHowynz9Jk6s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTbtIbXgS33BxPX3cCryGSu+BcUbDW2fMy9dYxVnsXVMamQRD1ZHUNlSR88nt1nmenY1U7239unDqzhX3rYdYEABMZ37y5u95DKcruM1xdY1MhiE3YqYPHvA2UjpsENSiN2/uFtes/J3qOPBR/yX8ELLeSG5QVnvo8Q0NkBm5ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Qm4vL90B; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Qm4vL90B"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674IhSG1652449;
	Tue, 7 Jul 2026 07:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ARFRf5
	rZTrT2ZTXVYf34S+yMtxItKl4Aj+mC9j2gVkA=; b=Qm4vL90BvfOsJ7AeGU6fnH
	CEKGfVAAwScAE2IT/hCVURyF9PhQvKyTyCpQu11I36aGmbigPoaRAPcnU6rICKrE
	5n6IYnCIYX/yHF9XhtzRUledVX0uXyLcD9ESvYnSjzWbibKv388eb3A5iB2e90/u
	2FT5Vr6gNbxq25D5jFPRCYTM0x14LtYfA5XHQYYq1V6oWxr4FU4PyFFQWuQKIatj
	FrJIepIqO/TMEeDW2pe2k0rQi1kzyVCR35kumg9588rSDpi17r9BS08k/jqjDmYK
	gpg16Gzplx1nlsBc9y4WI9XtbLZ715XDOV2/7kN0/VlBAXV02L2HvJ2HLt3AHiMQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6rkdp8kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 07:16:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66774bdl024237;
	Tue, 7 Jul 2026 07:16:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvw1n22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 07:16:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6677GCTh33292584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jul 2026 07:16:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02D732004B;
	Tue,  7 Jul 2026 07:16:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5441520040;
	Tue,  7 Jul 2026 07:16:03 +0000 (GMT)
Received: from [9.124.214.176] (unknown [9.124.214.176])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jul 2026 07:16:02 +0000 (GMT)
Message-ID: <6548b668-d3e1-42dd-be9f-2fe3193874a1@linux.ibm.com>
Date: Tue, 7 Jul 2026 12:46:01 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/23] virt/steal_monitor: Act on steal values at
 regular intervals
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
 <20260701141654.500125-21-sshegde@linux.ibm.com> <akwRJnQklymOjNTv@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akwRJnQklymOjNTv@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a4ca7c1 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=xxs58_2HAHV7FaYEMWIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX+vhbwT6AcRl9
 CblNPkeBWymMd6+kGwLs/6cauAGUlyFAIRAJnJ23fbeXap02HF/IpQJetz7qFRUV3jIAUh8uTqw
 L8IwvV5ibgYIwGWDF4pFPK+Mjge4/yh75bUU0waYp/af+M9V1wx9f03H+saliW0dWq/00MrtFuz
 T+5Omh+o35hjYU8D8EoKaGZ73esCBqluBxbtDWCKED8EwkL1yPN1eIomEqo6y3fgbDym2fP46db
 sRX5JrE21vO8UY3k2/nOy+gxDad8mgctieQsbkKaKU2xjPqTOiHmVXLguBFXJeoCcF8sSIliR9u
 H7+/qEEwEBwJzamW8NKIkgN3tH86+a2Rkz9RT26vIJyIGL2juU/+jQ28cvFE3+qj8ZbKMbjDcfn
 DpWJW97nC7oKO8hHvDLpL7MYeE9vVsItJI5SH9NBDaujqiwq4ZaC2w7313dJLFyPgENWJuIGQfZ
 CMvQlwwJO8evHUgriOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX6gvQi+SIUdpz
 bmGdrRtcn2iHYiXUlqGOuBJaXjYCLvWpucKRTIaM71f0h5W7jjipJdHp70MPeon/hECODUIAHs4
 vvdnIMxwptO6DMPKONCS/KRpnXCD6pk=
X-Proofpoint-GUID: ZZTPobW4ZsglARt5L1GyuhYy3aPuR2Uj
X-Proofpoint-ORIG-GUID: -oKnm_LhTdj3IgNkz_fgC7DsuA0IpyCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064



On 7/7/26 2:03 AM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
>> This is the steal_monitor core functionality done in periodic work
>>
>> - Calculate the steal_ratio. It is multiplied by 100 to consider the
>>    fractional values of steal time. I.e 10 means 0.1% steal time.
>> - If steal value is higher than high threshold, call the method to reduce
>>    the preferred CPUs.
>> - If steal value is lower or equal to low threshold, call the method to
>>    increase the preferred CPUs.
>> - If the steal value is in between, no action is taken.
>> - Save the values for next delta calculations.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v5->v6:
>> - Address u64 overflow concerns.
>>
>>   drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
>> index b499faa61010..7b7435f79b85 100644
>> --- a/drivers/virt/steal_monitor/sm_core.c
>> +++ b/drivers/virt/steal_monitor/sm_core.c
>> @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
>>   
>>   static void compute_preferred_cpus_work(struct work_struct *work)
>>   {
>> +	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
>> +	ktime_t now;
>> +
>> +	curr_steal = get_system_steal_time();
>> +	now = ktime_get();
>> +
>> +	/* get the deltas */
>> +	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
>> +		      curr_steal - sm_core_ctx.prev_steal : 0;
>> +	delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time)), 1);
> 
> The below return on '!delta_ns' makes this max(...) useless, right?
> Regardless, if the time between 2 measures is less then 1ns, I
> believe, the whole measure is not trustworthy
> 

Seeing sashiko comment on divide by zero, i forgot I had max above there :(

>> +
>> +	/* Update for next calculation */
>> +	sm_core_ctx.prev_steal = curr_steal;
>> +	sm_core_ctx.prev_time = now;
> 
> So below return should go prior to this update, because 'now' is actually
> the same as 'prev_time', right?
> 
> I don't understand why 'now' can be so close to prev_time, because
> you've scheduled this callback on the regular interval. But if that's
> possible, can you explain that and do like this at the very beginning
> of the function:
> 
>          now = ktime_get();
>          if (unlikely(now < sm_core_ctx.prev_time + sm_core_ctx.interval / 2)) {
>                  pr_warn(...);
>                  return;
>          }

Pretty much, just have to requeue the work.

> 
> And if it's a never-happen condition, just use WARN_ON().
> 

Ya, it is a never-happen condition. I will use WARN_ON.

>> +
>> +	/*
>> +	 * Multiply by 100 to consider the fractional values of steal time.
>> +	 * steal_ratio = (delta_steal * 100 * 100)/(delta_ns * num_cpus())
>> +	 */
>> +	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);
> 
> You're not multiplying by 100, you're dividing by 10k. Can you reword the
> comment?

Let me re-word it. It is to avoid overflows.

> 
>> +	if (unlikely(!delta_ns))
>> +		return;
>> +
>> +	steal_ratio = div64_u64(delta_steal, delta_ns);
>> +	/* If the steal time values are high, reduce preferred CPUs */
> 
> I really believe that the below code is clear enough, worth nothing
> explaining it.

ok.

> 
>> +	if (steal_ratio > sm_core_ctx.high_threshold)
>> +		decrease_preferred_cpus(&sm_core_ctx);
>> +	/* If the steal time values are low, increase preferred CPUs */
>> +	if (steal_ratio <= sm_core_ctx.low_threshold)
>> +		increase_preferred_cpus(&sm_core_ctx);
>> +
>>   	/* At least one core is kept as preferred */
>>   	WARN_ON(cpumask_empty(cpu_preferred_mask));
>>   
>> @@ -54,6 +85,8 @@ static int __init steal_monitor_init(void)
>>   		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
>>   
>>   	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
>> +	sm_core_ctx.prev_steal = get_system_steal_time();
>> +	sm_core_ctx.prev_time = ktime_get();
>>   
>>   	schedule_delayed_work(&sm_core_ctx.work,
>>   			      msecs_to_jiffies(sm_core_ctx.interval_ms));
>> -- 
>> 2.47.3

