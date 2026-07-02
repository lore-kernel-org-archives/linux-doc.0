Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00B138E5E9;
	Thu,  2 Jul 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976732; cv=none; b=PslihNuoQsCh+2/Qh/dF9DnigbKa3DNA1nCBtFvsedZCuhpCtNYDM4QzxLi081JIQZAWnLP+UddJ0oOyURur4BaxPaBDOPauAzJxKB/80DvWOoiFTXMli5RW/9Qxmc1YJlXq+iASYtEM/2VcrYX1w1/etJ7buAna8teRhrS2MZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976732; c=relaxed/simple;
	bh=PFTx8LyaxkX7fXYog6cubDGasgmofzlc3E/8maQkuc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9ys+w2dxURfawBcsgkQFX/XCsc00ceamJfySQ5Uuv5TkBRbiTwt4GvhyVa07v79+Ky3xdr+f+j+Xfmp16I+D26nWwwwGNP1D3y71D6bpOR8fSlCKnQ1H/xVvivAU2cNail8+MQH5J5hHmJxsBVebIfGvDJyiPXYXADqRq+zYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SfIKXyD2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SfIKXyD2"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Ki3l2390580;
	Thu, 2 Jul 2026 07:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hjWUO4
	UiuJF31otVfTgeDSVKBeqhovYiu1tP2q8OgdQ=; b=SfIKXyD2uGm/F2jPbIzHPX
	om4Xm8rZwVlgBqL5TPB+ll4K/Jrj397wRbt3+t6p1T/t/oSaPBNAZqrlY+q3LwXF
	5ILTvHfpfunYk6Sz/EvuoNTZbsCoptqH3VLf3i0qOp4WqFsU7WgN4WwcIQt89UY5
	rUkZffxQ9eefXJKTmbC+XC0NVLAJvuJLS0s0JBT+8tMdGTOjcKccy0UYH0QECKNU
	LNfBvQhjssjb370Z+NFf5Fvwo06DIhgZq97hN1IOGbfcgGZCAy6jl8CopaqJQ+2c
	X7ooQAYfR7XdQiDIdK7LnUnxhpdKyPI6JLFTCCUnHIEBzpWPHNdwOzeteaMSt5sQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qa89hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:18:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66274f6F012140;
	Thu, 2 Jul 2026 07:18:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2s7wb0ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:18:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6627IPBa49807708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2026 07:18:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4CBE20043;
	Thu,  2 Jul 2026 07:18:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F058D20040;
	Thu,  2 Jul 2026 07:18:18 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jul 2026 07:18:18 +0000 (GMT)
Message-ID: <6941a96a-dcdd-4c22-aca0-b28fb2a5566b@linux.ibm.com>
Date: Thu, 2 Jul 2026 12:48:17 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/23] virt/steal_monitor: Act on steal values at
 regular intervals
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-21-sshegde@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260701141654.500125-21-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3MyBTYWx0ZWRfXxFRzhvSBNz2q
 IzRx76gHGjfYn3DnJsiNdIgk/eSIBAB0jrcOxTvAqfjPs+0MWdfmiWzK3Xz7C/AkIEd1oIe5bAL
 g4XWnTTU/3zLqi7frFCGHCX0T0mx5am9ardrC32mvQ1iWnaTCPxfYW2Ri9c7GJw+y1FsPntAKp2
 GHxCbSsK3rrQXQhccnrBuT7kKjz733OkPstMzjomN3m0b38t1aKW31WIdjIEvn2UEZQ6d8maYFs
 0DJbmRhOhvi1u7V0DlTN/IPWSvVxE62BO4N4bGORTOYGfBaOMyJuQU5oUwdajyA17i21tmwAmsU
 pUxEBr5WK7RpZxKhebPORu+qN+C7Yw3BOr7tpl7fTwGHtPQIQLmrxJqWbTWcwpE5R0UxWJiZXbd
 4XHI698OWWt3CthgPFJojhyWOPxoowVVyXq8wN8Xs6rCgDiw7Uh6G2f+rneu9Nv+Vlk0NxaOOst
 5+gerNqe9Vn1jxYAHBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3MyBTYWx0ZWRfX80rRRvnBFUxe
 VRbqKMSj4F27kLYX9DMDPxv5+HzjPBaWC57XlQmWiAFWFl4QypSLYrYGQKD0v2MDjln7pBB2cgO
 +jndXK+a2qgzlpchnzq6KvdKXrPexUU=
X-Proofpoint-GUID: 8Q0_7dI0mfRubtDJsCOSaDr78ltKGykc
X-Proofpoint-ORIG-GUID: HbHm5Jhz3aTiQGpnOfXNi-reRESDuRfp
X-Authority-Analysis: v=2.4 cv=WZ88rUhX c=1 sm=1 tr=0 ts=6a4610c7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=VLaiDeBkvOoqmT7bmHAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020073



On 7/1/26 7:46 PM, Shrikanth Hegde wrote:
> This is the steal_monitor core functionality done in periodic work
> 
> - Calculate the steal_ratio. It is multiplied by 100 to consider the
>    fractional values of steal time. I.e 10 means 0.1% steal time.
> - If steal value is higher than high threshold, call the method to reduce
>    the preferred CPUs.
> - If steal value is lower or equal to low threshold, call the method to
>    increase the preferred CPUs.
> - If the steal value is in between, no action is taken.
> - Save the values for next delta calculations.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v5->v6:
> - Address u64 overflow concerns.
> 
>   drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index b499faa61010..7b7435f79b85 100644
> --- a/drivers/virt/steal_monitor/sm_core.c
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
>   
>   static void compute_preferred_cpus_work(struct work_struct *work)
>   {
> +	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
> +	ktime_t now;
> +
> +	curr_steal = get_system_steal_time();
> +	now = ktime_get();
> +
> +	/* get the deltas */
> +	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
> +		      curr_steal - sm_core_ctx.prev_steal : 0;
> +	delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time)), 1);
> +
> +	/* Update for next calculation */
> +	sm_core_ctx.prev_steal = curr_steal;
> +	sm_core_ctx.prev_time = now;
> +
> +	/*
> +	 * Multiply by 100 to consider the fractional values of steal time.
> +	 * steal_ratio = (delta_steal * 100 * 100)/(delta_ns * num_cpus())
> +	 */
> +	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);
> +	if (unlikely(!delta_ns))
> +		return;

There is an issue here. It needs to requeue the work.

> +
> +	steal_ratio = div64_u64(delta_steal, delta_ns);
> +	/* If the steal time values are high, reduce preferred CPUs */
> +	if (steal_ratio > sm_core_ctx.high_threshold)
> +		decrease_preferred_cpus(&sm_core_ctx);
> +	/* If the steal time values are low, increase preferred CPUs */
> +	if (steal_ratio <= sm_core_ctx.low_threshold)
> +		increase_preferred_cpus(&sm_core_ctx);
> +
>   	/* At least one core is kept as preferred */
>   	WARN_ON(cpumask_empty(cpu_preferred_mask));

Also, will move these to WARN_ON_ONCE to avoid console dump at regular intervals.

>   
> @@ -54,6 +85,8 @@ static int __init steal_monitor_init(void)
>   		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
>   
>   	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
> +	sm_core_ctx.prev_steal = get_system_steal_time();
> +	sm_core_ctx.prev_time = ktime_get();
>   
>   	schedule_delayed_work(&sm_core_ctx.work,
>   			      msecs_to_jiffies(sm_core_ctx.interval_ms));

