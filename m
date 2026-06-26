Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3453F6C28;
	Fri, 26 Jun 2026 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479880; cv=none; b=nvU2nReV7Emy4oGR5sroU2ABeDPNe1OtMpk2HAHiR+ooTitBk2++JkFzriEGyWEFI6wrbRmcG0ARA1EsmG+YGGl4gonigEg52gOoVFVegfG3u7YL8FX71vaRsTqKXQj1p3L7jO4UmvqR6JcQFT+AgFWlZDLZHm2rbfim3qJxEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479880; c=relaxed/simple;
	bh=FpzWTnb6M53fIppfnDNdzxAcEnW+gfYVuxf/+tCnV6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxbeLF/jFZH9rAut/6ciJumEdWyNaj8DN2UyDIMgZY+iEdauZXd/ewutrY8n6pa9aEIBMqHUHQGQYTPBymTL1HmVBd17BfbOeHLBiTO6gAD54d7xy09GcNCcnF+LHp+nTFd1IZeAOz9CilRlEmjyf0cSoYV8JSsUHqddCP1YD7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=thoZU9WX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="thoZU9WX"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAIPAd2761118;
	Fri, 26 Jun 2026 13:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eJwNVO
	+OMh+7LJf915ey4BqcV5x3h+TX5WIZidUbQWk=; b=thoZU9WXKMyOhQ5uk3ak7B
	nRfHXHOSJd7X2A6nylZHLuk5710OhkfVnpzAULkon3T9Yd1IsDDCKY+fFpyRMbZf
	TfLrSjQwrYdno960kpc6f7dpNCcGhakiEI+uHm++roxZ3JQo2ek4cOzmJcPIEpsz
	+36o3B65EZdRc8H9Wpyj3lTuxq7G0egfGWfoZeZ0qc1KMyXh/fCGVGBBgUDU3l+X
	ULv4W4Kabo6K5uktfWpefKEzcZPgUchp2YvuJjsQ/xmSU0tSvyxx31TAyTWwzbv8
	YCDAPgAhtHpuYNqEePxT6WHkuq/RwEnvdhrM9j6DKaRLt2X+V0MjzGQxVZKWoykA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3y95a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:17:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QD4ihK012184;
	Fri, 26 Jun 2026 13:17:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66kk8ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:17:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QDHW3R35455448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:17:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDF7920043;
	Fri, 26 Jun 2026 13:17:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D4D120040;
	Fri, 26 Jun 2026 13:17:24 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:17:24 +0000 (GMT)
Message-ID: <6c567674-231a-4d21-b9e8-e9c4b23cfadc@linux.ibm.com>
Date: Fri, 26 Jun 2026 18:47:23 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/24] sched/fair: Select preferred CPU at wakeup when
 possible
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
 <20260625124648.802832-8-sshegde@linux.ibm.com>
 <20260626095948.GO1181229@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260626095948.GO1181229@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3e7bf2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=UWYZ6Kb2ZmTN1TUfP5sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfX+N6T0A4C4d2l
 0ZhdK8IeUMKUOb+5yLncOSzrTQ/CYR7D6bzd9aHlPb8mxon4Seb8ed82TYSk/7w2ss4zTFNl6Xd
 Cco/D/FAFSVfJvyKDwvuv3tWU5NFhCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfXxKbU5diXehQ4
 4OfC40uv9UL6mt8o5of0zaOLGMmk7Z+i0GZCic5uQ4VZ9IEVQYrp8nmlWOn1llGBcn4MLBAYl0a
 I2Vs6L8z2t/oqibxj+Zi6J2cjb0pkCK160mQMKAmYsc5NWkPyiAWsplsWW2hFuZmqRgm0gg36Qb
 JRFF53il7WUd+0GfQXjJqi8cvLrJXdCLB1x0PvJbpLmr5/VnwihvOe5IUQx9Vo6PlOIZM5KtUeE
 hKCf6meFD7Sg/IXYlqCs6lCOqxJ5WrwbYEHVi/8JQuqeG0DvJe9OxfBPFg2C0FkUl7qBgBxS6CB
 qFWOkWvG/wtVEiFijYh2LU1wG2jXO9wSC2DNmfSaiWLFULE35Md8b1jcL1AbO68FC9fJVh60JuB
 xC2qeeSrPdGU3vlEtO+GaZJPb2dm4yCUffD8uCRPP5/rKp7vZYzg9pscI3YVU+eFq39S8UiYGEH
 3aciaNvTlH0XAdoe3LQ==
X-Proofpoint-ORIG-GUID: -APv6aMC4ZRF0Ipsr8gugyQEWrIUdsBe
X-Proofpoint-GUID: 15ngkTwNt-c-U_o-oR0ka27BYY-lU4BQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260105

Hi Peter, Thank you very much for going through the patches.

On 6/26/26 3:29 PM, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:31PM +0530, Shrikanth Hegde wrote:
>> Update available_idle_cpu to consider preferred CPUs. This takes care of
>> lot of decisions at wakeup to use only preferred CPUs. There is no need to
>> put those explicit checks everywhere.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   kernel/sched/sched.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 5d009c2529b2..148fe6145f1a 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -1434,6 +1434,9 @@ static inline bool available_idle_cpu(int cpu)
>>   	if (!idle_rq(cpu_rq(cpu)))
>>   		return 0;
>>   
>> +	if (!cpu_preferred(cpu))
>> +		return 0;
>> +
>>   	if (vcpu_is_preempted(cpu))
>>   		return 0;
>>   
> 
> This one might hurt, it is a whole extra cacheline in otherwise already
> sensitive (wakeup) paths.
> 

Yes, this could be costly. If wakeup returns a non-preferred CPU,
is_cpu_allowed would catch it.
So, i think we can avoid repeated computation of it in available_idle_cpu.

Let me see if removing it still achieves the functionality of moving out
fast enough and numbers are close enough to with it.
