Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD943E9F5;
	Wed,  8 Jul 2026 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529742; cv=none; b=syfeH6OtpNqxa0BSX4jWHsMogDA3uk5meDM6yEUTiZ6BCd9+1SY9pi3LJaR4R4Z6Ngyg1BHXz3sinM6eiiCu/dElVr7prIFfPH09C39xhjf8H8IL0/D8O8Mw6jEdAulLC78NW6ig8UzGqfLB5A9aIcfbV8p6SfvcECvYeS1hQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529742; c=relaxed/simple;
	bh=m5DE0lZfKqZmVltyApYxSsMWfZEGIO1gwSRIU03RUlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZ/btzmjVYhIZRc00jiW8oJOLZLb/64qlJ9NKqjzyfQx1J8Yqbh0iS5Yxp1jI+EmQa+BW6eeP4SZxEe5NOgue7BCLCN0aV+WOO7N5R3f8I12ynvabyAT5LYAlFYV/49n2dQ0HSO9CgtmzBxuI26DAIjQwh7c0Wxi618ISOgyYcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FT325xqj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FT325xqj"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GIxwJ3190061;
	Wed, 8 Jul 2026 16:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ljliNS
	VRpioEVkf06Lv4MMebxNflmUVMBElTgHzrEDU=; b=FT325xqjkpuAAmVzOBDiGT
	g7oIFfRbLR76SYUff0LStFWdP6NvbXHdv992pPh91yGB7bcQgJzTVt8bJapRRmqC
	2KSG3BUAPxJGUhvP/tFl9vxQn36VMxkU2IoboqOsy+KQQBvh2yDyGah4GZRULaUP
	rK+IMvGcl+ixbIM0VlQwnEUpSn0ovlNaQ9otpbiR7noEv0i8Cpsx81mZh2tCQnsK
	lwACTncCt71ZvvLjJEdA7hJXmLO5AA8YbQoHNzGMcnJY/FOrlIYYMzx8lb6K5X0i
	WSiuiOd16QKT4kuby/utcsCnXRqOlQmW4MlWo01D44hRJL4Z6JbAOj63HPARksIA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6rkdwwtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 16:55:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 668GnfLE000927;
	Wed, 8 Jul 2026 16:55:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0hgvea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 16:55:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 668GtIg352298196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2026 16:55:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ABBD20043;
	Wed,  8 Jul 2026 16:55:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9909620040;
	Wed,  8 Jul 2026 16:55:10 +0000 (GMT)
Received: from [9.39.26.208] (unknown [9.39.26.208])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jul 2026 16:55:10 +0000 (GMT)
Message-ID: <7eea685e-e5ab-4487-bafb-3131969e5acd@linux.ibm.com>
Date: Wed, 8 Jul 2026 22:25:09 +0530
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
 <6548b668-d3e1-42dd-be9f-2fe3193874a1@linux.ibm.com>
 <be544e00-8cf7-4a09-8b13-2d8b5a98c2ce@linux.ibm.com> <ak53I9beUB-2plNQ@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <ak53I9beUB-2plNQ@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a4e80fb cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=7zOuVmdEg6JVUKogFm4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE2NSBTYWx0ZWRfX/3bBwzDrqaoU
 vXvktXkE6DimdEudmPRn93OHcO6kOfphSqTAfKSi3woHD9/Ep73gIA/aAJiNfCYKbfhW4ydeFCp
 leNU6C3KcQfKrc4TIjpK/hXA6CIe0TT/sUogUtJ2NVWd77bzJPpr91XVV49WYaXQU5krRcx545F
 92L5RdlVdZczAUzDYjttcgO0spL3/8aUpb8CTASU5BNNJ+BoGTovw+P8S5vQTS5O3ei72UIl9Il
 xXA19igVFq6Kq+nklcIvn8xqLLM7iwuMAxX08ZGmspODQyN6ycxVwVyMFonO8PU8N8VKa8KU1eJ
 q9TyhXZRMNT30LlBaDDYb2iDuRd6ZEYOgV5TtlgawwQPUQXh/TTFzCt+Wqtpw21RkLKWiurVWcn
 82nUq05jeV8WtYqdaDN4a1vf9I+8L9Y1o8ROKYchQtPEtws+p3L5xT8tiJnzxkYmBZ/XVYwLr+d
 +B9lLoosKODE6JJ1uXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE2NSBTYWx0ZWRfX/hiejhVWAxf2
 +buPAH7tGStor76r6qWr86wqERO4zwKEWh3fmeJKxVgm8k2Qler3Rree0iwAFnvOp3X56ONLlKE
 HCMVEFsiUTi9NXz11eu44WwXNCzodEU=
X-Proofpoint-GUID: hUW7vE16ZPD1iH0LbQPFMMRW_umJxuYb
X-Proofpoint-ORIG-GUID: vgFdX69fPlUH-SEKP9-2wxsdrQI3Atky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080165



On 7/8/26 9:43 PM, Yury Norov wrote:
> On Wed, Jul 08, 2026 at 04:03:18PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 7/7/26 12:46 PM, Shrikanth Hegde wrote:
>>>
>>>
>>> On 7/7/26 2:03 AM, Yury Norov wrote:
>>>> On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
>>>>> This is the steal_monitor core functionality done in periodic work
>>>>>
>>>>> - Calculate the steal_ratio. It is multiplied by 100 to consider the
>>>>>     fractional values of steal time. I.e 10 means 0.1% steal time.
>>>>> - If steal value is higher than high threshold, call the method
>>>>> to reduce
>>>>>     the preferred CPUs.
>>>>> - If steal value is lower or equal to low threshold, call the method to
>>>>>     increase the preferred CPUs.
>>>>> - If the steal value is in between, no action is taken.
>>>>> - Save the values for next delta calculations.
>>>>>
>>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>>> ---
>>>>> v5->v6:
>>>>> - Address u64 overflow concerns.
>>>>>
>>>>>    drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>>>>>    1 file changed, 33 insertions(+)
>>>>>
>>>>> diff --git a/drivers/virt/steal_monitor/sm_core.c
>>>>> b/drivers/virt/ steal_monitor/sm_core.c
>>>>> index b499faa61010..7b7435f79b85 100644
>>>>> --- a/drivers/virt/steal_monitor/sm_core.c
>>>>> +++ b/drivers/virt/steal_monitor/sm_core.c
>>>>> @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
>>>>>    static void compute_preferred_cpus_work(struct work_struct *work)
>>>>>    {
>>>>> +    u64 curr_steal, delta_steal, delta_ns, steal_ratio;
>>>>> +    ktime_t now;
>>>>> +
>>>>> +    curr_steal = get_system_steal_time();
>>>>> +    now = ktime_get();
>>>>> +
>>>>> +    /* get the deltas */
>>>>> +    delta_steal = curr_steal > sm_core_ctx.prev_steal ?
>>>>> +              curr_steal - sm_core_ctx.prev_steal : 0;
>>>>> +    delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now,
>>>>> sm_core_ctx.prev_time)), 1);
>>>>
>>>> The below return on '!delta_ns' makes this max(...) useless, right?
>>>> Regardless, if the time between 2 measures is less then 1ns, I
>>>> believe, the whole measure is not trustworthy
>>>>
>>>
>>> Seeing sashiko comment on divide by zero, i forgot I had max above there :(
>>>
>>>>> +
>>>>> +    /* Update for next calculation */
>>>>> +    sm_core_ctx.prev_steal = curr_steal;
>>>>> +    sm_core_ctx.prev_time = now;
>>>>
>>>> So below return should go prior to this update, because 'now' is actually
>>>> the same as 'prev_time', right?
>>>>
>>>> I don't understand why 'now' can be so close to prev_time, because
>>>> you've scheduled this callback on the regular interval. But if that's
>>>> possible, can you explain that and do like this at the very beginning
>>>> of the function:
>>>>
>>
>> I don't think it is possible.
>>
>>>>           now = ktime_get();
>>>>           if (unlikely(now < sm_core_ctx.prev_time +
>>>> sm_core_ctx.interval / 2)) {
>>>>                   pr_warn(...);
>>>>                   return;
>>>>           }
>>>
>>> Pretty much, just have to requeue the work.
>>>
>>>>
>>>> And if it's a never-happen condition, just use WARN_ON().
>>>>
>>
>> I have decided keep just max_t() to ensure no divide by zero happens.
>>
>> Issue with putting sm_core_ctx.interval_ms check is that, one may edit
>> it while the work is queued, but not yet called. It would print wrongly
>> in that case.
> 
> Who is that 'one'? If it's userspace, you can simply disallow changing
> the interval. If it's kernel, you're already compromised, and
> everything is not trustworthy.
> 
> I would simply disallow to change any parameters while the driver is
> loaded. If I need to change something - I unload it and load with new
> interval, or whatever.

It is user writing to /sys/module/steal_monitor/parameters/interval_ms
that i thought of. So user.

If we disable then those checks can be valid.

> 
>> Even if work function gets called prematurely, it should be fine since the
>> steal also increases accordingly. No issues in delta logic.
>>
>> So capping to 1 to ensure no divide by 0 happens due to scaling of
>> delta_ns is good enough.
>   
> If there's 1 nanosecond between two calls, your statistics is very
> inaccurate, pretty much a noise. You want to make decision based on
> noise. That's simply wrong.


yes, that makes sense too. I have kept interval_ms/8 as safe bet.
Return will not queue the timer and effectively disables it.

         ktime_t now;

         now = ktime_get();
         delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));

         if (unlikely(delta_ns < sm_core_ctx.interval_ms * ((u64)NSEC_PER_MSEC >> 3))) {
                 pr_err("work scheduled too soon delta_time: %llu ns. Abort steal_monitor.\n",
                        delta_ns);

                 guard(cpus_read_lock)();
                 cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
                 return;
         }


>   
>>> Ya, it is a never-happen condition. I will use WARN_ON.
>>>

