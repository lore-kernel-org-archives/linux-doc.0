Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3338B125;
	Thu,  2 Jul 2026 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973853; cv=none; b=Wdk+Gsaks1XJPB86r6kjVkt+17J5YGd2ek1zfxbeKzH+xG7Djf6yjVnv1tqww5WftSoalemj2aJ/NrLf2cwpKskTv/NsFJ4HsJFu6EF2NXQmawylnk47xOXURJeY59B55862uB7hoGHlXlpCiIv3dFKtx0JLG/PIFTDB11gFeOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973853; c=relaxed/simple;
	bh=B0/+fSBxGI98DvEjJ2pMUXBTHsfXtn+dMpZFXShjS/g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=efvkS8bb+BqBLPWZS7JN6Z8seF3FktrsKh6NZQDb6ZGQJRFP8or/KKRSiMV4uCGL79CDYYCjR1/l55iShLAjvvWXyq61+DK8fSDtvcD8F4+4EtuOnCWERqPk5SiNcpeREtnE6eqjn2kR0GngzA2C99nJO6oM8xLxH7N11+LGmvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Mw4wuuQD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Mw4wuuQD"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KH0e2450310;
	Thu, 2 Jul 2026 06:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=c0p1o+
	YV3gzkpEbV+hE8zGD7tzGPMXUxHxFGRFPl48M=; b=Mw4wuuQDIrYMlPN94Jpzy5
	W+45IfKN5P0G6Zh8xggLPMWVGtuGhoS2tbhBcjNIqYilqLSb1XU7gWhgtroH7TD+
	fg3qk8rDenfVZcCmYBnzFU4MzVgPxK9MSkUkX2vnxUA90+OnB+gtbXvWydEWYFoe
	Gh/VNN6HEuKtg6j1g1YYAJ+s27mKyxMA+KFMyGTOJRj70CGybYdBR9R9z1hIGbe2
	agyILhhARKIM1QvyTkCbU+vzDYs+C/q7dTyS/WVWK8OUo2VjYtst/Bk4jTBK1Czk
	v3jEwTy4DNCETCYpdQaK3of152F5oNUDNn8xrkl+LYQ2nfOYUOVM3ZmZ7JnkyiSQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n60fsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 06:30:28 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6626JbXk002912;
	Thu, 2 Jul 2026 06:30:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2tbhjpsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 06:30:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6626UNp427787796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2026 06:30:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29B742004B;
	Thu,  2 Jul 2026 06:30:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 858F620043;
	Thu,  2 Jul 2026 06:30:16 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jul 2026 06:30:16 +0000 (GMT)
Message-ID: <57c47a62-d126-42c6-bc5c-16d471825f7b@linux.ibm.com>
Date: Thu, 2 Jul 2026 12:00:15 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/23] sched/core: Try to use a preferred CPU in
 is_cpu_allowed
From: Shrikanth Hegde <sshegde@linux.ibm.com>
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
 <20260701141654.500125-6-sshegde@linux.ibm.com> <akU7vr4cpAhPRFeL@yury>
 <0b50873f-90aa-4b1c-913c-475c80fa21c8@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <0b50873f-90aa-4b1c-913c-475c80fa21c8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MiBTYWx0ZWRfXxOXB6FtMvpF9
 RjVS1SHznlDinx1EeHH2z2cV+0R0nbxS7V2sPCxtN7O2poTh3vl8wuObG8AAg0cypQt9yCb5d5T
 JdOzjhJItxN/a5CRrU5cka0M5Hly5aW1LUeZoxh6iXb7YkQQtP+woTfRWUu5q7MrN7RlCd7Y4n7
 eMDnYSggCajFXj7LuP0baN76zHBlhSGxs6Yxds+ZxKIWvMO9Yk4bT7hb9P4TMbQCg6/Dmgyjqmc
 sdoQ93Hm54qAICk8ldwaNd68wq6Zf5OzMFivh45BEMhbqY6dPnXgAP+K/SRfb/QN4Cocm0zuwFx
 wlP3MWVH0QPd0omWN97SMTzfXz6FJvRArXX7Qy7S/0rBREhZgJ9deROR5y5L0Q7gJ8EolpH1VMG
 tAhRcFuRjLuHOy26zfVKIw2XuM91Hk+e/ztUHL5oEQAMN5vJmv4DbtnXLUzN2PR7PZSO5gX1LOE
 dnOaep7u93IL0sUEzPw==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a460585 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=FtfvYbkzr7evuiOE1dkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hJm0TOQ6QmF_6vUM_ynEpOc2bBUnAlji
X-Proofpoint-GUID: -jDARmeGDiAY0mT2EmXzwCzz7kGYJXMe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MiBTYWx0ZWRfX9LW7bZHeXd7R
 2eR/FIer8Vff//Mp6YukQ7ApqqzM53XjpwxoCCeWct9NuDmBkHgMS+OyQ4niePC3xSAp66ZZFwV
 4Ujsa1+FnzCa5jYL6YDTcvaUykZ+Q+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020062



On 7/1/26 10:19 PM, Shrikanth Hegde wrote:
> Hi Yury,
> 

[...]

>>
>> The is_cpu_allowed() is ~20 lines now, and your patch doubles that count.
>> Can you keep this type of thoughts in commit message? 90% of setups
>> will disable preferred CPUs, and I guess 99% of developers don't care.
>>
>> This is the code, not a scientific paper, after all.
>>
> 
> Ok. I will update the comments and share updated one soon
> as reply to this.
> 

Made it as below. This looks much cleaner and retains the same
functionality. Reduces cache window for kthread too. No double
cost due to earlier returns.

Does this look sane?


/*
  * Per-CPU kthreads are allowed to run on !active && online CPUs, see
  * __set_cpus_allowed_ptr() and select_fallback_rq().
  */
static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
{
	/* When not in the task's cpumask, no point in looking further. */
	if (!task_allowed_on_cpu(p, cpu))
		return false;

	/* migrate_disabled() must be allowed to finish. */
	if (is_migration_disabled(p))
		return cpu_online(cpu);

	/* Non kernel threads are not allowed during either online or offline. */
	if (!(p->flags & PF_KTHREAD)) {
		/* Try to use preferred CPU if task's affinity allows */
		if (task_can_sched_on_preferred(cpu, p))
			return false;
		return cpu_active(cpu);
	}

	/* KTHREAD_IS_PER_CPU is always allowed. */
	if (kthread_is_per_cpu(p))
		return cpu_online(cpu);

	/* Regular kernel threads don't get to stay during offline. */
	if (cpu_dying(cpu))
		return false;

	/* Try to keep unbound kthreads on a preferred CPU if possible. */
	if (task_can_sched_on_preferred(cpu, p))
		return false;

	/* Otherwise, they are allowed to run on online CPU. */
	return cpu_online(cpu);
}

and

static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
{
	if (cpu_preferred(cpu))
		return false;

	/* Only FAIR tasks honor preferred CPU state */
	if (unlikely(p->sched_class != &fair_sched_class))
		return false;

	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
}
