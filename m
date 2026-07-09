Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C4A3932D3;
	Thu,  9 Jul 2026 04:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571922; cv=none; b=h7fHOndbPzmlAd73xihuBSd4Ei/y+4XZF82osg2kyeLeGmGX5HaS0OM03c+NgbqQE8C+rej7of1M19+lJWIXHCKQrXUxHyIfuVyZWGMMtsARRMAKTYYtqEmkQY7Sn6rQL+0Lv2JNseVjpD/nk1fLO2XCr2imtawmPc82g3rt0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571922; c=relaxed/simple;
	bh=aOeTIgLXzRNxGAkqxCrkLxaHmL0G2EwLCrc0vQVKlOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXvZc6ua8x+AMP5fGmmqb9QyUexgtf2YgIHTN2yNlRhYUPEaJZtzk5W3JeUvv1rr+fl6ve0ouINz6LC46+U6mGECUx8SjIcJrNYTFuCQ9jiLj0QP5fPjt64UwQUw/B+O2hZwFDvn8auUXhMOXXFQOWRGQFWKgsBX5d5x3oouNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AaaHFp+k; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AaaHFp+k"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668NJjVC3803074;
	Thu, 9 Jul 2026 04:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TVwie5
	yuscbH5h8Hbry4y/2oONJe9Vks7iAdzwrRXiA=; b=AaaHFp+km6LEdISZ4OZqRl
	wupzWIJg0kKHmNgXYmjRluFOaTrIDo1jAr0BP8wcxDeMv0OVA3bmCPgLe3adY/3J
	1zuBmI54OD5tiMrLO2ash+uPR3UdBoD5/TbsHJX9kVBMUBxqW5UVsEL50Brx0cgM
	YQ/AQrSdqwHTFMytzdD182hWv+FO5Nir6IDmiFKtK8oXTh7jyaidjVt256KA0ITU
	l6QBhqAAFLtYTLN/y8wscJK67n5B044k/JRNKdn9ejiDf/7+OmouiBEQHA1LNTOG
	DGl+DohEVQVR1zDbb0hSbfTfVS93oEaFiJtJxuKyl1S7LTy86BJAgQq93m4vc47Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stt0a4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:38:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6694Yocs014754;
	Thu, 9 Jul 2026 04:38:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0hkf7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:38:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6694cAwE49873202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 04:38:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE2B20043;
	Thu,  9 Jul 2026 04:38:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B17F420040;
	Thu,  9 Jul 2026 04:38:02 +0000 (GMT)
Received: from [9.124.216.180] (unknown [9.124.216.180])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 04:38:02 +0000 (GMT)
Message-ID: <3962bf6a-23c7-42a3-bd72-76580c0a9297@linux.ibm.com>
Date: Thu, 9 Jul 2026 10:08:01 +0530
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
 <7eea685e-e5ab-4487-bafb-3131969e5acd@linux.ibm.com> <ak6sO7eAfC-AWEWe@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <ak6sO7eAfC-AWEWe@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: wxIlvO0Pa09FB87d0iOQe5Fw2dQrhMZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX+GRd00XXNC4O
 M1iIjC87kLyYalF8E59Y0iiNN8sJz8IM8ROAUNvAP6LVzEKlJPV5BGnZSEuJdaiZe9WIFBZFRiF
 L81H+2jXiN+VrvXagckfNzM2RDsGtxU=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a4f25b8 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=_3gNgwcxiskMq6tCYXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CennpVjNQOWmnNz15QrechJ9EZ05VWbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX1h5980rzjPxE
 8BfrvO7Pk1CpjtIAul/OvLfzSgp09A+yR385yjxzcq3dwU7luF/NBP/EAsZtYoi8dtLO+WQhvki
 gQ9QbfyTXzis6Z52YF4KT+gM0mMoAkvHj7lHAGrStuitZ7SbNhIEmYmyUmLkN+/avds0t0oAe/h
 o6rrjlrsMY4tessQZbKKEnqsBI65wf07C3AC5/pfNEK/OPDs6deUQQ6sgYErj+w8VbRYJAhaDQA
 bFMiDC+PWWc17GtUgce1YGeqiBk4aZ/5+zq1aymIAu2daHdvgGTD+xr7k3RKzGkGoGcTozrgQ+0
 1rPme48XSa7De31OAEpPzZC1s2RFB9S38G0r6CcHG1UNovnSX3SPbTPghYZ0fzQEF1qDGMEvP+w
 MK+3FAQlGIceC6az/8KzKl0I0Le9IsP1JR/P8vTCtIIkKjxFk3x5pMtDQxn4y9/ekxQkUFITUro
 tKfkePzloRZEU9aUNGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090037



On 7/9/26 1:29 AM, Yury Norov wrote:
> On Wed, Jul 08, 2026 at 10:25:09PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 7/8/26 9:43 PM, Yury Norov wrote:
>>> On Wed, Jul 08, 2026 at 04:03:18PM +0530, Shrikanth Hegde wrote:
>>>>
>>>>
>>>> On 7/7/26 12:46 PM, Shrikanth Hegde wrote:
>>>>>
>>>>>
>>>>> On 7/7/26 2:03 AM, Yury Norov wrote:
>>>>>> On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
>>>>>>> This is the steal_monitor core functionality done in periodic work
>>>>>>>
>>>>>>> - Calculate the steal_ratio. It is multiplied by 100 to consider the
>>>>>>>      fractional values of steal time. I.e 10 means 0.1% steal time.
>>>>>>> - If steal value is higher than high threshold, call the method
>>>>>>> to reduce
>>>>>>>      the preferred CPUs.
>>>>>>> - If steal value is lower or equal to low threshold, call the method to
>>>>>>>      increase the preferred CPUs.
>>>>>>> - If the steal value is in between, no action is taken.
>>>>>>> - Save the values for next delta calculations.
>>>>>>>
>>>>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>>>>> ---
>>>>>>> v5->v6:
>>>>>>> - Address u64 overflow concerns.
>>>>>>>
>>>>>>>     drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>>>>>>>     1 file changed, 33 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/virt/steal_monitor/sm_core.c
>>>>>>> b/drivers/virt/ steal_monitor/sm_core.c
>>>>>>> index b499faa61010..7b7435f79b85 100644
>>>>>>> --- a/drivers/virt/steal_monitor/sm_core.c
>>>>>>> +++ b/drivers/virt/steal_monitor/sm_core.c
>>>>>>> @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
>>>>>>>     static void compute_preferred_cpus_work(struct work_struct *work)
>>>>>>>     {
>>>>>>> +    u64 curr_steal, delta_steal, delta_ns, steal_ratio;
>>>>>>> +    ktime_t now;
>>>>>>> +
>>>>>>> +    curr_steal = get_system_steal_time();
>>>>>>> +    now = ktime_get();
>>>>>>> +
>>>>>>> +    /* get the deltas */
>>>>>>> +    delta_steal = curr_steal > sm_core_ctx.prev_steal ?
>>>>>>> +              curr_steal - sm_core_ctx.prev_steal : 0;
>>>>>>> +    delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now,
>>>>>>> sm_core_ctx.prev_time)), 1);
>>>>>>
>>>>>> The below return on '!delta_ns' makes this max(...) useless, right?
>>>>>> Regardless, if the time between 2 measures is less then 1ns, I
>>>>>> believe, the whole measure is not trustworthy
>>>>>>
>>>>>
>>>>> Seeing sashiko comment on divide by zero, i forgot I had max above there :(
>>>>>
>>>>>>> +
>>>>>>> +    /* Update for next calculation */
>>>>>>> +    sm_core_ctx.prev_steal = curr_steal;
>>>>>>> +    sm_core_ctx.prev_time = now;
>>>>>>
>>>>>> So below return should go prior to this update, because 'now' is actually
>>>>>> the same as 'prev_time', right?
>>>>>>
>>>>>> I don't understand why 'now' can be so close to prev_time, because
>>>>>> you've scheduled this callback on the regular interval. But if that's
>>>>>> possible, can you explain that and do like this at the very beginning
>>>>>> of the function:
>>>>>>
>>>>
>>>> I don't think it is possible.
>>>>
>>>>>>            now = ktime_get();
>>>>>>            if (unlikely(now < sm_core_ctx.prev_time +
>>>>>> sm_core_ctx.interval / 2)) {
>>>>>>                    pr_warn(...);
>>>>>>                    return;
>>>>>>            }
>>>>>
>>>>> Pretty much, just have to requeue the work.
>>>>>
>>>>>>
>>>>>> And if it's a never-happen condition, just use WARN_ON().
>>>>>>
>>>>
>>>> I have decided keep just max_t() to ensure no divide by zero happens.
>>>>
>>>> Issue with putting sm_core_ctx.interval_ms check is that, one may edit
>>>> it while the work is queued, but not yet called. It would print wrongly
>>>> in that case.
>>>
>>> Who is that 'one'? If it's userspace, you can simply disallow changing
>>> the interval. If it's kernel, you're already compromised, and
>>> everything is not trustworthy.
>>>
>>> I would simply disallow to change any parameters while the driver is
>>> loaded. If I need to change something - I unload it and load with new
>>> interval, or whatever.
>>
>> It is user writing to /sys/module/steal_monitor/parameters/interval_ms
>> that i thought of. So user.
>>
>> If we disable then those checks can be valid.
>>
>>>
>>>> Even if work function gets called prematurely, it should be fine since the
>>>> steal also increases accordingly. No issues in delta logic.
>>>>
>>>> So capping to 1 to ensure no divide by 0 happens due to scaling of
>>>> delta_ns is good enough.
>>> If there's 1 nanosecond between two calls, your statistics is very
>>> inaccurate, pretty much a noise. You want to make decision based on
>>> noise. That's simply wrong.
>>
>>
>> yes, that makes sense too. I have kept interval_ms/8 as safe bet.
>> Return will not queue the timer and effectively disables it.
>>
>>          ktime_t now;
>>
>>          now = ktime_get();
>>          delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));
>>
>>          if (unlikely(delta_ns < sm_core_ctx.interval_ms * ((u64)NSEC_PER_MSEC >> 3))) {
>>                  pr_err("work scheduled too soon delta_time: %llu ns. Abort steal_monitor.\n",
>>                         delta_ns);
>>
>>                  guard(cpus_read_lock)();
>>                  cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
>>                  return;
>>          }
> 
> Don't overthink it. Simply don't allow user to change the parameters
> while the driver is running. It may only cause troubles to those
> compiling the driver into the Image. Those compiling it as a module
> will only have to reload the driver. This is how most of the kernel
> works.

Ok. I have made it that way.

I will just put a pr_err for delta_ns less than 1ms. If anyone hits it,
then we can bring in the logic to abort etc.

PS: I wasn;t able to hit it even with 1ms as interval and check for delta_ns as (1ms/8)

> 
> So, when the driver is loaded, make sanity checks for all user parameters.
> Interval, for example must be between 10ms and 10s. If user wants 20s,

I have it as 10ms and 100s in current v7.

> pr_err() something and fail to load. After the driver is loaded, don't
> allow to change the params exactly because it may bring certain type of
> errors in the logic, and you don't want to mitigate them.
> 
> If there will be a real need to adjust parameters on the fly - it will
> be another interesting topic (mostly interesting why user wants this).
> 

Makes sense. If the need arise, we will figure something out.
I have kept it simple for now.

         now = ktime_get();
         delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));

         if (unlikely(delta_ns < NSEC_PER_MSEC)) {
                 pr_err_ratelimited("steal_monitor: work scheduled too soon delta_ns: %llu\n",
                                    delta_ns);
                 goto requeue_work;
         }

