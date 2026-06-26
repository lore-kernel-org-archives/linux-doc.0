Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE493AD510;
	Fri, 26 Jun 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479941; cv=none; b=jMDRKHkcS/4fH1x/lnohYFxW7JlOJa2EUC0dEwwJ44XaBjQphyAzcRZ2f9xDXBfIwVYFmD2NnzNAW6voqJS8yiEKRM4O6R+KSrvk+BzGGfXgCeujtcDusvkFch67u+YU7+pZ9brP1FdTCtRToFb0Vok34M+WAIRFsa1Q0aOk5ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479941; c=relaxed/simple;
	bh=jGFQuiCfDUthfNWjPX1YbbDokCETKthKiHk+GqVV7AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyxZXXlTcdU1nozrgeH3t4imOjFYo5T9gAsdjEuQ6ZF795e7ucnemSC58Ajo33Z+v0fzcTD7KkcFNzh4HXMJEU2Ks4oiRy29gd4rygSTjsMP00QAQsx+huYQdv5FV/FTj1xblmy17qHsdXyLz3byJnQ/HWDq+eUic2A1m8HQqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Cl8xW/pe; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Cl8xW/pe"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAITvY2920215;
	Fri, 26 Jun 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GvcQ7o
	sgvxbe1lcajyMgTm5ZRMGNqJpSf+DCBXY/ils=; b=Cl8xW/peJQBvhZz5hvQOSA
	j8vygvnsrRx4bAamsB0ywHTQYwlxcpLTx7ytUibzfL3nEBQxRN4fUXir9d6Ahs8N
	6MlwbFIhixgaBMkFbZwzWEIJGvt+1U15vPsr79HIRks9OKTJ1ZyM81stS3OXD7PL
	rkqrz1Y6txOXtXbDeKVJK2N3F2sx5wISuxQyTnsipc0LboJ9OtCATaN67lWXARD+
	T+lsSM/kZiwijsKbcNclYwc3x1pC1rSsauoirgI5zeI/jh+WqlwzjMt7Zg8yiFrY
	Nn5S2b6YtFqh+LxvwIoc+3Hw3tQFTvFYqZL7VrbFVKrBDwnVo4I8Gxq9tyra3Kbg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjhr72h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:18:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QD4ht7010029;
	Fri, 26 Jun 2026 13:18:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex6phu64a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:18:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QDIWRY51839394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:18:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A573C20043;
	Fri, 26 Jun 2026 13:18:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B13E720040;
	Fri, 26 Jun 2026 13:18:25 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:18:25 +0000 (GMT)
Message-ID: <47d323b1-8376-4ee0-b8cc-e13944f9dacf@linux.ibm.com>
Date: Fri, 26 Jun 2026 18:48:24 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
To: Yury Norov <yury.norov@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
 <aj5zRBrQJG-cxs0_@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aj5zRBrQJG-cxs0_@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I4VVgtgg c=1 sm=1 tr=0 ts=6a3e7c2e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=jeCAWEdCRBU5YeOHBNEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX/uvmMHiVvH+k
 fdTTVA+GF1rS6Vz8xj6wEXtw8exx1NfwZeGt0dNBv1wWhOR+SooTiy9KwyKQbcePKWK5PpF1hOJ
 PXfCr56/B7nMNAZ/fhehIec++WYf87HdvyLLSAtK7v9Tlta0/uy+s7q+MzCjzD0VFHHVrXThzmH
 H6+3poUYTihZt86w3U5eva+yEQYbdNijYoqUkv0woR6VARW0Snao++obKyKtxpsdgBdIeP0uYEZ
 6oR22sP9Y7u+9wHNvvmkXYkoYAnFxTLgvuWMPscwsTfUCajrVVhRlzs6D3WuVODWZmNqGiVCyEJ
 qgUgpdPsjbrGMB0KEX4imjtMnVFY/iwPGceIloPQSZm8WYnnr6MF8/W/AyMb550BJU5uZI/Knv/
 vcPlr3eaKYzpRt9deMtO3RSA+O6CGfAbNipmV1Y0vBVroslJKI9vwtcK+j7QUtZ5RJ9dSMl/LJi
 lrwauzTrZW2sjiMw1sA==
X-Proofpoint-GUID: 2LlL1xrBY1BS_HCyzd4BvRxxpiMifmFk
X-Proofpoint-ORIG-GUID: 8QHIKq_Dn4kMwNX0T_tlnglapDXExOtv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX+krkl1GclEiB
 mcaviy8k1a/VsshIORQfrRB1B73hqx/l5wRJtUgElHxZu2Uf0z7+oDZ/tgrwDobOMuBnF2jaDuQ
 8yRRsr7DU/J8tgLHaX+pqOms7Sv8Ia8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260109



On 6/26/26 6:10 PM, Yury Norov wrote:
> On Fri, Jun 26, 2026 at 11:39:01AM +0200, Peter Zijlstra wrote:
>> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
>>
>>> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
>>> index 80211900f373..5a643d608ea6 100644
>>> --- a/include/linux/cpumask.h
>>> +++ b/include/linux/cpumask.h
>>> @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
>>>   extern struct cpumask __cpu_present_mask;
>>>   extern struct cpumask __cpu_active_mask;
>>>   extern struct cpumask __cpu_dying_mask;
>>> +
>>> +#ifdef CONFIG_PREFERRED_CPU
>>> +extern struct cpumask __cpu_preferred_mask;
>>> +#else
>>> +#define __cpu_preferred_mask __cpu_active_mask
>>> +#endif
>>
>> This is cure, but does it not result in set_cpu_preferred() changing
>> active mask, and it that not somewhat unexpected behaviour?
> 
> I agree, and I think I already commented on it on previous round.
> set_cpu_preferred() should be protected the same way as the
> corresponding mask, and should be a NOP when CONFIG_PREFERRED_CPU
> is disabled.
> 
>>>   #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>>>   #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
>>>   #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>>>   #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>>>   #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>>>   #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
>>> +#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
>>>   
>>>   extern atomic_t __num_online_cpus;
>>>   extern unsigned int __num_possible_cpus;
>>
>>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>>> index bc4f7a9ba64e..d623a9c5554a 100644
>>> --- a/kernel/cpu.c
>>> +++ b/kernel/cpu.c
>>> @@ -3107,6 +3107,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
>>>   atomic_t __num_online_cpus __read_mostly;
>>>   EXPORT_SYMBOL(__num_online_cpus);
>>>   
>>> +#ifdef CONFIG_PREFERRED_CPU
>>> +struct cpumask __cpu_preferred_mask __read_mostly;
>>> +EXPORT_SYMBOL(__cpu_preferred_mask);
>>> +#endif
>>
>> Precedent is definitely towards !GPL exports for this, but could we get
>> away with making this one GPL?
>>
>>
>>> @@ -3164,6 +3169,7 @@ void __init boot_cpu_init(void)
>>>   	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
>>>   	set_cpu_online(cpu, true);
>>>   	set_cpu_active(cpu, true);
>>> +	set_cpu_preferred(cpu, true);
>>
>> This sets active twice, which is harmless, but wasteful...
> 
> I think, the good criteria for correctness of this series would be the
> identical binaries before the series, and when CONFIG_PREFERRED_CPU is
> off. At least, as a mental model. This double-set chunk breaks that
> model.
> 

Sorry, i didn't get how comparison could be,
You mean bloat-o-meter or kernel/cpu.o size or vmlinux size file?

That would mean everything should be under ifdef CONFIG_PREFERRED_CPU.
No? That was the case in few versions earlier, and it was not looking 
good since due to many ifdefs.

If we fix set_cpu_preferred to be a NOP when CONFIG_PREFERRED_CPU=n and 
driver depends on it, i think we should be good.

What do you think?

