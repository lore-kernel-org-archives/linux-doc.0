Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598FE56A;
	Wed,  1 Jul 2026 16:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924147; cv=none; b=pBLp8gwJ2tpyqsNTxn8tvWm5vOQhodGvKYS+DszFNcJRVoNNVb2migvaS4TpFNb002TMTRnCr9H9EyU89Vf6iR7mQsjQtCNC2+ZtsJu6AXp/m4lmUvNO7QA9aOPV82wD1sn2/ppX+XgWzHjTZt56NHIq8FHW7MBoDLkP8tTM9bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924147; c=relaxed/simple;
	bh=JV3/sxdtPP+vlzrUPxIFT8jz3RHyj3ceI3GzMi4VcQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WF7iJhrhfjXWmPygScFxzBEl72/XlMW39eNPHeaQwPRImCJa1bs0kucpUPcGITDZqRyiDLtsYcrMDYirwEkRoOkAo325X2vrtWmCWDlN1ODD5Vlm2gMUQJuxSOKCsVxeHjCjE7Z3W33bFsxt1DKbH8ihHiRsJdgf4vweJcOI9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iWVq1AI3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iWVq1AI3"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIPro746230;
	Wed, 1 Jul 2026 16:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vfd7fg
	pkFX21IgweqOwfIHJW9Pzg0/MLhWeZvynjXjs=; b=iWVq1AI3OkNlgS1jygrBVb
	cHqI5PoBF7AnMqMFC3+6CEyja9RYnMImJ97MozJvK11Z2l4xARQD1fN9xTfiigSq
	tuXgbG0MSEzjpWBBvWAbxqATaF5SR1/yBreYHAfHfE8/cwr+j8+uyqKLnMMue1p0
	RQncnAdeGl5yMfJjrntQXrYYDLYoaGnf/xJGVkvYDG8bwlu4vysRrtFYVZ3yTAQW
	rha6p1y5Ihmf7lAGU0jFbJIEPqpruPNYGowm0Yu8BbtzpsLMtyv/jbXCE6kBQft9
	YpJSeozCVo3mU968MJzsANYBuIQPfpONgDjgv8Ue2QBH8WPRnNyLDh8UrJZrYCrQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qg5j9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:42:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661GYcwf018702;
	Wed, 1 Jul 2026 16:42:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2s7w88kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 16:42:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661Gfx3A26804678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 16:41:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84BB620043;
	Wed,  1 Jul 2026 16:41:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F32DA20040;
	Wed,  1 Jul 2026 16:41:46 +0000 (GMT)
Received: from [9.67.14.28] (unknown [9.67.14.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 16:41:46 +0000 (GMT)
Message-ID: <065ab092-a3ca-40b8-b335-a6568b9722a6@linux.ibm.com>
Date: Wed, 1 Jul 2026 22:11:45 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/23] sched/fair: Load balance only among preferred
 CPUs
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
 <20260701141654.500125-7-sshegde@linux.ibm.com> <akU99bo6zRsyWmqY@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akU99bo6zRsyWmqY@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RYqgzVtv c=1 sm=1 tr=0 ts=6a45435d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=EKe7ZLQl2c3Sbcnk6XUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MyBTYWx0ZWRfXzyE/H0RdiWim
 0+YY1jKMsFIkQ5qCDrso1lSdLFIFz2dlS1bH4iihrvWEpf5RbmkyXN0Ev0e5ZyLy81ZECIMyevJ
 05guXPVL+gFYybIGT4P5hUE5v2qWHZM=
X-Proofpoint-GUID: aFRNraO90OH-ETita6ciPPczY2a3zFJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MyBTYWx0ZWRfXxoOXjpiycIyo
 0g3N2Cto7n0qeq7D7zp1LpukZbEiNBQzLPznnEX6R2FvSyn2Tzpf006W5gFqAKVzX74dDbyJPox
 NVsoYGS7Oa3J4flda/uhxC3aEOo9cmhpHgz6sfDZAWJpV94kZVUvjihNBTAvv+yO0oTfPiXSb8s
 Oa8LSGT9ibhith155FHjeKmQVOA7pT5mVJKCP52ETWBT9lv61TWhauP1VmP18y0dFYSwCsfHwra
 kbQWGdNASXOPJtXjKLB0l76Tm22jLAE4f01vm6gTD3sxNqfq2vWOuds5EVaUSTKiZvcZP6qfuOa
 nM22LzESc9/Qv5Ofxpmx0pCFcviBnRYh81skHwtTWj//8D5GPhsVgLVr8ANPOb/GpOkqLfq93lH
 SJWC6GbuoIIUWAtjZ+Nb+FPlEVeCetnhhViyzsDg+uXXUVAUbpfMUC5IByfeqa619wVDTqGRsgA
 cgkR6DkR0j2ikWz2/Sg==
X-Proofpoint-ORIG-GUID: UuxSCPqT855JJyaGmG22wXLz_llXJs4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010173



On 7/1/26 9:49 PM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:37PM +0530, Shrikanth Hegde wrote:
>> Consider only preferred CPUs for load balance.
>>
>> With this, load balance will end up choosing a preferred CPUs for pull.
>> This makes it not fight against the push task mechanism which happens
>> at tick. Also, this stops active balance to happen on non-preferred CPU
>> pulling the load.
>>
>> This means there is no load balancing if the task is pinned only to
>> non-preferred CPUs. They will continue to run where they were previously
>> running before the CPUs was marked as non-preferred.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   kernel/sched/fair.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index ce05acf52d35..9b2931b559d6 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -13391,7 +13391,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>>   	};
>>   	bool need_unlock = false;
>>   
>> -	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
>> +	/* Spread load among preferred CPUs */
> 
> We don't have a "Spread load among active CPUs" comment. Don't think
> it's more difficult to understand what happens if you replace one mask
> with another.
> 

Alright, I will drop it.

>> +	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
>>   
>>   	schedstat_inc(sd->lb_count[idle]);
>>   
>> -- 
>> 2.47.3

