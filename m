Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0C3C1967;
	Wed,  8 Jul 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506865; cv=none; b=cNX22aut1P9dS7+ENRwi3/MaJQDh10Qhtbd23vZPgB5fg8dgV252KfHqJsTxM6GBkTlZxKzEVJwy4bFom3JI+pMusaWHA4XxvDHnG7bw1ESTf5mDlk/PNIWX6jdu8OlruuFDDhzQn6Vq6Ph8r0ZI7to6b4YrjQyZQXuu9vxsCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506865; c=relaxed/simple;
	bh=Mb755ZgFKryhRhSHqq+fu73teAf8Zs1MZQYqS0f1pOQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rIFjlIcFjK2B/2BDU1mFdYE9/TciFGQ2fBkhVaXbGnwGSH3tCQRRKw1UWcfpPU9QGiyQbU2qX/CJqHuM4nlbdCsIziqFPiAmGqpof4pATiULvrIHUlRcqHvxqEr5DNaEbG+5fKbCdHThxgFMKVBU9qqLFLTz3ADzI72K3wAiv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=icNQ00tO; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="icNQ00tO"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688IlQV3244565;
	Wed, 8 Jul 2026 10:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dlNGb8
	f3qP+P1PVK1moc/wNXl5RbjBfqhhQVOArf7/U=; b=icNQ00tOC9sBFTyKLR10Fo
	VMb63KuYG+wGwxjpwmbguqhpNogYanTKHaZsbF5uOYwCjjIFDmSHTjqr1nAPaf38
	pPgwNB4SDhiNSa/WLvLCC+nIjntV+jVRsfEI1VHV+hT3EHHSlX4TQK0QLWEqk/Eh
	YvcCSZcu7L7p+spKGwhBcJJ1mmCcVKig5CdOSr/G92QsfBFiKEp73ThR8NgdAr/u
	9PfLiuRPNDLH2ZqbvApvfNQdTKDpHRsqP2MEp24AIJKhwu+/3VVFjMEbewWWj3rc
	DOz7ygOhZ2M4BT2+3eZqVHcu/RbD+iPEjcw+sHOduJjZJcnQ2VMjV5yOh4kK1VsQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6suqunp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 10:33:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 668AJaCn020902;
	Wed, 8 Jul 2026 10:33:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7eqg7c8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 10:33:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 668AXS6854985024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2026 10:33:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4C132004F;
	Wed,  8 Jul 2026 10:33:28 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D040720043;
	Wed,  8 Jul 2026 10:33:19 +0000 (GMT)
Received: from [9.39.26.208] (unknown [9.39.26.208])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jul 2026 10:33:19 +0000 (GMT)
Message-ID: <be544e00-8cf7-4a09-8b13-2d8b5a98c2ce@linux.ibm.com>
Date: Wed, 8 Jul 2026 16:03:18 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/23] virt/steal_monitor: Act on steal values at
 regular intervals
From: Shrikanth Hegde <sshegde@linux.ibm.com>
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
Content-Language: en-US
In-Reply-To: <6548b668-d3e1-42dd-be9f-2fe3193874a1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfX1LYv9uavKd7w
 lcsU3XN2WPfsVnlGKKm/8Hvj8QYWtB4/ZUH9q6+AyWbiZK44nWAWe0MiO98/v4Q4XvkLyvrnxdc
 B39UvqyZcEojMtavdYXAfRQQC9B3eN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfX6HQg5uc/HNuy
 /anqsojIMBRzPKLGEzjwcYJQpw0LjzmJ3DRg/C+rcm0AKXyXYlPJd8gqBIF/hUHEpQaoxDr2jUC
 htu2KfeyzDM3lhImA8djf7EPkitb6je8mFN8YxORdtxQJK16M4ZvIZ3hu2pqasQ1ZdnSzwsQXoG
 3NtEWcXMUZMdAAXiJSk4dOp8bhoDATFUOJq1RVAX4PDlr042EKeif2W4ZWFPayFq//JygMhg3Ax
 uf2eu80/b0eVu0FihL6YwOuIyVHgImr89zdPru6iGBltrmoh4UK3PH8vEGs68NhMra48XrNaG/J
 dSQBDO+rnX1Zb65x2dB5ikigXUGFtIsbb4jbqf231/u/ntcuL9s+CWvMDS4UaMEcPzH9sr8Qfv2
 tA8LyFZRagfGntoOgsycRTpBZcJQUi/c23og6cSB2DsDD6VShtWiaEp1m+4KOyGZNeoAtXDeagK
 oRTvcwVC3t7bcRqvJUw==
X-Proofpoint-GUID: RiVNN-UzITHcG4B8bTdRv70AJ3mF3prh
X-Authority-Analysis: v=2.4 cv=Oot/DS/t c=1 sm=1 tr=0 ts=6a4e277e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=5Dy4uGaCWMN_ISD_dQUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mKRcljSdynQ5uhbJevgBWukVc8iIpGub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080100



On 7/7/26 12:46 PM, Shrikanth Hegde wrote:
> 
> 
> On 7/7/26 2:03 AM, Yury Norov wrote:
>> On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
>>> This is the steal_monitor core functionality done in periodic work
>>>
>>> - Calculate the steal_ratio. It is multiplied by 100 to consider the
>>>    fractional values of steal time. I.e 10 means 0.1% steal time.
>>> - If steal value is higher than high threshold, call the method to 
>>> reduce
>>>    the preferred CPUs.
>>> - If steal value is lower or equal to low threshold, call the method to
>>>    increase the preferred CPUs.
>>> - If the steal value is in between, no action is taken.
>>> - Save the values for next delta calculations.
>>>
>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>> ---
>>> v5->v6:
>>> - Address u64 overflow concerns.
>>>
>>>   drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>>>   1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/ 
>>> steal_monitor/sm_core.c
>>> index b499faa61010..7b7435f79b85 100644
>>> --- a/drivers/virt/steal_monitor/sm_core.c
>>> +++ b/drivers/virt/steal_monitor/sm_core.c
>>> @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
>>>   static void compute_preferred_cpus_work(struct work_struct *work)
>>>   {
>>> +    u64 curr_steal, delta_steal, delta_ns, steal_ratio;
>>> +    ktime_t now;
>>> +
>>> +    curr_steal = get_system_steal_time();
>>> +    now = ktime_get();
>>> +
>>> +    /* get the deltas */
>>> +    delta_steal = curr_steal > sm_core_ctx.prev_steal ?
>>> +              curr_steal - sm_core_ctx.prev_steal : 0;
>>> +    delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now, 
>>> sm_core_ctx.prev_time)), 1);
>>
>> The below return on '!delta_ns' makes this max(...) useless, right?
>> Regardless, if the time between 2 measures is less then 1ns, I
>> believe, the whole measure is not trustworthy
>>
> 
> Seeing sashiko comment on divide by zero, i forgot I had max above there :(
> 
>>> +
>>> +    /* Update for next calculation */
>>> +    sm_core_ctx.prev_steal = curr_steal;
>>> +    sm_core_ctx.prev_time = now;
>>
>> So below return should go prior to this update, because 'now' is actually
>> the same as 'prev_time', right?
>>
>> I don't understand why 'now' can be so close to prev_time, because
>> you've scheduled this callback on the regular interval. But if that's
>> possible, can you explain that and do like this at the very beginning
>> of the function:
>>

I don't think it is possible.

>>          now = ktime_get();
>>          if (unlikely(now < sm_core_ctx.prev_time + 
>> sm_core_ctx.interval / 2)) {
>>                  pr_warn(...);
>>                  return;
>>          }
> 
> Pretty much, just have to requeue the work.
> 
>>
>> And if it's a never-happen condition, just use WARN_ON().
>>

I have decided keep just max_t() to ensure no divide by zero happens.

Issue with putting sm_core_ctx.interval_ms check is that, one may edit
it while the work is queued, but not yet called. It would print wrongly
in that case.

Even if work function gets called prematurely, it should be fine since the
steal also increases accordingly. No issues in delta logic.

So capping to 1 to ensure no divide by 0 happens due to scaling of
delta_ns is good enough.

> 
> Ya, it is a never-happen condition. I will use WARN_ON.
> 
