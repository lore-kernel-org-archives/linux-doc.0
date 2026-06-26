Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A09A2F12AC;
	Fri, 26 Jun 2026 18:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782499895; cv=none; b=jidBMYCBDMHR7HJBYvdnpyzJXp+UbvEDHySVVH23ct/6LCPjyJ7zhA04lyUr0EuSyXT7N4CWIdVYsqylZS2JUzJ/kLpLo4EzMcliq3v9CWYTt/GRXthhCu3IfyVesA/ZVgsDjibbdjyfrSc4Ztr/f8BRl4+vsd7b1VNFug1xNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782499895; c=relaxed/simple;
	bh=1JH8tPNEAU7IxC5Hxh9/q4CnMaiGZO7B6Cw15tl6MhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8docvDn2BOC30lArkJ8ZnfHxslh80QnAYkMKmuU3/Hc6EkXx3JKnfsnZHyB0QvW7GRNoXnP225xMtd9v7Il/TAvZ/68lF8DoVsuvYCagqrX7vacG3CeoW7wWtI10D6H7Nyv1Lepn9NoNNIUVQete6ktsIm4w1PJ+dh7ub7V110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sTaD+35B; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sTaD+35B"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFnEEd3463677;
	Fri, 26 Jun 2026 18:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DXLBrz
	sfyc29MJqvEYtY1S++bNnCbLS+Q47Ex6uIPNk=; b=sTaD+35BOlsBt4ncbAu2fO
	8nadEMgoXaSCnqSmBsihQnxqL/2ExenaM0hIyYL79sXdcFvROaJH2e8ALDv1HzUD
	JVgdlkPXiOGVlBjW3byRUMvG/3G7MqhNJASFdx5yYY7bjwml9OLO4Y3DK1187iT1
	ghV4G7DArrubLvDOOY40tTg7VQCif/XC+JpBFdlROvW7U6CpRjQSpF2tIIeW94xa
	rRTLwJGvVGIHMcNykRsRQaOc0VkEc0PDaOx2L097gegjp0f35H4TAJ1wn54W5jsg
	qUJZ6heSZ5VFZh60rBgmQ5076bHDRPftiFFBs8LIo7LKzkf/2orVRQgVK943nitg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc40qad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 18:51:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QInb33002146;
	Fri, 26 Jun 2026 18:51:15 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7w044sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 18:51:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QIpBKS30278362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 18:51:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E12C20043;
	Fri, 26 Jun 2026 18:51:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB23920040;
	Fri, 26 Jun 2026 18:51:03 +0000 (GMT)
Received: from [9.124.221.28] (unknown [9.124.221.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 18:51:03 +0000 (GMT)
Message-ID: <1589fdae-b0c0-47af-9265-d6e9fbaabe9c@linux.ibm.com>
Date: Sat, 27 Jun 2026 00:21:02 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, yury.norov@gmail.com,
        kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
        tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3eca24 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=wMXR4BnjPhtjdvJanzAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE1NSBTYWx0ZWRfX3wh7pZMnvwVF
 Vb6tQNhKL37B1Pb9YOOOPtWJbQ/lW57c2+jQLuj5hY9keBXH3UAFzIMrqOsYygDvGABdEBGruBN
 Oeyf/OnJ12ADKeAV0NVuqWUJBEMGXnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE1NSBTYWx0ZWRfX9qkIMJf2b5By
 8Mmc7oz+h2rSJtCpUCMN0khMUOXivwiTe+nExMjM8rOA+iv4+6vO9/vFvhqd+D+77KFuQvh8dcA
 AmAvxNKWfT6UlLvuA7cvh/8cy9nPByXIw8jdwTQiOohAMALp4mZ0yVoNUgCuk/ff0NhcuKDJYMe
 /eM4/InSHT6e3EeGSQpO6j3pMRKmXbJ+yhnR7B+j4bOp1GWxumRPhSZfIIczYmHn9WjLxIVcmTp
 7S97IWdmw2B+Lml7DKF5kjF+G69lPsCOb4PiNWo+I2TUae0I9ahQ5y0XxpPRbyiDI3maAmY7/Gy
 EcfUj4NnQIcAsjsL3CO2eUQpEkyFDg6IH1J0CKBAwyv7ISgZy99EULz40RRWiK0EqyldsCW7HQa
 C7SwXWWms1YDRnCMU3L6m0hPewF7QSiMoJLXCTUXmleSer733omMbr18Kmlgo3YmEbWgI7qf1sk
 UvH/Nwh/iPgCZVOgbrA==
X-Proofpoint-ORIG-GUID: 6oxA68C83htt4NpFJAg9MFJv-GlNNFJH
X-Proofpoint-GUID: v7WvnKTMUXZh7pTHaLJUZxduv8dF40yU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260155

Hi Peter,

On 6/26/26 3:09 PM, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
> 
>> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
>> index 80211900f373..5a643d608ea6 100644
>> --- a/include/linux/cpumask.h
>> +++ b/include/linux/cpumask.h
>> @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
>>   extern struct cpumask __cpu_present_mask;
>>   extern struct cpumask __cpu_active_mask;
>>   extern struct cpumask __cpu_dying_mask;
>> +
>> +#ifdef CONFIG_PREFERRED_CPU
>> +extern struct cpumask __cpu_preferred_mask;
>> +#else
>> +#define __cpu_preferred_mask __cpu_active_mask
>> +#endif
> 
> This is cure, but does it not result in set_cpu_preferred() changing
> active mask, and it that not somewhat unexpected behaviour?
> 
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
> 
>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>> index bc4f7a9ba64e..d623a9c5554a 100644
>> --- a/kernel/cpu.c
>> +++ b/kernel/cpu.c
>> @@ -3107,6 +3107,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
>>   atomic_t __num_online_cpus __read_mostly;
>>   EXPORT_SYMBOL(__num_online_cpus);
>>   
>> +#ifdef CONFIG_PREFERRED_CPU
>> +struct cpumask __cpu_preferred_mask __read_mostly;
>> +EXPORT_SYMBOL(__cpu_preferred_mask);
>> +#endif
> 
> Precedent is definitely towards !GPL exports for this, but could we get
> away with making this one GPL?
> 

I think it is better to put EXPORT_SYMBOL_GPL.
So that any module tries to alter it must be a GPL one.
Would be less headache for us i guess.

> 
>> @@ -3164,6 +3169,7 @@ void __init boot_cpu_init(void)
>>   	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
>>   	set_cpu_online(cpu, true);
>>   	set_cpu_active(cpu, true);
>> +	set_cpu_preferred(cpu, true);
> 
> This sets active twice, which is harmless, but wasteful...
> 
>>   	set_cpu_present(cpu, true);
>>   	set_cpu_possible(cpu, true);
>>   
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 2f4530eb543f..9e16946c9d62 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -8685,6 +8685,9 @@ int sched_cpu_activate(unsigned int cpu)
>>   	 */
>>   	sched_set_rq_online(rq, cpu);
>>   
>> +	/* preferred is subset of active and follows its state */
>> +	set_cpu_preferred(cpu, true);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -8698,6 +8701,8 @@ int sched_cpu_deactivate(unsigned int cpu)
>>   	if (ret)
>>   		return ret;
>>   
>> +	set_cpu_preferred(cpu, false);
>> +
>>   	/*
>>   	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
>>   	 * load balancing when not active
> 
> But this one clears active earlier, is that not a problem?
> 
> Perhaps it is best if the modifier is a no-op when preferred mask does
> not exist?

Will make it as yury suggested in other thread with ifdefs.
