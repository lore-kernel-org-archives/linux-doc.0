Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B166328243;
	Mon,  6 Jul 2026 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327149; cv=none; b=MjG+fjjZgExpR04Qw4HFa1wlnK882cEq24mvI0RKc4m1N93jDqWTYcMFRaSO3lgPupD9LyJVLeW3RlenH5t2yiD4dIwSy12BE1L+zbB73NtfIsOzbxWREAt67SLTIOGaDiLU5ESOdpugCY6/nsaHIdzdnV0/gpcXORGLJGbKbkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327149; c=relaxed/simple;
	bh=p5cMzzJ6wczY6aK1utnm+MX+QQ6i5e2SW+aBjWunpdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ag9Q/H8lOIERwj81Sh19dgy2nc3vb4txY2DAnLn4Z76EbIReGL2SkltlzVM4tZzVXhAw93yH8GBB8Ad3uAD4dyNrZ9miL2DDP9lmJEjlZdqqj+lwNOzhpC9/gzPIU8j3bT2/0gIfWn7UPrz82EnqOOKlpsAT6iqihjFrIDDFOP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Sp3HWZfZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Sp3HWZfZ"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MILe31497573;
	Mon, 6 Jul 2026 08:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Eqzhcm
	Iv3nJVRJtOntB+ZKFZ3XHQH8nqgZD1j0ONC+U=; b=Sp3HWZfZ23GPW9FdfieyZk
	201aeYBm6ZupQv8/WkvNLx0vMKAFUPoK1OJ46ZARrNCNuOhhODXciykFjlvrlF93
	dnS/jzoOv4qKz+bq200KKKDOjcWQ55zsOntZ9RY2fCfjfKKzDlNhHr+3/y8MkUkC
	zG7ZES5wLL+fEuk8URVoFCVfo0YWExmgOpZn1V6RijjIiypq867T8dRWXCokuWQO
	w75sFm4ASrxKTCO27n6hNlqc35K0KI9kvs2MEjB7yrt4Xhbr6TZUl4tXhi8814fB
	8E6d+ihPYggDc0i9In1E7JyZkUiPuRBfs7fAlhtrULsGJRJj/+V5yCHseVrF5iCA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stsh0tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:38:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6668YaCU030010;
	Mon, 6 Jul 2026 08:38:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7dgjvsev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:38:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6668ccZ016187820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 08:38:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A1202004F;
	Mon,  6 Jul 2026 08:38:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE5C420043;
	Mon,  6 Jul 2026 08:38:31 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 08:38:31 +0000 (GMT)
Message-ID: <bf2e71f4-3308-4bbe-bb38-4ee261aeb3a7@linux.ibm.com>
Date: Mon, 6 Jul 2026 14:08:30 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/23] virt/steal_monitor: Compute work at regular
 intervals
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
 <20260701141654.500125-17-sshegde@linux.ibm.com> <akf76J6S5etNOICE@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <akf76J6S5etNOICE@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: dN2wCamP2cuUubLOmfRQ1jZZVPrwiHB4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX19ia3jDk3ZaA
 Al7ih8uqva/fIRsq+97LM0ayHZUD1iciT2PGtNWXzAofGlaIyfrrZ8qRHO/25NNXqKdrBrNl8Mh
 r6QzL5Mgw2LBUO0pXxkc1vOee8+qKcE=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a4b6994 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=xxs58_2HAHV7FaYEMWIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aHkRjWzWepEmu1miB1pyg9G0tpifb346
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX/i3vXX2J6W4E
 piwQmvzqlLuOKOal3XS8YPt1CwIb+9HT4TNwHVrg41zwjxWoP+0bdGYuYuvSe/zbOajzcAvDQT1
 78PiF+N+XnkhtxzzAS6+phE4qD9HZG3YKUsm1nM2irHZS/aXwBD8n87eVX1wFRgVuQtmKTEIW1J
 6HvlzyFs3ty0MJc4CBid7ywmxlGBzsS1daHHqbZjNJQSYrYjVkW9TkYHRKAcb5uj7KOkpuBVPc/
 KYxuoeYZmZoWZBR4MCs5cG/f066SDh16JovGc38eiISqtSI6Y/RXTnIMi6PH98onkhnUoL1SXFX
 aFCfQTwdxYDI5RQSrfe1jL6XjXvagZYUosdlGChr93EDObHI5tdFxCDGvArutbq2jBm0MHGLaGM
 RwUNuN3RFXv29sFYlVuAECVzO39axBauaEW5JuUwo9G6mAUAjz+07dTvFnHZXO7h8hRHQSXvn5h
 s28+s81aAxVKXyHfVUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

Hi Yury,

On 7/3/26 11:44 PM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:47PM +0530, Shrikanth Hegde wrote:
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
>>   drivers/virt/steal_monitor/sm_core.c | 26 +++++++++++++++++++++++++-
>>   drivers/virt/steal_monitor/sm_core.h |  3 +++
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
>> index 1ba638224abb..b499faa61010 100644
>> --- a/drivers/virt/steal_monitor/sm_core.c
>> +++ b/drivers/virt/steal_monitor/sm_core.c
>> @@ -32,9 +32,32 @@ module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0644);
>>   MODULE_PARM_DESC(low_threshold,
>>   		 "Low steal threshold (default: 200 i.e 2%)");
>>   
>> +static void compute_preferred_cpus_work(struct work_struct *work)
>> +{
>> +	/* At least one core is kept as preferred */
>> +	WARN_ON(cpumask_empty(cpu_preferred_mask));
> 
> This is very true, at least one CPU must be preferred. But throwing
> warnings is useless. What do you want me to do if I see this warning?
> The only possible solution I see is unloading the driver and not using
> this balancer at all. Don't think it's what you want me to do.
> 

The design construct of preferred ⊆ active should be valid during entire
steal monitor lifetime. Not just init of module.

My thought process here is, if one sees warning, they could report this issue
and we can fix any such violations.


> Your logic should make it impossible to have the preferred cpumask
> empty.
> 
>> +
>> +	/* Warn if interval_ms is set to 0, that might cause lockup. */
>> +	if (unlikely(sm_core_ctx.interval_ms == 0)) {
>> +		WARN_ON(1);
>> +		sm_core_ctx.interval_ms = 1000; /* Fallback to default */
>> +	}
> 
> WARN_ON() means panic under some configurations. You shouldn't do
> that. The proper way of handling it is failing in steal_monitor_init().
> This function is int, not a void, for a reason.
> 

This i have removed in v7. I have moved to module_named_cb for validating the parameters.

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
>> +
>> +	schedule_delayed_work(&sm_core_ctx.work,
>> +			      msecs_to_jiffies(sm_core_ctx.interval_ms));
>> +
>>   	return 0;
>>   }
>>   
>> @@ -42,6 +65,7 @@ static void __exit steal_monitor_exit(void)
>>   {
>>   	pr_info("steal_monitor is disabled\n");
>>   
>> +	cancel_delayed_work_sync(&sm_core_ctx.work);
>>   	guard(cpus_read_lock)();
>>   	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
>>   }
>> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
>> index e5c3ea0a63c9..ea06e83c228c 100644
>> --- a/drivers/virt/steal_monitor/sm_core.h
>> +++ b/drivers/virt/steal_monitor/sm_core.h
>> @@ -8,6 +8,9 @@
>>   #include <linux/kernel.h>
>>   #include <linux/init.h>
>>   #include <linux/cpuhplock.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/sched/isolation.h>
>>   
>>   struct steal_monitor {
>>   	struct delayed_work	work;
>> -- 
>> 2.47.3

